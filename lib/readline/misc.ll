; ModuleID = 'misc.c'
source_filename = "misc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._hist_entry = type { i8*, i8*, i8* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }

@_rl_history_preserve_point = global i32 0, align 4
@_rl_history_saved_point = global i32 -1, align 4
@rl_numeric_arg = external global i32, align 4
@_rl_argcxt = common global i32 0, align 4
@rl_explicit_arg = external global i32, align 4
@rl_readline_state = external global i32, align 4
@.str = private unnamed_addr constant [11 x i8] c"(arg: %d) \00", align 1
@rl_arg_sign = external global i32, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@rl_done = external global i32, align 4
@rl_redisplay_function = external global void ()*, align 4
@_rl_saved_line_for_history = global %struct._hist_entry* null, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@rl_line_buffer = external global i8*, align 4
@rl_end = external global i32, align 4
@rl_point = external global i32, align 4
@rl_mark = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@history_length = external global i32, align 4
@history_offset = external global i32, align 4
@emacs_standard_keymap = external global [257 x %struct._keymap_entry], align 4
@_rl_show_mode_in_prompt = external global i32, align 4
@rl_insert_mode = external global i32, align 4
@vi_insertion_keymap = external global [257 x %struct._keymap_entry], align 4

; Function Attrs: noinline nounwind
define i32 @_rl_arg_overflow() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @rl_numeric_arg, align 4
  %cmp = icmp sgt i32 %0, 1000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @_rl_argcxt, align 4
  store i32 0, i32* @rl_numeric_arg, align 4
  store i32 0, i32* @rl_explicit_arg, align 4
  %call = call i32 @rl_ding()
  call void @rl_restore_prompt()
  %call1 = call i32 @rl_clear_message()
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, -1025
  store i32 %and, i32* @rl_readline_state, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare i32 @rl_ding() #1

declare void @rl_restore_prompt() #1

declare i32 @rl_clear_message() #1

; Function Attrs: noinline nounwind
define void @_rl_arg_init() #0 {
entry:
  call void @rl_save_prompt()
  store i32 0, i32* @_rl_argcxt, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 1024
  store i32 %or, i32* @rl_readline_state, align 4
  ret void
}

declare void @rl_save_prompt() #1

; Function Attrs: noinline nounwind
define i32 @_rl_arg_getchar() #0 {
entry:
  %c = alloca i32, align 4
  %0 = load i32, i32* @rl_arg_sign, align 4
  %1 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %0, %1
  %call = call i32 (i8*, ...) @rl_message(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %mul)
  %2 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %2, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call1 = call i32 @rl_read_key()
  store i32 %call1, i32* %c, align 4
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %4 = load i32, i32* %c, align 4
  ret i32 %4
}

declare i32 @rl_message(i8*, ...) #1

declare i32 @rl_read_key() #1

