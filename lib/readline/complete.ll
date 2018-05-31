; ModuleID = 'complete.c'
source_filename = "complete.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }
%struct.__dirstream = type opaque
%struct.bin_str = type { i32, i8* }
%struct.__mbstate_t = type { i32, i32 }
%struct.dirent = type { i32, i32, i32, i32, i16, i8, [256 x i8] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@rl_completion_display_matches_hook = global void (i8**, i32, i32)* null, align 4
@_rl_complete_show_all = global i32 0, align 4
@_rl_complete_show_unmodified = global i32 0, align 4
@_rl_complete_mark_directories = global i32 1, align 4
@_rl_complete_mark_symlink_dirs = global i32 0, align 4
@_rl_completion_case_fold = global i32 0, align 4
@_rl_completion_case_map = global i32 0, align 4
@_rl_match_hidden_files = global i32 1, align 4
@_rl_completion_prefix_display_length = global i32 0, align 4
@_rl_completion_columns = global i32 -1, align 4
@rl_visible_stats = global i32 0, align 4
@_rl_colored_stats = global i32 0, align 4
@_rl_colored_completion_prefix = global i32 0, align 4
@_rl_skip_completed_text = global i32 0, align 4
@_rl_menu_complete_prefix_first = global i32 0, align 4
@rl_directory_completion_hook = global i32 (i8**)* null, align 4
@rl_directory_rewrite_hook = global i32 (i8**)* null, align 4
@rl_filename_stat_hook = global i32 (i8**)* null, align 4
@rl_filename_rewrite_hook = global i8* (i8*, i32)* null, align 4
@rl_complete_with_tilde_expansion = global i32 0, align 4
@rl_completion_entry_function = global i8* (i8*, i32)* null, align 4
@rl_menu_completion_entry_function = global i8* (i8*, i32)* null, align 4
@rl_attempted_completion_function = global i8** (i8*, i32, i32)* null, align 4
@rl_attempted_completion_over = global i32 0, align 4
@rl_completion_type = global i32 0, align 4
@rl_completion_query_items = global i32 100, align 4
@_rl_page_completions = global i32 1, align 4
@.str = private unnamed_addr constant [18 x i8] c" \09\0A\22\5C'`@$><=;|&{(\00", align 1
@rl_basic_word_break_characters = global i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), align 4
@.str.1 = private unnamed_addr constant [3 x i8] c"\22'\00", align 1
@rl_basic_quote_characters = global i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), align 4
@rl_completer_word_break_characters = global i8* null, align 4
@rl_completion_word_break_hook = global i8* ()* null, align 4
@rl_completer_quote_characters = global i8* null, align 4
@rl_filename_quote_characters = global i8* null, align 4
@rl_special_prefixes = global i8* null, align 4
@rl_ignore_completion_duplicates = global i32 1, align 4
@rl_filename_completion_desired = global i32 0, align 4
@rl_filename_quoting_desired = global i32 1, align 4
@rl_ignore_some_completions_function = global i32 (i8**)* null, align 4
@rl_filename_quoting_function = global i8* (i8*, i32, i8*)* @rl_quote_filename, align 4
@rl_filename_dequoting_function = global i8* (i8*, i32)* null, align 4
@rl_char_is_quoted_p = global i32 (i8*, i32)* null, align 4
@rl_completion_suppress_append = global i32 0, align 4
@rl_completion_append_character = global i32 32, align 4
@rl_completion_suppress_quote = global i32 0, align 4
@rl_sort_completion_matches = global i32 1, align 4
@rl_completion_invoking_key = common global i32 0, align 4
@rl_inhibit_completion = common global i32 0, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@completion_changed_buffer = internal global i32 0, align 4
@rl_completion_found_quote = common global i32 0, align 4
@rl_completion_quote_character = common global i32 0, align 4
@rl_point = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@rl_byte_oriented = external global i32, align 4
@_rl_screenwidth = external global i32, align 4
@_rl_print_completions_horizontally = common global i32 0, align 4
@rl_outstream = external global %struct._IO_FILE*, align 4
@_rl_caught_signal = external global i32, align 4
@_rl_screenheight = external global i32, align 4
@rl_readline_state = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@_rl_sigcleanup = external global void (i32, i8*)*, align 4
@_rl_sigcleanarg = external global i8*, align 4
@_rl_complete_display_matches_interrupt = internal global i32 0, align 4
@rl_signal_event_hook = external global i32 ()*, align 4
@.str.2 = private unnamed_addr constant [43 x i8] c"bad value %d for what_to_do in rl_complete\00", align 1
@rl_username_completion_function.username = internal global i8* null, align 4
@rl_username_completion_function.entry = internal global %struct.passwd* null, align 4
@rl_username_completion_function.namelen = internal global i32 0, align 4
@rl_username_completion_function.first_char = internal global i32 0, align 4
@rl_username_completion_function.first_char_loc = internal global i32 0, align 4
@rl_filename_completion_function.directory = internal global %struct.__dirstream* null, align 4
@rl_filename_completion_function.filename = internal global i8* null, align 4
@rl_filename_completion_function.dirname = internal global i8* null, align 4
@rl_filename_completion_function.users_dirname = internal global i8* null, align 4
@rl_filename_completion_function.filename_len = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [2 x i8] c".\00", align 1
@rl_old_menu_complete.orig_text = internal global i8* null, align 4
@rl_old_menu_complete.matches = internal global i8** null, align 4
@rl_old_menu_complete.match_list_index = internal global i32 0, align 4
@rl_old_menu_complete.match_list_size = internal global i32 0, align 4
@rl_old_menu_complete.orig_start = internal global i32 0, align 4
@rl_old_menu_complete.orig_end = internal global i32 0, align 4
@rl_old_menu_complete.quote_char = internal global i8 0, align 1
@rl_old_menu_complete.delimiter = internal global i32 0, align 4
@rl_menu_complete.orig_text = internal global i8* null, align 4
@rl_menu_complete.matches = internal global i8** null, align 4
@rl_menu_complete.match_list_index = internal global i32 0, align 4
@rl_menu_complete.match_list_size = internal global i32 0, align 4
@rl_menu_complete.nontrivial_lcd = internal global i32 0, align 4
@rl_menu_complete.full_completion = internal global i32 0, align 4
@rl_menu_complete.orig_start = internal global i32 0, align 4
@rl_menu_complete.orig_end = internal global i32 0, align 4
@rl_menu_complete.quote_char = internal global i8 0, align 1
@rl_menu_complete.delimiter = internal global i32 0, align 4
@rl_menu_complete.cstate = internal global i32 0, align 4
@rl_completion_mark_symlink_dirs = common global i32 0, align 4
@.str.4 = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"/\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"//\00", align 1
@_rl_color_indicator = external global [0 x %struct.bin_str], align 4
@.str.7 = private unnamed_addr constant [9 x i8] c"--More--\00", align 1
@rl_end = external global i32, align 4
@_rl_vis_botlin = external global i32, align 4
@rl_display_fixed = external global i32, align 4
@.str.8 = private unnamed_addr constant [39 x i8] c"Display all %d possibilities? (y or n)\00", align 1
@completion_y_or_n = internal global i32 0, align 4
@.str.9 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: noinline nounwind
define internal i8* @rl_quote_filename(i8* %s, i32 %rtype, i8* %qcp) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %rtype.addr = alloca i32, align 4
  %qcp.addr = alloca i8*, align 4
  %r = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %rtype, i32* %rtype.addr, align 4
  store i8* %qcp, i8** %qcp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 2
  %call1 = call i8* @xmalloc(i32 %add)
  store i8* %call1, i8** %r, align 4
  %1 = load i8*, i8** @rl_completer_quote_characters, align 4
  %2 = load i8, i8* %1, align 1
  %3 = load i8*, i8** %r, align 4
  store i8 %2, i8* %3, align 1
  %4 = load i8*, i8** %r, align 4
  %add.ptr = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8*, i8** %s.addr, align 4
  %call2 = call i8* @strcpy(i8* %add.ptr, i8* %5)
  %6 = load i8*, i8** %qcp.addr, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** @rl_completer_quote_characters, align 4
  %8 = load i8, i8* %7, align 1
  %9 = load i8*, i8** %qcp.addr, align 4
  store i8 %8, i8* %9, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load i8*, i8** %r, align 4
  ret i8* %10
}

; Function Attrs: noinline nounwind
define i32 @rl_complete(i32 %ignore, i32 %invoking_key) #0 {
entry:
  %retval = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32, i32* %invoking_key.addr, align 4
  store i32 %0, i32* @rl_completion_invoking_key, align 4
  %1 = load i32, i32* @rl_inhibit_completion, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %ignore.addr, align 4
  %3 = load i32, i32* %invoking_key.addr, align 4
  %call = call i32 @_rl_insert_char(i32 %2, i32 %3)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp eq i32 (i32, i32)* %4, @rl_complete
  br i1 %cmp, label %land.lhs.true, label %if.else4

land.lhs.true:                                    ; preds = %if.else
  %5 = load i32, i32* @completion_changed_buffer, align 4
  %tobool1 = icmp ne i32 %5, 0
  br i1 %tobool1, label %if.else4, label %if.then2

if.then2:                                         ; preds = %land.lhs.true
  %call3 = call i32 @rl_complete_internal(i32 63)
  store i32 %call3, i32* %retval, align 4
  br label %return

if.else4:                                         ; preds = %land.lhs.true, %if.else
  %6 = load i32, i32* @_rl_complete_show_all, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else4
  %call7 = call i32 @rl_complete_internal(i32 33)
  store i32 %call7, i32* %retval, align 4
  br label %return

if.else8:                                         ; preds = %if.else4
  %7 = load i32, i32* @_rl_complete_show_unmodified, align 4
  %tobool9 = icmp ne i32 %7, 0
  br i1 %tobool9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else8
  %call11 = call i32 @rl_complete_internal(i32 64)
  store i32 %call11, i32* %retval, align 4
  br label %return

if.else12:                                        ; preds = %if.else8
  %call13 = call i32 @rl_complete_internal(i32 9)
  store i32 %call13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else12, %if.then10, %if.then6, %if.then2, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @_rl_insert_char(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_complete_internal(i32 %what_to_do) #0 {
entry:
  %retval = alloca i32, align 4
  %what_to_do.addr = alloca i32, align 4
  %matches = alloca i8**, align 4
  %our_func = alloca i8* (i8*, i32)*, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %delimiter = alloca i32, align 4
  %found_quote = alloca i32, align 4
  %i = alloca i32, align 4
  %nontrivial_lcd = alloca i32, align 4
  %text = alloca i8*, align 4
  %saved_line_buffer = alloca i8*, align 4
  %quote_char = alloca i8, align 1
  %tlen = alloca i32, align 4
  %mlen = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 16384
  store i32 %or, i32* @rl_readline_state, align 4
  %1 = load i32, i32* %what_to_do.addr, align 4
  call void @set_completion_defaults(i32 %1)
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %4)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call2, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %saved_line_buffer, align 4
  %5 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %tobool3 = icmp ne i8* (i8*, i32)* %5, null
  br i1 %tobool3, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %cond.end
  %6 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  br label %cond.end6

cond.false5:                                      ; preds = %cond.end
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false5, %cond.true4
  %cond7 = phi i8* (i8*, i32)* [ %6, %cond.true4 ], [ @rl_filename_completion_function, %cond.false5 ]
  store i8* (i8*, i32)* %cond7, i8* (i8*, i32)** %our_func, align 4
  %7 = load i32, i32* @rl_point, align 4
  store i32 %7, i32* %end, align 4
  store i32 0, i32* %delimiter, align 4
  store i32 0, i32* %found_quote, align 4
  store i8 0, i8* %quote_char, align 1
  %8 = load i32, i32* @rl_point, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end6
  %call9 = call signext i8 @_rl_find_completion_word(i32* %found_quote, i32* %delimiter)
  store i8 %call9, i8* %quote_char, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end6
  %9 = load i32, i32* @rl_point, align 4
  store i32 %9, i32* %start, align 4
  %10 = load i32, i32* %end, align 4
  store i32 %10, i32* @rl_point, align 4
  %11 = load i32, i32* %start, align 4
  %12 = load i32, i32* %end, align 4
  %call10 = call i8* @rl_copy_text(i32 %11, i32 %12)
  store i8* %call10, i8** %text, align 4
  %13 = load i8*, i8** %text, align 4
  %14 = load i32, i32* %start, align 4
  %15 = load i32, i32* %end, align 4
  %16 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func, align 4
  %17 = load i32, i32* %found_quote, align 4
  %18 = load i8, i8* %quote_char, align 1
  %conv = sext i8 %18 to i32
  %call11 = call i8** @gen_completion_matches(i8* %13, i32 %14, i32 %15, i8* (i8*, i32)* %16, i32 %17, i32 %conv)
  store i8** %call11, i8*** %matches, align 4
  %19 = load i8**, i8*** %matches, align 4
  %tobool12 = icmp ne i8** %19, null
  br i1 %tobool12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %20 = load i8*, i8** %text, align 4
  %21 = load i8**, i8*** %matches, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %21, i32 0
  %22 = load i8*, i8** %arrayidx, align 4
  %call13 = call i32 @strcmp(i8* %20, i8* %22)
  %cmp = icmp ne i32 %call13, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %23 = phi i1 [ false, %if.end ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %23 to i32
  store i32 %land.ext, i32* %nontrivial_lcd, align 4
  %24 = load i32, i32* %what_to_do.addr, align 4
  %cmp15 = icmp eq i32 %24, 33
  br i1 %cmp15, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.end
  %25 = load i32, i32* %what_to_do.addr, align 4
  %cmp17 = icmp eq i32 %25, 64
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %lor.lhs.false, %land.end
  %26 = load i8*, i8** %text, align 4
  %call20 = call i32 @strlen(i8* %26)
  store i32 %call20, i32* %tlen, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %lor.lhs.false
  %27 = load i8*, i8** %text, align 4
  call void @xfree(i8* %27)
  %28 = load i8**, i8*** %matches, align 4
  %cmp22 = icmp eq i8** %28, null
  br i1 %cmp22, label %if.then24, label %if.end29

if.then24:                                        ; preds = %if.end21
  %call25 = call i32 @rl_ding()
  %29 = load i8*, i8** %saved_line_buffer, align 4
  %tobool26 = icmp ne i8* %29, null
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.then24
  %30 = load i8*, i8** %saved_line_buffer, align 4
  call void @free(i8* %30)
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %if.then24
  store i32 0, i32* @completion_changed_buffer, align 4
  %31 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %31, -16385
  store i32 %and, i32* @rl_readline_state, align 4
  call void @_rl_reset_completion_state()
  store i32 0, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.end21
  %32 = load i32, i32* @rl_filename_completion_desired, align 4
  store i32 %32, i32* %i, align 4
  %33 = load i32, i32* %i, align 4
  %call30 = call i32 @postprocess_matches(i8*** %matches, i32 %33)
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %if.then33, label %if.end39

if.then33:                                        ; preds = %if.end29
  %call34 = call i32 @rl_ding()
  %34 = load i8*, i8** %saved_line_buffer, align 4
  %tobool35 = icmp ne i8* %34, null
  br i1 %tobool35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.then33
  %35 = load i8*, i8** %saved_line_buffer, align 4
  call void @free(i8* %35)
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %if.then33
  store i32 0, i32* @completion_changed_buffer, align 4
  %36 = load i32, i32* @rl_readline_state, align 4
  %and38 = and i32 %36, -16385
  store i32 %and38, i32* @rl_readline_state, align 4
  call void @_rl_reset_completion_state()
  store i32 0, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %if.end29
  %37 = load i32, i32* %what_to_do.addr, align 4
  switch i32 %37, label %sw.default [
    i32 9, label %sw.bb
    i32 33, label %sw.bb
    i32 64, label %sw.bb
    i32 42, label %sw.bb113
    i32 63, label %sw.bb114
  ]

sw.bb:                                            ; preds = %if.end39, %if.end39, %if.end39
  %38 = load i32, i32* %what_to_do.addr, align 4
  %cmp40 = icmp eq i32 %38, 9
  br i1 %cmp40, label %if.then42, label %if.else

if.then42:                                        ; preds = %sw.bb
  %39 = load i8**, i8*** %matches, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %39, i32 0
  %40 = load i8*, i8** %arrayidx43, align 4
  %41 = load i8, i8* %40, align 1
  %tobool44 = icmp ne i8 %41, 0
  br i1 %tobool44, label %if.then45, label %if.end50

if.then45:                                        ; preds = %if.then42
  %42 = load i8**, i8*** %matches, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %42, i32 0
  %43 = load i8*, i8** %arrayidx46, align 4
  %44 = load i32, i32* %start, align 4
  %45 = load i8**, i8*** %matches, align 4
  %arrayidx47 = getelementptr inbounds i8*, i8** %45, i32 1
  %46 = load i8*, i8** %arrayidx47, align 4
  %tobool48 = icmp ne i8* %46, null
  %cond49 = select i1 %tobool48, i32 2, i32 1
  call void @insert_match(i8* %43, i32 %44, i32 %cond49, i8* %quote_char)
  br label %if.end50

if.end50:                                         ; preds = %if.then45, %if.then42
  br label %if.end85

if.else:                                          ; preds = %sw.bb
  %47 = load i8**, i8*** %matches, align 4
  %arrayidx51 = getelementptr inbounds i8*, i8** %47, i32 0
  %48 = load i8*, i8** %arrayidx51, align 4
  %49 = load i8, i8* %48, align 1
  %conv52 = sext i8 %49 to i32
  %tobool53 = icmp ne i32 %conv52, 0
  br i1 %tobool53, label %land.lhs.true, label %if.else62

land.lhs.true:                                    ; preds = %if.else
  %50 = load i8**, i8*** %matches, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %50, i32 1
  %51 = load i8*, i8** %arrayidx54, align 4
  %cmp55 = icmp eq i8* %51, null
  br i1 %cmp55, label %if.then57, label %if.else62

if.then57:                                        ; preds = %land.lhs.true
  %52 = load i8**, i8*** %matches, align 4
  %arrayidx58 = getelementptr inbounds i8*, i8** %52, i32 0
  %53 = load i8*, i8** %arrayidx58, align 4
  %54 = load i32, i32* %start, align 4
  %55 = load i8**, i8*** %matches, align 4
  %arrayidx59 = getelementptr inbounds i8*, i8** %55, i32 1
  %56 = load i8*, i8** %arrayidx59, align 4
  %tobool60 = icmp ne i8* %56, null
  %cond61 = select i1 %tobool60, i32 2, i32 1
  call void @insert_match(i8* %53, i32 %54, i32 %cond61, i8* %quote_char)
  br label %if.end84

if.else62:                                        ; preds = %land.lhs.true, %if.else
  %57 = load i8**, i8*** %matches, align 4
  %arrayidx63 = getelementptr inbounds i8*, i8** %57, i32 0
  %58 = load i8*, i8** %arrayidx63, align 4
  %59 = load i8, i8* %58, align 1
  %tobool64 = icmp ne i8 %59, 0
  br i1 %tobool64, label %if.then65, label %if.end83

if.then65:                                        ; preds = %if.else62
  %60 = load i8**, i8*** %matches, align 4
  %arrayidx66 = getelementptr inbounds i8*, i8** %60, i32 0
  %61 = load i8*, i8** %arrayidx66, align 4
  %62 = load i8, i8* %61, align 1
  %conv67 = sext i8 %62 to i32
  %tobool68 = icmp ne i32 %conv67, 0
  br i1 %tobool68, label %cond.true69, label %cond.false72

cond.true69:                                      ; preds = %if.then65
  %63 = load i8**, i8*** %matches, align 4
  %arrayidx70 = getelementptr inbounds i8*, i8** %63, i32 0
  %64 = load i8*, i8** %arrayidx70, align 4
  %call71 = call i32 @strlen(i8* %64)
  br label %cond.end73

cond.false72:                                     ; preds = %if.then65
  br label %cond.end73

cond.end73:                                       ; preds = %cond.false72, %cond.true69
  %cond74 = phi i32 [ %call71, %cond.true69 ], [ 0, %cond.false72 ]
  store i32 %cond74, i32* %mlen, align 4
  %65 = load i32, i32* %mlen, align 4
  %66 = load i32, i32* %tlen, align 4
  %cmp75 = icmp sge i32 %65, %66
  br i1 %cmp75, label %if.then77, label %if.end82

if.then77:                                        ; preds = %cond.end73
  %67 = load i8**, i8*** %matches, align 4
  %arrayidx78 = getelementptr inbounds i8*, i8** %67, i32 0
  %68 = load i8*, i8** %arrayidx78, align 4
  %69 = load i32, i32* %start, align 4
  %70 = load i8**, i8*** %matches, align 4
  %arrayidx79 = getelementptr inbounds i8*, i8** %70, i32 1
  %71 = load i8*, i8** %arrayidx79, align 4
  %tobool80 = icmp ne i8* %71, null
  %cond81 = select i1 %tobool80, i32 2, i32 1
  call void @insert_match(i8* %68, i32 %69, i32 %cond81, i8* %quote_char)
  br label %if.end82

if.end82:                                         ; preds = %if.then77, %cond.end73
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.else62
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.then57
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.end50
  %72 = load i8**, i8*** %matches, align 4
  %arrayidx86 = getelementptr inbounds i8*, i8** %72, i32 1
  %73 = load i8*, i8** %arrayidx86, align 4
  %tobool87 = icmp ne i8* %73, null
  br i1 %tobool87, label %if.then88, label %if.else108

if.then88:                                        ; preds = %if.end85
  %74 = load i32, i32* %what_to_do.addr, align 4
  %cmp89 = icmp eq i32 %74, 33
  br i1 %cmp89, label %if.then91, label %if.else92

if.then91:                                        ; preds = %if.then88
  %75 = load i8**, i8*** %matches, align 4
  call void @display_matches(i8** %75)
  br label %sw.epilog

if.else92:                                        ; preds = %if.then88
  %76 = load i32, i32* %what_to_do.addr, align 4
  %cmp93 = icmp eq i32 %76, 64
  br i1 %cmp93, label %if.then95, label %if.else100

if.then95:                                        ; preds = %if.else92
  %77 = load i32, i32* %nontrivial_lcd, align 4
  %cmp96 = icmp eq i32 %77, 0
  br i1 %cmp96, label %if.then98, label %if.end99

if.then98:                                        ; preds = %if.then95
  %78 = load i8**, i8*** %matches, align 4
  call void @display_matches(i8** %78)
  br label %if.end99

if.end99:                                         ; preds = %if.then98, %if.then95
  br label %sw.epilog

if.else100:                                       ; preds = %if.else92
  %79 = load i32, i32* @rl_editing_mode, align 4
  %cmp101 = icmp ne i32 %79, 0
  br i1 %cmp101, label %if.then103, label %if.end105

if.then103:                                       ; preds = %if.else100
  %call104 = call i32 @rl_ding()
  br label %if.end105

if.end105:                                        ; preds = %if.then103, %if.else100
  br label %if.end106

if.end106:                                        ; preds = %if.end105
  br label %if.end107

if.end107:                                        ; preds = %if.end106
  br label %if.end112

if.else108:                                       ; preds = %if.end85
  %80 = load i8**, i8*** %matches, align 4
  %arrayidx109 = getelementptr inbounds i8*, i8** %80, i32 0
  %81 = load i8*, i8** %arrayidx109, align 4
  %82 = load i32, i32* %delimiter, align 4
  %83 = load i8, i8* %quote_char, align 1
  %conv110 = sext i8 %83 to i32
  %84 = load i32, i32* %nontrivial_lcd, align 4
  %call111 = call i32 @append_to_match(i8* %81, i32 %82, i32 %conv110, i32 %84)
  br label %if.end112

if.end112:                                        ; preds = %if.else108, %if.end107
  br label %sw.epilog

sw.bb113:                                         ; preds = %if.end39
  %85 = load i8**, i8*** %matches, align 4
  %86 = load i32, i32* %start, align 4
  call void @insert_all_matches(i8** %85, i32 %86, i8* %quote_char)
  br label %sw.epilog

sw.bb114:                                         ; preds = %if.end39
  %87 = load void (i8**, i32, i32)*, void (i8**, i32, i32)** @rl_completion_display_matches_hook, align 4
  %cmp115 = icmp eq void (i8**, i32, i32)* %87, null
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %sw.bb114
  store void (i32, i8*)* @_rl_complete_sigcleanup, void (i32, i8*)** @_rl_sigcleanup, align 4
  %88 = load i8**, i8*** %matches, align 4
  %89 = bitcast i8** %88 to i8*
  store i8* %89, i8** @_rl_sigcleanarg, align 4
  store i32 0, i32* @_rl_complete_display_matches_interrupt, align 4
  br label %if.end118

if.end118:                                        ; preds = %if.then117, %sw.bb114
  %90 = load i8**, i8*** %matches, align 4
  call void @display_matches(i8** %90)
  %91 = load i32, i32* @_rl_complete_display_matches_interrupt, align 4
  %tobool119 = icmp ne i32 %91, 0
  br i1 %tobool119, label %if.then120, label %if.end125

if.then120:                                       ; preds = %if.end118
  store i8** null, i8*** %matches, align 4
  store i32 0, i32* @_rl_complete_display_matches_interrupt, align 4
  %92 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %tobool121 = icmp ne i32 ()* %92, null
  br i1 %tobool121, label %if.then122, label %if.end124

if.then122:                                       ; preds = %if.then120
  %93 = load i32 ()*, i32 ()** @rl_signal_event_hook, align 4
  %call123 = call i32 %93()
  br label %if.end124

if.end124:                                        ; preds = %if.then122, %if.then120
  br label %if.end125

if.end125:                                        ; preds = %if.end124, %if.end118
  store void (i32, i8*)* null, void (i32, i8*)** @_rl_sigcleanup, align 4
  store i8* null, i8** @_rl_sigcleanarg, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end39
  %94 = load i32, i32* %what_to_do.addr, align 4
  call void (i8*, ...) @_rl_ttymsg(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.2, i32 0, i32 0), i32 %94)
  %call126 = call i32 @rl_ding()
  %95 = load i8*, i8** %saved_line_buffer, align 4
  %tobool127 = icmp ne i8* %95, null
  br i1 %tobool127, label %if.then128, label %if.end129

if.then128:                                       ; preds = %sw.default
  %96 = load i8*, i8** %saved_line_buffer, align 4
  call void @free(i8* %96)
  br label %if.end129

if.end129:                                        ; preds = %if.then128, %sw.default
  %97 = load i32, i32* @rl_readline_state, align 4
  %and130 = and i32 %97, -16385
  store i32 %and130, i32* @rl_readline_state, align 4
  %98 = load i8**, i8*** %matches, align 4
  call void @_rl_free_match_list(i8** %98)
  call void @_rl_reset_completion_state()
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end125, %sw.bb113, %if.end112, %if.end99, %if.then91
  %99 = load i8**, i8*** %matches, align 4
  call void @_rl_free_match_list(i8** %99)
  %100 = load i8*, i8** %saved_line_buffer, align 4
  %tobool131 = icmp ne i8* %100, null
  br i1 %tobool131, label %if.then132, label %if.end136

if.then132:                                       ; preds = %sw.epilog
  %101 = load i8*, i8** @rl_line_buffer, align 4
  %102 = load i8*, i8** %saved_line_buffer, align 4
  %call133 = call i32 @strcmp(i8* %101, i8* %102)
  %cmp134 = icmp ne i32 %call133, 0
  %conv135 = zext i1 %cmp134 to i32
  store i32 %conv135, i32* @completion_changed_buffer, align 4
  %103 = load i8*, i8** %saved_line_buffer, align 4
  call void @xfree(i8* %103)
  br label %if.end136

if.end136:                                        ; preds = %if.then132, %sw.epilog
  %104 = load i32, i32* @rl_readline_state, align 4
  %and137 = and i32 %104, -16385
  store i32 %and137, i32* @rl_readline_state, align 4
  call void @_rl_reset_completion_state()
  br label %do.body

do.body:                                          ; preds = %if.end136
  %105 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool138 = icmp ne i32 %105, 0
  br i1 %tobool138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %do.body
  %106 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %106)
  br label %if.end140

if.end140:                                        ; preds = %if.then139, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end140
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.end129, %if.end37, %if.end28
  %107 = load i32, i32* %retval, align 4
  ret i32 %107
}

; Function Attrs: noinline nounwind
define i32 @rl_possible_completions(i32 %ignore, i32 %invoking_key) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32, i32* %invoking_key.addr, align 4
  store i32 %0, i32* @rl_completion_invoking_key, align 4
  %call = call i32 @rl_complete_internal(i32 63)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_insert_completions(i32 %ignore, i32 %invoking_key) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32, i32* %invoking_key.addr, align 4
  store i32 %0, i32* @rl_completion_invoking_key, align 4
  %call = call i32 @rl_complete_internal(i32 42)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_completion_mode(i32 (i32, i32)* %cfunc) #0 {
entry:
  %retval = alloca i32, align 4
  %cfunc.addr = alloca i32 (i32, i32)*, align 4
  store i32 (i32, i32)* %cfunc, i32 (i32, i32)** %cfunc.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** %cfunc.addr, align 4
  %cmp = icmp eq i32 (i32, i32)* %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @completion_changed_buffer, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %land.lhs.true
  store i32 63, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @_rl_complete_show_all, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 33, i32* %retval, align 4
  br label %return

if.else3:                                         ; preds = %if.else
  %4 = load i32, i32* @_rl_complete_show_unmodified, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %if.else3
  store i32 64, i32* %retval, align 4
  br label %return

if.else6:                                         ; preds = %if.else3
  store i32 9, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else6, %if.then5, %if.then2, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define void @_rl_reset_completion_state() #0 {
entry:
  store i32 0, i32* @rl_completion_found_quote, align 4
  store i32 0, i32* @rl_completion_quote_character, align 4
  ret void
}

; Function Attrs: noinline nounwind
define signext i8 @_rl_find_completion_word(i32* %fp, i32* %dp) #0 {
entry:
  %fp.addr = alloca i32*, align 4
  %dp.addr = alloca i32*, align 4
  %scan = alloca i32, align 4
  %end = alloca i32, align 4
  %found_quote = alloca i32, align 4
  %delimiter = alloca i32, align 4
  %pass_next = alloca i32, align 4
  %isbrk = alloca i32, align 4
  %quote_char = alloca i8, align 1
  %brkchars = alloca i8*, align 4
  store i32* %fp, i32** %fp.addr, align 4
  store i32* %dp, i32** %dp.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %end, align 4
  store i32 0, i32* %delimiter, align 4
  store i32 0, i32* %found_quote, align 4
  store i8 0, i8* %quote_char, align 1
  store i8* null, i8** %brkchars, align 4
  %1 = load i8* ()*, i8* ()** @rl_completion_word_break_hook, align 4
  %tobool = icmp ne i8* ()* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8* ()*, i8* ()** @rl_completion_word_break_hook, align 4
  %call = call i8* %2()
  store i8* %call, i8** %brkchars, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %brkchars, align 4
  %cmp = icmp eq i8* %3, null
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %4 = load i8*, i8** @rl_completer_word_break_characters, align 4
  store i8* %4, i8** %brkchars, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %5 = load i8*, i8** @rl_completer_quote_characters, align 4
  %tobool3 = icmp ne i8* %5, null
  br i1 %tobool3, label %if.then4, label %if.end58

if.then4:                                         ; preds = %if.end2
  store i32 0, i32* %pass_next, align 4
  store i32 0, i32* %scan, align 4
  br label %for.cond

for.cond:                                         ; preds = %cond.end, %if.then4
  %6 = load i32, i32* %scan, align 4
  %7 = load i32, i32* %end, align 4
  %cmp5 = icmp slt i32 %6, %7
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %pass_next, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %for.body
  store i32 0, i32* %pass_next, align 4
  br label %for.inc

if.end8:                                          ; preds = %for.body
  %9 = load i8, i8* %quote_char, align 1
  %conv = sext i8 %9 to i32
  %cmp9 = icmp ne i32 %conv, 39
  br i1 %cmp9, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.end8
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %scan, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx, align 1
  %conv11 = sext i8 %12 to i32
  %cmp12 = icmp eq i32 %conv11, 92
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %land.lhs.true
  store i32 1, i32* %pass_next, align 4
  %13 = load i32, i32* %found_quote, align 4
  %or = or i32 %13, 4
  store i32 %or, i32* %found_quote, align 4
  br label %for.inc

if.end15:                                         ; preds = %land.lhs.true, %if.end8
  %14 = load i8, i8* %quote_char, align 1
  %conv16 = sext i8 %14 to i32
  %cmp17 = icmp ne i32 %conv16, 0
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.end15
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* %scan, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %17 to i32
  %18 = load i8, i8* %quote_char, align 1
  %conv22 = sext i8 %18 to i32
  %cmp23 = icmp eq i32 %conv21, %conv22
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.then19
  store i8 0, i8* %quote_char, align 1
  %19 = load i32, i32* %end, align 4
  store i32 %19, i32* @rl_point, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.then19
  br label %if.end49

if.else:                                          ; preds = %if.end15
  %20 = load i8*, i8** @rl_completer_quote_characters, align 4
  %21 = load i8*, i8** @rl_line_buffer, align 4
  %22 = load i32, i32* %scan, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %21, i32 %22
  %23 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %23 to i32
  %call29 = call i8* @strchr(i8* %20, i32 %conv28)
  %tobool30 = icmp ne i8* %call29, null
  br i1 %tobool30, label %if.then31, label %if.end48

if.then31:                                        ; preds = %if.else
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* %scan, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx32, align 1
  store i8 %26, i8* %quote_char, align 1
  %27 = load i32, i32* %scan, align 4
  %add = add nsw i32 %27, 1
  store i32 %add, i32* @rl_point, align 4
  %28 = load i8, i8* %quote_char, align 1
  %conv33 = sext i8 %28 to i32
  %cmp34 = icmp eq i32 %conv33, 39
  br i1 %cmp34, label %if.then36, label %if.else38

if.then36:                                        ; preds = %if.then31
  %29 = load i32, i32* %found_quote, align 4
  %or37 = or i32 %29, 1
  store i32 %or37, i32* %found_quote, align 4
  br label %if.end47

if.else38:                                        ; preds = %if.then31
  %30 = load i8, i8* %quote_char, align 1
  %conv39 = sext i8 %30 to i32
  %cmp40 = icmp eq i32 %conv39, 34
  br i1 %cmp40, label %if.then42, label %if.else44

if.then42:                                        ; preds = %if.else38
  %31 = load i32, i32* %found_quote, align 4
  %or43 = or i32 %31, 2
  store i32 %or43, i32* %found_quote, align 4
  br label %if.end46

if.else44:                                        ; preds = %if.else38
  %32 = load i32, i32* %found_quote, align 4
  %or45 = or i32 %32, 8
  store i32 %or45, i32* %found_quote, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else44, %if.then42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then36
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.else
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end26
  br label %for.inc

for.inc:                                          ; preds = %if.end49, %if.then14, %if.then7
  %call50 = call i32 @__ctype_get_mb_cur_max()
  %cmp51 = icmp ugt i32 %call50, 1
  br i1 %cmp51, label %land.lhs.true53, label %cond.false

