; ModuleID = 'search.c'
source_filename = "search.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__rl_search_context = type { i32, i32, i8*, i32, i32, i8**, i8*, i32, i32, i32, i32, i32, i32, i8*, %struct.undo_list*, %struct._keymap_entry*, %struct._keymap_entry*, i32, i32, i32, i32, [16 x i8], [16 x i8], i8*, i32, i32, i8* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._hist_entry = type { i8*, i8*, i8* }

@_rl_nscxt = global %struct.__rl_search_context* null, align 4
@rl_readline_state = external global i32, align 4
@noninc_search_string = internal global i8* null, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@rl_history_search_len = internal global i32 0, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@rl_line_buffer = external global i8*, align 4
@rl_point = external global i32, align 4
@rl_end = external global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@noninc_history_pos = internal global i32 0, align 4
@rl_editing_mode = external global i32, align 4
@rl_mark = external global i32, align 4
@_rl_saved_line_for_history = external global %struct._hist_entry*, align 4
@rl_byte_oriented = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@rl_history_search_pos = internal global i32 0, align 4
@rl_history_search_flags = internal global i32 0, align 4
@prev_line_found = internal global i8* null, align 4
@history_string_size = internal global i32 0, align 4
@history_search_string = internal global i8* null, align 4
@_rl_caught_signal = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @_rl_nsearch_cleanup(%struct.__rl_search_context* %cxt, i32 %r) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %r.addr = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  store i32 %r, i32* %r.addr, align 4
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  call void @_rl_scxt_dispose(%struct.__rl_search_context* %0, i32 0)
  store %struct.__rl_search_context* null, %struct.__rl_search_context** @_rl_nscxt, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -257
  store i32 %and, i32* @rl_readline_state, align 4
  %2 = load i32, i32* %r.addr, align 4
  %cmp = icmp ne i32 %2, 1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @_rl_scxt_dispose(%struct.__rl_search_context*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_noninc_forward_search(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %0, 63
  %cond = select i1 %cmp, i32 63, i32 0
  %call = call i32 @noninc_search(i32 1, i32 %cond)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @noninc_search(i32 %dir, i32 %pchar) #0 {
entry:
  %retval = alloca i32, align 4
  %dir.addr = alloca i32, align 4
  %pchar.addr = alloca i32, align 4
  %cxt = alloca %struct.__rl_search_context*, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %dir, i32* %dir.addr, align 4
  store i32 %pchar, i32* %pchar.addr, align 4
  %0 = load i32, i32* %dir.addr, align 4
  %1 = load i32, i32* %pchar.addr, align 4
  %call = call %struct.__rl_search_context* @_rl_nsearch_init(i32 %0, i32 %1)
  store %struct.__rl_search_context* %call, %struct.__rl_search_context** %cxt, align 4
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %r, align 4
  br label %while.body

while.body:                                       ; preds = %if.end, %if.end10
  %3 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %call1 = call i32 @_rl_search_getchar(%struct.__rl_search_context* %3)
  store i32 %call1, i32* %c, align 4
  %4 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  br label %while.end

if.end3:                                          ; preds = %while.body
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %6 = load i32, i32* %c, align 4
  %call4 = call i32 @_rl_nsearch_dispatch(%struct.__rl_search_context* %5, i32 %6)
  store i32 %call4, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  %cmp5 = icmp slt i32 %7, 0
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.end3
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end3
  %8 = load i32, i32* %r, align 4
  %cmp7 = icmp eq i32 %8, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.else
  br label %while.end

if.end9:                                          ; preds = %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end9
  br label %while.body

while.end:                                        ; preds = %if.then8, %if.then2
  %9 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %call11 = call i32 @_rl_nsearch_dosearch(%struct.__rl_search_context* %9)
  store i32 %call11, i32* %r, align 4
  %10 = load i32, i32* %r, align 4
  %cmp12 = icmp sge i32 %10, 0
  br i1 %cmp12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.end
  %11 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %12 = load i32, i32* %r, align 4
  %call13 = call i32 @_rl_nsearch_cleanup(%struct.__rl_search_context* %11, i32 %12)
  br label %cond.end

cond.false:                                       ; preds = %while.end
  %13 = load i32, i32* %r, align 4
  %cmp14 = icmp ne i32 %13, 1
  %conv = zext i1 %cmp14 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call13, %cond.true ], [ %conv, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define i32 @rl_noninc_reverse_search(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %0, 47
  %cond = select i1 %cmp, i32 47, i32 0
  %call = call i32 @noninc_search(i32 -1, i32 %cond)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_noninc_forward_search_again(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i8*, i8** @noninc_search_string, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** @noninc_search_string, align 4
  %call1 = call i32 @noninc_dosearch(i8* %1, i32 1)
  store i32 %call1, i32* %r, align 4
  %2 = load i32, i32* %r, align 4
  %cmp = icmp ne i32 %2, 1
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32 @rl_ding() #1

; Function Attrs: noinline nounwind
define internal i32 @noninc_dosearch(i8* %string, i32 %dir) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %dir.addr = alloca i32, align 4
  %oldpos = alloca i32, align 4
  %pos = alloca i32, align 4
  %entry1 = alloca %struct._hist_entry*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* @noninc_history_pos, align 4
  %cmp5 = icmp slt i32 %3, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  %call = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false4
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* @noninc_history_pos, align 4
  %6 = load i32, i32* %dir.addr, align 4
  %add = add nsw i32 %5, %6
  %7 = load i32, i32* %dir.addr, align 4
  %call7 = call i32 @noninc_search_from_pos(i8* %4, i32 %add, i32 %7)
  store i32 %call7, i32* %pos, align 4
  %8 = load i32, i32* %pos, align 4
  %cmp8 = icmp eq i32 %8, -1
  br i1 %cmp8, label %if.then10, label %if.end14

if.then10:                                        ; preds = %if.end
  %call11 = call i32 @rl_maybe_unsave_line()
  %call12 = call i32 @rl_clear_message()
  store i32 0, i32* @rl_point, align 4
  %call13 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  %9 = load i32, i32* %pos, align 4
  store i32 %9, i32* @noninc_history_pos, align 4
  %call15 = call i32 @where_history()
  store i32 %call15, i32* %oldpos, align 4
  %10 = load i32, i32* @noninc_history_pos, align 4
  %call16 = call i32 @history_set_pos(i32 %10)
  %call17 = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call17, %struct._hist_entry** %entry1, align 4
  %11 = load i32, i32* @rl_editing_mode, align 4
  %cmp18 = icmp ne i32 %11, 0
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end14
  %12 = load i32, i32* %oldpos, align 4
  %call21 = call i32 @history_set_pos(i32 %12)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end14
  %13 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  call void @make_history_line_current(%struct._hist_entry* %13)
  store i32 0, i32* @rl_point, align 4
  %14 = load i32, i32* @rl_end, align 4
  store i32 %14, i32* @rl_mark, align 4
  %call23 = call i32 @rl_clear_message()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then10, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define i32 @rl_noninc_reverse_search_again(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i8*, i8** @noninc_search_string, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** @noninc_search_string, align 4
  %call1 = call i32 @noninc_dosearch(i8* %1, i32 -1)
  store i32 %call1, i32* %r, align 4
  %2 = load i32, i32* %r, align 4
  %cmp = icmp ne i32 %2, 1
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @_rl_nsearch_callback(%struct.__rl_search_context* %cxt) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %call = call i32 @_rl_search_getchar(%struct.__rl_search_context* %0)
  store i32 %call, i32* %c, align 4
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %2 = load i32, i32* %c, align 4
  %call1 = call i32 @_rl_nsearch_dispatch(%struct.__rl_search_context* %1, i32 %2)
  store i32 %call1, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %cmp = icmp ne i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %call2 = call i32 @_rl_nsearch_dosearch(%struct.__rl_search_context* %4)
  store i32 %call2, i32* %r, align 4
  %5 = load i32, i32* %r, align 4
  %cmp3 = icmp sge i32 %5, 0
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %6 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %7 = load i32, i32* %r, align 4
  %call4 = call i32 @_rl_nsearch_cleanup(%struct.__rl_search_context* %6, i32 %7)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %8 = load i32, i32* %r, align 4
  %cmp5 = icmp ne i32 %8, 1
  %conv = zext i1 %cmp5 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call4, %cond.true ], [ %conv, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i32 @_rl_search_getchar(%struct.__rl_search_context*) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_nsearch_dispatch(%struct.__rl_search_context* %cxt, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %c.addr = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 23, label %sw.bb
    i32 21, label %sw.bb1
    i32 13, label %sw.bb3
    i32 10, label %sw.bb3
    i32 8, label %sw.bb4
    i32 127, label %sw.bb4
    i32 3, label %sw.bb6
    i32 7, label %sw.bb6
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %call = call i32 @rl_unix_word_rubout(i32 1, i32 %1)
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %call2 = call i32 @rl_unix_line_discard(i32 1, i32 %2)
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry, %entry
  store i32 0, i32* %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %entry, %entry
  %3 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb4
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  call void @_rl_nsearch_abort(%struct.__rl_search_context* %4)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb4
  %5 = load i32, i32* %c.addr, align 4
  %call5 = call i32 @_rl_rubout_char(i32 1, i32 %5)
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry, %entry
  %call7 = call i32 @rl_ding()
  %6 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  call void @_rl_nsearch_abort(%struct.__rl_search_context* %6)
  store i32 -1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  %call8 = call i32 @__ctype_get_mb_cur_max()
  %cmp9 = icmp ugt i32 %call8, 1
  br i1 %cmp9, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %sw.default
  %7 = load i32, i32* @rl_byte_oriented, align 4
  %cmp10 = icmp eq i32 %7, 0
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %8, i32 0, i32 21
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call12 = call i32 @rl_insert_text(i8* %arraydecay)
  br label %if.end14

if.else:                                          ; preds = %land.lhs.true, %sw.default
  %9 = load i32, i32* %c.addr, align 4
  %call13 = call i32 @_rl_insert_char(i32 1, i32 %9)
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then11
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end14, %if.end, %sw.bb1, %sw.bb
  %10 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %10()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb6, %if.then, %sw.bb3
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_nsearch_dosearch(%struct.__rl_search_context* %cxt) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_mark = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %0, i32 0, i32 10
  %1 = load i32, i32* %save_mark, align 4
  store i32 %1, i32* @rl_mark, align 4
  %2 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** @noninc_search_string, align 4
  %cmp1 = icmp eq i8* %3, null
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %call = call i32 @rl_ding()
  call void @rl_restore_prompt()
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, -257
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end8

if.else:                                          ; preds = %entry
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %5, i32 0, i32 11
  %6 = load i32, i32* %save_line, align 4
  store i32 %6, i32* @noninc_history_pos, align 4
  %7 = load i8*, i8** @noninc_search_string, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.else
  %8 = load i8*, i8** @noninc_search_string, align 4
  call void @free(i8* %8)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.else
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %call5 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call5
  %call6 = call i8* @xmalloc(i32 %add)
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %10)
  store i8* %call7, i8** @noninc_search_string, align 4
  call void @rl_free_undo_list()
  br label %if.end8

if.end8:                                          ; preds = %if.end4, %if.end
  call void @rl_restore_prompt()
  %11 = load i8*, i8** @noninc_search_string, align 4
  %12 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %12, i32 0, i32 18
  %13 = load i32, i32* %direction, align 4
  %call9 = call i32 @noninc_dosearch(i8* %11, i32 %13)
  store i32 %call9, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then2
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define i32 @rl_history_search_forward(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_history_search_forward
  br i1 %cmp1, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp2 = icmp ne i32 (i32, i32)* %2, @rl_history_search_backward
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  call void @rl_history_search_reinit(i32 1)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %3 = load i32, i32* @rl_history_search_len, align 4
  %cmp5 = icmp eq i32 %3, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_get_next_history(i32 %4, i32 %5)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %6 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp sge i32 %6, 0
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end7
  %7 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end7
  %8 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %sub, %cond.false ]
  %9 = load i32, i32* %count.addr, align 4
  %cmp9 = icmp sgt i32 %9, 0
  %cond10 = select i1 %cmp9, i32 1, i32 -1
  %call11 = call i32 @rl_history_search_internal(i32 %cond, i32 %cond10)
  store i32 %call11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define i32 @rl_history_search_backward(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_history_search_forward
  br i1 %cmp1, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp2 = icmp ne i32 (i32, i32)* %2, @rl_history_search_backward
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  call void @rl_history_search_reinit(i32 1)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %3 = load i32, i32* @rl_history_search_len, align 4
  %cmp5 = icmp eq i32 %3, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_get_previous_history(i32 %4, i32 %5)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %6 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp sge i32 %6, 0
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end7
  %7 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end7
  %8 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %sub, %cond.false ]
  %9 = load i32, i32* %count.addr, align 4
  %cmp9 = icmp sgt i32 %9, 0
  %cond10 = select i1 %cmp9, i32 -1, i32 1
  %call11 = call i32 @rl_history_search_internal(i32 %cond, i32 %cond10)
  store i32 %call11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal void @rl_history_search_reinit(i32 %flags) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %sind = alloca i32, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i32 @where_history()
  store i32 %call, i32* @rl_history_search_pos, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* @rl_history_search_len, align 4
  %1 = load i32, i32* %flags.addr, align 4
  store i32 %1, i32* @rl_history_search_flags, align 4
  store i8* null, i8** @prev_line_found, align 4
  %2 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @rl_history_search_len, align 4
  %4 = load i32, i32* @history_string_size, align 4
  %sub = sub nsw i32 %4, 2
  %cmp = icmp sge i32 %3, %sub
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %5 = load i32, i32* @rl_history_search_len, align 4
  %add = add nsw i32 %5, 2
  store i32 %add, i32* @history_string_size, align 4
  %6 = load i8*, i8** @history_search_string, align 4
  %7 = load i32, i32* @history_string_size, align 4
  %call2 = call i8* @xrealloc(i8* %6, i32 %7)
  store i8* %call2, i8** @history_search_string, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store i32 0, i32* %sind, align 4
  %8 = load i32, i32* %flags.addr, align 4
  %and = and i32 %8, 1
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %9 = load i8*, i8** @history_search_string, align 4
  %10 = load i32, i32* %sind, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %sind, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %10
  store i8 94, i8* %arrayidx, align 1
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %11 = load i8*, i8** @history_search_string, align 4
  %12 = load i32, i32* %sind, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %call6 = call i8* @strncpy(i8* %add.ptr, i8* %13, i32 %14)
  %15 = load i8*, i8** @history_search_string, align 4
  %16 = load i32, i32* @rl_point, align 4
  %17 = load i32, i32* %sind, align 4
  %add7 = add nsw i32 %16, %17
  %arrayidx8 = getelementptr inbounds i8, i8* %15, i32 %add7
  store i8 0, i8* %arrayidx8, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.end5, %entry
  %call10 = call i32 @_rl_free_saved_history_line()
  ret void
}

declare i32 @rl_get_next_history(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @rl_history_search_internal(i32 %count, i32 %dir) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %dir.addr = alloca i32, align 4
  %temp = alloca %struct._hist_entry*, align 4
  %ret = alloca i32, align 4
  %oldpos = alloca i32, align 4
  %t = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  %call = call i32 @rl_maybe_save_line()
  store %struct._hist_entry* null, %struct._hist_entry** %temp, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end20, %if.then19, %entry
  %0 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %while.body
  %1 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i8*, i8** @history_search_string, align 4
  %4 = load i32, i32* @rl_history_search_pos, align 4
  %5 = load i32, i32* %dir.addr, align 4
  %add = add nsw i32 %4, %5
  %6 = load i32, i32* %dir.addr, align 4
  %call2 = call i32 @noninc_search_from_pos(i8* %3, i32 %add, i32 %6)
  store i32 %call2, i32* %ret, align 4
  %7 = load i32, i32* %ret, align 4
  %cmp = icmp eq i32 %7, -1
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.end
  br label %while.end

if.end4:                                          ; preds = %do.end
  %8 = load i32, i32* %ret, align 4
  store i32 %8, i32* @rl_history_search_pos, align 4
  %call5 = call i32 @where_history()
  store i32 %call5, i32* %oldpos, align 4
  %9 = load i32, i32* @rl_history_search_pos, align 4
  %call6 = call i32 @history_set_pos(i32 %9)
  %call7 = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call7, %struct._hist_entry** %temp, align 4
  %10 = load i32, i32* %oldpos, align 4
  %call8 = call i32 @history_set_pos(i32 %10)
  %11 = load i8*, i8** @prev_line_found, align 4
  %tobool9 = icmp ne i8* %11, null
  br i1 %tobool9, label %land.lhs.true, label %if.end20

land.lhs.true:                                    ; preds = %if.end4
  %12 = load i8*, i8** @prev_line_found, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %13 to i32
  %14 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %14, i32 0, i32 0
  %15 = load i8*, i8** %line, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %16 to i32
  %cmp12 = icmp eq i32 %conv, %conv11
  br i1 %cmp12, label %land.lhs.true14, label %if.end20

land.lhs.true14:                                  ; preds = %land.lhs.true
  %17 = load i8*, i8** @prev_line_found, align 4
  %18 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line15 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %18, i32 0, i32 0
  %19 = load i8*, i8** %line15, align 4
  %call16 = call i32 @strcmp(i8* %17, i8* %19)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true14
  br label %while.cond

if.end20:                                         ; preds = %land.lhs.true14, %land.lhs.true, %if.end4
  %20 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line21 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %20, i32 0, i32 0
  %21 = load i8*, i8** %line21, align 4
  store i8* %21, i8** @prev_line_found, align 4
  %22 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then3, %while.cond
  %23 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %cmp22 = icmp eq %struct._hist_entry* %23, null
  br i1 %cmp22, label %if.then24, label %if.end27

if.then24:                                        ; preds = %while.end
  %call25 = call i32 @rl_maybe_unsave_line()
  %call26 = call i32 @rl_ding()
  %24 = load i32, i32* @rl_history_search_len, align 4
  store i32 %24, i32* @rl_point, align 4
  %25 = load i32, i32* @rl_end, align 4
  store i32 %25, i32* @rl_mark, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %while.end
  %26 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  call void @make_history_line_current(%struct._hist_entry* %26)
  %27 = load i32, i32* @rl_history_search_flags, align 4
  %and = and i32 %27, 1
  %tobool28 = icmp ne i32 %and, 0
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %if.end27
  %28 = load i32, i32* @rl_history_search_len, align 4
  store i32 %28, i32* @rl_point, align 4
  br label %if.end33

if.else:                                          ; preds = %if.end27
  %29 = load i8*, i8** @rl_line_buffer, align 4
  %30 = load i8*, i8** @history_search_string, align 4
  %call30 = call i8* @strstr(i8* %29, i8* %30)
  store i8* %call30, i8** %t, align 4
  %31 = load i8*, i8** %t, align 4
  %tobool31 = icmp ne i8* %31, null
  br i1 %tobool31, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %32 = load i8*, i8** %t, align 4
  %33 = load i8*, i8** @rl_line_buffer, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %32 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %33 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %34 = load i32, i32* @rl_history_search_len, align 4
  %add32 = add nsw i32 %sub.ptr.sub, %34
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %35 = load i32, i32* @rl_end, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add32, %cond.true ], [ %35, %cond.false ]
  store i32 %cond, i32* @rl_point, align 4
  br label %if.end33

if.end33:                                         ; preds = %cond.end, %if.then29
  %36 = load i32, i32* @rl_end, align 4
  store i32 %36, i32* @rl_mark, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then24
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

declare i32 @rl_get_previous_history(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_history_substr_search_forward(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_history_substr_search_forward
  br i1 %cmp1, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp2 = icmp ne i32 (i32, i32)* %2, @rl_history_substr_search_backward
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  call void @rl_history_search_reinit(i32 0)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %3 = load i32, i32* @rl_history_search_len, align 4
  %cmp5 = icmp eq i32 %3, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_get_next_history(i32 %4, i32 %5)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %6 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp sge i32 %6, 0
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end7
  %7 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end7
  %8 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %sub, %cond.false ]
  %9 = load i32, i32* %count.addr, align 4
  %cmp9 = icmp sgt i32 %9, 0
  %cond10 = select i1 %cmp9, i32 1, i32 -1
  %call11 = call i32 @rl_history_search_internal(i32 %cond, i32 %cond10)
  store i32 %call11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define i32 @rl_history_substr_search_backward(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_history_substr_search_forward
  br i1 %cmp1, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp2 = icmp ne i32 (i32, i32)* %2, @rl_history_substr_search_backward
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  call void @rl_history_search_reinit(i32 0)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %3 = load i32, i32* @rl_history_search_len, align 4
  %cmp5 = icmp eq i32 %3, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_get_previous_history(i32 %4, i32 %5)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  %6 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp sge i32 %6, 0
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end7
  %7 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end7
  %8 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %7, %cond.true ], [ %sub, %cond.false ]
  %9 = load i32, i32* %count.addr, align 4
  %cmp9 = icmp sgt i32 %9, 0
  %cond10 = select i1 %cmp9, i32 -1, i32 1
  %call11 = call i32 @rl_history_search_internal(i32 %cond, i32 %cond10)
  store i32 %call11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind
define internal %struct.__rl_search_context* @_rl_nsearch_init(i32 %dir, i32 %pchar) #0 {
entry:
  %dir.addr = alloca i32, align 4
  %pchar.addr = alloca i32, align 4
  %cxt = alloca %struct.__rl_search_context*, align 4
  %p = alloca i8*, align 4
  store i32 %dir, i32* %dir.addr, align 4
  store i32 %pchar, i32* %pchar.addr, align 4
  %call = call %struct.__rl_search_context* @_rl_scxt_alloc(i32 2, i32 0)
  store %struct.__rl_search_context* %call, %struct.__rl_search_context** %cxt, align 4
  %0 = load i32, i32* %dir.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sflags = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %1, i32 0, i32 1
  %2 = load i32, i32* %sflags, align 4
  %or = or i32 %2, 1
  store i32 %or, i32* %sflags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %dir.addr, align 4
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %direction = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %4, i32 0, i32 18
  store i32 %3, i32* %direction, align 4
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %5, i32 0, i32 11
  %6 = load i32, i32* %save_line, align 4
  %7 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %history_pos = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %7, i32 0, i32 17
  store i32 %6, i32* %history_pos, align 4
  %call1 = call i32 @rl_maybe_save_line()
  store %struct.undo_list* null, %struct.undo_list** @rl_undo_list, align 4
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 0
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* @rl_point, align 4
  store i32 0, i32* @rl_end, align 4
  %9 = load i32, i32* %pchar.addr, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %10 = load i32, i32* %pchar.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %10, %cond.true ], [ 58, %cond.false ]
  %call2 = call i8* @_rl_make_prompt_for_search(i32 %cond)
  store i8* %call2, i8** %p, align 4
  %11 = load i8*, i8** %p, align 4
  %call3 = call i32 (i8*, ...) @rl_message(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %11)
  %12 = load i8*, i8** %p, align 4
  call void @xfree(i8* %12)
  %13 = load i32, i32* @rl_readline_state, align 4
  %or4 = or i32 %13, 256
  store i32 %or4, i32* @rl_readline_state, align 4
  %14 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  store %struct.__rl_search_context* %14, %struct.__rl_search_context** @_rl_nscxt, align 4
  %15 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  ret %struct.__rl_search_context* %15
}

declare %struct.__rl_search_context* @_rl_scxt_alloc(i32, i32) #1

declare i32 @rl_maybe_save_line() #1

declare i8* @_rl_make_prompt_for_search(i32) #1

declare i32 @rl_message(i8*, ...) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @noninc_search_from_pos(i8* %string, i32 %pos, i32 %dir) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %pos.addr = alloca i32, align 4
  %dir.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  %old = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %pos, i32* %pos.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  %0 = load i32, i32* %pos.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @where_history()
  store i32 %call, i32* %old, align 4
  %1 = load i32, i32* %pos.addr, align 4
  %call1 = call i32 @history_set_pos(i32 %1)
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %2 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %2, 512
  store i32 %or, i32* @rl_readline_state, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp5 = icmp eq i32 %conv, 94
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end4
  %5 = load i8*, i8** %string.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 1
  %6 = load i32, i32* %dir.addr, align 4
  %call8 = call i32 @history_search_prefix(i8* %add.ptr, i32 %6)
  store i32 %call8, i32* %ret, align 4
  br label %if.end10

if.else:                                          ; preds = %if.end4
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %dir.addr, align 4
  %call9 = call i32 @history_search(i8* %7, i32 %8)
  store i32 %call9, i32* %ret, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then7
  %9 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %9, -513
  store i32 %and, i32* @rl_readline_state, align 4
  %10 = load i32, i32* %ret, align 4
  %cmp11 = icmp ne i32 %10, -1
  br i1 %cmp11, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %call14 = call i32 @where_history()
  store i32 %call14, i32* %ret, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %11 = load i32, i32* %old, align 4
  %call16 = call i32 @history_set_pos(i32 %11)
  %12 = load i32, i32* %ret, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @rl_maybe_unsave_line() #1

declare i32 @rl_clear_message() #1

declare i32 @where_history() #1

declare i32 @history_set_pos(i32) #1

declare %struct._hist_entry* @current_history() #1

; Function Attrs: noinline nounwind
define internal void @make_history_line_current(%struct._hist_entry* %entry1) #0 {
entry:
  %entry.addr = alloca %struct._hist_entry*, align 4
  store %struct._hist_entry* %entry1, %struct._hist_entry** %entry.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %0, i32 0, i32 0
  %1 = load i8*, i8** %line, align 4
  %2 = load i32, i32* @rl_end, align 4
  %call = call i32 @_rl_replace_text(i8* %1, i32 0, i32 %2)
  call void @_rl_fix_point(i32 1)
  %3 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @rl_free_undo_list()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %tobool = icmp ne %struct._hist_entry* %4, null
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %5 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %5)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  store %struct._hist_entry* null, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  ret void
}

declare i32 @history_search_prefix(i8*, i32) #1

declare i32 @history_search(i8*, i32) #1

declare i32 @_rl_replace_text(i8*, i32, i32) #1

declare void @_rl_fix_point(i32) #1

declare void @rl_free_undo_list() #1

declare void @_rl_free_history_entry(%struct._hist_entry*) #1

declare i32 @rl_unix_word_rubout(i32, i32) #1

declare i32 @rl_unix_line_discard(i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @_rl_nsearch_abort(%struct.__rl_search_context* %cxt) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %call = call i32 @rl_maybe_unsave_line()
  %call1 = call i32 @rl_clear_message()
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_point = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %0, i32 0, i32 9
  %1 = load i32, i32* %save_point, align 4
  store i32 %1, i32* @rl_point, align 4
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_mark = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %2, i32 0, i32 10
  %3 = load i32, i32* %save_mark, align 4
  store i32 %3, i32* @rl_mark, align 4
  call void @rl_restore_prompt()
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, -257
  store i32 %and, i32* @rl_readline_state, align 4
  ret void
}

declare i32 @_rl_rubout_char(i32, i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @rl_insert_text(i8*) #1

declare i32 @_rl_insert_char(i32, i32) #1

declare void @rl_restore_prompt() #1

declare void @free(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

declare i8* @xrealloc(i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i32 @_rl_free_saved_history_line() #1

declare void @_rl_signal_handler(i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strstr(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