; Function Attrs: noinline nounwind
define i32 @_rl_arg_dispatch(i32 %cxt, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %key = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %cxt, i32* %cxt.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  store i32 %0, i32* %key, align 4
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end21

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %3 = load i32, i32* %c.addr, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %2, i32 %3
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %4 = load i8, i8* %type, align 4
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %land.lhs.true3, label %if.end21

land.lhs.true3:                                   ; preds = %land.lhs.true
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %6 = load i32, i32* %c.addr, align 4
  %arrayidx4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %6
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx4, i32 0, i32 1
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp5 = icmp eq i32 (i32, i32)* %7, @rl_universal_argument
  br i1 %cmp5, label %if.then, label %if.end21

if.then:                                          ; preds = %land.lhs.true3
  %8 = load i32, i32* %cxt.addr, align 4
  %and = and i32 %8, 2
  %cmp7 = icmp eq i32 %and, 0
  br i1 %cmp7, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.then
  %9 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %9, 4
  store i32 %mul, i32* @rl_numeric_arg, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  %10 = load i32, i32* @rl_readline_state, align 4
  %and10 = and i32 %10, 524288
  %tobool = icmp ne i32 %and10, 0
  br i1 %tobool, label %if.then11, label %if.else12

if.then11:                                        ; preds = %if.else
  %11 = load i32, i32* @_rl_argcxt, align 4
  %or = or i32 %11, 4
  store i32 %or, i32* @_rl_argcxt, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.else12:                                        ; preds = %if.else
  %12 = load i32, i32* @rl_readline_state, align 4
  %or13 = or i32 %12, 64
  store i32 %or13, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %key, align 4
  %13 = load i32, i32* @rl_readline_state, align 4
  %and14 = and i32 %13, -65
  store i32 %and14, i32* @rl_readline_state, align 4
  call void @rl_restore_prompt()
  %call15 = call i32 @rl_clear_message()
  %14 = load i32, i32* @rl_readline_state, align 4
  %and16 = and i32 %14, -1025
  store i32 %and16, i32* @rl_readline_state, align 4
  %15 = load i32, i32* %key, align 4
  %cmp17 = icmp slt i32 %15, 0
  br i1 %cmp17, label %if.then19, label %if.end

if.then19:                                        ; preds = %if.else12
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else12
  %16 = load i32, i32* %key, align 4
  %17 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call20 = call i32 @_rl_dispatch(i32 %16, %struct._keymap_entry* %17)
  store i32 %call20, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %land.lhs.true3, %land.lhs.true, %entry
  %18 = load i32, i32* %c.addr, align 4
  %and22 = and i32 %18, -129
  store i32 %and22, i32* %c.addr, align 4
  %19 = load i32, i32* %c.addr, align 4
  %cmp23 = icmp sge i32 %19, 48
  br i1 %cmp23, label %land.lhs.true25, label %if.else32

land.lhs.true25:                                  ; preds = %if.end21
  %20 = load i32, i32* %c.addr, align 4
  %cmp26 = icmp sle i32 %20, 57
  br i1 %cmp26, label %if.then28, label %if.else32

if.then28:                                        ; preds = %land.lhs.true25
  %21 = load i32, i32* %c.addr, align 4
  %sub = sub nsw i32 %21, 48
  store i32 %sub, i32* %r, align 4
  %22 = load i32, i32* @rl_explicit_arg, align 4
  %tobool29 = icmp ne i32 %22, 0
  br i1 %tobool29, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then28
  %23 = load i32, i32* @rl_numeric_arg, align 4
  %mul30 = mul nsw i32 %23, 10
  %24 = load i32, i32* %r, align 4
  %add = add nsw i32 %mul30, %24
  br label %cond.end

cond.false:                                       ; preds = %if.then28
  %25 = load i32, i32* %r, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %25, %cond.false ]
  store i32 %cond, i32* @rl_numeric_arg, align 4
  store i32 1, i32* @rl_explicit_arg, align 4
  %26 = load i32, i32* @_rl_argcxt, align 4
  %or31 = or i32 %26, 2
  store i32 %or31, i32* @_rl_argcxt, align 4
  br label %if.end63

if.else32:                                        ; preds = %land.lhs.true25, %if.end21
  %27 = load i32, i32* %c.addr, align 4
  %cmp33 = icmp eq i32 %27, 45
  br i1 %cmp33, label %land.lhs.true35, label %if.else40

land.lhs.true35:                                  ; preds = %if.else32
  %28 = load i32, i32* @rl_explicit_arg, align 4
  %cmp36 = icmp eq i32 %28, 0
  br i1 %cmp36, label %if.then38, label %if.else40

if.then38:                                        ; preds = %land.lhs.true35
  store i32 1, i32* @rl_numeric_arg, align 4
  %29 = load i32, i32* @_rl_argcxt, align 4
  %or39 = or i32 %29, 1
  store i32 %or39, i32* @_rl_argcxt, align 4
  store i32 -1, i32* @rl_arg_sign, align 4
  br label %if.end62

if.else40:                                        ; preds = %land.lhs.true35, %if.else32
  %30 = load i32, i32* @_rl_argcxt, align 4
  %and41 = and i32 %30, 1
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.end50

land.lhs.true43:                                  ; preds = %if.else40
  %31 = load i32, i32* @rl_numeric_arg, align 4
  %cmp44 = icmp eq i32 %31, 1
  br i1 %cmp44, label %land.lhs.true46, label %if.end50