land.lhs.true53:                                  ; preds = %for.inc
  %33 = load i32, i32* @rl_byte_oriented, align 4
  %cmp54 = icmp eq i32 %33, 0
  br i1 %cmp54, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true53
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %35 = load i32, i32* %scan, align 4
  %call56 = call i32 @_rl_find_next_mbchar(i8* %34, i32 %35, i32 1, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true53, %for.inc
  %36 = load i32, i32* %scan, align 4
  %add57 = add nsw i32 %36, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call56, %cond.true ], [ %add57, %cond.false ]
  store i32 %cond, i32* %scan, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end58

if.end58:                                         ; preds = %for.end, %if.end2
  %37 = load i32, i32* @rl_point, align 4
  %38 = load i32, i32* %end, align 4
  %cmp59 = icmp eq i32 %37, %38
  br i1 %cmp59, label %land.lhs.true61, label %if.end93

land.lhs.true61:                                  ; preds = %if.end58
  %39 = load i8, i8* %quote_char, align 1
  %conv62 = sext i8 %39 to i32
  %cmp63 = icmp eq i32 %conv62, 0
  br i1 %cmp63, label %if.then65, label %if.end93

if.then65:                                        ; preds = %land.lhs.true61
  br label %while.cond

while.cond:                                       ; preds = %if.then91, %if.then83, %if.then65
  %call66 = call i32 @__ctype_get_mb_cur_max()
  %cmp67 = icmp ugt i32 %call66, 1
  br i1 %cmp67, label %land.lhs.true69, label %cond.false74

land.lhs.true69:                                  ; preds = %while.cond
  %40 = load i32, i32* @rl_byte_oriented, align 4
  %cmp70 = icmp eq i32 %40, 0
  br i1 %cmp70, label %cond.true72, label %cond.false74

cond.true72:                                      ; preds = %land.lhs.true69
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* @rl_point, align 4
  %call73 = call i32 @_rl_find_prev_mbchar(i8* %41, i32 %42, i32 0)
  br label %cond.end75

cond.false74:                                     ; preds = %land.lhs.true69, %while.cond
  %43 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %43, 1
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true72
  %cond76 = phi i32 [ %call73, %cond.true72 ], [ %sub, %cond.false74 ]
  store i32 %cond76, i32* @rl_point, align 4
  %tobool77 = icmp ne i32 %cond76, 0
  br i1 %tobool77, label %while.body, label %while.end

while.body:                                       ; preds = %cond.end75
  %44 = load i8*, i8** @rl_line_buffer, align 4
  %45 = load i32, i32* @rl_point, align 4
  %arrayidx78 = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = load i8, i8* %arrayidx78, align 1
  %conv79 = sext i8 %46 to i32
  store i32 %conv79, i32* %scan, align 4
  %47 = load i8*, i8** %brkchars, align 4
  %48 = load i32, i32* %scan, align 4
  %call80 = call i8* @strchr(i8* %47, i32 %48)
  %cmp81 = icmp eq i8* %call80, null
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %while.body
  br label %while.cond

if.end84:                                         ; preds = %while.body
  %49 = load i32 (i8*, i32)*, i32 (i8*, i32)** @rl_char_is_quoted_p, align 4
  %tobool85 = icmp ne i32 (i8*, i32)* %49, null
  br i1 %tobool85, label %land.lhs.true86, label %if.end92

land.lhs.true86:                                  ; preds = %if.end84
  %50 = load i32, i32* %found_quote, align 4
  %tobool87 = icmp ne i32 %50, 0
  br i1 %tobool87, label %land.lhs.true88, label %if.end92

land.lhs.true88:                                  ; preds = %land.lhs.true86
  %51 = load i32 (i8*, i32)*, i32 (i8*, i32)** @rl_char_is_quoted_p, align 4
  %52 = load i8*, i8** @rl_line_buffer, align 4
  %53 = load i32, i32* @rl_point, align 4
  %call89 = call i32 %51(i8* %52, i32 %53)
  %tobool90 = icmp ne i32 %call89, 0
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %land.lhs.true88
  br label %while.cond

if.end92:                                         ; preds = %land.lhs.true88, %land.lhs.true86, %if.end84
  br label %while.end

while.end:                                        ; preds = %if.end92, %cond.end75
  br label %if.end93

if.end93:                                         ; preds = %while.end, %land.lhs.true61, %if.end58
  %54 = load i8*, i8** @rl_line_buffer, align 4
  %55 = load i32, i32* @rl_point, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %56 to i32
  store i32 %conv95, i32* %scan, align 4
  %57 = load i32, i32* %scan, align 4
  %tobool96 = icmp ne i32 %57, 0
  br i1 %tobool96, label %if.then97, label %if.end134

if.then97:                                        ; preds = %if.end93
  %58 = load i32 (i8*, i32)*, i32 (i8*, i32)** @rl_char_is_quoted_p, align 4
  %tobool98 = icmp ne i32 (i8*, i32)* %58, null
  br i1 %tobool98, label %if.then99, label %if.else108

if.then99:                                        ; preds = %if.then97
  %59 = load i32, i32* %found_quote, align 4
  %cmp100 = icmp eq i32 %59, 0
  br i1 %cmp100, label %land.rhs, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then99
  %60 = load i32 (i8*, i32)*, i32 (i8*, i32)** @rl_char_is_quoted_p, align 4
  %61 = load i8*, i8** @rl_line_buffer, align 4
  %62 = load i32, i32* @rl_point, align 4
  %call102 = call i32 %60(i8* %61, i32 %62)
  %cmp103 = icmp eq i32 %call102, 0
  br i1 %cmp103, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.lhs.false, %if.then99
  %63 = load i8*, i8** %brkchars, align 4
  %64 = load i32, i32* %scan, align 4
  %call105 = call i8* @strchr(i8* %63, i32 %64)
  %cmp106 = icmp ne i8* %call105, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.lhs.false
  %65 = phi i1 [ false, %lor.lhs.false ], [ %cmp106, %land.rhs ]
  %land.ext = zext i1 %65 to i32
  store i32 %land.ext, i32* %isbrk, align 4
  br label %if.end112

if.else108:                                       ; preds = %if.then97
  %66 = load i8*, i8** %brkchars, align 4
  %67 = load i32, i32* %scan, align 4
  %call109 = call i8* @strchr(i8* %66, i32 %67)
  %cmp110 = icmp ne i8* %call109, null
  %conv111 = zext i1 %cmp110 to i32
  store i32 %conv111, i32* %isbrk, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.else108, %land.end
  %68 = load i32, i32* %isbrk, align 4
  %tobool113 = icmp ne i32 %68, 0
  br i1 %tobool113, label %if.then114, label %if.end133

if.then114:                                       ; preds = %if.end112
  %69 = load i8*, i8** @rl_basic_quote_characters, align 4
  %tobool115 = icmp ne i8* %69, null
  br i1 %tobool115, label %land.lhs.true116, label %if.end124

land.lhs.true116:                                 ; preds = %if.then114
  %70 = load i8*, i8** @rl_basic_quote_characters, align 4
  %71 = load i32, i32* %scan, align 4
  %call117 = call i8* @strchr(i8* %70, i32 %71)
  %tobool118 = icmp ne i8* %call117, null
  br i1 %tobool118, label %land.lhs.true119, label %if.end124

land.lhs.true119:                                 ; preds = %land.lhs.true116
  %72 = load i32, i32* %end, align 4
  %73 = load i32, i32* @rl_point, align 4
  %sub120 = sub nsw i32 %72, %73
  %cmp121 = icmp sgt i32 %sub120, 1
  br i1 %cmp121, label %if.then123, label %if.end124

if.then123:                                       ; preds = %land.lhs.true119
  %74 = load i32, i32* %scan, align 4
  store i32 %74, i32* %delimiter, align 4
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %land.lhs.true119, %land.lhs.true116, %if.then114
  %75 = load i8*, i8** @rl_special_prefixes, align 4
  %cmp125 = icmp eq i8* %75, null
  br i1 %cmp125, label %if.then131, label %lor.lhs.false127

lor.lhs.false127:                                 ; preds = %if.end124
  %76 = load i8*, i8** @rl_special_prefixes, align 4
  %77 = load i32, i32* %scan, align 4
  %call128 = call i8* @strchr(i8* %76, i32 %77)
  %cmp129 = icmp eq i8* %call128, null
  br i1 %cmp129, label %if.then131, label %if.end132

if.then131:                                       ; preds = %lor.lhs.false127, %if.end124
  %78 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %78, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end132

if.end132:                                        ; preds = %if.then131, %lor.lhs.false127
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.end112
  br label %if.end134

if.end134:                                        ; preds = %if.end133, %if.end93
  %79 = load i32*, i32** %fp.addr, align 4
  %tobool135 = icmp ne i32* %79, null
  br i1 %tobool135, label %if.then136, label %if.end137

if.then136:                                       ; preds = %if.end134
  %80 = load i32, i32* %found_quote, align 4
  %81 = load i32*, i32** %fp.addr, align 4
  store i32 %80, i32* %81, align 4
  br label %if.end137

if.end137:                                        ; preds = %if.then136, %if.end134
  %82 = load i32*, i32** %dp.addr, align 4
  %tobool138 = icmp ne i32* %82, null
  br i1 %tobool138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end137
  %83 = load i32, i32* %delimiter, align 4
  %84 = load i32*, i32** %dp.addr, align 4
  store i32 %83, i32* %84, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.then139, %if.end137
  %85 = load i8, i8* %quote_char, align 1
  ret i8 %85
}

declare i8* @strchr(i8*, i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @_rl_find_next_mbchar(i8*, i32, i32, i32) #1

declare i32 @_rl_find_prev_mbchar(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define void @rl_display_match_list(i8** %matches, i32 %len, i32 %max) #0 {
entry:
  %matches.addr = alloca i8**, align 4
  %len.addr = alloca i32, align 4
  %max.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %limit = alloca i32, align 4
  %printed_len = alloca i32, align 4
  %lines = alloca i32, align 4
  %cols = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %common_length = alloca i32, align 4
  %sind = alloca i32, align 4
  %temp = alloca i8*, align 4
  %t = alloca i8*, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %max, i32* %max.addr, align 4
  store i32 0, i32* %sind, align 4
  store i32 0, i32* %common_length, align 4
  %0 = load i32, i32* @_rl_completion_prefix_display_length, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else24

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %matches.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 0
  %2 = load i8*, i8** %arrayidx, align 4
  %call = call i8* @printable_part(i8* %2)
  store i8* %call, i8** %t, align 4
  %3 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %4 = load i8*, i8** %t, align 4
  %call1 = call i8* @strrchr(i8* %4, i32 47)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call1, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %5 = load i8*, i8** %temp, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %cond.true3, label %cond.false5

cond.true3:                                       ; preds = %cond.end
  %6 = load i8*, i8** %temp, align 4
  %call4 = call i32 @fnwidth(i8* %6)
  br label %cond.end7

cond.false5:                                      ; preds = %cond.end
  %7 = load i8*, i8** %t, align 4
  %call6 = call i32 @fnwidth(i8* %7)
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false5, %cond.true3
  %cond8 = phi i32 [ %call4, %cond.true3 ], [ %call6, %cond.false5 ]
  store i32 %cond8, i32* %common_length, align 4
  %8 = load i8*, i8** %temp, align 4
  %tobool9 = icmp ne i8* %8, null
  br i1 %tobool9, label %cond.true10, label %cond.false12

cond.true10:                                      ; preds = %cond.end7
  %9 = load i8*, i8** %temp, align 4
  %call11 = call i32 @strlen(i8* %9)
  br label %cond.end14

cond.false12:                                     ; preds = %cond.end7
  %10 = load i8*, i8** %t, align 4
  %call13 = call i32 @strlen(i8* %10)
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false12, %cond.true10
  %cond15 = phi i32 [ %call11, %cond.true10 ], [ %call13, %cond.false12 ]
  store i32 %cond15, i32* %sind, align 4
  %11 = load i32, i32* %common_length, align 4
  %12 = load i32, i32* %max.addr, align 4
  %cmp16 = icmp sgt i32 %11, %12
  br i1 %cmp16, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end14
  %13 = load i32, i32* %sind, align 4
  %14 = load i32, i32* %max.addr, align 4
  %cmp17 = icmp sgt i32 %13, %14
  br i1 %cmp17, label %if.then18, label %if.end

if.then18:                                        ; preds = %lor.lhs.false, %cond.end14
  store i32 0, i32* %sind, align 4
  store i32 0, i32* %common_length, align 4
  br label %if.end

if.end:                                           ; preds = %if.then18, %lor.lhs.false
  %15 = load i32, i32* %common_length, align 4
  %16 = load i32, i32* @_rl_completion_prefix_display_length, align 4
  %cmp19 = icmp sgt i32 %15, %16
  br i1 %cmp19, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %17 = load i32, i32* %common_length, align 4
  %cmp20 = icmp sgt i32 %17, 3
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %common_length, align 4
  %sub = sub nsw i32 %18, 3
  %19 = load i32, i32* %max.addr, align 4
  %sub22 = sub nsw i32 %19, %sub
  store i32 %sub22, i32* %max.addr, align 4
  br label %if.end23

if.else:                                          ; preds = %land.lhs.true, %if.end
  store i32 0, i32* %sind, align 4
  store i32 0, i32* %common_length, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.then21
  br label %if.end106

if.else24:                                        ; preds = %entry
  %20 = load i32, i32* @_rl_colored_completion_prefix, align 4
  %cmp25 = icmp sgt i32 %20, 0
  br i1 %cmp25, label %if.then26, label %if.end105

if.then26:                                        ; preds = %if.else24
  %21 = load i8**, i8*** %matches.addr, align 4
  %arrayidx27 = getelementptr inbounds i8*, i8** %21, i32 0
  %22 = load i8*, i8** %arrayidx27, align 4
  %call28 = call i8* @printable_part(i8* %22)
  store i8* %call28, i8** %t, align 4
  %23 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool29 = icmp ne i32 %23, 0
  br i1 %tobool29, label %cond.true30, label %cond.false32

cond.true30:                                      ; preds = %if.then26
  %24 = load i8*, i8** %t, align 4
  %call31 = call i8* @strrchr(i8* %24, i32 47)
  br label %cond.end33

cond.false32:                                     ; preds = %if.then26
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false32, %cond.true30
  %cond34 = phi i8* [ %call31, %cond.true30 ], [ null, %cond.false32 ]
  store i8* %cond34, i8** %temp, align 4
  %25 = load i8*, i8** %temp, align 4
  %tobool35 = icmp ne i8* %25, null
  br i1 %tobool35, label %cond.true36, label %cond.false38

cond.true36:                                      ; preds = %cond.end33
  %26 = load i8*, i8** %temp, align 4
  %call37 = call i32 @fnwidth(i8* %26)
  br label %cond.end40

cond.false38:                                     ; preds = %cond.end33
  %27 = load i8*, i8** %t, align 4
  %call39 = call i32 @fnwidth(i8* %27)
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false38, %cond.true36
  %cond41 = phi i32 [ %call37, %cond.true36 ], [ %call39, %cond.false38 ]
  store i32 %cond41, i32* %common_length, align 4
  %28 = load i8*, i8** %temp, align 4
  %tobool42 = icmp ne i8* %28, null
  br i1 %tobool42, label %cond.true43, label %cond.false71

cond.true43:                                      ; preds = %cond.end40
  %29 = load i8*, i8** %temp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %29, i32 1
  %tobool44 = icmp ne i8* %add.ptr, null
  br i1 %tobool44, label %land.lhs.true45, label %cond.false68

land.lhs.true45:                                  ; preds = %cond.true43
  %30 = load i8*, i8** %temp, align 4
  %add.ptr46 = getelementptr inbounds i8, i8* %30, i32 1
  %arrayidx47 = getelementptr inbounds i8, i8* %add.ptr46, i32 0
  %31 = load i8, i8* %arrayidx47, align 1
  %conv = sext i8 %31 to i32
  %tobool48 = icmp ne i32 %conv, 0
  br i1 %tobool48, label %cond.true49, label %cond.false68

cond.true49:                                      ; preds = %land.lhs.true45
  %32 = load i8*, i8** %temp, align 4
  %add.ptr50 = getelementptr inbounds i8, i8* %32, i32 1
  %arrayidx51 = getelementptr inbounds i8, i8* %add.ptr50, i32 1
  %33 = load i8, i8* %arrayidx51, align 1
  %conv52 = sext i8 %33 to i32
  %tobool53 = icmp ne i32 %conv52, 0
  br i1 %tobool53, label %cond.true54, label %cond.false65

cond.true54:                                      ; preds = %cond.true49
  %34 = load i8*, i8** %temp, align 4
  %add.ptr55 = getelementptr inbounds i8, i8* %34, i32 1
  %arrayidx56 = getelementptr inbounds i8, i8* %add.ptr55, i32 2
  %35 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %35 to i32
  %tobool58 = icmp ne i32 %conv57, 0
  br i1 %tobool58, label %cond.true59, label %cond.false62

cond.true59:                                      ; preds = %cond.true54
  %36 = load i8*, i8** %temp, align 4
  %add.ptr60 = getelementptr inbounds i8, i8* %36, i32 1
  %call61 = call i32 @strlen(i8* %add.ptr60)
  br label %cond.end63

cond.false62:                                     ; preds = %cond.true54
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false62, %cond.true59
  %cond64 = phi i32 [ %call61, %cond.true59 ], [ 2, %cond.false62 ]
  br label %cond.end66

cond.false65:                                     ; preds = %cond.true49
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false65, %cond.end63
  %cond67 = phi i32 [ %cond64, %cond.end63 ], [ 1, %cond.false65 ]
  br label %cond.end69

cond.false68:                                     ; preds = %land.lhs.true45, %cond.true43
  br label %cond.end69

cond.end69:                                       ; preds = %cond.false68, %cond.end66
  %cond70 = phi i32 [ %cond67, %cond.end66 ], [ 0, %cond.false68 ]
  br label %cond.end96

cond.false71:                                     ; preds = %cond.end40
  %37 = load i8*, i8** %t, align 4
  %tobool72 = icmp ne i8* %37, null
  br i1 %tobool72, label %land.lhs.true73, label %cond.false93

land.lhs.true73:                                  ; preds = %cond.false71
  %38 = load i8*, i8** %t, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %38, i32 0
  %39 = load i8, i8* %arrayidx74, align 1
  %conv75 = sext i8 %39 to i32
  %tobool76 = icmp ne i32 %conv75, 0
  br i1 %tobool76, label %cond.true77, label %cond.false93

cond.true77:                                      ; preds = %land.lhs.true73
  %40 = load i8*, i8** %t, align 4
  %arrayidx78 = getelementptr inbounds i8, i8* %40, i32 1
  %41 = load i8, i8* %arrayidx78, align 1
  %conv79 = sext i8 %41 to i32
  %tobool80 = icmp ne i32 %conv79, 0
  br i1 %tobool80, label %cond.true81, label %cond.false90

cond.true81:                                      ; preds = %cond.true77
  %42 = load i8*, i8** %t, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %42, i32 2
  %43 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %43 to i32
  %tobool84 = icmp ne i32 %conv83, 0
  br i1 %tobool84, label %cond.true85, label %cond.false87

cond.true85:                                      ; preds = %cond.true81
  %44 = load i8*, i8** %t, align 4
  %call86 = call i32 @strlen(i8* %44)
  br label %cond.end88

cond.false87:                                     ; preds = %cond.true81
  br label %cond.end88

cond.end88:                                       ; preds = %cond.false87, %cond.true85
  %cond89 = phi i32 [ %call86, %cond.true85 ], [ 2, %cond.false87 ]
  br label %cond.end91

cond.false90:                                     ; preds = %cond.true77
  br label %cond.end91

cond.end91:                                       ; preds = %cond.false90, %cond.end88
  %cond92 = phi i32 [ %cond89, %cond.end88 ], [ 1, %cond.false90 ]
  br label %cond.end94

cond.false93:                                     ; preds = %land.lhs.true73, %cond.false71
  br label %cond.end94

cond.end94:                                       ; preds = %cond.false93, %cond.end91
  %cond95 = phi i32 [ %cond92, %cond.end91 ], [ 0, %cond.false93 ]
  br label %cond.end96

cond.end96:                                       ; preds = %cond.end94, %cond.end69
  %cond97 = phi i32 [ %cond70, %cond.end69 ], [ %cond95, %cond.end94 ]
  store i32 %cond97, i32* %sind, align 4
  %45 = load i32, i32* %common_length, align 4
  %46 = load i32, i32* %max.addr, align 4
  %cmp98 = icmp sgt i32 %45, %46
  br i1 %cmp98, label %if.then103, label %lor.lhs.false100

lor.lhs.false100:                                 ; preds = %cond.end96
  %47 = load i32, i32* %sind, align 4
  %48 = load i32, i32* %max.addr, align 4
  %cmp101 = icmp sgt i32 %47, %48
  br i1 %cmp101, label %if.then103, label %if.end104

if.then103:                                       ; preds = %lor.lhs.false100, %cond.end96
  store i32 0, i32* %sind, align 4
  store i32 0, i32* %common_length, align 4
  br label %if.end104

if.end104:                                        ; preds = %if.then103, %lor.lhs.false100
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.else24
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.end23
  %call107 = call i32 @complete_get_screenwidth()
  store i32 %call107, i32* %cols, align 4
  %49 = load i32, i32* %max.addr, align 4
  %add = add nsw i32 %49, 2
  store i32 %add, i32* %max.addr, align 4
  %50 = load i32, i32* %cols, align 4
  %51 = load i32, i32* %max.addr, align 4
  %div = sdiv i32 %50, %51
  store i32 %div, i32* %limit, align 4
  %52 = load i32, i32* %limit, align 4
  %cmp108 = icmp ne i32 %52, 1
  br i1 %cmp108, label %land.lhs.true110, label %if.end114

land.lhs.true110:                                 ; preds = %if.end106
  %53 = load i32, i32* %limit, align 4
  %54 = load i32, i32* %max.addr, align 4
  %mul = mul nsw i32 %53, %54
  %55 = load i32, i32* %cols, align 4
  %cmp111 = icmp eq i32 %mul, %55
  br i1 %cmp111, label %if.then113, label %if.end114

if.then113:                                       ; preds = %land.lhs.true110
  %56 = load i32, i32* %limit, align 4
  %dec = add nsw i32 %56, -1
  store i32 %dec, i32* %limit, align 4
  br label %if.end114

if.end114:                                        ; preds = %if.then113, %land.lhs.true110, %if.end106
  %57 = load i32, i32* %cols, align 4
  %58 = load i32, i32* @_rl_screenwidth, align 4
  %cmp115 = icmp slt i32 %57, %58
  br i1 %cmp115, label %land.lhs.true117, label %if.end121

land.lhs.true117:                                 ; preds = %if.end114
  %59 = load i32, i32* %limit, align 4
  %cmp118 = icmp slt i32 %59, 0
  br i1 %cmp118, label %if.then120, label %if.end121

if.then120:                                       ; preds = %land.lhs.true117
  store i32 1, i32* %limit, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.then120, %land.lhs.true117, %if.end114
  %60 = load i32, i32* %limit, align 4
  %cmp122 = icmp eq i32 %60, 0
  br i1 %cmp122, label %if.then124, label %if.end125

if.then124:                                       ; preds = %if.end121
  store i32 1, i32* %limit, align 4
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %if.end121
  %61 = load i32, i32* %len.addr, align 4
  %62 = load i32, i32* %limit, align 4
  %sub126 = sub nsw i32 %62, 1
  %add127 = add nsw i32 %61, %sub126
  %63 = load i32, i32* %limit, align 4
  %div128 = sdiv i32 %add127, %63
  store i32 %div128, i32* %count, align 4
  %64 = load i32, i32* @rl_ignore_completion_duplicates, align 4
  %cmp129 = icmp eq i32 %64, 0
  br i1 %cmp129, label %land.lhs.true131, label %if.end135

land.lhs.true131:                                 ; preds = %if.end125
  %65 = load i32, i32* @rl_sort_completion_matches, align 4
  %tobool132 = icmp ne i32 %65, 0
  br i1 %tobool132, label %if.then133, label %if.end135

if.then133:                                       ; preds = %land.lhs.true131
  %66 = load i8**, i8*** %matches.addr, align 4
  %add.ptr134 = getelementptr inbounds i8*, i8** %66, i32 1
  %67 = bitcast i8** %add.ptr134 to i8*
  %68 = load i32, i32* %len.addr, align 4
  call void @qsort(i8* %67, i32 %68, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @_rl_qsort_string_compare to i32 (i8*, i8*)*))
  br label %if.end135

if.end135:                                        ; preds = %if.then133, %land.lhs.true131, %if.end125
  %call136 = call i32 @rl_crlf()
  store i32 0, i32* %lines, align 4
  %69 = load i32, i32* @_rl_print_completions_horizontally, align 4
  %cmp137 = icmp eq i32 %69, 0
  br i1 %cmp137, label %if.then139, label %if.else209

if.then139:                                       ; preds = %if.end135
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc206, %if.then139
  %70 = load i32, i32* %i, align 4
  %71 = load i32, i32* %count, align 4
  %cmp140 = icmp sle i32 %70, %71
  br i1 %cmp140, label %for.body, label %for.end208

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  %72 = load i32, i32* %i, align 4
  store i32 %72, i32* %l, align 4
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc177, %for.body
  %73 = load i32, i32* %j, align 4
  %74 = load i32, i32* %limit, align 4
  %cmp143 = icmp slt i32 %73, %74
  br i1 %cmp143, label %for.body145, label %for.end179

for.body145:                                      ; preds = %for.cond142
  %75 = load i32, i32* %l, align 4
  %76 = load i32, i32* %len.addr, align 4
  %cmp146 = icmp sgt i32 %75, %76
  br i1 %cmp146, label %if.then152, label %lor.lhs.false148

lor.lhs.false148:                                 ; preds = %for.body145
  %77 = load i8**, i8*** %matches.addr, align 4
  %78 = load i32, i32* %l, align 4
  %arrayidx149 = getelementptr inbounds i8*, i8** %77, i32 %78
  %79 = load i8*, i8** %arrayidx149, align 4
  %cmp150 = icmp eq i8* %79, null
  br i1 %cmp150, label %if.then152, label %if.else153

if.then152:                                       ; preds = %lor.lhs.false148, %for.body145
  br label %for.end179

if.else153:                                       ; preds = %lor.lhs.false148
  %80 = load i8**, i8*** %matches.addr, align 4
  %81 = load i32, i32* %l, align 4
  %arrayidx154 = getelementptr inbounds i8*, i8** %80, i32 %81
  %82 = load i8*, i8** %arrayidx154, align 4
  %call155 = call i8* @printable_part(i8* %82)
  store i8* %call155, i8** %temp, align 4
  %83 = load i8*, i8** %temp, align 4
  %84 = load i8**, i8*** %matches.addr, align 4
  %85 = load i32, i32* %l, align 4
  %arrayidx156 = getelementptr inbounds i8*, i8** %84, i32 %85
  %86 = load i8*, i8** %arrayidx156, align 4
  %87 = load i32, i32* %sind, align 4
  %call157 = call i32 @print_filename(i8* %83, i8* %86, i32 %87)
  store i32 %call157, i32* %printed_len, align 4
  %88 = load i32, i32* %j, align 4
  %add158 = add nsw i32 %88, 1
  %89 = load i32, i32* %limit, align 4
  %cmp159 = icmp slt i32 %add158, %89
  br i1 %cmp159, label %if.then161, label %if.end174

if.then161:                                       ; preds = %if.else153
  %90 = load i32, i32* %max.addr, align 4
  %91 = load i32, i32* %printed_len, align 4
  %cmp162 = icmp sle i32 %90, %91
  br i1 %cmp162, label %if.then164, label %if.else166

if.then164:                                       ; preds = %if.then161
  %92 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call165 = call i32 @putc(i32 32, %struct._IO_FILE* %92)
  br label %if.end173

if.else166:                                       ; preds = %if.then161
  store i32 0, i32* %k, align 4
  br label %for.cond167

for.cond167:                                      ; preds = %for.inc, %if.else166
  %93 = load i32, i32* %k, align 4
  %94 = load i32, i32* %max.addr, align 4
  %95 = load i32, i32* %printed_len, align 4
  %sub168 = sub nsw i32 %94, %95
  %cmp169 = icmp slt i32 %93, %sub168
  br i1 %cmp169, label %for.body171, label %for.end

for.body171:                                      ; preds = %for.cond167
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call172 = call i32 @putc(i32 32, %struct._IO_FILE* %96)
  br label %for.inc

for.inc:                                          ; preds = %for.body171
  %97 = load i32, i32* %k, align 4
  %inc = add nsw i32 %97, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond167

for.end:                                          ; preds = %for.cond167
  br label %if.end173

if.end173:                                        ; preds = %for.end, %if.then164
  br label %if.end174

if.end174:                                        ; preds = %if.end173, %if.else153
  br label %if.end175

if.end175:                                        ; preds = %if.end174
  %98 = load i32, i32* %count, align 4
  %99 = load i32, i32* %l, align 4
  %add176 = add nsw i32 %99, %98
  store i32 %add176, i32* %l, align 4
  br label %for.inc177

for.inc177:                                       ; preds = %if.end175
  %100 = load i32, i32* %j, align 4
  %inc178 = add nsw i32 %100, 1
  store i32 %inc178, i32* %j, align 4
  br label %for.cond142

for.end179:                                       ; preds = %if.then152, %for.cond142
  %call180 = call i32 @rl_crlf()
  %101 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp181 = icmp ne i32 %101, 0
  br i1 %cmp181, label %land.lhs.true183, label %if.end189

land.lhs.true183:                                 ; preds = %for.end179
  %102 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp184 = icmp eq i32 %102, 28
  %conv185 = zext i1 %cmp184 to i32
  %cmp186 = icmp eq i32 %conv185, 0
  br i1 %cmp186, label %if.then188, label %if.end189

if.then188:                                       ; preds = %land.lhs.true183
  br label %if.end278

if.end189:                                        ; preds = %land.lhs.true183, %for.end179
  %103 = load i32, i32* %lines, align 4
  %inc190 = add nsw i32 %103, 1
  store i32 %inc190, i32* %lines, align 4
  %104 = load i32, i32* @_rl_page_completions, align 4
  %tobool191 = icmp ne i32 %104, 0
  br i1 %tobool191, label %land.lhs.true192, label %if.end205

land.lhs.true192:                                 ; preds = %if.end189
  %105 = load i32, i32* %lines, align 4
  %106 = load i32, i32* @_rl_screenheight, align 4
  %sub193 = sub nsw i32 %106, 1
  %cmp194 = icmp sge i32 %105, %sub193
  br i1 %cmp194, label %land.lhs.true196, label %if.end205

land.lhs.true196:                                 ; preds = %land.lhs.true192
  %107 = load i32, i32* %i, align 4
  %108 = load i32, i32* %count, align 4
  %cmp197 = icmp slt i32 %107, %108
  br i1 %cmp197, label %if.then199, label %if.end205

if.then199:                                       ; preds = %land.lhs.true196
  %109 = load i32, i32* %lines, align 4
  %call200 = call i32 @_rl_internal_pager(i32 %109)
  store i32 %call200, i32* %lines, align 4
  %110 = load i32, i32* %lines, align 4
  %cmp201 = icmp slt i32 %110, 0
  br i1 %cmp201, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.then199
  br label %if.end278

if.end204:                                        ; preds = %if.then199
  br label %if.end205

if.end205:                                        ; preds = %if.end204, %land.lhs.true196, %land.lhs.true192, %if.end189
  br label %for.inc206

for.inc206:                                       ; preds = %if.end205
  %111 = load i32, i32* %i, align 4
  %inc207 = add nsw i32 %111, 1
  store i32 %inc207, i32* %i, align 4
  br label %for.cond

for.end208:                                       ; preds = %for.cond
  br label %if.end278

if.else209:                                       ; preds = %if.end135
  store i32 1, i32* %i, align 4
  br label %for.cond210

for.cond210:                                      ; preds = %for.inc274, %if.else209
  %112 = load i8**, i8*** %matches.addr, align 4
  %113 = load i32, i32* %i, align 4
  %arrayidx211 = getelementptr inbounds i8*, i8** %112, i32 %113
  %114 = load i8*, i8** %arrayidx211, align 4
  %tobool212 = icmp ne i8* %114, null
  br i1 %tobool212, label %for.body213, label %for.end276

for.body213:                                      ; preds = %for.cond210
  %115 = load i8**, i8*** %matches.addr, align 4
  %116 = load i32, i32* %i, align 4
  %arrayidx214 = getelementptr inbounds i8*, i8** %115, i32 %116
  %117 = load i8*, i8** %arrayidx214, align 4
  %call215 = call i8* @printable_part(i8* %117)
  store i8* %call215, i8** %temp, align 4
  %118 = load i8*, i8** %temp, align 4
  %119 = load i8**, i8*** %matches.addr, align 4
  %120 = load i32, i32* %i, align 4
  %arrayidx216 = getelementptr inbounds i8*, i8** %119, i32 %120
  %121 = load i8*, i8** %arrayidx216, align 4
  %122 = load i32, i32* %sind, align 4
  %call217 = call i32 @print_filename(i8* %118, i8* %121, i32 %122)
  store i32 %call217, i32* %printed_len, align 4
  %123 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp218 = icmp ne i32 %123, 0
  br i1 %cmp218, label %land.lhs.true220, label %if.end226

land.lhs.true220:                                 ; preds = %for.body213
  %124 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp221 = icmp eq i32 %124, 28
  %conv222 = zext i1 %cmp221 to i32
  %cmp223 = icmp eq i32 %conv222, 0
  br i1 %cmp223, label %if.then225, label %if.end226

if.then225:                                       ; preds = %land.lhs.true220
  br label %if.end278

if.end226:                                        ; preds = %land.lhs.true220, %for.body213
  %125 = load i8**, i8*** %matches.addr, align 4
  %126 = load i32, i32* %i, align 4
  %add227 = add nsw i32 %126, 1
  %arrayidx228 = getelementptr inbounds i8*, i8** %125, i32 %add227
  %127 = load i8*, i8** %arrayidx228, align 4
  %tobool229 = icmp ne i8* %127, null
  br i1 %tobool229, label %if.then230, label %if.end273

if.then230:                                       ; preds = %if.end226
  %128 = load i32, i32* %limit, align 4
  %cmp231 = icmp eq i32 %128, 1
  br i1 %cmp231, label %if.then241, label %lor.lhs.false233

lor.lhs.false233:                                 ; preds = %if.then230
  %129 = load i32, i32* %i, align 4
  %tobool234 = icmp ne i32 %129, 0
  br i1 %tobool234, label %land.lhs.true235, label %if.else256

land.lhs.true235:                                 ; preds = %lor.lhs.false233
  %130 = load i32, i32* %limit, align 4
  %cmp236 = icmp sgt i32 %130, 1
  br i1 %cmp236, label %land.lhs.true238, label %if.else256

land.lhs.true238:                                 ; preds = %land.lhs.true235
  %131 = load i32, i32* %i, align 4
  %132 = load i32, i32* %limit, align 4
  %rem = srem i32 %131, %132
  %cmp239 = icmp eq i32 %rem, 0
  br i1 %cmp239, label %if.then241, label %if.else256

if.then241:                                       ; preds = %land.lhs.true238, %if.then230
  %call242 = call i32 @rl_crlf()
  %133 = load i32, i32* %lines, align 4
  %inc243 = add nsw i32 %133, 1
  store i32 %inc243, i32* %lines, align 4
  %134 = load i32, i32* @_rl_page_completions, align 4
  %tobool244 = icmp ne i32 %134, 0
  br i1 %tobool244, label %land.lhs.true245, label %if.end255

land.lhs.true245:                                 ; preds = %if.then241
  %135 = load i32, i32* %lines, align 4
  %136 = load i32, i32* @_rl_screenheight, align 4
  %sub246 = sub nsw i32 %136, 1
  %cmp247 = icmp sge i32 %135, %sub246
  br i1 %cmp247, label %if.then249, label %if.end255

if.then249:                                       ; preds = %land.lhs.true245
  %137 = load i32, i32* %lines, align 4
  %call250 = call i32 @_rl_internal_pager(i32 %137)
  store i32 %call250, i32* %lines, align 4
  %138 = load i32, i32* %lines, align 4
  %cmp251 = icmp slt i32 %138, 0
  br i1 %cmp251, label %if.then253, label %if.end254

if.then253:                                       ; preds = %if.then249
  br label %if.end278

if.end254:                                        ; preds = %if.then249
  br label %if.end255

if.end255:                                        ; preds = %if.end254, %land.lhs.true245, %if.then241
  br label %if.end272

if.else256:                                       ; preds = %land.lhs.true238, %land.lhs.true235, %lor.lhs.false233
  %139 = load i32, i32* %max.addr, align 4
  %140 = load i32, i32* %printed_len, align 4
  %cmp257 = icmp sle i32 %139, %140
  br i1 %cmp257, label %if.then259, label %if.else261

if.then259:                                       ; preds = %if.else256
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call260 = call i32 @putc(i32 32, %struct._IO_FILE* %141)
  br label %if.end271

if.else261:                                       ; preds = %if.else256
  store i32 0, i32* %k, align 4
  br label %for.cond262

for.cond262:                                      ; preds = %for.inc268, %if.else261
  %142 = load i32, i32* %k, align 4
  %143 = load i32, i32* %max.addr, align 4
  %144 = load i32, i32* %printed_len, align 4
  %sub263 = sub nsw i32 %143, %144
  %cmp264 = icmp slt i32 %142, %sub263
  br i1 %cmp264, label %for.body266, label %for.end270

for.body266:                                      ; preds = %for.cond262
  %145 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call267 = call i32 @putc(i32 32, %struct._IO_FILE* %145)
  br label %for.inc268

for.inc268:                                       ; preds = %for.body266
  %146 = load i32, i32* %k, align 4
  %inc269 = add nsw i32 %146, 1
  store i32 %inc269, i32* %k, align 4
  br label %for.cond262

for.end270:                                       ; preds = %for.cond262
  br label %if.end271

if.end271:                                        ; preds = %for.end270, %if.then259
  br label %if.end272

if.end272:                                        ; preds = %if.end271, %if.end255
  br label %if.end273

if.end273:                                        ; preds = %if.end272, %if.end226
  br label %for.inc274

for.inc274:                                       ; preds = %if.end273
  %147 = load i32, i32* %i, align 4
  %inc275 = add nsw i32 %147, 1
  store i32 %inc275, i32* %i, align 4
  br label %for.cond210

for.end276:                                       ; preds = %for.cond210
  %call277 = call i32 @rl_crlf()
  br label %if.end278

if.end278:                                        ; preds = %if.then188, %if.then203, %if.then225, %if.then253, %for.end276, %for.end208
  ret void
}

