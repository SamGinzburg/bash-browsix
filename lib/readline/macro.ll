; ModuleID = 'macro.c'
source_filename = "macro.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.saved_macro = type { %struct.saved_macro*, i8*, i32 }
%struct._IO_FILE = type opaque

@rl_executing_macro = global i8* null, align 4
@executing_macro_index = internal global i32 0, align 4
@rl_readline_state = external global i32, align 4
@macro_list = internal global %struct.saved_macro* null, align 4
@current_macro_index = internal global i32 0, align 4
@current_macro_size = internal global i32 0, align 4
@current_macro = internal global i8* null, align 4
@rl_explicit_arg = external global i32, align 4
@rl_key_sequence_length = external global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@rl_display_fixed = external global i32, align 4

; Function Attrs: noinline nounwind
define void @_rl_with_macro_input(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  call void @_rl_push_executing_macro()
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** @rl_executing_macro, align 4
  store i32 0, i32* @executing_macro_index, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 2048
  store i32 %or, i32* @rl_readline_state, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @_rl_push_executing_macro() #0 {
entry:
  %saver = alloca %struct.saved_macro*, align 4
  %call = call i8* @xmalloc(i32 12)
  %0 = bitcast i8* %call to %struct.saved_macro*
  store %struct.saved_macro* %0, %struct.saved_macro** %saver, align 4
  %1 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  %2 = load %struct.saved_macro*, %struct.saved_macro** %saver, align 4
  %next = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %2, i32 0, i32 0
  store %struct.saved_macro* %1, %struct.saved_macro** %next, align 4
  %3 = load i32, i32* @executing_macro_index, align 4
  %4 = load %struct.saved_macro*, %struct.saved_macro** %saver, align 4
  %sindex = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %4, i32 0, i32 2
  store i32 %3, i32* %sindex, align 4
  %5 = load i8*, i8** @rl_executing_macro, align 4
  %6 = load %struct.saved_macro*, %struct.saved_macro** %saver, align 4
  %string = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %6, i32 0, i32 1
  store i8* %5, i8** %string, align 4
  %7 = load %struct.saved_macro*, %struct.saved_macro** %saver, align 4
  store %struct.saved_macro* %7, %struct.saved_macro** @macro_list, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_next_macro_key() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %0 = load i8*, i8** @rl_executing_macro, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** @rl_executing_macro, align 4
  %2 = load i32, i32* @executing_macro_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @_rl_pop_executing_macro()
  %call = call i32 @_rl_next_macro_key()
  store i32 %call, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %4 = load i8*, i8** @rl_executing_macro, align 4
  %5 = load i32, i32* @executing_macro_index, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @executing_macro_index, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %6 to i32
  store i32 %conv6, i32* %c, align 4
  %7 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %7, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.end4
  %8 = load i32, i32* @rl_readline_state, align 4
  %and7 = and i32 %8, 72
  %tobool8 = icmp ne i32 %and7, 0
  br i1 %tobool8, label %land.lhs.true9, label %if.end15

land.lhs.true9:                                   ; preds = %land.lhs.true
  %9 = load i8*, i8** @rl_executing_macro, align 4
  %10 = load i32, i32* @executing_macro_index, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %11 to i32
  %cmp12 = icmp eq i32 %conv11, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %land.lhs.true9
  call void @_rl_pop_executing_macro()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %land.lhs.true9, %land.lhs.true, %if.end4
  %12 = load i32, i32* %c, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define void @_rl_pop_executing_macro() #0 {
entry:
  %macro = alloca %struct.saved_macro*, align 4
  %0 = load i8*, i8** @rl_executing_macro, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @rl_executing_macro, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i8* null, i8** @rl_executing_macro, align 4
  store i32 0, i32* @executing_macro_index, align 4
  %2 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  %tobool1 = icmp ne %struct.saved_macro* %2, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  store %struct.saved_macro* %3, %struct.saved_macro** %macro, align 4
  %4 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  %string = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %4, i32 0, i32 1
  %5 = load i8*, i8** %string, align 4
  store i8* %5, i8** @rl_executing_macro, align 4
  %6 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  %sindex = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %6, i32 0, i32 2
  %7 = load i32, i32* %sindex, align 4
  store i32 %7, i32* @executing_macro_index, align 4
  %8 = load %struct.saved_macro*, %struct.saved_macro** @macro_list, align 4
  %next = getelementptr inbounds %struct.saved_macro, %struct.saved_macro* %8, i32 0, i32 0
  %9 = load %struct.saved_macro*, %struct.saved_macro** %next, align 4
  store %struct.saved_macro* %9, %struct.saved_macro** @macro_list, align 4
  %10 = load %struct.saved_macro*, %struct.saved_macro** %macro, align 4
  %11 = bitcast %struct.saved_macro* %10 to i8*
  call void @xfree(i8* %11)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %12 = load i8*, i8** @rl_executing_macro, align 4
  %cmp = icmp eq i8* %12, null
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  %13 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %13, -2049
  store i32 %and, i32* @rl_readline_state, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_prev_macro_key() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i8*, i8** @rl_executing_macro, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @executing_macro_index, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %2 = load i32, i32* @executing_macro_index, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @executing_macro_index, align 4
  %3 = load i8*, i8** @rl_executing_macro, align 4
  %4 = load i32, i32* @executing_macro_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i8* @xmalloc(i32) #1

declare void @free(i8*) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define void @_rl_add_macro_char(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @current_macro_index, align 4
  %add = add nsw i32 %0, 1
  %1 = load i32, i32* @current_macro_size, align 4
  %cmp = icmp sge i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** @current_macro, align 4
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store i32 25, i32* @current_macro_size, align 4
  %call = call i8* @xmalloc(i32 25)
  store i8* %call, i8** @current_macro, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %3 = load i8*, i8** @current_macro, align 4
  %4 = load i32, i32* @current_macro_size, align 4
  %add3 = add nsw i32 %4, 25
  store i32 %add3, i32* @current_macro_size, align 4
  %call4 = call i8* @xrealloc(i8* %3, i32 %add3)
  store i8* %call4, i8** @current_macro, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end5

if.end5:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %5 to i8
  %6 = load i8*, i8** @current_macro, align 4
  %7 = load i32, i32* @current_macro_index, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* @current_macro_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  store i8 %conv, i8* %arrayidx, align 1
  %8 = load i8*, i8** @current_macro, align 4
  %9 = load i32, i32* @current_macro_index, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 0, i8* %arrayidx6, align 1
  ret void
}

declare i8* @xrealloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define void @_rl_kill_kbd_macro() #0 {
entry:
  %0 = load i8*, i8** @current_macro, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @current_macro, align 4
  call void @xfree(i8* %1)
  store i8* null, i8** @current_macro, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* @current_macro_index, align 4
  store i32 0, i32* @current_macro_size, align 4
  %2 = load i8*, i8** @rl_executing_macro, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** @rl_executing_macro, align 4
  call void @free(i8* %3)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  store i8* null, i8** @rl_executing_macro, align 4
  store i32 0, i32* @executing_macro_index, align 4
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, -4097
  store i32 %and, i32* @rl_readline_state, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @rl_start_kbd_macro(i32 %ignore1, i32 %ignore2) #0 {
entry:
  %retval = alloca i32, align 4
  %ignore1.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore1, i32* %ignore1.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 4096
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_explicit_arg, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** @current_macro, align 4
  %tobool3 = icmp ne i8* %2, null
  br i1 %tobool3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.then2
  %3 = load i8*, i8** @current_macro, align 4
  %call5 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call5
  %call6 = call i8* @xmalloc(i32 %add)
  %4 = load i8*, i8** @current_macro, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %4)
  call void @_rl_with_macro_input(i8* %call7)
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.then2
  br label %if.end9

