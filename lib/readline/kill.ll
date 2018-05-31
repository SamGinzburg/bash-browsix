; ModuleID = 'kill.c'
source_filename = "kill.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._hist_entry = type { i8*, i8*, i8* }

@_rl_last_command_was_kill = external global i32, align 4
@rl_point = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@rl_mark = external global i32, align 4
@rl_end = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@rl_kill_ring = internal global i8** null, align 4
@rl_kill_index = internal global i32 0, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@rl_kill_ring_length = internal global i32 0, align 4
@rl_yank_last_arg.history_skip = internal global i32 0, align 4
@rl_yank_last_arg.explicit_arg_p = internal global i32 0, align 4
@rl_yank_last_arg.count_passed = internal global i32 1, align 4
@rl_yank_last_arg.direction = internal global i32 1, align 4
@rl_yank_last_arg.undo_needed = internal global i32 0, align 4
@rl_explicit_arg = external global i32, align 4
@rl_readline_state = external global i32, align 4
@.str = private unnamed_addr constant [7 x i8] c"\1B[201~\00", align 1
@rl_max_kills = internal global i32 10, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c" \00", align 1

; Function Attrs: noinline nounwind
define i32 @rl_set_retained_kills(i32 %num) #0 {
entry:
  %num.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_kill_text(i32 %from, i32 %to) #0 {
entry:
  %retval = alloca i32, align 4
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %text = alloca i8*, align 4
  store i32 %from, i32* %from.addr, align 4
  store i32 %to, i32* %to.addr, align 4
  %0 = load i32, i32* %from.addr, align 4
  %1 = load i32, i32* %to.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @_rl_last_command_was_kill, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @_rl_last_command_was_kill, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %from.addr, align 4
  %4 = load i32, i32* %to.addr, align 4
  %call = call i8* @rl_copy_text(i32 %3, i32 %4)
  store i8* %call, i8** %text, align 4
  %5 = load i32, i32* %from.addr, align 4
  %6 = load i32, i32* %to.addr, align 4
  %call1 = call i32 @rl_delete_text(i32 %5, i32 %6)
  %7 = load i8*, i8** %text, align 4
  %8 = load i32, i32* %from.addr, align 4
  %9 = load i32, i32* %to.addr, align 4
  %cmp2 = icmp slt i32 %8, %9
  %conv = zext i1 %cmp2 to i32
  %call3 = call i32 @_rl_copy_to_kill_ring(i8* %7, i32 %conv)
  %10 = load i32, i32* @_rl_last_command_was_kill, align 4
  %inc4 = add nsw i32 %10, 1
  store i32 %inc4, i32* @_rl_last_command_was_kill, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i8* @rl_copy_text(i32, i32) #1