; Function Attrs: noinline nounwind
define internal i8* @printable_part(i8* %pathname) #0 {
entry:
  %retval = alloca i8*, align 4
  %pathname.addr = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %x = alloca i8*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %0 = load i32, i32* @rl_filename_completion_desired, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %pathname.addr, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %pathname.addr, align 4
  %call = call i8* @strrchr(i8* %2, i32 47)
  store i8* %call, i8** %temp, align 4
  %3 = load i8*, i8** %temp, align 4
  %cmp1 = icmp eq i8* %3, null
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load i8*, i8** %temp, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  %6 = load i8*, i8** %pathname.addr, align 4
  store i8* %6, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  %7 = load i8*, i8** %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %land.lhs.true, label %if.else11

land.lhs.true:                                    ; preds = %if.else
  %9 = load i8*, i8** %temp, align 4
  %10 = load i8*, i8** %pathname.addr, align 4
  %cmp8 = icmp eq i8* %9, %10
  br i1 %cmp8, label %if.then10, label %if.else11

if.then10:                                        ; preds = %land.lhs.true
  %11 = load i8*, i8** %pathname.addr, align 4
  store i8* %11, i8** %retval, align 4
  br label %return

if.else11:                                        ; preds = %land.lhs.true, %if.else
  %12 = load i8*, i8** %temp, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %12, i32 1
  %13 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %13 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.else28

if.then16:                                        ; preds = %if.else11
  %14 = load i8*, i8** %temp, align 4
  %add.ptr = getelementptr inbounds i8, i8* %14, i32 -1
  store i8* %add.ptr, i8** %x, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then16
  %15 = load i8*, i8** %x, align 4
  %16 = load i8*, i8** %pathname.addr, align 4
  %cmp17 = icmp ugt i8* %15, %16
  br i1 %cmp17, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i8*, i8** %x, align 4
  %18 = load i8, i8* %17, align 1
  %conv19 = sext i8 %18 to i32
  %cmp20 = icmp eq i32 %conv19, 47
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %for.body
  br label %for.end

if.end23:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %19 = load i8*, i8** %x, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %19, i32 -1
  store i8* %incdec.ptr, i8** %x, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then22, %for.cond
  %20 = load i8*, i8** %x, align 4
  %21 = load i8, i8* %20, align 1
  %conv24 = sext i8 %21 to i32
  %cmp25 = icmp eq i32 %conv24, 47
  br i1 %cmp25, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %22 = load i8*, i8** %x, align 4
  %add.ptr27 = getelementptr inbounds i8, i8* %22, i32 1
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %23 = load i8*, i8** %pathname.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %add.ptr27, %cond.true ], [ %23, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

if.else28:                                        ; preds = %if.else11
  %24 = load i8*, i8** %temp, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr29, i8** %temp, align 4
  store i8* %incdec.ptr29, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else28, %cond.end, %if.then10, %if.then4, %if.then
  %25 = load i8*, i8** %retval, align 4
  ret i8* %25
}

declare i8* @strrchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @fnwidth(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %width = alloca i32, align 4
  %pos = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %left = alloca i32, align 4
  %w = alloca i32, align 4
  %clen = alloca i32, align 4
  %wc = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 1
  store i32 %add, i32* %left, align 4
  %1 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %pos, align 4
  store i32 0, i32* %width, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end32, %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %pos, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %pos, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp slt i32 %conv, 32
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %while.body
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load i32, i32* %pos, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %10 to i32
  %and = and i32 %conv4, 128
  %cmp5 = icmp eq i32 %and, 0
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %while.body
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %pos, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %13 to i32
  %cmp9 = icmp eq i32 %conv8, 127
  br i1 %cmp9, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %14 = load i32, i32* %width, align 4
  %add11 = add nsw i32 %14, 2
  store i32 %add11, i32* %width, align 4
  %15 = load i32, i32* %pos, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %pos, align 4
  br label %if.end32

if.else:                                          ; preds = %lor.lhs.false
  %16 = load i8*, i8** %string.addr, align 4
  %17 = load i32, i32* %pos, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i32, i32* %left, align 4
  %19 = load i32, i32* %pos, align 4
  %sub = sub nsw i32 %18, %19
  %call12 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %ps)
  store i32 %call12, i32* %clen, align 4
  %20 = load i32, i32* %clen, align 4
  %cmp13 = icmp eq i32 %20, -1
  br i1 %cmp13, label %if.then18, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.else
  %21 = load i32, i32* %clen, align 4
  %cmp16 = icmp eq i32 %21, -2
  br i1 %cmp16, label %if.then18, label %if.else21

if.then18:                                        ; preds = %lor.lhs.false15, %if.else
  %22 = load i32, i32* %width, align 4
  %inc19 = add nsw i32 %22, 1
  store i32 %inc19, i32* %width, align 4
  %23 = load i32, i32* %pos, align 4
  %inc20 = add nsw i32 %23, 1
  store i32 %inc20, i32* %pos, align 4
  %24 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %24, i8 0, i32 8, i32 4, i1 false)
  br label %if.end31

if.else21:                                        ; preds = %lor.lhs.false15
  %25 = load i32, i32* %clen, align 4
  %cmp22 = icmp eq i32 %25, 0
  br i1 %cmp22, label %if.then24, label %if.else25

if.then24:                                        ; preds = %if.else21
  br label %while.end

if.else25:                                        ; preds = %if.else21
  %26 = load i32, i32* %clen, align 4
  %27 = load i32, i32* %pos, align 4
  %add26 = add i32 %27, %26
  store i32 %add26, i32* %pos, align 4
  %28 = load i32, i32* %wc, align 4
  %call27 = call i32 @_rl_wcwidth(i32 %28)
  store i32 %call27, i32* %w, align 4
  %29 = load i32, i32* %w, align 4
  %cmp28 = icmp sge i32 %29, 0
  br i1 %cmp28, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else25
  %30 = load i32, i32* %w, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else25
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %30, %cond.true ], [ 1, %cond.false ]
  %31 = load i32, i32* %width, align 4
  %add30 = add nsw i32 %31, %cond
  store i32 %add30, i32* %width, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end
  br label %if.end31

if.end31:                                         ; preds = %if.end, %if.then18
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then
  br label %while.cond

while.end:                                        ; preds = %if.then24, %while.cond
  %32 = load i32, i32* %width, align 4
  ret i32 %32
}

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @complete_get_screenwidth() #0 {
entry:
  %retval = alloca i32, align 4
  %cols = alloca i32, align 4
  %envcols = alloca i8*, align 4
  %0 = load i32, i32* @_rl_completion_columns, align 4
  store i32 %0, i32* %cols, align 4
  %1 = load i32, i32* %cols, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %cols, align 4
  %3 = load i32, i32* @_rl_screenwidth, align 4
  %cmp1 = icmp sle i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %cols, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %call = call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call, i8** %envcols, align 4
  %5 = load i8*, i8** %envcols, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.lhs.true2, label %if.end6

land.lhs.true2:                                   ; preds = %if.end
  %6 = load i8*, i8** %envcols, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %land.lhs.true2
  %8 = load i8*, i8** %envcols, align 4
  %call5 = call i32 @atoi(i8* %8)
  store i32 %call5, i32* %cols, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %land.lhs.true2, %if.end
  %9 = load i32, i32* %cols, align 4
  %cmp7 = icmp sge i32 %9, 0
  br i1 %cmp7, label %land.lhs.true9, label %if.end13

land.lhs.true9:                                   ; preds = %if.end6
  %10 = load i32, i32* %cols, align 4
  %11 = load i32, i32* @_rl_screenwidth, align 4
  %cmp10 = icmp sle i32 %10, %11
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true9
  %12 = load i32, i32* %cols, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %land.lhs.true9, %if.end6
  %13 = load i32, i32* @_rl_screenwidth, align 4
  store i32 %13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then12, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

declare i32 @_rl_qsort_string_compare(i8**, i8**) #1

declare i32 @rl_crlf() #1

; Function Attrs: noinline nounwind
define internal i32 @print_filename(i8* %to_print, i8* %full_pathname, i32 %prefix_bytes) #0 {
entry:
  %to_print.addr = alloca i8*, align 4
  %full_pathname.addr = alloca i8*, align 4
  %prefix_bytes.addr = alloca i32, align 4
  %printed_len = alloca i32, align 4
  %extension_char = alloca i32, align 4
  %slen = alloca i32, align 4
  %tlen = alloca i32, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  %new_full_pathname = alloca i8*, align 4
  %dn = alloca i8*, align 4
  store i8* %to_print, i8** %to_print.addr, align 4
  store i8* %full_pathname, i8** %full_pathname.addr, align 4
  store i32 %prefix_bytes, i32* %prefix_bytes.addr, align 4
  store i32 0, i32* %extension_char, align 4
  %0 = load i32, i32* @_rl_colored_stats, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @rl_filename_completion_desired, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i8*, i8** %to_print.addr, align 4
  %3 = load i32, i32* %prefix_bytes.addr, align 4
  %4 = load i8*, i8** %to_print.addr, align 4
  %call = call i32 @fnprint(i8* %2, i32 %3, i8* %4)
  store i32 %call, i32* %printed_len, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %5 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.lhs.true, label %if.end114

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* @rl_visible_stats, align 4
  %tobool2 = icmp ne i32 %6, 0
  br i1 %tobool2, label %if.then7, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %land.lhs.true
  %7 = load i32, i32* @_rl_colored_stats, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %if.then7, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false3
  %8 = load i32, i32* @_rl_complete_mark_directories, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %if.then7, label %if.end114

if.then7:                                         ; preds = %lor.lhs.false5, %lor.lhs.false3, %land.lhs.true
  %9 = load i8*, i8** %to_print.addr, align 4
  %10 = load i8*, i8** %full_pathname.addr, align 4
  %cmp8 = icmp ne i8* %9, %10
  br i1 %cmp8, label %if.then9, label %if.else92

if.then9:                                         ; preds = %if.then7
  %11 = load i8*, i8** %to_print.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %11, i32 -1
  %12 = load i8, i8* %arrayidx, align 1
  store i8 %12, i8* %c, align 1
  %13 = load i8*, i8** %to_print.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %13, i32 -1
  store i8 0, i8* %arrayidx10, align 1
  %14 = load i8*, i8** %full_pathname.addr, align 4
  %cmp11 = icmp eq i8* %14, null
  br i1 %cmp11, label %if.then15, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %if.then9
  %15 = load i8*, i8** %full_pathname.addr, align 4
  %16 = load i8, i8* %15, align 1
  %conv = sext i8 %16 to i32
  %cmp13 = icmp eq i32 %conv, 0
  br i1 %cmp13, label %if.then15, label %if.else

if.then15:                                        ; preds = %lor.lhs.false12, %if.then9
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %dn, align 4
  br label %if.end42

if.else:                                          ; preds = %lor.lhs.false12
  %17 = load i8*, i8** %full_pathname.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %18 to i32
  %cmp18 = icmp ne i32 %conv17, 47
  br i1 %cmp18, label %if.then20, label %if.else21

if.then20:                                        ; preds = %if.else
  %19 = load i8*, i8** %full_pathname.addr, align 4
  store i8* %19, i8** %dn, align 4
  br label %if.end41

if.else21:                                        ; preds = %if.else
  %20 = load i8*, i8** %full_pathname.addr, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %20, i32 1
  %21 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %21 to i32
  %cmp24 = icmp eq i32 %conv23, 0
  br i1 %cmp24, label %if.then26, label %if.else27

if.then26:                                        ; preds = %if.else21
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8** %dn, align 4
  br label %if.end40

if.else27:                                        ; preds = %if.else21
  %22 = load i8*, i8** %full_pathname.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %23 to i32
  %cmp30 = icmp eq i32 %conv29, 47
  br i1 %cmp30, label %land.lhs.true32, label %if.else38

land.lhs.true32:                                  ; preds = %if.else27
  %24 = load i8*, i8** %full_pathname.addr, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %24, i32 2
  %25 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %25 to i32
  %cmp35 = icmp eq i32 %conv34, 0
  br i1 %cmp35, label %if.then37, label %if.else38

if.then37:                                        ; preds = %land.lhs.true32
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8** %dn, align 4
  br label %if.end39

if.else38:                                        ; preds = %land.lhs.true32, %if.else27
  %26 = load i8*, i8** %full_pathname.addr, align 4
  store i8* %26, i8** %dn, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.then37
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then26
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then20
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then15
  %27 = load i8*, i8** %dn, align 4
  %call43 = call i8* @tilde_expand(i8* %27)
  store i8* %call43, i8** %s, align 4
  %28 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %tobool44 = icmp ne i32 (i8**)* %28, null
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end42
  %29 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %call46 = call i32 %29(i8** %s)
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end42
  %30 = load i8*, i8** %s, align 4
  %call48 = call i32 @strlen(i8* %30)
  store i32 %call48, i32* %slen, align 4
  %31 = load i8*, i8** %to_print.addr, align 4
  %call49 = call i32 @strlen(i8* %31)
  store i32 %call49, i32* %tlen, align 4
  %32 = load i32, i32* %slen, align 4
  %33 = load i32, i32* %tlen, align 4
  %add = add nsw i32 %32, %33
  %add50 = add nsw i32 %add, 2
  %call51 = call i8* @xmalloc(i32 %add50)
  store i8* %call51, i8** %new_full_pathname, align 4
  %34 = load i8*, i8** %new_full_pathname, align 4
  %35 = load i8*, i8** %s, align 4
  %call52 = call i8* @strcpy(i8* %34, i8* %35)
  %36 = load i8*, i8** %s, align 4
  %37 = load i32, i32* %slen, align 4
  %sub = sub nsw i32 %37, 1
  %arrayidx53 = getelementptr inbounds i8, i8* %36, i32 %sub
  %38 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %38 to i32
  %cmp55 = icmp eq i32 %conv54, 47
  br i1 %cmp55, label %if.then57, label %if.else58

if.then57:                                        ; preds = %if.end47
  %39 = load i32, i32* %slen, align 4
  %dec = add nsw i32 %39, -1
  store i32 %dec, i32* %slen, align 4
  br label %if.end60

if.else58:                                        ; preds = %if.end47
  %40 = load i8*, i8** %new_full_pathname, align 4
  %41 = load i32, i32* %slen, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8 47, i8* %arrayidx59, align 1
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.then57
  %42 = load i8*, i8** %new_full_pathname, align 4
  %43 = load i32, i32* %slen, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %42, i32 %43
  store i8 47, i8* %arrayidx61, align 1
  %44 = load i8*, i8** %new_full_pathname, align 4
  %45 = load i32, i32* %slen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %44, i32 %45
  %add.ptr62 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  %46 = load i8*, i8** %to_print.addr, align 4
  %call63 = call i8* @strcpy(i8* %add.ptr62, i8* %46)
  %47 = load i32, i32* @rl_visible_stats, align 4
  %tobool64 = icmp ne i32 %47, 0
  br i1 %tobool64, label %if.then65, label %if.else67

if.then65:                                        ; preds = %if.end60
  %48 = load i8*, i8** %new_full_pathname, align 4
  %call66 = call i32 @stat_char(i8* %48)
  store i32 %call66, i32* %extension_char, align 4
  br label %if.end86

if.else67:                                        ; preds = %if.end60
  %49 = load i32, i32* @_rl_complete_mark_directories, align 4
  %tobool68 = icmp ne i32 %49, 0
  br i1 %tobool68, label %if.then69, label %if.end85

if.then69:                                        ; preds = %if.else67
  store i8* null, i8** %dn, align 4
  %50 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %cmp70 = icmp eq i32 (i8**)* %50, null
  br i1 %cmp70, label %land.lhs.true72, label %if.end80

land.lhs.true72:                                  ; preds = %if.then69
  %51 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %tobool73 = icmp ne i32 (i8**)* %51, null
  br i1 %tobool73, label %if.then74, label %if.end80

if.then74:                                        ; preds = %land.lhs.true72
  %52 = load i8*, i8** %new_full_pathname, align 4
  %call75 = call i32 @strlen(i8* %52)
  %add76 = add i32 1, %call75
  %call77 = call i8* @xmalloc(i32 %add76)
  %53 = load i8*, i8** %new_full_pathname, align 4
  %call78 = call i8* @strcpy(i8* %call77, i8* %53)
  store i8* %call78, i8** %dn, align 4
  %54 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %call79 = call i32 %54(i8** %dn)
  %55 = load i8*, i8** %new_full_pathname, align 4
  call void @xfree(i8* %55)
  %56 = load i8*, i8** %dn, align 4
  store i8* %56, i8** %new_full_pathname, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.then74, %land.lhs.true72, %if.then69
  %57 = load i8*, i8** %new_full_pathname, align 4
  %call81 = call i32 @path_isdir(i8* %57)
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  store i32 47, i32* %extension_char, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.then83, %if.end80
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.else67
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.then65
  %58 = load i32, i32* @_rl_colored_stats, align 4
  %tobool87 = icmp ne i32 %58, 0
  br i1 %tobool87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.end86
  %59 = load i8*, i8** %to_print.addr, align 4
  %60 = load i32, i32* %prefix_bytes.addr, align 4
  %61 = load i8*, i8** %new_full_pathname, align 4
  %call89 = call i32 @fnprint(i8* %59, i32 %60, i8* %61)
  store i32 %call89, i32* %printed_len, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.end86
  %62 = load i8*, i8** %new_full_pathname, align 4
  call void @xfree(i8* %62)
  %63 = load i8, i8* %c, align 1
  %64 = load i8*, i8** %to_print.addr, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %64, i32 -1
  store i8 %63, i8* %arrayidx91, align 1
  br label %if.end109

if.else92:                                        ; preds = %if.then7
  %65 = load i8*, i8** %full_pathname.addr, align 4
  %call93 = call i8* @tilde_expand(i8* %65)
  store i8* %call93, i8** %s, align 4
  %66 = load i32, i32* @rl_visible_stats, align 4
  %tobool94 = icmp ne i32 %66, 0
  br i1 %tobool94, label %if.then95, label %if.else97

if.then95:                                        ; preds = %if.else92
  %67 = load i8*, i8** %s, align 4
  %call96 = call i32 @stat_char(i8* %67)
  store i32 %call96, i32* %extension_char, align 4
  br label %if.end104

if.else97:                                        ; preds = %if.else92
  %68 = load i32, i32* @_rl_complete_mark_directories, align 4
  %tobool98 = icmp ne i32 %68, 0
  br i1 %tobool98, label %land.lhs.true99, label %if.end103

land.lhs.true99:                                  ; preds = %if.else97
  %69 = load i8*, i8** %s, align 4
  %call100 = call i32 @path_isdir(i8* %69)
  %tobool101 = icmp ne i32 %call100, 0
  br i1 %tobool101, label %if.then102, label %if.end103

if.then102:                                       ; preds = %land.lhs.true99
  store i32 47, i32* %extension_char, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.then102, %land.lhs.true99, %if.else97
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.then95
  %70 = load i32, i32* @_rl_colored_stats, align 4
  %tobool105 = icmp ne i32 %70, 0
  br i1 %tobool105, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.end104
  %71 = load i8*, i8** %to_print.addr, align 4
  %72 = load i32, i32* %prefix_bytes.addr, align 4
  %73 = load i8*, i8** %s, align 4
  %call107 = call i32 @fnprint(i8* %71, i32 %72, i8* %73)
  store i32 %call107, i32* %printed_len, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.end104
  br label %if.end109

if.end109:                                        ; preds = %if.end108, %if.end90
  %74 = load i8*, i8** %s, align 4
  call void @xfree(i8* %74)
  %75 = load i32, i32* %extension_char, align 4
  %tobool110 = icmp ne i32 %75, 0
  br i1 %tobool110, label %if.then111, label %if.end113

if.then111:                                       ; preds = %if.end109
  %76 = load i32, i32* %extension_char, align 4
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call112 = call i32 @putc(i32 %76, %struct._IO_FILE* %77)
  %78 = load i32, i32* %printed_len, align 4
  %inc = add nsw i32 %78, 1
  store i32 %inc, i32* %printed_len, align 4
  br label %if.end113

if.end113:                                        ; preds = %if.then111, %if.end109
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %lor.lhs.false5, %if.end
  %79 = load i32, i32* %printed_len, align 4
  ret i32 %79
}

declare i32 @putc(i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_internal_pager(i32 %lines) #0 {
entry:
  %retval = alloca i32, align 4
  %lines.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %lines, i32* %lines.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call1 = call i32 @fflush(%struct._IO_FILE* %1)
  %call2 = call i32 @get_y_or_n(i32 1)
  store i32 %call2, i32* %i, align 4
  call void @_rl_erase_entire_line()
  %2 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %i, align 4
  %cmp3 = icmp eq i32 %3, 2
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  %4 = load i32, i32* %lines.addr, align 4
  %sub = sub nsw i32 %4, 1
  store i32 %sub, i32* %retval, align 4
  br label %return

if.else5:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else5, %if.then4, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define void @_rl_free_match_list(i8** %matches) #0 {
entry:
  %matches.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  %0 = load i8**, i8*** %matches.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8**, i8*** %matches.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8**, i8*** %matches.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx1, align 4
  call void @xfree(i8* %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i8**, i8*** %matches.addr, align 4
  %9 = bitcast i8** %8 to i8*
  call void @xfree(i8* %9)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define internal void @set_completion_defaults(i32 %what_to_do) #0 {
entry:
  %what_to_do.addr = alloca i32, align 4
  store i32 %what_to_do, i32* %what_to_do.addr, align 4
  store i32 0, i32* @rl_filename_completion_desired, align 4
  store i32 1, i32* @rl_filename_quoting_desired, align 4
  %0 = load i32, i32* %what_to_do.addr, align 4
  store i32 %0, i32* @rl_completion_type, align 4
  store i32 0, i32* @rl_completion_suppress_quote, align 4
  store i32 0, i32* @rl_completion_suppress_append, align 4
  store i32 32, i32* @rl_completion_append_character, align 4
  %1 = load i32, i32* @_rl_complete_mark_symlink_dirs, align 4
  store i32 %1, i32* @rl_completion_mark_symlink_dirs, align 4
  store i32 0, i32* @_rl_complete_display_matches_interrupt, align 4
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind
define i8* @rl_filename_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  %dentry = alloca i8*, align 4
  %convfn = alloca i8*, align 4
  %dirlen = alloca i32, align 4
  %dentlen = alloca i32, align 4
  %convlen = alloca i32, align 4
  %tilde_dirname = alloca i32, align 4
  %entry1 = alloca %struct.dirent*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end84

if.then:                                          ; preds = %entry
  %1 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %tobool = icmp ne %struct.__dirstream* %1, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %call = call i32 @closedir(%struct.__dirstream* %2)
  store %struct.__dirstream* null, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %tobool3 = icmp ne i8* %3, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %4 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  call void @free(i8* %4)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %5 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %tobool6 = icmp ne i8* %5, null
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  %6 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  call void @free(i8* %6)
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  %7 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %tobool9 = icmp ne i8* %7, null
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  %8 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  call void @free(i8* %8)
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  %9 = load i8*, i8** %text.addr, align 4
  %call12 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call12
  %call13 = call i8* @xmalloc(i32 %add)
  %10 = load i8*, i8** %text.addr, align 4
  %call14 = call i8* @strcpy(i8* %call13, i8* %10)
  store i8* %call14, i8** @rl_filename_completion_function.filename, align 4
  %11 = load i8*, i8** %text.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv = sext i8 %12 to i32
  %cmp15 = icmp eq i32 %conv, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end11
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8** %text.addr, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end11
  %13 = load i8*, i8** %text.addr, align 4
  %call19 = call i32 @strlen(i8* %13)
  %add20 = add i32 1, %call19
  %call21 = call i8* @xmalloc(i32 %add20)
  %14 = load i8*, i8** %text.addr, align 4
  %call22 = call i8* @strcpy(i8* %call21, i8* %14)
  store i8* %call22, i8** @rl_filename_completion_function.dirname, align 4
  %15 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call23 = call i8* @strrchr(i8* %15, i32 47)
  store i8* %call23, i8** %temp, align 4
  %16 = load i8*, i8** %temp, align 4
  %tobool24 = icmp ne i8* %16, null
  br i1 %tobool24, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.end18
  %17 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %18 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  %call26 = call i8* @strcpy(i8* %17, i8* %incdec.ptr)
  %19 = load i8*, i8** %temp, align 4
  store i8 0, i8* %19, align 1
  br label %if.end28

if.else:                                          ; preds = %if.end18
  %20 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %20, i32 0
  store i8 46, i8* %arrayidx, align 1
  %21 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %21, i32 1
  store i8 0, i8* %arrayidx27, align 1
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  %22 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool29 = icmp ne i32 %22, 0
  br i1 %tobool29, label %land.lhs.true, label %if.else33

land.lhs.true:                                    ; preds = %if.end28
  %23 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool30 = icmp ne i8* (i8*, i32)* %23, null
  br i1 %tobool30, label %if.then31, label %if.else33

if.then31:                                        ; preds = %land.lhs.true
  %24 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %25 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %26 = load i32, i32* @rl_completion_quote_character, align 4
  %call32 = call i8* %24(i8* %25, i32 %26)
  store i8* %call32, i8** @rl_filename_completion_function.users_dirname, align 4
  br label %if.end38

if.else33:                                        ; preds = %land.lhs.true, %if.end28
  %27 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call34 = call i32 @strlen(i8* %27)
  %add35 = add i32 1, %call34
  %call36 = call i8* @xmalloc(i32 %add35)
  %28 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call37 = call i8* @strcpy(i8* %call36, i8* %28)
  store i8* %call37, i8** @rl_filename_completion_function.users_dirname, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else33, %if.then31
  store i32 0, i32* %tilde_dirname, align 4
  %29 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %30 = load i8, i8* %29, align 1
  %conv39 = sext i8 %30 to i32
  %cmp40 = icmp eq i32 %conv39, 126
  br i1 %cmp40, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.end38
  %31 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call43 = call i8* @tilde_expand(i8* %31)
  store i8* %call43, i8** %temp, align 4
  %32 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  call void @xfree(i8* %32)
  %33 = load i8*, i8** %temp, align 4
  store i8* %33, i8** @rl_filename_completion_function.dirname, align 4
  store i32 1, i32* %tilde_dirname, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.end38
  %34 = load i32 (i8**)*, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  %tobool45 = icmp ne i32 (i8**)* %34, null
  br i1 %tobool45, label %if.then46, label %if.else48

if.then46:                                        ; preds = %if.end44
  %35 = load i32 (i8**)*, i32 (i8**)** @rl_directory_rewrite_hook, align 4
  %call47 = call i32 %35(i8** @rl_filename_completion_function.dirname)
  br label %if.end72

if.else48:                                        ; preds = %if.end44
  %36 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %tobool49 = icmp ne i32 (i8**)* %36, null
  br i1 %tobool49, label %land.lhs.true50, label %if.else58

land.lhs.true50:                                  ; preds = %if.else48
  %37 = load i32 (i8**)*, i32 (i8**)** @rl_directory_completion_hook, align 4
  %call51 = call i32 %37(i8** @rl_filename_completion_function.dirname)
  %tobool52 = icmp ne i32 %call51, 0
  br i1 %tobool52, label %if.then53, label %if.else58

if.then53:                                        ; preds = %land.lhs.true50
  %38 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  call void @xfree(i8* %38)
  %39 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call54 = call i32 @strlen(i8* %39)
  %add55 = add i32 1, %call54
  %call56 = call i8* @xmalloc(i32 %add55)
  %40 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call57 = call i8* @strcpy(i8* %call56, i8* %40)
  store i8* %call57, i8** @rl_filename_completion_function.users_dirname, align 4
  br label %if.end71

if.else58:                                        ; preds = %land.lhs.true50, %if.else48
  %41 = load i32, i32* %tilde_dirname, align 4
  %cmp59 = icmp eq i32 %41, 0
  br i1 %cmp59, label %land.lhs.true61, label %if.end70

land.lhs.true61:                                  ; preds = %if.else58
  %42 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool62 = icmp ne i32 %42, 0
  br i1 %tobool62, label %land.lhs.true63, label %if.end70

land.lhs.true63:                                  ; preds = %land.lhs.true61
  %43 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool64 = icmp ne i8* (i8*, i32)* %43, null
  br i1 %tobool64, label %if.then65, label %if.end70

if.then65:                                        ; preds = %land.lhs.true63
  %44 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  call void @xfree(i8* %44)
  %45 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %call66 = call i32 @strlen(i8* %45)
  %add67 = add i32 1, %call66
  %call68 = call i8* @xmalloc(i32 %add67)
  %46 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %call69 = call i8* @strcpy(i8* %call68, i8* %46)
  store i8* %call69, i8** @rl_filename_completion_function.dirname, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then65, %land.lhs.true63, %land.lhs.true61, %if.else58
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %if.then53
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %if.then46
  %47 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call73 = call %struct.__dirstream* @opendir(i8* %47)
  store %struct.__dirstream* %call73, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %48 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %49 = load i8, i8* %48, align 1
  %conv74 = sext i8 %49 to i32
  %tobool75 = icmp ne i32 %conv74, 0
  br i1 %tobool75, label %land.lhs.true76, label %if.end82

land.lhs.true76:                                  ; preds = %if.end72
  %50 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool77 = icmp ne i32 %50, 0
  br i1 %tobool77, label %land.lhs.true78, label %if.end82

land.lhs.true78:                                  ; preds = %land.lhs.true76
  %51 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool79 = icmp ne i8* (i8*, i32)* %51, null
  br i1 %tobool79, label %if.then80, label %if.end82

if.then80:                                        ; preds = %land.lhs.true78
  %52 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %53 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %54 = load i32, i32* @rl_completion_quote_character, align 4
  %call81 = call i8* %52(i8* %53, i32 %54)
  store i8* %call81, i8** %temp, align 4
  %55 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  call void @xfree(i8* %55)
  %56 = load i8*, i8** %temp, align 4
  store i8* %56, i8** @rl_filename_completion_function.filename, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then80, %land.lhs.true78, %land.lhs.true76, %if.end72
  %57 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %call83 = call i32 @strlen(i8* %57)
  store i32 %call83, i32* @rl_filename_completion_function.filename_len, align 4
  store i32 1, i32* @rl_filename_completion_desired, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.end82, %entry
  store %struct.dirent* null, %struct.dirent** %entry1, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end133, %if.then108, %if.end84
  %58 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %tobool85 = icmp ne %struct.__dirstream* %58, null
  br i1 %tobool85, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %59 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %call86 = call %struct.dirent* @readdir(%struct.__dirstream* %59)
  store %struct.dirent* %call86, %struct.dirent** %entry1, align 4
  %tobool87 = icmp ne %struct.dirent* %call86, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %60 = phi i1 [ false, %while.cond ], [ %tobool87, %land.rhs ]
  br i1 %60, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %61 = load %struct.dirent*, %struct.dirent** %entry1, align 4
  %d_name = getelementptr inbounds %struct.dirent, %struct.dirent* %61, i32 0, i32 6
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %d_name, i32 0, i32 0
  store i8* %arraydecay, i8** %dentry, align 4
  store i8* %arraydecay, i8** %convfn, align 4
  %62 = load %struct.dirent*, %struct.dirent** %entry1, align 4
  %d_name88 = getelementptr inbounds %struct.dirent, %struct.dirent* %62, i32 0, i32 6
  %arraydecay89 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name88, i32 0, i32 0
  %call90 = call i32 @strlen(i8* %arraydecay89)
  store i32 %call90, i32* %dentlen, align 4
  store i32 %call90, i32* %convlen, align 4
  %63 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_rewrite_hook, align 4
  %tobool91 = icmp ne i8* (i8*, i32)* %63, null
  br i1 %tobool91, label %if.then92, label %if.end97

if.then92:                                        ; preds = %while.body
  %64 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_rewrite_hook, align 4
  %65 = load i8*, i8** %dentry, align 4
  %66 = load i32, i32* %dentlen, align 4
  %call93 = call i8* %64(i8* %65, i32 %66)
  store i8* %call93, i8** %convfn, align 4
  %67 = load i8*, i8** %convfn, align 4
  %68 = load i8*, i8** %dentry, align 4
  %cmp94 = icmp eq i8* %67, %68
  br i1 %cmp94, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then92
  %69 = load i32, i32* %dentlen, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then92
  %70 = load i8*, i8** %convfn, align 4
  %call96 = call i32 @strlen(i8* %70)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %69, %cond.true ], [ %call96, %cond.false ]
  store i32 %cond, i32* %convlen, align 4
  br label %if.end97

if.end97:                                         ; preds = %cond.end, %while.body
  %71 = load i32, i32* @rl_filename_completion_function.filename_len, align 4
  %cmp98 = icmp eq i32 %71, 0
  br i1 %cmp98, label %if.then100, label %if.else128

if.then100:                                       ; preds = %if.end97
  %72 = load i32, i32* @_rl_match_hidden_files, align 4
  %cmp101 = icmp eq i32 %72, 0
  br i1 %cmp101, label %land.lhs.true103, label %if.end109

land.lhs.true103:                                 ; preds = %if.then100
  %73 = load i8*, i8** %convfn, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %73, i32 0
  %74 = load i8, i8* %arrayidx104, align 1
  %conv105 = sext i8 %74 to i32
  %cmp106 = icmp eq i32 %conv105, 46
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %land.lhs.true103
  br label %while.cond

if.end109:                                        ; preds = %land.lhs.true103, %if.then100
  %75 = load i8*, i8** %convfn, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %75, i32 0
  %76 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %76 to i32
  %cmp112 = icmp ne i32 %conv111, 46
  br i1 %cmp112, label %if.then126, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end109
  %77 = load i8*, i8** %convfn, align 4
  %arrayidx114 = getelementptr inbounds i8, i8* %77, i32 1
  %78 = load i8, i8* %arrayidx114, align 1
  %conv115 = sext i8 %78 to i32
  %tobool116 = icmp ne i32 %conv115, 0
  br i1 %tobool116, label %land.lhs.true117, label %if.end127

land.lhs.true117:                                 ; preds = %lor.lhs.false
  %79 = load i8*, i8** %convfn, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %79, i32 1
  %80 = load i8, i8* %arrayidx118, align 1
  %conv119 = sext i8 %80 to i32
  %cmp120 = icmp ne i32 %conv119, 46
  br i1 %cmp120, label %if.then126, label %lor.lhs.false122

lor.lhs.false122:                                 ; preds = %land.lhs.true117
  %81 = load i8*, i8** %convfn, align 4
  %arrayidx123 = getelementptr inbounds i8, i8* %81, i32 2
  %82 = load i8, i8* %arrayidx123, align 1
  %conv124 = sext i8 %82 to i32
  %tobool125 = icmp ne i32 %conv124, 0
  br i1 %tobool125, label %if.then126, label %if.end127

if.then126:                                       ; preds = %lor.lhs.false122, %land.lhs.true117, %if.end109
  br label %while.end

if.end127:                                        ; preds = %lor.lhs.false122, %lor.lhs.false
  br label %if.end133

if.else128:                                       ; preds = %if.end97
  %83 = load i8*, i8** %convfn, align 4
  %84 = load i32, i32* %convlen, align 4
  %85 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %86 = load i32, i32* @rl_filename_completion_function.filename_len, align 4
  %call129 = call i32 @complete_fncmp(i8* %83, i32 %84, i8* %85, i32 %86)
  %tobool130 = icmp ne i32 %call129, 0
  br i1 %tobool130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.else128
  br label %while.end

if.end132:                                        ; preds = %if.else128
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %if.end127
  br label %while.cond

while.end:                                        ; preds = %if.then131, %if.then126, %land.end
  %87 = load %struct.dirent*, %struct.dirent** %entry1, align 4
  %cmp134 = icmp eq %struct.dirent* %87, null
  br i1 %cmp134, label %if.then136, label %if.else150

if.then136:                                       ; preds = %while.end
  %88 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %tobool137 = icmp ne %struct.__dirstream* %88, null
  br i1 %tobool137, label %if.then138, label %if.end140

if.then138:                                       ; preds = %if.then136
  %89 = load %struct.__dirstream*, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  %call139 = call i32 @closedir(%struct.__dirstream* %89)
  store %struct.__dirstream* null, %struct.__dirstream** @rl_filename_completion_function.directory, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %if.then136
  %90 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %tobool141 = icmp ne i8* %90, null
  br i1 %tobool141, label %if.then142, label %if.end143

if.then142:                                       ; preds = %if.end140
  %91 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  call void @xfree(i8* %91)
  store i8* null, i8** @rl_filename_completion_function.dirname, align 4
  br label %if.end143

if.end143:                                        ; preds = %if.then142, %if.end140
  %92 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  %tobool144 = icmp ne i8* %92, null
  br i1 %tobool144, label %if.then145, label %if.end146

if.then145:                                       ; preds = %if.end143
  %93 = load i8*, i8** @rl_filename_completion_function.filename, align 4
  call void @xfree(i8* %93)
  store i8* null, i8** @rl_filename_completion_function.filename, align 4
  br label %if.end146

if.end146:                                        ; preds = %if.then145, %if.end143
  %94 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %tobool147 = icmp ne i8* %94, null
  br i1 %tobool147, label %if.then148, label %if.end149

if.then148:                                       ; preds = %if.end146
  %95 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  call void @xfree(i8* %95)
  store i8* null, i8** @rl_filename_completion_function.users_dirname, align 4
  br label %if.end149

if.end149:                                        ; preds = %if.then148, %if.end146
  store i8* null, i8** %retval, align 4
  br label %return

if.else150:                                       ; preds = %while.end
  %96 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %tobool151 = icmp ne i8* %96, null
  br i1 %tobool151, label %land.lhs.true152, label %if.else204

land.lhs.true152:                                 ; preds = %if.else150
  %97 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %arrayidx153 = getelementptr inbounds i8, i8* %97, i32 0
  %98 = load i8, i8* %arrayidx153, align 1
  %conv154 = sext i8 %98 to i32
  %cmp155 = icmp ne i32 %conv154, 46
  br i1 %cmp155, label %if.then161, label %lor.lhs.false157

lor.lhs.false157:                                 ; preds = %land.lhs.true152
  %99 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %99, i32 1
  %100 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %100 to i32
  %tobool160 = icmp ne i32 %conv159, 0
  br i1 %tobool160, label %if.then161, label %if.else204

if.then161:                                       ; preds = %lor.lhs.false157, %land.lhs.true152
  %101 = load i32, i32* @rl_complete_with_tilde_expansion, align 4
  %tobool162 = icmp ne i32 %101, 0
  br i1 %tobool162, label %land.lhs.true163, label %if.else184

land.lhs.true163:                                 ; preds = %if.then161
  %102 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %103 = load i8, i8* %102, align 1
  %conv164 = sext i8 %103 to i32
  %cmp165 = icmp eq i32 %conv164, 126
  br i1 %cmp165, label %if.then167, label %if.else184

if.then167:                                       ; preds = %land.lhs.true163
  %104 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call168 = call i32 @strlen(i8* %104)
  store i32 %call168, i32* %dirlen, align 4
  %105 = load i32, i32* %dirlen, align 4
  %add169 = add nsw i32 2, %105
  %106 = load %struct.dirent*, %struct.dirent** %entry1, align 4
  %d_name170 = getelementptr inbounds %struct.dirent, %struct.dirent* %106, i32 0, i32 6
  %arraydecay171 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name170, i32 0, i32 0
  %call172 = call i32 @strlen(i8* %arraydecay171)
  %add173 = add i32 %add169, %call172
  %call174 = call i8* @xmalloc(i32 %add173)
  store i8* %call174, i8** %temp, align 4
  %107 = load i8*, i8** %temp, align 4
  %108 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %call175 = call i8* @strcpy(i8* %107, i8* %108)
  %109 = load i8*, i8** @rl_filename_completion_function.dirname, align 4
  %110 = load i32, i32* %dirlen, align 4
  %sub = sub nsw i32 %110, 1
  %arrayidx176 = getelementptr inbounds i8, i8* %109, i32 %sub
  %111 = load i8, i8* %arrayidx176, align 1
  %conv177 = sext i8 %111 to i32
  %cmp178 = icmp ne i32 %conv177, 47
  br i1 %cmp178, label %if.then180, label %if.end183

if.then180:                                       ; preds = %if.then167
  %112 = load i8*, i8** %temp, align 4
  %113 = load i32, i32* %dirlen, align 4
  %inc = add nsw i32 %113, 1
  store i32 %inc, i32* %dirlen, align 4
  %arrayidx181 = getelementptr inbounds i8, i8* %112, i32 %113
  store i8 47, i8* %arrayidx181, align 1
  %114 = load i8*, i8** %temp, align 4
  %115 = load i32, i32* %dirlen, align 4
  %arrayidx182 = getelementptr inbounds i8, i8* %114, i32 %115
  store i8 0, i8* %arrayidx182, align 1
  br label %if.end183

if.end183:                                        ; preds = %if.then180, %if.then167
  br label %if.end202

if.else184:                                       ; preds = %land.lhs.true163, %if.then161
  %116 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %call185 = call i32 @strlen(i8* %116)
  store i32 %call185, i32* %dirlen, align 4
  %117 = load i32, i32* %dirlen, align 4
  %add186 = add nsw i32 2, %117
  %118 = load %struct.dirent*, %struct.dirent** %entry1, align 4
  %d_name187 = getelementptr inbounds %struct.dirent, %struct.dirent* %118, i32 0, i32 6
  %arraydecay188 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name187, i32 0, i32 0
  %call189 = call i32 @strlen(i8* %arraydecay188)
  %add190 = add i32 %add186, %call189
  %call191 = call i8* @xmalloc(i32 %add190)
  store i8* %call191, i8** %temp, align 4
  %119 = load i8*, i8** %temp, align 4
  %120 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %call192 = call i8* @strcpy(i8* %119, i8* %120)
  %121 = load i8*, i8** @rl_filename_completion_function.users_dirname, align 4
  %122 = load i32, i32* %dirlen, align 4
  %sub193 = sub nsw i32 %122, 1
  %arrayidx194 = getelementptr inbounds i8, i8* %121, i32 %sub193
  %123 = load i8, i8* %arrayidx194, align 1
  %conv195 = sext i8 %123 to i32
  %cmp196 = icmp ne i32 %conv195, 47
  br i1 %cmp196, label %if.then198, label %if.end201

if.then198:                                       ; preds = %if.else184
  %124 = load i8*, i8** %temp, align 4
  %125 = load i32, i32* %dirlen, align 4
  %inc199 = add nsw i32 %125, 1
  store i32 %inc199, i32* %dirlen, align 4
  %arrayidx200 = getelementptr inbounds i8, i8* %124, i32 %125
  store i8 47, i8* %arrayidx200, align 1
  br label %if.end201

if.end201:                                        ; preds = %if.then198, %if.else184
  br label %if.end202

if.end202:                                        ; preds = %if.end201, %if.end183
  %126 = load i8*, i8** %temp, align 4
  %127 = load i32, i32* %dirlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %126, i32 %127
  %128 = load i8*, i8** %convfn, align 4
  %call203 = call i8* @strcpy(i8* %add.ptr, i8* %128)
  br label %if.end209

if.else204:                                       ; preds = %lor.lhs.false157, %if.else150
  %129 = load i8*, i8** %convfn, align 4
  %call205 = call i32 @strlen(i8* %129)
  %add206 = add i32 1, %call205
  %call207 = call i8* @xmalloc(i32 %add206)
  %130 = load i8*, i8** %convfn, align 4
  %call208 = call i8* @strcpy(i8* %call207, i8* %130)
  store i8* %call208, i8** %temp, align 4
  br label %if.end209

if.end209:                                        ; preds = %if.else204, %if.end202
  %131 = load i8*, i8** %convfn, align 4
  %132 = load i8*, i8** %dentry, align 4
  %cmp210 = icmp ne i8* %131, %132
  br i1 %cmp210, label %if.then212, label %if.end213

if.then212:                                       ; preds = %if.end209
  %133 = load i8*, i8** %convfn, align 4
  call void @xfree(i8* %133)
  br label %if.end213

if.end213:                                        ; preds = %if.then212, %if.end209
  %134 = load i8*, i8** %temp, align 4
  store i8* %134, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end213, %if.end149
  %135 = load i8*, i8** %retval, align 4
  ret i8* %135
}