land.lhs.true46:                                  ; preds = %land.lhs.true43
  %32 = load i32, i32* @rl_explicit_arg, align 4
  %cmp47 = icmp eq i32 %32, 0
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %land.lhs.true46
  store i32 1, i32* @rl_explicit_arg, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %land.lhs.true46, %land.lhs.true43, %if.else40
  call void @rl_restore_prompt()
  %call51 = call i32 @rl_clear_message()
  %33 = load i32, i32* @rl_readline_state, align 4
  %and52 = and i32 %33, -1025
  store i32 %and52, i32* @rl_readline_state, align 4
  %34 = load i32, i32* %key, align 4
  %35 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %call53 = call i32 @_rl_dispatch(i32 %34, %struct._keymap_entry* %35)
  store i32 %call53, i32* %r, align 4
  %36 = load i32, i32* @rl_readline_state, align 4
  %and54 = and i32 %36, 524288
  %tobool55 = icmp ne i32 %and54, 0
  br i1 %tobool55, label %if.then56, label %if.end61

if.then56:                                        ; preds = %if.end50
  %37 = load i32, i32* @rl_done, align 4
  %cmp57 = icmp eq i32 %37, 0
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.then56
  %38 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %38()
  br label %if.end60

if.end60:                                         ; preds = %if.then59, %if.then56
  store i32 0, i32* %r, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end50
  %39 = load i32, i32* %r, align 4
  store i32 %39, i32* %retval, align 4
  br label %return

if.end62:                                         ; preds = %if.then38
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %cond.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end63, %if.end61, %if.end, %if.then19, %if.then11, %if.then9
  %40 = load i32, i32* %retval, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind
define i32 @rl_universal_argument(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @_rl_arg_init()
  %0 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %0, 4
  store i32 %mul, i32* @rl_numeric_arg, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call = call i32 @rl_digit_loop()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %call, %cond.false ]
  ret i32 %cond
}

declare i32 @_rl_dispatch(i32, %struct._keymap_entry*) #1

; Function Attrs: noinline nounwind
define void @_rl_reset_argument() #0 {
entry:
  store i32 1, i32* @rl_arg_sign, align 4
  store i32 1, i32* @rl_numeric_arg, align 4
  store i32 0, i32* @rl_explicit_arg, align 4
  store i32 0, i32* @_rl_argcxt, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_digit_argument(i32 %ignore, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @_rl_arg_init()
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @_rl_argcxt, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @_rl_arg_dispatch(i32 %1, i32 %2)
  %3 = load i32, i32* @rl_arg_sign, align 4
  %4 = load i32, i32* @rl_numeric_arg, align 4
  %mul = mul nsw i32 %3, %4
  %call1 = call i32 (i8*, ...) @rl_message(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %mul)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_execute_next(i32 %5)
  %call3 = call i32 @rl_digit_loop()
  store i32 %call3, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @rl_execute_next(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @rl_digit_loop() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end9
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
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @_rl_abort_internal()
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %1 = load i32, i32* @_rl_argcxt, align 4
  %2 = load i32, i32* %c, align 4
  %call5 = call i32 @_rl_arg_dispatch(i32 %1, i32 %2)
  store i32 %call5, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %cmp6 = icmp sle i32 %3, 0
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, 1024
  %cmp7 = icmp eq i32 %and, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end4
  br label %while.end

if.end9:                                          ; preds = %lor.lhs.false
  br label %while.body

while.end:                                        ; preds = %if.then8
  %5 = load i32, i32* %r, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then2, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @_rl_arg_callback(i32 %cxt) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %cxt, i32* %cxt.addr, align 4
  %call = call i32 @_rl_arg_getchar()
  store i32 %call, i32* %c, align 4
  %0 = load i32, i32* %c, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @_rl_argcxt, align 4
  %and = and i32 %1, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end6

if.then1:                                         ; preds = %if.end
  %2 = load i32, i32* @_rl_argcxt, align 4
  %and2 = and i32 %2, -5
  store i32 %and2, i32* @_rl_argcxt, align 4
  call void @rl_restore_prompt()
  %call3 = call i32 @rl_clear_message()
  %3 = load i32, i32* @rl_readline_state, align 4
  %and4 = and i32 %3, -1025
  store i32 %and4, i32* @rl_readline_state, align 4
  %4 = load i32, i32* %c, align 4
  %call5 = call i32 @rl_execute_next(i32 %4)
  store i32 0, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %cxt.addr, align 4
  %6 = load i32, i32* %c, align 4
  %call7 = call i32 @_rl_arg_dispatch(i32 %5, i32 %6)
  store i32 %call7, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  %cmp8 = icmp ne i32 %7, 1
  %conv = zext i1 %cmp8 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then1, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @rl_discard_argument() #0 {
entry:
  %call = call i32 @rl_ding()
  %call1 = call i32 @rl_clear_message()
  call void @_rl_reset_argument()
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @_rl_start_using_history() #0 {
entry:
  call void @using_history()
  %0 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %tobool = icmp ne %struct._hist_entry* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store %struct._hist_entry* null, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  ret void
}

declare void @using_history() #1

; Function Attrs: noinline nounwind
define void @_rl_free_history_entry(%struct._hist_entry* %entry1) #0 {
entry:
  %entry.addr = alloca %struct._hist_entry*, align 4
  store %struct._hist_entry* %entry1, %struct._hist_entry** %entry.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 0
  %2 = load i8*, i8** %line, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %line3 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 0
  %4 = load i8*, i8** %line3, align 4
  call void @free(i8* %4)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %5 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 1
  %6 = load i8*, i8** %timestamp, align 4
  %tobool5 = icmp ne i8* %6, null
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end4
  %7 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %timestamp7 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %7, i32 0, i32 1
  %8 = load i8*, i8** %timestamp7, align 4
  call void @free(i8* %8)
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end4
  %9 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %10 = bitcast %struct._hist_entry* %9 to i8*
  call void @xfree(i8* %10)
  br label %return

return:                                           ; preds = %if.end8, %if.then
  ret void
}