declare i32 @rl_delete_text(i32, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_copy_to_kill_ring(i8* %text, i32 %append) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %append.addr = alloca i32, align 4
  %old = alloca i8*, align 4
  %new = alloca i8*, align 4
  %slot = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %append, i32* %append.addr, align 4
  %0 = load i32, i32* @_rl_last_command_was_kill, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** @rl_kill_ring, align 4
  %cmp1 = icmp eq i8** %1, null
  br i1 %cmp1, label %if.then, label %if.else15

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i8**, i8*** @rl_kill_ring, align 4
  %cmp2 = icmp eq i8** %2, null
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  store i32 1, i32* @rl_kill_ring_length, align 4
  %call = call i8* @xmalloc(i32 8)
  %3 = bitcast i8* %call to i8**
  store i8** %3, i8*** @rl_kill_ring, align 4
  %4 = load i8**, i8*** @rl_kill_ring, align 4
  store i32 0, i32* %slot, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 0
  store i8* null, i8** %arrayidx, align 4
  br label %if.end14

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @rl_kill_ring_length, align 4
  store i32 %5, i32* %slot, align 4
  %6 = load i32, i32* %slot, align 4
  %7 = load i32, i32* @rl_max_kills, align 4
  %cmp4 = icmp eq i32 %6, %7
  br i1 %cmp4, label %if.then5, label %if.else10

if.then5:                                         ; preds = %if.else
  %8 = load i8**, i8*** @rl_kill_ring, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i32 0
  %9 = load i8*, i8** %arrayidx6, align 4
  call void @xfree(i8* %9)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then5
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %slot, align 4
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i8**, i8*** @rl_kill_ring, align 4
  %13 = load i32, i32* %i, align 4
  %add = add nsw i32 %13, 1
  %arrayidx8 = getelementptr inbounds i8*, i8** %12, i32 %add
  %14 = load i8*, i8** %arrayidx8, align 4
  %15 = load i8**, i8*** @rl_kill_ring, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %15, i32 %16
  store i8* %14, i8** %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else10:                                        ; preds = %if.else
  %18 = load i32, i32* @rl_kill_ring_length, align 4
  %add11 = add nsw i32 %18, 1
  store i32 %add11, i32* @rl_kill_ring_length, align 4
  store i32 %add11, i32* %slot, align 4
  %19 = load i8**, i8*** @rl_kill_ring, align 4
  %20 = bitcast i8** %19 to i8*
  %21 = load i32, i32* %slot, align 4
  %mul = mul i32 %21, 4
  %call12 = call i8* @xrealloc(i8* %20, i32 %mul)
  %22 = bitcast i8* %call12 to i8**
  store i8** %22, i8*** @rl_kill_ring, align 4
  br label %if.end

if.end:                                           ; preds = %if.else10, %for.end
  %23 = load i8**, i8*** @rl_kill_ring, align 4
  %24 = load i32, i32* %slot, align 4
  %dec = add nsw i32 %24, -1
  store i32 %dec, i32* %slot, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %23, i32 %dec
  store i8* null, i8** %arrayidx13, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.end, %if.then3
  br label %if.end16

if.else15:                                        ; preds = %lor.lhs.false
  %25 = load i32, i32* @rl_kill_ring_length, align 4
  %sub = sub nsw i32 %25, 1
  store i32 %sub, i32* %slot, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.end14
  %26 = load i32, i32* @_rl_last_command_was_kill, align 4
  %tobool = icmp ne i32 %26, 0
  br i1 %tobool, label %land.lhs.true, label %if.else34

land.lhs.true:                                    ; preds = %if.end16
  %27 = load i32, i32* @rl_editing_mode, align 4
  %cmp17 = icmp ne i32 %27, 0
  br i1 %cmp17, label %if.then18, label %if.else34

if.then18:                                        ; preds = %land.lhs.true
  %28 = load i8**, i8*** @rl_kill_ring, align 4
  %29 = load i32, i32* %slot, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %28, i32 %29
  %30 = load i8*, i8** %arrayidx19, align 4
  store i8* %30, i8** %old, align 4
  %31 = load i8*, i8** %old, align 4
  %call20 = call i32 @strlen(i8* %31)
  %add21 = add i32 1, %call20
  %32 = load i8*, i8** %text.addr, align 4
  %call22 = call i32 @strlen(i8* %32)
  %add23 = add i32 %add21, %call22
  %call24 = call i8* @xmalloc(i32 %add23)
  store i8* %call24, i8** %new, align 4
  %33 = load i32, i32* %append.addr, align 4
  %tobool25 = icmp ne i32 %33, 0
  br i1 %tobool25, label %if.then26, label %if.else29

if.then26:                                        ; preds = %if.then18
  %34 = load i8*, i8** %new, align 4
  %35 = load i8*, i8** %old, align 4
  %call27 = call i8* @strcpy(i8* %34, i8* %35)
  %36 = load i8*, i8** %new, align 4
  %37 = load i8*, i8** %text.addr, align 4
  %call28 = call i8* @strcat(i8* %36, i8* %37)
  br label %if.end32

if.else29:                                        ; preds = %if.then18
  %38 = load i8*, i8** %new, align 4
  %39 = load i8*, i8** %text.addr, align 4
  %call30 = call i8* @strcpy(i8* %38, i8* %39)
  %40 = load i8*, i8** %new, align 4
  %41 = load i8*, i8** %old, align 4
  %call31 = call i8* @strcat(i8* %40, i8* %41)
  br label %if.end32

if.end32:                                         ; preds = %if.else29, %if.then26
  %42 = load i8*, i8** %old, align 4
  call void @xfree(i8* %42)
  %43 = load i8*, i8** %text.addr, align 4
  call void @xfree(i8* %43)
  %44 = load i8*, i8** %new, align 4
  %45 = load i8**, i8*** @rl_kill_ring, align 4
  %46 = load i32, i32* %slot, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %45, i32 %46
  store i8* %44, i8** %arrayidx33, align 4
  br label %if.end36

if.else34:                                        ; preds = %land.lhs.true, %if.end16
  %47 = load i8*, i8** %text.addr, align 4
  %48 = load i8**, i8*** @rl_kill_ring, align 4
  %49 = load i32, i32* %slot, align 4
  %arrayidx35 = getelementptr inbounds i8*, i8** %48, i32 %49
  store i8* %47, i8** %arrayidx35, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else34, %if.end32
  %50 = load i32, i32* %slot, align 4
  store i32 %50, i32* @rl_kill_index, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_kill_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_backward_kill_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %orig_point, align 4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_forward_word(i32 %4, i32 %5)
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %orig_point, align 4
  %cmp2 = icmp ne i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %8 = load i32, i32* %orig_point, align 4
  %9 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @rl_kill_text(i32 %8, i32 %9)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  %10 = load i32, i32* %orig_point, align 4
  store i32 %10, i32* @rl_point, align 4
  %11 = load i32, i32* @rl_editing_mode, align 4
  %cmp5 = icmp eq i32 %11, 1
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %12 = load i32, i32* @rl_point, align 4
  store i32 %12, i32* @rl_mark, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  br label %if.end8

if.end8:                                          ; preds = %if.end7
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_kill_word(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_kill_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %orig_point, align 4
  %4 = load i32, i32* %count.addr, align 4
  %5 = load i32, i32* %ignore.addr, align 4
  %call1 = call i32 @rl_backward_word(i32 %4, i32 %5)
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %orig_point, align 4
  %cmp2 = icmp ne i32 %6, %7
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %8 = load i32, i32* %orig_point, align 4
  %9 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @rl_kill_text(i32 %8, i32 %9)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  %10 = load i32, i32* @rl_editing_mode, align 4
  %cmp5 = icmp eq i32 %10, 1
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %11 = load i32, i32* @rl_point, align 4
  store i32 %11, i32* @rl_mark, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  br label %if.end8

if.end8:                                          ; preds = %if.end7
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @rl_forward_word(i32, i32) #1

declare i32 @rl_backward_word(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_kill_line(i32 %direction, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %direction.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %direction, i32* %direction.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %direction.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_backward_kill_line(i32 1, i32 %1)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  store i32 %2, i32* %orig_point, align 4
  %3 = load i32, i32* %ignore.addr, align 4
  %call1 = call i32 @rl_end_of_line(i32 1, i32 %3)
  %4 = load i32, i32* %orig_point, align 4
  %5 = load i32, i32* @rl_point, align 4
  %cmp2 = icmp ne i32 %4, %5
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %6 = load i32, i32* %orig_point, align 4
  %7 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @rl_kill_text(i32 %6, i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  %8 = load i32, i32* %orig_point, align 4
  store i32 %8, i32* @rl_point, align 4
  %9 = load i32, i32* @rl_editing_mode, align 4
  %cmp5 = icmp eq i32 %9, 1
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* @rl_point, align 4
  store i32 %10, i32* @rl_mark, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  br label %if.end8

if.end8:                                          ; preds = %if.end7
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_kill_line(i32 %direction, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %direction.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %direction, i32* %direction.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %direction.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_kill_line(i32 1, i32 %1)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %call3 = call i32 @rl_ding()
  br label %if.end12

if.else4:                                         ; preds = %if.else
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %orig_point, align 4
  %4 = load i32, i32* %ignore.addr, align 4
  %call5 = call i32 @rl_beg_of_line(i32 1, i32 %4)
  %5 = load i32, i32* @rl_point, align 4
  %6 = load i32, i32* %orig_point, align 4
  %cmp6 = icmp ne i32 %5, %6
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else4
  %7 = load i32, i32* %orig_point, align 4
  %8 = load i32, i32* @rl_point, align 4
  %call8 = call i32 @rl_kill_text(i32 %7, i32 %8)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.else4
  %9 = load i32, i32* @rl_editing_mode, align 4
  %cmp9 = icmp eq i32 %9, 1
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end
  %10 = load i32, i32* @rl_point, align 4
  store i32 %10, i32* @rl_mark, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then2
  br label %if.end13

if.end13:                                         ; preds = %if.end12
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i32 @rl_end_of_line(i32, i32) #1

declare i32 @rl_ding() #1

declare i32 @rl_beg_of_line(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_kill_full_line(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %call = call i32 @rl_begin_undo_group()
  store i32 0, i32* @rl_point, align 4
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %call1 = call i32 @rl_kill_text(i32 %0, i32 %1)
  store i32 0, i32* @rl_mark, align 4
  %call2 = call i32 @rl_end_undo_group()
  ret i32 0
}

declare i32 @rl_begin_undo_group() #1

declare i32 @rl_end_undo_group() #1

; Function Attrs: noinline nounwind
define i32 @rl_unix_word_rubout(i32 %count, i32 %key) #0 {
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
  br label %if.end41

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

while.cond:                                       ; preds = %while.end34, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end35

while.body:                                       ; preds = %while.cond
  br label %while.cond3

while.cond3:                                      ; preds = %while.body12, %while.body
  %4 = load i32, i32* @rl_point, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond3
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %6, 1
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %sub
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv, 32
  br i1 %cmp5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %8 = load i8*, i8** @rl_line_buffer, align 4
  %9 = load i32, i32* @rl_point, align 4
  %sub7 = sub nsw i32 %9, 1
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i32 %sub7
  %10 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %10 to i32
  %cmp10 = icmp eq i32 %conv9, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %11 = phi i1 [ true, %land.rhs ], [ %cmp10, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond3
  %12 = phi i1 [ false, %while.cond3 ], [ %11, %lor.end ]
  br i1 %12, label %while.body12, label %while.end

while.body12:                                     ; preds = %land.end
  %13 = load i32, i32* @rl_point, align 4
  %dec13 = add nsw i32 %13, -1
  store i32 %dec13, i32* @rl_point, align 4
  br label %while.cond3

while.end:                                        ; preds = %land.end
  br label %while.cond14

while.cond14:                                     ; preds = %while.body32, %while.end
  %14 = load i32, i32* @rl_point, align 4
  %tobool15 = icmp ne i32 %14, 0
  br i1 %tobool15, label %land.rhs16, label %land.end31

land.rhs16:                                       ; preds = %while.cond14
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* @rl_point, align 4
  %sub17 = sub nsw i32 %16, 1
  %arrayidx18 = getelementptr inbounds i8, i8* %15, i32 %sub17
  %17 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %17 to i32
  %cmp20 = icmp eq i32 %conv19, 32
  br i1 %cmp20, label %lor.end28, label %lor.rhs22

lor.rhs22:                                        ; preds = %land.rhs16
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %19 = load i32, i32* @rl_point, align 4
  %sub23 = sub nsw i32 %19, 1
  %arrayidx24 = getelementptr inbounds i8, i8* %18, i32 %sub23
  %20 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %20 to i32
  %cmp26 = icmp eq i32 %conv25, 9
  br label %lor.end28

lor.end28:                                        ; preds = %lor.rhs22, %land.rhs16
  %21 = phi i1 [ true, %land.rhs16 ], [ %cmp26, %lor.rhs22 ]
  %lor.ext = zext i1 %21 to i32
  %cmp29 = icmp eq i32 %lor.ext, 0
  br label %land.end31

land.end31:                                       ; preds = %lor.end28, %while.cond14
  %22 = phi i1 [ false, %while.cond14 ], [ %cmp29, %lor.end28 ]
  br i1 %22, label %while.body32, label %while.end34

while.body32:                                     ; preds = %land.end31
  %23 = load i32, i32* @rl_point, align 4
  %dec33 = add nsw i32 %23, -1
  store i32 %dec33, i32* @rl_point, align 4
  br label %while.cond14

while.end34:                                      ; preds = %land.end31
  br label %while.cond

while.end35:                                      ; preds = %while.cond
  %24 = load i32, i32* %orig_point, align 4
  %25 = load i32, i32* @rl_point, align 4
  %call36 = call i32 @rl_kill_text(i32 %24, i32 %25)
  %26 = load i32, i32* @rl_editing_mode, align 4
  %cmp37 = icmp eq i32 %26, 1
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %while.end35
  %27 = load i32, i32* @rl_point, align 4
  store i32 %27, i32* @rl_mark, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %while.end35
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_unix_filename_rubout(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  br label %if.end42

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

while.cond:                                       ; preds = %while.end35, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end36

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %5, 1
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %sub
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  store i32 %conv, i32* %c, align 4
  br label %while.cond3

while.cond3:                                      ; preds = %while.body11, %while.body
  %7 = load i32, i32* @rl_point, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond3
  %8 = load i32, i32* %c, align 4
  %cmp5 = icmp eq i32 %8, 32
  br i1 %cmp5, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.rhs
  %9 = load i32, i32* %c, align 4
  %cmp7 = icmp eq i32 %9, 9
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %10 = load i32, i32* %c, align 4
  %cmp9 = icmp eq i32 %10, 47
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %land.rhs
  %11 = phi i1 [ true, %lor.lhs.false ], [ true, %land.rhs ], [ %cmp9, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond3
  %12 = phi i1 [ false, %while.cond3 ], [ %11, %lor.end ]
  br i1 %12, label %while.body11, label %while.end

while.body11:                                     ; preds = %land.end
  %13 = load i32, i32* @rl_point, align 4
  %dec12 = add nsw i32 %13, -1
  store i32 %dec12, i32* @rl_point, align 4
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* @rl_point, align 4
  %sub13 = sub nsw i32 %15, 1
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 %sub13
  %16 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %16 to i32
  store i32 %conv15, i32* %c, align 4
  br label %while.cond3

while.end:                                        ; preds = %land.end
  br label %while.cond16

while.cond16:                                     ; preds = %while.body30, %while.end
  %17 = load i32, i32* @rl_point, align 4
  %tobool17 = icmp ne i32 %17, 0
  br i1 %tobool17, label %land.lhs.true, label %land.end29

land.lhs.true:                                    ; preds = %while.cond16
  %18 = load i32, i32* %c, align 4
  %cmp18 = icmp eq i32 %18, 32
  br i1 %cmp18, label %lor.end23, label %lor.rhs20

lor.rhs20:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %c, align 4
  %cmp21 = icmp eq i32 %19, 9
  br label %lor.end23

lor.end23:                                        ; preds = %lor.rhs20, %land.lhs.true
  %20 = phi i1 [ true, %land.lhs.true ], [ %cmp21, %lor.rhs20 ]
  %lor.ext = zext i1 %20 to i32
  %cmp24 = icmp eq i32 %lor.ext, 0
  br i1 %cmp24, label %land.rhs26, label %land.end29

land.rhs26:                                       ; preds = %lor.end23
  %21 = load i32, i32* %c, align 4
  %cmp27 = icmp ne i32 %21, 47
  br label %land.end29

land.end29:                                       ; preds = %land.rhs26, %lor.end23, %while.cond16
  %22 = phi i1 [ false, %lor.end23 ], [ false, %while.cond16 ], [ %cmp27, %land.rhs26 ]
  br i1 %22, label %while.body30, label %while.end35

while.body30:                                     ; preds = %land.end29
  %23 = load i32, i32* @rl_point, align 4
  %dec31 = add nsw i32 %23, -1
  store i32 %dec31, i32* @rl_point, align 4
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* @rl_point, align 4
  %sub32 = sub nsw i32 %25, 1
  %arrayidx33 = getelementptr inbounds i8, i8* %24, i32 %sub32
  %26 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %26 to i32
  store i32 %conv34, i32* %c, align 4
  br label %while.cond16

while.end35:                                      ; preds = %land.end29
  br label %while.cond

while.end36:                                      ; preds = %while.cond
  %27 = load i32, i32* %orig_point, align 4
  %28 = load i32, i32* @rl_point, align 4
  %call37 = call i32 @rl_kill_text(i32 %27, i32 %28)
  %29 = load i32, i32* @rl_editing_mode, align 4
  %cmp38 = icmp eq i32 %29, 1
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %while.end36
  %30 = load i32, i32* @rl_point, align 4
  store i32 %30, i32* @rl_mark, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then40, %while.end36
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_unix_line_discard(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  br label %if.end4

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %call1 = call i32 @rl_kill_text(i32 %1, i32 0)
  store i32 0, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_editing_mode, align 4
  %cmp2 = icmp eq i32 %2, 1
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_copy_region_to_kill(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %call = call i32 @region_kill_internal(i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @region_kill_internal(i32 %delete) #0 {
entry:
  %delete.addr = alloca i32, align 4
  %text = alloca i8*, align 4
  store i32 %delete, i32* %delete.addr, align 4
  %0 = load i32, i32* @rl_mark, align 4
  %1 = load i32, i32* @rl_point, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  %3 = load i32, i32* @rl_mark, align 4
  %call = call i8* @rl_copy_text(i32 %2, i32 %3)
  store i8* %call, i8** %text, align 4
  %4 = load i32, i32* %delete.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %5 = load i32, i32* @rl_point, align 4
  %6 = load i32, i32* @rl_mark, align 4
  %call2 = call i32 @rl_delete_text(i32 %5, i32 %6)
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  %7 = load i8*, i8** %text, align 4
  %8 = load i32, i32* @rl_point, align 4
  %9 = load i32, i32* @rl_mark, align 4
  %cmp3 = icmp slt i32 %8, %9
  %conv = zext i1 %cmp3 to i32
  %call4 = call i32 @_rl_copy_to_kill_ring(i8* %7, i32 %conv)
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  %10 = load i32, i32* @_rl_last_command_was_kill, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @_rl_last_command_was_kill, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_kill_region(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %npoint = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_mark, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* @rl_mark, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, i32* %npoint, align 4
  %call = call i32 @region_kill_internal(i32 1)
  store i32 %call, i32* %r, align 4
  call void @_rl_fix_point(i32 1)
  %4 = load i32, i32* %npoint, align 4
  store i32 %4, i32* @rl_point, align 4
  %5 = load i32, i32* %r, align 4
  ret i32 %5
}

declare void @_rl_fix_point(i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_copy_forward_word(i32 %count, i32 %key) #0 {
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
  %call = call i32 @rl_copy_backward_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %call1 = call i32 @_rl_copy_word_as_kill(i32 %3, i32 1)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define i32 @rl_copy_backward_word(i32 %count, i32 %key) #0 {
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
  %call = call i32 @rl_copy_forward_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %call1 = call i32 @_rl_copy_word_as_kill(i32 %3, i32 -1)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_copy_word_as_kill(i32 %count, i32 %dir) #0 {
entry:
  %count.addr = alloca i32, align 4
  %dir.addr = alloca i32, align 4
  %om = alloca i32, align 4
  %op = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  %0 = load i32, i32* @rl_mark, align 4
  store i32 %0, i32* %om, align 4
  %1 = load i32, i32* @rl_point, align 4
  store i32 %1, i32* %op, align 4
  %2 = load i32, i32* %dir.addr, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %call = call i32 @rl_forward_word(i32 %3, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %count.addr, align 4
  %call1 = call i32 @rl_backward_word(i32 %4, i32 0)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* @rl_point, align 4
  store i32 %5, i32* @rl_mark, align 4
  %6 = load i32, i32* %dir.addr, align 4
  %cmp2 = icmp sgt i32 %6, 0
  br i1 %cmp2, label %if.then3, label %if.else5

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %count.addr, align 4
  %call4 = call i32 @rl_backward_word(i32 %7, i32 0)
  br label %if.end7

if.else5:                                         ; preds = %if.end
  %8 = load i32, i32* %count.addr, align 4
  %call6 = call i32 @rl_forward_word(i32 %8, i32 0)
  br label %if.end7

if.end7:                                          ; preds = %if.else5, %if.then3
  %call8 = call i32 @region_kill_internal(i32 0)
  store i32 %call8, i32* %r, align 4
  %9 = load i32, i32* %om, align 4
  store i32 %9, i32* @rl_mark, align 4
  %10 = load i32, i32* %op, align 4
  store i32 %10, i32* @rl_point, align 4
  %11 = load i32, i32* %r, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @rl_yank(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i8**, i8*** @rl_kill_ring, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %call1 = call i32 @_rl_set_mark_at_pos(i32 %1)
  %2 = load i8**, i8*** @rl_kill_ring, align 4
  %3 = load i32, i32* @rl_kill_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %call2 = call i32 @rl_insert_text(i8* %4)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @_rl_abort_internal() #1

declare i32 @_rl_set_mark_at_pos(i32) #1

declare i32 @rl_insert_text(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_yank_pop(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %l = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp ne i32 (i32, i32)* %0, @rl_yank_pop
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_yank
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i8**, i8*** @rl_kill_ring, align 4
  %tobool = icmp ne i8** %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %call = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8**, i8*** @rl_kill_ring, align 4
  %4 = load i32, i32* @rl_kill_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %call2 = call i32 @strlen(i8* %5)
  store i32 %call2, i32* %l, align 4
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %l, align 4
  %sub = sub nsw i32 %6, %7
  store i32 %sub, i32* %n, align 4
  %8 = load i32, i32* %n, align 4
  %cmp3 = icmp sge i32 %8, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %if.end
  %9 = load i32, i32* %l, align 4
  %cmp5 = icmp eq i32 %9, 0
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true4
  br i1 true, label %if.then18, label %if.else

cond.false:                                       ; preds = %land.lhs.true4
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %n, align 4
  %add.ptr = getelementptr inbounds i8, i8* %10, i32 %11
  %arrayidx6 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %12 = load i8, i8* %arrayidx6, align 1
  %conv = sext i8 %12 to i32
  %13 = load i8**, i8*** @rl_kill_ring, align 4
  %14 = load i32, i32* @rl_kill_index, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %13, i32 %14
  %15 = load i8*, i8** %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %16 to i32
  %cmp10 = icmp eq i32 %conv, %conv9
  br i1 %cmp10, label %land.lhs.true12, label %if.else

land.lhs.true12:                                  ; preds = %cond.false
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* %n, align 4
  %add.ptr13 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8**, i8*** @rl_kill_ring, align 4
  %20 = load i32, i32* @rl_kill_index, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx14, align 4
  %22 = load i32, i32* %l, align 4
  %call15 = call i32 @strncmp(i8* %add.ptr13, i8* %21, i32 %22)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true12, %cond.true
  %23 = load i32, i32* %n, align 4
  %24 = load i32, i32* @rl_point, align 4
  %call19 = call i32 @rl_delete_text(i32 %23, i32 %24)
  %25 = load i32, i32* %n, align 4
  store i32 %25, i32* @rl_point, align 4
  %26 = load i32, i32* @rl_kill_index, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* @rl_kill_index, align 4
  %27 = load i32, i32* @rl_kill_index, align 4
  %cmp20 = icmp slt i32 %27, 0
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.then18
  %28 = load i32, i32* @rl_kill_ring_length, align 4
  %sub23 = sub nsw i32 %28, 1
  store i32 %sub23, i32* @rl_kill_index, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.then18
  %call25 = call i32 @rl_yank(i32 1, i32 0)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true12, %cond.false, %cond.true, %if.end
  %call26 = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end24, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

declare i32 @strlen(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_vi_yank_pop(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %l = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp ne i32 (i32, i32)* %0, @rl_vi_yank_pop
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp1 = icmp ne i32 (i32, i32)* %1, @rl_vi_put
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i8**, i8*** @rl_kill_ring, align 4
  %tobool = icmp ne i8** %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %call = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8**, i8*** @rl_kill_ring, align 4
  %4 = load i32, i32* @rl_kill_index, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %call2 = call i32 @strlen(i8* %5)
  store i32 %call2, i32* %l, align 4
  %6 = load i32, i32* @rl_point, align 4
  %7 = load i32, i32* %l, align 4
  %sub = sub nsw i32 %6, %7
  store i32 %sub, i32* %n, align 4
  %8 = load i32, i32* %n, align 4
  %cmp3 = icmp sge i32 %8, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %if.end
  %9 = load i32, i32* %l, align 4
  %cmp5 = icmp eq i32 %9, 0
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true4
  br i1 true, label %if.then18, label %if.else

cond.false:                                       ; preds = %land.lhs.true4
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %n, align 4
  %add.ptr = getelementptr inbounds i8, i8* %10, i32 %11
  %arrayidx6 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %12 = load i8, i8* %arrayidx6, align 1
  %conv = sext i8 %12 to i32
  %13 = load i8**, i8*** @rl_kill_ring, align 4
  %14 = load i32, i32* @rl_kill_index, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %13, i32 %14
  %15 = load i8*, i8** %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %16 to i32
  %cmp10 = icmp eq i32 %conv, %conv9
  br i1 %cmp10, label %land.lhs.true12, label %if.else

land.lhs.true12:                                  ; preds = %cond.false
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* %n, align 4
  %add.ptr13 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8**, i8*** @rl_kill_ring, align 4
  %20 = load i32, i32* @rl_kill_index, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx14, align 4
  %22 = load i32, i32* %l, align 4
  %call15 = call i32 @strncmp(i8* %add.ptr13, i8* %21, i32 %22)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true12, %cond.true
  %23 = load i32, i32* %n, align 4
  %24 = load i32, i32* @rl_point, align 4
  %call19 = call i32 @rl_delete_text(i32 %23, i32 %24)
  %25 = load i32, i32* %n, align 4
  store i32 %25, i32* @rl_point, align 4
  %26 = load i32, i32* @rl_kill_index, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* @rl_kill_index, align 4
  %27 = load i32, i32* @rl_kill_index, align 4
  %cmp20 = icmp slt i32 %27, 0
  br i1 %cmp20, label %if.then22, label %if.end24

if.then22:                                        ; preds = %if.then18
  %28 = load i32, i32* @rl_kill_ring_length, align 4
  %sub23 = sub nsw i32 %28, 1
  store i32 %sub23, i32* @rl_kill_index, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %if.then18
  %call25 = call i32 @rl_vi_put(i32 1, i32 112)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true12, %cond.false, %cond.true, %if.end
  %call26 = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end24, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

declare i32 @rl_vi_put(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_yank_nth_arg(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* %ignore.addr, align 4
  %call = call i32 @rl_yank_nth_arg_internal(i32 %0, i32 %1, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @rl_yank_nth_arg_internal(i32 %count, i32 %ignore, i32 %history_skip) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %history_skip.addr = alloca i32, align 4
  %entry1 = alloca %struct._hist_entry*, align 4
  %arg = alloca i8*, align 4
  %i = alloca i32, align 4
  %pos = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %history_skip, i32* %history_skip.addr, align 4
  %call = call i32 @where_history()
  store i32 %call, i32* %pos, align 4
  %0 = load i32, i32* %history_skip.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %history_skip.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call2 = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call2, %struct._hist_entry** %entry1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %call3 = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call3, %struct._hist_entry** %entry1, align 4
  %4 = load i32, i32* %pos, align 4
  %call4 = call i32 @history_set_pos(i32 %4)
  %5 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %cmp5 = icmp eq %struct._hist_entry* %5, null
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %call7 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.end
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %count.addr, align 4
  %8 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 0
  %9 = load i8*, i8** %line, align 4
  %call9 = call i8* @history_arg_extract(i32 %6, i32 %7, i8* %9)
  store i8* %call9, i8** %arg, align 4
  %10 = load i8*, i8** %arg, align 4
  %tobool10 = icmp ne i8* %10, null
  br i1 %tobool10, label %lor.lhs.false, label %if.then12

lor.lhs.false:                                    ; preds = %if.end8
  %11 = load i8*, i8** %arg, align 4
  %12 = load i8, i8* %11, align 1
  %tobool11 = icmp ne i8 %12, 0
  br i1 %tobool11, label %if.end17, label %if.then12

if.then12:                                        ; preds = %lor.lhs.false, %if.end8
  %call13 = call i32 @rl_ding()
  %13 = load i8*, i8** %arg, align 4
  %tobool14 = icmp ne i8* %13, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.then12
  %14 = load i8*, i8** %arg, align 4
  call void @free(i8* %14)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.then12
  store i32 1, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %lor.lhs.false
  %call18 = call i32 @rl_begin_undo_group()
  %15 = load i32, i32* @rl_point, align 4
  %call19 = call i32 @_rl_set_mark_at_pos(i32 %15)
  %16 = load i32, i32* @rl_editing_mode, align 4
  %cmp20 = icmp eq i32 %16, 0
  br i1 %cmp20, label %if.then21, label %if.end24

if.then21:                                        ; preds = %if.end17
  %17 = load i32, i32* %ignore.addr, align 4
  %call22 = call i32 @rl_vi_append_mode(i32 1, i32 %17)
  %call23 = call i32 @rl_insert_text(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end24

if.end24:                                         ; preds = %if.then21, %if.end17
  %18 = load i8*, i8** %arg, align 4
  %call25 = call i32 @rl_insert_text(i8* %18)
  %19 = load i8*, i8** %arg, align 4
  call void @xfree(i8* %19)
  %call26 = call i32 @rl_end_undo_group()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.end16, %if.then6
  %20 = load i32, i32* %retval, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind
define i32 @rl_yank_last_arg(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32 (i32, i32)*, i32 (i32, i32)** @rl_last_func, align 4
  %cmp = icmp ne i32 (i32, i32)* %0, @rl_yank_last_arg
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @rl_yank_last_arg.history_skip, align 4
  %1 = load i32, i32* @rl_explicit_arg, align 4
  store i32 %1, i32* @rl_yank_last_arg.explicit_arg_p, align 4
  %2 = load i32, i32* %count.addr, align 4
  store i32 %2, i32* @rl_yank_last_arg.count_passed, align 4
  store i32 1, i32* @rl_yank_last_arg.direction, align 4
  br label %if.end9

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @rl_yank_last_arg.undo_needed, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  %call = call i32 @rl_do_undo()
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  %4 = load i32, i32* %count.addr, align 4
  %cmp3 = icmp slt i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %5 = load i32, i32* @rl_yank_last_arg.direction, align 4
  %sub = sub nsw i32 0, %5
  store i32 %sub, i32* @rl_yank_last_arg.direction, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %6 = load i32, i32* @rl_yank_last_arg.direction, align 4
  %7 = load i32, i32* @rl_yank_last_arg.history_skip, align 4
  %add = add nsw i32 %7, %6
  store i32 %add, i32* @rl_yank_last_arg.history_skip, align 4
  %8 = load i32, i32* @rl_yank_last_arg.history_skip, align 4
  %cmp6 = icmp slt i32 %8, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  store i32 0, i32* @rl_yank_last_arg.history_skip, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then
  %9 = load i32, i32* @rl_yank_last_arg.explicit_arg_p, align 4
  %tobool10 = icmp ne i32 %9, 0
  br i1 %tobool10, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.end9
  %10 = load i32, i32* @rl_yank_last_arg.count_passed, align 4
  %11 = load i32, i32* %key.addr, align 4
  %12 = load i32, i32* @rl_yank_last_arg.history_skip, align 4
  %call12 = call i32 @rl_yank_nth_arg_internal(i32 %10, i32 %11, i32 %12)
  store i32 %call12, i32* %retval1, align 4
  br label %if.end15

if.else13:                                        ; preds = %if.end9
  %13 = load i32, i32* %key.addr, align 4
  %14 = load i32, i32* @rl_yank_last_arg.history_skip, align 4
  %call14 = call i32 @rl_yank_nth_arg_internal(i32 36, i32 %13, i32 %14)
  store i32 %call14, i32* %retval1, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.else13, %if.then11
  %15 = load i32, i32* %retval1, align 4
  %cmp16 = icmp eq i32 %15, 0
  %conv = zext i1 %cmp16 to i32
  store i32 %conv, i32* @rl_yank_last_arg.undo_needed, align 4
  %16 = load i32, i32* %retval1, align 4
  ret i32 %16
}

declare i32 @rl_do_undo() #1

; Function Attrs: noinline nounwind
define i32 @rl_bracketed_paste_begin(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %c = alloca i32, align 4
  %len = alloca i32, align 4
  %cap = alloca i32, align 4
  %buf = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 1, i32* %retval1, align 4
  store i32 0, i32* %len, align 4
  store i32 64, i32* %cap, align 4
  %call = call i8* @xmalloc(i32 64)
  store i8* %call, i8** %buf, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %entry
  %call2 = call i32 @rl_read_key()
  store i32 %call2, i32* %c, align 4
  %cmp = icmp sge i32 %call2, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, 4096
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %2 = load i32, i32* %c, align 4
  call void @_rl_add_macro_char(i32 %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %3 = load i32, i32* %c, align 4
  %cmp3 = icmp eq i32 %3, 13
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 10, i32* %c, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %4 = load i32, i32* %len, align 4
  %5 = load i32, i32* %cap, align 4
  %cmp6 = icmp eq i32 %4, %5
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %6 = load i8*, i8** %buf, align 4
  %7 = load i32, i32* %cap, align 4
  %mul = mul i32 %7, 2
  store i32 %mul, i32* %cap, align 4
  %call8 = call i8* @xrealloc(i8* %6, i32 %mul)
  store i8* %call8, i8** %buf, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end5
  %8 = load i32, i32* %c, align 4
  %conv = trunc i32 %8 to i8
  %9 = load i8*, i8** %buf, align 4
  %10 = load i32, i32* %len, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %10
  store i8 %conv, i8* %arrayidx, align 1
  %11 = load i32, i32* %len, align 4
  %cmp10 = icmp uge i32 %11, 6
  br i1 %cmp10, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %if.end9
  %12 = load i32, i32* %c, align 4
  %cmp12 = icmp eq i32 %12, 126
  br i1 %cmp12, label %land.lhs.true14, label %if.end28

land.lhs.true14:                                  ; preds = %land.lhs.true
  br i1 false, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true14
  br i1 true, label %if.then27, label %if.end28

cond.false:                                       ; preds = %land.lhs.true14
  %13 = load i8*, i8** %buf, align 4
  %14 = load i32, i32* %len, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %add.ptr15 = getelementptr inbounds i8, i8* %add.ptr, i32 -6
  %arrayidx16 = getelementptr inbounds i8, i8* %add.ptr15, i32 0
  %15 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %15 to i32
  %16 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv18 = sext i8 %16 to i32
  %cmp19 = icmp eq i32 %conv17, %conv18
  br i1 %cmp19, label %land.lhs.true21, label %if.end28

land.lhs.true21:                                  ; preds = %cond.false
  %17 = load i8*, i8** %buf, align 4
  %18 = load i32, i32* %len, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %17, i32 %18
  %add.ptr23 = getelementptr inbounds i8, i8* %add.ptr22, i32 -6
  %call24 = call i32 @strncmp(i8* %add.ptr23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 6)
  %cmp25 = icmp eq i32 %call24, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true21, %cond.true
  %19 = load i32, i32* %len, align 4
  %sub = sub i32 %19, 6
  store i32 %sub, i32* %len, align 4
  br label %while.end

if.end28:                                         ; preds = %land.lhs.true21, %cond.false, %cond.true, %land.lhs.true, %if.end9
  br label %while.cond

while.end:                                        ; preds = %if.then27, %while.cond
  %20 = load i32, i32* @rl_readline_state, align 4
  %and29 = and i32 %20, -65
  store i32 %and29, i32* @rl_readline_state, align 4
  %21 = load i32, i32* %c, align 4
  %cmp30 = icmp sge i32 %21, 0
  br i1 %cmp30, label %if.then32, label %if.end40

if.then32:                                        ; preds = %while.end
  %22 = load i32, i32* %len, align 4
  %23 = load i32, i32* %cap, align 4
  %cmp33 = icmp eq i32 %22, %23
  br i1 %cmp33, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.then32
  %24 = load i8*, i8** %buf, align 4
  %25 = load i32, i32* %cap, align 4
  %add = add i32 %25, 1
  %call36 = call i8* @xrealloc(i8* %24, i32 %add)
  store i8* %call36, i8** %buf, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %if.then32
  %26 = load i8*, i8** %buf, align 4
  %27 = load i32, i32* %len, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %26, i32 %27
  store i8 0, i8* %arrayidx38, align 1
  %28 = load i8*, i8** %buf, align 4
  %call39 = call i32 @rl_insert_text(i8* %28)
  store i32 %call39, i32* %retval1, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.end37, %while.end
  %29 = load i8*, i8** %buf, align 4
  call void @xfree(i8* %29)
  %30 = load i32, i32* %retval1, align 4
  ret i32 %30
}

declare i8* @xmalloc(i32) #1

declare i32 @rl_read_key() #1

declare void @_rl_add_macro_char(i32) #1

declare i8* @xrealloc(i8*, i32) #1

declare void @xfree(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @strcat(i8*, i8*) #1

declare i32 @where_history() #1

declare %struct._hist_entry* @previous_history() #1

declare i32 @history_set_pos(i32) #1

declare i8* @history_arg_extract(i32, i32, i8*) #1

declare void @free(i8*) #1

declare i32 @rl_vi_append_mode(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