declare i8* @rl_copy_text(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8** @gen_completion_matches(i8* %text, i32 %start, i32 %end, i8* (i8*, i32)* %our_func, i32 %found_quote, i32 %quote_char) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %our_func.addr = alloca i8* (i8*, i32)*, align 4
  %found_quote.addr = alloca i32, align 4
  %quote_char.addr = alloca i32, align 4
  %matches = alloca i8**, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i8* (i8*, i32)* %our_func, i8* (i8*, i32)** %our_func.addr, align 4
  store i32 %found_quote, i32* %found_quote.addr, align 4
  store i32 %quote_char, i32* %quote_char.addr, align 4
  %0 = load i32, i32* %found_quote.addr, align 4
  store i32 %0, i32* @rl_completion_found_quote, align 4
  %1 = load i32, i32* %quote_char.addr, align 4
  store i32 %1, i32* @rl_completion_quote_character, align 4
  %2 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %tobool = icmp ne i8** (i8*, i32, i32)* %2, null
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %3 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %start.addr, align 4
  %6 = load i32, i32* %end.addr, align 4
  %call = call i8** %3(i8* %4, i32 %5, i32 %6)
  store i8** %call, i8*** %matches, align 4
  %7 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp = icmp ne i32 %7, 0
  br i1 %cmp, label %if.then1, label %if.end4

if.then1:                                         ; preds = %if.then
  %8 = load i8**, i8*** %matches, align 4
  call void @_rl_free_match_list(i8** %8)
  store i8** null, i8*** %matches, align 4
  br label %do.body

do.body:                                          ; preds = %if.then1
  %9 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool2 = icmp ne i32 %9, 0
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %do.body
  %10 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then3, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end4

if.end4:                                          ; preds = %do.end, %if.then
  %11 = load i8**, i8*** %matches, align 4
  %tobool5 = icmp ne i8** %11, null
  br i1 %tobool5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %12 = load i32, i32* @rl_attempted_completion_over, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %lor.lhs.false, %if.end4
  store i32 0, i32* @rl_attempted_completion_over, align 4
  %13 = load i8**, i8*** %matches, align 4
  store i8** %13, i8*** %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %entry
  %14 = load i8*, i8** %text.addr, align 4
  %15 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func.addr, align 4
  %call10 = call i8** @rl_completion_matches(i8* %14, i8* (i8*, i32)* %15)
  store i8** %call10, i8*** %matches, align 4
  %16 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp11 = icmp ne i32 %16, 0
  br i1 %cmp11, label %if.then12, label %if.end18

if.then12:                                        ; preds = %if.end9
  %17 = load i8**, i8*** %matches, align 4
  call void @_rl_free_match_list(i8** %17)
  store i8** null, i8*** %matches, align 4
  br label %do.body13

do.body13:                                        ; preds = %if.then12
  %18 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool14 = icmp ne i32 %18, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body13
  %19 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %19)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %do.body13
  br label %do.end17

do.end17:                                         ; preds = %if.end16
  br label %if.end18

if.end18:                                         ; preds = %do.end17, %if.end9
  %20 = load i8**, i8*** %matches, align 4
  store i8** %20, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then7
  %21 = load i8**, i8*** %retval, align 4
  ret i8** %21
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @rl_ding() #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @postprocess_matches(i8*** %matchesp, i32 %matching_filenames) #0 {
entry:
  %retval = alloca i32, align 4
  %matchesp.addr = alloca i8***, align 4
  %matching_filenames.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %matches = alloca i8**, align 4
  %temp_matches = alloca i8**, align 4
  %nmatch = alloca i32, align 4
  %i = alloca i32, align 4
  store i8*** %matchesp, i8**** %matchesp.addr, align 4
  store i32 %matching_filenames, i32* %matching_filenames.addr, align 4
  %0 = load i8***, i8**** %matchesp.addr, align 4
  %1 = load i8**, i8*** %0, align 4
  store i8** %1, i8*** %matches, align 4
  %2 = load i8**, i8*** %matches, align 4
  %cmp = icmp eq i8** %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_ignore_completion_duplicates, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %4 = load i8**, i8*** %matches, align 4
  %call = call i8** @remove_duplicate_matches(i8** %4)
  store i8** %call, i8*** %temp_matches, align 4
  %5 = load i8**, i8*** %matches, align 4
  %6 = bitcast i8** %5 to i8*
  call void @xfree(i8* %6)
  %7 = load i8**, i8*** %temp_matches, align 4
  store i8** %7, i8*** %matches, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %8 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %tobool3 = icmp ne i32 (i8**)* %8, null
  br i1 %tobool3, label %land.lhs.true, label %if.end33

land.lhs.true:                                    ; preds = %if.end2
  %9 = load i32, i32* %matching_filenames.addr, align 4
  %tobool4 = icmp ne i32 %9, 0
  br i1 %tobool4, label %if.then5, label %if.end33

if.then5:                                         ; preds = %land.lhs.true
  store i32 1, i32* %nmatch, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5
  %10 = load i8**, i8*** %matches, align 4
  %11 = load i32, i32* %nmatch, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx, align 4
  %tobool6 = icmp ne i8* %12, null
  br i1 %tobool6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %nmatch, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %nmatch, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %15 = load i8**, i8*** %matches, align 4
  %call7 = call i32 %14(i8** %15)
  %16 = load i8**, i8*** %matches, align 4
  %cmp8 = icmp eq i8** %16, null
  br i1 %cmp8, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %17 = load i8**, i8*** %matches, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %17, i32 0
  %18 = load i8*, i8** %arrayidx9, align 4
  %cmp10 = icmp eq i8* %18, null
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %lor.lhs.false, %for.end
  %19 = load i8**, i8*** %matches, align 4
  %tobool12 = icmp ne i8** %19, null
  br i1 %tobool12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then11
  %20 = load i8**, i8*** %matches, align 4
  %21 = bitcast i8** %20 to i8*
  call void @free(i8* %21)
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.then11
  %22 = load i8***, i8**** %matchesp.addr, align 4
  store i8** null, i8*** %22, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  store i32 1, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc19, %if.else
  %23 = load i8**, i8*** %matches, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx16, align 4
  %tobool17 = icmp ne i8* %25, null
  br i1 %tobool17, label %for.body18, label %for.end21

for.body18:                                       ; preds = %for.cond15
  br label %for.inc19

for.inc19:                                        ; preds = %for.body18
  %26 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %26, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond15

for.end21:                                        ; preds = %for.cond15
  %27 = load i32, i32* %i, align 4
  %cmp22 = icmp sgt i32 %27, 1
  br i1 %cmp22, label %land.lhs.true23, label %if.end31

land.lhs.true23:                                  ; preds = %for.end21
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %nmatch, align 4
  %cmp24 = icmp slt i32 %28, %29
  br i1 %cmp24, label %if.then25, label %if.end31

if.then25:                                        ; preds = %land.lhs.true23
  %30 = load i8**, i8*** %matches, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %30, i32 0
  %31 = load i8*, i8** %arrayidx26, align 4
  store i8* %31, i8** %t, align 4
  %32 = load i8**, i8*** %matches, align 4
  %33 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %33, 1
  %34 = load i8*, i8** %t, align 4
  %call27 = call i32 @compute_lcd_of_matches(i8** %32, i32 %sub, i8* %34)
  %35 = load i8*, i8** %t, align 4
  %tobool28 = icmp ne i8* %35, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.then25
  %36 = load i8*, i8** %t, align 4
  call void @free(i8* %36)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.then25
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %land.lhs.true23, %for.end21
  br label %if.end32

if.end32:                                         ; preds = %if.end31
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %land.lhs.true, %if.end2
  %37 = load i8**, i8*** %matches, align 4
  %38 = load i8***, i8**** %matchesp.addr, align 4
  store i8** %37, i8*** %38, align 4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.end14, %if.then
  %39 = load i32, i32* %retval, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind
define internal void @insert_match(i8* %match, i32 %start, i32 %mtype, i8* %qc) #0 {
entry:
  %match.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %mtype.addr = alloca i32, align 4
  %qc.addr = alloca i8*, align 4
  %replacement = alloca i8*, align 4
  %r = alloca i8*, align 4
  %oqc = alloca i8, align 1
  %end = alloca i32, align 4
  %rlen = alloca i32, align 4
  store i8* %match, i8** %match.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %mtype, i32* %mtype.addr, align 4
  store i8* %qc, i8** %qc.addr, align 4
  %0 = load i8*, i8** %qc.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %qc.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ 0, %cond.false ]
  %conv1 = trunc i32 %cond to i8
  store i8 %conv1, i8* %oqc, align 1
  %3 = load i8*, i8** %match.addr, align 4
  %4 = load i32, i32* %mtype.addr, align 4
  %5 = load i8*, i8** %qc.addr, align 4
  %call = call i8* @make_quoted_replacement(i8* %3, i32 %4, i8* %5)
  store i8* %call, i8** %replacement, align 4
  %6 = load i8*, i8** %replacement, align 4
  %tobool2 = icmp ne i8* %6, null
  br i1 %tobool2, label %if.then, label %if.end94

if.then:                                          ; preds = %cond.end
  %7 = load i8*, i8** %replacement, align 4
  %call3 = call i32 @strlen(i8* %7)
  store i32 %call3, i32* %rlen, align 4
  %8 = load i8*, i8** %qc.addr, align 4
  %tobool4 = icmp ne i8* %8, null
  br i1 %tobool4, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %9 = load i8*, i8** %qc.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv5 = sext i8 %10 to i32
  %tobool6 = icmp ne i32 %conv5, 0
  br i1 %tobool6, label %land.lhs.true7, label %if.else

land.lhs.true7:                                   ; preds = %land.lhs.true
  %11 = load i32, i32* %start.addr, align 4
  %tobool8 = icmp ne i32 %11, 0
  br i1 %tobool8, label %land.lhs.true9, label %if.else

land.lhs.true9:                                   ; preds = %land.lhs.true7
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %13, 1
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 %sub
  %14 = load i8, i8* %arrayidx, align 1
  %conv10 = sext i8 %14 to i32
  %15 = load i8*, i8** %qc.addr, align 4
  %16 = load i8, i8* %15, align 1
  %conv11 = sext i8 %16 to i32
  %cmp = icmp eq i32 %conv10, %conv11
  br i1 %cmp, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %land.lhs.true9
  %17 = load i8*, i8** %replacement, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %18 to i32
  %19 = load i8*, i8** %qc.addr, align 4
  %20 = load i8, i8* %19, align 1
  %conv16 = sext i8 %20 to i32
  %cmp17 = icmp eq i32 %conv15, %conv16
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %land.lhs.true13
  %21 = load i32, i32* %start.addr, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, i32* %start.addr, align 4
  br label %if.end43

if.else:                                          ; preds = %land.lhs.true13, %land.lhs.true9, %land.lhs.true7, %land.lhs.true, %if.then
  %22 = load i8*, i8** %qc.addr, align 4
  %tobool20 = icmp ne i8* %22, null
  br i1 %tobool20, label %land.lhs.true21, label %if.end

land.lhs.true21:                                  ; preds = %if.else
  %23 = load i8*, i8** %qc.addr, align 4
  %24 = load i8, i8* %23, align 1
  %conv22 = sext i8 %24 to i32
  %25 = load i8, i8* %oqc, align 1
  %conv23 = sext i8 %25 to i32
  %cmp24 = icmp ne i32 %conv22, %conv23
  br i1 %cmp24, label %land.lhs.true26, label %if.end

land.lhs.true26:                                  ; preds = %land.lhs.true21
  %26 = load i32, i32* %start.addr, align 4
  %tobool27 = icmp ne i32 %26, 0
  br i1 %tobool27, label %land.lhs.true28, label %if.end

land.lhs.true28:                                  ; preds = %land.lhs.true26
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* %start.addr, align 4
  %sub29 = sub nsw i32 %28, 1
  %arrayidx30 = getelementptr inbounds i8, i8* %27, i32 %sub29
  %29 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %29 to i32
  %30 = load i8, i8* %oqc, align 1
  %conv32 = sext i8 %30 to i32
  %cmp33 = icmp eq i32 %conv31, %conv32
  br i1 %cmp33, label %land.lhs.true35, label %if.end

land.lhs.true35:                                  ; preds = %land.lhs.true28
  %31 = load i8*, i8** %replacement, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %32 to i32
  %33 = load i8, i8* %oqc, align 1
  %conv38 = sext i8 %33 to i32
  %cmp39 = icmp ne i32 %conv37, %conv38
  br i1 %cmp39, label %if.then41, label %if.end

if.then41:                                        ; preds = %land.lhs.true35
  %34 = load i32, i32* %start.addr, align 4
  %dec42 = add nsw i32 %34, -1
  store i32 %dec42, i32* %start.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then41, %land.lhs.true35, %land.lhs.true28, %land.lhs.true26, %land.lhs.true21, %if.else
  br label %if.end43

if.end43:                                         ; preds = %if.end, %if.then19
  %35 = load i32, i32* @rl_point, align 4
  %sub44 = sub nsw i32 %35, 1
  store i32 %sub44, i32* %end, align 4
  %36 = load i8*, i8** %qc.addr, align 4
  %tobool45 = icmp ne i8* %36, null
  br i1 %tobool45, label %land.lhs.true46, label %if.end65

land.lhs.true46:                                  ; preds = %if.end43
  %37 = load i8*, i8** %qc.addr, align 4
  %38 = load i8, i8* %37, align 1
  %conv47 = sext i8 %38 to i32
  %tobool48 = icmp ne i32 %conv47, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.end65

land.lhs.true49:                                  ; preds = %land.lhs.true46
  %39 = load i32, i32* %end, align 4
  %tobool50 = icmp ne i32 %39, 0
  br i1 %tobool50, label %land.lhs.true51, label %if.end65

land.lhs.true51:                                  ; preds = %land.lhs.true49
  %40 = load i8*, i8** @rl_line_buffer, align 4
  %41 = load i32, i32* @rl_point, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %40, i32 %41
  %42 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %42 to i32
  %43 = load i8*, i8** %qc.addr, align 4
  %44 = load i8, i8* %43, align 1
  %conv54 = sext i8 %44 to i32
  %cmp55 = icmp eq i32 %conv53, %conv54
  br i1 %cmp55, label %land.lhs.true57, label %if.end65

land.lhs.true57:                                  ; preds = %land.lhs.true51
  %45 = load i8*, i8** %replacement, align 4
  %46 = load i32, i32* %rlen, align 4
  %sub58 = sub nsw i32 %46, 1
  %arrayidx59 = getelementptr inbounds i8, i8* %45, i32 %sub58
  %47 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %47 to i32
  %48 = load i8*, i8** %qc.addr, align 4
  %49 = load i8, i8* %48, align 1
  %conv61 = sext i8 %49 to i32
  %cmp62 = icmp eq i32 %conv60, %conv61
  br i1 %cmp62, label %if.then64, label %if.end65

if.then64:                                        ; preds = %land.lhs.true57
  %50 = load i32, i32* %end, align 4
  %inc = add nsw i32 %50, 1
  store i32 %inc, i32* %end, align 4
  br label %if.end65

if.end65:                                         ; preds = %if.then64, %land.lhs.true57, %land.lhs.true51, %land.lhs.true49, %land.lhs.true46, %if.end43
  %51 = load i32, i32* @_rl_skip_completed_text, align 4
  %tobool66 = icmp ne i32 %51, 0
  br i1 %tobool66, label %if.then67, label %if.else87

if.then67:                                        ; preds = %if.end65
  %52 = load i8*, i8** %replacement, align 4
  store i8* %52, i8** %r, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then67
  %53 = load i32, i32* %start.addr, align 4
  %54 = load i32, i32* @rl_end, align 4
  %cmp68 = icmp slt i32 %53, %54
  br i1 %cmp68, label %land.lhs.true70, label %land.end

land.lhs.true70:                                  ; preds = %while.cond
  %55 = load i8*, i8** %r, align 4
  %56 = load i8, i8* %55, align 1
  %conv71 = sext i8 %56 to i32
  %tobool72 = icmp ne i32 %conv71, 0
  br i1 %tobool72, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true70
  %57 = load i8*, i8** @rl_line_buffer, align 4
  %58 = load i32, i32* %start.addr, align 4
  %arrayidx73 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = load i8, i8* %arrayidx73, align 1
  %conv74 = sext i8 %59 to i32
  %60 = load i8*, i8** %r, align 4
  %61 = load i8, i8* %60, align 1
  %conv75 = sext i8 %61 to i32
  %cmp76 = icmp eq i32 %conv74, %conv75
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true70, %while.cond
  %62 = phi i1 [ false, %land.lhs.true70 ], [ false, %while.cond ], [ %cmp76, %land.rhs ]
  br i1 %62, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %63 = load i32, i32* %start.addr, align 4
  %inc78 = add nsw i32 %63, 1
  store i32 %inc78, i32* %start.addr, align 4
  %64 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %65 = load i32, i32* %start.addr, align 4
  %66 = load i32, i32* %end, align 4
  %cmp79 = icmp sle i32 %65, %66
  br i1 %cmp79, label %if.then83, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %67 = load i8*, i8** %r, align 4
  %68 = load i8, i8* %67, align 1
  %conv81 = sext i8 %68 to i32
  %tobool82 = icmp ne i32 %conv81, 0
  br i1 %tobool82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %lor.lhs.false, %while.end
  %69 = load i8*, i8** %r, align 4
  %70 = load i32, i32* %start.addr, align 4
  %71 = load i32, i32* %end, align 4
  %call84 = call i32 @_rl_replace_text(i8* %69, i32 %70, i32 %71)
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %lor.lhs.false
  %72 = load i32, i32* %start.addr, align 4
  %73 = load i8*, i8** %r, align 4
  %call86 = call i32 @strlen(i8* %73)
  %add = add i32 %72, %call86
  store i32 %add, i32* @rl_point, align 4
  br label %if.end89

if.else87:                                        ; preds = %if.end65
  %74 = load i8*, i8** %replacement, align 4
  %75 = load i32, i32* %start.addr, align 4
  %76 = load i32, i32* %end, align 4
  %call88 = call i32 @_rl_replace_text(i8* %74, i32 %75, i32 %76)
  br label %if.end89

if.end89:                                         ; preds = %if.else87, %if.end85
  %77 = load i8*, i8** %replacement, align 4
  %78 = load i8*, i8** %match.addr, align 4
  %cmp90 = icmp ne i8* %77, %78
  br i1 %cmp90, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end89
  %79 = load i8*, i8** %replacement, align 4
  call void @xfree(i8* %79)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.end89
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %cond.end
  ret void
}

; Function Attrs: noinline nounwind
define internal void @display_matches(i8** %matches) #0 {
entry:
  %matches.addr = alloca i8**, align 4
  %len = alloca i32, align 4
  %max = alloca i32, align 4
  %i = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  %0 = load i32, i32* @_rl_vis_botlin, align 4
  call void @_rl_move_vert(i32 %0)
  %1 = load i8**, i8*** %matches.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 1
  %2 = load i8*, i8** %arrayidx, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8**, i8*** %matches.addr, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i32 0
  %4 = load i8*, i8** %arrayidx1, align 4
  %call = call i8* @printable_part(i8* %4)
  store i8* %call, i8** %temp, align 4
  %call2 = call i32 @rl_crlf()
  %5 = load i8*, i8** %temp, align 4
  %6 = load i8**, i8*** %matches.addr, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx3, align 4
  %call4 = call i32 @print_filename(i8* %5, i8* %7, i32 0)
  %call5 = call i32 @rl_crlf()
  %call6 = call i32 @rl_forced_update_display()
  store i32 1, i32* @rl_display_fixed, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %max, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i8**, i8*** %matches.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx7, align 4
  %tobool = icmp ne i8* %10, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8**, i8*** %matches.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx8, align 4
  %call9 = call i8* @printable_part(i8* %13)
  store i8* %call9, i8** %temp, align 4
  %14 = load i8*, i8** %temp, align 4
  %call10 = call i32 @fnwidth(i8* %14)
  store i32 %call10, i32* %len, align 4
  %15 = load i32, i32* %len, align 4
  %16 = load i32, i32* %max, align 4
  %cmp11 = icmp sgt i32 %15, %16
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body
  %17 = load i32, i32* %len, align 4
  store i32 %17, i32* %max, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %19, 1
  store i32 %sub, i32* %len, align 4
  %20 = load void (i8**, i32, i32)*, void (i8**, i32, i32)** @rl_completion_display_matches_hook, align 4
  %tobool14 = icmp ne void (i8**, i32, i32)* %20, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %for.end
  %21 = load void (i8**, i32, i32)*, void (i8**, i32, i32)** @rl_completion_display_matches_hook, align 4
  %22 = load i8**, i8*** %matches.addr, align 4
  %23 = load i32, i32* %len, align 4
  %24 = load i32, i32* %max, align 4
  call void %21(i8** %22, i32 %23, i32 %24)
  br label %return

if.end16:                                         ; preds = %for.end
  %25 = load i32, i32* @rl_completion_query_items, align 4
  %cmp17 = icmp sgt i32 %25, 0
  br i1 %cmp17, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %if.end16
  %26 = load i32, i32* %len, align 4
  %27 = load i32, i32* @rl_completion_query_items, align 4
  %cmp18 = icmp sge i32 %26, %27
  br i1 %cmp18, label %if.then19, label %if.end29

if.then19:                                        ; preds = %land.lhs.true
  %call20 = call i32 @rl_crlf()
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %29 = load i32, i32* %len, align 4
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.8, i32 0, i32 0), i32 %29)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call22 = call i32 @fflush(%struct._IO_FILE* %30)
  %call23 = call i32 @get_y_or_n(i32 0)
  store i32 %call23, i32* @completion_y_or_n, align 4
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %if.then25, label %if.end28

if.then25:                                        ; preds = %if.then19
  %call26 = call i32 @rl_crlf()
  %call27 = call i32 @rl_forced_update_display()
  store i32 1, i32* @rl_display_fixed, align 4
  br label %return

if.end28:                                         ; preds = %if.then19
  br label %if.end29

if.end29:                                         ; preds = %if.end28, %land.lhs.true, %if.end16
  %31 = load i8**, i8*** %matches.addr, align 4
  %32 = load i32, i32* %len, align 4
  %33 = load i32, i32* %max, align 4
  call void @rl_display_match_list(i8** %31, i32 %32, i32 %33)
  %call30 = call i32 @rl_forced_update_display()
  store i32 1, i32* @rl_display_fixed, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.then25, %if.then15, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @append_to_match(i8* %text, i32 %delimiter, i32 %quote_char, i32 %nontrivial_match) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %delimiter.addr = alloca i32, align 4
  %quote_char.addr = alloca i32, align 4
  %nontrivial_match.addr = alloca i32, align 4
  %temp_string = alloca [4 x i8], align 1
  %filename = alloca i8*, align 4
  %fn = alloca i8*, align 4
  %temp_string_index = alloca i32, align 4
  %s = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  store i8* %text, i8** %text.addr, align 4
  store i32 %delimiter, i32* %delimiter.addr, align 4
  store i32 %quote_char, i32* %quote_char.addr, align 4
  store i32 %nontrivial_match, i32* %nontrivial_match.addr, align 4
  store i32 0, i32* %temp_string_index, align 4
  %0 = load i32, i32* %quote_char.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @rl_completion_suppress_quote, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true2
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %4, 1
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %sub
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load i32, i32* %quote_char.addr, align 4
  %cmp4 = icmp ne i32 %conv, %6
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true3
  %7 = load i32, i32* %quote_char.addr, align 4
  %conv6 = trunc i32 %7 to i8
  %8 = load i32, i32* %temp_string_index, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %temp_string_index, align 4
  %arrayidx7 = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 %8
  store i8 %conv6, i8* %arrayidx7, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true3, %land.lhs.true2, %land.lhs.true, %entry
  %9 = load i32, i32* %delimiter.addr, align 4
  %tobool8 = icmp ne i32 %9, 0
  br i1 %tobool8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %10 = load i32, i32* %delimiter.addr, align 4
  %conv10 = trunc i32 %10 to i8
  %11 = load i32, i32* %temp_string_index, align 4
  %inc11 = add nsw i32 %11, 1
  store i32 %inc11, i32* %temp_string_index, align 4
  %arrayidx12 = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 %11
  store i8 %conv10, i8* %arrayidx12, align 1
  br label %if.end22