declare void @free(i8*) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_maybe_replace_line() #0 {
entry:
  %temp = alloca %struct._hist_entry*, align 4
  %call = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %temp, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %tobool = icmp ne %struct._hist_entry* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end6

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 2
  %2 = load i8*, i8** %data, align 4
  %3 = bitcast i8* %2 to %struct.undo_list*
  %4 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %cmp = icmp ne %struct.undo_list* %3, %4
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %land.lhs.true
  %call1 = call i32 @where_history()
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %7 = bitcast %struct.undo_list* %6 to i8*
  %call2 = call %struct._hist_entry* @replace_history_entry(i32 %call1, i8* %5, i8* %7)
  store %struct._hist_entry* %call2, %struct._hist_entry** %temp, align 4
  %8 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 0
  %9 = load i8*, i8** %line, align 4
  call void @xfree(i8* %9)
  %10 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %10, i32 0, i32 1
  %11 = load i8*, i8** %timestamp, align 4
  %tobool3 = icmp ne i8* %11, null
  br i1 %tobool3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %12 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp5 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %12, i32 0, i32 1
  %13 = load i8*, i8** %timestamp5, align 4
  call void @free(i8* %13)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %14 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %15 = bitcast %struct._hist_entry* %14 to i8*
  call void @xfree(i8* %15)
  br label %if.end6

if.end6:                                          ; preds = %if.end, %land.lhs.true, %entry
  ret i32 0
}

declare %struct._hist_entry* @current_history() #1

declare %struct._hist_entry* @replace_history_entry(i32, i8*, i8*) #1

declare i32 @where_history() #1

; Function Attrs: noinline nounwind
define i32 @rl_maybe_unsave_line() #0 {
entry:
  %0 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %tobool = icmp ne %struct._hist_entry* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 0
  %2 = load i8*, i8** %line, align 4
  call void @rl_replace_line(i8* %2, i32 0)
  %3 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 2
  %4 = load i8*, i8** %data, align 4
  %5 = bitcast i8* %4 to %struct.undo_list*
  store %struct.undo_list* %5, %struct.undo_list** @rl_undo_list, align 4
  %6 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %6)
  store %struct._hist_entry* null, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %7 = load i32, i32* @rl_end, align 4
  store i32 %7, i32* @rl_point, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

