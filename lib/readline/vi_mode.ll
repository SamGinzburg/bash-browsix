; ModuleID = 'vi_mode.c'
source_filename = "vi_mode.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__rl_vimotion_context = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct.__rl_callback_generic_arg = type { i32, i32, i32 }
%struct.__mbstate_t = type { i32, i32 }

@_rl_vi_last_command = global i32 105, align 4
@_rl_vimvcxt = global %struct.__rl_vimotion_context* null, align 4
@vi_mark_chars = internal global [26 x i32] zeroinitializer, align 4
@rl_readline_state = external global i32, align 4
@_rl_vi_last_repeat = internal global i32 1, align 4
@_rl_vi_last_arg_sign = internal global i32 1, align 4
@_rl_vi_last_motion = internal global i32 0, align 4
@.str = private unnamed_addr constant [23 x i8] c"_*\5CAaIiCcDdPpYyRrSsXx~\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c" hl^$0ftFT;,%wbeWBE|`\00", align 1
@rl_explicit_arg = external global i32, align 4
@rl_numeric_arg = external global i32, align 4
@rl_arg_sign = external global i32, align 4
@_rl_vi_redoing = common global i32 0, align 4
@vi_insert_buffer = internal global i8* null, align 4
@rl_point = external global i32, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@history_base = external global i32, align 4
@rl_end = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4
@_rl_vi_last_key_before_insert = internal global i32 0, align 4
@_rl_show_mode_in_prompt = external global i32, align 4
@_rl_vi_doing_insert = internal global i32 0, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@vi_continued_command = internal global i32 0, align 4
@_rl_undo_group_level = external global i32, align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@rl_byte_oriented = external global i32, align 4
@rl_mark = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@rl_vi_char_search.target = internal global i8* null, align 4
@rl_vi_char_search.tlen = internal global i32 0, align 4
@_rl_cs_orig_dir = internal global i32 0, align 4
@_rl_vi_last_search_mblen = internal global i32 0, align 4
@_rl_cs_dir = internal global i32 0, align 4
@_rl_callback_data = external global %struct.__rl_callback_generic_arg*, align 4
@_rl_callback_func = external global i32 (%struct.__rl_callback_generic_arg*)*, align 4
@_rl_vi_last_search_mbchar = internal global [16 x i8] zeroinitializer, align 1
@_rl_vi_last_replacement = internal global i32 0, align 4
@vi_replace_count = internal global i32 0, align 4
@vi_replace_map = internal global %struct._keymap_entry* null, align 4
@vi_insert_buffer_size = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [39 x i8] c"vidomove_dispatch: unknown operator %d\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c" l|h^0bBFT`\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c" l|hwW^0bBFT`\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c" l|h^0%bBFT`\00", align 1
@_rl_want_redisplay = external global i32, align 4

; Function Attrs: noinline nounwind
define void @_rl_vi_initialize_line() #0 {
entry:
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 26, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [26 x i32], [26 x i32]* @vi_mark_chars, i32 0, i32 %2
  store i32 -1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, -4194305
  store i32 %and, i32* @rl_readline_state, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_vi_reset_last() #0 {
entry:
  store i32 105, i32* @_rl_vi_last_command, align 4
  store i32 1, i32* @_rl_vi_last_repeat, align 4
  store i32 1, i32* @_rl_vi_last_arg_sign, align 4
  store i32 0, i32* @_rl_vi_last_motion, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_vi_set_last(i32 %key, i32 %repeat, i32 %sign) #0 {
entry:
  %key.addr = alloca i32, align 4
  %repeat.addr = alloca i32, align 4
  %sign.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 %repeat, i32* %repeat.addr, align 4
  store i32 %sign, i32* %sign.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  store i32 %0, i32* @_rl_vi_last_command, align 4
  %1 = load i32, i32* %repeat.addr, align 4
  store i32 %1, i32* @_rl_vi_last_repeat, align 4
  %2 = load i32, i32* %sign.addr, align 4
  store i32 %2, i32* @_rl_vi_last_arg_sign, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @rl_vi_start_inserting(i32 %key, i32 %repeat, i32 %sign) #0 {
entry:
  %key.addr = alloca i32, align 4
  %repeat.addr = alloca i32, align 4
  %sign.addr = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 %repeat, i32* %repeat.addr, align 4
  store i32 %sign, i32* %sign.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %1 = load i32, i32* %repeat.addr, align 4
  %2 = load i32, i32* %sign.addr, align 4
  call void @_rl_vi_set_last(i32 %0, i32 %1, i32 %2)
  %3 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_insertion_mode(i32 1, i32 %3)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_insertion_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  %0 = load i32, i32* %key.addr, align 4
  store i32 %0, i32* @_rl_vi_last_key_before_insert, align 4
  %1 = load i32, i32* @_rl_show_mode_in_prompt, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_rl_reset_prompt()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @_rl_vi_textmod_command(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i32 %1)
  %cmp = icmp ne i8* %call, null
  %conv = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

declare i8* @strchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_vi_motion_command(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %1)
  %cmp = icmp ne i8* %call, null
  %conv = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_redo(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_vi_last_repeat, align 4
  store i32 %1, i32* @rl_numeric_arg, align 4
  %2 = load i32, i32* @_rl_vi_last_arg_sign, align 4
  store i32 %2, i32* @rl_arg_sign, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %r, align 4
  store i32 1, i32* @_rl_vi_redoing, align 4
  %3 = load i32, i32* @_rl_vi_last_command, align 4
  %cmp1 = icmp eq i32 %3, 105
  br i1 %cmp1, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %4 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i8*, i8** @vi_insert_buffer, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %land.lhs.true2
  %7 = load i32, i32* %count.addr, align 4
  call void @_rl_vi_stuff_insert(i32 %7)
  %8 = load i32, i32* @rl_point, align 4
  %cmp5 = icmp sgt i32 %8, 0
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.then4
  call void @_rl_vi_backup()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.then4
  br label %if.end67

if.else:                                          ; preds = %land.lhs.true2, %land.lhs.true, %if.end
  %9 = load i32, i32* @_rl_vi_last_command, align 4
  %cmp9 = icmp eq i32 %9, 82
  br i1 %cmp9, label %land.lhs.true11, label %if.else21

land.lhs.true11:                                  ; preds = %if.else
  %10 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool12 = icmp ne i8* %10, null
  br i1 %tobool12, label %land.lhs.true13, label %if.else21

land.lhs.true13:                                  ; preds = %land.lhs.true11
  %11 = load i8*, i8** @vi_insert_buffer, align 4
  %12 = load i8, i8* %11, align 1
  %conv14 = sext i8 %12 to i32
  %tobool15 = icmp ne i32 %conv14, 0
  br i1 %tobool15, label %if.then16, label %if.else21

if.then16:                                        ; preds = %land.lhs.true13
  %13 = load i32, i32* %count.addr, align 4
  call void @_rl_vi_replace_insert(i32 %13)
  %14 = load i32, i32* @rl_point, align 4
  %cmp17 = icmp sgt i32 %14, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then16
  call void @_rl_vi_backup()
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %if.then16
  br label %if.end66

if.else21:                                        ; preds = %land.lhs.true13, %land.lhs.true11, %if.else
  %15 = load i32, i32* @_rl_vi_last_command, align 4
  %cmp22 = icmp eq i32 %15, 73
  br i1 %cmp22, label %land.lhs.true24, label %if.else34

land.lhs.true24:                                  ; preds = %if.else21
  %16 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool25 = icmp ne i8* %16, null
  br i1 %tobool25, label %land.lhs.true26, label %if.else34

land.lhs.true26:                                  ; preds = %land.lhs.true24
  %17 = load i8*, i8** @vi_insert_buffer, align 4
  %18 = load i8, i8* %17, align 1
  %conv27 = sext i8 %18 to i32
  %tobool28 = icmp ne i32 %conv27, 0
  br i1 %tobool28, label %if.then29, label %if.else34

if.then29:                                        ; preds = %land.lhs.true26
  %call = call i32 @rl_beg_of_line(i32 1, i32 73)
  %19 = load i32, i32* %count.addr, align 4
  call void @_rl_vi_stuff_insert(i32 %19)
  %20 = load i32, i32* @rl_point, align 4
  %cmp30 = icmp sgt i32 %20, 0
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then29
  call void @_rl_vi_backup()
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.then29
  br label %if.end65

if.else34:                                        ; preds = %land.lhs.true26, %land.lhs.true24, %if.else21
  %21 = load i32, i32* @_rl_vi_last_command, align 4
  %cmp35 = icmp eq i32 %21, 97
  br i1 %cmp35, label %land.lhs.true37, label %if.else47

land.lhs.true37:                                  ; preds = %if.else34
  %22 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool38 = icmp ne i8* %22, null
  br i1 %tobool38, label %land.lhs.true39, label %if.else47

land.lhs.true39:                                  ; preds = %land.lhs.true37
  %23 = load i8*, i8** @vi_insert_buffer, align 4
  %24 = load i8, i8* %23, align 1
  %conv40 = sext i8 %24 to i32
  %tobool41 = icmp ne i32 %conv40, 0
  br i1 %tobool41, label %if.then42, label %if.else47

if.then42:                                        ; preds = %land.lhs.true39
  call void @_rl_vi_append_forward(i32 97)
  %25 = load i32, i32* %count.addr, align 4
  call void @_rl_vi_stuff_insert(i32 %25)
  %26 = load i32, i32* @rl_point, align 4
  %cmp43 = icmp sgt i32 %26, 0
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.then42
  call void @_rl_vi_backup()
  br label %if.end46

if.end46:                                         ; preds = %if.then45, %if.then42
  br label %if.end64

if.else47:                                        ; preds = %land.lhs.true39, %land.lhs.true37, %if.else34
  %27 = load i32, i32* @_rl_vi_last_command, align 4
  %cmp48 = icmp eq i32 %27, 65
  br i1 %cmp48, label %land.lhs.true50, label %if.else61

land.lhs.true50:                                  ; preds = %if.else47
  %28 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool51 = icmp ne i8* %28, null
  br i1 %tobool51, label %land.lhs.true52, label %if.else61

land.lhs.true52:                                  ; preds = %land.lhs.true50
  %29 = load i8*, i8** @vi_insert_buffer, align 4
  %30 = load i8, i8* %29, align 1
  %conv53 = sext i8 %30 to i32
  %tobool54 = icmp ne i32 %conv53, 0
  br i1 %tobool54, label %if.then55, label %if.else61

if.then55:                                        ; preds = %land.lhs.true52
  %call56 = call i32 @rl_end_of_line(i32 1, i32 65)
  %31 = load i32, i32* %count.addr, align 4
  call void @_rl_vi_stuff_insert(i32 %31)
  %32 = load i32, i32* @rl_point, align 4
  %cmp57 = icmp sgt i32 %32, 0
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.then55
  call void @_rl_vi_backup()
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.then55
  br label %if.end63

if.else61:                                        ; preds = %land.lhs.true52, %land.lhs.true50, %if.else47
  %33 = load i32, i32* @_rl_vi_last_command, align 4
  %34 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call62 = call i32 @_rl_dispatch(i32 %33, %struct._keymap_entry* %34)
  store i32 %call62, i32* %r, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else61, %if.end60
  br label %if.end64

if.end64:                                         ; preds = %if.end63, %if.end46
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.end33
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.end20
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %if.end8
  store i32 0, i32* @_rl_vi_redoing, align 4
  %35 = load i32, i32* %r, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind
define internal void @_rl_vi_stuff_insert(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %call = call i32 @rl_begin_undo_group()
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i8*, i8** @vi_insert_buffer, align 4
  %call1 = call i32 @rl_insert_text(i8* %1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call2 = call i32 @rl_end_undo_group()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_vi_backup() #0 {
entry:
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %0 = load i32, i32* @rl_byte_oriented, align 4
  %cmp1 = icmp eq i32 %0, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* @rl_point, align 4
  %call2 = call i32 @_rl_find_prev_mbchar(i8* %1, i32 %2, i32 1)
  store i32 %call2, i32* @rl_point, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @rl_point, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_vi_replace_insert(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %nchars = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i8*, i8** @vi_insert_buffer, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %nchars, align 4
  %call1 = call i32 @rl_begin_undo_group()
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** @vi_insert_buffer, align 4
  %3 = load i32, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* %nchars, align 4
  %add = add nsw i32 %4, %5
  %sub = sub nsw i32 %add, 1
  %call2 = call i32 @_rl_replace_text(i8* %2, i32 %3, i32 %sub)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call3 = call i32 @rl_end_undo_group()
  ret void
}

declare i32 @rl_beg_of_line(i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @_rl_vi_append_forward(i32 %key) #0 {
entry:
  %key.addr = alloca i32, align 4
  %point = alloca i32, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp1 = icmp eq i32 %call, 1
  br i1 %cmp1, label %if.then2, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %2 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %lor.lhs.false, %if.then
  %3 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end6

if.else:                                          ; preds = %lor.lhs.false
  %4 = load i32, i32* @rl_point, align 4
  store i32 %4, i32* %point, align 4
  %call3 = call i32 @_rl_forward_char_internal(i32 1)
  store i32 %call3, i32* @rl_point, align 4
  %5 = load i32, i32* %point, align 4
  %6 = load i32, i32* @rl_point, align 4
  %cmp4 = icmp eq i32 %5, %6
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %7 = load i32, i32* @rl_end, align 4
  store i32 %7, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then2
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %entry
  ret void
}

declare i32 @rl_end_of_line(i32, i32) #1

declare i32 @_rl_dispatch(i32, %struct._keymap_entry*) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_undo(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_undo_command(i32 %0, i32 %1)
  ret i32 %call
}

declare i32 @rl_undo_command(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_yank_arg(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 %1, 1
  %call = call i32 @rl_yank_nth_arg(i32 %sub, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %call1 = call i32 @rl_yank_nth_arg(i32 36, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

declare i32 @rl_yank_nth_arg(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_fetch_history(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %wanted = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else4

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @history_base, align 4
  %call = call i32 @where_history()
  %add = add nsw i32 %1, %call
  %2 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 %add, %2
  store i32 %sub, i32* %wanted, align 4
  %3 = load i32, i32* %wanted, align 4
  %cmp = icmp sle i32 %3, 0
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  %call2 = call i32 @rl_beginning_of_history(i32 0, i32 0)
  br label %if.end

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %wanted, align 4
  %5 = load i32, i32* %c.addr, align 4
  %call3 = call i32 @rl_get_previous_history(i32 %4, i32 %5)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end6

if.else4:                                         ; preds = %entry
  %6 = load i32, i32* %count.addr, align 4
  %call5 = call i32 @rl_beginning_of_history(i32 %6, i32 0)
  br label %if.end6

if.end6:                                          ; preds = %if.else4, %if.end
  ret i32 0
}

declare i32 @where_history() #1

declare i32 @rl_beginning_of_history(i32, i32) #1

declare i32 @rl_get_previous_history(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_search_again(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 110, label %sw.bb
    i32 78, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_noninc_reverse_search_again(i32 %1, i32 %2)
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_noninc_forward_search_again(i32 %3, i32 %4)
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb1, %sw.bb
  ret i32 0
}

declare i32 @rl_noninc_reverse_search_again(i32, i32) #1

declare i32 @rl_noninc_forward_search_again(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_search(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  switch i32 %0, label %sw.default [
    i32 63, label %sw.bb
    i32 47, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  %call = call i32 @_rl_free_saved_history_line()
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_noninc_forward_search(i32 %1, i32 %2)
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %call3 = call i32 @_rl_free_saved_history_line()
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %key.addr, align 4
  %call4 = call i32 @rl_noninc_reverse_search(i32 %3, i32 %4)
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call5 = call i32 @rl_ding()
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb2, %sw.bb
  ret i32 0
}

declare i32 @_rl_free_saved_history_line() #1

declare i32 @rl_noninc_forward_search(i32, i32) #1

declare i32 @rl_noninc_reverse_search(i32, i32) #1

declare i32 @rl_ding() #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_complete(i32 %ignore, i32 %key) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
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
  %15 = load i32, i32* %key.addr, align 4
  %cmp19 = icmp eq i32 %15, 42
  br i1 %cmp19, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end18
  %call22 = call i32 @rl_complete_internal(i32 42)
  br label %if.end36

if.else:                                          ; preds = %if.end18
  %16 = load i32, i32* %key.addr, align 4
  %cmp23 = icmp eq i32 %16, 61
  br i1 %cmp23, label %if.then25, label %if.else27

if.then25:                                        ; preds = %if.else
  %call26 = call i32 @rl_complete_internal(i32 63)
  br label %if.end35

if.else27:                                        ; preds = %if.else
  %17 = load i32, i32* %key.addr, align 4
  %cmp28 = icmp eq i32 %17, 92
  br i1 %cmp28, label %if.then30, label %if.else32

if.then30:                                        ; preds = %if.else27
  %call31 = call i32 @rl_complete_internal(i32 9)
  br label %if.end34

if.else32:                                        ; preds = %if.else27
  %18 = load i32, i32* %key.addr, align 4
  %call33 = call i32 @rl_complete(i32 0, i32 %18)
  br label %if.end34

if.end34:                                         ; preds = %if.else32, %if.then30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then25
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then21
  %19 = load i32, i32* %key.addr, align 4
  %cmp37 = icmp eq i32 %19, 42
  br i1 %cmp37, label %if.then42, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %if.end36
  %20 = load i32, i32* %key.addr, align 4
  %cmp40 = icmp eq i32 %20, 92
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %lor.lhs.false39, %if.end36
  %21 = load i32, i32* %key.addr, align 4
  %22 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %21, i32 1, i32 %22)
  br label %if.end43

if.end43:                                         ; preds = %if.then42, %lor.lhs.false39
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_end_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %1 to i8
  %conv1 = zext i8 %conv to i32
  %2 = load i32, i32* %key.addr, align 4
  %cmp2 = icmp eq i32 %conv1, %2
  br i1 %cmp2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %key.addr, align 4
  %conv4 = trunc i32 %3 to i8
  %conv5 = zext i8 %conv4 to i32
  %call6 = call i32 @isupper(i32 %conv5) #4
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %if.then7, label %if.else

if.then7:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %key.addr, align 4
  %call8 = call i32 @rl_vi_eWord(i32 %4, i32 %5)
  br label %if.end10

if.else:                                          ; preds = %land.lhs.true, %if.end
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %key.addr, align 4
  %call9 = call i32 @rl_vi_eword(i32 %6, i32 %7)
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then7
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @rl_complete_internal(i32) #1

declare i32 @rl_complete(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_tilde_expand(i32 %ignore, i32 %key) #0 {
entry:
  %ignore.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_tilde_expand(i32 0, i32 %0)
  %1 = load i32, i32* %key.addr, align 4
  %2 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %1, i32 1, i32 %2)
  ret i32 0
}

declare i32 @rl_tilde_expand(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_prev_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_next_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %4 to i8
  %conv5 = zext i8 %conv to i32
  %5 = load i32, i32* %key.addr, align 4
  %cmp6 = icmp eq i32 %conv5, %5
  br i1 %cmp6, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end4
  %6 = load i32, i32* %key.addr, align 4
  %conv8 = trunc i32 %6 to i8
  %conv9 = zext i8 %conv8 to i32
  %call10 = call i32 @isupper(i32 %conv9) #4
  %tobool = icmp ne i32 %call10, 0
  br i1 %tobool, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %count.addr, align 4
  %8 = load i32, i32* %key.addr, align 4
  %call12 = call i32 @rl_vi_bWord(i32 %7, i32 %8)
  br label %if.end14

if.else:                                          ; preds = %land.lhs.true, %if.end4
  %9 = load i32, i32* %count.addr, align 4
  %10 = load i32, i32* %key.addr, align 4
  %call13 = call i32 @rl_vi_bword(i32 %9, i32 %10)
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then11
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_next_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_prev_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_end, align 4
  %sub1 = sub nsw i32 %4, 1
  %cmp2 = icmp sge i32 %3, %sub1
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %5 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %5 to i8
  %conv6 = zext i8 %conv to i32
  %6 = load i32, i32* %key.addr, align 4
  %cmp7 = icmp eq i32 %conv6, %6
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end5
  %7 = load i32, i32* %key.addr, align 4
  %conv9 = trunc i32 %7 to i8
  %conv10 = zext i8 %conv9 to i32
  %call11 = call i32 @isupper(i32 %conv10) #4
  %tobool = icmp ne i32 %call11, 0
  br i1 %tobool, label %if.then12, label %if.else

if.then12:                                        ; preds = %land.lhs.true
  %8 = load i32, i32* %count.addr, align 4
  %9 = load i32, i32* %key.addr, align 4
  %call13 = call i32 @rl_vi_fWord(i32 %8, i32 %9)
  br label %if.end15

if.else:                                          ; preds = %land.lhs.true, %if.end5
  %10 = load i32, i32* %count.addr, align 4
  %11 = load i32, i32* %key.addr, align 4
  %call14 = call i32 @rl_vi_fword(i32 %10, i32 %11)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then12
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then3, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #2

; Function Attrs: noinline nounwind
define i32 @rl_vi_bWord(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end54, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %cmp = icmp sgt i32 %1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %2 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %2, label %while.body, label %while.end55

while.body:                                       ; preds = %land.end
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %lor.lhs.false
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %10, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i32 %sub
  %11 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %11 to i32
  %cmp9 = icmp eq i32 %conv8, 32
  br i1 %cmp9, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %land.lhs.true
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* @rl_point, align 4
  %sub12 = sub nsw i32 %13, 1
  %arrayidx13 = getelementptr inbounds i8, i8* %12, i32 %sub12
  %14 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %14 to i32
  %cmp15 = icmp eq i32 %conv14, 9
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false11, %land.lhs.true
  %15 = load i32, i32* @rl_point, align 4
  %dec17 = add nsw i32 %15, -1
  store i32 %dec17, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false11, %lor.lhs.false, %while.body
  br label %while.cond18

while.cond18:                                     ; preds = %while.body31, %if.end
  %16 = load i32, i32* @rl_point, align 4
  %cmp19 = icmp sgt i32 %16, 0
  br i1 %cmp19, label %land.rhs21, label %land.end30

land.rhs21:                                       ; preds = %while.cond18
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* @rl_point, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %19 to i32
  %cmp24 = icmp eq i32 %conv23, 32
  br i1 %cmp24, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs21
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* @rl_point, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %22 to i32
  %cmp28 = icmp eq i32 %conv27, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs21
  %23 = phi i1 [ true, %land.rhs21 ], [ %cmp28, %lor.rhs ]
  br label %land.end30

land.end30:                                       ; preds = %lor.end, %while.cond18
  %24 = phi i1 [ false, %while.cond18 ], [ %23, %lor.end ]
  br i1 %24, label %while.body31, label %while.end

while.body31:                                     ; preds = %land.end30
  %25 = load i32, i32* @rl_point, align 4
  %dec32 = add nsw i32 %25, -1
  store i32 %dec32, i32* @rl_point, align 4
  br label %while.cond18

while.end:                                        ; preds = %land.end30
  %26 = load i32, i32* @rl_point, align 4
  %cmp33 = icmp sgt i32 %26, 0
  br i1 %cmp33, label %if.then35, label %if.end54

if.then35:                                        ; preds = %while.end
  br label %while.cond36

while.cond36:                                     ; preds = %while.body52, %if.then35
  %27 = load i32, i32* @rl_point, align 4
  %dec37 = add nsw i32 %27, -1
  store i32 %dec37, i32* @rl_point, align 4
  %cmp38 = icmp sge i32 %dec37, 0
  br i1 %cmp38, label %land.rhs40, label %land.end51

land.rhs40:                                       ; preds = %while.cond36
  %28 = load i8*, i8** @rl_line_buffer, align 4
  %29 = load i32, i32* @rl_point, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %30 to i32
  %cmp43 = icmp eq i32 %conv42, 32
  br i1 %cmp43, label %lor.end50, label %lor.rhs45

lor.rhs45:                                        ; preds = %land.rhs40
  %31 = load i8*, i8** @rl_line_buffer, align 4
  %32 = load i32, i32* @rl_point, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %31, i32 %32
  %33 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %33 to i32
  %cmp48 = icmp eq i32 %conv47, 9
  br label %lor.end50

lor.end50:                                        ; preds = %lor.rhs45, %land.rhs40
  %34 = phi i1 [ true, %land.rhs40 ], [ %cmp48, %lor.rhs45 ]
  %lnot = xor i1 %34, true
  br label %land.end51

land.end51:                                       ; preds = %lor.end50, %while.cond36
  %35 = phi i1 [ false, %while.cond36 ], [ %lnot, %lor.end50 ]
  br i1 %35, label %while.body52, label %while.end53

while.body52:                                     ; preds = %land.end51
  br label %while.cond36

while.end53:                                      ; preds = %land.end51
  %36 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end54

if.end54:                                         ; preds = %while.end53, %while.end
  br label %while.cond

while.end55:                                      ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_bword(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %last_is_ident = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end133, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %cmp = icmp sgt i32 %1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %2 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %2, label %while.body, label %while.end134

while.body:                                       ; preds = %land.end
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %if.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %lor.lhs.false
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %10, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i32 %sub
  %11 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %11 to i32
  %cmp9 = icmp eq i32 %conv8, 32
  br i1 %cmp9, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %land.lhs.true
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* @rl_point, align 4
  %sub12 = sub nsw i32 %13, 1
  %arrayidx13 = getelementptr inbounds i8, i8* %12, i32 %sub12
  %14 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %14 to i32
  %cmp15 = icmp eq i32 %conv14, 9
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false11, %land.lhs.true
  %15 = load i32, i32* @rl_point, align 4
  %dec17 = add nsw i32 %15, -1
  store i32 %dec17, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false11, %lor.lhs.false, %while.body
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* @rl_point, align 4
  %sub18 = sub nsw i32 %17, 1
  %arrayidx19 = getelementptr inbounds i8, i8* %16, i32 %sub18
  %18 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %18 to i32
  %call = call i32 @isalnum(i32 %conv20) #4
  %tobool21 = icmp ne i32 %call, 0
  br i1 %tobool21, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %19 = load i8*, i8** @rl_line_buffer, align 4
  %20 = load i32, i32* @rl_point, align 4
  %sub22 = sub nsw i32 %20, 1
  %arrayidx23 = getelementptr inbounds i8, i8* %19, i32 %sub22
  %21 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %21 to i32
  %cmp25 = icmp eq i32 %conv24, 95
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %22 = phi i1 [ true, %if.end ], [ %cmp25, %lor.rhs ]
  %lor.ext = zext i1 %22 to i32
  store i32 %lor.ext, i32* %last_is_ident, align 4
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* @rl_point, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx27, align 1
  %conv28 = zext i8 %25 to i32
  %call29 = call i32 @isalnum(i32 %conv28) #4
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %land.lhs.true36, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.end
  %26 = load i8*, i8** @rl_line_buffer, align 4
  %27 = load i32, i32* @rl_point, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %28 to i32
  %cmp34 = icmp eq i32 %conv33, 95
  br i1 %cmp34, label %land.lhs.true36, label %lor.lhs.false38

land.lhs.true36:                                  ; preds = %lor.lhs.false31, %lor.end
  %29 = load i32, i32* %last_is_ident, align 4
  %tobool37 = icmp ne i32 %29, 0
  br i1 %tobool37, label %lor.lhs.false38, label %if.then50

lor.lhs.false38:                                  ; preds = %land.lhs.true36, %lor.lhs.false31
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* @rl_point, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx39, align 1
  %conv40 = zext i8 %32 to i32
  %call41 = call i32 @isalnum(i32 %conv40) #4
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %if.end52, label %lor.lhs.false43

lor.lhs.false43:                                  ; preds = %lor.lhs.false38
  %33 = load i8*, i8** @rl_line_buffer, align 4
  %34 = load i32, i32* @rl_point, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %35 to i32
  %cmp46 = icmp eq i32 %conv45, 95
  br i1 %cmp46, label %if.end52, label %land.lhs.true48

land.lhs.true48:                                  ; preds = %lor.lhs.false43
  %36 = load i32, i32* %last_is_ident, align 4
  %tobool49 = icmp ne i32 %36, 0
  br i1 %tobool49, label %if.then50, label %if.end52

if.then50:                                        ; preds = %land.lhs.true48, %land.lhs.true36
  %37 = load i32, i32* @rl_point, align 4
  %dec51 = add nsw i32 %37, -1
  store i32 %dec51, i32* @rl_point, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %land.lhs.true48, %lor.lhs.false43, %lor.lhs.false38
  br label %while.cond53

while.cond53:                                     ; preds = %while.body69, %if.end52
  %38 = load i32, i32* @rl_point, align 4
  %cmp54 = icmp sgt i32 %38, 0
  br i1 %cmp54, label %land.rhs56, label %land.end68

land.rhs56:                                       ; preds = %while.cond53
  %39 = load i8*, i8** @rl_line_buffer, align 4
  %40 = load i32, i32* @rl_point, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx57, align 1
  %conv58 = sext i8 %41 to i32
  %cmp59 = icmp eq i32 %conv58, 32
  br i1 %cmp59, label %lor.end66, label %lor.rhs61

lor.rhs61:                                        ; preds = %land.rhs56
  %42 = load i8*, i8** @rl_line_buffer, align 4
  %43 = load i32, i32* @rl_point, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %44 to i32
  %cmp64 = icmp eq i32 %conv63, 9
  br label %lor.end66

lor.end66:                                        ; preds = %lor.rhs61, %land.rhs56
  %45 = phi i1 [ true, %land.rhs56 ], [ %cmp64, %lor.rhs61 ]
  br label %land.end68

land.end68:                                       ; preds = %lor.end66, %while.cond53
  %46 = phi i1 [ false, %while.cond53 ], [ %45, %lor.end66 ]
  br i1 %46, label %while.body69, label %while.end

while.body69:                                     ; preds = %land.end68
  %47 = load i32, i32* @rl_point, align 4
  %dec70 = add nsw i32 %47, -1
  store i32 %dec70, i32* @rl_point, align 4
  br label %while.cond53

while.end:                                        ; preds = %land.end68
  %48 = load i32, i32* @rl_point, align 4
  %cmp71 = icmp sgt i32 %48, 0
  br i1 %cmp71, label %if.then73, label %if.end133

if.then73:                                        ; preds = %while.end
  %49 = load i8*, i8** @rl_line_buffer, align 4
  %50 = load i32, i32* @rl_point, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %49, i32 %50
  %51 = load i8, i8* %arrayidx74, align 1
  %conv75 = zext i8 %51 to i32
  %call76 = call i32 @isalnum(i32 %conv75) #4
  %tobool77 = icmp ne i32 %call76, 0
  br i1 %tobool77, label %if.then83, label %lor.lhs.false78

lor.lhs.false78:                                  ; preds = %if.then73
  %52 = load i8*, i8** @rl_line_buffer, align 4
  %53 = load i32, i32* @rl_point, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %54 to i32
  %cmp81 = icmp eq i32 %conv80, 95
  br i1 %cmp81, label %if.then83, label %if.else

if.then83:                                        ; preds = %lor.lhs.false78, %if.then73
  br label %while.cond84

while.cond84:                                     ; preds = %while.body101, %if.then83
  %55 = load i32, i32* @rl_point, align 4
  %dec85 = add nsw i32 %55, -1
  store i32 %dec85, i32* @rl_point, align 4
  %cmp86 = icmp sge i32 %dec85, 0
  br i1 %cmp86, label %land.rhs88, label %land.end100

land.rhs88:                                       ; preds = %while.cond84
  %56 = load i8*, i8** @rl_line_buffer, align 4
  %57 = load i32, i32* @rl_point, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %56, i32 %57
  %58 = load i8, i8* %arrayidx89, align 1
  %conv90 = zext i8 %58 to i32
  %call91 = call i32 @isalnum(i32 %conv90) #4
  %tobool92 = icmp ne i32 %call91, 0
  br i1 %tobool92, label %lor.end98, label %lor.rhs93

lor.rhs93:                                        ; preds = %land.rhs88
  %59 = load i8*, i8** @rl_line_buffer, align 4
  %60 = load i32, i32* @rl_point, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %59, i32 %60
  %61 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %61 to i32
  %cmp96 = icmp eq i32 %conv95, 95
  br label %lor.end98

lor.end98:                                        ; preds = %lor.rhs93, %land.rhs88
  %62 = phi i1 [ true, %land.rhs88 ], [ %cmp96, %lor.rhs93 ]
  br label %land.end100

land.end100:                                      ; preds = %lor.end98, %while.cond84
  %63 = phi i1 [ false, %while.cond84 ], [ %62, %lor.end98 ]
  br i1 %63, label %while.body101, label %while.end102

while.body101:                                    ; preds = %land.end100
  br label %while.cond84

while.end102:                                     ; preds = %land.end100
  br label %if.end132

if.else:                                          ; preds = %lor.lhs.false78
  br label %while.cond103

while.cond103:                                    ; preds = %while.body130, %if.else
  %64 = load i32, i32* @rl_point, align 4
  %dec104 = add nsw i32 %64, -1
  store i32 %dec104, i32* @rl_point, align 4
  %cmp105 = icmp sge i32 %dec104, 0
  br i1 %cmp105, label %land.lhs.true107, label %land.end129

land.lhs.true107:                                 ; preds = %while.cond103
  %65 = load i8*, i8** @rl_line_buffer, align 4
  %66 = load i32, i32* @rl_point, align 4
  %arrayidx108 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8, i8* %arrayidx108, align 1
  %conv109 = zext i8 %67 to i32
  %call110 = call i32 @isalnum(i32 %conv109) #4
  %tobool111 = icmp ne i32 %call110, 0
  br i1 %tobool111, label %land.end129, label %lor.lhs.false112

lor.lhs.false112:                                 ; preds = %land.lhs.true107
  %68 = load i8*, i8** @rl_line_buffer, align 4
  %69 = load i32, i32* @rl_point, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %68, i32 %69
  %70 = load i8, i8* %arrayidx113, align 1
  %conv114 = sext i8 %70 to i32
  %cmp115 = icmp eq i32 %conv114, 95
  br i1 %cmp115, label %land.end129, label %land.rhs117

land.rhs117:                                      ; preds = %lor.lhs.false112
  %71 = load i8*, i8** @rl_line_buffer, align 4
  %72 = load i32, i32* @rl_point, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %71, i32 %72
  %73 = load i8, i8* %arrayidx118, align 1
  %conv119 = sext i8 %73 to i32
  %cmp120 = icmp eq i32 %conv119, 32
  br i1 %cmp120, label %lor.end127, label %lor.rhs122

lor.rhs122:                                       ; preds = %land.rhs117
  %74 = load i8*, i8** @rl_line_buffer, align 4
  %75 = load i32, i32* @rl_point, align 4
  %arrayidx123 = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load i8, i8* %arrayidx123, align 1
  %conv124 = sext i8 %76 to i32
  %cmp125 = icmp eq i32 %conv124, 9
  br label %lor.end127

lor.end127:                                       ; preds = %lor.rhs122, %land.rhs117
  %77 = phi i1 [ true, %land.rhs117 ], [ %cmp125, %lor.rhs122 ]
  %lnot = xor i1 %77, true
  br label %land.end129

land.end129:                                      ; preds = %lor.end127, %lor.lhs.false112, %land.lhs.true107, %while.cond103
  %78 = phi i1 [ false, %lor.lhs.false112 ], [ false, %land.lhs.true107 ], [ false, %while.cond103 ], [ %lnot, %lor.end127 ]
  br i1 %78, label %while.body130, label %while.end131

while.body130:                                    ; preds = %land.end129
  br label %while.cond103

while.end131:                                     ; preds = %land.end129
  br label %if.end132

if.end132:                                        ; preds = %while.end131, %while.end102
  %79 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %79, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end133

if.end133:                                        ; preds = %if.end132, %while.end
  br label %while.cond

while.end134:                                     ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_fWord(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end29, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %2, 1
  %cmp = icmp slt i32 %1, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end30

while.body:                                       ; preds = %land.end
  br label %while.cond1

while.cond1:                                      ; preds = %while.body12, %while.body
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp eq i32 %conv, 32
  br i1 %cmp2, label %land.end11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.cond1
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* @rl_point, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %cmp6 = icmp eq i32 %conv5, 9
  br i1 %cmp6, label %land.end11, label %land.rhs8

land.rhs8:                                        ; preds = %lor.lhs.false
  %10 = load i32, i32* @rl_point, align 4
  %11 = load i32, i32* @rl_end, align 4
  %cmp9 = icmp slt i32 %10, %11
  br label %land.end11

land.end11:                                       ; preds = %land.rhs8, %lor.lhs.false, %while.cond1
  %12 = phi i1 [ false, %lor.lhs.false ], [ false, %while.cond1 ], [ %cmp9, %land.rhs8 ]
  br i1 %12, label %while.body12, label %while.end

while.body12:                                     ; preds = %land.end11
  %13 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %while.cond1

while.end:                                        ; preds = %land.end11
  br label %while.cond13

while.cond13:                                     ; preds = %while.body27, %while.end
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* @rl_point, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %16 to i32
  %cmp16 = icmp eq i32 %conv15, 32
  br i1 %cmp16, label %land.rhs23, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %while.cond13
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* @rl_point, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %19 to i32
  %cmp21 = icmp eq i32 %conv20, 9
  br i1 %cmp21, label %land.rhs23, label %land.end26

land.rhs23:                                       ; preds = %lor.lhs.false18, %while.cond13
  %20 = load i32, i32* @rl_point, align 4
  %21 = load i32, i32* @rl_end, align 4
  %cmp24 = icmp slt i32 %20, %21
  br label %land.end26

land.end26:                                       ; preds = %land.rhs23, %lor.lhs.false18
  %22 = phi i1 [ false, %lor.lhs.false18 ], [ %cmp24, %land.rhs23 ]
  br i1 %22, label %while.body27, label %while.end29

while.body27:                                     ; preds = %land.end26
  %23 = load i32, i32* @rl_point, align 4
  %inc28 = add nsw i32 %23, 1
  store i32 %inc28, i32* @rl_point, align 4
  br label %while.cond13

while.end29:                                      ; preds = %land.end26
  br label %while.cond

while.end30:                                      ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_fword(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end63, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %2, 1
  %cmp = icmp slt i32 %1, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end64

while.body:                                       ; preds = %land.end
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %6 to i32
  %call = call i32 @isalnum(i32 %conv) #4
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* @rl_point, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %9 to i32
  %cmp4 = icmp eq i32 %conv3, 95
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %while.body
  br label %while.cond6

while.cond6:                                      ; preds = %while.body20, %if.then
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* @rl_point, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %12 to i32
  %call9 = call i32 @isalnum(i32 %conv8) #4
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %land.rhs16, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %while.cond6
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %15 to i32
  %cmp14 = icmp eq i32 %conv13, 95
  br i1 %cmp14, label %land.rhs16, label %land.end19

land.rhs16:                                       ; preds = %lor.lhs.false11, %while.cond6
  %16 = load i32, i32* @rl_point, align 4
  %17 = load i32, i32* @rl_end, align 4
  %cmp17 = icmp slt i32 %16, %17
  br label %land.end19

land.end19:                                       ; preds = %land.rhs16, %lor.lhs.false11
  %18 = phi i1 [ false, %lor.lhs.false11 ], [ %cmp17, %land.rhs16 ]
  br i1 %18, label %while.body20, label %while.end

while.body20:                                     ; preds = %land.end19
  %19 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %while.cond6

while.end:                                        ; preds = %land.end19
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  br label %while.cond21

while.cond21:                                     ; preds = %while.body44, %if.else
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* @rl_point, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx22, align 1
  %conv23 = zext i8 %22 to i32
  %call24 = call i32 @isalnum(i32 %conv23) #4
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %land.end43, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %while.cond21
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* @rl_point, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %25 to i32
  %cmp29 = icmp eq i32 %conv28, 95
  br i1 %cmp29, label %land.end43, label %land.lhs.true

land.lhs.true:                                    ; preds = %lor.lhs.false26
  %26 = load i8*, i8** @rl_line_buffer, align 4
  %27 = load i32, i32* @rl_point, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %28 to i32
  %cmp33 = icmp eq i32 %conv32, 32
  br i1 %cmp33, label %land.end43, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %land.lhs.true
  %29 = load i8*, i8** @rl_line_buffer, align 4
  %30 = load i32, i32* @rl_point, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %31 to i32
  %cmp38 = icmp eq i32 %conv37, 9
  br i1 %cmp38, label %land.end43, label %land.rhs40

land.rhs40:                                       ; preds = %lor.lhs.false35
  %32 = load i32, i32* @rl_point, align 4
  %33 = load i32, i32* @rl_end, align 4
  %cmp41 = icmp slt i32 %32, %33
  br label %land.end43

land.end43:                                       ; preds = %land.rhs40, %lor.lhs.false35, %land.lhs.true, %lor.lhs.false26, %while.cond21
  %34 = phi i1 [ false, %lor.lhs.false35 ], [ false, %land.lhs.true ], [ false, %lor.lhs.false26 ], [ false, %while.cond21 ], [ %cmp41, %land.rhs40 ]
  br i1 %34, label %while.body44, label %while.end46

while.body44:                                     ; preds = %land.end43
  %35 = load i32, i32* @rl_point, align 4
  %inc45 = add nsw i32 %35, 1
  store i32 %inc45, i32* @rl_point, align 4
  br label %while.cond21

while.end46:                                      ; preds = %land.end43
  br label %if.end

if.end:                                           ; preds = %while.end46, %while.end
  br label %while.cond47

while.cond47:                                     ; preds = %while.body61, %if.end
  %36 = load i8*, i8** @rl_line_buffer, align 4
  %37 = load i32, i32* @rl_point, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %36, i32 %37
  %38 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %38 to i32
  %cmp50 = icmp eq i32 %conv49, 32
  br i1 %cmp50, label %land.rhs57, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %while.cond47
  %39 = load i8*, i8** @rl_line_buffer, align 4
  %40 = load i32, i32* @rl_point, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %39, i32 %40
  %41 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %41 to i32
  %cmp55 = icmp eq i32 %conv54, 9
  br i1 %cmp55, label %land.rhs57, label %land.end60

land.rhs57:                                       ; preds = %lor.lhs.false52, %while.cond47
  %42 = load i32, i32* @rl_point, align 4
  %43 = load i32, i32* @rl_end, align 4
  %cmp58 = icmp slt i32 %42, %43
  br label %land.end60

land.end60:                                       ; preds = %land.rhs57, %lor.lhs.false52
  %44 = phi i1 [ false, %lor.lhs.false52 ], [ %cmp58, %land.rhs57 ]
  br i1 %44, label %while.body61, label %while.end63

while.body61:                                     ; preds = %land.end60
  %45 = load i32, i32* @rl_point, align 4
  %inc62 = add nsw i32 %45, 1
  store i32 %inc62, i32* @rl_point, align 4
  br label %while.cond47

while.end63:                                      ; preds = %land.end60
  br label %while.cond

while.end64:                                      ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_eWord(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end63, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %2, 1
  %cmp = icmp slt i32 %1, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end64

while.body:                                       ; preds = %land.end
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false
  %10 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %while.body
  br label %while.cond7

while.cond7:                                      ; preds = %while.body20, %if.end
  %11 = load i32, i32* @rl_point, align 4
  %12 = load i32, i32* @rl_end, align 4
  %cmp8 = icmp slt i32 %11, %12
  br i1 %cmp8, label %land.rhs10, label %land.end19

land.rhs10:                                       ; preds = %while.cond7
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  %cmp13 = icmp eq i32 %conv12, 32
  br i1 %cmp13, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs10
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* @rl_point, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %18 to i32
  %cmp17 = icmp eq i32 %conv16, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs10
  %19 = phi i1 [ true, %land.rhs10 ], [ %cmp17, %lor.rhs ]
  br label %land.end19

land.end19:                                       ; preds = %lor.end, %while.cond7
  %20 = phi i1 [ false, %while.cond7 ], [ %19, %lor.end ]
  br i1 %20, label %while.body20, label %while.end

while.body20:                                     ; preds = %land.end19
  %21 = load i32, i32* @rl_point, align 4
  %inc21 = add nsw i32 %21, 1
  store i32 %inc21, i32* @rl_point, align 4
  br label %while.cond7

while.end:                                        ; preds = %land.end19
  %22 = load i32, i32* @rl_point, align 4
  %tobool22 = icmp ne i32 %22, 0
  br i1 %tobool22, label %land.lhs.true, label %if.end63

land.lhs.true:                                    ; preds = %while.end
  %23 = load i32, i32* @rl_point, align 4
  %24 = load i32, i32* @rl_end, align 4
  %cmp23 = icmp slt i32 %23, %24
  br i1 %cmp23, label %if.then25, label %if.end63

if.then25:                                        ; preds = %land.lhs.true
  br label %while.cond26

while.cond26:                                     ; preds = %while.body41, %if.then25
  %25 = load i32, i32* @rl_point, align 4
  %26 = load i32, i32* @rl_end, align 4
  %cmp27 = icmp slt i32 %25, %26
  br i1 %cmp27, label %land.rhs29, label %land.end40

land.rhs29:                                       ; preds = %while.cond26
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* @rl_point, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %29 to i32
  %cmp32 = icmp eq i32 %conv31, 32
  br i1 %cmp32, label %lor.end39, label %lor.rhs34

lor.rhs34:                                        ; preds = %land.rhs29
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* @rl_point, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %32 to i32
  %cmp37 = icmp eq i32 %conv36, 9
  br label %lor.end39

lor.end39:                                        ; preds = %lor.rhs34, %land.rhs29
  %33 = phi i1 [ true, %land.rhs29 ], [ %cmp37, %lor.rhs34 ]
  br label %land.end40

land.end40:                                       ; preds = %lor.end39, %while.cond26
  %34 = phi i1 [ false, %while.cond26 ], [ %33, %lor.end39 ]
  br i1 %34, label %while.body41, label %while.end43

while.body41:                                     ; preds = %land.end40
  %35 = load i32, i32* @rl_point, align 4
  %inc42 = add nsw i32 %35, 1
  store i32 %inc42, i32* @rl_point, align 4
  br label %while.cond26

while.end43:                                      ; preds = %land.end40
  br label %while.cond44

while.cond44:                                     ; preds = %while.body59, %while.end43
  %36 = load i32, i32* @rl_point, align 4
  %37 = load i32, i32* @rl_end, align 4
  %cmp45 = icmp slt i32 %36, %37
  br i1 %cmp45, label %land.rhs47, label %land.end58

land.rhs47:                                       ; preds = %while.cond44
  %38 = load i8*, i8** @rl_line_buffer, align 4
  %39 = load i32, i32* @rl_point, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %40 to i32
  %cmp50 = icmp eq i32 %conv49, 32
  br i1 %cmp50, label %lor.end57, label %lor.rhs52

lor.rhs52:                                        ; preds = %land.rhs47
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* @rl_point, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %43 to i32
  %cmp55 = icmp eq i32 %conv54, 9
  br label %lor.end57

lor.end57:                                        ; preds = %lor.rhs52, %land.rhs47
  %44 = phi i1 [ true, %land.rhs47 ], [ %cmp55, %lor.rhs52 ]
  %lnot = xor i1 %44, true
  br label %land.end58

land.end58:                                       ; preds = %lor.end57, %while.cond44
  %45 = phi i1 [ false, %while.cond44 ], [ %lnot, %lor.end57 ]
  br i1 %45, label %while.body59, label %while.end61

while.body59:                                     ; preds = %land.end58
  %46 = load i32, i32* @rl_point, align 4
  %inc60 = add nsw i32 %46, 1
  store i32 %inc60, i32* @rl_point, align 4
  br label %while.cond44

while.end61:                                      ; preds = %land.end58
  %47 = load i32, i32* @rl_point, align 4
  %dec62 = add nsw i32 %47, -1
  store i32 %dec62, i32* @rl_point, align 4
  br label %if.end63

if.end63:                                         ; preds = %while.end61, %land.lhs.true, %while.end
  br label %while.cond

while.end64:                                      ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_eword(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end80, %entry
  %0 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %2, 1
  %cmp = icmp slt i32 %1, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ]
  br i1 %3, label %while.body, label %while.end82

while.body:                                       ; preds = %land.end
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false
  %10 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %while.body
  br label %while.cond7

while.cond7:                                      ; preds = %while.body20, %if.end
  %11 = load i32, i32* @rl_point, align 4
  %12 = load i32, i32* @rl_end, align 4
  %cmp8 = icmp slt i32 %11, %12
  br i1 %cmp8, label %land.rhs10, label %land.end19

land.rhs10:                                       ; preds = %while.cond7
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  %cmp13 = icmp eq i32 %conv12, 32
  br i1 %cmp13, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs10
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* @rl_point, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %18 to i32
  %cmp17 = icmp eq i32 %conv16, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs10
  %19 = phi i1 [ true, %land.rhs10 ], [ %cmp17, %lor.rhs ]
  br label %land.end19

land.end19:                                       ; preds = %lor.end, %while.cond7
  %20 = phi i1 [ false, %while.cond7 ], [ %19, %lor.end ]
  br i1 %20, label %while.body20, label %while.end

while.body20:                                     ; preds = %land.end19
  %21 = load i32, i32* @rl_point, align 4
  %inc21 = add nsw i32 %21, 1
  store i32 %inc21, i32* @rl_point, align 4
  br label %while.cond7

while.end:                                        ; preds = %land.end19
  %22 = load i32, i32* @rl_point, align 4
  %23 = load i32, i32* @rl_end, align 4
  %cmp22 = icmp slt i32 %22, %23
  br i1 %cmp22, label %if.then24, label %if.end80

if.then24:                                        ; preds = %while.end
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* @rl_point, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx25, align 1
  %conv26 = zext i8 %26 to i32
  %call = call i32 @isalnum(i32 %conv26) #4
  %tobool27 = icmp ne i32 %call, 0
  br i1 %tobool27, label %if.then33, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.then24
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* @rl_point, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %29 to i32
  %cmp31 = icmp eq i32 %conv30, 95
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %lor.lhs.false28, %if.then24
  br label %while.cond34

while.cond34:                                     ; preds = %while.body50, %if.then33
  %30 = load i32, i32* @rl_point, align 4
  %inc35 = add nsw i32 %30, 1
  store i32 %inc35, i32* @rl_point, align 4
  %31 = load i32, i32* @rl_end, align 4
  %cmp36 = icmp slt i32 %inc35, %31
  br i1 %cmp36, label %land.rhs38, label %land.end49

land.rhs38:                                       ; preds = %while.cond34
  %32 = load i8*, i8** @rl_line_buffer, align 4
  %33 = load i32, i32* @rl_point, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx39, align 1
  %conv40 = zext i8 %34 to i32
  %call41 = call i32 @isalnum(i32 %conv40) #4
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %lor.end48, label %lor.rhs43

lor.rhs43:                                        ; preds = %land.rhs38
  %35 = load i8*, i8** @rl_line_buffer, align 4
  %36 = load i32, i32* @rl_point, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %37 to i32
  %cmp46 = icmp eq i32 %conv45, 95
  br label %lor.end48

lor.end48:                                        ; preds = %lor.rhs43, %land.rhs38
  %38 = phi i1 [ true, %land.rhs38 ], [ %cmp46, %lor.rhs43 ]
  br label %land.end49

land.end49:                                       ; preds = %lor.end48, %while.cond34
  %39 = phi i1 [ false, %while.cond34 ], [ %38, %lor.end48 ]
  br i1 %39, label %while.body50, label %while.end51

while.body50:                                     ; preds = %land.end49
  br label %while.cond34

while.end51:                                      ; preds = %land.end49
  br label %if.end79

if.else:                                          ; preds = %lor.lhs.false28
  br label %while.cond52

while.cond52:                                     ; preds = %while.body77, %if.else
  %40 = load i32, i32* @rl_point, align 4
  %inc53 = add nsw i32 %40, 1
  store i32 %inc53, i32* @rl_point, align 4
  %41 = load i32, i32* @rl_end, align 4
  %cmp54 = icmp slt i32 %inc53, %41
  br i1 %cmp54, label %land.lhs.true, label %land.end76

land.lhs.true:                                    ; preds = %while.cond52
  %42 = load i8*, i8** @rl_line_buffer, align 4
  %43 = load i32, i32* @rl_point, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8, i8* %arrayidx56, align 1
  %conv57 = zext i8 %44 to i32
  %call58 = call i32 @isalnum(i32 %conv57) #4
  %tobool59 = icmp ne i32 %call58, 0
  br i1 %tobool59, label %land.end76, label %lor.lhs.false60

lor.lhs.false60:                                  ; preds = %land.lhs.true
  %45 = load i8*, i8** @rl_line_buffer, align 4
  %46 = load i32, i32* @rl_point, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx61, align 1
  %conv62 = sext i8 %47 to i32
  %cmp63 = icmp eq i32 %conv62, 95
  br i1 %cmp63, label %land.end76, label %land.rhs65

land.rhs65:                                       ; preds = %lor.lhs.false60
  %48 = load i8*, i8** @rl_line_buffer, align 4
  %49 = load i32, i32* @rl_point, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %48, i32 %49
  %50 = load i8, i8* %arrayidx66, align 1
  %conv67 = sext i8 %50 to i32
  %cmp68 = icmp eq i32 %conv67, 32
  br i1 %cmp68, label %lor.end75, label %lor.rhs70

lor.rhs70:                                        ; preds = %land.rhs65
  %51 = load i8*, i8** @rl_line_buffer, align 4
  %52 = load i32, i32* @rl_point, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %53 to i32
  %cmp73 = icmp eq i32 %conv72, 9
  br label %lor.end75

lor.end75:                                        ; preds = %lor.rhs70, %land.rhs65
  %54 = phi i1 [ true, %land.rhs65 ], [ %cmp73, %lor.rhs70 ]
  %lnot = xor i1 %54, true
  br label %land.end76

land.end76:                                       ; preds = %lor.end75, %lor.lhs.false60, %land.lhs.true, %while.cond52
  %55 = phi i1 [ false, %lor.lhs.false60 ], [ false, %land.lhs.true ], [ false, %while.cond52 ], [ %lnot, %lor.end75 ]
  br i1 %55, label %while.body77, label %while.end78

while.body77:                                     ; preds = %land.end76
  br label %while.cond52

while.end78:                                      ; preds = %land.end76
  br label %if.end79

if.end79:                                         ; preds = %while.end78, %while.end51
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %while.end
  %56 = load i32, i32* @rl_point, align 4
  %dec81 = add nsw i32 %56, -1
  store i32 %dec81, i32* @rl_point, align 4
  br label %while.cond

while.end82:                                      ; preds = %land.end
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #2

; Function Attrs: noinline nounwind
define i32 @rl_vi_insert_beg(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_beg_of_line(i32 1, i32 %0)
  %1 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_vi_insert_mode(i32 1, i32 %1)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_insert_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %1 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %0, i32 1, i32 %1)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_append_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  call void @_rl_vi_append_forward(i32 %0)
  %1 = load i32, i32* %key.addr, align 4
  %2 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %1, i32 1, i32 %2)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_append_eol(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_end_of_line(i32 1, i32 %0)
  %1 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_vi_append_mode(i32 1, i32 %1)
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_eof_maybe(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %call = call i32 @rl_newline(i32 1, i32 10)
  ret i32 %call
}

declare i32 @rl_newline(i32, i32) #1

declare void @_rl_reset_prompt() #1

; Function Attrs: noinline nounwind
define void @_rl_vi_done_inserting() #0 {
entry:
  %0 = load i32, i32* @_rl_vi_doing_insert, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else2

if.then:                                          ; preds = %entry
  %call = call i32 @rl_end_undo_group()
  store i32 0, i32* @_rl_vi_doing_insert, align 4
  %1 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp = icmp eq i32 %1, 82
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.then
  call void @_rl_vi_save_replace()
  br label %if.end

if.else:                                          ; preds = %if.then
  %2 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 0
  %3 = load %struct.undo_list*, %struct.undo_list** %next, align 4
  call void @_rl_vi_save_insert(%struct.undo_list* %3)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  store i32 1, i32* @vi_continued_command, align 4
  br label %if.end19

if.else2:                                         ; preds = %entry
  %4 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool3 = icmp ne %struct.undo_list* %4, null
  br i1 %tobool3, label %land.lhs.true, label %if.else11

land.lhs.true:                                    ; preds = %if.else2
  %5 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp4 = icmp eq i32 %5, 105
  br i1 %cmp4, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp5 = icmp eq i32 %6, 97
  br i1 %cmp5, label %if.then10, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %7 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp7 = icmp eq i32 %7, 73
  br i1 %cmp7, label %if.then10, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %8 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp9 = icmp eq i32 %8, 65
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false, %land.lhs.true
  %9 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  call void @_rl_vi_save_insert(%struct.undo_list* %9)
  br label %if.end16

if.else11:                                        ; preds = %lor.lhs.false8, %if.else2
  %10 = load i32, i32* @_rl_vi_last_key_before_insert, align 4
  %cmp12 = icmp eq i32 %10, 67
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.else11
  %call14 = call i32 @rl_end_undo_group()
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.else11
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then10
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end16
  %11 = load i32, i32* @_rl_undo_group_level, align 4
  %cmp17 = icmp sgt i32 %11, 0
  br i1 %cmp17, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call18 = call i32 @rl_end_undo_group()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* @vi_continued_command, align 4
  br label %if.end19

if.end19:                                         ; preds = %while.end, %if.end
  ret void
}

declare i32 @rl_end_undo_group() #1

; Function Attrs: noinline nounwind
define internal void @_rl_vi_save_replace() #0 {
entry:
  %len = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %up = alloca %struct.undo_list*, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %0, %struct.undo_list** %up, align 4
  %1 = load %struct.undo_list*, %struct.undo_list** %up, align 4
  %cmp = icmp eq %struct.undo_list* %1, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.undo_list*, %struct.undo_list** %up, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 4
  %3 = load i32, i32* %what, align 4
  %cmp1 = icmp ne i32 %3, 3
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* @vi_replace_count, align 4
  %cmp3 = icmp sle i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end6

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %5 = load i32, i32* @vi_insert_buffer_size, align 4
  %cmp4 = icmp sge i32 %5, 1
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %6 = load i8*, i8** @vi_insert_buffer, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  br label %return

if.end6:                                          ; preds = %lor.lhs.false2
  %7 = load i32, i32* @rl_point, align 4
  store i32 %7, i32* %end, align 4
  %8 = load i32, i32* %end, align 4
  %9 = load i32, i32* @vi_replace_count, align 4
  %sub = sub nsw i32 %8, %9
  %add = add nsw i32 %sub, 1
  store i32 %add, i32* %start, align 4
  %10 = load i32, i32* @vi_replace_count, align 4
  %add7 = add nsw i32 %10, 1
  store i32 %add7, i32* %len, align 4
  %11 = load i32, i32* %start, align 4
  %12 = load i32, i32* %len, align 4
  call void @vi_save_insert_buffer(i32 %11, i32 %12)
  br label %return

return:                                           ; preds = %if.end6, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_rl_vi_save_insert(%struct.undo_list* %up) #0 {
entry:
  %up.addr = alloca %struct.undo_list*, align 4
  %len = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  store %struct.undo_list* %up, %struct.undo_list** %up.addr, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** %up.addr, align 4
  %cmp = icmp eq %struct.undo_list* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.undo_list*, %struct.undo_list** %up.addr, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %1, i32 0, i32 4
  %2 = load i32, i32* %what, align 4
  %cmp1 = icmp ne i32 %2, 1
  br i1 %cmp1, label %if.then, label %if.end4

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* @vi_insert_buffer_size, align 4
  %cmp2 = icmp sge i32 %3, 1
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %4 = load i8*, i8** @vi_insert_buffer, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  br label %return

if.end4:                                          ; preds = %lor.lhs.false
  %5 = load %struct.undo_list*, %struct.undo_list** %up.addr, align 4
  %start5 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %5, i32 0, i32 1
  %6 = load i32, i32* %start5, align 4
  store i32 %6, i32* %start, align 4
  %7 = load %struct.undo_list*, %struct.undo_list** %up.addr, align 4
  %end6 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %7, i32 0, i32 2
  %8 = load i32, i32* %end6, align 4
  store i32 %8, i32* %end, align 4
  %9 = load i32, i32* %end, align 4
  %10 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %9, %10
  %add = add nsw i32 %sub, 1
  store i32 %add, i32* %len, align 4
  %11 = load i32, i32* %start, align 4
  %12 = load i32, i32* %len, align 4
  call void @vi_save_insert_buffer(i32 %11, i32 %12)
  br label %return

return:                                           ; preds = %if.end4, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_movement_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_backward_char(i32 1, i32 %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  call void @_rl_vi_done_inserting()
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, 4194304
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @rl_free_undo_list()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %3 = load i32, i32* @_rl_show_mode_in_prompt, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  call void @_rl_reset_prompt()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %4 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %4, 4194304
  store i32 %or, i32* @rl_readline_state, align 4
  ret i32 0
}

declare i32 @rl_backward_char(i32, i32) #1

declare void @rl_free_undo_list() #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_arg_digit(i32 %count, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %0, 48
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_numeric_arg, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %land.lhs.true2
  %3 = load i32, i32* %c.addr, align 4
  %call = call i32 @rl_beg_of_line(i32 1, i32 %3)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %c.addr, align 4
  %call3 = call i32 @rl_digit_argument(i32 %4, i32 %5)
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @rl_digit_argument(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_change_case(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %c, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp1 = icmp ugt i32 %call, 1
  br i1 %cmp1, label %land.lhs.true, label %if.end5

land.lhs.true:                                    ; preds = %if.end
  %2 = load i32, i32* @rl_byte_oriented, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %land.lhs.true
  %3 = load i32, i32* %count.addr, align 4
  %call4 = call i32 @_rl_vi_change_mbchar_case(i32 %3)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %land.lhs.true, %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end82, %if.else65, %if.end5
  %4 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %5 = load i32, i32* @rl_point, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp6 = icmp slt i32 %5, %6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %cmp6, %land.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %10 to i32
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* @rl_point, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %13 to i32
  %cmp9 = icmp eq i32 %conv, %conv8
  br i1 %cmp9, label %land.lhs.true11, label %if.else

land.lhs.true11:                                  ; preds = %while.body
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* @rl_point, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx12, align 1
  %conv13 = zext i8 %16 to i32
  %call14 = call i32 @isupper(i32 %conv13) #4
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %land.lhs.true11
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* @rl_point, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx17, align 1
  %conv18 = zext i8 %19 to i32
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* @rl_point, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %22 to i32
  %cmp21 = icmp eq i32 %conv18, %conv20
  br i1 %cmp21, label %land.lhs.true23, label %cond.false

land.lhs.true23:                                  ; preds = %if.then16
  %23 = load i8*, i8** @rl_line_buffer, align 4
  %24 = load i32, i32* @rl_point, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %25 to i32
  %call26 = call i32 @isupper(i32 %conv25) #4
  %tobool27 = icmp ne i32 %call26, 0
  br i1 %tobool27, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true23
  %26 = load i8*, i8** @rl_line_buffer, align 4
  %27 = load i32, i32* @rl_point, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx28, align 1
  %conv29 = zext i8 %28 to i32
  %call30 = call i32 @tolower(i32 %conv29) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true23, %if.then16
  %29 = load i8*, i8** @rl_line_buffer, align 4
  %30 = load i32, i32* @rl_point, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %31 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call30, %cond.true ], [ %conv32, %cond.false ]
  store i32 %cond, i32* %c, align 4
  br label %if.end68

if.else:                                          ; preds = %land.lhs.true11, %while.body
  %32 = load i8*, i8** @rl_line_buffer, align 4
  %33 = load i32, i32* @rl_point, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx33, align 1
  %conv34 = zext i8 %34 to i32
  %35 = load i8*, i8** @rl_line_buffer, align 4
  %36 = load i32, i32* @rl_point, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %35, i32 %36
  %37 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %37 to i32
  %cmp37 = icmp eq i32 %conv34, %conv36
  br i1 %cmp37, label %land.lhs.true39, label %if.else65

land.lhs.true39:                                  ; preds = %if.else
  %38 = load i8*, i8** @rl_line_buffer, align 4
  %39 = load i32, i32* @rl_point, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx40, align 1
  %conv41 = zext i8 %40 to i32
  %call42 = call i32 @islower(i32 %conv41) #4
  %tobool43 = icmp ne i32 %call42, 0
  br i1 %tobool43, label %if.then44, label %if.else65

if.then44:                                        ; preds = %land.lhs.true39
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* @rl_point, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx45, align 1
  %conv46 = zext i8 %43 to i32
  %44 = load i8*, i8** @rl_line_buffer, align 4
  %45 = load i32, i32* @rl_point, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %46 to i32
  %cmp49 = icmp eq i32 %conv46, %conv48
  br i1 %cmp49, label %land.lhs.true51, label %cond.false60

land.lhs.true51:                                  ; preds = %if.then44
  %47 = load i8*, i8** @rl_line_buffer, align 4
  %48 = load i32, i32* @rl_point, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %47, i32 %48
  %49 = load i8, i8* %arrayidx52, align 1
  %conv53 = zext i8 %49 to i32
  %call54 = call i32 @islower(i32 %conv53) #4
  %tobool55 = icmp ne i32 %call54, 0
  br i1 %tobool55, label %cond.true56, label %cond.false60

cond.true56:                                      ; preds = %land.lhs.true51
  %50 = load i8*, i8** @rl_line_buffer, align 4
  %51 = load i32, i32* @rl_point, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = load i8, i8* %arrayidx57, align 1
  %conv58 = zext i8 %52 to i32
  %call59 = call i32 @toupper(i32 %conv58) #4
  br label %cond.end63

cond.false60:                                     ; preds = %land.lhs.true51, %if.then44
  %53 = load i8*, i8** @rl_line_buffer, align 4
  %54 = load i32, i32* @rl_point, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %53, i32 %54
  %55 = load i8, i8* %arrayidx61, align 1
  %conv62 = sext i8 %55 to i32
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false60, %cond.true56
  %cond64 = phi i32 [ %call59, %cond.true56 ], [ %conv62, %cond.false60 ]
  store i32 %cond64, i32* %c, align 4
  br label %if.end67

if.else65:                                        ; preds = %land.lhs.true39, %if.else
  %56 = load i32, i32* %c, align 4
  %call66 = call i32 @rl_forward_char(i32 1, i32 %56)
  br label %while.cond

if.end67:                                         ; preds = %cond.end63
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %cond.end
  %57 = load i32, i32* %c, align 4
  %tobool69 = icmp ne i32 %57, 0
  br i1 %tobool69, label %if.then70, label %if.else80

if.then70:                                        ; preds = %if.end68
  %58 = load i32, i32* @rl_point, align 4
  store i32 %58, i32* %p, align 4
  %call71 = call i32 @rl_begin_undo_group()
  %59 = load i32, i32* %c, align 4
  %call72 = call i32 @rl_vi_delete(i32 1, i32 %59)
  %60 = load i32, i32* @rl_point, align 4
  %61 = load i32, i32* %p, align 4
  %cmp73 = icmp slt i32 %60, %61
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.then70
  %62 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %62, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.then70
  %63 = load i32, i32* %c, align 4
  %call77 = call i32 @_rl_insert_char(i32 1, i32 %63)
  %call78 = call i32 @rl_end_undo_group()
  %call79 = call i32 @rl_vi_check()
  br label %if.end82

if.else80:                                        ; preds = %if.end68
  %64 = load i32, i32* %c, align 4
  %call81 = call i32 @rl_forward_char(i32 1, i32 %64)
  br label %if.end82

if.end82:                                         ; preds = %if.else80, %if.end76
  br label %while.cond

while.end:                                        ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then3, %if.then
  %65 = load i32, i32* %retval, align 4
  ret i32 %65
}

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_change_mbchar_case(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %wc = alloca i32, align 4
  %mb = alloca [17 x i8], align 1
  %mlen = alloca i32, align 4
  %p = alloca i32, align 4
  %m = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* @rl_point, align 4
  %call = call i32 @_rl_adjust_point(i8* %1, i32 %2, %struct.__mbstate_t* %ps)
  %cmp = icmp sgt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end45, %if.else21, %if.end
  %4 = load i32, i32* %count.addr, align 4
  %dec1 = add nsw i32 %4, -1
  store i32 %dec1, i32* %count.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %5 = load i32, i32* @rl_point, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp2 = icmp slt i32 %5, %6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* @rl_point, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i32, i32* @rl_end, align 4
  %11 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %10, %11
  %call3 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %ps)
  store i32 %call3, i32* %m, align 4
  %12 = load i32, i32* %m, align 4
  %cmp4 = icmp eq i32 %12, -1
  br i1 %cmp4, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %13 = load i32, i32* %m, align 4
  %cmp5 = icmp eq i32 %13, -2
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %lor.lhs.false, %while.body
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %16 to i32
  store i32 %conv, i32* %wc, align 4
  br label %if.end11

if.else:                                          ; preds = %lor.lhs.false
  %17 = load i32, i32* %m, align 4
  %cmp7 = icmp eq i32 %17, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.else
  store i32 0, i32* %wc, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then6
  %18 = load i32, i32* %wc, align 4
  %call12 = call i32 @iswupper(i32 %18)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %if.end11
  %19 = load i32, i32* %wc, align 4
  %call15 = call i32 @towlower(i32 %19)
  store i32 %call15, i32* %wc, align 4
  br label %if.end24

if.else16:                                        ; preds = %if.end11
  %20 = load i32, i32* %wc, align 4
  %call17 = call i32 @iswlower(i32 %20)
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.then19, label %if.else21

if.then19:                                        ; preds = %if.else16
  %21 = load i32, i32* %wc, align 4
  %call20 = call i32 @towupper(i32 %21)
  store i32 %call20, i32* %wc, align 4
  br label %if.end23

if.else21:                                        ; preds = %if.else16
  %call22 = call i32 @rl_forward_char(i32 1, i32 0)
  br label %while.cond

if.end23:                                         ; preds = %if.then19
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %if.then14
  %22 = load i32, i32* %wc, align 4
  %tobool25 = icmp ne i32 %22, 0
  br i1 %tobool25, label %if.then26, label %if.else43

if.then26:                                        ; preds = %if.end24
  %23 = load i32, i32* @rl_point, align 4
  store i32 %23, i32* %p, align 4
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %24 = load i32, i32* %wc, align 4
  %call27 = call i32 @wcrtomb(i8* %arraydecay, i32 %24, %struct.__mbstate_t* %ps)
  store i32 %call27, i32* %mlen, align 4
  %25 = load i32, i32* %mlen, align 4
  %cmp28 = icmp sge i32 %25, 0
  br i1 %cmp28, label %if.then30, label %if.end32

if.then30:                                        ; preds = %if.then26
  %26 = load i32, i32* %mlen, align 4
  %arrayidx31 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 %26
  store i8 0, i8* %arrayidx31, align 1
  br label %if.end32

if.end32:                                         ; preds = %if.then30, %if.then26
  %call33 = call i32 @rl_begin_undo_group()
  %call34 = call i32 @rl_vi_delete(i32 1, i32 0)
  %27 = load i32, i32* @rl_point, align 4
  %28 = load i32, i32* %p, align 4
  %cmp35 = icmp slt i32 %27, %28
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %if.end32
  %29 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %if.end32
  %arraydecay39 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %call40 = call i32 @rl_insert_text(i8* %arraydecay39)
  %call41 = call i32 @rl_end_undo_group()
  %call42 = call i32 @rl_vi_check()
  br label %if.end45

if.else43:                                        ; preds = %if.end24
  %call44 = call i32 @rl_forward_char(i32 1, i32 0)
  br label %if.end45

if.end45:                                         ; preds = %if.else43, %if.end38
  br label %while.cond

while.end:                                        ; preds = %land.end
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #2

declare i32 @rl_forward_char(i32, i32) #1

declare i32 @rl_begin_undo_group() #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_delete(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %end = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_rubout(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @__ctype_get_mb_cur_max()
  %cmp6 = icmp ugt i32 %call5, 1
  br i1 %cmp6, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end4
  %4 = load i32, i32* @rl_byte_oriented, align 4
  %cmp7 = icmp eq i32 %4, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %land.lhs.true
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %count.addr, align 4
  %call9 = call i32 @_rl_find_next_mbchar(i8* %5, i32 %6, i32 %7, i32 1)
  store i32 %call9, i32* %end, align 4
  br label %if.end10

if.else:                                          ; preds = %land.lhs.true, %if.end4
  %8 = load i32, i32* @rl_point, align 4
  %9 = load i32, i32* %count.addr, align 4
  %add = add nsw i32 %8, %9
  store i32 %add, i32* %end, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then8
  %10 = load i32, i32* %end, align 4
  %11 = load i32, i32* @rl_end, align 4
  %cmp11 = icmp sge i32 %10, %11
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  %12 = load i32, i32* @rl_end, align 4
  store i32 %12, i32* %end, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end10
  %13 = load i32, i32* @rl_point, align 4
  %14 = load i32, i32* %end, align 4
  %call14 = call i32 @rl_kill_text(i32 %13, i32 %14)
  %15 = load i32, i32* @rl_point, align 4
  %cmp15 = icmp sgt i32 %15, 0
  br i1 %cmp15, label %land.lhs.true16, label %if.end20

land.lhs.true16:                                  ; preds = %if.end13
  %16 = load i32, i32* @rl_point, align 4
  %17 = load i32, i32* @rl_end, align 4
  %cmp17 = icmp eq i32 %16, %17
  br i1 %cmp17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %land.lhs.true16
  %18 = load i32, i32* %key.addr, align 4
  %call19 = call i32 @rl_backward_char(i32 1, i32 %18)
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %land.lhs.true16, %if.end13
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end20, %if.then2, %if.then
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

declare i32 @_rl_insert_char(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_check() #0 {
entry:
  %0 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp = icmp eq i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %land.lhs.true
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp1 = icmp ugt i32 %call, 1
  br i1 %cmp1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %if.then
  %3 = load i32, i32* @rl_byte_oriented, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %land.lhs.true2
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %call5 = call i32 @_rl_find_prev_mbchar(i8* %4, i32 %5, i32 1)
  store i32 %call5, i32* @rl_point, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true2, %if.then
  %6 = load i32, i32* @rl_point, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %land.lhs.true, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_put(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.lhs.true, label %land.lhs.true5

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %key.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isupper(i32 %conv4) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %land.lhs.true5

land.lhs.true5:                                   ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @rl_point, align 4
  %add = add nsw i32 %3, 1
  %4 = load i32, i32* @rl_end, align 4
  %cmp6 = icmp sle i32 %add, %4
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %call8 = call i32 @_rl_find_next_mbchar(i8* %5, i32 %6, i32 1, i32 1)
  store i32 %call8, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true5, %land.lhs.true
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %7 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool9 = icmp ne i32 %7, 0
  br i1 %tobool9, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %key.addr, align 4
  %call10 = call i32 @rl_yank(i32 1, i32 %8)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load i32, i32* %key.addr, align 4
  %call11 = call i32 @rl_backward_char(i32 1, i32 %9)
  ret i32 0
}

declare i32 @_rl_find_next_mbchar(i8*, i32, i32, i32) #1

declare i32 @rl_yank(i32, i32) #1

declare i32 @_rl_find_prev_mbchar(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_column(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_end_of_line(i32 1, i32 %2)
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 %3, 1
  store i32 %sub, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @_rl_vi_domove_motion_cleanup(i32 %c, %struct.__rl_vimotion_context* %m) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %r = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %end = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 6
  %1 = load i32, i32* %end, align 4
  store i32 %1, i32* @rl_end, align 4
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %3 = load i32, i32* @rl_end, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  store i8 0, i8* %arrayidx, align 1
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* @rl_end, align 4
  %cmp = icmp sgt i32 %4, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i32, i32* @rl_end, align 4
  store i32 %6, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* @rl_mark, align 4
  %8 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp eq i32 %7, %8
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %9 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %9, -1048577
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %10 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %10 to i8
  %conv4 = zext i8 %conv to i32
  %11 = load i32, i32* %c.addr, align 4
  %cmp5 = icmp eq i32 %conv4, %11
  br i1 %cmp5, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end3
  %12 = load i32, i32* %c.addr, align 4
  %conv7 = trunc i32 %12 to i8
  %conv8 = zext i8 %conv7 to i32
  %call = call i32 @islower(i32 %conv8) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %c.addr, align 4
  %conv9 = trunc i32 %13 to i8
  %conv10 = zext i8 %conv9 to i32
  %call11 = call i32 @toupper(i32 %conv10) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.end3
  %14 = load i32, i32* %c.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call11, %cond.true ], [ %14, %cond.false ]
  %cmp12 = icmp eq i32 %cond, 87
  br i1 %cmp12, label %land.lhs.true14, label %if.end30

land.lhs.true14:                                  ; preds = %cond.end
  %15 = load i32, i32* @rl_point, align 4
  %16 = load i32, i32* @rl_end, align 4
  %cmp15 = icmp slt i32 %15, %16
  br i1 %cmp15, label %land.lhs.true17, label %if.end30

land.lhs.true17:                                  ; preds = %land.lhs.true14
  %17 = load i32, i32* @rl_point, align 4
  %18 = load i32, i32* @rl_mark, align 4
  %cmp18 = icmp sgt i32 %17, %18
  br i1 %cmp18, label %land.lhs.true20, label %if.end30

land.lhs.true20:                                  ; preds = %land.lhs.true17
  %19 = load i8*, i8** @rl_line_buffer, align 4
  %20 = load i32, i32* @rl_point, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %21 to i32
  %cmp23 = icmp eq i32 %conv22, 32
  br i1 %cmp23, label %if.end30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true20
  %22 = load i8*, i8** @rl_line_buffer, align 4
  %23 = load i32, i32* @rl_point, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %22, i32 %23
  %24 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %24 to i32
  %cmp27 = icmp eq i32 %conv26, 9
  br i1 %cmp27, label %if.end30, label %if.then29

if.then29:                                        ; preds = %lor.lhs.false
  %25 = load i32, i32* @rl_point, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, i32* @rl_point, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %lor.lhs.false, %land.lhs.true20, %land.lhs.true17, %land.lhs.true14, %cond.end
  %26 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %26, i32 0, i32 7
  %27 = load i32, i32* %key, align 4
  %cmp31 = icmp eq i32 %27, 99
  br i1 %cmp31, label %land.lhs.true33, label %if.end89

land.lhs.true33:                                  ; preds = %if.end30
  %28 = load i32, i32* @rl_point, align 4
  %29 = load i32, i32* @rl_mark, align 4
  %cmp34 = icmp sge i32 %28, %29
  br i1 %cmp34, label %land.lhs.true36, label %if.end89

land.lhs.true36:                                  ; preds = %land.lhs.true33
  %30 = load i32, i32* %c.addr, align 4
  %conv37 = trunc i32 %30 to i8
  %conv38 = zext i8 %conv37 to i32
  %31 = load i32, i32* %c.addr, align 4
  %cmp39 = icmp eq i32 %conv38, %31
  br i1 %cmp39, label %land.lhs.true41, label %cond.false50

land.lhs.true41:                                  ; preds = %land.lhs.true36
  %32 = load i32, i32* %c.addr, align 4
  %conv42 = trunc i32 %32 to i8
  %conv43 = zext i8 %conv42 to i32
  %call44 = call i32 @islower(i32 %conv43) #4
  %tobool45 = icmp ne i32 %call44, 0
  br i1 %tobool45, label %cond.true46, label %cond.false50

cond.true46:                                      ; preds = %land.lhs.true41
  %33 = load i32, i32* %c.addr, align 4
  %conv47 = trunc i32 %33 to i8
  %conv48 = zext i8 %conv47 to i32
  %call49 = call i32 @toupper(i32 %conv48) #4
  br label %cond.end51

cond.false50:                                     ; preds = %land.lhs.true41, %land.lhs.true36
  %34 = load i32, i32* %c.addr, align 4
  br label %cond.end51

cond.end51:                                       ; preds = %cond.false50, %cond.true46
  %cond52 = phi i32 [ %call49, %cond.true46 ], [ %34, %cond.false50 ]
  %cmp53 = icmp eq i32 %cond52, 87
  br i1 %cmp53, label %if.then55, label %if.end89

if.then55:                                        ; preds = %cond.end51
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then55
  %35 = load i32, i32* @rl_point, align 4
  %36 = load i32, i32* @rl_mark, align 4
  %cmp56 = icmp sgt i32 %35, %36
  br i1 %cmp56, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %37 = load i8*, i8** @rl_line_buffer, align 4
  %38 = load i32, i32* @rl_point, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %39 to i32
  %cmp60 = icmp eq i32 %conv59, 32
  br i1 %cmp60, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %40 = load i8*, i8** @rl_line_buffer, align 4
  %41 = load i32, i32* @rl_point, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %40, i32 %41
  %42 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %42 to i32
  %cmp64 = icmp eq i32 %conv63, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %43 = phi i1 [ true, %land.rhs ], [ %cmp64, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %44 = phi i1 [ false, %while.cond ], [ %43, %lor.end ]
  br i1 %44, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %45 = load i32, i32* @rl_point, align 4
  %dec66 = add nsw i32 %45, -1
  store i32 %dec66, i32* @rl_point, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %46 = load i32, i32* @rl_point, align 4
  %47 = load i32, i32* @rl_mark, align 4
  %cmp67 = icmp eq i32 %46, %47
  br i1 %cmp67, label %if.then69, label %if.else

if.then69:                                        ; preds = %while.end
  %48 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %48, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end88

if.else:                                          ; preds = %while.end
  %49 = load i32, i32* @rl_point, align 4
  %cmp70 = icmp sge i32 %49, 0
  br i1 %cmp70, label %land.lhs.true72, label %if.end87

land.lhs.true72:                                  ; preds = %if.else
  %50 = load i32, i32* @rl_point, align 4
  %51 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %51, 1
  %cmp73 = icmp slt i32 %50, %sub
  br i1 %cmp73, label %land.lhs.true75, label %if.end87

land.lhs.true75:                                  ; preds = %land.lhs.true72
  %52 = load i8*, i8** @rl_line_buffer, align 4
  %53 = load i32, i32* @rl_point, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %54 to i32
  %cmp78 = icmp eq i32 %conv77, 32
  br i1 %cmp78, label %if.end87, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %land.lhs.true75
  %55 = load i8*, i8** @rl_line_buffer, align 4
  %56 = load i32, i32* @rl_point, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %55, i32 %56
  %57 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %57 to i32
  %cmp83 = icmp eq i32 %conv82, 9
  br i1 %cmp83, label %if.end87, label %if.then85

if.then85:                                        ; preds = %lor.lhs.false80
  %58 = load i32, i32* @rl_point, align 4
  %inc86 = add nsw i32 %58, 1
  store i32 %inc86, i32* @rl_point, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.then85, %lor.lhs.false80, %land.lhs.true75, %land.lhs.true72, %if.else
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %if.then69
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %cond.end51, %land.lhs.true33, %if.end30
  %59 = load i32, i32* @rl_mark, align 4
  %60 = load i32, i32* @rl_point, align 4
  %cmp90 = icmp slt i32 %59, %60
  br i1 %cmp90, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end89
  br label %do.body

do.body:                                          ; preds = %if.then92
  %61 = load i32, i32* @rl_point, align 4
  store i32 %61, i32* %t, align 4
  %62 = load i32, i32* @rl_mark, align 4
  store i32 %62, i32* @rl_point, align 4
  %63 = load i32, i32* %t, align 4
  store i32 %63, i32* @rl_mark, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end93

if.end93:                                         ; preds = %do.end, %if.end89
  %64 = load i32, i32* @rl_readline_state, align 4
  %and94 = and i32 %64, 524288
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end93
  %65 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %65()
  br label %if.end97

if.end97:                                         ; preds = %if.then96, %if.end93
  %66 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call98 = call i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %66)
  store i32 %call98, i32* %r, align 4
  %67 = load i32, i32* %r, align 4
  store i32 %67, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end97, %if.then2
  %68 = load i32, i32* %retval, align 4
  ret i32 %68
}

; Function Attrs: noinline nounwind
define internal i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %r = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %op = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 0
  %1 = load i32, i32* %op, align 4
  switch i32 %1, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb1
    i32 4, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call = call i32 @vi_delete_dispatch(%struct.__rl_vimotion_context* %2)
  store i32 %call, i32* %r, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call2 = call i32 @vi_change_dispatch(%struct.__rl_vimotion_context* %3)
  store i32 %call2, i32* %r, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %4 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call4 = call i32 @vi_yank_dispatch(%struct.__rl_vimotion_context* %4)
  store i32 %call4, i32* %r, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %5 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %op5 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %5, i32 0, i32 0
  %6 = load i32, i32* %op5, align 4
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i32 0, i32 0), i32 %6)
  store i32 1, i32* %r, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb3, %sw.bb1, %sw.bb
  %7 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %7, -1048577
  store i32 %and, i32* @rl_readline_state, align 4
  %8 = load i32, i32* %r, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @_rl_vi_domove_callback(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %retval = alloca i32, align 4
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call = call i32 @rl_vi_domove_getchar(%struct.__rl_vimotion_context* %0)
  store i32 %call, i32* %c, align 4
  %1 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %1, i32 0, i32 8
  store i32 %call, i32* %motion, align 4
  %2 = load i32, i32* %c, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call1 = call i32 @rl_domove_read_callback(%struct.__rl_vimotion_context* %3)
  store i32 %call1, i32* %r, align 4
  %4 = load i32, i32* %r, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %5 = load i32, i32* %r, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @rl_vi_domove_getchar(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %c = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %c, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %2 = load i32, i32* %c, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define internal i32 @rl_domove_read_callback(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %retval = alloca i32, align 4
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %c = alloca i32, align 4
  %save = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 8
  %1 = load i32, i32* %motion, align 4
  store i32 %1, i32* %c, align 4
  %2 = load i32, i32* %c, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i32, i32* %c, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0), i32 %3)
  %cmp = icmp ne i8* %call, null
  br i1 %cmp, label %if.then, label %if.else

cond.false:                                       ; preds = %entry
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %cond.false, %cond.true
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, 524288
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %5 = load i32, i32* @rl_readline_state, align 4
  %and2 = and i32 %5, 1048576
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load i32, i32* @rl_readline_state, align 4
  %and5 = and i32 %6, 1024
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %land.lhs.true4
  %7 = load i32, i32* @rl_readline_state, align 4
  %and8 = and i32 %7, -1025
  store i32 %and8, i32* @rl_readline_state, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %land.lhs.true4, %land.lhs.true, %if.then
  %8 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call9 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %8)
  store i32 %call9, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %cond.false, %cond.true
  %9 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %9, i32 0, i32 7
  %10 = load i32, i32* %key, align 4
  %11 = load i32, i32* %c, align 4
  %cmp10 = icmp eq i32 %10, %11
  br i1 %cmp10, label %land.lhs.true11, label %if.else23

land.lhs.true11:                                  ; preds = %if.else
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key12 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 7
  %13 = load i32, i32* %key12, align 4
  %cmp13 = icmp eq i32 %13, 100
  br i1 %cmp13, label %if.then19, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true11
  %14 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key14 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %14, i32 0, i32 7
  %15 = load i32, i32* %key14, align 4
  %cmp15 = icmp eq i32 %15, 121
  br i1 %cmp15, label %if.then19, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false
  %16 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key17 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %16, i32 0, i32 7
  %17 = load i32, i32* %key17, align 4
  %cmp18 = icmp eq i32 %17, 99
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %lor.lhs.false16, %lor.lhs.false, %land.lhs.true11
  %18 = load i32, i32* @rl_end, align 4
  store i32 %18, i32* @rl_mark, align 4
  %19 = load i32, i32* %c, align 4
  %call20 = call i32 @rl_beg_of_line(i32 1, i32 %19)
  %20 = load i32, i32* %c, align 4
  store i32 %20, i32* @_rl_vi_last_motion, align 4
  %21 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %21, -1048577
  store i32 %and21, i32* @rl_readline_state, align 4
  %22 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call22 = call i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %22)
  store i32 %call22, i32* %retval, align 4
  br label %return

if.else23:                                        ; preds = %lor.lhs.false16, %if.else
  %23 = load i32, i32* %c, align 4
  %cmp24 = icmp sge i32 %23, 48
  br i1 %cmp24, label %land.lhs.true25, label %if.else38

land.lhs.true25:                                  ; preds = %if.else23
  %24 = load i32, i32* %c, align 4
  %cmp26 = icmp sle i32 %24, 57
  br i1 %cmp26, label %land.lhs.true27, label %if.else38

land.lhs.true27:                                  ; preds = %land.lhs.true25
  %25 = load i32, i32* @rl_readline_state, align 4
  %and28 = and i32 %25, 524288
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %land.lhs.true30, label %if.else38

land.lhs.true30:                                  ; preds = %land.lhs.true27
  %26 = load i32, i32* @rl_readline_state, align 4
  %and31 = and i32 %26, 1048576
  %tobool32 = icmp ne i32 %and31, 0
  br i1 %tobool32, label %land.lhs.true33, label %if.else38

land.lhs.true33:                                  ; preds = %land.lhs.true30
  %27 = load i32, i32* @rl_readline_state, align 4
  %and34 = and i32 %27, 1024
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %if.then36, label %if.else38

if.then36:                                        ; preds = %land.lhs.true33
  %28 = load i32, i32* %c, align 4
  %call37 = call i32 @_rl_vi_arg_dispatch(i32 %28)
  store i32 %call37, i32* %retval, align 4
  br label %return

if.else38:                                        ; preds = %land.lhs.true33, %land.lhs.true30, %land.lhs.true27, %land.lhs.true25, %if.else23
  %29 = load i32, i32* %c, align 4
  %cmp39 = icmp sge i32 %29, 48
  br i1 %cmp39, label %land.lhs.true40, label %if.else53

land.lhs.true40:                                  ; preds = %if.else38
  %30 = load i32, i32* %c, align 4
  %cmp41 = icmp sle i32 %30, 57
  br i1 %cmp41, label %land.lhs.true42, label %if.else53

land.lhs.true42:                                  ; preds = %land.lhs.true40
  %31 = load i32, i32* @rl_readline_state, align 4
  %and43 = and i32 %31, 524288
  %tobool44 = icmp ne i32 %and43, 0
  br i1 %tobool44, label %land.lhs.true45, label %if.else53

land.lhs.true45:                                  ; preds = %land.lhs.true42
  %32 = load i32, i32* @rl_readline_state, align 4
  %and46 = and i32 %32, 1048576
  %tobool47 = icmp ne i32 %and46, 0
  br i1 %tobool47, label %land.lhs.true48, label %if.else53

land.lhs.true48:                                  ; preds = %land.lhs.true45
  %33 = load i32, i32* @rl_readline_state, align 4
  %and49 = and i32 %33, 1024
  %cmp50 = icmp eq i32 %and49, 0
  br i1 %cmp50, label %if.then51, label %if.else53

if.then51:                                        ; preds = %land.lhs.true48
  %34 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %34, 1024
  store i32 %or, i32* @rl_readline_state, align 4
  %35 = load i32, i32* %c, align 4
  %call52 = call i32 @_rl_vi_arg_dispatch(i32 %35)
  store i32 %call52, i32* %retval, align 4
  br label %return

if.else53:                                        ; preds = %land.lhs.true48, %land.lhs.true45, %land.lhs.true42, %land.lhs.true40, %if.else38
  %36 = load i32, i32* %c, align 4
  %cmp54 = icmp sge i32 %36, 48
  br i1 %cmp54, label %land.lhs.true55, label %if.else67

land.lhs.true55:                                  ; preds = %if.else53
  %37 = load i32, i32* %c, align 4
  %cmp56 = icmp sle i32 %37, 57
  br i1 %cmp56, label %if.then57, label %if.else67

if.then57:                                        ; preds = %land.lhs.true55
  %38 = load i32, i32* @rl_numeric_arg, align 4
  store i32 %38, i32* %save, align 4
  %39 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %39, 48
  store i32 %sub, i32* @rl_numeric_arg, align 4
  store i32 1, i32* @rl_explicit_arg, align 4
  %40 = load i32, i32* @rl_readline_state, align 4
  %or58 = or i32 %40, 1024
  store i32 %or58, i32* @rl_readline_state, align 4
  %call59 = call i32 @rl_digit_loop1()
  %41 = load i32, i32* %save, align 4
  %42 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %42, %41
  store i32 %mul, i32* @rl_numeric_arg, align 4
  %43 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call60 = call i32 @rl_vi_domove_getchar(%struct.__rl_vimotion_context* %43)
  store i32 %call60, i32* %c, align 4
  %44 = load i32, i32* %c, align 4
  %cmp61 = icmp slt i32 %44, 0
  br i1 %cmp61, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.then57
  %45 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion63 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %45, i32 0, i32 8
  store i32 0, i32* %motion63, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end64:                                         ; preds = %if.then57
  %46 = load i32, i32* %c, align 4
  %47 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion65 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %47, i32 0, i32 8
  store i32 %46, i32* %motion65, align 4
  %48 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call66 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %48)
  store i32 %call66, i32* %retval, align 4
  br label %return

if.else67:                                        ; preds = %land.lhs.true55, %if.else53
  %49 = load i32, i32* @rl_readline_state, align 4
  %and68 = and i32 %49, -1048577
  store i32 %and68, i32* @rl_readline_state, align 4
  %50 = load i32, i32* @rl_readline_state, align 4
  %and69 = and i32 %50, -1025
  store i32 %and69, i32* @rl_readline_state, align 4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else67, %if.end64, %if.then62, %if.then51, %if.then36, %if.then19, %if.end
  %51 = load i32, i32* %retval, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_domove(i32 %x, i32* %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %ignore.addr = alloca i32*, align 4
  %r = alloca i32, align 4
  %m = alloca %struct.__rl_vimotion_context*, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32* %ignore, i32** %ignore.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  store %struct.__rl_vimotion_context* %0, %struct.__rl_vimotion_context** %m, align 4
  %1 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %call = call i32 @rl_vi_domove_getchar(%struct.__rl_vimotion_context* %1)
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %2, i32 0, i32 8
  store i32 %call, i32* %motion, align 4
  %3 = load i32*, i32** %ignore.addr, align 4
  store i32 %call, i32* %3, align 4
  %4 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %motion1 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %4, i32 0, i32 8
  %5 = load i32, i32* %motion1, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %motion2 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %6, i32 0, i32 8
  store i32 0, i32* %motion2, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %call3 = call i32 @rl_domove_read_callback(%struct.__rl_vimotion_context* %7)
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_delete_to(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call %struct.__rl_vimotion_context* @_rl_mvcxt_alloc(i32 1, i32 %0)
  store %struct.__rl_vimotion_context* %call, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %1 = load i32, i32* @rl_point, align 4
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %2, i32 0, i32 5
  store i32 %1, i32* %start, align 4
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* @rl_mark, align 4
  %4 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %4 to i8
  %conv1 = zext i8 %conv to i32
  %5 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %conv1, %5
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %6 = load i32, i32* %key.addr, align 4
  %conv3 = trunc i32 %6 to i8
  %conv4 = zext i8 %conv3 to i32
  %call5 = call i32 @isupper(i32 %conv4) #4
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %7 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %7, i32 0, i32 8
  store i32 36, i32* %motion, align 4
  %8 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call6 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %8)
  store i32 %call6, i32* %r, align 4
  br label %if.end28

if.else:                                          ; preds = %land.lhs.true, %entry
  %9 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %land.lhs.true8, label %if.else14

land.lhs.true8:                                   ; preds = %if.else
  %10 = load i32, i32* @_rl_vi_last_motion, align 4
  %cmp9 = icmp ne i32 %10, 100
  br i1 %cmp9, label %if.then11, label %if.else14

if.then11:                                        ; preds = %land.lhs.true8
  %11 = load i32, i32* @_rl_vi_last_motion, align 4
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion12 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 8
  store i32 %11, i32* %motion12, align 4
  %13 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call13 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %13)
  store i32 %call13, i32* %r, align 4
  br label %if.end27

if.else14:                                        ; preds = %land.lhs.true8, %if.else
  %14 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %if.then16, label %if.else20

if.then16:                                        ; preds = %if.else14
  %15 = load i32, i32* @_rl_vi_last_motion, align 4
  %16 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion17 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %16, i32 0, i32 8
  store i32 %15, i32* %motion17, align 4
  %17 = load i32, i32* @rl_end, align 4
  store i32 %17, i32* @rl_mark, align 4
  %18 = load i32, i32* %key.addr, align 4
  %call18 = call i32 @rl_beg_of_line(i32 1, i32 %18)
  %19 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %19, -1048577
  store i32 %and, i32* @rl_readline_state, align 4
  %20 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call19 = call i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %20)
  store i32 %call19, i32* %r, align 4
  br label %if.end26

if.else20:                                        ; preds = %if.else14
  %21 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %21, 524288
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else20
  %22 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %22, 1048576
  store i32 %or, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else24:                                        ; preds = %if.else20
  %23 = load i32, i32* %key.addr, align 4
  %call25 = call i32 @rl_vi_domove(i32 %23, i32* %c)
  store i32 %call25, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else24
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then16
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then11
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then
  %24 = load i32, i32* %r, align 4
  %cmp29 = icmp slt i32 %24, 0
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end28
  %call32 = call i32 @rl_ding()
  store i32 -1, i32* %r, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end28
  %25 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  call void @_rl_mvcxt_dispose(%struct.__rl_vimotion_context* %25)
  store %struct.__rl_vimotion_context* null, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %26 = load i32, i32* %r, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then23
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind
define internal %struct.__rl_vimotion_context* @_rl_mvcxt_alloc(i32 %op, i32 %key) #0 {
entry:
  %op.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %m = alloca %struct.__rl_vimotion_context*, align 4
  store i32 %op, i32* %op.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i8* @xmalloc(i32 36)
  %0 = bitcast i8* %call to %struct.__rl_vimotion_context*
  store %struct.__rl_vimotion_context* %0, %struct.__rl_vimotion_context** %m, align 4
  %1 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  %2 = load i32, i32* %op.addr, align 4
  %3 = load i32, i32* %key.addr, align 4
  call void @_rl_mvcxt_init(%struct.__rl_vimotion_context* %1, i32 %2, i32 %3)
  %4 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m, align 4
  ret %struct.__rl_vimotion_context* %4
}

; Function Attrs: noinline nounwind
define internal i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %retval = alloca i32, align 4
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %c = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 8
  %1 = load i32, i32* %motion, align 4
  store i32 %1, i32* %c, align 4
  store i32 %1, i32* @_rl_vi_last_motion, align 4
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %3 = load i32, i32* @rl_end, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @rl_end, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  store i8 32, i8* %arrayidx, align 1
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_end, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 %5
  store i8 0, i8* %arrayidx1, align 1
  %6 = load i32, i32* %c, align 4
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call = call i32 @_rl_dispatch(i32 %6, %struct._keymap_entry* %7)
  %8 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %8, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load i32, i32* @rl_readline_state, align 4
  %and2 = and i32 %9, 8388608
  %tobool3 = icmp ne i32 %and2, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %10 = load i32, i32* %c, align 4
  %11 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call5 = call i32 @_rl_vi_domove_motion_cleanup(i32 %10, %struct.__rl_vimotion_context* %11)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %12 = load i32, i32* %c, align 4
  %13 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %call6 = call i32 @_rl_vi_domove_motion_cleanup(i32 %12, %struct.__rl_vimotion_context* %13)
  store i32 %call6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.else, %if.then4
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define internal void @_rl_mvcxt_dispose(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %1 = bitcast %struct.__rl_vimotion_context* %0 to i8*
  call void @xfree(i8* %1)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_change_to(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call %struct.__rl_vimotion_context* @_rl_mvcxt_alloc(i32 2, i32 %0)
  store %struct.__rl_vimotion_context* %call, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %1 = load i32, i32* @rl_point, align 4
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %2, i32 0, i32 5
  store i32 %1, i32* %start, align 4
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* @rl_mark, align 4
  %4 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %4 to i8
  %conv1 = zext i8 %conv to i32
  %5 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %conv1, %5
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %6 = load i32, i32* %key.addr, align 4
  %conv3 = trunc i32 %6 to i8
  %conv4 = zext i8 %conv3 to i32
  %call5 = call i32 @isupper(i32 %conv4) #4
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %7 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %7, i32 0, i32 8
  store i32 36, i32* %motion, align 4
  %8 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call6 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %8)
  store i32 %call6, i32* %r, align 4
  br label %if.end28

if.else:                                          ; preds = %land.lhs.true, %entry
  %9 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %land.lhs.true8, label %if.else14

land.lhs.true8:                                   ; preds = %if.else
  %10 = load i32, i32* @_rl_vi_last_motion, align 4
  %cmp9 = icmp ne i32 %10, 99
  br i1 %cmp9, label %if.then11, label %if.else14

if.then11:                                        ; preds = %land.lhs.true8
  %11 = load i32, i32* @_rl_vi_last_motion, align 4
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion12 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 8
  store i32 %11, i32* %motion12, align 4
  %13 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call13 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %13)
  store i32 %call13, i32* %r, align 4
  br label %if.end27

if.else14:                                        ; preds = %land.lhs.true8, %if.else
  %14 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %if.then16, label %if.else20

if.then16:                                        ; preds = %if.else14
  %15 = load i32, i32* @_rl_vi_last_motion, align 4
  %16 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion17 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %16, i32 0, i32 8
  store i32 %15, i32* %motion17, align 4
  %17 = load i32, i32* @rl_end, align 4
  store i32 %17, i32* @rl_mark, align 4
  %18 = load i32, i32* %key.addr, align 4
  %call18 = call i32 @rl_beg_of_line(i32 1, i32 %18)
  %19 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %19, -1048577
  store i32 %and, i32* @rl_readline_state, align 4
  %20 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call19 = call i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %20)
  store i32 %call19, i32* %r, align 4
  br label %if.end26

if.else20:                                        ; preds = %if.else14
  %21 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %21, 524288
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else20
  %22 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %22, 1048576
  store i32 %or, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else24:                                        ; preds = %if.else20
  %23 = load i32, i32* %key.addr, align 4
  %call25 = call i32 @rl_vi_domove(i32 %23, i32* %c)
  store i32 %call25, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else24
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then16
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then11
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then
  %24 = load i32, i32* %r, align 4
  %cmp29 = icmp slt i32 %24, 0
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end28
  %call32 = call i32 @rl_ding()
  store i32 -1, i32* %r, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end28
  %25 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  call void @_rl_mvcxt_dispose(%struct.__rl_vimotion_context* %25)
  store %struct.__rl_vimotion_context* null, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %26 = load i32, i32* %r, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then23
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_yank_to(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call %struct.__rl_vimotion_context* @_rl_mvcxt_alloc(i32 4, i32 %0)
  store %struct.__rl_vimotion_context* %call, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %1 = load i32, i32* @rl_point, align 4
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %2, i32 0, i32 5
  store i32 %1, i32* %start, align 4
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* @rl_mark, align 4
  %4 = load i32, i32* %key.addr, align 4
  %conv = trunc i32 %4 to i8
  %conv1 = zext i8 %conv to i32
  %5 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %conv1, %5
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %6 = load i32, i32* %key.addr, align 4
  %conv3 = trunc i32 %6 to i8
  %conv4 = zext i8 %conv3 to i32
  %call5 = call i32 @isupper(i32 %conv4) #4
  %tobool = icmp ne i32 %call5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %7 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %7, i32 0, i32 8
  store i32 36, i32* %motion, align 4
  %8 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call6 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %8)
  store i32 %call6, i32* %r, align 4
  br label %if.end28

if.else:                                          ; preds = %land.lhs.true, %entry
  %9 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %land.lhs.true8, label %if.else14

land.lhs.true8:                                   ; preds = %if.else
  %10 = load i32, i32* @_rl_vi_last_motion, align 4
  %cmp9 = icmp ne i32 %10, 121
  br i1 %cmp9, label %if.then11, label %if.else14

if.then11:                                        ; preds = %land.lhs.true8
  %11 = load i32, i32* @_rl_vi_last_motion, align 4
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion12 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 8
  store i32 %11, i32* %motion12, align 4
  %13 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call13 = call i32 @rl_domove_motion_callback(%struct.__rl_vimotion_context* %13)
  store i32 %call13, i32* %r, align 4
  br label %if.end27

if.else14:                                        ; preds = %land.lhs.true8, %if.else
  %14 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %if.then16, label %if.else20

if.then16:                                        ; preds = %if.else14
  %15 = load i32, i32* @_rl_vi_last_motion, align 4
  %16 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %motion17 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %16, i32 0, i32 8
  store i32 %15, i32* %motion17, align 4
  %17 = load i32, i32* @rl_end, align 4
  store i32 %17, i32* @rl_mark, align 4
  %18 = load i32, i32* %key.addr, align 4
  %call18 = call i32 @rl_beg_of_line(i32 1, i32 %18)
  %19 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %19, -1048577
  store i32 %and, i32* @rl_readline_state, align 4
  %20 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %call19 = call i32 @vidomove_dispatch(%struct.__rl_vimotion_context* %20)
  store i32 %call19, i32* %r, align 4
  br label %if.end26

if.else20:                                        ; preds = %if.else14
  %21 = load i32, i32* @rl_readline_state, align 4
  %and21 = and i32 %21, 524288
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else24

if.then23:                                        ; preds = %if.else20
  %22 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %22, 1048576
  store i32 %or, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else24:                                        ; preds = %if.else20
  %23 = load i32, i32* %key.addr, align 4
  %call25 = call i32 @rl_vi_domove(i32 %23, i32* %c)
  store i32 %call25, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else24
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then16
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then11
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then
  %24 = load i32, i32* %r, align 4
  %cmp29 = icmp slt i32 %24, 0
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end28
  %call32 = call i32 @rl_ding()
  store i32 -1, i32* %r, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end28
  %25 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  call void @_rl_mvcxt_dispose(%struct.__rl_vimotion_context* %25)
  store %struct.__rl_vimotion_context* null, %struct.__rl_vimotion_context** @_rl_vimvcxt, align 4
  %26 = load i32, i32* %r, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end33, %if.then23
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_rubout(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %opoint = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_delete(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* @rl_point, align 4
  store i32 %4, i32* %opoint, align 4
  %5 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp sgt i32 %5, 1
  br i1 %cmp5, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end4
  %call6 = call i32 @__ctype_get_mb_cur_max()
  %cmp7 = icmp ugt i32 %call6, 1
  br i1 %cmp7, label %land.lhs.true8, label %if.else

land.lhs.true8:                                   ; preds = %land.lhs.true
  %6 = load i32, i32* @rl_byte_oriented, align 4
  %cmp9 = icmp eq i32 %6, 0
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %land.lhs.true8
  %7 = load i32, i32* %count.addr, align 4
  %8 = load i32, i32* %key.addr, align 4
  %call11 = call i32 @rl_backward_char(i32 %7, i32 %8)
  br label %if.end21

if.else:                                          ; preds = %land.lhs.true8, %land.lhs.true, %if.end4
  %call12 = call i32 @__ctype_get_mb_cur_max()
  %cmp13 = icmp ugt i32 %call12, 1
  br i1 %cmp13, label %land.lhs.true14, label %if.else18

land.lhs.true14:                                  ; preds = %if.else
  %9 = load i32, i32* @rl_byte_oriented, align 4
  %cmp15 = icmp eq i32 %9, 0
  br i1 %cmp15, label %if.then16, label %if.else18

if.then16:                                        ; preds = %land.lhs.true14
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* @rl_point, align 4
  %call17 = call i32 @_rl_find_prev_mbchar(i8* %10, i32 %11, i32 1)
  store i32 %call17, i32* @rl_point, align 4
  br label %if.end20

if.else18:                                        ; preds = %land.lhs.true14, %if.else
  %12 = load i32, i32* %count.addr, align 4
  %13 = load i32, i32* @rl_point, align 4
  %sub19 = sub nsw i32 %13, %12
  store i32 %sub19, i32* @rl_point, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else18, %if.then16
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then10
  %14 = load i32, i32* @rl_point, align 4
  %cmp22 = icmp slt i32 %14, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end21
  store i32 0, i32* @rl_point, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end21
  %15 = load i32, i32* @rl_point, align 4
  %16 = load i32, i32* %opoint, align 4
  %call25 = call i32 @rl_kill_text(i32 %15, i32 %16)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.then2, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @rl_kill_text(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_unix_word_rubout(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  br label %if.end171

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  store i32 %1, i32* %orig_point, align 4
  %2 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp sle i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %count.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %while.cond

while.cond:                                       ; preds = %if.end168, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end169

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @rl_point, align 4
  %cmp3 = icmp sgt i32 %4, 0
  br i1 %cmp3, label %land.lhs.true, label %if.end30

land.lhs.true:                                    ; preds = %while.body
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %land.lhs.true6, label %if.end30

land.lhs.true6:                                   ; preds = %land.lhs.true
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %9, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i32 %sub
  %10 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 32
  br i1 %cmp9, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true6
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* @rl_point, align 4
  %sub11 = sub nsw i32 %12, 1
  %arrayidx12 = getelementptr inbounds i8, i8* %11, i32 %sub11
  %13 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %13 to i32
  %cmp14 = icmp eq i32 %conv13, 9
  br i1 %cmp14, label %if.then16, label %if.end30

if.then16:                                        ; preds = %lor.lhs.false, %land.lhs.true6
  br label %while.cond17

while.cond17:                                     ; preds = %while.body29, %if.then16
  %14 = load i32, i32* @rl_point, align 4
  %dec18 = add nsw i32 %14, -1
  store i32 %dec18, i32* @rl_point, align 4
  %cmp19 = icmp sgt i32 %dec18, 0
  br i1 %cmp19, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond17
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* @rl_point, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %17 to i32
  %cmp23 = icmp eq i32 %conv22, 32
  br i1 %cmp23, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %19 = load i32, i32* @rl_point, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %20 to i32
  %cmp27 = icmp eq i32 %conv26, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %21 = phi i1 [ true, %land.rhs ], [ %cmp27, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond17
  %22 = phi i1 [ false, %while.cond17 ], [ %21, %lor.end ]
  br i1 %22, label %while.body29, label %while.end

while.body29:                                     ; preds = %land.end
  br label %while.cond17

while.end:                                        ; preds = %land.end
  br label %if.end30

if.end30:                                         ; preds = %while.end, %lor.lhs.false, %land.lhs.true, %while.body
  %23 = load i32, i32* @rl_point, align 4
  %cmp31 = icmp sgt i32 %23, 0
  br i1 %cmp31, label %land.lhs.true33, label %if.end71

land.lhs.true33:                                  ; preds = %if.end30
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* @rl_point, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %26 to i32
  %cmp36 = icmp eq i32 %conv35, 32
  br i1 %cmp36, label %lor.end48, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %land.lhs.true33
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* @rl_point, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx39, align 1
  %conv40 = sext i8 %29 to i32
  %cmp41 = icmp eq i32 %conv40, 9
  br i1 %cmp41, label %lor.end48, label %lor.rhs43

lor.rhs43:                                        ; preds = %lor.lhs.false38
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* @rl_point, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %30, i32 %31
  %32 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %32 to i32
  %call46 = call i32 @ispunct(i32 %conv45) #4
  %tobool47 = icmp ne i32 %call46, 0
  br label %lor.end48

lor.end48:                                        ; preds = %lor.rhs43, %lor.lhs.false38, %land.lhs.true33
  %33 = phi i1 [ true, %lor.lhs.false38 ], [ true, %land.lhs.true33 ], [ %tobool47, %lor.rhs43 ]
  %lor.ext = zext i1 %33 to i32
  %cmp49 = icmp eq i32 %lor.ext, 0
  br i1 %cmp49, label %land.lhs.true51, label %if.end71

land.lhs.true51:                                  ; preds = %lor.end48
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %35 = load i32, i32* @rl_point, align 4
  %sub52 = sub nsw i32 %35, 1
  %arrayidx53 = getelementptr inbounds i8, i8* %34, i32 %sub52
  %36 = load i8, i8* %arrayidx53, align 1
  %conv54 = sext i8 %36 to i32
  %cmp55 = icmp eq i32 %conv54, 32
  br i1 %cmp55, label %if.then69, label %lor.lhs.false57

lor.lhs.false57:                                  ; preds = %land.lhs.true51
  %37 = load i8*, i8** @rl_line_buffer, align 4
  %38 = load i32, i32* @rl_point, align 4
  %sub58 = sub nsw i32 %38, 1
  %arrayidx59 = getelementptr inbounds i8, i8* %37, i32 %sub58
  %39 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %39 to i32
  %cmp61 = icmp eq i32 %conv60, 9
  br i1 %cmp61, label %if.then69, label %lor.lhs.false63

lor.lhs.false63:                                  ; preds = %lor.lhs.false57
  %40 = load i8*, i8** @rl_line_buffer, align 4
  %41 = load i32, i32* @rl_point, align 4
  %sub64 = sub nsw i32 %41, 1
  %arrayidx65 = getelementptr inbounds i8, i8* %40, i32 %sub64
  %42 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %42 to i32
  %call67 = call i32 @ispunct(i32 %conv66) #4
  %tobool68 = icmp ne i32 %call67, 0
  br i1 %tobool68, label %if.then69, label %if.end71

if.then69:                                        ; preds = %lor.lhs.false63, %lor.lhs.false57, %land.lhs.true51
  %43 = load i32, i32* @rl_point, align 4
  %dec70 = add nsw i32 %43, -1
  store i32 %dec70, i32* @rl_point, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then69, %lor.lhs.false63, %lor.end48, %if.end30
  %44 = load i32, i32* @rl_point, align 4
  %cmp72 = icmp sgt i32 %44, 0
  br i1 %cmp72, label %land.lhs.true74, label %if.else116

land.lhs.true74:                                  ; preds = %if.end71
  %45 = load i8*, i8** @rl_line_buffer, align 4
  %46 = load i32, i32* @rl_point, align 4
  %arrayidx75 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx75, align 1
  %conv76 = sext i8 %47 to i32
  %cmp77 = icmp eq i32 %conv76, 32
  br i1 %cmp77, label %if.then89, label %lor.lhs.false79

lor.lhs.false79:                                  ; preds = %land.lhs.true74
  %48 = load i8*, i8** @rl_line_buffer, align 4
  %49 = load i32, i32* @rl_point, align 4
  %arrayidx80 = getelementptr inbounds i8, i8* %48, i32 %49
  %50 = load i8, i8* %arrayidx80, align 1
  %conv81 = sext i8 %50 to i32
  %cmp82 = icmp eq i32 %conv81, 9
  br i1 %cmp82, label %if.then89, label %lor.lhs.false84

lor.lhs.false84:                                  ; preds = %lor.lhs.false79
  %51 = load i8*, i8** @rl_line_buffer, align 4
  %52 = load i32, i32* @rl_point, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %53 to i32
  %call87 = call i32 @ispunct(i32 %conv86) #4
  %tobool88 = icmp ne i32 %call87, 0
  br i1 %tobool88, label %if.then89, label %if.else116

if.then89:                                        ; preds = %lor.lhs.false84, %lor.lhs.false79, %land.lhs.true74
  br label %while.cond90

while.cond90:                                     ; preds = %while.body113, %if.then89
  %54 = load i32, i32* @rl_point, align 4
  %tobool91 = icmp ne i32 %54, 0
  br i1 %tobool91, label %land.rhs92, label %land.end112

land.rhs92:                                       ; preds = %while.cond90
  %55 = load i8*, i8** @rl_line_buffer, align 4
  %56 = load i32, i32* @rl_point, align 4
  %sub93 = sub nsw i32 %56, 1
  %arrayidx94 = getelementptr inbounds i8, i8* %55, i32 %sub93
  %57 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %57 to i32
  %cmp96 = icmp eq i32 %conv95, 32
  br i1 %cmp96, label %lor.end110, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %land.rhs92
  %58 = load i8*, i8** @rl_line_buffer, align 4
  %59 = load i32, i32* @rl_point, align 4
  %sub99 = sub nsw i32 %59, 1
  %arrayidx100 = getelementptr inbounds i8, i8* %58, i32 %sub99
  %60 = load i8, i8* %arrayidx100, align 1
  %conv101 = sext i8 %60 to i32
  %cmp102 = icmp eq i32 %conv101, 9
  br i1 %cmp102, label %lor.end110, label %lor.rhs104

lor.rhs104:                                       ; preds = %lor.lhs.false98
  %61 = load i8*, i8** @rl_line_buffer, align 4
  %62 = load i32, i32* @rl_point, align 4
  %sub105 = sub nsw i32 %62, 1
  %arrayidx106 = getelementptr inbounds i8, i8* %61, i32 %sub105
  %63 = load i8, i8* %arrayidx106, align 1
  %conv107 = sext i8 %63 to i32
  %call108 = call i32 @ispunct(i32 %conv107) #4
  %tobool109 = icmp ne i32 %call108, 0
  br label %lor.end110

lor.end110:                                       ; preds = %lor.rhs104, %lor.lhs.false98, %land.rhs92
  %64 = phi i1 [ true, %lor.lhs.false98 ], [ true, %land.rhs92 ], [ %tobool109, %lor.rhs104 ]
  br label %land.end112

land.end112:                                      ; preds = %lor.end110, %while.cond90
  %65 = phi i1 [ false, %while.cond90 ], [ %64, %lor.end110 ]
  br i1 %65, label %while.body113, label %while.end115

while.body113:                                    ; preds = %land.end112
  %66 = load i32, i32* @rl_point, align 4
  %dec114 = add nsw i32 %66, -1
  store i32 %dec114, i32* @rl_point, align 4
  br label %while.cond90

while.end115:                                     ; preds = %land.end112
  br label %if.end168

if.else116:                                       ; preds = %lor.lhs.false84, %if.end71
  %67 = load i32, i32* @rl_point, align 4
  %cmp117 = icmp sgt i32 %67, 0
  br i1 %cmp117, label %land.lhs.true119, label %if.end167

land.lhs.true119:                                 ; preds = %if.else116
  %68 = load i8*, i8** @rl_line_buffer, align 4
  %69 = load i32, i32* @rl_point, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %68, i32 %69
  %70 = load i8, i8* %arrayidx120, align 1
  %conv121 = sext i8 %70 to i32
  %cmp122 = icmp eq i32 %conv121, 32
  br i1 %cmp122, label %lor.end134, label %lor.lhs.false124

lor.lhs.false124:                                 ; preds = %land.lhs.true119
  %71 = load i8*, i8** @rl_line_buffer, align 4
  %72 = load i32, i32* @rl_point, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %71, i32 %72
  %73 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %73 to i32
  %cmp127 = icmp eq i32 %conv126, 9
  br i1 %cmp127, label %lor.end134, label %lor.rhs129

lor.rhs129:                                       ; preds = %lor.lhs.false124
  %74 = load i8*, i8** @rl_line_buffer, align 4
  %75 = load i32, i32* @rl_point, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %76 to i32
  %call132 = call i32 @ispunct(i32 %conv131) #4
  %tobool133 = icmp ne i32 %call132, 0
  br label %lor.end134

lor.end134:                                       ; preds = %lor.rhs129, %lor.lhs.false124, %land.lhs.true119
  %77 = phi i1 [ true, %lor.lhs.false124 ], [ true, %land.lhs.true119 ], [ %tobool133, %lor.rhs129 ]
  %lor.ext135 = zext i1 %77 to i32
  %cmp136 = icmp eq i32 %lor.ext135, 0
  br i1 %cmp136, label %if.then138, label %if.end167

if.then138:                                       ; preds = %lor.end134
  br label %while.cond139

while.cond139:                                    ; preds = %while.body164, %if.then138
  %78 = load i32, i32* @rl_point, align 4
  %tobool140 = icmp ne i32 %78, 0
  br i1 %tobool140, label %land.rhs141, label %land.end163

land.rhs141:                                      ; preds = %while.cond139
  %79 = load i8*, i8** @rl_line_buffer, align 4
  %80 = load i32, i32* @rl_point, align 4
  %sub142 = sub nsw i32 %80, 1
  %arrayidx143 = getelementptr inbounds i8, i8* %79, i32 %sub142
  %81 = load i8, i8* %arrayidx143, align 1
  %conv144 = sext i8 %81 to i32
  %cmp145 = icmp eq i32 %conv144, 32
  br i1 %cmp145, label %lor.end159, label %lor.lhs.false147

lor.lhs.false147:                                 ; preds = %land.rhs141
  %82 = load i8*, i8** @rl_line_buffer, align 4
  %83 = load i32, i32* @rl_point, align 4
  %sub148 = sub nsw i32 %83, 1
  %arrayidx149 = getelementptr inbounds i8, i8* %82, i32 %sub148
  %84 = load i8, i8* %arrayidx149, align 1
  %conv150 = sext i8 %84 to i32
  %cmp151 = icmp eq i32 %conv150, 9
  br i1 %cmp151, label %lor.end159, label %lor.rhs153

lor.rhs153:                                       ; preds = %lor.lhs.false147
  %85 = load i8*, i8** @rl_line_buffer, align 4
  %86 = load i32, i32* @rl_point, align 4
  %sub154 = sub nsw i32 %86, 1
  %arrayidx155 = getelementptr inbounds i8, i8* %85, i32 %sub154
  %87 = load i8, i8* %arrayidx155, align 1
  %conv156 = sext i8 %87 to i32
  %call157 = call i32 @ispunct(i32 %conv156) #4
  %tobool158 = icmp ne i32 %call157, 0
  br label %lor.end159

lor.end159:                                       ; preds = %lor.rhs153, %lor.lhs.false147, %land.rhs141
  %88 = phi i1 [ true, %lor.lhs.false147 ], [ true, %land.rhs141 ], [ %tobool158, %lor.rhs153 ]
  %lor.ext160 = zext i1 %88 to i32
  %cmp161 = icmp eq i32 %lor.ext160, 0
  br label %land.end163

land.end163:                                      ; preds = %lor.end159, %while.cond139
  %89 = phi i1 [ false, %while.cond139 ], [ %cmp161, %lor.end159 ]
  br i1 %89, label %while.body164, label %while.end166

while.body164:                                    ; preds = %land.end163
  %90 = load i32, i32* @rl_point, align 4
  %dec165 = add nsw i32 %90, -1
  store i32 %dec165, i32* @rl_point, align 4
  br label %while.cond139

while.end166:                                     ; preds = %land.end163
  br label %if.end167

if.end167:                                        ; preds = %while.end166, %lor.end134, %if.else116
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %while.end115
  br label %while.cond

while.end169:                                     ; preds = %while.cond
  %91 = load i32, i32* %orig_point, align 4
  %92 = load i32, i32* @rl_point, align 4
  %call170 = call i32 @rl_kill_text(i32 %91, i32 %92)
  br label %if.end171

if.end171:                                        ; preds = %while.end169, %if.then
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @ispunct(i32) #2

; Function Attrs: noinline nounwind
define i32 @rl_vi_back_to_indent(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_beg_of_line(i32 1, i32 %0)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %9 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %10 = phi i1 [ false, %while.cond ], [ %9, %lor.end ]
  br i1 %10, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %11 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_first_print(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_back_to_indent(i32 1, i32 %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_char_search(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %cmp = icmp eq i32 %0, 59
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %cmp1 = icmp eq i32 %1, 44
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32, i32* @_rl_cs_orig_dir, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %3 = load i32, i32* @_rl_vi_last_search_mblen, align 4
  %cmp4 = icmp eq i32 %3, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %key.addr, align 4
  %cmp7 = icmp eq i32 %4, 59
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end6
  %5 = load i32, i32* @_rl_cs_orig_dir, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end6
  %6 = load i32, i32* @_rl_cs_orig_dir, align 4
  %sub = sub nsw i32 0, %6
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* @_rl_cs_dir, align 4
  br label %if.end22

if.else:                                          ; preds = %lor.lhs.false
  %7 = load i32, i32* %key.addr, align 4
  switch i32 %7, label %sw.epilog [
    i32 116, label %sw.bb
    i32 84, label %sw.bb8
    i32 102, label %sw.bb9
    i32 70, label %sw.bb10
  ]

sw.bb:                                            ; preds = %if.else
  store i32 1, i32* @_rl_cs_dir, align 4
  store i32 1, i32* @_rl_cs_orig_dir, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %if.else
  store i32 -1, i32* @_rl_cs_dir, align 4
  store i32 -1, i32* @_rl_cs_orig_dir, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %if.else
  store i32 2, i32* @_rl_cs_dir, align 4
  store i32 2, i32* @_rl_cs_orig_dir, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %if.else
  store i32 -2, i32* @_rl_cs_dir, align 4
  store i32 -2, i32* @_rl_cs_orig_dir, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.else, %sw.bb10, %sw.bb9, %sw.bb8, %sw.bb
  %8 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then11, label %if.else12

if.then11:                                        ; preds = %sw.epilog
  br label %if.end21

if.else12:                                        ; preds = %sw.epilog
  %9 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %9, 524288
  %tobool13 = icmp ne i32 %and, 0
  br i1 %tobool13, label %if.then14, label %if.else15

if.then14:                                        ; preds = %if.else12
  %10 = load i32, i32* %count.addr, align 4
  %call = call %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %10)
  store %struct.__rl_callback_generic_arg* %call, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %11 = load i32, i32* @_rl_cs_dir, align 4
  %12 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %12, i32 0, i32 1
  store i32 %11, i32* %i1, align 4
  %13 = load i32, i32* %key.addr, align 4
  %14 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %14, i32 0, i32 2
  store i32 %13, i32* %i2, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_vi_callback_char_search, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  %15 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %15, 8388608
  store i32 %or, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else15:                                        ; preds = %if.else12
  %call16 = call i32 @_rl_read_mbchar(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_rl_vi_last_search_mbchar, i32 0, i32 0), i32 16)
  store i32 %call16, i32* %c, align 4
  %16 = load i32, i32* %c, align 4
  %cmp17 = icmp sle i32 %16, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.else15
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.else15
  %17 = load i32, i32* %c, align 4
  store i32 %17, i32* @_rl_vi_last_search_mblen, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.end19
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then11
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %cond.end
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_rl_vi_last_search_mbchar, i32 0, i32 0), i8** @rl_vi_char_search.target, align 4
  %18 = load i32, i32* @_rl_vi_last_search_mblen, align 4
  store i32 %18, i32* @rl_vi_char_search.tlen, align 4
  %19 = load i32, i32* %count.addr, align 4
  %20 = load i32, i32* @_rl_cs_dir, align 4
  %21 = load i8*, i8** @rl_vi_char_search.target, align 4
  %22 = load i32, i32* @rl_vi_char_search.tlen, align 4
  %call23 = call i32 @_rl_char_search_internal(i32 %19, i32 %20, i8* %21, i32 %22)
  store i32 %call23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then18, %if.then14, %if.then5, %if.then3
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

declare %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_callback_char_search(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %retval = alloca i32, align 4
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  %c = alloca i32, align 4
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %call = call i32 @_rl_read_mbchar(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_rl_vi_last_search_mbchar, i32 0, i32 0), i32 16)
  store i32 %call, i32* @_rl_vi_last_search_mblen, align 4
  store i32 %call, i32* %c, align 4
  %0 = load i32, i32* %c, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -8388609
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %2 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %2, -8388609
  store i32 %and1, i32* @rl_readline_state, align 4
  %3 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %count = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %3, i32 0, i32 0
  %4 = load i32, i32* %count, align 4
  %5 = load i32, i32* @_rl_cs_dir, align 4
  %6 = load i32, i32* @_rl_vi_last_search_mblen, align 4
  %call2 = call i32 @_rl_char_search_internal(i32 %4, i32 %5, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_rl_vi_last_search_mbchar, i32 0, i32 0), i32 %6)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @_rl_read_mbchar(i8*, i32) #1

declare i32 @_rl_char_search_internal(i32, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_match(i32 %ignore, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %brack = alloca i32, align 4
  %pos = alloca i32, align 4
  %tmp = alloca i32, align 4
  %pre = alloca i32, align 4
  %b = alloca i32, align 4
  %b94 = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 1, i32* %count, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %pos, align 4
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %call = call i32 @rl_vi_bracktype(i32 %conv)
  store i32 %call, i32* %brack, align 4
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end35

if.then:                                          ; preds = %entry
  %call3 = call i32 @__ctype_get_mb_cur_max()
  %cmp4 = icmp ugt i32 %call3, 1
  br i1 %cmp4, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %4 = load i32, i32* @rl_byte_oriented, align 4
  %cmp6 = icmp eq i32 %4, 0
  br i1 %cmp6, label %if.then8, label %if.else

if.then8:                                         ; preds = %land.lhs.true
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then8
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %7 to i32
  %call11 = call i32 @rl_vi_bracktype(i32 %conv10)
  store i32 %call11, i32* %brack, align 4
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* @rl_point, align 4
  store i32 %8, i32* %pre, align 4
  %9 = load i32, i32* %key.addr, align 4
  %call14 = call i32 @rl_forward_char(i32 1, i32 %9)
  %10 = load i32, i32* %pre, align 4
  %11 = load i32, i32* @rl_point, align 4
  %cmp15 = icmp eq i32 %10, %11
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %if.then17, %while.cond
  br label %if.end29

if.else:                                          ; preds = %land.lhs.true, %if.then
  br label %while.cond18

while.cond18:                                     ; preds = %while.body26, %if.else
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* @rl_point, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %14 to i32
  %call21 = call i32 @rl_vi_bracktype(i32 %conv20)
  store i32 %call21, i32* %brack, align 4
  %cmp22 = icmp eq i32 %call21, 0
  br i1 %cmp22, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond18
  %15 = load i32, i32* @rl_point, align 4
  %16 = load i32, i32* @rl_end, align 4
  %sub = sub nsw i32 %16, 1
  %cmp24 = icmp slt i32 %15, %sub
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond18
  %17 = phi i1 [ false, %while.cond18 ], [ %cmp24, %land.rhs ]
  br i1 %17, label %while.body26, label %while.end28

while.body26:                                     ; preds = %land.end
  %18 = load i32, i32* %key.addr, align 4
  %call27 = call i32 @rl_forward_char(i32 1, i32 %18)
  br label %while.cond18

while.end28:                                      ; preds = %land.end
  br label %if.end29

if.end29:                                         ; preds = %while.end28, %while.end
  %19 = load i32, i32* %brack, align 4
  %cmp30 = icmp sle i32 %19, 0
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end29
  %20 = load i32, i32* %pos, align 4
  store i32 %20, i32* @rl_point, align 4
  %call33 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end34:                                         ; preds = %if.end29
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %entry
  %21 = load i32, i32* @rl_point, align 4
  store i32 %21, i32* %pos, align 4
  %22 = load i32, i32* %brack, align 4
  %cmp36 = icmp slt i32 %22, 0
  br i1 %cmp36, label %if.then38, label %if.else76

if.then38:                                        ; preds = %if.end35
  br label %while.cond39

while.cond39:                                     ; preds = %if.end74, %if.then38
  %23 = load i32, i32* %count, align 4
  %tobool = icmp ne i32 %23, 0
  br i1 %tobool, label %while.body40, label %while.end75

while.body40:                                     ; preds = %while.cond39
  %24 = load i32, i32* %pos, align 4
  store i32 %24, i32* %tmp, align 4
  %call41 = call i32 @__ctype_get_mb_cur_max()
  %cmp42 = icmp eq i32 %call41, 1
  br i1 %cmp42, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body40
  %25 = load i32, i32* @rl_byte_oriented, align 4
  %tobool44 = icmp ne i32 %25, 0
  br i1 %tobool44, label %if.then45, label %if.else46

if.then45:                                        ; preds = %lor.lhs.false, %while.body40
  %26 = load i32, i32* %pos, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* %pos, align 4
  br label %if.end53

if.else46:                                        ; preds = %lor.lhs.false
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* %pos, align 4
  %call47 = call i32 @_rl_find_prev_mbchar(i8* %27, i32 %28, i32 0)
  store i32 %call47, i32* %pos, align 4
  %29 = load i32, i32* %tmp, align 4
  %30 = load i32, i32* %pos, align 4
  %cmp48 = icmp eq i32 %29, %30
  br i1 %cmp48, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.else46
  %31 = load i32, i32* %pos, align 4
  %dec51 = add nsw i32 %31, -1
  store i32 %dec51, i32* %pos, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.else46
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then45
  %32 = load i32, i32* %pos, align 4
  %cmp54 = icmp sge i32 %32, 0
  br i1 %cmp54, label %if.then56, label %if.else72

if.then56:                                        ; preds = %if.end53
  %33 = load i8*, i8** @rl_line_buffer, align 4
  %34 = load i32, i32* %pos, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %35 to i32
  %call60 = call i32 @rl_vi_bracktype(i32 %conv59)
  store i32 %call60, i32* %b, align 4
  %36 = load i32, i32* %b, align 4
  %37 = load i32, i32* %brack, align 4
  %sub61 = sub nsw i32 0, %37
  %cmp62 = icmp eq i32 %36, %sub61
  br i1 %cmp62, label %if.then64, label %if.else66

if.then64:                                        ; preds = %if.then56
  %38 = load i32, i32* %count, align 4
  %dec65 = add nsw i32 %38, -1
  store i32 %dec65, i32* %count, align 4
  br label %if.end71

if.else66:                                        ; preds = %if.then56
  %39 = load i32, i32* %b, align 4
  %40 = load i32, i32* %brack, align 4
  %cmp67 = icmp eq i32 %39, %40
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.else66
  %41 = load i32, i32* %count, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, i32* %count, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.else66
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %if.then64
  br label %if.end74

if.else72:                                        ; preds = %if.end53
  %call73 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end74:                                         ; preds = %if.end71
  br label %while.cond39

while.end75:                                      ; preds = %while.cond39
  br label %if.end114

if.else76:                                        ; preds = %if.end35
  br label %while.cond77

while.cond77:                                     ; preds = %if.end112, %if.else76
  %42 = load i32, i32* %count, align 4
  %tobool78 = icmp ne i32 %42, 0
  br i1 %tobool78, label %while.body79, label %while.end113

while.body79:                                     ; preds = %while.cond77
  %call80 = call i32 @__ctype_get_mb_cur_max()
  %cmp81 = icmp eq i32 %call80, 1
  br i1 %cmp81, label %if.then85, label %lor.lhs.false83

lor.lhs.false83:                                  ; preds = %while.body79
  %43 = load i32, i32* @rl_byte_oriented, align 4
  %tobool84 = icmp ne i32 %43, 0
  br i1 %tobool84, label %if.then85, label %if.else87

if.then85:                                        ; preds = %lor.lhs.false83, %while.body79
  %44 = load i32, i32* %pos, align 4
  %inc86 = add nsw i32 %44, 1
  store i32 %inc86, i32* %pos, align 4
  br label %if.end89

if.else87:                                        ; preds = %lor.lhs.false83
  %45 = load i8*, i8** @rl_line_buffer, align 4
  %46 = load i32, i32* %pos, align 4
  %call88 = call i32 @_rl_find_next_mbchar(i8* %45, i32 %46, i32 1, i32 0)
  store i32 %call88, i32* %pos, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else87, %if.then85
  %47 = load i32, i32* %pos, align 4
  %48 = load i32, i32* @rl_end, align 4
  %cmp90 = icmp slt i32 %47, %48
  br i1 %cmp90, label %if.then92, label %if.else110

if.then92:                                        ; preds = %if.end89
  %49 = load i8*, i8** @rl_line_buffer, align 4
  %50 = load i32, i32* %pos, align 4
  %arrayidx95 = getelementptr inbounds i8, i8* %49, i32 %50
  %51 = load i8, i8* %arrayidx95, align 1
  %conv96 = sext i8 %51 to i32
  %call97 = call i32 @rl_vi_bracktype(i32 %conv96)
  store i32 %call97, i32* %b94, align 4
  %52 = load i32, i32* %b94, align 4
  %53 = load i32, i32* %brack, align 4
  %sub98 = sub nsw i32 0, %53
  %cmp99 = icmp eq i32 %52, %sub98
  br i1 %cmp99, label %if.then101, label %if.else103

if.then101:                                       ; preds = %if.then92
  %54 = load i32, i32* %count, align 4
  %dec102 = add nsw i32 %54, -1
  store i32 %dec102, i32* %count, align 4
  br label %if.end109

if.else103:                                       ; preds = %if.then92
  %55 = load i32, i32* %b94, align 4
  %56 = load i32, i32* %brack, align 4
  %cmp104 = icmp eq i32 %55, %56
  br i1 %cmp104, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.else103
  %57 = load i32, i32* %count, align 4
  %inc107 = add nsw i32 %57, 1
  store i32 %inc107, i32* %count, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.else103
  br label %if.end109

if.end109:                                        ; preds = %if.end108, %if.then101
  br label %if.end112

if.else110:                                       ; preds = %if.end89
  %call111 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end112:                                        ; preds = %if.end109
  br label %while.cond77

while.end113:                                     ; preds = %while.cond77
  br label %if.end114

if.end114:                                        ; preds = %while.end113, %while.end75
  %58 = load i32, i32* %pos, align 4
  store i32 %58, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end114, %if.else110, %if.else72, %if.then32
  %59 = load i32, i32* %retval, align 4
  ret i32 %59
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_bracktype(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  switch i32 %0, label %sw.default [
    i32 40, label %sw.bb
    i32 41, label %sw.bb1
    i32 91, label %sw.bb2
    i32 93, label %sw.bb3
    i32 123, label %sw.bb4
    i32 125, label %sw.bb5
  ]

sw.bb:                                            ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %entry
  store i32 2, i32* %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %entry
  store i32 -2, i32* %retval, align 4
  br label %return

sw.bb4:                                           ; preds = %entry
  store i32 3, i32* %retval, align 4
  br label %return

sw.bb5:                                           ; preds = %entry
  store i32 -3, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_change_char(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %mb = alloca [16 x i8], align 1
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_vi_last_replacement, align 4
  store i32 %1, i32* %c, align 4
  %2 = load i32, i32* %c, align 4
  %conv = trunc i32 %2 to i8
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  br label %if.end6

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, 524288
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %4 = load i32, i32* %count.addr, align 4
  %call = call %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %4)
  store %struct.__rl_callback_generic_arg* %call, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_vi_callback_change_char, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else4:                                         ; preds = %if.else
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call5 = call i32 @_rl_vi_callback_getchar(i8* %arraydecay, i32 16)
  store i32 %call5, i32* %c, align 4
  store i32 %call5, i32* @_rl_vi_last_replacement, align 4
  br label %if.end

if.end:                                           ; preds = %if.else4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  %5 = load i32, i32* %c, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  store i32 -1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end6
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %c, align 4
  %arraydecay10 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call11 = call i32 @_rl_vi_change_char(i32 %6, i32 %7, i8* %arraydecay10)
  store i32 %call11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then3
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_callback_change_char(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %retval = alloca i32, align 4
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  %c = alloca i32, align 4
  %mb = alloca [16 x i8], align 1
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call = call i32 @_rl_vi_callback_getchar(i8* %arraydecay, i32 16)
  store i32 %call, i32* %c, align 4
  store i32 %call, i32* @_rl_vi_last_replacement, align 4
  %0 = load i32, i32* %c, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %1 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %count = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %1, i32 0, i32 0
  %2 = load i32, i32* %count, align 4
  %3 = load i32, i32* %c, align 4
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call2 = call i32 @_rl_vi_change_char(i32 %2, i32 %3, i8* %arraydecay1)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_callback_getchar(i8* %mb, i32 %mlen) #0 {
entry:
  %retval = alloca i32, align 4
  %mb.addr = alloca i8*, align 4
  %mlen.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %mb, i8** %mb.addr, align 4
  store i32 %mlen, i32* %mlen.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %c, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %2 = load i32, i32* %c, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @__ctype_get_mb_cur_max()
  %cmp2 = icmp ugt i32 %call1, 1
  br i1 %cmp2, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* @rl_byte_oriented, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %c, align 4
  %5 = load i8*, i8** %mb.addr, align 4
  %6 = load i32, i32* %mlen.addr, align 4
  %call5 = call i32 @_rl_read_mbstring(i32 %4, i8* %5, i32 %6)
  store i32 %call5, i32* %c, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %land.lhs.true, %if.end
  %7 = load i32, i32* %c, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_change_char(i32 %count, i32 %c, i8* %mb) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %mb.addr = alloca i8*, align 4
  %p = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i8* %mb, i8** %mb.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %0, 27
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp eq i32 %1, 3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call = call i32 @rl_begin_undo_group()
  br label %while.cond

while.cond:                                       ; preds = %if.end13, %if.end
  %2 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i32, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_end, align 4
  %cmp2 = icmp slt i32 %3, %4
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %5, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %6 = load i32, i32* @rl_point, align 4
  store i32 %6, i32* %p, align 4
  %7 = load i32, i32* %c.addr, align 4
  %call3 = call i32 @rl_vi_delete(i32 1, i32 %7)
  %8 = load i32, i32* @rl_point, align 4
  %9 = load i32, i32* %p, align 4
  %cmp4 = icmp slt i32 %8, %9
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %while.body
  %10 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %while.body
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp8 = icmp ugt i32 %call7, 1
  br i1 %cmp8, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end6
  %11 = load i32, i32* @rl_byte_oriented, align 4
  %cmp9 = icmp eq i32 %11, 0
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %land.lhs.true
  %12 = load i8*, i8** %mb.addr, align 4
  %call11 = call i32 @rl_insert_text(i8* %12)
  br label %if.end13

if.else:                                          ; preds = %land.lhs.true, %if.end6
  %13 = load i32, i32* %c.addr, align 4
  %call12 = call i32 @_rl_insert_char(i32 1, i32 %13)
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then10
  br label %while.cond

while.end:                                        ; preds = %land.end
  %14 = load i32, i32* %c.addr, align 4
  %call14 = call i32 @rl_backward_char(i32 1, i32 %14)
  %call15 = call i32 @rl_end_undo_group()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_subst(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @_rl_vi_redoing, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %key.addr, align 4
  %cmp1 = icmp eq i32 %1, 83
  %cond = select i1 %cmp1, i32 99, i32 108
  %call = call i32 @rl_stuff_char(i32 %cond)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %count.addr, align 4
  %call2 = call i32 @rl_vi_change_to(i32 %2, i32 99)
  ret i32 %call2
}

declare i32 @rl_stuff_char(i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_overstrike(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @_rl_vi_doing_insert, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* @_rl_vi_doing_insert, align 4
  %call = call i32 @rl_begin_undo_group()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %count.addr, align 4
  %3 = load i32, i32* %key.addr, align 4
  %call3 = call i32 @_rl_overwrite_char(i32 %2, i32 %3)
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* @vi_replace_count, align 4
  %add = add nsw i32 %5, %4
  store i32 %add, i32* @vi_replace_count, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  ret i32 0
}

declare i32 @_rl_overwrite_char(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_overstrike_delete(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* @vi_replace_count, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call = call i32 @rl_ding()
  br label %for.end

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %s, align 4
  %call2 = call i32 @rl_do_undo()
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* @vi_replace_count, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* @vi_replace_count, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i32, i32* @rl_point, align 4
  %6 = load i32, i32* %s, align 4
  %cmp5 = icmp eq i32 %5, %6
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end4
  %7 = load i32, i32* %key.addr, align 4
  %call7 = call i32 @rl_backward_char(i32 1, i32 %7)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end4
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load i32, i32* @vi_replace_count, align 4
  %cmp9 = icmp eq i32 %9, 0
  br i1 %cmp9, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %for.end
  %10 = load i32, i32* @_rl_vi_doing_insert, align 4
  %tobool10 = icmp ne i32 %10, 0
  br i1 %tobool10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %land.lhs.true
  %call12 = call i32 @rl_end_undo_group()
  %call13 = call i32 @rl_do_undo()
  store i32 0, i32* @_rl_vi_doing_insert, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %land.lhs.true, %for.end
  ret i32 0
}

declare i32 @rl_do_undo() #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_replace(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 0, i32* @vi_replace_count, align 4
  %0 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %cmp = icmp eq %struct._keymap_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end34

if.then:                                          ; preds = %entry
  %call = call %struct._keymap_entry* @rl_make_bare_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** @vi_replace_map, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %1, 32
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 %2
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %3 = load i8, i8* %type, align 4
  %conv = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then4, label %if.end

if.then4:                                         ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 %4
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx5, i32 0, i32 1
  %5 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %6, i32 %7
  %function7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx6, i32 0, i32 1
  store i32 (i32, i32)* %5, i32 (i32, i32)** %function7, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 32, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc14, %for.end
  %9 = load i32, i32* %i, align 4
  %cmp9 = icmp slt i32 %9, 257
  br i1 %cmp9, label %for.body11, label %for.end16

for.body11:                                       ; preds = %for.cond8
  %10 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %10, i32 %11
  %function13 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx12, i32 0, i32 1
  store i32 (i32, i32)* @rl_vi_overstrike, i32 (i32, i32)** %function13, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %12 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %12, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond8

for.end16:                                        ; preds = %for.cond8
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %arrayidx17 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %13, i32 127
  %function18 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx17, i32 0, i32 1
  store i32 (i32, i32)* @rl_vi_overstrike_delete, i32 (i32, i32)** %function18, align 4
  %14 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %arrayidx19 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %14, i32 27
  %function20 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx19, i32 0, i32 1
  store i32 (i32, i32)* @rl_vi_movement_mode, i32 (i32, i32)** %function20, align 4
  %15 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %arrayidx21 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %15, i32 13
  %function22 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx21, i32 0, i32 1
  store i32 (i32, i32)* @rl_newline, i32 (i32, i32)** %function22, align 4
  %16 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %arrayidx23 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %16, i32 10
  %function24 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx23, i32 0, i32 1
  store i32 (i32, i32)* @rl_newline, i32 (i32, i32)** %function24, align 4
  %17 = load i8, i8* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 8, i32 0), align 4
  %conv25 = sext i8 %17 to i32
  %cmp26 = icmp eq i32 %conv25, 0
  br i1 %cmp26, label %land.lhs.true, label %if.end33

land.lhs.true:                                    ; preds = %for.end16
  %18 = load i32 (i32, i32)*, i32 (i32, i32)** getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 8, i32 1), align 4
  %cmp28 = icmp eq i32 (i32, i32)* %18, @rl_rubout
  br i1 %cmp28, label %if.then30, label %if.end33

if.then30:                                        ; preds = %land.lhs.true
  %19 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  %arrayidx31 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %19, i32 8
  %function32 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx31, i32 0, i32 1
  store i32 (i32, i32)* @rl_vi_overstrike_delete, i32 (i32, i32)** %function32, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then30, %land.lhs.true, %for.end16
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %entry
  %20 = load i32, i32* %key.addr, align 4
  %21 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %20, i32 1, i32 %21)
  %22 = load i32, i32* %key.addr, align 4
  store i32 %22, i32* @_rl_vi_last_key_before_insert, align 4
  %23 = load %struct._keymap_entry*, %struct._keymap_entry** @vi_replace_map, align 4
  store %struct._keymap_entry* %23, %struct._keymap_entry** @_rl_keymap, align 4
  ret i32 0
}

declare %struct._keymap_entry* @rl_make_bare_keymap() #1

declare i32 @rl_rubout(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_set_mark(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.__rl_callback_generic_arg* null, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_vi_callback_set_mark, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @_rl_vi_set_mark()
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_callback_set_mark(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %call = call i32 @_rl_vi_set_mark()
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_set_mark() #0 {
entry:
  %retval = alloca i32, align 4
  %ch = alloca i32, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %ch, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %2 = load i32, i32* %ch, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i32, i32* %ch, align 4
  %cmp1 = icmp slt i32 %3, 97
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* %ch, align 4
  %cmp3 = icmp sgt i32 %4, 122
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %call4 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load i32, i32* %ch, align 4
  %sub = sub nsw i32 %5, 97
  store i32 %sub, i32* %ch, align 4
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %ch, align 4
  %arrayidx = getelementptr inbounds [26 x i32], [26 x i32]* @vi_mark_chars, i32 0, i32 %7
  store i32 %6, i32* %arrayidx, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_goto_mark(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.__rl_callback_generic_arg* null, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_vi_callback_goto_mark, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @_rl_vi_goto_mark()
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %1 = load i32, i32* %retval, align 4
  ret i32 %1
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_callback_goto_mark(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %call = call i32 @_rl_vi_goto_mark()
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_goto_mark() #0 {
entry:
  %retval = alloca i32, align 4
  %ch = alloca i32, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %ch, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %2 = load i32, i32* %ch, align 4
  %cmp = icmp eq i32 %2, 96
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @rl_mark, align 4
  store i32 %3, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %ch, align 4
  %cmp1 = icmp slt i32 %4, 0
  br i1 %cmp1, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %5 = load i32, i32* %ch, align 4
  %cmp2 = icmp slt i32 %5, 97
  br i1 %cmp2, label %if.then5, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %6 = load i32, i32* %ch, align 4
  %cmp4 = icmp sgt i32 %6, 122
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %lor.lhs.false3, %lor.lhs.false, %if.else
  %call6 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false3
  br label %if.end7

if.end7:                                          ; preds = %if.end
  %7 = load i32, i32* %ch, align 4
  %sub = sub nsw i32 %7, 97
  store i32 %sub, i32* %ch, align 4
  %8 = load i32, i32* %ch, align 4
  %arrayidx = getelementptr inbounds [26 x i32], [26 x i32]* @vi_mark_chars, i32 0, i32 %8
  %9 = load i32, i32* %arrayidx, align 4
  %cmp8 = icmp eq i32 %9, -1
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end7
  %call10 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end7
  %10 = load i32, i32* %ch, align 4
  %arrayidx12 = getelementptr inbounds [26 x i32], [26 x i32]* @vi_mark_chars, i32 0, i32 %10
  %11 = load i32, i32* %arrayidx12, align 4
  store i32 %11, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then9, %if.then5, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @rl_insert_text(i8*) #1

declare i32 @strlen(i8*) #1

declare i32 @_rl_replace_text(i8*, i32, i32) #1

declare i32 @_rl_forward_char_internal(i32) #1

; Function Attrs: noinline nounwind
define internal void @vi_save_insert_buffer(i32 %start, i32 %len) #0 {
entry:
  %start.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32, i32* %len.addr, align 4
  %1 = load i32, i32* @vi_insert_buffer_size, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %len.addr, align 4
  %add = add nsw i32 %2, 32
  %3 = load i32, i32* %len.addr, align 4
  %rem = srem i32 %3, 32
  %sub = sub nsw i32 %add, %rem
  %4 = load i32, i32* @vi_insert_buffer_size, align 4
  %add1 = add nsw i32 %4, %sub
  store i32 %add1, i32* @vi_insert_buffer_size, align 4
  %5 = load i8*, i8** @vi_insert_buffer, align 4
  %6 = load i32, i32* @vi_insert_buffer_size, align 4
  %call = call i8* @xrealloc(i8* %5, i32 %6)
  store i8* %call, i8** @vi_insert_buffer, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8*, i8** @vi_insert_buffer, align 4
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* %start.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i32, i32* %len.addr, align 4
  %sub2 = sub nsw i32 %10, 1
  %call3 = call i8* @strncpy(i8* %7, i8* %add.ptr, i32 %sub2)
  %11 = load i8*, i8** @vi_insert_buffer, align 4
  %12 = load i32, i32* %len.addr, align 4
  %sub4 = sub nsw i32 %12, 1
  %arrayidx = getelementptr inbounds i8, i8* %11, i32 %sub4
  store i8 0, i8* %arrayidx, align 1
  ret void
}

declare i8* @xrealloc(i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #3

declare i32 @_rl_adjust_point(i8*, i32, %struct.__mbstate_t*) #1

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

declare i32 @iswupper(i32) #1

declare i32 @towlower(i32) #1

declare i32 @iswlower(i32) #1

declare i32 @towupper(i32) #1

declare i32 @wcrtomb(i8*, i32, %struct.__mbstate_t*) #1

declare i32 @rl_read_key() #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_vi_arg_dispatch(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %key = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  store i32 %0, i32* %key, align 4
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %3 = load i32, i32* %c.addr, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 %3
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %4 = load i8, i8* %type, align 4
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %6 = load i32, i32* %c.addr, align 4
  %arrayidx4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %6
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx4, i32 0, i32 1
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp5 = icmp eq i32 (i32, i32)* %7, @rl_universal_argument
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true3
  %8 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %8, 4
  store i32 %mul, i32* @rl_numeric_arg, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %9 = load i32, i32* %c.addr, align 4
  %and = and i32 %9, -129
  store i32 %and, i32* %c.addr, align 4
  %10 = load i32, i32* %c.addr, align 4
  %cmp7 = icmp sge i32 %10, 48
  br i1 %cmp7, label %land.lhs.true9, label %if.else17

land.lhs.true9:                                   ; preds = %if.end
  %11 = load i32, i32* %c.addr, align 4
  %cmp10 = icmp sle i32 %11, 57
  br i1 %cmp10, label %if.then12, label %if.else17

if.then12:                                        ; preds = %land.lhs.true9
  %12 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.then12
  %13 = load i32, i32* @rl_numeric_arg, align 4
  %mul14 = mul nsw i32 %13, 10
  %14 = load i32, i32* %c.addr, align 4
  %sub = sub nsw i32 %14, 48
  %add = add nsw i32 %mul14, %sub
  store i32 %add, i32* @rl_numeric_arg, align 4
  br label %if.end16

if.else:                                          ; preds = %if.then12
  %15 = load i32, i32* %c.addr, align 4
  %sub15 = sub nsw i32 %15, 48
  store i32 %sub15, i32* @rl_numeric_arg, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else, %if.then13
  store i32 1, i32* @rl_explicit_arg, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.else17:                                        ; preds = %land.lhs.true9, %if.end
  %call = call i32 @rl_clear_message()
  %16 = load i32, i32* %key, align 4
  %call18 = call i32 @rl_stuff_char(i32 %16)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else17, %if.end16, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define internal i32 @rl_digit_loop1() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end4
  %call = call i32 @_rl_arg_overflow()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  %call1 = call i32 @_rl_arg_getchar()
  store i32 %call1, i32* %c, align 4
  %0 = load i32, i32* %c, align 4
  %call2 = call i32 @_rl_vi_arg_dispatch(i32 %0)
  store i32 %call2, i32* %r, align 4
  %1 = load i32, i32* %r, align 4
  %cmp = icmp sle i32 %1, 0
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %while.end

if.end4:                                          ; preds = %if.end
  br label %while.body

while.end:                                        ; preds = %if.then3
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, -1025
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32 @rl_universal_argument(i32, i32) #1

declare i32 @rl_clear_message() #1

declare i32 @_rl_arg_overflow() #1

declare i32 @_rl_arg_getchar() #1

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @_rl_mvcxt_init(%struct.__rl_vimotion_context* %m, i32 %op, i32 %key) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  %op.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %op.addr, align 4
  %1 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %op1 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %1, i32 0, i32 0
  store i32 %0, i32* %op1, align 4
  %2 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %flags = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %2, i32 0, i32 2
  store i32 0, i32* %flags, align 4
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %state = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %3, i32 0, i32 1
  store i32 0, i32* %state, align 4
  %4 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %ncxt = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %4, i32 0, i32 3
  store i32 0, i32* %ncxt, align 4
  %5 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %numeric_arg = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %5, i32 0, i32 4
  store i32 -1, i32* %numeric_arg, align 4
  %6 = load i32, i32* @rl_point, align 4
  %7 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %7, i32 0, i32 5
  store i32 %6, i32* %start, align 4
  %8 = load i32, i32* @rl_end, align 4
  %9 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %end = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %9, i32 0, i32 6
  store i32 %8, i32* %end, align 4
  %10 = load i32, i32* %key.addr, align 4
  %11 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key2 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %11, i32 0, i32 7
  store i32 %10, i32* %key2, align 4
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 8
  store i32 -1, i32* %motion, align 4
  ret void
}

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @vi_delete_dispatch(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 8
  %1 = load i32, i32* %motion, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0), i32 %1)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %3, i32 0, i32 5
  %4 = load i32, i32* %start, align 4
  %cmp1 = icmp sge i32 %2, %4
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* @rl_mark, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %7 = load i32, i32* @rl_mark, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %8 = load i32, i32* @rl_point, align 4
  %9 = load i32, i32* @rl_mark, align 4
  %call4 = call i32 @rl_kill_text(i32 %8, i32 %9)
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @vi_change_dispatch(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 8
  %1 = load i32, i32* %motion, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 %1)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %3, i32 0, i32 5
  %4 = load i32, i32* %start, align 4
  %cmp1 = icmp sge i32 %2, %4
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* @rl_mark, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %7 = load i32, i32* @rl_mark, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %8 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion4 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %8, i32 0, i32 8
  %9 = load i32, i32* %motion4, align 4
  %conv = trunc i32 %9 to i8
  %conv5 = zext i8 %conv to i32
  %10 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion6 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %10, i32 0, i32 8
  %11 = load i32, i32* %motion6, align 4
  %cmp7 = icmp eq i32 %conv5, %11
  br i1 %cmp7, label %land.lhs.true9, label %cond.false

land.lhs.true9:                                   ; preds = %if.end
  %12 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion10 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %12, i32 0, i32 8
  %13 = load i32, i32* %motion10, align 4
  %conv11 = trunc i32 %13 to i8
  %conv12 = zext i8 %conv11 to i32
  %call13 = call i32 @islower(i32 %conv12) #4
  %tobool = icmp ne i32 %call13, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true9
  %14 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion14 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %14, i32 0, i32 8
  %15 = load i32, i32* %motion14, align 4
  %conv15 = trunc i32 %15 to i8
  %conv16 = zext i8 %conv15 to i32
  %call17 = call i32 @toupper(i32 %conv16) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true9, %if.end
  %16 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion18 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %16, i32 0, i32 8
  %17 = load i32, i32* %motion18, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call17, %cond.true ], [ %17, %cond.false ]
  %cmp19 = icmp eq i32 %cond, 87
  br i1 %cmp19, label %land.lhs.true21, label %if.end27

land.lhs.true21:                                  ; preds = %cond.end
  %18 = load i32, i32* @rl_point, align 4
  %19 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start22 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %19, i32 0, i32 5
  %20 = load i32, i32* %start22, align 4
  %cmp23 = icmp slt i32 %18, %20
  br i1 %cmp23, label %if.then25, label %if.end27

if.then25:                                        ; preds = %land.lhs.true21
  %21 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start26 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %21, i32 0, i32 5
  %22 = load i32, i32* %start26, align 4
  store i32 %22, i32* @rl_point, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %land.lhs.true21, %cond.end
  %23 = load i32, i32* @_rl_vi_redoing, align 4
  %tobool28 = icmp ne i32 %23, 0
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %if.end27
  %24 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool30 = icmp ne i8* %24, null
  br i1 %tobool30, label %land.lhs.true31, label %if.end36

land.lhs.true31:                                  ; preds = %if.then29
  %25 = load i8*, i8** @vi_insert_buffer, align 4
  %26 = load i8, i8* %25, align 1
  %conv32 = sext i8 %26 to i32
  %tobool33 = icmp ne i32 %conv32, 0
  br i1 %tobool33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %land.lhs.true31
  %call35 = call i32 @rl_begin_undo_group()
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %land.lhs.true31, %if.then29
  %27 = load i32, i32* @rl_point, align 4
  %28 = load i32, i32* @rl_mark, align 4
  %call37 = call i32 @rl_delete_text(i32 %27, i32 %28)
  %29 = load i8*, i8** @vi_insert_buffer, align 4
  %tobool38 = icmp ne i8* %29, null
  br i1 %tobool38, label %land.lhs.true39, label %if.end45

land.lhs.true39:                                  ; preds = %if.end36
  %30 = load i8*, i8** @vi_insert_buffer, align 4
  %31 = load i8, i8* %30, align 1
  %conv40 = sext i8 %31 to i32
  %tobool41 = icmp ne i32 %conv40, 0
  br i1 %tobool41, label %if.then42, label %if.end45

if.then42:                                        ; preds = %land.lhs.true39
  %32 = load i8*, i8** @vi_insert_buffer, align 4
  %call43 = call i32 @rl_insert_text(i8* %32)
  %call44 = call i32 @rl_end_undo_group()
  br label %if.end45

if.end45:                                         ; preds = %if.then42, %land.lhs.true39, %if.end36
  br label %if.end63

if.else:                                          ; preds = %if.end27
  %call46 = call i32 @rl_begin_undo_group()
  %33 = load i32, i32* @rl_point, align 4
  %34 = load i32, i32* @rl_mark, align 4
  %call47 = call i32 @rl_kill_text(i32 %33, i32 %34)
  %35 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %35, i32 0, i32 7
  %36 = load i32, i32* %key, align 4
  %conv48 = trunc i32 %36 to i8
  %conv49 = zext i8 %conv48 to i32
  %37 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key50 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %37, i32 0, i32 7
  %38 = load i32, i32* %key50, align 4
  %cmp51 = icmp eq i32 %conv49, %38
  br i1 %cmp51, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.else
  %39 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key53 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %39, i32 0, i32 7
  %40 = load i32, i32* %key53, align 4
  %conv54 = trunc i32 %40 to i8
  %conv55 = zext i8 %conv54 to i32
  %call56 = call i32 @isupper(i32 %conv55) #4
  %tobool57 = icmp ne i32 %call56, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.else
  %41 = phi i1 [ false, %if.else ], [ %tobool57, %land.rhs ]
  %land.ext = zext i1 %41 to i32
  %cmp58 = icmp eq i32 %land.ext, 0
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %land.end
  store i32 1, i32* @_rl_vi_doing_insert, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %land.end
  %42 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %key62 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %42, i32 0, i32 7
  %43 = load i32, i32* %key62, align 4
  %44 = load i32, i32* @rl_numeric_arg, align 4
  %45 = load i32, i32* @rl_arg_sign, align 4
  call void @rl_vi_start_inserting(i32 %43, i32 %44, i32 %45)
  br label %if.end63

if.end63:                                         ; preds = %if.end61, %if.end45
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @vi_yank_dispatch(%struct.__rl_vimotion_context* %m) #0 {
entry:
  %m.addr = alloca %struct.__rl_vimotion_context*, align 4
  store %struct.__rl_vimotion_context* %m, %struct.__rl_vimotion_context** %m.addr, align 4
  %0 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %motion = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %0, i32 0, i32 8
  %1 = load i32, i32* %motion, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 %1)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  %3 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %3, i32 0, i32 5
  %4 = load i32, i32* %start, align 4
  %cmp1 = icmp sge i32 %2, %4
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* @rl_mark, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %7 = load i32, i32* @rl_mark, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %call4 = call i32 @rl_begin_undo_group()
  %8 = load i32, i32* @rl_point, align 4
  %9 = load i32, i32* @rl_mark, align 4
  %call5 = call i32 @rl_kill_text(i32 %8, i32 %9)
  %call6 = call i32 @rl_end_undo_group()
  %call7 = call i32 @rl_do_undo()
  %10 = load %struct.__rl_vimotion_context*, %struct.__rl_vimotion_context** %m.addr, align 4
  %start8 = getelementptr inbounds %struct.__rl_vimotion_context, %struct.__rl_vimotion_context* %10, i32 0, i32 5
  %11 = load i32, i32* %start8, align 4
  store i32 %11, i32* @rl_point, align 4
  ret i32 0
}

declare void @_rl_errmsg(i8*, ...) #1

declare i32 @rl_delete_text(i32, i32) #1

declare i32 @_rl_read_mbstring(i32, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