if.else:                                          ; preds = %if.end
  %12 = load i32, i32* @rl_completion_suppress_append, align 4
  %cmp13 = icmp eq i32 %12, 0
  br i1 %cmp13, label %land.lhs.true15, label %if.end21

land.lhs.true15:                                  ; preds = %if.else
  %13 = load i32, i32* @rl_completion_append_character, align 4
  %tobool16 = icmp ne i32 %13, 0
  br i1 %tobool16, label %if.then17, label %if.end21

if.then17:                                        ; preds = %land.lhs.true15
  %14 = load i32, i32* @rl_completion_append_character, align 4
  %conv18 = trunc i32 %14 to i8
  %15 = load i32, i32* %temp_string_index, align 4
  %inc19 = add nsw i32 %15, 1
  store i32 %inc19, i32* %temp_string_index, align 4
  %arrayidx20 = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 %15
  store i8 %conv18, i8* %arrayidx20, align 1
  br label %if.end21

if.end21:                                         ; preds = %if.then17, %land.lhs.true15, %if.else
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %if.then9
  %16 = load i32, i32* %temp_string_index, align 4
  %inc23 = add nsw i32 %16, 1
  store i32 %inc23, i32* %temp_string_index, align 4
  %arrayidx24 = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 %16
  store i8 0, i8* %arrayidx24, align 1
  %17 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool25 = icmp ne i32 %17, 0
  br i1 %tobool25, label %if.then26, label %if.else93

if.then26:                                        ; preds = %if.end22
  %18 = load i8*, i8** %text.addr, align 4
  %call = call i8* @tilde_expand(i8* %18)
  store i8* %call, i8** %filename, align 4
  %19 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %tobool27 = icmp ne i32 (i8**)* %19, null
  br i1 %tobool27, label %if.then28, label %if.end33

if.then28:                                        ; preds = %if.then26
  %20 = load i8*, i8** %filename, align 4
  %call29 = call i32 @strlen(i8* %20)
  %add = add i32 1, %call29
  %call30 = call i8* @xmalloc(i32 %add)
  %21 = load i8*, i8** %filename, align 4
  %call31 = call i8* @strcpy(i8* %call30, i8* %21)
  store i8* %call31, i8** %fn, align 4
  %22 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %call32 = call i32 %22(i8** %fn)
  %23 = load i8*, i8** %filename, align 4
  call void @xfree(i8* %23)
  %24 = load i8*, i8** %fn, align 4
  store i8* %24, i8** %filename, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then28, %if.then26
  %25 = load i32, i32* %nontrivial_match.addr, align 4
  %tobool34 = icmp ne i32 %25, 0
  br i1 %tobool34, label %land.lhs.true35, label %cond.false

land.lhs.true35:                                  ; preds = %if.end33
  %26 = load i32, i32* @rl_completion_mark_symlink_dirs, align 4
  %cmp36 = icmp eq i32 %26, 0
  br i1 %cmp36, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true35
  %27 = load i8*, i8** %filename, align 4
  %call38 = call i32 @lstat(i8* %27, %struct.stat* %finfo)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true35, %if.end33
  %28 = load i8*, i8** %filename, align 4
  %call39 = call i32 @stat(i8* %28, %struct.stat* %finfo)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call38, %cond.true ], [ %call39, %cond.false ]
  store i32 %cond, i32* %s, align 4
  %29 = load i32, i32* %s, align 4
  %cmp40 = icmp eq i32 %29, 0
  br i1 %cmp40, label %land.lhs.true42, label %if.else71

land.lhs.true42:                                  ; preds = %cond.end
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %30 = load i32, i32* %st_mode, align 8
  %and = and i32 %30, 61440
  %cmp43 = icmp eq i32 %and, 16384
  br i1 %cmp43, label %if.then45, label %if.else71

if.then45:                                        ; preds = %land.lhs.true42
  %31 = load i32, i32* @_rl_complete_mark_directories, align 4
  %tobool46 = icmp ne i32 %31, 0
  br i1 %tobool46, label %if.then47, label %if.end70

if.then47:                                        ; preds = %if.then45
  %32 = load i32, i32* @rl_point, align 4
  %tobool48 = icmp ne i32 %32, 0
  br i1 %tobool48, label %land.lhs.true49, label %if.else61

land.lhs.true49:                                  ; preds = %if.then47
  %33 = load i8*, i8** @rl_line_buffer, align 4
  %34 = load i32, i32* @rl_point, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %35 to i32
  %cmp52 = icmp eq i32 %conv51, 0
  br i1 %cmp52, label %land.lhs.true54, label %if.else61

land.lhs.true54:                                  ; preds = %land.lhs.true49
  %36 = load i8*, i8** @rl_line_buffer, align 4
  %37 = load i32, i32* @rl_point, align 4
  %sub55 = sub nsw i32 %37, 1
  %arrayidx56 = getelementptr inbounds i8, i8* %36, i32 %sub55
  %38 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %38 to i32
  %cmp58 = icmp eq i32 %conv57, 47
  br i1 %cmp58, label %if.then60, label %if.else61

if.then60:                                        ; preds = %land.lhs.true54
  br label %if.end69

if.else61:                                        ; preds = %land.lhs.true54, %land.lhs.true49, %if.then47
  %39 = load i8*, i8** @rl_line_buffer, align 4
  %40 = load i32, i32* @rl_point, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %41 to i32
  %cmp64 = icmp ne i32 %conv63, 47
  br i1 %cmp64, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.else61
  %call67 = call i32 @rl_insert_text(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.else61
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then60
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then45
  br label %if.end92

if.else71:                                        ; preds = %land.lhs.true42, %cond.end
  %42 = load i32, i32* %s, align 4
  %cmp72 = icmp eq i32 %42, 0
  br i1 %cmp72, label %land.lhs.true74, label %if.else83

land.lhs.true74:                                  ; preds = %if.else71
  %st_mode75 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %43 = load i32, i32* %st_mode75, align 8
  %and76 = and i32 %43, 61440
  %cmp77 = icmp eq i32 %and76, 40960
  br i1 %cmp77, label %land.lhs.true79, label %if.else83

land.lhs.true79:                                  ; preds = %land.lhs.true74
  %44 = load i8*, i8** %filename, align 4
  %call80 = call i32 @path_isdir(i8* %44)
  %tobool81 = icmp ne i32 %call80, 0
  br i1 %tobool81, label %if.then82, label %if.else83

if.then82:                                        ; preds = %land.lhs.true79
  br label %if.end91

if.else83:                                        ; preds = %land.lhs.true79, %land.lhs.true74, %if.else71
  %45 = load i32, i32* @rl_point, align 4
  %46 = load i32, i32* @rl_end, align 4
  %cmp84 = icmp eq i32 %45, %46
  br i1 %cmp84, label %land.lhs.true86, label %if.end90

land.lhs.true86:                                  ; preds = %if.else83
  %47 = load i32, i32* %temp_string_index, align 4
  %tobool87 = icmp ne i32 %47, 0
  br i1 %tobool87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %land.lhs.true86
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 0
  %call89 = call i32 @rl_insert_text(i8* %arraydecay)
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %land.lhs.true86, %if.else83
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.then82
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %if.end70
  %48 = load i8*, i8** %filename, align 4
  call void @xfree(i8* %48)
  br label %if.end102

if.else93:                                        ; preds = %if.end22
  %49 = load i32, i32* @rl_point, align 4
  %50 = load i32, i32* @rl_end, align 4
  %cmp94 = icmp eq i32 %49, %50
  br i1 %cmp94, label %land.lhs.true96, label %if.end101

land.lhs.true96:                                  ; preds = %if.else93
  %51 = load i32, i32* %temp_string_index, align 4
  %tobool97 = icmp ne i32 %51, 0
  br i1 %tobool97, label %if.then98, label %if.end101

if.then98:                                        ; preds = %land.lhs.true96
  %arraydecay99 = getelementptr inbounds [4 x i8], [4 x i8]* %temp_string, i32 0, i32 0
  %call100 = call i32 @rl_insert_text(i8* %arraydecay99)
  br label %if.end101

if.end101:                                        ; preds = %if.then98, %land.lhs.true96, %if.else93
  br label %if.end102

if.end102:                                        ; preds = %if.end101, %if.end92
  %52 = load i32, i32* %temp_string_index, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind
define internal void @insert_all_matches(i8** %matches, i32 %point, i8* %qc) #0 {
entry:
  %matches.addr = alloca i8**, align 4
  %point.addr = alloca i32, align 4
  %qc.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %rp = alloca i8*, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  store i32 %point, i32* %point.addr, align 4
  store i8* %qc, i8** %qc.addr, align 4
  %call = call i32 @rl_begin_undo_group()
  %0 = load i8*, i8** %qc.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %qc.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32, i32* %point.addr, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* %point.addr, align 4
  %sub = sub nsw i32 %5, 1
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %sub
  %6 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %6 to i32
  %7 = load i8*, i8** %qc.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv6 = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv5, %conv6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true4
  %9 = load i32, i32* %point.addr, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* %point.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  %10 = load i32, i32* %point.addr, align 4
  %11 = load i32, i32* @rl_point, align 4
  %call8 = call i32 @rl_delete_text(i32 %10, i32 %11)
  %12 = load i32, i32* %point.addr, align 4
  store i32 %12, i32* @rl_point, align 4
  %13 = load i8**, i8*** %matches.addr, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %13, i32 1
  %14 = load i8*, i8** %arrayidx9, align 4
  %tobool10 = icmp ne i8* %14, null
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then11
  %15 = load i8**, i8*** %matches.addr, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx12, align 4
  %tobool13 = icmp ne i8* %17, null
  br i1 %tobool13, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load i8**, i8*** %matches.addr, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %18, i32 %19
  %20 = load i8*, i8** %arrayidx14, align 4
  %21 = load i8*, i8** %qc.addr, align 4
  %call15 = call i8* @make_quoted_replacement(i8* %20, i32 1, i8* %21)
  store i8* %call15, i8** %rp, align 4
  %22 = load i8*, i8** %rp, align 4
  %call16 = call i32 @rl_insert_text(i8* %22)
  %call17 = call i32 @rl_insert_text(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %23 = load i8*, i8** %rp, align 4
  %24 = load i8**, i8*** %matches.addr, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx18, align 4
  %cmp19 = icmp ne i8* %23, %26
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %for.body
  %27 = load i8*, i8** %rp, align 4
  call void @xfree(i8* %27)
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end32

if.else:                                          ; preds = %if.end
  %29 = load i8**, i8*** %matches.addr, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %29, i32 0
  %30 = load i8*, i8** %arrayidx23, align 4
  %31 = load i8*, i8** %qc.addr, align 4
  %call24 = call i8* @make_quoted_replacement(i8* %30, i32 1, i8* %31)
  store i8* %call24, i8** %rp, align 4
  %32 = load i8*, i8** %rp, align 4
  %call25 = call i32 @rl_insert_text(i8* %32)
  %call26 = call i32 @rl_insert_text(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %33 = load i8*, i8** %rp, align 4
  %34 = load i8**, i8*** %matches.addr, align 4
  %arrayidx27 = getelementptr inbounds i8*, i8** %34, i32 0
  %35 = load i8*, i8** %arrayidx27, align 4
  %cmp28 = icmp ne i8* %33, %35
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.else
  %36 = load i8*, i8** %rp, align 4
  call void @xfree(i8* %36)
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %for.end
  %call33 = call i32 @rl_end_undo_group()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_complete_sigcleanup(i32 %sig, i8* %ptr) #0 {
entry:
  %sig.addr = alloca i32, align 4
  %ptr.addr = alloca i8*, align 4
  store i32 %sig, i32* %sig.addr, align 4
  store i8* %ptr, i8** %ptr.addr, align 4
  %0 = load i32, i32* %sig.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %ptr.addr, align 4
  %2 = bitcast i8* %1 to i8**
  call void @_rl_free_match_list(i8** %2)
  store i32 1, i32* @_rl_complete_display_matches_interrupt, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @_rl_ttymsg(i8*, ...) #1

declare void @_rl_signal_handler(i32) #1

; Function Attrs: noinline nounwind
define i8** @rl_completion_matches(i8* %text, i8* (i8*, i32)* %entry_function) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %entry_function.addr = alloca i8* (i8*, i32)*, align 4
  %i = alloca i32, align 4
  %match_list_size = alloca i32, align 4
  %match_list = alloca i8**, align 4
  %matches = alloca i32, align 4
  %string = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i8* (i8*, i32)* %entry_function, i8* (i8*, i32)** %entry_function.addr, align 4
  store i32 0, i32* %matches, align 4
  store i32 10, i32* %match_list_size, align 4
  %0 = load i32, i32* %match_list_size, align 4
  %add = add nsw i32 %0, 1
  %mul = mul i32 %add, 4
  %call = call i8* @xmalloc(i32 %mul)
  %1 = bitcast i8* %call to i8**
  store i8** %1, i8*** %match_list, align 4
  %2 = load i8**, i8*** %match_list, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 1
  store i8* null, i8** %arrayidx, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end21, %entry
  %3 = load i8* (i8*, i32)*, i8* (i8*, i32)** %entry_function.addr, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %matches, align 4
  %call1 = call i8* %3(i8* %4, i32 %5)
  store i8* %call1, i8** %string, align 4
  %tobool = icmp ne i8* %call1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load volatile i32, i32* @_rl_caught_signal, align 4
  %cmp = icmp ne i32 %6, 0
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %while.body
  %7 = load i8* (i8*, i32)*, i8* (i8*, i32)** %entry_function.addr, align 4
  %cmp2 = icmp eq i8* (i8*, i32)* %7, @rl_filename_completion_function
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then3
  %8 = load i8**, i8*** %match_list, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx4, align 4
  %tobool5 = icmp ne i8* %10, null
  br i1 %tobool5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8**, i8*** %match_list, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx6, align 4
  call void @xfree(i8* %13)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %if.then
  %15 = load i8**, i8*** %match_list, align 4
  %16 = bitcast i8** %15 to i8*
  call void @xfree(i8* %16)
  store i8** null, i8*** %match_list, align 4
  store i32 0, i32* %match_list_size, align 4
  store i32 0, i32* %matches, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %17 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool7 = icmp ne i32 %17, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %do.body
  %18 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %18)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end9
  br label %if.end10

if.end10:                                         ; preds = %do.end, %while.body
  %19 = load i32, i32* %matches, align 4
  %add11 = add nsw i32 %19, 1
  %20 = load i32, i32* %match_list_size, align 4
  %cmp12 = icmp sge i32 %add11, %20
  br i1 %cmp12, label %if.then13, label %if.end18

if.then13:                                        ; preds = %if.end10
  %21 = load i8**, i8*** %match_list, align 4
  %22 = bitcast i8** %21 to i8*
  %23 = load i32, i32* %match_list_size, align 4
  %add14 = add nsw i32 %23, 10
  store i32 %add14, i32* %match_list_size, align 4
  %add15 = add nsw i32 %add14, 1
  %mul16 = mul i32 %add15, 4
  %call17 = call i8* @xrealloc(i8* %22, i32 %mul16)
  %24 = bitcast i8* %call17 to i8**
  store i8** %24, i8*** %match_list, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then13, %if.end10
  %25 = load i8**, i8*** %match_list, align 4
  %cmp19 = icmp eq i8** %25, null
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  %26 = load i8**, i8*** %match_list, align 4
  store i8** %26, i8*** %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end18
  %27 = load i8*, i8** %string, align 4
  %28 = load i8**, i8*** %match_list, align 4
  %29 = load i32, i32* %matches, align 4
  %inc22 = add nsw i32 %29, 1
  store i32 %inc22, i32* %matches, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %28, i32 %inc22
  store i8* %27, i8** %arrayidx23, align 4
  %30 = load i8**, i8*** %match_list, align 4
  %31 = load i32, i32* %matches, align 4
  %add24 = add nsw i32 %31, 1
  %arrayidx25 = getelementptr inbounds i8*, i8** %30, i32 %add24
  store i8* null, i8** %arrayidx25, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %32 = load i32, i32* %matches, align 4
  %tobool26 = icmp ne i32 %32, 0
  br i1 %tobool26, label %if.then27, label %if.else

if.then27:                                        ; preds = %while.end
  %33 = load i8**, i8*** %match_list, align 4
  %34 = load i32, i32* %matches, align 4
  %35 = load i8*, i8** %text.addr, align 4
  %call28 = call i32 @compute_lcd_of_matches(i8** %33, i32 %34, i8* %35)
  br label %if.end29

if.else:                                          ; preds = %while.end
  %36 = load i8**, i8*** %match_list, align 4
  %37 = bitcast i8** %36 to i8*
  call void @xfree(i8* %37)
  store i8** null, i8*** %match_list, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then27
  %38 = load i8**, i8*** %match_list, align 4
  store i8** %38, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.then20
  %39 = load i8**, i8*** %retval, align 4
  ret i8** %39
}

declare i8* @xrealloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @compute_lcd_of_matches(i8** %match_list, i32 %matches, i8* %text) #0 {
entry:
  %retval = alloca i32, align 4
  %match_list.addr = alloca i8**, align 4
  %matches.addr = alloca i32, align 4
  %text.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %si = alloca i32, align 4
  %low = alloca i32, align 4
  %lx = alloca i32, align 4
  %dtext = alloca i8*, align 4
  %v = alloca i32, align 4
  %v1 = alloca i32, align 4
  %v2 = alloca i32, align 4
  %ps1 = alloca %struct.__mbstate_t, align 4
  %ps2 = alloca %struct.__mbstate_t, align 4
  %wc1 = alloca i32, align 4
  %wc2 = alloca i32, align 4
  %ps_back = alloca %struct.__mbstate_t, align 4
  store i8** %match_list, i8*** %match_list.addr, align 4
  store i32 %matches, i32* %matches.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i32, i32* %matches.addr, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 1
  %2 = load i8*, i8** %arrayidx, align 4
  %3 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i32 0
  store i8* %2, i8** %arrayidx1, align 4
  %4 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %4, i32 1
  store i8* null, i8** %arrayidx2, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 1, i32* %i, align 4
  store i32 100000, i32* %low, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc167, %if.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %matches.addr, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %for.body, label %for.end169

for.body:                                         ; preds = %for.cond
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp4 = icmp ugt i32 %call, 1
  br i1 %cmp4, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* @rl_byte_oriented, align 4
  %cmp5 = icmp eq i32 %7, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  %8 = bitcast %struct.__mbstate_t* %ps1 to i8*
  call void @llvm.memset.p0i8.i32(i8* %8, i8 0, i32 8, i32 4, i1 false)
  %9 = bitcast %struct.__mbstate_t* %ps2 to i8*
  call void @llvm.memset.p0i8.i32(i8* %9, i8 0, i32 8, i32 4, i1 false)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %land.lhs.true, %for.body
  %10 = load i32, i32* @_rl_completion_case_fold, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then8, label %if.else115

if.then8:                                         ; preds = %if.end7
  store i32 0, i32* %si, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %if.then8
  %11 = load i8**, i8*** %match_list.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx10, align 4
  %14 = load i32, i32* %si, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv = zext i8 %15 to i32
  %16 = load i8**, i8*** %match_list.addr, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx12, align 4
  %19 = load i32, i32* %si, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %20 to i32
  %cmp15 = icmp eq i32 %conv, %conv14
  br i1 %cmp15, label %land.lhs.true17, label %cond.false

land.lhs.true17:                                  ; preds = %for.cond9
  %21 = load i8**, i8*** %match_list.addr, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %21, i32 %22
  %23 = load i8*, i8** %arrayidx18, align 4
  %24 = load i32, i32* %si, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %25 to i32
  %call21 = call i32 @isupper(i32 %conv20) #4
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true17
  %26 = load i8**, i8*** %match_list.addr, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %26, i32 %27
  %28 = load i8*, i8** %arrayidx23, align 4
  %29 = load i32, i32* %si, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %30 to i32
  %call26 = call i32 @tolower(i32 %conv25) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true17, %for.cond9
  %31 = load i8**, i8*** %match_list.addr, align 4
  %32 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8*, i8** %31, i32 %32
  %33 = load i8*, i8** %arrayidx27, align 4
  %34 = load i32, i32* %si, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %35 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call26, %cond.true ], [ %conv29, %cond.false ]
  store i32 %cond, i32* %c1, align 4
  %tobool30 = icmp ne i32 %cond, 0
  br i1 %tobool30, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.end
  %36 = load i8**, i8*** %match_list.addr, align 4
  %37 = load i32, i32* %i, align 4
  %add = add nsw i32 %37, 1
  %arrayidx31 = getelementptr inbounds i8*, i8** %36, i32 %add
  %38 = load i8*, i8** %arrayidx31, align 4
  %39 = load i32, i32* %si, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx32, align 1
  %conv33 = zext i8 %40 to i32
  %41 = load i8**, i8*** %match_list.addr, align 4
  %42 = load i32, i32* %i, align 4
  %add34 = add nsw i32 %42, 1
  %arrayidx35 = getelementptr inbounds i8*, i8** %41, i32 %add34
  %43 = load i8*, i8** %arrayidx35, align 4
  %44 = load i32, i32* %si, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %45 to i32
  %cmp38 = icmp eq i32 %conv33, %conv37
  br i1 %cmp38, label %land.lhs.true40, label %cond.false53

land.lhs.true40:                                  ; preds = %land.rhs
  %46 = load i8**, i8*** %match_list.addr, align 4
  %47 = load i32, i32* %i, align 4
  %add41 = add nsw i32 %47, 1
  %arrayidx42 = getelementptr inbounds i8*, i8** %46, i32 %add41
  %48 = load i8*, i8** %arrayidx42, align 4
  %49 = load i32, i32* %si, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %48, i32 %49
  %50 = load i8, i8* %arrayidx43, align 1
  %conv44 = zext i8 %50 to i32
  %call45 = call i32 @isupper(i32 %conv44) #4
  %tobool46 = icmp ne i32 %call45, 0
  br i1 %tobool46, label %cond.true47, label %cond.false53

cond.true47:                                      ; preds = %land.lhs.true40
  %51 = load i8**, i8*** %match_list.addr, align 4
  %52 = load i32, i32* %i, align 4
  %add48 = add nsw i32 %52, 1
  %arrayidx49 = getelementptr inbounds i8*, i8** %51, i32 %add48
  %53 = load i8*, i8** %arrayidx49, align 4
  %54 = load i32, i32* %si, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %53, i32 %54
  %55 = load i8, i8* %arrayidx50, align 1
  %conv51 = zext i8 %55 to i32
  %call52 = call i32 @tolower(i32 %conv51) #4
  br label %cond.end58

cond.false53:                                     ; preds = %land.lhs.true40, %land.rhs
  %56 = load i8**, i8*** %match_list.addr, align 4
  %57 = load i32, i32* %i, align 4
  %add54 = add nsw i32 %57, 1
  %arrayidx55 = getelementptr inbounds i8*, i8** %56, i32 %add54
  %58 = load i8*, i8** %arrayidx55, align 4
  %59 = load i32, i32* %si, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %58, i32 %59
  %60 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %60 to i32
  br label %cond.end58

cond.end58:                                       ; preds = %cond.false53, %cond.true47
  %cond59 = phi i32 [ %call52, %cond.true47 ], [ %conv57, %cond.false53 ]
  store i32 %cond59, i32* %c2, align 4
  %tobool60 = icmp ne i32 %cond59, 0
  br label %land.end

land.end:                                         ; preds = %cond.end58, %cond.end
  %61 = phi i1 [ false, %cond.end ], [ %tobool60, %cond.end58 ]
  br i1 %61, label %for.body61, label %for.end

for.body61:                                       ; preds = %land.end
  %call62 = call i32 @__ctype_get_mb_cur_max()
  %cmp63 = icmp ugt i32 %call62, 1
  br i1 %cmp63, label %land.lhs.true65, label %if.else109

land.lhs.true65:                                  ; preds = %for.body61
  %62 = load i32, i32* @rl_byte_oriented, align 4
  %cmp66 = icmp eq i32 %62, 0
  br i1 %cmp66, label %if.then68, label %if.else109

if.then68:                                        ; preds = %land.lhs.true65
  %63 = load i8**, i8*** %match_list.addr, align 4
  %64 = load i32, i32* %i, align 4
  %arrayidx69 = getelementptr inbounds i8*, i8** %63, i32 %64
  %65 = load i8*, i8** %arrayidx69, align 4
  %66 = load i32, i32* %si, align 4
  %add.ptr = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8**, i8*** %match_list.addr, align 4
  %68 = load i32, i32* %i, align 4
  %arrayidx70 = getelementptr inbounds i8*, i8** %67, i32 %68
  %69 = load i8*, i8** %arrayidx70, align 4
  %70 = load i32, i32* %si, align 4
  %add.ptr71 = getelementptr inbounds i8, i8* %69, i32 %70
  %call72 = call i32 @strlen(i8* %add.ptr71)
  %call73 = call i32 @mbrtowc(i32* %wc1, i8* %add.ptr, i32 %call72, %struct.__mbstate_t* %ps1)
  store i32 %call73, i32* %v1, align 4
  %71 = load i8**, i8*** %match_list.addr, align 4
  %72 = load i32, i32* %i, align 4
  %add74 = add nsw i32 %72, 1
  %arrayidx75 = getelementptr inbounds i8*, i8** %71, i32 %add74
  %73 = load i8*, i8** %arrayidx75, align 4
  %74 = load i32, i32* %si, align 4
  %add.ptr76 = getelementptr inbounds i8, i8* %73, i32 %74
  %75 = load i8**, i8*** %match_list.addr, align 4
  %76 = load i32, i32* %i, align 4
  %add77 = add nsw i32 %76, 1
  %arrayidx78 = getelementptr inbounds i8*, i8** %75, i32 %add77
  %77 = load i8*, i8** %arrayidx78, align 4
  %78 = load i32, i32* %si, align 4
  %add.ptr79 = getelementptr inbounds i8, i8* %77, i32 %78
  %call80 = call i32 @strlen(i8* %add.ptr79)
  %call81 = call i32 @mbrtowc(i32* %wc2, i8* %add.ptr76, i32 %call80, %struct.__mbstate_t* %ps2)
  store i32 %call81, i32* %v2, align 4
  %79 = load i32, i32* %v1, align 4
  %cmp82 = icmp eq i32 %79, -1
  br i1 %cmp82, label %if.then92, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then68
  %80 = load i32, i32* %v1, align 4
  %cmp84 = icmp eq i32 %80, -2
  br i1 %cmp84, label %if.then92, label %lor.lhs.false86

lor.lhs.false86:                                  ; preds = %lor.lhs.false
  %81 = load i32, i32* %v2, align 4
  %cmp87 = icmp eq i32 %81, -1
  br i1 %cmp87, label %if.then92, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %lor.lhs.false86
  %82 = load i32, i32* %v2, align 4
  %cmp90 = icmp eq i32 %82, -2
  br i1 %cmp90, label %if.then92, label %if.end97

if.then92:                                        ; preds = %lor.lhs.false89, %lor.lhs.false86, %lor.lhs.false, %if.then68
  %83 = load i32, i32* %c1, align 4
  %84 = load i32, i32* %c2, align 4
  %cmp93 = icmp ne i32 %83, %84
  br i1 %cmp93, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.then92
  br label %for.end

if.end96:                                         ; preds = %if.then92
  br label %for.inc

if.end97:                                         ; preds = %lor.lhs.false89
  %85 = load i32, i32* %wc1, align 4
  %call98 = call i32 @towlower(i32 %85)
  store i32 %call98, i32* %wc1, align 4
  %86 = load i32, i32* %wc2, align 4
  %call99 = call i32 @towlower(i32 %86)
  store i32 %call99, i32* %wc2, align 4
  %87 = load i32, i32* %wc1, align 4
  %88 = load i32, i32* %wc2, align 4
  %cmp100 = icmp ne i32 %87, %88
  br i1 %cmp100, label %if.then102, label %if.else

if.then102:                                       ; preds = %if.end97
  br label %for.end

if.else:                                          ; preds = %if.end97
  %89 = load i32, i32* %v1, align 4
  %cmp103 = icmp ugt i32 %89, 1
  br i1 %cmp103, label %if.then105, label %if.end107

if.then105:                                       ; preds = %if.else
  %90 = load i32, i32* %v1, align 4
  %sub = sub i32 %90, 1
  %91 = load i32, i32* %si, align 4
  %add106 = add i32 %91, %sub
  store i32 %add106, i32* %si, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.then105, %if.else
  br label %if.end108

if.end108:                                        ; preds = %if.end107
  br label %if.end114

if.else109:                                       ; preds = %land.lhs.true65, %for.body61
  %92 = load i32, i32* %c1, align 4
  %93 = load i32, i32* %c2, align 4
  %cmp110 = icmp ne i32 %92, %93
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.else109
  br label %for.end

if.end113:                                        ; preds = %if.else109
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %if.end108
  br label %for.inc

for.inc:                                          ; preds = %if.end114, %if.end96
  %94 = load i32, i32* %si, align 4
  %inc = add nsw i32 %94, 1
  store i32 %inc, i32* %si, align 4
  br label %for.cond9

for.end:                                          ; preds = %if.then112, %if.then102, %if.then95, %land.end
  br label %if.end162

if.else115:                                       ; preds = %if.end7
  store i32 0, i32* %si, align 4
  br label %for.cond116

for.cond116:                                      ; preds = %for.inc159, %if.else115
  %95 = load i8**, i8*** %match_list.addr, align 4
  %96 = load i32, i32* %i, align 4
  %arrayidx117 = getelementptr inbounds i8*, i8** %95, i32 %96
  %97 = load i8*, i8** %arrayidx117, align 4
  %98 = load i32, i32* %si, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %97, i32 %98
  %99 = load i8, i8* %arrayidx118, align 1
  %conv119 = sext i8 %99 to i32
  store i32 %conv119, i32* %c1, align 4
  %tobool120 = icmp ne i32 %conv119, 0
  br i1 %tobool120, label %land.rhs121, label %land.end127

land.rhs121:                                      ; preds = %for.cond116
  %100 = load i8**, i8*** %match_list.addr, align 4
  %101 = load i32, i32* %i, align 4
  %add122 = add nsw i32 %101, 1
  %arrayidx123 = getelementptr inbounds i8*, i8** %100, i32 %add122
  %102 = load i8*, i8** %arrayidx123, align 4
  %103 = load i32, i32* %si, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %102, i32 %103
  %104 = load i8, i8* %arrayidx124, align 1
  %conv125 = sext i8 %104 to i32
  store i32 %conv125, i32* %c2, align 4
  %tobool126 = icmp ne i32 %conv125, 0
  br label %land.end127

land.end127:                                      ; preds = %land.rhs121, %for.cond116
  %105 = phi i1 [ false, %for.cond116 ], [ %tobool126, %land.rhs121 ]
  br i1 %105, label %for.body128, label %for.end161

for.body128:                                      ; preds = %land.end127
  %call129 = call i32 @__ctype_get_mb_cur_max()
  %cmp130 = icmp ugt i32 %call129, 1
  br i1 %cmp130, label %land.lhs.true132, label %if.else153

land.lhs.true132:                                 ; preds = %for.body128
  %106 = load i32, i32* @rl_byte_oriented, align 4
  %cmp133 = icmp eq i32 %106, 0
  br i1 %cmp133, label %if.then135, label %if.else153

if.then135:                                       ; preds = %land.lhs.true132
  %107 = bitcast %struct.__mbstate_t* %ps_back to i8*
  %108 = bitcast %struct.__mbstate_t* %ps1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %107, i8* %108, i32 8, i32 4, i1 false)
  %109 = load i8**, i8*** %match_list.addr, align 4
  %110 = load i32, i32* %i, align 4
  %arrayidx136 = getelementptr inbounds i8*, i8** %109, i32 %110
  %111 = load i8*, i8** %arrayidx136, align 4
  %112 = load i32, i32* %si, align 4
  %113 = load i8**, i8*** %match_list.addr, align 4
  %114 = load i32, i32* %i, align 4
  %add137 = add nsw i32 %114, 1
  %arrayidx138 = getelementptr inbounds i8*, i8** %113, i32 %add137
  %115 = load i8*, i8** %arrayidx138, align 4
  %116 = load i32, i32* %si, align 4
  %call139 = call i32 @_rl_compare_chars(i8* %111, i32 %112, %struct.__mbstate_t* %ps1, i8* %115, i32 %116, %struct.__mbstate_t* %ps2)
  %tobool140 = icmp ne i32 %call139, 0
  br i1 %tobool140, label %if.else142, label %if.then141

if.then141:                                       ; preds = %if.then135
  br label %for.end161

if.else142:                                       ; preds = %if.then135
  %117 = load i8**, i8*** %match_list.addr, align 4
  %118 = load i32, i32* %i, align 4
  %arrayidx143 = getelementptr inbounds i8*, i8** %117, i32 %118
  %119 = load i8*, i8** %arrayidx143, align 4
  %120 = load i32, i32* %si, align 4
  %arrayidx144 = getelementptr inbounds i8, i8* %119, i32 %120
  %call145 = call i32 @_rl_get_char_len(i8* %arrayidx144, %struct.__mbstate_t* %ps_back)
  store i32 %call145, i32* %v, align 4
  %cmp146 = icmp sgt i32 %call145, 1
  br i1 %cmp146, label %if.then148, label %if.end151

if.then148:                                       ; preds = %if.else142
  %121 = load i32, i32* %v, align 4
  %sub149 = sub nsw i32 %121, 1
  %122 = load i32, i32* %si, align 4
  %add150 = add nsw i32 %122, %sub149
  store i32 %add150, i32* %si, align 4
  br label %if.end151

if.end151:                                        ; preds = %if.then148, %if.else142
  br label %if.end152

if.end152:                                        ; preds = %if.end151
  br label %if.end158

if.else153:                                       ; preds = %land.lhs.true132, %for.body128
  %123 = load i32, i32* %c1, align 4
  %124 = load i32, i32* %c2, align 4
  %cmp154 = icmp ne i32 %123, %124
  br i1 %cmp154, label %if.then156, label %if.end157

if.then156:                                       ; preds = %if.else153
  br label %for.end161

if.end157:                                        ; preds = %if.else153
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.end152
  br label %for.inc159

for.inc159:                                       ; preds = %if.end158
  %125 = load i32, i32* %si, align 4
  %inc160 = add nsw i32 %125, 1
  store i32 %inc160, i32* %si, align 4
  br label %for.cond116

for.end161:                                       ; preds = %if.then156, %if.then141, %land.end127
  br label %if.end162