declare void @rl_replace_line(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_maybe_save_line() #0 {
entry:
  %0 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8* @xmalloc(i32 12)
  %1 = bitcast i8* %call to %struct._hist_entry*
  store %struct._hist_entry* %1, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %2 = load i8*, i8** @rl_line_buffer, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @xmalloc(i32 %add)
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %3)
  %4 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %4, i32 0, i32 0
  store i8* %call3, i8** %line, align 4
  %5 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 1
  store i8* null, i8** %timestamp, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %7 = bitcast %struct.undo_list* %6 to i8*
  %8 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 2
  store i8* %7, i8** %data, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare i8* @xmalloc(i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @_rl_free_saved_history_line() #0 {
entry:
  %0 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %tobool = icmp ne %struct._hist_entry* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %1)
  store %struct._hist_entry* null, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @rl_replace_from_history(%struct._hist_entry* %entry1, i32 %flags) #0 {
entry:
  %entry.addr = alloca %struct._hist_entry*, align 4
  %flags.addr = alloca i32, align 4
  store %struct._hist_entry* %entry1, %struct._hist_entry** %entry.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %0, i32 0, i32 0
  %1 = load i8*, i8** %line, align 4
  call void @rl_replace_line(i8* %1, i32 0)
  %2 = load %struct._hist_entry*, %struct._hist_entry** %entry.addr, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %2, i32 0, i32 2
  %3 = load i8*, i8** %data, align 4
  %4 = bitcast i8* %3 to %struct.undo_list*
  store %struct.undo_list* %4, %struct.undo_list** @rl_undo_list, align 4
  %5 = load i32, i32* @rl_end, align 4
  store i32 %5, i32* @rl_point, align 4
  store i32 0, i32* @rl_mark, align 4
  %6 = load i32, i32* @rl_editing_mode, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @rl_point, align 4
  %7 = load i32, i32* @rl_end, align 4
  store i32 %7, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_revert_all_lines() #0 {
entry:
  %hpos = alloca i32, align 4
  %entry1 = alloca %struct._hist_entry*, align 4
  %ul = alloca %struct.undo_list*, align 4
  %saved_undo_list = alloca %struct.undo_list*, align 4
  %lbuf = alloca i8*, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 1, %call
  %call2 = call i8* @xmalloc(i32 %add)
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %1)
  store i8* %call3, i8** %lbuf, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %2, %struct.undo_list** %saved_undo_list, align 4
  %call4 = call i32 @where_history()
  store i32 %call4, i32* %hpos, align 4
  %3 = load i32, i32* %hpos, align 4
  %4 = load i32, i32* @history_length, align 4
  %cmp = icmp eq i32 %3, %4
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call5 = call %struct._hist_entry* @previous_history()
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call6 = call %struct._hist_entry* @current_history()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._hist_entry* [ %call5, %cond.true ], [ %call6, %cond.false ]
  store %struct._hist_entry* %cond, %struct._hist_entry** %entry1, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end24, %cond.end
  %5 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %tobool = icmp ne %struct._hist_entry* %5, null
  br i1 %tobool, label %while.body, label %while.end26

while.body:                                       ; preds = %while.cond
  %6 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 2
  %7 = load i8*, i8** %data, align 4
  %8 = bitcast i8* %7 to %struct.undo_list*
  store %struct.undo_list* %8, %struct.undo_list** %ul, align 4
  %tobool7 = icmp ne %struct.undo_list* %8, null
  br i1 %tobool7, label %if.then, label %if.end24

if.then:                                          ; preds = %while.body
  %9 = load %struct.undo_list*, %struct.undo_list** %ul, align 4
  %10 = load %struct.undo_list*, %struct.undo_list** %saved_undo_list, align 4
  %cmp8 = icmp eq %struct.undo_list* %9, %10
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  store %struct.undo_list* null, %struct.undo_list** %saved_undo_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then
  %11 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  call void @rl_replace_from_history(%struct._hist_entry* %11, i32 0)
  %12 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data10 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %12, i32 0, i32 2
  store i8* null, i8** %data10, align 4
  br label %while.cond11