if.else:                                          ; preds = %if.end
  store i32 0, i32* @current_macro_index, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.end8
  %5 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %5, 4096
  store i32 %or, i32* @rl_readline_state, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @_rl_abort_internal() #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_end_kbd_macro(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 4096
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @_rl_abort_internal()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_key_sequence_length, align 4
  %2 = load i32, i32* @current_macro_index, align 4
  %sub = sub nsw i32 %2, %1
  store i32 %sub, i32* @current_macro_index, align 4
  %3 = load i8*, i8** @current_macro, align 4
  %4 = load i32, i32* @current_macro_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %4
  store i8 0, i8* %arrayidx, align 1
  %5 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %5, -4097
  store i32 %and1, i32* @rl_readline_state, align 4
  %6 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* %count.addr, align 4
  %call2 = call i32 @rl_call_last_kbd_macro(i32 %dec, i32 0)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @rl_call_last_kbd_macro(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i8*, i8** @current_macro, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @_rl_abort_internal()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %1, 4096
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %call2 = call i32 @rl_ding()
  %2 = load i8*, i8** @current_macro, align 4
  %3 = load i32, i32* @current_macro_index, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @current_macro_index, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %dec
  store i8 0, i8* %arrayidx, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end3
  %4 = load i32, i32* %count.addr, align 4
  %dec4 = add nsw i32 %4, -1
  store i32 %dec4, i32* %count.addr, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i8*, i8** @current_macro, align 4
  %call6 = call i32 @strlen(i8* %5)
  %add = add i32 1, %call6
  %call7 = call i8* @xmalloc(i32 %add)
  %6 = load i8*, i8** @current_macro, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %6)
  call void @_rl_with_macro_input(i8* %call8)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then1
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @rl_ding() #1

; Function Attrs: noinline nounwind
define i32 @rl_print_last_kbd_macro(i32 %count, i32 %ignore) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %m = alloca i8*, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i8*, i8** @current_macro, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** @current_macro, align 4
  %call1 = call i8* @_rl_untranslate_macro_value(i8* %1, i32 1)
  store i8* %call1, i8** %m, align 4
  %call2 = call i32 @rl_crlf()
  %2 = load i8*, i8** %m, align 4
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call4 = call i32 @fflush(%struct._IO_FILE* %3)
  %call5 = call i32 @rl_crlf()
  %4 = load i8*, i8** %m, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  %5 = load i8*, i8** %m, align 4
  call void @free(i8* %5)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %call8 = call i32 @rl_forced_update_display()
  store i32 1, i32* @rl_display_fixed, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i8* @_rl_untranslate_macro_value(i8*, i32) #1

declare i32 @rl_crlf() #1

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @rl_forced_update_display() #1

; Function Attrs: noinline nounwind
define void @rl_push_macro_input(i8* %macro) #0 {
entry:
  %macro.addr = alloca i8*, align 4
  store i8* %macro, i8** %macro.addr, align 4
  %0 = load i8*, i8** %macro.addr, align 4
  call void @_rl_with_macro_input(i8* %0)
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