if.end162:                                        ; preds = %for.end161, %for.end
  %126 = load i32, i32* %low, align 4
  %127 = load i32, i32* %si, align 4
  %cmp163 = icmp sgt i32 %126, %127
  br i1 %cmp163, label %if.then165, label %if.end166

if.then165:                                       ; preds = %if.end162
  %128 = load i32, i32* %si, align 4
  store i32 %128, i32* %low, align 4
  br label %if.end166

if.end166:                                        ; preds = %if.then165, %if.end162
  br label %for.inc167

for.inc167:                                       ; preds = %if.end166
  %129 = load i32, i32* %i, align 4
  %inc168 = add nsw i32 %129, 1
  store i32 %inc168, i32* %i, align 4
  br label %for.cond

for.end169:                                       ; preds = %for.cond
  %130 = load i32, i32* %low, align 4
  %cmp170 = icmp eq i32 %130, 0
  br i1 %cmp170, label %land.lhs.true172, label %if.else184

land.lhs.true172:                                 ; preds = %for.end169
  %131 = load i8*, i8** %text.addr, align 4
  %tobool173 = icmp ne i8* %131, null
  br i1 %tobool173, label %land.lhs.true174, label %if.else184

land.lhs.true174:                                 ; preds = %land.lhs.true172
  %132 = load i8*, i8** %text.addr, align 4
  %133 = load i8, i8* %132, align 1
  %conv175 = sext i8 %133 to i32
  %tobool176 = icmp ne i32 %conv175, 0
  br i1 %tobool176, label %if.then177, label %if.else184

if.then177:                                       ; preds = %land.lhs.true174
  %134 = load i8*, i8** %text.addr, align 4
  %call178 = call i32 @strlen(i8* %134)
  %add179 = add i32 %call178, 1
  %call180 = call i8* @xmalloc(i32 %add179)
  %135 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx181 = getelementptr inbounds i8*, i8** %135, i32 0
  store i8* %call180, i8** %arrayidx181, align 4
  %136 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx182 = getelementptr inbounds i8*, i8** %136, i32 0
  %137 = load i8*, i8** %arrayidx182, align 4
  %138 = load i8*, i8** %text.addr, align 4
  %call183 = call i8* @strcpy(i8* %137, i8* %138)
  br label %if.end241

if.else184:                                       ; preds = %land.lhs.true174, %land.lhs.true172, %for.end169
  %139 = load i32, i32* %low, align 4
  %add185 = add nsw i32 %139, 1
  %call186 = call i8* @xmalloc(i32 %add185)
  %140 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx187 = getelementptr inbounds i8*, i8** %140, i32 0
  store i8* %call186, i8** %arrayidx187, align 4
  %141 = load i32, i32* @_rl_completion_case_fold, align 4
  %tobool188 = icmp ne i32 %141, 0
  br i1 %tobool188, label %if.then189, label %if.else234

if.then189:                                       ; preds = %if.else184
  store i8* null, i8** %dtext, align 4
  %142 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool190 = icmp ne i32 %142, 0
  br i1 %tobool190, label %land.lhs.true191, label %if.end199

land.lhs.true191:                                 ; preds = %if.then189
  %143 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %tobool192 = icmp ne i8* (i8*, i32)* %143, null
  br i1 %tobool192, label %land.lhs.true193, label %if.end199

land.lhs.true193:                                 ; preds = %land.lhs.true191
  %144 = load i32, i32* @rl_completion_found_quote, align 4
  %tobool194 = icmp ne i32 %144, 0
  br i1 %tobool194, label %land.lhs.true195, label %if.end199

land.lhs.true195:                                 ; preds = %land.lhs.true193
  %145 = load i32, i32* @rl_filename_quoting_desired, align 4
  %tobool196 = icmp ne i32 %145, 0
  br i1 %tobool196, label %if.then197, label %if.end199

if.then197:                                       ; preds = %land.lhs.true195
  %146 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_filename_dequoting_function, align 4
  %147 = load i8*, i8** %text.addr, align 4
  %148 = load i32, i32* @rl_completion_quote_character, align 4
  %call198 = call i8* %146(i8* %147, i32 %148)
  store i8* %call198, i8** %dtext, align 4
  %149 = load i8*, i8** %dtext, align 4
  store i8* %149, i8** %text.addr, align 4
  br label %if.end199

if.end199:                                        ; preds = %if.then197, %land.lhs.true195, %land.lhs.true193, %land.lhs.true191, %if.then189
  %150 = load i8**, i8*** %match_list.addr, align 4
  %add.ptr200 = getelementptr inbounds i8*, i8** %150, i32 1
  %151 = bitcast i8** %add.ptr200 to i8*
  %152 = load i32, i32* %matches.addr, align 4
  call void @qsort(i8* %151, i32 %152, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @_rl_qsort_string_compare to i32 (i8*, i8*)*))
  %153 = load i8*, i8** %text.addr, align 4
  %call201 = call i32 @strlen(i8* %153)
  store i32 %call201, i32* %si, align 4
  %154 = load i32, i32* %si, align 4
  %155 = load i32, i32* %low, align 4
  %cmp202 = icmp sle i32 %154, %155
  br i1 %cmp202, label %cond.true204, label %cond.false205

cond.true204:                                     ; preds = %if.end199
  %156 = load i32, i32* %si, align 4
  br label %cond.end206

cond.false205:                                    ; preds = %if.end199
  %157 = load i32, i32* %low, align 4
  br label %cond.end206

cond.end206:                                      ; preds = %cond.false205, %cond.true204
  %cond207 = phi i32 [ %156, %cond.true204 ], [ %157, %cond.false205 ]
  store i32 %cond207, i32* %lx, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond208

for.cond208:                                      ; preds = %for.inc221, %cond.end206
  %158 = load i32, i32* %i, align 4
  %159 = load i32, i32* %matches.addr, align 4
  %cmp209 = icmp sle i32 %158, %159
  br i1 %cmp209, label %for.body211, label %for.end223

for.body211:                                      ; preds = %for.cond208
  %160 = load i8**, i8*** %match_list.addr, align 4
  %161 = load i32, i32* %i, align 4
  %arrayidx212 = getelementptr inbounds i8*, i8** %160, i32 %161
  %162 = load i8*, i8** %arrayidx212, align 4
  %163 = load i8*, i8** %text.addr, align 4
  %164 = load i32, i32* %lx, align 4
  %call213 = call i32 @strncmp(i8* %162, i8* %163, i32 %164)
  %cmp214 = icmp eq i32 %call213, 0
  br i1 %cmp214, label %if.then216, label %if.end220

if.then216:                                       ; preds = %for.body211
  %165 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx217 = getelementptr inbounds i8*, i8** %165, i32 0
  %166 = load i8*, i8** %arrayidx217, align 4
  %167 = load i8**, i8*** %match_list.addr, align 4
  %168 = load i32, i32* %i, align 4
  %arrayidx218 = getelementptr inbounds i8*, i8** %167, i32 %168
  %169 = load i8*, i8** %arrayidx218, align 4
  %170 = load i32, i32* %low, align 4
  %call219 = call i8* @strncpy(i8* %166, i8* %169, i32 %170)
  br label %for.end223

if.end220:                                        ; preds = %for.body211
  br label %for.inc221

for.inc221:                                       ; preds = %if.end220
  %171 = load i32, i32* %i, align 4
  %inc222 = add nsw i32 %171, 1
  store i32 %inc222, i32* %i, align 4
  br label %for.cond208

for.end223:                                       ; preds = %if.then216, %for.cond208
  %172 = load i32, i32* %i, align 4
  %173 = load i32, i32* %matches.addr, align 4
  %cmp224 = icmp sgt i32 %172, %173
  br i1 %cmp224, label %if.then226, label %if.end230

if.then226:                                       ; preds = %for.end223
  %174 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx227 = getelementptr inbounds i8*, i8** %174, i32 0
  %175 = load i8*, i8** %arrayidx227, align 4
  %176 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx228 = getelementptr inbounds i8*, i8** %176, i32 1
  %177 = load i8*, i8** %arrayidx228, align 4
  %178 = load i32, i32* %low, align 4
  %call229 = call i8* @strncpy(i8* %175, i8* %177, i32 %178)
  br label %if.end230

if.end230:                                        ; preds = %if.then226, %for.end223
  %179 = load i8*, i8** %dtext, align 4
  %tobool231 = icmp ne i8* %179, null
  br i1 %tobool231, label %if.then232, label %if.end233

if.then232:                                       ; preds = %if.end230
  %180 = load i8*, i8** %dtext, align 4
  call void @free(i8* %180)
  br label %if.end233

if.end233:                                        ; preds = %if.then232, %if.end230
  br label %if.end238

if.else234:                                       ; preds = %if.else184
  %181 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx235 = getelementptr inbounds i8*, i8** %181, i32 0
  %182 = load i8*, i8** %arrayidx235, align 4
  %183 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx236 = getelementptr inbounds i8*, i8** %183, i32 1
  %184 = load i8*, i8** %arrayidx236, align 4
  %185 = load i32, i32* %low, align 4
  %call237 = call i8* @strncpy(i8* %182, i8* %184, i32 %185)
  br label %if.end238

if.end238:                                        ; preds = %if.else234, %if.end233
  %186 = load i8**, i8*** %match_list.addr, align 4
  %arrayidx239 = getelementptr inbounds i8*, i8** %186, i32 0
  %187 = load i8*, i8** %arrayidx239, align 4
  %188 = load i32, i32* %low, align 4
  %arrayidx240 = getelementptr inbounds i8, i8* %187, i32 %188
  store i8 0, i8* %arrayidx240, align 1
  br label %if.end241

if.end241:                                        ; preds = %if.end238, %if.then177
  %189 = load i32, i32* %matches.addr, align 4
  store i32 %189, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end241, %if.then
  %190 = load i32, i32* %retval, align 4
  ret i32 %190
}

; Function Attrs: noinline nounwind
define i8* @rl_username_completion_function(i8* %text, i32 %state) #0 {
entry:
  %retval = alloca i8*, align 4
  %text.addr = alloca i8*, align 4
  %state.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %state, i32* %state.addr, align 4
  %0 = load i32, i32* %state.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @rl_username_completion_function.username, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i8*, i8** @rl_username_completion_function.username, align 4
  call void @free(i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %3 = load i8*, i8** %text.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* @rl_username_completion_function.first_char, align 4
  %5 = load i32, i32* @rl_username_completion_function.first_char, align 4
  %cmp2 = icmp eq i32 %5, 126
  %conv3 = zext i1 %cmp2 to i32
  store i32 %conv3, i32* @rl_username_completion_function.first_char_loc, align 4
  %6 = load i8*, i8** %text.addr, align 4
  %7 = load i32, i32* @rl_username_completion_function.first_char_loc, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  %call = call i32 @strlen(i8* %arrayidx)
  %add = add i32 1, %call
  %call4 = call i8* @xmalloc(i32 %add)
  %8 = load i8*, i8** %text.addr, align 4
  %9 = load i32, i32* @rl_username_completion_function.first_char_loc, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i32 %9
  %call6 = call i8* @strcpy(i8* %call4, i8* %arrayidx5)
  store i8* %call6, i8** @rl_username_completion_function.username, align 4
  %10 = load i8*, i8** @rl_username_completion_function.username, align 4
  %call7 = call i32 @strlen(i8* %10)
  store i32 %call7, i32* @rl_username_completion_function.namelen, align 4
  call void @setpwent()
  br label %if.end8

if.end8:                                          ; preds = %if.end, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end26, %if.end8
  %call9 = call %struct.passwd* @getpwent()
  store %struct.passwd* %call9, %struct.passwd** @rl_username_completion_function.entry, align 4
  %tobool10 = icmp ne %struct.passwd* %call9, null
  br i1 %tobool10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i32, i32* @rl_username_completion_function.namelen, align 4
  %cmp11 = icmp eq i32 %11, 0
  br i1 %cmp11, label %if.then25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %12 = load i32, i32* @rl_username_completion_function.namelen, align 4
  %cmp13 = icmp eq i32 %12, 0
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  br i1 true, label %if.then25, label %if.end26

cond.false:                                       ; preds = %lor.lhs.false
  %13 = load i8*, i8** @rl_username_completion_function.username, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %14 to i32
  %15 = load %struct.passwd*, %struct.passwd** @rl_username_completion_function.entry, align 4
  %pw_name = getelementptr inbounds %struct.passwd, %struct.passwd* %15, i32 0, i32 0
  %16 = load i8*, i8** %pw_name, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %17 to i32
  %cmp19 = icmp eq i32 %conv16, %conv18
  br i1 %cmp19, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %cond.false
  %18 = load i8*, i8** @rl_username_completion_function.username, align 4
  %19 = load %struct.passwd*, %struct.passwd** @rl_username_completion_function.entry, align 4
  %pw_name21 = getelementptr inbounds %struct.passwd, %struct.passwd* %19, i32 0, i32 0
  %20 = load i8*, i8** %pw_name21, align 4
  %21 = load i32, i32* @rl_username_completion_function.namelen, align 4
  %call22 = call i32 @strncmp(i8* %18, i8* %20, i32 %21)
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true, %cond.true, %while.body
  br label %while.end

if.end26:                                         ; preds = %land.lhs.true, %cond.false, %cond.true
  br label %while.cond

while.end:                                        ; preds = %if.then25, %while.cond
  %22 = load %struct.passwd*, %struct.passwd** @rl_username_completion_function.entry, align 4
  %cmp27 = icmp eq %struct.passwd* %22, null
  br i1 %cmp27, label %if.then29, label %if.else

if.then29:                                        ; preds = %while.end
  call void @endpwent()
  store i8* null, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %while.end
  %23 = load %struct.passwd*, %struct.passwd** @rl_username_completion_function.entry, align 4
  %pw_name30 = getelementptr inbounds %struct.passwd, %struct.passwd* %23, i32 0, i32 0
  %24 = load i8*, i8** %pw_name30, align 4
  %call31 = call i32 @strlen(i8* %24)
  %add32 = add i32 2, %call31
  %call33 = call i8* @xmalloc(i32 %add32)
  store i8* %call33, i8** %value, align 4
  %25 = load i8*, i8** %text.addr, align 4
  %26 = load i8, i8* %25, align 1
  %27 = load i8*, i8** %value, align 4
  store i8 %26, i8* %27, align 1
  %28 = load i8*, i8** %value, align 4
  %29 = load i32, i32* @rl_username_completion_function.first_char_loc, align 4
  %add.ptr = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load %struct.passwd*, %struct.passwd** @rl_username_completion_function.entry, align 4
  %pw_name34 = getelementptr inbounds %struct.passwd, %struct.passwd* %30, i32 0, i32 0
  %31 = load i8*, i8** %pw_name34, align 4
  %call35 = call i8* @strcpy(i8* %add.ptr, i8* %31)
  %32 = load i32, i32* @rl_username_completion_function.first_char, align 4
  %cmp36 = icmp eq i32 %32, 126
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else
  store i32 1, i32* @rl_filename_completion_desired, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.else
  %33 = load i8*, i8** %value, align 4
  store i8* %33, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end39, %if.then29
  %34 = load i8*, i8** %retval, align 4
  ret i8* %34
}

declare void @setpwent() #1

declare %struct.passwd* @getpwent() #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare void @endpwent() #1

declare i32 @closedir(%struct.__dirstream*) #1

declare i8* @tilde_expand(i8*) #1

declare %struct.__dirstream* @opendir(i8*) #1

declare %struct.dirent* @readdir(%struct.__dirstream*) #1

; Function Attrs: noinline nounwind
define internal i32 @complete_fncmp(i8* %convfn, i32 %convlen, i8* %filename, i32 %filename_len) #0 {
entry:
  %retval = alloca i32, align 4
  %convfn.addr = alloca i8*, align 4
  %convlen.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %filename_len.addr = alloca i32, align 4
  %s1 = alloca i8*, align 4
  %s2 = alloca i8*, align 4
  %d = alloca i32, align 4
  %len = alloca i32, align 4
  %v1 = alloca i32, align 4
  %v2 = alloca i32, align 4
  %ps1 = alloca %struct.__mbstate_t, align 4
  %ps2 = alloca %struct.__mbstate_t, align 4
  %wc1 = alloca i32, align 4
  %wc2 = alloca i32, align 4
  store i8* %convfn, i8** %convfn.addr, align 4
  store i32 %convlen, i32* %convlen.addr, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %filename_len, i32* %filename_len.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps1 to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = bitcast %struct.__mbstate_t* %ps2 to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 8, i32 4, i1 false)
  %2 = load i32, i32* %filename_len.addr, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %convlen.addr, align 4
  %4 = load i32, i32* %filename_len.addr, align 4
  %cmp1 = icmp slt i32 %3, %4
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %5 = load i32, i32* %filename_len.addr, align 4
  store i32 %5, i32* %len, align 4
  %6 = load i8*, i8** %convfn.addr, align 4
  store i8* %6, i8** %s1, align 4
  %7 = load i8*, i8** %filename.addr, align 4
  store i8* %7, i8** %s2, align 4
  %8 = load i32, i32* @_rl_completion_case_fold, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %land.lhs.true, label %if.else129

land.lhs.true:                                    ; preds = %if.end3
  %9 = load i32, i32* @_rl_completion_case_map, align 4
  %tobool4 = icmp ne i32 %9, 0
  br i1 %tobool4, label %if.then5, label %if.else129

if.then5:                                         ; preds = %land.lhs.true
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp6 = icmp ugt i32 %call, 1
  br i1 %cmp6, label %land.lhs.true7, label %if.else71

land.lhs.true7:                                   ; preds = %if.then5
  %10 = load i32, i32* @rl_byte_oriented, align 4
  %cmp8 = icmp eq i32 %10, 0
  br i1 %cmp8, label %if.then9, label %if.else71

if.then9:                                         ; preds = %land.lhs.true7
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then9
  %11 = load i8*, i8** %s1, align 4
  %12 = load i32, i32* %convlen.addr, align 4
  %call10 = call i32 @mbrtowc(i32* %wc1, i8* %11, i32 %12, %struct.__mbstate_t* %ps1)
  store i32 %call10, i32* %v1, align 4
  %13 = load i8*, i8** %s2, align 4
  %14 = load i32, i32* %filename_len.addr, align 4
  %call11 = call i32 @mbrtowc(i32* %wc2, i8* %13, i32 %14, %struct.__mbstate_t* %ps2)
  store i32 %call11, i32* %v2, align 4
  %15 = load i32, i32* %v1, align 4
  %cmp12 = icmp eq i32 %15, 0
  br i1 %cmp12, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %do.body
  %16 = load i32, i32* %v2, align 4
  %cmp14 = icmp eq i32 %16, 0
  br i1 %cmp14, label %if.then15, label %if.else

if.then15:                                        ; preds = %land.lhs.true13
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true13, %do.body
  %17 = load i32, i32* %v1, align 4
  %cmp16 = icmp eq i32 %17, -1
  br i1 %cmp16, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %18 = load i32, i32* %v1, align 4
  %cmp17 = icmp eq i32 %18, -2
  br i1 %cmp17, label %if.then22, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %lor.lhs.false
  %19 = load i32, i32* %v2, align 4
  %cmp19 = icmp eq i32 %19, -1
  br i1 %cmp19, label %if.then22, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false18
  %20 = load i32, i32* %v2, align 4
  %cmp21 = icmp eq i32 %20, -2
  br i1 %cmp21, label %if.then22, label %if.end47

if.then22:                                        ; preds = %lor.lhs.false20, %lor.lhs.false18, %lor.lhs.false, %if.else
  %21 = load i8*, i8** %s1, align 4
  %22 = load i8, i8* %21, align 1
  %conv = sext i8 %22 to i32
  %23 = load i8*, i8** %s2, align 4
  %24 = load i8, i8* %23, align 1
  %conv23 = sext i8 %24 to i32
  %cmp24 = icmp ne i32 %conv, %conv23
  br i1 %cmp24, label %if.then26, label %if.else27

if.then26:                                        ; preds = %if.then22
  store i32 0, i32* %retval, align 4
  br label %return

if.else27:                                        ; preds = %if.then22
  %25 = load i8*, i8** %s1, align 4
  %26 = load i8, i8* %25, align 1
  %conv28 = sext i8 %26 to i32
  %cmp29 = icmp eq i32 %conv28, 45
  br i1 %cmp29, label %land.lhs.true35, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %if.else27
  %27 = load i8*, i8** %s1, align 4
  %28 = load i8, i8* %27, align 1
  %conv32 = sext i8 %28 to i32
  %cmp33 = icmp eq i32 %conv32, 95
  br i1 %cmp33, label %land.lhs.true35, label %if.end44

land.lhs.true35:                                  ; preds = %lor.lhs.false31, %if.else27
  %29 = load i8*, i8** %s2, align 4
  %30 = load i8, i8* %29, align 1
  %conv36 = sext i8 %30 to i32
  %cmp37 = icmp eq i32 %conv36, 45
  br i1 %cmp37, label %if.then43, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %land.lhs.true35
  %31 = load i8*, i8** %s2, align 4
  %32 = load i8, i8* %31, align 1
  %conv40 = sext i8 %32 to i32
  %cmp41 = icmp eq i32 %conv40, 95
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %lor.lhs.false39, %land.lhs.true35
  store i32 0, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %lor.lhs.false39, %lor.lhs.false31
  br label %if.end45

if.end45:                                         ; preds = %if.end44
  %33 = load i8*, i8** %s1, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %incdec.ptr, i8** %s1, align 4
  %34 = load i8*, i8** %s2, align 4
  %incdec.ptr46 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr46, i8** %s2, align 4
  %35 = load i32, i32* %len, align 4
  %dec = add nsw i32 %35, -1
  store i32 %dec, i32* %len, align 4
  br label %do.cond

if.end47:                                         ; preds = %lor.lhs.false20
  br label %if.end48

if.end48:                                         ; preds = %if.end47
  %36 = load i32, i32* %wc1, align 4
  %call49 = call i32 @towlower(i32 %36)
  store i32 %call49, i32* %wc1, align 4
  %37 = load i32, i32* %wc2, align 4
  %call50 = call i32 @towlower(i32 %37)
  store i32 %call50, i32* %wc2, align 4
  %38 = load i32, i32* %v1, align 4
  %39 = load i8*, i8** %s1, align 4
  %add.ptr = getelementptr inbounds i8, i8* %39, i32 %38
  store i8* %add.ptr, i8** %s1, align 4
  %40 = load i32, i32* %v1, align 4
  %41 = load i8*, i8** %s2, align 4
  %add.ptr51 = getelementptr inbounds i8, i8* %41, i32 %40
  store i8* %add.ptr51, i8** %s2, align 4
  %42 = load i32, i32* %v1, align 4
  %43 = load i32, i32* %len, align 4
  %sub = sub i32 %43, %42
  store i32 %sub, i32* %len, align 4
  %44 = load i32, i32* %wc1, align 4
  %cmp52 = icmp eq i32 %44, 45
  br i1 %cmp52, label %land.lhs.true57, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %if.end48
  %45 = load i32, i32* %wc1, align 4
  %cmp55 = icmp eq i32 %45, 95
  br i1 %cmp55, label %land.lhs.true57, label %if.end64

land.lhs.true57:                                  ; preds = %lor.lhs.false54, %if.end48
  %46 = load i32, i32* %wc2, align 4
  %cmp58 = icmp eq i32 %46, 45
  br i1 %cmp58, label %if.then63, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %land.lhs.true57
  %47 = load i32, i32* %wc2, align 4
  %cmp61 = icmp eq i32 %47, 95
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %lor.lhs.false60, %land.lhs.true57
  br label %do.cond

if.end64:                                         ; preds = %lor.lhs.false60, %lor.lhs.false54
  %48 = load i32, i32* %wc1, align 4
  %49 = load i32, i32* %wc2, align 4
  %cmp65 = icmp ne i32 %48, %49
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  store i32 0, i32* %retval, align 4
  br label %return

if.end68:                                         ; preds = %if.end64
  br label %do.cond

do.cond:                                          ; preds = %if.end68, %if.then63, %if.end45
  %50 = load i32, i32* %len, align 4
  %cmp69 = icmp ne i32 %50, 0
  br i1 %cmp69, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end128

if.else71:                                        ; preds = %land.lhs.true7, %if.then5
  br label %do.body72

do.body72:                                        ; preds = %do.cond123, %if.else71
  %51 = load i8*, i8** %s1, align 4
  %52 = load i8, i8* %51, align 1
  %conv73 = zext i8 %52 to i32
  %53 = load i8*, i8** %s1, align 4
  %54 = load i8, i8* %53, align 1
  %conv74 = sext i8 %54 to i32
  %cmp75 = icmp eq i32 %conv73, %conv74
  br i1 %cmp75, label %land.lhs.true77, label %cond.false

land.lhs.true77:                                  ; preds = %do.body72
  %55 = load i8*, i8** %s1, align 4
  %56 = load i8, i8* %55, align 1
  %conv78 = zext i8 %56 to i32
  %call79 = call i32 @isupper(i32 %conv78) #4
  %tobool80 = icmp ne i32 %call79, 0
  br i1 %tobool80, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true77
  %57 = load i8*, i8** %s1, align 4
  %58 = load i8, i8* %57, align 1
  %conv81 = zext i8 %58 to i32
  %call82 = call i32 @tolower(i32 %conv81) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true77, %do.body72
  %59 = load i8*, i8** %s1, align 4
  %60 = load i8, i8* %59, align 1
  %conv83 = sext i8 %60 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call82, %cond.true ], [ %conv83, %cond.false ]
  %61 = load i8*, i8** %s2, align 4
  %62 = load i8, i8* %61, align 1
  %conv84 = zext i8 %62 to i32
  %63 = load i8*, i8** %s2, align 4
  %64 = load i8, i8* %63, align 1
  %conv85 = sext i8 %64 to i32
  %cmp86 = icmp eq i32 %conv84, %conv85
  br i1 %cmp86, label %land.lhs.true88, label %cond.false95

land.lhs.true88:                                  ; preds = %cond.end
  %65 = load i8*, i8** %s2, align 4
  %66 = load i8, i8* %65, align 1
  %conv89 = zext i8 %66 to i32
  %call90 = call i32 @isupper(i32 %conv89) #4
  %tobool91 = icmp ne i32 %call90, 0
  br i1 %tobool91, label %cond.true92, label %cond.false95

cond.true92:                                      ; preds = %land.lhs.true88
  %67 = load i8*, i8** %s2, align 4
  %68 = load i8, i8* %67, align 1
  %conv93 = zext i8 %68 to i32
  %call94 = call i32 @tolower(i32 %conv93) #4
  br label %cond.end97

cond.false95:                                     ; preds = %land.lhs.true88, %cond.end
  %69 = load i8*, i8** %s2, align 4
  %70 = load i8, i8* %69, align 1
  %conv96 = sext i8 %70 to i32
  br label %cond.end97

cond.end97:                                       ; preds = %cond.false95, %cond.true92
  %cond98 = phi i32 [ %call94, %cond.true92 ], [ %conv96, %cond.false95 ]
  %sub99 = sub nsw i32 %cond, %cond98
  store i32 %sub99, i32* %d, align 4
  %71 = load i8*, i8** %s1, align 4
  %72 = load i8, i8* %71, align 1
  %conv100 = sext i8 %72 to i32
  %cmp101 = icmp eq i32 %conv100, 45
  br i1 %cmp101, label %land.lhs.true107, label %lor.lhs.false103

lor.lhs.false103:                                 ; preds = %cond.end97
  %73 = load i8*, i8** %s1, align 4
  %74 = load i8, i8* %73, align 1
  %conv104 = sext i8 %74 to i32
  %cmp105 = icmp eq i32 %conv104, 95
  br i1 %cmp105, label %land.lhs.true107, label %if.end116

land.lhs.true107:                                 ; preds = %lor.lhs.false103, %cond.end97
  %75 = load i8*, i8** %s2, align 4
  %76 = load i8, i8* %75, align 1
  %conv108 = sext i8 %76 to i32
  %cmp109 = icmp eq i32 %conv108, 45
  br i1 %cmp109, label %if.then115, label %lor.lhs.false111

lor.lhs.false111:                                 ; preds = %land.lhs.true107
  %77 = load i8*, i8** %s2, align 4
  %78 = load i8, i8* %77, align 1
  %conv112 = sext i8 %78 to i32
  %cmp113 = icmp eq i32 %conv112, 95
  br i1 %cmp113, label %if.then115, label %if.end116

if.then115:                                       ; preds = %lor.lhs.false111, %land.lhs.true107
  store i32 0, i32* %d, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.then115, %lor.lhs.false111, %lor.lhs.false103
  %79 = load i32, i32* %d, align 4
  %cmp117 = icmp ne i32 %79, 0
  br i1 %cmp117, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  store i32 0, i32* %retval, align 4
  br label %return

if.end120:                                        ; preds = %if.end116
  %80 = load i8*, i8** %s1, align 4
  %incdec.ptr121 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr121, i8** %s1, align 4
  %81 = load i8*, i8** %s2, align 4
  %incdec.ptr122 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %incdec.ptr122, i8** %s2, align 4
  br label %do.cond123

do.cond123:                                       ; preds = %if.end120
  %82 = load i32, i32* %len, align 4
  %dec124 = add nsw i32 %82, -1
  store i32 %dec124, i32* %len, align 4
  %cmp125 = icmp ne i32 %dec124, 0
  br i1 %cmp125, label %do.body72, label %do.end127

do.end127:                                        ; preds = %do.cond123
  br label %if.end128

if.end128:                                        ; preds = %do.end127, %do.end
  store i32 1, i32* %retval, align 4
  br label %return

if.else129:                                       ; preds = %land.lhs.true, %if.end3
  %83 = load i32, i32* @_rl_completion_case_fold, align 4
  %tobool130 = icmp ne i32 %83, 0
  br i1 %tobool130, label %if.then131, label %if.else237

if.then131:                                       ; preds = %if.else129
  %call132 = call i32 @__ctype_get_mb_cur_max()
  %cmp133 = icmp ugt i32 %call132, 1
  br i1 %cmp133, label %land.lhs.true135, label %if.else185

land.lhs.true135:                                 ; preds = %if.then131
  %84 = load i32, i32* @rl_byte_oriented, align 4
  %cmp136 = icmp eq i32 %84, 0
  br i1 %cmp136, label %if.then138, label %if.else185

if.then138:                                       ; preds = %land.lhs.true135
  br label %do.body139

do.body139:                                       ; preds = %do.cond181, %if.then138
  %85 = load i8*, i8** %s1, align 4
  %86 = load i32, i32* %convlen.addr, align 4
  %call140 = call i32 @mbrtowc(i32* %wc1, i8* %85, i32 %86, %struct.__mbstate_t* %ps1)
  store i32 %call140, i32* %v1, align 4
  %87 = load i8*, i8** %s2, align 4
  %88 = load i32, i32* %filename_len.addr, align 4
  %call141 = call i32 @mbrtowc(i32* %wc2, i8* %87, i32 %88, %struct.__mbstate_t* %ps2)
  store i32 %call141, i32* %v2, align 4
  %89 = load i32, i32* %v1, align 4
  %cmp142 = icmp eq i32 %89, 0
  br i1 %cmp142, label %land.lhs.true144, label %if.else148

land.lhs.true144:                                 ; preds = %do.body139
  %90 = load i32, i32* %v2, align 4
  %cmp145 = icmp eq i32 %90, 0
  br i1 %cmp145, label %if.then147, label %if.else148

if.then147:                                       ; preds = %land.lhs.true144
  store i32 1, i32* %retval, align 4
  br label %return

if.else148:                                       ; preds = %land.lhs.true144, %do.body139
  %91 = load i32, i32* %v1, align 4
  %cmp149 = icmp eq i32 %91, -1
  br i1 %cmp149, label %if.then160, label %lor.lhs.false151

lor.lhs.false151:                                 ; preds = %if.else148
  %92 = load i32, i32* %v1, align 4
  %cmp152 = icmp eq i32 %92, -2
  br i1 %cmp152, label %if.then160, label %lor.lhs.false154

lor.lhs.false154:                                 ; preds = %lor.lhs.false151
  %93 = load i32, i32* %v2, align 4
  %cmp155 = icmp eq i32 %93, -1
  br i1 %cmp155, label %if.then160, label %lor.lhs.false157

lor.lhs.false157:                                 ; preds = %lor.lhs.false154
  %94 = load i32, i32* %v2, align 4
  %cmp158 = icmp eq i32 %94, -2
  br i1 %cmp158, label %if.then160, label %if.end170

if.then160:                                       ; preds = %lor.lhs.false157, %lor.lhs.false154, %lor.lhs.false151, %if.else148
  %95 = load i8*, i8** %s1, align 4
  %96 = load i8, i8* %95, align 1
  %conv161 = sext i8 %96 to i32
  %97 = load i8*, i8** %s2, align 4
  %98 = load i8, i8* %97, align 1
  %conv162 = sext i8 %98 to i32
  %cmp163 = icmp ne i32 %conv161, %conv162
  br i1 %cmp163, label %if.then165, label %if.end166

if.then165:                                       ; preds = %if.then160
  store i32 0, i32* %retval, align 4
  br label %return

if.end166:                                        ; preds = %if.then160
  %99 = load i8*, i8** %s1, align 4
  %incdec.ptr167 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %incdec.ptr167, i8** %s1, align 4
  %100 = load i8*, i8** %s2, align 4
  %incdec.ptr168 = getelementptr inbounds i8, i8* %100, i32 1
  store i8* %incdec.ptr168, i8** %s2, align 4
  %101 = load i32, i32* %len, align 4
  %dec169 = add nsw i32 %101, -1
  store i32 %dec169, i32* %len, align 4
  br label %do.cond181

if.end170:                                        ; preds = %lor.lhs.false157
  br label %if.end171

if.end171:                                        ; preds = %if.end170
  %102 = load i32, i32* %wc1, align 4
  %call172 = call i32 @towlower(i32 %102)
  store i32 %call172, i32* %wc1, align 4
  %103 = load i32, i32* %wc2, align 4
  %call173 = call i32 @towlower(i32 %103)
  store i32 %call173, i32* %wc2, align 4
  %104 = load i32, i32* %wc1, align 4
  %105 = load i32, i32* %wc2, align 4
  %cmp174 = icmp ne i32 %104, %105
  br i1 %cmp174, label %if.then176, label %if.end177

if.then176:                                       ; preds = %if.end171
  store i32 0, i32* %retval, align 4
  br label %return

if.end177:                                        ; preds = %if.end171
  %106 = load i32, i32* %v1, align 4
  %107 = load i8*, i8** %s1, align 4
  %add.ptr178 = getelementptr inbounds i8, i8* %107, i32 %106
  store i8* %add.ptr178, i8** %s1, align 4
  %108 = load i32, i32* %v1, align 4
  %109 = load i8*, i8** %s2, align 4
  %add.ptr179 = getelementptr inbounds i8, i8* %109, i32 %108
  store i8* %add.ptr179, i8** %s2, align 4
  %110 = load i32, i32* %v1, align 4
  %111 = load i32, i32* %len, align 4
  %sub180 = sub i32 %111, %110
  store i32 %sub180, i32* %len, align 4
  br label %do.cond181

do.cond181:                                       ; preds = %if.end177, %if.end166
  %112 = load i32, i32* %len, align 4
  %cmp182 = icmp ne i32 %112, 0
  br i1 %cmp182, label %do.body139, label %do.end184