while.cond11:                                     ; preds = %while.body13, %if.end
  %13 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool12 = icmp ne %struct.undo_list* %13, null
  br i1 %tobool12, label %while.body13, label %while.end

while.body13:                                     ; preds = %while.cond11
  %call14 = call i32 @rl_do_undo()
  br label %while.cond11

while.end:                                        ; preds = %while.cond11
  %14 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %14, i32 0, i32 0
  %15 = load i8*, i8** %line, align 4
  %tobool15 = icmp ne i8* %15, null
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %while.end
  %16 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line17 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %16, i32 0, i32 0
  %17 = load i8*, i8** %line17, align 4
  call void @free(i8* %17)
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %while.end
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %call19 = call i32 @strlen(i8* %18)
  %add20 = add i32 1, %call19
  %call21 = call i8* @xmalloc(i32 %add20)
  %19 = load i8*, i8** @rl_line_buffer, align 4
  %call22 = call i8* @strcpy(i8* %call21, i8* %19)
  %20 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line23 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %20, i32 0, i32 0
  store i8* %call22, i8** %line23, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.end18, %while.body
  %call25 = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call25, %struct._hist_entry** %entry1, align 4
  br label %while.cond

while.end26:                                      ; preds = %while.cond
  %21 = load %struct.undo_list*, %struct.undo_list** %saved_undo_list, align 4
  store %struct.undo_list* %21, %struct.undo_list** @rl_undo_list, align 4
  %22 = load i32, i32* %hpos, align 4
  %call27 = call i32 @history_set_pos(i32 %22)
  %23 = load i8*, i8** %lbuf, align 4
  call void @rl_replace_line(i8* %23, i32 0)
  call void @_rl_set_the_line()
  %24 = load i8*, i8** %lbuf, align 4
  call void @xfree(i8* %24)
  ret void
}

declare %struct._hist_entry* @previous_history() #1

declare i32 @rl_do_undo() #1

declare i32 @history_set_pos(i32) #1

declare void @_rl_set_the_line() #1

; Function Attrs: noinline nounwind
define void @rl_clear_history() #0 {
entry:
  %hlist = alloca %struct._hist_entry**, align 4
  %hent = alloca %struct._hist_entry*, align 4
  %i = alloca i32, align 4
  %ul = alloca %struct.undo_list*, align 4
  %saved_undo_list = alloca %struct.undo_list*, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %0, %struct.undo_list** %saved_undo_list, align 4
  %call = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call, %struct._hist_entry*** %hlist, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* @history_length, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %3, i32 %4
  %5 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %5, %struct._hist_entry** %hent, align 4
  %6 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 2
  %7 = load i8*, i8** %data, align 4
  %8 = bitcast i8* %7 to %struct.undo_list*
  store %struct.undo_list* %8, %struct.undo_list** %ul, align 4
  %tobool = icmp ne %struct.undo_list* %8, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %for.body
  %9 = load %struct.undo_list*, %struct.undo_list** %ul, align 4
  %10 = load %struct.undo_list*, %struct.undo_list** %saved_undo_list, align 4
  %cmp1 = icmp eq %struct.undo_list* %9, %10
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store %struct.undo_list* null, %struct.undo_list** %saved_undo_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %11 = load %struct.undo_list*, %struct.undo_list** %ul, align 4
  call void @_rl_free_undo_list(%struct.undo_list* %11)
  %12 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %data3 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %12, i32 0, i32 2
  store i8* null, i8** %data3, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.end, %for.body
  %13 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  call void @_rl_free_history_entry(%struct._hist_entry* %13)
  br label %for.inc

for.inc:                                          ; preds = %if.end4
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @history_length, align 4
  store i32 0, i32* @history_offset, align 4
  %15 = load %struct.undo_list*, %struct.undo_list** %saved_undo_list, align 4
  store %struct.undo_list* %15, %struct.undo_list** @rl_undo_list, align 4
  ret void
}

declare %struct._hist_entry** @history_list() #1

declare void @_rl_free_undo_list(%struct.undo_list*) #1