do.end184:                                        ; preds = %do.cond181
  store i32 1, i32* %retval, align 4
  br label %return

if.else185:                                       ; preds = %land.lhs.true135, %if.then131
  %113 = load i8*, i8** %convfn.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %113, i32 0
  %114 = load i8, i8* %arrayidx, align 1
  %conv186 = zext i8 %114 to i32
  %115 = load i8*, i8** %convfn.addr, align 4
  %arrayidx187 = getelementptr inbounds i8, i8* %115, i32 0
  %116 = load i8, i8* %arrayidx187, align 1
  %conv188 = sext i8 %116 to i32
  %cmp189 = icmp eq i32 %conv186, %conv188
  br i1 %cmp189, label %land.lhs.true191, label %cond.false200

land.lhs.true191:                                 ; preds = %if.else185
  %117 = load i8*, i8** %convfn.addr, align 4
  %arrayidx192 = getelementptr inbounds i8, i8* %117, i32 0
  %118 = load i8, i8* %arrayidx192, align 1
  %conv193 = zext i8 %118 to i32
  %call194 = call i32 @isupper(i32 %conv193) #4
  %tobool195 = icmp ne i32 %call194, 0
  br i1 %tobool195, label %cond.true196, label %cond.false200

cond.true196:                                     ; preds = %land.lhs.true191
  %119 = load i8*, i8** %convfn.addr, align 4
  %arrayidx197 = getelementptr inbounds i8, i8* %119, i32 0
  %120 = load i8, i8* %arrayidx197, align 1
  %conv198 = zext i8 %120 to i32
  %call199 = call i32 @tolower(i32 %conv198) #4
  br label %cond.end203

cond.false200:                                    ; preds = %land.lhs.true191, %if.else185
  %121 = load i8*, i8** %convfn.addr, align 4
  %arrayidx201 = getelementptr inbounds i8, i8* %121, i32 0
  %122 = load i8, i8* %arrayidx201, align 1
  %conv202 = sext i8 %122 to i32
  br label %cond.end203

cond.end203:                                      ; preds = %cond.false200, %cond.true196
  %cond204 = phi i32 [ %call199, %cond.true196 ], [ %conv202, %cond.false200 ]
  %123 = load i8*, i8** %filename.addr, align 4
  %arrayidx205 = getelementptr inbounds i8, i8* %123, i32 0
  %124 = load i8, i8* %arrayidx205, align 1
  %conv206 = zext i8 %124 to i32
  %125 = load i8*, i8** %filename.addr, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %125, i32 0
  %126 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %126 to i32
  %cmp209 = icmp eq i32 %conv206, %conv208
  br i1 %cmp209, label %land.lhs.true211, label %cond.false220

land.lhs.true211:                                 ; preds = %cond.end203
  %127 = load i8*, i8** %filename.addr, align 4
  %arrayidx212 = getelementptr inbounds i8, i8* %127, i32 0
  %128 = load i8, i8* %arrayidx212, align 1
  %conv213 = zext i8 %128 to i32
  %call214 = call i32 @isupper(i32 %conv213) #4
  %tobool215 = icmp ne i32 %call214, 0
  br i1 %tobool215, label %cond.true216, label %cond.false220

cond.true216:                                     ; preds = %land.lhs.true211
  %129 = load i8*, i8** %filename.addr, align 4
  %arrayidx217 = getelementptr inbounds i8, i8* %129, i32 0
  %130 = load i8, i8* %arrayidx217, align 1
  %conv218 = zext i8 %130 to i32
  %call219 = call i32 @tolower(i32 %conv218) #4
  br label %cond.end223

cond.false220:                                    ; preds = %land.lhs.true211, %cond.end203
  %131 = load i8*, i8** %filename.addr, align 4
  %arrayidx221 = getelementptr inbounds i8, i8* %131, i32 0
  %132 = load i8, i8* %arrayidx221, align 1
  %conv222 = sext i8 %132 to i32
  br label %cond.end223

cond.end223:                                      ; preds = %cond.false220, %cond.true216
  %cond224 = phi i32 [ %call219, %cond.true216 ], [ %conv222, %cond.false220 ]
  %cmp225 = icmp eq i32 %cond204, %cond224
  br i1 %cmp225, label %land.lhs.true227, label %if.end235

land.lhs.true227:                                 ; preds = %cond.end223
  %133 = load i32, i32* %convlen.addr, align 4
  %134 = load i32, i32* %filename_len.addr, align 4
  %cmp228 = icmp sge i32 %133, %134
  br i1 %cmp228, label %land.lhs.true230, label %if.end235

land.lhs.true230:                                 ; preds = %land.lhs.true227
  %135 = load i8*, i8** %filename.addr, align 4
  %136 = load i8*, i8** %convfn.addr, align 4
  %137 = load i32, i32* %filename_len.addr, align 4
  %call231 = call i32 @strncasecmp(i8* %135, i8* %136, i32 %137)
  %cmp232 = icmp eq i32 %call231, 0
  br i1 %cmp232, label %if.then234, label %if.end235

if.then234:                                       ; preds = %land.lhs.true230
  store i32 1, i32* %retval, align 4
  br label %return

if.end235:                                        ; preds = %land.lhs.true230, %land.lhs.true227, %cond.end223
  br label %if.end236

if.end236:                                        ; preds = %if.end235
  br label %if.end253

if.else237:                                       ; preds = %if.else129
  %138 = load i8*, i8** %convfn.addr, align 4
  %arrayidx238 = getelementptr inbounds i8, i8* %138, i32 0
  %139 = load i8, i8* %arrayidx238, align 1
  %conv239 = sext i8 %139 to i32
  %140 = load i8*, i8** %filename.addr, align 4
  %arrayidx240 = getelementptr inbounds i8, i8* %140, i32 0
  %141 = load i8, i8* %arrayidx240, align 1
  %conv241 = sext i8 %141 to i32
  %cmp242 = icmp eq i32 %conv239, %conv241
  br i1 %cmp242, label %land.lhs.true244, label %if.end252

land.lhs.true244:                                 ; preds = %if.else237
  %142 = load i32, i32* %convlen.addr, align 4
  %143 = load i32, i32* %filename_len.addr, align 4
  %cmp245 = icmp sge i32 %142, %143
  br i1 %cmp245, label %land.lhs.true247, label %if.end252

land.lhs.true247:                                 ; preds = %land.lhs.true244
  %144 = load i8*, i8** %filename.addr, align 4
  %145 = load i8*, i8** %convfn.addr, align 4
  %146 = load i32, i32* %filename_len.addr, align 4
  %call248 = call i32 @strncmp(i8* %144, i8* %145, i32 %146)
  %cmp249 = icmp eq i32 %call248, 0
  br i1 %cmp249, label %if.then251, label %if.end252

if.then251:                                       ; preds = %land.lhs.true247
  store i32 1, i32* %retval, align 4
  br label %return

if.end252:                                        ; preds = %land.lhs.true247, %land.lhs.true244, %if.else237
  br label %if.end253

if.end253:                                        ; preds = %if.end252, %if.end236
  br label %if.end254

if.end254:                                        ; preds = %if.end253
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end254, %if.then251, %if.then234, %do.end184, %if.then176, %if.then165, %if.then147, %if.end128, %if.then119, %if.then67, %if.then43, %if.then26, %if.then15, %if.then2, %if.then
  %147 = load i32, i32* %retval, align 4
  ret i32 %147
}

; Function Attrs: noinline nounwind
define i32 @rl_old_menu_complete(i32 %count, i32 %invoking_key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  %our_func = alloca i8* (i8*, i32)*, align 4
  %matching_filenames = alloca i32, align 4
  %found_quote = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp ne i32 (i32, i32)* %0, @rl_old_menu_complete
  br i1 %cmp, label %if.then, label %if.end35

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  call void @free(i8* %2)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %3 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %tobool2 = icmp ne i8** %3, null
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  call void @_rl_free_match_list(i8** %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  store i32 0, i32* @rl_old_menu_complete.match_list_size, align 4
  store i32 0, i32* @rl_old_menu_complete.match_list_index, align 4
  store i8** null, i8*** @rl_old_menu_complete.matches, align 4
  %5 = load i32, i32* %invoking_key.addr, align 4
  store i32 %5, i32* @rl_completion_invoking_key, align 4
  %6 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %6, 16384
  store i32 %or, i32* @rl_readline_state, align 4
  call void @set_completion_defaults(i32 37)
  %7 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  store i8* (i8*, i32)* %7, i8* (i8*, i32)** %our_func, align 4
  %8 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func, align 4
  %cmp5 = icmp eq i8* (i8*, i32)* %8, null
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end4
  %9 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %tobool7 = icmp ne i8* (i8*, i32)* %9, null
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  %10 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* (i8*, i32)* [ %10, %cond.true ], [ @rl_filename_completion_function, %cond.false ]
  store i8* (i8*, i32)* %cond, i8* (i8*, i32)** %our_func, align 4
  br label %if.end8

if.end8:                                          ; preds = %cond.end, %if.end4
  %11 = load i32, i32* @rl_point, align 4
  store i32 %11, i32* @rl_old_menu_complete.orig_end, align 4
  store i32 0, i32* @rl_old_menu_complete.delimiter, align 4
  store i32 0, i32* %found_quote, align 4
  store i8 0, i8* @rl_old_menu_complete.quote_char, align 1
  %12 = load i32, i32* @rl_point, align 4
  %tobool9 = icmp ne i32 %12, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  %call = call signext i8 @_rl_find_completion_word(i32* %found_quote, i32* @rl_old_menu_complete.delimiter)
  store i8 %call, i8* @rl_old_menu_complete.quote_char, align 1
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  %13 = load i32, i32* @rl_point, align 4
  store i32 %13, i32* @rl_old_menu_complete.orig_start, align 4
  %14 = load i32, i32* @rl_old_menu_complete.orig_end, align 4
  store i32 %14, i32* @rl_point, align 4
  %15 = load i32, i32* @rl_old_menu_complete.orig_start, align 4
  %16 = load i32, i32* @rl_old_menu_complete.orig_end, align 4
  %call12 = call i8* @rl_copy_text(i32 %15, i32 %16)
  store i8* %call12, i8** @rl_old_menu_complete.orig_text, align 4
  %17 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  %18 = load i32, i32* @rl_old_menu_complete.orig_start, align 4
  %19 = load i32, i32* @rl_old_menu_complete.orig_end, align 4
  %20 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func, align 4
  %21 = load i32, i32* %found_quote, align 4
  %22 = load i8, i8* @rl_old_menu_complete.quote_char, align 1
  %conv = sext i8 %22 to i32
  %call13 = call i8** @gen_completion_matches(i8* %17, i32 %18, i32 %19, i8* (i8*, i32)* %20, i32 %21, i32 %conv)
  store i8** %call13, i8*** @rl_old_menu_complete.matches, align 4
  %23 = load i32, i32* @rl_filename_completion_desired, align 4
  store i32 %23, i32* %matching_filenames, align 4
  %24 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %cmp14 = icmp eq i8** %24, null
  br i1 %cmp14, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end11
  %25 = load i32, i32* %matching_filenames, align 4
  %call16 = call i32 @postprocess_matches(i8*** @rl_old_menu_complete.matches, i32 %25)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then19, label %if.end27

if.then19:                                        ; preds = %lor.lhs.false, %if.end11
  %call20 = call i32 @rl_ding()
  %26 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %tobool21 = icmp ne i8** %26, null
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.then19
  %27 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %28 = bitcast i8** %27 to i8*
  call void @free(i8* %28)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.then19
  store i8** null, i8*** @rl_old_menu_complete.matches, align 4
  %29 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  %tobool24 = icmp ne i8* %29, null
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  %30 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  call void @free(i8* %30)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  store i8* null, i8** @rl_old_menu_complete.orig_text, align 4
  store i32 0, i32* @completion_changed_buffer, align 4
  %31 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %31, -16385
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %lor.lhs.false
  %32 = load i32, i32* @rl_readline_state, align 4
  %and28 = and i32 %32, -16385
  store i32 %and28, i32* @rl_readline_state, align 4
  store i32 0, i32* @rl_old_menu_complete.match_list_size, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end27
  %33 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %34 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx, align 4
  %tobool29 = icmp ne i8* %35, null
  br i1 %tobool29, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %36 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* @rl_old_menu_complete.match_list_size, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %37 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %cmp30 = icmp sgt i32 %37, 1
  br i1 %cmp30, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %for.end
  %38 = load i32, i32* @_rl_complete_show_all, align 4
  %tobool32 = icmp ne i32 %38, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %land.lhs.true
  %39 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  call void @display_matches(i8** %39)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %land.lhs.true, %for.end
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %entry
  %40 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %cmp36 = icmp eq i8** %40, null
  br i1 %cmp36, label %if.then41, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.end35
  %41 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %cmp39 = icmp eq i32 %41, 0
  br i1 %cmp39, label %if.then41, label %if.end46

if.then41:                                        ; preds = %lor.lhs.false38, %if.end35
  %call42 = call i32 @rl_ding()
  %42 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %tobool43 = icmp ne i8** %42, null
  br i1 %tobool43, label %if.then44, label %if.end45

if.then44:                                        ; preds = %if.then41
  %43 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %44 = bitcast i8** %43 to i8*
  call void @free(i8* %44)
  br label %if.end45

if.end45:                                         ; preds = %if.then44, %if.then41
  store i8** null, i8*** @rl_old_menu_complete.matches, align 4
  store i32 0, i32* @completion_changed_buffer, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end46:                                         ; preds = %lor.lhs.false38
  %45 = load i32, i32* %count.addr, align 4
  %46 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %add = add nsw i32 %46, %45
  store i32 %add, i32* @rl_old_menu_complete.match_list_index, align 4
  %47 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %cmp47 = icmp slt i32 %47, 0
  br i1 %cmp47, label %if.then49, label %if.else

if.then49:                                        ; preds = %if.end46
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then49
  %48 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %cmp50 = icmp slt i32 %48, 0
  br i1 %cmp50, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %49 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %50 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %add52 = add nsw i32 %50, %49
  store i32 %add52, i32* @rl_old_menu_complete.match_list_index, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end53

if.else:                                          ; preds = %if.end46
  %51 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %52 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %rem = srem i32 %52, %51
  store i32 %rem, i32* @rl_old_menu_complete.match_list_index, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.else, %while.end
  %53 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %cmp54 = icmp eq i32 %53, 0
  br i1 %cmp54, label %land.lhs.true56, label %if.else61

land.lhs.true56:                                  ; preds = %if.end53
  %54 = load i32, i32* @rl_old_menu_complete.match_list_size, align 4
  %cmp57 = icmp sgt i32 %54, 1
  br i1 %cmp57, label %if.then59, label %if.else61

if.then59:                                        ; preds = %land.lhs.true56
  %call60 = call i32 @rl_ding()
  %55 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  %56 = load i32, i32* @rl_old_menu_complete.orig_start, align 4
  call void @insert_match(i8* %55, i32 %56, i32 2, i8* @rl_old_menu_complete.quote_char)
  br label %if.end68

if.else61:                                        ; preds = %land.lhs.true56, %if.end53
  %57 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %58 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %arrayidx62 = getelementptr inbounds i8*, i8** %57, i32 %58
  %59 = load i8*, i8** %arrayidx62, align 4
  %60 = load i32, i32* @rl_old_menu_complete.orig_start, align 4
  call void @insert_match(i8* %59, i32 %60, i32 1, i8* @rl_old_menu_complete.quote_char)
  %61 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %62 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %arrayidx63 = getelementptr inbounds i8*, i8** %61, i32 %62
  %63 = load i8*, i8** %arrayidx63, align 4
  %64 = load i32, i32* @rl_old_menu_complete.delimiter, align 4
  %65 = load i8, i8* @rl_old_menu_complete.quote_char, align 1
  %conv64 = sext i8 %65 to i32
  %66 = load i8*, i8** @rl_old_menu_complete.orig_text, align 4
  %67 = load i8**, i8*** @rl_old_menu_complete.matches, align 4
  %68 = load i32, i32* @rl_old_menu_complete.match_list_index, align 4
  %arrayidx65 = getelementptr inbounds i8*, i8** %67, i32 %68
  %69 = load i8*, i8** %arrayidx65, align 4
  %call66 = call i32 @strcmp(i8* %66, i8* %69)
  %call67 = call i32 @append_to_match(i8* %63, i32 %64, i32 %conv64, i32 %call66)
  br label %if.end68

if.end68:                                         ; preds = %if.else61, %if.then59
  store i32 1, i32* @completion_changed_buffer, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end68, %if.end45, %if.end26
  %70 = load i32, i32* %retval, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind
define i32 @rl_menu_complete(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %our_func = alloca i8* (i8*, i32)*, align 4
  %matching_filenames = alloca i32, align 4
  %found_quote = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp ne i32 (i32, i32)* %0, @rl_menu_complete
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_backward_menu_complete
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* @rl_menu_complete.full_completion, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end109

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %3 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %tobool2 = icmp ne i8* %3, null
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  call void @free(i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %5 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool4 = icmp ne i8** %5, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %6 = load i8**, i8*** @rl_menu_complete.matches, align 4
  call void @_rl_free_match_list(i8** %6)
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  store i32 0, i32* @rl_menu_complete.match_list_size, align 4
  store i32 0, i32* @rl_menu_complete.match_list_index, align 4
  store i8** null, i8*** @rl_menu_complete.matches, align 4
  store i32 0, i32* @rl_menu_complete.full_completion, align 4
  %7 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %7, 16384
  store i32 %or, i32* @rl_readline_state, align 4
  call void @set_completion_defaults(i32 37)
  %8 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_menu_completion_entry_function, align 4
  store i8* (i8*, i32)* %8, i8* (i8*, i32)** %our_func, align 4
  %9 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func, align 4
  %cmp7 = icmp eq i8* (i8*, i32)* %9, null
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %10 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %tobool9 = icmp ne i8* (i8*, i32)* %10, null
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then8
  %11 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* (i8*, i32)* [ %11, %cond.true ], [ @rl_filename_completion_function, %cond.false ]
  store i8* (i8*, i32)* %cond, i8* (i8*, i32)** %our_func, align 4
  br label %if.end10

if.end10:                                         ; preds = %cond.end, %if.end6
  %12 = load i32, i32* @rl_point, align 4
  store i32 %12, i32* @rl_menu_complete.orig_end, align 4
  store i32 0, i32* @rl_menu_complete.delimiter, align 4
  store i32 0, i32* %found_quote, align 4
  store i8 0, i8* @rl_menu_complete.quote_char, align 1
  %13 = load i32, i32* @rl_point, align 4
  %tobool11 = icmp ne i32 %13, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %call = call signext i8 @_rl_find_completion_word(i32* %found_quote, i32* @rl_menu_complete.delimiter)
  store i8 %call, i8* @rl_menu_complete.quote_char, align 1
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %14 = load i32, i32* @rl_point, align 4
  store i32 %14, i32* @rl_menu_complete.orig_start, align 4
  %15 = load i32, i32* @rl_menu_complete.orig_end, align 4
  store i32 %15, i32* @rl_point, align 4
  %16 = load i32, i32* @rl_menu_complete.orig_start, align 4
  %17 = load i32, i32* @rl_menu_complete.orig_end, align 4
  %call14 = call i8* @rl_copy_text(i32 %16, i32 %17)
  store i8* %call14, i8** @rl_menu_complete.orig_text, align 4
  %18 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %19 = load i32, i32* @rl_menu_complete.orig_start, align 4
  %20 = load i32, i32* @rl_menu_complete.orig_end, align 4
  %21 = load i8* (i8*, i32)*, i8* (i8*, i32)** %our_func, align 4
  %22 = load i32, i32* %found_quote, align 4
  %23 = load i8, i8* @rl_menu_complete.quote_char, align 1
  %conv = sext i8 %23 to i32
  %call15 = call i8** @gen_completion_matches(i8* %18, i32 %19, i32 %20, i8* (i8*, i32)* %21, i32 %22, i32 %conv)
  store i8** %call15, i8*** @rl_menu_complete.matches, align 4
  %24 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool16 = icmp ne i8** %24, null
  br i1 %tobool16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end13
  %25 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %26 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %26, i32 0
  %27 = load i8*, i8** %arrayidx, align 4
  %call17 = call i32 @strcmp(i8* %25, i8* %27)
  %cmp18 = icmp ne i32 %call17, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %28 = phi i1 [ false, %if.end13 ], [ %cmp18, %land.rhs ]
  %land.ext = zext i1 %28 to i32
  store i32 %land.ext, i32* @rl_menu_complete.nontrivial_lcd, align 4
  %29 = load i32, i32* @rl_filename_completion_desired, align 4
  store i32 %29, i32* %matching_filenames, align 4
  %30 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %cmp20 = icmp eq i8** %30, null
  br i1 %cmp20, label %if.then26, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %land.end
  %31 = load i32, i32* %matching_filenames, align 4
  %call23 = call i32 @postprocess_matches(i8*** @rl_menu_complete.matches, i32 %31)
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %if.then26, label %if.end34

if.then26:                                        ; preds = %lor.lhs.false22, %land.end
  %call27 = call i32 @rl_ding()
  %32 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool28 = icmp ne i8** %32, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.then26
  %33 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %34 = bitcast i8** %33 to i8*
  call void @free(i8* %34)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.then26
  store i8** null, i8*** @rl_menu_complete.matches, align 4
  %35 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %tobool31 = icmp ne i8* %35, null
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  %36 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  call void @free(i8* %36)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  store i8* null, i8** @rl_menu_complete.orig_text, align 4
  store i32 0, i32* @completion_changed_buffer, align 4
  %37 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %37, -16385
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %lor.lhs.false22
  %38 = load i32, i32* @rl_readline_state, align 4
  %and35 = and i32 %38, -16385
  store i32 %and35, i32* @rl_readline_state, align 4
  store i32 0, i32* @rl_menu_complete.match_list_size, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end34
  %39 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %40 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %arrayidx36 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx36, align 4
  %tobool37 = icmp ne i8* %41, null
  br i1 %tobool37, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %42 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %inc = add nsw i32 %42, 1
  store i32 %inc, i32* @rl_menu_complete.match_list_size, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %43 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp38 = icmp eq i32 %43, 0
  br i1 %cmp38, label %if.then40, label %if.end45

if.then40:                                        ; preds = %for.end
  %call41 = call i32 @rl_ding()
  %44 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool42 = icmp ne i8** %44, null
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.then40
  %45 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %46 = bitcast i8** %45 to i8*
  call void @free(i8* %46)
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.then40
  store i8** null, i8*** @rl_menu_complete.matches, align 4
  store i32 0, i32* @rl_menu_complete.match_list_index, align 4
  store i32 0, i32* @completion_changed_buffer, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end45:                                         ; preds = %for.end
  %47 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %47, i32 0
  %48 = load i8*, i8** %arrayidx46, align 4
  %49 = load i8, i8* %48, align 1
  %tobool47 = icmp ne i8 %49, 0
  br i1 %tobool47, label %if.then48, label %if.end71

if.then48:                                        ; preds = %if.end45
  %50 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx49 = getelementptr inbounds i8*, i8** %50, i32 0
  %51 = load i8*, i8** %arrayidx49, align 4
  %52 = load i32, i32* @rl_menu_complete.orig_start, align 4
  %53 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %53, i32 1
  %54 = load i8*, i8** %arrayidx50, align 4
  %tobool51 = icmp ne i8* %54, null
  %cond52 = select i1 %tobool51, i32 2, i32 1
  call void @insert_match(i8* %51, i32 %52, i32 %cond52, i8* @rl_menu_complete.quote_char)
  %55 = load i32, i32* @rl_menu_complete.orig_start, align 4
  %56 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx53 = getelementptr inbounds i8*, i8** %56, i32 0
  %57 = load i8*, i8** %arrayidx53, align 4
  %call54 = call i32 @strlen(i8* %57)
  %add = add i32 %55, %call54
  store i32 %add, i32* @rl_menu_complete.orig_end, align 4
  %58 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %58, i32 0
  %59 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %59 to i32
  %60 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx57 = getelementptr inbounds i8*, i8** %60, i32 0
  %61 = load i8*, i8** %arrayidx57, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %61, i32 0
  %62 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %62 to i32
  %cmp60 = icmp eq i32 %conv56, %conv59
  br i1 %cmp60, label %land.rhs62, label %land.end67

land.rhs62:                                       ; preds = %if.then48
  %63 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %64 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx63 = getelementptr inbounds i8*, i8** %64, i32 0
  %65 = load i8*, i8** %arrayidx63, align 4
  %call64 = call i32 @strcmp(i8* %63, i8* %65)
  %cmp65 = icmp eq i32 %call64, 0
  br label %land.end67

land.end67:                                       ; preds = %land.rhs62, %if.then48
  %66 = phi i1 [ false, %if.then48 ], [ %cmp65, %land.rhs62 ]
  %land.ext68 = zext i1 %66 to i32
  %cmp69 = icmp eq i32 %land.ext68, 0
  %conv70 = zext i1 %cmp69 to i32
  store i32 %conv70, i32* @completion_changed_buffer, align 4
  br label %if.end71

if.end71:                                         ; preds = %land.end67, %if.end45
  %67 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp72 = icmp sgt i32 %67, 1
  br i1 %cmp72, label %land.lhs.true74, label %if.else92

land.lhs.true74:                                  ; preds = %if.end71
  %68 = load i32, i32* @_rl_complete_show_all, align 4
  %tobool75 = icmp ne i32 %68, 0
  br i1 %tobool75, label %if.then76, label %if.else92

if.then76:                                        ; preds = %land.lhs.true74
  %69 = load i8**, i8*** @rl_menu_complete.matches, align 4
  call void @display_matches(i8** %69)
  %70 = load i32, i32* @rl_completion_query_items, align 4
  %cmp77 = icmp sgt i32 %70, 0
  br i1 %cmp77, label %land.lhs.true79, label %if.else

land.lhs.true79:                                  ; preds = %if.then76
  %71 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %72 = load i32, i32* @rl_completion_query_items, align 4
  %cmp80 = icmp sge i32 %71, %72
  br i1 %cmp80, label %if.then82, label %if.else

if.then82:                                        ; preds = %land.lhs.true79
  %call83 = call i32 @rl_ding()
  %73 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool84 = icmp ne i8** %73, null
  br i1 %tobool84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.then82
  %74 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %75 = bitcast i8** %74 to i8*
  call void @free(i8* %75)
  br label %if.end86

if.end86:                                         ; preds = %if.then85, %if.then82
  store i8** null, i8*** @rl_menu_complete.matches, align 4
  store i32 1, i32* @rl_menu_complete.full_completion, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true79, %if.then76
  %76 = load i32, i32* @_rl_menu_complete_prefix_first, align 4
  %tobool87 = icmp ne i32 %76, 0
  br i1 %tobool87, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.else
  %call89 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end90:                                         ; preds = %if.else
  br label %if.end91

if.end91:                                         ; preds = %if.end90
  br label %if.end108

if.else92:                                        ; preds = %land.lhs.true74, %if.end71
  %77 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp93 = icmp sle i32 %77, 1
  br i1 %cmp93, label %if.then95, label %if.else99

if.then95:                                        ; preds = %if.else92
  %78 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx96 = getelementptr inbounds i8*, i8** %78, i32 0
  %79 = load i8*, i8** %arrayidx96, align 4
  %80 = load i32, i32* @rl_menu_complete.delimiter, align 4
  %81 = load i8, i8* @rl_menu_complete.quote_char, align 1
  %conv97 = sext i8 %81 to i32
  %82 = load i32, i32* @rl_menu_complete.nontrivial_lcd, align 4
  %call98 = call i32 @append_to_match(i8* %79, i32 %80, i32 %conv97, i32 %82)
  store i32 1, i32* @rl_menu_complete.full_completion, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else99:                                        ; preds = %if.else92
  %83 = load i32, i32* @_rl_menu_complete_prefix_first, align 4
  %tobool100 = icmp ne i32 %83, 0
  br i1 %tobool100, label %land.lhs.true101, label %if.end106

land.lhs.true101:                                 ; preds = %if.else99
  %84 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp102 = icmp sgt i32 %84, 1
  br i1 %cmp102, label %if.then104, label %if.end106

if.then104:                                       ; preds = %land.lhs.true101
  %call105 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end106:                                        ; preds = %land.lhs.true101, %if.else99
  br label %if.end107

if.end107:                                        ; preds = %if.end106
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.end91
  br label %if.end109

if.end109:                                        ; preds = %if.end108, %lor.lhs.false
  %85 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %cmp110 = icmp eq i8** %85, null
  br i1 %cmp110, label %if.then115, label %lor.lhs.false112

lor.lhs.false112:                                 ; preds = %if.end109
  %86 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp113 = icmp eq i32 %86, 0
  br i1 %cmp113, label %if.then115, label %if.end120

if.then115:                                       ; preds = %lor.lhs.false112, %if.end109
  %call116 = call i32 @rl_ding()
  %87 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %tobool117 = icmp ne i8** %87, null
  br i1 %tobool117, label %if.then118, label %if.end119

if.then118:                                       ; preds = %if.then115
  %88 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %89 = bitcast i8** %88 to i8*
  call void @free(i8* %89)
  br label %if.end119

if.end119:                                        ; preds = %if.then118, %if.then115
  store i8** null, i8*** @rl_menu_complete.matches, align 4
  store i32 0, i32* @completion_changed_buffer, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end120:                                        ; preds = %lor.lhs.false112
  %90 = load i32, i32* %count.addr, align 4
  %91 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %add121 = add nsw i32 %91, %90
  store i32 %add121, i32* @rl_menu_complete.match_list_index, align 4
  %92 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %cmp122 = icmp slt i32 %92, 0
  br i1 %cmp122, label %if.then124, label %if.else128

if.then124:                                       ; preds = %if.end120
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then124
  %93 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %cmp125 = icmp slt i32 %93, 0
  br i1 %cmp125, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %94 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %95 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %add127 = add nsw i32 %95, %94
  store i32 %add127, i32* @rl_menu_complete.match_list_index, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end129

if.else128:                                       ; preds = %if.end120
  %96 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %97 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %rem = srem i32 %97, %96
  store i32 %rem, i32* @rl_menu_complete.match_list_index, align 4
  br label %if.end129

if.end129:                                        ; preds = %if.else128, %while.end
  %98 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %cmp130 = icmp eq i32 %98, 0
  br i1 %cmp130, label %land.lhs.true132, label %if.else138

land.lhs.true132:                                 ; preds = %if.end129
  %99 = load i32, i32* @rl_menu_complete.match_list_size, align 4
  %cmp133 = icmp sgt i32 %99, 1
  br i1 %cmp133, label %if.then135, label %if.else138

if.then135:                                       ; preds = %land.lhs.true132
  %call136 = call i32 @rl_ding()
  %100 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %arrayidx137 = getelementptr inbounds i8*, i8** %100, i32 0
  %101 = load i8*, i8** %arrayidx137, align 4
  %102 = load i32, i32* @rl_menu_complete.orig_start, align 4
  call void @insert_match(i8* %101, i32 %102, i32 2, i8* @rl_menu_complete.quote_char)
  br label %if.end145

if.else138:                                       ; preds = %land.lhs.true132, %if.end129
  %103 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %104 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %arrayidx139 = getelementptr inbounds i8*, i8** %103, i32 %104
  %105 = load i8*, i8** %arrayidx139, align 4
  %106 = load i32, i32* @rl_menu_complete.orig_start, align 4
  call void @insert_match(i8* %105, i32 %106, i32 1, i8* @rl_menu_complete.quote_char)
  %107 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %108 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %arrayidx140 = getelementptr inbounds i8*, i8** %107, i32 %108
  %109 = load i8*, i8** %arrayidx140, align 4
  %110 = load i32, i32* @rl_menu_complete.delimiter, align 4
  %111 = load i8, i8* @rl_menu_complete.quote_char, align 1
  %conv141 = sext i8 %111 to i32
  %112 = load i8*, i8** @rl_menu_complete.orig_text, align 4
  %113 = load i8**, i8*** @rl_menu_complete.matches, align 4
  %114 = load i32, i32* @rl_menu_complete.match_list_index, align 4
  %arrayidx142 = getelementptr inbounds i8*, i8** %113, i32 %114
  %115 = load i8*, i8** %arrayidx142, align 4
  %call143 = call i32 @strcmp(i8* %112, i8* %115)
  %call144 = call i32 @append_to_match(i8* %109, i32 %110, i32 %conv141, i32 %call143)
  br label %if.end145

if.end145:                                        ; preds = %if.else138, %if.then135
  store i32 1, i32* @completion_changed_buffer, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end145, %if.end119, %if.then104, %if.then95, %if.then88, %if.end86, %if.end44, %if.end33
  %116 = load i32, i32* %retval, align 4
  ret i32 %116
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_menu_complete(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %0
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_menu_complete(i32 %sub, i32 %1)
  ret i32 %call
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_wcwidth(i32 %wc) #0 {
entry:
  %retval = alloca i32, align 4
  %wc.addr = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  switch i32 %0, label %sw.default [
    i32 32, label %sw.bb
    i32 33, label %sw.bb
    i32 34, label %sw.bb
    i32 35, label %sw.bb
    i32 37, label %sw.bb
    i32 38, label %sw.bb
    i32 39, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 42, label %sw.bb
    i32 43, label %sw.bb
    i32 44, label %sw.bb
    i32 45, label %sw.bb
    i32 46, label %sw.bb
    i32 47, label %sw.bb
    i32 48, label %sw.bb
    i32 49, label %sw.bb
    i32 50, label %sw.bb
    i32 51, label %sw.bb
    i32 52, label %sw.bb
    i32 53, label %sw.bb
    i32 54, label %sw.bb
    i32 55, label %sw.bb
    i32 56, label %sw.bb
    i32 57, label %sw.bb
    i32 58, label %sw.bb
    i32 59, label %sw.bb
    i32 60, label %sw.bb
    i32 61, label %sw.bb
    i32 62, label %sw.bb
    i32 63, label %sw.bb
    i32 65, label %sw.bb
    i32 66, label %sw.bb
    i32 67, label %sw.bb
    i32 68, label %sw.bb
    i32 69, label %sw.bb
    i32 70, label %sw.bb
    i32 71, label %sw.bb
    i32 72, label %sw.bb
    i32 73, label %sw.bb
    i32 74, label %sw.bb
    i32 75, label %sw.bb
    i32 76, label %sw.bb
    i32 77, label %sw.bb
    i32 78, label %sw.bb
    i32 79, label %sw.bb
    i32 80, label %sw.bb
    i32 81, label %sw.bb
    i32 82, label %sw.bb
    i32 83, label %sw.bb
    i32 84, label %sw.bb
    i32 85, label %sw.bb
    i32 86, label %sw.bb
    i32 87, label %sw.bb
    i32 88, label %sw.bb
    i32 89, label %sw.bb
    i32 90, label %sw.bb
    i32 91, label %sw.bb
    i32 92, label %sw.bb
    i32 93, label %sw.bb
    i32 94, label %sw.bb
    i32 95, label %sw.bb
    i32 97, label %sw.bb
    i32 98, label %sw.bb
    i32 99, label %sw.bb
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 102, label %sw.bb
    i32 103, label %sw.bb
    i32 104, label %sw.bb
    i32 105, label %sw.bb
    i32 106, label %sw.bb
    i32 107, label %sw.bb
    i32 108, label %sw.bb
    i32 109, label %sw.bb
    i32 110, label %sw.bb
    i32 111, label %sw.bb
    i32 112, label %sw.bb
    i32 113, label %sw.bb
    i32 114, label %sw.bb
    i32 115, label %sw.bb
    i32 116, label %sw.bb
    i32 117, label %sw.bb
    i32 118, label %sw.bb
    i32 119, label %sw.bb
    i32 120, label %sw.bb
    i32 121, label %sw.bb
    i32 122, label %sw.bb
    i32 123, label %sw.bb
    i32 124, label %sw.bb
    i32 125, label %sw.bb
    i32 126, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %1 = load i32, i32* %wc.addr, align 4
  %call = call i32 @wcwidth(i32 %1)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare i32 @wcwidth(i32) #1

declare i8* @getenv(i8*) #1

declare i32 @atoi(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @fnprint(i8* %to_print, i32 %prefix_bytes, i8* %real_pathname) #0 {
entry:
  %to_print.addr = alloca i8*, align 4
  %prefix_bytes.addr = alloca i32, align 4
  %real_pathname.addr = alloca i8*, align 4
  %printed_len = alloca i32, align 4
  %w = alloca i32, align 4
  %s = alloca i8*, align 4
  %common_prefix_len = alloca i32, align 4
  %print_len = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %end = alloca i8*, align 4
  %tlen = alloca i32, align 4
  %width = alloca i32, align 4
  %wc = alloca i32, align 4
  %ellipsis = alloca i8, align 1
  store i8* %to_print, i8** %to_print.addr, align 4
  store i32 %prefix_bytes, i32* %prefix_bytes.addr, align 4
  store i8* %real_pathname, i8** %real_pathname.addr, align 4
  %0 = load i8*, i8** %to_print.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %print_len, align 4
  %1 = load i8*, i8** %to_print.addr, align 4
  %2 = load i32, i32* %print_len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %1, i32 %2
  %add.ptr1 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr1, i8** %end, align 4
  %3 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %3, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %common_prefix_len, align 4
  store i32 0, i32* %printed_len, align 4
  %4 = load i32, i32* @_rl_completion_prefix_display_length, align 4
  %cmp = icmp sgt i32 %4, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i32, i32* %prefix_bytes.addr, align 4
  %6 = load i32, i32* %print_len, align 4
  %cmp2 = icmp sge i32 %5, %6
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* %prefix_bytes.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %7 = load i32, i32* @_rl_colored_stats, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %land.lhs.true3, label %if.end8

land.lhs.true3:                                   ; preds = %if.end
  %8 = load i32, i32* %prefix_bytes.addr, align 4
  %cmp4 = icmp eq i32 %8, 0
  br i1 %cmp4, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3
  %9 = load i32, i32* @_rl_colored_completion_prefix, align 4
  %cmp5 = icmp sle i32 %9, 0
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %lor.lhs.false, %land.lhs.true3
  %10 = load i8*, i8** %real_pathname.addr, align 4
  %call7 = call i32 @colored_stat_start(i8* %10)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %lor.lhs.false, %if.end
  %11 = load i32, i32* %prefix_bytes.addr, align 4
  %tobool9 = icmp ne i32 %11, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.else

land.lhs.true10:                                  ; preds = %if.end8
  %12 = load i32, i32* @_rl_completion_prefix_display_length, align 4
  %cmp11 = icmp sgt i32 %12, 0
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %land.lhs.true10
  %13 = load i8*, i8** %to_print.addr, align 4
  %14 = load i32, i32* %prefix_bytes.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %15 to i32
  %cmp13 = icmp eq i32 %conv, 46
  %cond = select i1 %cmp13, i32 95, i32 46
  %conv15 = trunc i32 %cond to i8
  store i8 %conv15, i8* %ellipsis, align 1
  store i32 0, i32* %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then12
  %16 = load i32, i32* %w, align 4
  %cmp16 = icmp slt i32 %16, 3
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load i8, i8* %ellipsis, align 1
  %conv18 = sext i8 %17 to i32
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call19 = call i32 @putc(i32 %conv18, %struct._IO_FILE* %18)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %w, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %w, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 3, i32* %printed_len, align 4
  br label %if.end27

if.else:                                          ; preds = %land.lhs.true10, %if.end8
  %20 = load i32, i32* %prefix_bytes.addr, align 4
  %tobool20 = icmp ne i32 %20, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %if.else
  %21 = load i32, i32* @_rl_colored_completion_prefix, align 4
  %cmp22 = icmp sgt i32 %21, 0
  br i1 %cmp22, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true21
  %22 = load i32, i32* %prefix_bytes.addr, align 4
  store i32 %22, i32* %common_prefix_len, align 4
  store i32 0, i32* %prefix_bytes.addr, align 4
  %call25 = call i32 @colored_prefix_start()
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %land.lhs.true21, %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %for.end
  %23 = load i8*, i8** %to_print.addr, align 4
  %24 = load i32, i32* %prefix_bytes.addr, align 4
  %add.ptr28 = getelementptr inbounds i8, i8* %23, i32 %24
  store i8* %add.ptr28, i8** %s, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end111, %if.end27
  %25 = load i8*, i8** %s, align 4
  %26 = load i8, i8* %25, align 1
  %tobool29 = icmp ne i8 %26, 0
  br i1 %tobool29, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %27 = load i8*, i8** %s, align 4
  %28 = load i8, i8* %27, align 1
  %conv30 = sext i8 %28 to i32
  %cmp31 = icmp slt i32 %conv30, 32
  br i1 %cmp31, label %land.lhs.true33, label %if.else62

land.lhs.true33:                                  ; preds = %while.body
  %29 = load i8*, i8** %s, align 4
  %30 = load i8, i8* %29, align 1
  %conv34 = sext i8 %30 to i32
  %and = and i32 %conv34, 128
  %cmp35 = icmp eq i32 %and, 0
  br i1 %cmp35, label %if.then37, label %if.else62

if.then37:                                        ; preds = %land.lhs.true33
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call38 = call i32 @putc(i32 94, %struct._IO_FILE* %31)
  %32 = load i8*, i8** %s, align 4
  %33 = load i8, i8* %32, align 1
  %conv39 = sext i8 %33 to i32
  %or = or i32 %conv39, 64
  %conv40 = trunc i32 %or to i8
  %conv41 = zext i8 %conv40 to i32
  %34 = load i8*, i8** %s, align 4
  %35 = load i8, i8* %34, align 1
  %conv42 = sext i8 %35 to i32
  %or43 = or i32 %conv42, 64
  %cmp44 = icmp eq i32 %conv41, %or43
  br i1 %cmp44, label %land.lhs.true46, label %cond.false

land.lhs.true46:                                  ; preds = %if.then37
  %36 = load i8*, i8** %s, align 4
  %37 = load i8, i8* %36, align 1
  %conv47 = sext i8 %37 to i32
  %or48 = or i32 %conv47, 64
  %conv49 = trunc i32 %or48 to i8
  %conv50 = zext i8 %conv49 to i32
  %call51 = call i32 @islower(i32 %conv50) #4
  %tobool52 = icmp ne i32 %call51, 0
  br i1 %tobool52, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true46
  %38 = load i8*, i8** %s, align 4
  %39 = load i8, i8* %38, align 1
  %conv53 = sext i8 %39 to i32
  %or54 = or i32 %conv53, 64
  %conv55 = trunc i32 %or54 to i8
  %conv56 = zext i8 %conv55 to i32
  %call57 = call i32 @toupper(i32 %conv56) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true46, %if.then37
  %40 = load i8*, i8** %s, align 4
  %41 = load i8, i8* %40, align 1
  %conv58 = sext i8 %41 to i32
  %or59 = or i32 %conv58, 64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond60 = phi i32 [ %call57, %cond.true ], [ %or59, %cond.false ]
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call61 = call i32 @putc(i32 %cond60, %struct._IO_FILE* %42)
  %43 = load i32, i32* %printed_len, align 4
  %add = add nsw i32 %43, 2
  store i32 %add, i32* %printed_len, align 4
  %44 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %45 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %45, i8 0, i32 8, i32 4, i1 false)
  br label %if.end97

if.else62:                                        ; preds = %land.lhs.true33, %while.body
  %46 = load i8*, i8** %s, align 4
  %47 = load i8, i8* %46, align 1
  %conv63 = sext i8 %47 to i32
  %cmp64 = icmp eq i32 %conv63, 127
  br i1 %cmp64, label %if.then66, label %if.else71

if.then66:                                        ; preds = %if.else62
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call67 = call i32 @putc(i32 94, %struct._IO_FILE* %48)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call68 = call i32 @putc(i32 63, %struct._IO_FILE* %49)
  %50 = load i32, i32* %printed_len, align 4
  %add69 = add nsw i32 %50, 2
  store i32 %add69, i32* %printed_len, align 4
  %51 = load i8*, i8** %s, align 4
  %incdec.ptr70 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %incdec.ptr70, i8** %s, align 4
  %52 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %52, i8 0, i32 8, i32 4, i1 false)
  br label %if.end96

if.else71:                                        ; preds = %if.else62
  %53 = load i8*, i8** %s, align 4
  %54 = load i8*, i8** %end, align 4
  %55 = load i8*, i8** %s, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %54 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %55 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call72 = call i32 @mbrtowc(i32* %wc, i8* %53, i32 %sub.ptr.sub, %struct.__mbstate_t* %ps)
  store i32 %call72, i32* %tlen, align 4
  %56 = load i32, i32* %tlen, align 4
  %cmp73 = icmp eq i32 %56, -1
  br i1 %cmp73, label %if.then78, label %lor.lhs.false75

lor.lhs.false75:                                  ; preds = %if.else71
  %57 = load i32, i32* %tlen, align 4
  %cmp76 = icmp eq i32 %57, -2
  br i1 %cmp76, label %if.then78, label %if.else79

if.then78:                                        ; preds = %lor.lhs.false75, %if.else71
  store i32 1, i32* %tlen, align 4
  store i32 1, i32* %width, align 4
  %58 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %58, i8 0, i32 8, i32 4, i1 false)
  br label %if.end92

if.else79:                                        ; preds = %lor.lhs.false75
  %59 = load i32, i32* %tlen, align 4
  %cmp80 = icmp eq i32 %59, 0
  br i1 %cmp80, label %if.then82, label %if.else83

if.then82:                                        ; preds = %if.else79
  br label %while.end

if.else83:                                        ; preds = %if.else79
  %60 = load i32, i32* %wc, align 4
  %call84 = call i32 @_rl_wcwidth(i32 %60)
  store i32 %call84, i32* %w, align 4
  %61 = load i32, i32* %w, align 4
  %cmp85 = icmp sge i32 %61, 0
  br i1 %cmp85, label %cond.true87, label %cond.false88

cond.true87:                                      ; preds = %if.else83
  %62 = load i32, i32* %w, align 4
  br label %cond.end89

cond.false88:                                     ; preds = %if.else83
  br label %cond.end89

cond.end89:                                       ; preds = %cond.false88, %cond.true87
  %cond90 = phi i32 [ %62, %cond.true87 ], [ 1, %cond.false88 ]
  store i32 %cond90, i32* %width, align 4
  br label %if.end91

if.end91:                                         ; preds = %cond.end89
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %if.then78
  %63 = load i8*, i8** %s, align 4
  %64 = load i32, i32* %tlen, align 4
  %65 = load %struct._IO_FILE*, %struct._IO_FILE** @rl_outstream, align 4
  %call93 = call i32 @fwrite(i8* %63, i32 1, i32 %64, %struct._IO_FILE* %65)
  %66 = load i32, i32* %tlen, align 4
  %67 = load i8*, i8** %s, align 4
  %add.ptr94 = getelementptr inbounds i8, i8* %67, i32 %66
  store i8* %add.ptr94, i8** %s, align 4
  %68 = load i32, i32* %width, align 4
  %69 = load i32, i32* %printed_len, align 4
  %add95 = add nsw i32 %69, %68
  store i32 %add95, i32* %printed_len, align 4
  br label %if.end96

if.end96:                                         ; preds = %if.end92, %if.then66
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %cond.end
  %70 = load i32, i32* %common_prefix_len, align 4
  %cmp98 = icmp sgt i32 %70, 0
  br i1 %cmp98, label %land.lhs.true100, label %if.end111

land.lhs.true100:                                 ; preds = %if.end97
  %71 = load i8*, i8** %s, align 4
  %72 = load i8*, i8** %to_print.addr, align 4
  %sub.ptr.lhs.cast101 = ptrtoint i8* %71 to i32
  %sub.ptr.rhs.cast102 = ptrtoint i8* %72 to i32
  %sub.ptr.sub103 = sub i32 %sub.ptr.lhs.cast101, %sub.ptr.rhs.cast102
  %73 = load i32, i32* %common_prefix_len, align 4
  %cmp104 = icmp sge i32 %sub.ptr.sub103, %73
  br i1 %cmp104, label %if.then106, label %if.end111

if.then106:                                       ; preds = %land.lhs.true100
  call void @colored_prefix_end()
  %74 = load i32, i32* @_rl_colored_stats, align 4
  %tobool107 = icmp ne i32 %74, 0
  br i1 %tobool107, label %if.then108, label %if.end110

if.then108:                                       ; preds = %if.then106
  %75 = load i8*, i8** %real_pathname.addr, align 4
  %call109 = call i32 @colored_stat_start(i8* %75)
  br label %if.end110

if.end110:                                        ; preds = %if.then108, %if.then106
  store i32 0, i32* %common_prefix_len, align 4
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %land.lhs.true100, %if.end97
  br label %while.cond

while.end:                                        ; preds = %if.then82, %while.cond
  %76 = load i32, i32* @_rl_colored_stats, align 4
  %tobool112 = icmp ne i32 %76, 0
  br i1 %tobool112, label %if.then113, label %if.end114

if.then113:                                       ; preds = %while.end
  call void @colored_stat_end()
  br label %if.end114

if.end114:                                        ; preds = %if.then113, %while.end
  %77 = load i32, i32* %printed_len, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind
define internal i32 @stat_char(i8* %filename) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  %character = alloca i32, align 4
  %r = alloca i32, align 4
  %f = alloca i8*, align 4
  %fn = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i8* null, i8** %f, align 4
  %0 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %tobool = icmp ne i32 (i8**)* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @strlen(i8* %1)
  %add = add i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %2 = load i8*, i8** %filename.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %2)
  store i8* %call2, i8** %f, align 4
  %3 = load i32 (i8**)*, i32 (i8**)** @rl_filename_stat_hook, align 4
  %call3 = call i32 %3(i8** %f)
  %4 = load i8*, i8** %f, align 4
  store i8* %4, i8** %fn, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load i8*, i8** %filename.addr, align 4
  store i8* %5, i8** %fn, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i8*, i8** %fn, align 4
  %call4 = call i32 @lstat(i8* %6, %struct.stat* %finfo)
  store i32 %call4, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  %cmp = icmp eq i32 %7, -1
  br i1 %cmp, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %character, align 4
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %8 = load i32, i32* %st_mode, align 8
  %and = and i32 %8, 61440
  %cmp7 = icmp eq i32 %and, 16384
  br i1 %cmp7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.end6
  store i32 47, i32* %character, align 4
  br label %if.end49

if.else9:                                         ; preds = %if.end6
  %st_mode10 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %9 = load i32, i32* %st_mode10, align 8
  %and11 = and i32 %9, 61440
  %cmp12 = icmp eq i32 %and11, 8192
  br i1 %cmp12, label %if.then13, label %if.else14

if.then13:                                        ; preds = %if.else9
  store i32 37, i32* %character, align 4
  br label %if.end48

if.else14:                                        ; preds = %if.else9
  %st_mode15 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %10 = load i32, i32* %st_mode15, align 8
  %and16 = and i32 %10, 61440
  %cmp17 = icmp eq i32 %and16, 24576
  br i1 %cmp17, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.else14
  store i32 35, i32* %character, align 4
  br label %if.end47

if.else19:                                        ; preds = %if.else14
  %st_mode20 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %11 = load i32, i32* %st_mode20, align 8
  %and21 = and i32 %11, 61440
  %cmp22 = icmp eq i32 %and21, 40960
  br i1 %cmp22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else19
  store i32 64, i32* %character, align 4
  br label %if.end46

if.else24:                                        ; preds = %if.else19
  %st_mode25 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %12 = load i32, i32* %st_mode25, align 8
  %and26 = and i32 %12, 61440
  %cmp27 = icmp eq i32 %and26, 49152
  br i1 %cmp27, label %if.then28, label %if.else29

if.then28:                                        ; preds = %if.else24
  store i32 61, i32* %character, align 4
  br label %if.end45

if.else29:                                        ; preds = %if.else24
  %st_mode30 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %13 = load i32, i32* %st_mode30, align 8
  %and31 = and i32 %13, 61440
  %cmp32 = icmp eq i32 %and31, 4096
  br i1 %cmp32, label %if.then33, label %if.else34

if.then33:                                        ; preds = %if.else29
  store i32 124, i32* %character, align 4
  br label %if.end44

if.else34:                                        ; preds = %if.else29
  %st_mode35 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %14 = load i32, i32* %st_mode35, align 8
  %and36 = and i32 %14, 61440
  %cmp37 = icmp eq i32 %and36, 32768
  br i1 %cmp37, label %if.then38, label %if.end43

if.then38:                                        ; preds = %if.else34
  %15 = load i8*, i8** %filename.addr, align 4
  %call39 = call i32 @access(i8* %15, i32 1)
  %cmp40 = icmp eq i32 %call39, 0
  br i1 %cmp40, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.then38
  store i32 42, i32* %character, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then41, %if.then38
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.else34
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then33
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.then28
  br label %if.end46

if.end46:                                         ; preds = %if.end45, %if.then23
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then18
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.then13
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then8
  %16 = load i8*, i8** %f, align 4
  call void @xfree(i8* %16)
  %17 = load i32, i32* %character, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end49, %if.then5
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind
define internal i32 @path_isdir(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %finfo = alloca %struct.stat, align 8
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %finfo)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %1 = load i32, i32* %st_mode, align 8
  %and = and i32 %1, 61440
  %cmp1 = icmp eq i32 %and, 16384
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define internal i32 @colored_stat_start(i8* %filename) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  call void @_rl_set_normal_color()
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call zeroext i1 @_rl_print_color_indicator(i8* %0)
  %conv = zext i1 %call to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define internal i32 @colored_prefix_start() #0 {
entry:
  call void @_rl_set_normal_color()
  %call = call zeroext i1 @_rl_print_prefix_color()
  %conv = zext i1 %call to i32
  ret i32 %conv
}

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

declare i32 @fwrite(i8*, i32, i32, %struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal void @colored_prefix_end() #0 {
entry:
  call void @colored_stat_end()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @colored_stat_end() #0 {
entry:
  call void @_rl_prep_non_filename_text()
  call void @_rl_put_indicator(%struct.bin_str* getelementptr inbounds ([0 x %struct.bin_str], [0 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 23))
  ret void
}

declare void @_rl_set_normal_color() #1

declare zeroext i1 @_rl_print_color_indicator(i8*) #1

declare zeroext i1 @_rl_print_prefix_color() #1

declare void @_rl_prep_non_filename_text() #1

declare void @_rl_put_indicator(%struct.bin_str*) #1

declare i32 @lstat(i8*, %struct.stat*) #1

declare i32 @access(i8*, i32) #1

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @get_y_or_n(i32 %for_pager) #0 {
entry:
  %retval = alloca i32, align 4
  %for_pager.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %for_pager, i32* %for_pager.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %for.cond

for.cond:                                         ; preds = %if.end32, %if.end
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %c, align 4
  %2 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %2, -65
  store i32 %and1, i32* @rl_readline_state, align 4
  %3 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %3, 121
  br i1 %cmp, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond
  %4 = load i32, i32* %c, align 4
  %cmp2 = icmp eq i32 %4, 89
  br i1 %cmp2, label %if.then5, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %5 = load i32, i32* %c, align 4
  %cmp4 = icmp eq i32 %5, 32
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false3, %lor.lhs.false, %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false3
  %6 = load i32, i32* %c, align 4
  %cmp7 = icmp eq i32 %6, 110
  br i1 %cmp7, label %if.then12, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %if.end6
  %7 = load i32, i32* %c, align 4
  %cmp9 = icmp eq i32 %7, 78
  br i1 %cmp9, label %if.then12, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false8
  %8 = load i32, i32* %c, align 4
  %cmp11 = icmp eq i32 %8, 127
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false10, %lor.lhs.false8, %if.end6
  store i32 0, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %lor.lhs.false10
  %9 = load i32, i32* %c, align 4
  %cmp14 = icmp eq i32 %9, 7
  br i1 %cmp14, label %if.then17, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %if.end13
  %10 = load i32, i32* %c, align 4
  %cmp16 = icmp slt i32 %10, 0
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %lor.lhs.false15, %if.end13
  %call18 = call i32 @_rl_abort_internal()
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %lor.lhs.false15
  %11 = load i32, i32* %for_pager.addr, align 4
  %tobool20 = icmp ne i32 %11, 0
  br i1 %tobool20, label %land.lhs.true, label %if.end25

land.lhs.true:                                    ; preds = %if.end19
  %12 = load i32, i32* %c, align 4
  %cmp21 = icmp eq i32 %12, 10
  br i1 %cmp21, label %if.then24, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %land.lhs.true
  %13 = load i32, i32* %c, align 4
  %cmp23 = icmp eq i32 %13, 13
  br i1 %cmp23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %lor.lhs.false22, %land.lhs.true
  store i32 2, i32* %retval, align 4
  br label %return

if.end25:                                         ; preds = %lor.lhs.false22, %if.end19
  %14 = load i32, i32* %for_pager.addr, align 4
  %tobool26 = icmp ne i32 %14, 0
  br i1 %tobool26, label %land.lhs.true27, label %if.end32

land.lhs.true27:                                  ; preds = %if.end25
  %15 = load i32, i32* %c, align 4
  %cmp28 = icmp eq i32 %15, 113
  br i1 %cmp28, label %if.then31, label %lor.lhs.false29

lor.lhs.false29:                                  ; preds = %land.lhs.true27
  %16 = load i32, i32* %c, align 4
  %cmp30 = icmp eq i32 %16, 81
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %lor.lhs.false29, %land.lhs.true27
  store i32 0, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %lor.lhs.false29, %if.end25
  %call33 = call i32 @rl_ding()
  br label %for.cond

return:                                           ; preds = %if.then31, %if.then24, %if.then12, %if.then5, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare void @_rl_erase_entire_line() #1

declare i32 @rl_read_key() #1

declare i32 @_rl_abort_internal() #1

; Function Attrs: noinline nounwind
define internal i8** @remove_duplicate_matches(i8** %matches) #0 {
entry:
  %matches.addr = alloca i8**, align 4
  %lowest_common = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %newlen = alloca i32, align 4
  %dead_slot = alloca i8, align 1
  %temp_array = alloca i8**, align 4
  store i8** %matches, i8*** %matches.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8**, i8*** %matches.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.end
  %5 = load i32, i32* @rl_sort_completion_matches, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8**, i8*** %matches.addr, align 4
  %add.ptr = getelementptr inbounds i8*, i8** %6, i32 1
  %7 = bitcast i8** %add.ptr to i8*
  %8 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %8, 1
  call void @qsort(i8* %7, i32 %sub, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @_rl_qsort_string_compare to i32 (i8*, i8*)*))
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.end
  %9 = load i8**, i8*** %matches.addr, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %9, i32 0
  %10 = load i8*, i8** %arrayidx3, align 4
  %call = call i32 @strlen(i8* %10)
  %add = add i32 1, %call
  %call4 = call i8* @xmalloc(i32 %add)
  %11 = load i8**, i8*** %matches.addr, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %11, i32 0
  %12 = load i8*, i8** %arrayidx5, align 4
  %call6 = call i8* @strcpy(i8* %call4, i8* %12)
  store i8* %call6, i8** %lowest_common, align 4
  store i32 0, i32* %newlen, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc21, %if.end
  %13 = load i8**, i8*** %matches.addr, align 4
  %14 = load i32, i32* %i, align 4
  %add8 = add nsw i32 %14, 1
  %arrayidx9 = getelementptr inbounds i8*, i8** %13, i32 %add8
  %15 = load i8*, i8** %arrayidx9, align 4
  %tobool10 = icmp ne i8* %15, null
  br i1 %tobool10, label %for.body11, label %for.end23

for.body11:                                       ; preds = %for.cond7
  %16 = load i8**, i8*** %matches.addr, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx12, align 4
  %19 = load i8**, i8*** %matches.addr, align 4
  %20 = load i32, i32* %i, align 4
  %add13 = add nsw i32 %20, 1
  %arrayidx14 = getelementptr inbounds i8*, i8** %19, i32 %add13
  %21 = load i8*, i8** %arrayidx14, align 4
  %call15 = call i32 @strcmp(i8* %18, i8* %21)
  %cmp = icmp eq i32 %call15, 0
  br i1 %cmp, label %if.then16, label %if.else

if.then16:                                        ; preds = %for.body11
  %22 = load i8**, i8*** %matches.addr, align 4
  %23 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx17, align 4
  call void @xfree(i8* %24)
  %25 = load i8**, i8*** %matches.addr, align 4
  %26 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %25, i32 %26
  store i8* %dead_slot, i8** %arrayidx18, align 4
  br label %if.end20

if.else:                                          ; preds = %for.body11
  %27 = load i32, i32* %newlen, align 4
  %inc19 = add nsw i32 %27, 1
  store i32 %inc19, i32* %newlen, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then16
  br label %for.inc21

for.inc21:                                        ; preds = %if.end20
  %28 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %28, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond7

for.end23:                                        ; preds = %for.cond7
  %29 = load i32, i32* %newlen, align 4
  %add24 = add nsw i32 3, %29
  %mul = mul i32 %add24, 4
  %call25 = call i8* @xmalloc(i32 %mul)
  %30 = bitcast i8* %call25 to i8**
  store i8** %30, i8*** %temp_array, align 4
  store i32 1, i32* %j, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc37, %for.end23
  %31 = load i8**, i8*** %matches.addr, align 4
  %32 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8*, i8** %31, i32 %32
  %33 = load i8*, i8** %arrayidx27, align 4
  %tobool28 = icmp ne i8* %33, null
  br i1 %tobool28, label %for.body29, label %for.end39

for.body29:                                       ; preds = %for.cond26
  %34 = load i8**, i8*** %matches.addr, align 4
  %35 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %34, i32 %35
  %36 = load i8*, i8** %arrayidx30, align 4
  %cmp31 = icmp ne i8* %36, %dead_slot
  br i1 %cmp31, label %if.then32, label %if.end36

if.then32:                                        ; preds = %for.body29
  %37 = load i8**, i8*** %matches.addr, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx33, align 4
  %40 = load i8**, i8*** %temp_array, align 4
  %41 = load i32, i32* %j, align 4
  %inc34 = add nsw i32 %41, 1
  store i32 %inc34, i32* %j, align 4
  %arrayidx35 = getelementptr inbounds i8*, i8** %40, i32 %41
  store i8* %39, i8** %arrayidx35, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then32, %for.body29
  br label %for.inc37

for.inc37:                                        ; preds = %if.end36
  %42 = load i32, i32* %i, align 4
  %inc38 = add nsw i32 %42, 1
  store i32 %inc38, i32* %i, align 4
  br label %for.cond26

for.end39:                                        ; preds = %for.cond26
  %43 = load i8**, i8*** %temp_array, align 4
  %44 = load i32, i32* %j, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %43, i32 %44
  store i8* null, i8** %arrayidx40, align 4
  %45 = load i8**, i8*** %matches.addr, align 4
  %arrayidx41 = getelementptr inbounds i8*, i8** %45, i32 0
  %46 = load i8*, i8** %arrayidx41, align 4
  %cmp42 = icmp ne i8* %46, %dead_slot
  br i1 %cmp42, label %if.then43, label %if.end45

if.then43:                                        ; preds = %for.end39
  %47 = load i8**, i8*** %matches.addr, align 4
  %arrayidx44 = getelementptr inbounds i8*, i8** %47, i32 0
  %48 = load i8*, i8** %arrayidx44, align 4
  call void @xfree(i8* %48)
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %for.end39
  %49 = load i8*, i8** %lowest_common, align 4
  %50 = load i8**, i8*** %temp_array, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %50, i32 0
  store i8* %49, i8** %arrayidx46, align 4
  %51 = load i32, i32* %j, align 4
  %cmp47 = icmp eq i32 %51, 2
  br i1 %cmp47, label %land.lhs.true48, label %if.end56

land.lhs.true48:                                  ; preds = %if.end45
  %52 = load i8**, i8*** %temp_array, align 4
  %arrayidx49 = getelementptr inbounds i8*, i8** %52, i32 0
  %53 = load i8*, i8** %arrayidx49, align 4
  %54 = load i8**, i8*** %temp_array, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %54, i32 1
  %55 = load i8*, i8** %arrayidx50, align 4
  %call51 = call i32 @strcmp(i8* %53, i8* %55)
  %cmp52 = icmp eq i32 %call51, 0
  br i1 %cmp52, label %if.then53, label %if.end56

if.then53:                                        ; preds = %land.lhs.true48
  %56 = load i8**, i8*** %temp_array, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %56, i32 1
  %57 = load i8*, i8** %arrayidx54, align 4
  call void @xfree(i8* %57)
  %58 = load i8**, i8*** %temp_array, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %58, i32 1
  store i8* null, i8** %arrayidx55, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then53, %land.lhs.true48, %if.end45
  %59 = load i8**, i8*** %temp_array, align 4
  ret i8** %59
}

; Function Attrs: noinline nounwind
define internal i8* @make_quoted_replacement(i8* %match, i32 %mtype, i8* %qc) #0 {
entry:
  %match.addr = alloca i8*, align 4
  %mtype.addr = alloca i32, align 4
  %qc.addr = alloca i8*, align 4
  %should_quote = alloca i32, align 4
  %do_replace = alloca i32, align 4
  %replacement = alloca i8*, align 4
  store i8* %match, i8** %match.addr, align 4
  store i32 %mtype, i32* %mtype.addr, align 4
  store i8* %qc, i8** %qc.addr, align 4
  %0 = load i8*, i8** %match.addr, align 4
  store i8* %0, i8** %replacement, align 4
  %1 = load i8*, i8** %match.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** @rl_completer_quote_characters, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %land.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32, i32* @rl_filename_completion_desired, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true2
  %4 = load i32, i32* @rl_filename_quoting_desired, align 4
  %tobool4 = icmp ne i32 %4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true2, %land.lhs.true, %entry
  %5 = phi i1 [ false, %land.lhs.true2 ], [ false, %land.lhs.true ], [ false, %entry ], [ %tobool4, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  store i32 %land.ext, i32* %should_quote, align 4
  %6 = load i32, i32* %should_quote, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  %7 = load i32, i32* %should_quote, align 4
  %tobool6 = icmp ne i32 %7, 0
  br i1 %tobool6, label %land.rhs7, label %land.end15

land.rhs7:                                        ; preds = %if.then
  %8 = load i8*, i8** %qc.addr, align 4
  %tobool8 = icmp ne i8* %8, null
  br i1 %tobool8, label %lor.lhs.false, label %lor.end

lor.lhs.false:                                    ; preds = %land.rhs7
  %9 = load i8*, i8** %qc.addr, align 4
  %10 = load i8, i8* %9, align 1
  %tobool9 = icmp ne i8 %10, 0
  br i1 %tobool9, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %lor.lhs.false
  %11 = load i8*, i8** @rl_completer_quote_characters, align 4
  %tobool10 = icmp ne i8* %11, null
  br i1 %tobool10, label %land.rhs11, label %land.end13

land.rhs11:                                       ; preds = %lor.rhs
  %12 = load i8*, i8** @rl_completer_quote_characters, align 4
  %13 = load i8*, i8** %qc.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv = sext i8 %14 to i32
  %call = call i8* @strchr(i8* %12, i32 %conv)
  %tobool12 = icmp ne i8* %call, null
  br label %land.end13

land.end13:                                       ; preds = %land.rhs11, %lor.rhs
  %15 = phi i1 [ false, %lor.rhs ], [ %tobool12, %land.rhs11 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end13, %lor.lhs.false, %land.rhs7
  %16 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs7 ], [ %15, %land.end13 ]
  br label %land.end15

land.end15:                                       ; preds = %lor.end, %if.then
  %17 = phi i1 [ false, %if.then ], [ %16, %lor.end ]
  %land.ext16 = zext i1 %17 to i32
  store i32 %land.ext16, i32* %should_quote, align 4
  br label %if.end

if.end:                                           ; preds = %land.end15, %land.end
  %18 = load i32, i32* %should_quote, align 4
  %tobool17 = icmp ne i32 %18, 0
  br i1 %tobool17, label %if.then18, label %if.end34

if.then18:                                        ; preds = %if.end
  %19 = load i8*, i8** @rl_filename_quote_characters, align 4
  %tobool19 = icmp ne i8* %19, null
  br i1 %tobool19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then18
  %20 = load i8*, i8** %match.addr, align 4
  %21 = load i8*, i8** @rl_filename_quote_characters, align 4
  %call20 = call i8* @strpbrk(i8* %20, i8* %21)
  %cmp = icmp ne i8* %call20, null
  %conv21 = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %if.then18
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv21, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %should_quote, align 4
  %22 = load i32, i32* %should_quote, align 4
  %tobool22 = icmp ne i32 %22, 0
  br i1 %tobool22, label %cond.true23, label %cond.false24

cond.true23:                                      ; preds = %cond.end
  %23 = load i32, i32* %mtype.addr, align 4
  br label %cond.end25

cond.false24:                                     ; preds = %cond.end
  br label %cond.end25

cond.end25:                                       ; preds = %cond.false24, %cond.true23
  %cond26 = phi i32 [ %23, %cond.true23 ], [ 0, %cond.false24 ]
  store i32 %cond26, i32* %do_replace, align 4
  %24 = load i32, i32* %do_replace, align 4
  %cmp27 = icmp ne i32 %24, 0
  br i1 %cmp27, label %land.lhs.true29, label %if.end33

land.lhs.true29:                                  ; preds = %cond.end25
  %25 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  %tobool30 = icmp ne i8* (i8*, i32, i8*)* %25, null
  br i1 %tobool30, label %if.then31, label %if.end33

if.then31:                                        ; preds = %land.lhs.true29
  %26 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  %27 = load i8*, i8** %match.addr, align 4
  %28 = load i32, i32* %do_replace, align 4
  %29 = load i8*, i8** %qc.addr, align 4
  %call32 = call i8* %26(i8* %27, i32 %28, i8* %29)
  store i8* %call32, i8** %replacement, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %land.lhs.true29, %cond.end25
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end
  %30 = load i8*, i8** %replacement, align 4
  ret i8* %30
}

declare i32 @_rl_replace_text(i8*, i32, i32) #1

declare i8* @strpbrk(i8*, i8*) #1

declare void @_rl_move_vert(i32) #1

declare i32 @rl_forced_update_display() #1

declare i32 @rl_insert_text(i8*) #1

declare i32 @rl_begin_undo_group() #1

declare i32 @rl_delete_text(i32, i32) #1

declare i32 @rl_end_undo_group() #1

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #3

declare i32 @towlower(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @_rl_compare_chars(i8*, i32, %struct.__mbstate_t*, i8*, i32, %struct.__mbstate_t*) #1

declare i32 @_rl_get_char_len(i8*, %struct.__mbstate_t*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i32 @strncasecmp(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