; Function Attrs: noinline nounwind
define i32 @rl_beginning_of_history(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @where_history()
  %add = add nsw i32 1, %call
  %0 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_get_previous_history(i32 %add, i32 %0)
  ret i32 %call1
}

; Function Attrs: noinline nounwind
define i32 @rl_get_previous_history(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %old_temp = alloca %struct._hist_entry*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_get_next_history(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* @_rl_history_saved_point, align 4
  %cmp4 = icmp eq i32 %4, -1
  br i1 %cmp4, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %if.end3
  %5 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load i32, i32* @rl_end, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %7 = load i32, i32* @rl_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp7 = icmp eq i32 %7, %8
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  %9 = load i32, i32* @rl_point, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %9, %cond.false ]
  store i32 %cond, i32* @_rl_history_saved_point, align 4
  br label %if.end8

if.end8:                                          ; preds = %cond.end, %lor.lhs.false, %if.end3
  %call9 = call i32 @rl_maybe_save_line()
  %call10 = call i32 @rl_maybe_replace_line()
  store %struct._hist_entry* null, %struct._hist_entry** %old_temp, align 4
  store %struct._hist_entry* null, %struct._hist_entry** %temp, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %if.end8
  %10 = load i32, i32* %count.addr, align 4
  %tobool11 = icmp ne i32 %10, 0
  br i1 %tobool11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call12 = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call12, %struct._hist_entry** %temp, align 4
  %11 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %cmp13 = icmp eq %struct._hist_entry* %11, null
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %while.body
  br label %while.end

if.end15:                                         ; preds = %while.body
  %12 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  store %struct._hist_entry* %12, %struct._hist_entry** %old_temp, align 4
  %13 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then14, %while.cond
  %14 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %tobool16 = icmp ne %struct._hist_entry* %14, null
  br i1 %tobool16, label %if.end20, label %land.lhs.true17

land.lhs.true17:                                  ; preds = %while.end
  %15 = load %struct._hist_entry*, %struct._hist_entry** %old_temp, align 4
  %tobool18 = icmp ne %struct._hist_entry* %15, null
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true17
  %16 = load %struct._hist_entry*, %struct._hist_entry** %old_temp, align 4
  store %struct._hist_entry* %16, %struct._hist_entry** %temp, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %land.lhs.true17, %while.end
  %17 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %cmp21 = icmp eq %struct._hist_entry* %17, null
  br i1 %cmp21, label %if.then22, label %if.else

if.then22:                                        ; preds = %if.end20
  %call23 = call i32 @rl_ding()
  br label %if.end24

if.else:                                          ; preds = %if.end20
  %18 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  call void @rl_replace_from_history(%struct._hist_entry* %18, i32 0)
  call void @_rl_history_set_point()
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then22
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.then2, %if.then
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define i32 @rl_end_of_history(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @rl_maybe_replace_line()
  call void @using_history()
  %call1 = call i32 @rl_maybe_unsave_line()
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_get_next_history(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %temp = alloca %struct._hist_entry*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_get_previous_history(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %call4 = call i32 @rl_maybe_replace_line()
  %4 = load i32, i32* @_rl_history_saved_point, align 4
  %cmp5 = icmp eq i32 %4, -1
  br i1 %cmp5, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end3
  %5 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load i32, i32* @rl_end, align 4
  %tobool6 = icmp ne i32 %6, 0
  br i1 %tobool6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %7 = load i32, i32* @rl_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp8 = icmp eq i32 %7, %8
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then7
  br label %cond.end

cond.false:                                       ; preds = %if.then7
  %9 = load i32, i32* @rl_point, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %9, %cond.false ]
  store i32 %cond, i32* @_rl_history_saved_point, align 4
  br label %if.end9

if.end9:                                          ; preds = %cond.end, %lor.lhs.false, %if.end3
  store %struct._hist_entry* null, %struct._hist_entry** %temp, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end14, %if.end9
  %10 = load i32, i32* %count.addr, align 4
  %tobool10 = icmp ne i32 %10, 0
  br i1 %tobool10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call11 = call %struct._hist_entry* @next_history()
  store %struct._hist_entry* %call11, %struct._hist_entry** %temp, align 4
  %11 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %tobool12 = icmp ne %struct._hist_entry* %11, null
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %while.body
  br label %while.end

if.end14:                                         ; preds = %while.body
  %12 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then13, %while.cond
  %13 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %cmp15 = icmp eq %struct._hist_entry* %13, null
  br i1 %cmp15, label %if.then16, label %if.else

if.then16:                                        ; preds = %while.end
  %call17 = call i32 @rl_maybe_unsave_line()
  br label %if.end18

if.else:                                          ; preds = %while.end
  %14 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  call void @rl_replace_from_history(%struct._hist_entry* %14, i32 0)
  call void @_rl_history_set_point()
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then16
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then2, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare %struct._hist_entry* @next_history() #1

; Function Attrs: noinline nounwind
define internal void @_rl_history_set_point() #0 {
entry:
  %0 = load i32, i32* @_rl_history_preserve_point, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @_rl_history_saved_point, align 4
  %cmp = icmp ne i32 %1, -1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %2 = load i32, i32* @_rl_history_saved_point, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @rl_end, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp sgt i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %6 = load i32, i32* @rl_end, align 4
  store i32 %6, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %7 = load i32, i32* @rl_editing_mode, align 4
  %cmp2 = icmp eq i32 %7, 0
  br i1 %cmp2, label %land.lhs.true3, label %if.end6

land.lhs.true3:                                   ; preds = %if.end
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp4 = icmp ne %struct._keymap_entry* %8, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_insertion_keymap, i32 0, i32 0)
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %land.lhs.true3
  store i32 0, i32* @rl_point, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %land.lhs.true3, %if.end
  %9 = load i32, i32* @rl_editing_mode, align 4
  %cmp7 = icmp eq i32 %9, 1
  br i1 %cmp7, label %if.then8, label %if.end14

if.then8:                                         ; preds = %if.end6
  %10 = load i32, i32* @rl_point, align 4
  %11 = load i32, i32* @rl_end, align 4
  %cmp9 = icmp eq i32 %10, %11
  br i1 %cmp9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %if.then8
  br label %cond.end12

cond.false11:                                     ; preds = %if.then8
  %12 = load i32, i32* @rl_end, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %cond13 = phi i32 [ 0, %cond.true10 ], [ %12, %cond.false11 ]
  store i32 %cond13, i32* @rl_mark, align 4
  br label %if.end14

if.end14:                                         ; preds = %cond.end12, %if.end6
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_vi_editing_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  call void @_rl_set_insert_mode(i32 1, i32 1)
  store i32 0, i32* @rl_editing_mode, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_vi_insert_mode(i32 1, i32 %0)
  ret i32 0
}

; Function Attrs: noinline nounwind
define void @_rl_set_insert_mode(i32 %im, i32 %force) #0 {
entry:
  %im.addr = alloca i32, align 4
  %force.addr = alloca i32, align 4
  store i32 %im, i32* %im.addr, align 4
  store i32 %force, i32* %force.addr, align 4
  %0 = load i32, i32* %im.addr, align 4
  store i32 %0, i32* @rl_insert_mode, align 4
  ret void
}

declare i32 @rl_vi_insert_mode(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_emacs_editing_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 1, i32* @rl_editing_mode, align 4
  call void @_rl_set_insert_mode(i32 1, i32 1)
  store %struct._keymap_entry* getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @emacs_standard_keymap, i32 0, i32 0), %struct._keymap_entry** @_rl_keymap, align 4
  %0 = load i32, i32* @_rl_show_mode_in_prompt, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @_rl_reset_prompt()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare void @_rl_reset_prompt() #1

; Function Attrs: noinline nounwind
define i32 @rl_overwrite_mode(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_insert_mode, align 4
  %xor = xor i32 %1, 1
  call void @_rl_set_insert_mode(i32 %xor, i32 0)
  br label %if.end4

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp sgt i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  call void @_rl_set_insert_mode(i32 0, i32 0)
  br label %if.end

if.else3:                                         ; preds = %if.else
  call void @_rl_set_insert_mode(i32 1, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret i32 0
}

declare i32 @_rl_abort_internal() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
