; ModuleID = 'text.c'
source_filename = "text.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.__mbstate_t = type { i32, i32 }
%struct.__rl_callback_generic_arg = type { i32, i32, i32 }

@_rl_optimize_typeahead = global i32 1, align 4
@rl_end = external global i32, align 4
@rl_line_buffer_len = external global i32, align 4
@rl_point = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@_rl_doing_an_undo = external global i32, align 4
@rl_undo_list = external global %struct.undo_list*, align 4
@rl_mark = external global i32, align 4
@rl_editing_mode = external global i32, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@vi_movement_keymap = external global [257 x %struct._keymap_entry], align 4
@rl_byte_oriented = external global i32, align 4
@rl_display_fixed = external global i32, align 4
@rl_explicit_arg = external global i32, align 4
@rl_readline_state = external global i32, align 4
@_rl_insert_char.stored_count = internal global i32 0, align 4
@ps = internal global %struct.__mbstate_t zeroinitializer, align 4
@pending_bytes = internal global [16 x i8] zeroinitializer, align 1
@pending_bytes_length = internal global i32 0, align 4
@rl_insert_mode = external global i32, align 4
@rl_done = external global i32, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@rl_executing_keyseq = external global i8*, align 4
@rl_key_sequence_length = external global i32, align 4
@_rl_callback_data = external global %struct.__rl_callback_generic_arg*, align 4
@_rl_callback_func = external global i32 (%struct.__rl_callback_generic_arg*)*, align 4
@_rl_history_preserve_point = external global i32, align 4
@_rl_history_saved_point = external global i32, align 4
@_rl_vi_last_command = external global i32, align 4
@rl_erase_empty_line = external global i32, align 4
@_rl_echoing_p = external global i32, align 4
@_rl_last_c_pos = external global i32, align 4
@_rl_comment_begin = external global i8*, align 4
@.str = private unnamed_addr constant [2 x i8] c"#\00", align 1
@rl_redisplay_function = external global void ()*, align 4
@_rl_want_redisplay = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @rl_insert_text(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %l, align 4
  %4 = load i32, i32* %l, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %5 = load i32, i32* @rl_end, align 4
  %6 = load i32, i32* %l, align 4
  %add = add nsw i32 %5, %6
  %7 = load i32, i32* @rl_line_buffer_len, align 4
  %cmp3 = icmp sge i32 %add, %7
  br i1 %cmp3, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %8 = load i32, i32* @rl_end, align 4
  %9 = load i32, i32* %l, align 4
  %add6 = add nsw i32 %8, %9
  call void @rl_extend_line_buffer(i32 %add6)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %10 = load i32, i32* @rl_end, align 4
  store i32 %10, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* @rl_point, align 4
  %cmp8 = icmp sge i32 %11, %12
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx, align 1
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %l, align 4
  %add10 = add nsw i32 %17, %18
  %arrayidx11 = getelementptr inbounds i8, i8* %16, i32 %add10
  store i8 %15, i8* %arrayidx11, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* @rl_point, align 4
  %add.ptr = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8*, i8** %string.addr, align 4
  %23 = load i32, i32* %l, align 4
  %call12 = call i8* @strncpy(i8* %add.ptr, i8* %22, i32 %23)
  %24 = load i32, i32* @_rl_doing_an_undo, align 4
  %cmp13 = icmp eq i32 %24, 0
  br i1 %cmp13, label %if.then15, label %if.end34

if.then15:                                        ; preds = %for.end
  %25 = load i32, i32* %l, align 4
  %cmp16 = icmp eq i32 %25, 1
  br i1 %cmp16, label %land.lhs.true18, label %if.else

land.lhs.true18:                                  ; preds = %if.then15
  %26 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool19 = icmp ne %struct.undo_list* %26, null
  br i1 %tobool19, label %land.lhs.true20, label %if.else

land.lhs.true20:                                  ; preds = %land.lhs.true18
  %27 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %27, i32 0, i32 4
  %28 = load i32, i32* %what, align 4
  %cmp21 = icmp eq i32 %28, 1
  br i1 %cmp21, label %land.lhs.true23, label %if.else

land.lhs.true23:                                  ; preds = %land.lhs.true20
  %29 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end = getelementptr inbounds %struct.undo_list, %struct.undo_list* %29, i32 0, i32 2
  %30 = load i32, i32* %end, align 4
  %31 = load i32, i32* @rl_point, align 4
  %cmp24 = icmp eq i32 %30, %31
  br i1 %cmp24, label %land.lhs.true26, label %if.else

land.lhs.true26:                                  ; preds = %land.lhs.true23
  %32 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end27 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %32, i32 0, i32 2
  %33 = load i32, i32* %end27, align 4
  %34 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %start = getelementptr inbounds %struct.undo_list, %struct.undo_list* %34, i32 0, i32 1
  %35 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %33, %35
  %cmp28 = icmp slt i32 %sub, 20
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %land.lhs.true26
  %36 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end31 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %36, i32 0, i32 2
  %37 = load i32, i32* %end31, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %end31, align 4
  br label %if.end33

if.else:                                          ; preds = %land.lhs.true26, %land.lhs.true23, %land.lhs.true20, %land.lhs.true18, %if.then15
  %38 = load i32, i32* @rl_point, align 4
  %39 = load i32, i32* @rl_point, align 4
  %40 = load i32, i32* %l, align 4
  %add32 = add nsw i32 %39, %40
  call void @rl_add_undo(i32 1, i32 %38, i32 %add32, i8* null)
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then30
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %for.end
  %41 = load i32, i32* %l, align 4
  %42 = load i32, i32* @rl_point, align 4
  %add35 = add nsw i32 %42, %41
  store i32 %add35, i32* @rl_point, align 4
  %43 = load i32, i32* %l, align 4
  %44 = load i32, i32* @rl_end, align 4
  %add36 = add nsw i32 %44, %43
  store i32 %add36, i32* @rl_end, align 4
  %45 = load i8*, i8** @rl_line_buffer, align 4
  %46 = load i32, i32* @rl_end, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %45, i32 %46
  store i8 0, i8* %arrayidx37, align 1
  %47 = load i32, i32* %l, align 4
  store i32 %47, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end34, %if.then
  %48 = load i32, i32* %retval, align 4
  ret i32 %48
}

declare i32 @strlen(i8*) #1

declare void @rl_extend_line_buffer(i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare void @rl_add_undo(i32, i32, i32, i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_delete_text(i32 %from, i32 %to) #0 {
entry:
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %text = alloca i8*, align 4
  %diff = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %from, i32* %from.addr, align 4
  store i32 %to, i32* %to.addr, align 4
  %0 = load i32, i32* %from.addr, align 4
  %1 = load i32, i32* %to.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %2 = load i32, i32* %from.addr, align 4
  store i32 %2, i32* %t, align 4
  %3 = load i32, i32* %to.addr, align 4
  store i32 %3, i32* %from.addr, align 4
  %4 = load i32, i32* %t, align 4
  store i32 %4, i32* %to.addr, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end

if.end:                                           ; preds = %do.end, %entry
  %5 = load i32, i32* %to.addr, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp sgt i32 %5, %6
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.end
  %7 = load i32, i32* @rl_end, align 4
  store i32 %7, i32* %to.addr, align 4
  %8 = load i32, i32* %from.addr, align 4
  %9 = load i32, i32* %to.addr, align 4
  %cmp3 = icmp sgt i32 %8, %9
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then2
  %10 = load i32, i32* %to.addr, align 4
  store i32 %10, i32* %from.addr, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %11 = load i32, i32* %from.addr, align 4
  %cmp7 = icmp slt i32 %11, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  store i32 0, i32* %from.addr, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6
  %12 = load i32, i32* %from.addr, align 4
  %13 = load i32, i32* %to.addr, align 4
  %call = call i8* @rl_copy_text(i32 %12, i32 %13)
  store i8* %call, i8** %text, align 4
  %14 = load i32, i32* %to.addr, align 4
  %15 = load i32, i32* %from.addr, align 4
  %sub = sub nsw i32 %14, %15
  store i32 %sub, i32* %diff, align 4
  %16 = load i32, i32* %from.addr, align 4
  store i32 %16, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* @rl_end, align 4
  %19 = load i32, i32* %diff, align 4
  %sub10 = sub nsw i32 %18, %19
  %cmp11 = icmp slt i32 %17, %sub10
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load i8*, i8** @rl_line_buffer, align 4
  %21 = load i32, i32* %i, align 4
  %22 = load i32, i32* %diff, align 4
  %add = add nsw i32 %21, %22
  %arrayidx = getelementptr inbounds i8, i8* %20, i32 %add
  %23 = load i8, i8* %arrayidx, align 1
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %24, i32 %25
  store i8 %23, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %27 = load i32, i32* @_rl_doing_an_undo, align 4
  %cmp13 = icmp eq i32 %27, 0
  br i1 %cmp13, label %if.then14, label %if.else

if.then14:                                        ; preds = %for.end
  %28 = load i32, i32* %from.addr, align 4
  %29 = load i32, i32* %to.addr, align 4
  %30 = load i8*, i8** %text, align 4
  call void @rl_add_undo(i32 0, i32 %28, i32 %29, i8* %30)
  br label %if.end15

if.else:                                          ; preds = %for.end
  %31 = load i8*, i8** %text, align 4
  call void @xfree(i8* %31)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then14
  %32 = load i32, i32* %diff, align 4
  %33 = load i32, i32* @rl_end, align 4
  %sub16 = sub nsw i32 %33, %32
  store i32 %sub16, i32* @rl_end, align 4
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %35 = load i32, i32* @rl_end, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %34, i32 %35
  store i8 0, i8* %arrayidx17, align 1
  %36 = load i32, i32* %diff, align 4
  ret i32 %36
}

declare i8* @rl_copy_text(i32, i32) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define void @_rl_fix_point(i32 %fix_mark_too) #0 {
entry:
  %fix_mark_too.addr = alloca i32, align 4
  store i32 %fix_mark_too, i32* %fix_mark_too.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* @rl_point, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %2 = load i32, i32* @rl_end, align 4
  store i32 %2, i32* @rl_point, align 4
  br label %if.end3

if.else:                                          ; preds = %do.body
  %3 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  store i32 0, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  br label %do.end

do.end:                                           ; preds = %if.end3
  %4 = load i32, i32* %fix_mark_too.addr, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then4, label %if.end14

if.then4:                                         ; preds = %do.end
  br label %do.body5

do.body5:                                         ; preds = %if.then4
  %5 = load i32, i32* @rl_mark, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp6 = icmp sgt i32 %5, %6
  br i1 %cmp6, label %if.then7, label %if.else8

if.then7:                                         ; preds = %do.body5
  %7 = load i32, i32* @rl_end, align 4
  store i32 %7, i32* @rl_mark, align 4
  br label %if.end12

if.else8:                                         ; preds = %do.body5
  %8 = load i32, i32* @rl_mark, align 4
  %cmp9 = icmp slt i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* @rl_mark, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.else8
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then7
  br label %do.end13

do.end13:                                         ; preds = %if.end12
  br label %if.end14

if.end14:                                         ; preds = %do.end13, %do.end
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_replace_text(i8* %text, i32 %start, i32 %end) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %n = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32 0, i32* %n, align 4
  %call = call i32 @rl_begin_undo_group()
  %0 = load i32, i32* %start.addr, align 4
  %1 = load i32, i32* %end.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %start.addr, align 4
  %3 = load i32, i32* %end.addr, align 4
  %add = add nsw i32 %3, 1
  %call1 = call i32 @rl_delete_text(i32 %2, i32 %add)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %start.addr, align 4
  store i32 %4, i32* @rl_point, align 4
  %5 = load i8*, i8** %text.addr, align 4
  %6 = load i8, i8* %5, align 1
  %tobool = icmp ne i8 %6, 0
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %7 = load i8*, i8** %text.addr, align 4
  %call3 = call i32 @rl_insert_text(i8* %7)
  store i32 %call3, i32* %n, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %call5 = call i32 @rl_end_undo_group()
  %8 = load i32, i32* %n, align 4
  ret i32 %8
}

declare i32 @rl_begin_undo_group() #1

declare i32 @rl_end_undo_group() #1

; Function Attrs: noinline nounwind
define void @rl_replace_line(i8* %text, i32 %clear_undo) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %clear_undo.addr = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %clear_undo, i32* %clear_undo.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %len, align 4
  %1 = load i32, i32* %len, align 4
  %2 = load i32, i32* @rl_line_buffer_len, align 4
  %cmp = icmp sge i32 %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %len, align 4
  call void @rl_extend_line_buffer(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i8*, i8** %text.addr, align 4
  %call1 = call i8* @strcpy(i8* %4, i8* %5)
  %6 = load i32, i32* %len, align 4
  store i32 %6, i32* @rl_end, align 4
  %7 = load i32, i32* %clear_undo.addr, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @rl_free_undo_list()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  call void @_rl_fix_point(i32 1)
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare void @rl_free_undo_list() #1

; Function Attrs: noinline nounwind
define i32 @rl_forward_byte(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %end = alloca i32, align 4
  %lend = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_backward_byte(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end11

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* %count.addr, align 4
  %add = add nsw i32 %4, %5
  store i32 %add, i32* %end, align 4
  %6 = load i32, i32* @rl_end, align 4
  %cmp3 = icmp sgt i32 %6, 0
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then2
  %7 = load i32, i32* @rl_end, align 4
  %8 = load i32, i32* @rl_editing_mode, align 4
  %cmp4 = icmp eq i32 %8, 0
  br i1 %cmp4, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.true
  %9 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp5 = icmp eq %struct._keymap_entry* %9, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0)
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.true
  %10 = phi i1 [ false, %cond.true ], [ %cmp5, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  %sub6 = sub nsw i32 %7, %land.ext
  br label %cond.end

cond.false:                                       ; preds = %if.then2
  %11 = load i32, i32* @rl_end, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %land.end
  %cond = phi i32 [ %sub6, %land.end ], [ %11, %cond.false ]
  store i32 %cond, i32* %lend, align 4
  %12 = load i32, i32* %end, align 4
  %13 = load i32, i32* %lend, align 4
  %cmp7 = icmp sgt i32 %12, %13
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %cond.end
  %14 = load i32, i32* %lend, align 4
  store i32 %14, i32* @rl_point, align 4
  %call9 = call i32 @rl_ding()
  br label %if.end10

if.else:                                          ; preds = %cond.end
  %15 = load i32, i32* %end, align 4
  store i32 %15, i32* @rl_point, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then8
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end
  %16 = load i32, i32* @rl_end, align 4
  %cmp12 = icmp slt i32 %16, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end11
  store i32 0, i32* @rl_end, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end11
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_byte(i32 %count, i32 %key) #0 {
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
  %call = call i32 @rl_forward_byte(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end8

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* %count.addr, align 4
  %cmp3 = icmp slt i32 %4, %5
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then2
  store i32 0, i32* @rl_point, align 4
  %call5 = call i32 @rl_ding()
  br label %if.end7

if.else:                                          ; preds = %if.then2
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* @rl_point, align 4
  %sub6 = sub nsw i32 %7, %6
  store i32 %sub6, i32* @rl_point, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then4
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.end
  %8 = load i32, i32* @rl_point, align 4
  %cmp9 = icmp slt i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  store i32 0, i32* @rl_point, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i32 @rl_ding() #1

; Function Attrs: noinline nounwind
define i32 @_rl_forward_char_internal(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* %count.addr, align 4
  %call = call i32 @_rl_find_next_mbchar(i8* %0, i32 %1, i32 %2, i32 1)
  store i32 %call, i32* %point, align 4
  %3 = load i32, i32* %point, align 4
  %4 = load i32, i32* @rl_end, align 4
  %cmp = icmp sge i32 %3, %4
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i32, i32* @rl_editing_mode, align 4
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %cmp3 = icmp eq %struct._keymap_entry* %6, getelementptr inbounds ([257 x %struct._keymap_entry], [257 x %struct._keymap_entry]* @vi_movement_keymap, i32 0, i32 0)
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %7 = load i8*, i8** @rl_line_buffer, align 4
  %8 = load i32, i32* @rl_end, align 4
  %call4 = call i32 @_rl_find_prev_mbchar(i8* %7, i32 %8, i32 1)
  store i32 %call4, i32* %point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %9 = load i32, i32* @rl_end, align 4
  %cmp5 = icmp slt i32 %9, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 0, i32* @rl_end, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %10 = load i32, i32* %point, align 4
  ret i32 %10
}

declare i32 @_rl_find_next_mbchar(i8*, i32, i32, i32) #1

declare i32 @_rl_find_prev_mbchar(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_forward_char(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %0 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_forward_byte(i32 %1, i32 %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %count.addr, align 4
  %cmp2 = icmp slt i32 %3, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %4
  %5 = load i32, i32* %key.addr, align 4
  %call4 = call i32 @rl_backward_char(i32 %sub, i32 %5)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %6 = load i32, i32* %count.addr, align 4
  %cmp6 = icmp sgt i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.end18

if.then7:                                         ; preds = %if.end5
  %7 = load i32, i32* @rl_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp8 = icmp eq i32 %7, %8
  br i1 %cmp8, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.then7
  %9 = load i32, i32* @rl_editing_mode, align 4
  %cmp9 = icmp eq i32 %9, 1
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %land.lhs.true
  %call11 = call i32 @rl_ding()
  store i32 0, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %land.lhs.true, %if.then7
  %10 = load i32, i32* %count.addr, align 4
  %call13 = call i32 @_rl_forward_char_internal(i32 %10)
  store i32 %call13, i32* %point, align 4
  %11 = load i32, i32* @rl_point, align 4
  %12 = load i32, i32* %point, align 4
  %cmp14 = icmp eq i32 %11, %12
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end12
  %call16 = call i32 @rl_ding()
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end12
  %13 = load i32, i32* %point, align 4
  store i32 %13, i32* @rl_point, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then10, %if.then3, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define i32 @rl_backward_char(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %0 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_backward_byte(i32 %1, i32 %2)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %count.addr, align 4
  %cmp2 = icmp slt i32 %3, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %4 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %4
  %5 = load i32, i32* %key.addr, align 4
  %call4 = call i32 @rl_forward_char(i32 %sub, i32 %5)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %6 = load i32, i32* %count.addr, align 4
  %cmp6 = icmp sgt i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.end15

if.then7:                                         ; preds = %if.end5
  %7 = load i32, i32* @rl_point, align 4
  store i32 %7, i32* %point, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then7
  %8 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp sgt i32 %8, 0
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %9 = load i32, i32* %point, align 4
  %cmp9 = icmp sgt i32 %9, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %10 = phi i1 [ false, %while.cond ], [ %cmp9, %land.rhs ]
  br i1 %10, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* %point, align 4
  %call10 = call i32 @_rl_find_prev_mbchar(i8* %11, i32 %12, i32 1)
  store i32 %call10, i32* %point, align 4
  %13 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %14 = load i32, i32* %count.addr, align 4
  %cmp11 = icmp sgt i32 %14, 0
  br i1 %cmp11, label %if.then12, label %if.else

if.then12:                                        ; preds = %while.end
  store i32 0, i32* @rl_point, align 4
  %call13 = call i32 @rl_ding()
  br label %if.end14

if.else:                                          ; preds = %while.end
  %15 = load i32, i32* %point, align 4
  store i32 %15, i32* @rl_point, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then12
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then3, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind
define i32 @rl_forward(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_forward_char(i32 %0, i32 %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_backward(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_backward_char(i32 %0, i32 %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_beg_of_line(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 0, i32* @rl_point, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_end_of_line(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_end, align 4
  store i32 %0, i32* @rl_point, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_forward_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_backward_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.end62, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end63

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @rl_point, align 4
  %5 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %4, %5
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %while.body
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %call4 = call i32 @_rl_char_value(i8* %6, i32 %7)
  store i32 %call4, i32* %c, align 4
  %8 = load i32, i32* %c, align 4
  %call5 = call i32 @_rl_walphabetic(i32 %8)
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end30

if.then7:                                         ; preds = %if.end3
  %call8 = call i32 @__ctype_get_mb_cur_max()
  %cmp9 = icmp ugt i32 %call8, 1
  br i1 %cmp9, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then7
  %9 = load i32, i32* @rl_byte_oriented, align 4
  %cmp10 = icmp eq i32 %9, 0
  br i1 %cmp10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* @rl_point, align 4
  %call11 = call i32 @_rl_find_next_mbchar(i8* %10, i32 %11, i32 1, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then7
  %12 = load i32, i32* @rl_point, align 4
  %add = add nsw i32 %12, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call11, %cond.true ], [ %add, %cond.false ]
  store i32 %cond, i32* @rl_point, align 4
  br label %while.cond12

while.cond12:                                     ; preds = %cond.end28, %cond.end
  %13 = load i32, i32* @rl_point, align 4
  %14 = load i32, i32* @rl_end, align 4
  %cmp13 = icmp slt i32 %13, %14
  br i1 %cmp13, label %while.body14, label %while.end

while.body14:                                     ; preds = %while.cond12
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* @rl_point, align 4
  %call15 = call i32 @_rl_char_value(i8* %15, i32 %16)
  store i32 %call15, i32* %c, align 4
  %17 = load i32, i32* %c, align 4
  %call16 = call i32 @_rl_walphabetic(i32 %17)
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.body14
  br label %while.end

if.end19:                                         ; preds = %while.body14
  %call20 = call i32 @__ctype_get_mb_cur_max()
  %cmp21 = icmp ugt i32 %call20, 1
  br i1 %cmp21, label %land.lhs.true22, label %cond.false26

land.lhs.true22:                                  ; preds = %if.end19
  %18 = load i32, i32* @rl_byte_oriented, align 4
  %cmp23 = icmp eq i32 %18, 0
  br i1 %cmp23, label %cond.true24, label %cond.false26

cond.true24:                                      ; preds = %land.lhs.true22
  %19 = load i8*, i8** @rl_line_buffer, align 4
  %20 = load i32, i32* @rl_point, align 4
  %call25 = call i32 @_rl_find_next_mbchar(i8* %19, i32 %20, i32 1, i32 1)
  br label %cond.end28

cond.false26:                                     ; preds = %land.lhs.true22, %if.end19
  %21 = load i32, i32* @rl_point, align 4
  %add27 = add nsw i32 %21, 1
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false26, %cond.true24
  %cond29 = phi i32 [ %call25, %cond.true24 ], [ %add27, %cond.false26 ]
  store i32 %cond29, i32* @rl_point, align 4
  br label %while.cond12

while.end:                                        ; preds = %if.then18, %while.cond12
  br label %if.end30

if.end30:                                         ; preds = %while.end, %if.end3
  %22 = load i32, i32* @rl_point, align 4
  %23 = load i32, i32* @rl_end, align 4
  %cmp31 = icmp eq i32 %22, %23
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  store i32 0, i32* %retval, align 4
  br label %return

if.end33:                                         ; preds = %if.end30
  %call34 = call i32 @__ctype_get_mb_cur_max()
  %cmp35 = icmp ugt i32 %call34, 1
  br i1 %cmp35, label %land.lhs.true36, label %cond.false40

land.lhs.true36:                                  ; preds = %if.end33
  %24 = load i32, i32* @rl_byte_oriented, align 4
  %cmp37 = icmp eq i32 %24, 0
  br i1 %cmp37, label %cond.true38, label %cond.false40

cond.true38:                                      ; preds = %land.lhs.true36
  %25 = load i8*, i8** @rl_line_buffer, align 4
  %26 = load i32, i32* @rl_point, align 4
  %call39 = call i32 @_rl_find_next_mbchar(i8* %25, i32 %26, i32 1, i32 1)
  br label %cond.end42

cond.false40:                                     ; preds = %land.lhs.true36, %if.end33
  %27 = load i32, i32* @rl_point, align 4
  %add41 = add nsw i32 %27, 1
  br label %cond.end42

cond.end42:                                       ; preds = %cond.false40, %cond.true38
  %cond43 = phi i32 [ %call39, %cond.true38 ], [ %add41, %cond.false40 ]
  store i32 %cond43, i32* @rl_point, align 4
  br label %while.cond44

while.cond44:                                     ; preds = %cond.end60, %cond.end42
  %28 = load i32, i32* @rl_point, align 4
  %29 = load i32, i32* @rl_end, align 4
  %cmp45 = icmp slt i32 %28, %29
  br i1 %cmp45, label %while.body46, label %while.end62

while.body46:                                     ; preds = %while.cond44
  %30 = load i8*, i8** @rl_line_buffer, align 4
  %31 = load i32, i32* @rl_point, align 4
  %call47 = call i32 @_rl_char_value(i8* %30, i32 %31)
  store i32 %call47, i32* %c, align 4
  %32 = load i32, i32* %c, align 4
  %call48 = call i32 @_rl_walphabetic(i32 %32)
  %cmp49 = icmp eq i32 %call48, 0
  br i1 %cmp49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %while.body46
  br label %while.end62

if.end51:                                         ; preds = %while.body46
  %call52 = call i32 @__ctype_get_mb_cur_max()
  %cmp53 = icmp ugt i32 %call52, 1
  br i1 %cmp53, label %land.lhs.true54, label %cond.false58

land.lhs.true54:                                  ; preds = %if.end51
  %33 = load i32, i32* @rl_byte_oriented, align 4
  %cmp55 = icmp eq i32 %33, 0
  br i1 %cmp55, label %cond.true56, label %cond.false58

cond.true56:                                      ; preds = %land.lhs.true54
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %35 = load i32, i32* @rl_point, align 4
  %call57 = call i32 @_rl_find_next_mbchar(i8* %34, i32 %35, i32 1, i32 1)
  br label %cond.end60

cond.false58:                                     ; preds = %land.lhs.true54, %if.end51
  %36 = load i32, i32* @rl_point, align 4
  %add59 = add nsw i32 %36, 1
  br label %cond.end60

cond.end60:                                       ; preds = %cond.false58, %cond.true56
  %cond61 = phi i32 [ %call57, %cond.true56 ], [ %add59, %cond.false58 ]
  store i32 %cond61, i32* @rl_point, align 4
  br label %while.cond44

while.end62:                                      ; preds = %if.then50, %while.cond44
  %37 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %37, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end63:                                      ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end63, %if.then32, %if.then2, %if.then
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_word(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_forward_word(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.end50, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end51

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @rl_point, align 4
  %cmp1 = icmp eq i32 %4, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %while.body
  %call4 = call i32 @__ctype_get_mb_cur_max()
  %cmp5 = icmp ugt i32 %call4, 1
  br i1 %cmp5, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end3
  %5 = load i32, i32* @rl_byte_oriented, align 4
  %cmp6 = icmp eq i32 %5, 0
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %call7 = call i32 @_rl_find_prev_mbchar(i8* %6, i32 %7, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.end3
  %8 = load i32, i32* @rl_point, align 4
  %sub8 = sub nsw i32 %8, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call7, %cond.true ], [ %sub8, %cond.false ]
  store i32 %cond, i32* %p, align 4
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* %p, align 4
  %call9 = call i32 @_rl_char_value(i8* %9, i32 %10)
  store i32 %call9, i32* %c, align 4
  %11 = load i32, i32* %c, align 4
  %call10 = call i32 @_rl_walphabetic(i32 %11)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end31

if.then12:                                        ; preds = %cond.end
  %12 = load i32, i32* %p, align 4
  store i32 %12, i32* @rl_point, align 4
  br label %while.cond13

while.cond13:                                     ; preds = %if.end30, %if.then12
  %13 = load i32, i32* @rl_point, align 4
  %cmp14 = icmp sgt i32 %13, 0
  br i1 %cmp14, label %while.body15, label %while.end

while.body15:                                     ; preds = %while.cond13
  %call16 = call i32 @__ctype_get_mb_cur_max()
  %cmp17 = icmp ugt i32 %call16, 1
  br i1 %cmp17, label %land.lhs.true18, label %cond.false22

land.lhs.true18:                                  ; preds = %while.body15
  %14 = load i32, i32* @rl_byte_oriented, align 4
  %cmp19 = icmp eq i32 %14, 0
  br i1 %cmp19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %land.lhs.true18
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* @rl_point, align 4
  %call21 = call i32 @_rl_find_prev_mbchar(i8* %15, i32 %16, i32 1)
  br label %cond.end24

cond.false22:                                     ; preds = %land.lhs.true18, %while.body15
  %17 = load i32, i32* @rl_point, align 4
  %sub23 = sub nsw i32 %17, 1
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false22, %cond.true20
  %cond25 = phi i32 [ %call21, %cond.true20 ], [ %sub23, %cond.false22 ]
  store i32 %cond25, i32* %p, align 4
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %19 = load i32, i32* %p, align 4
  %call26 = call i32 @_rl_char_value(i8* %18, i32 %19)
  store i32 %call26, i32* %c, align 4
  %20 = load i32, i32* %c, align 4
  %call27 = call i32 @_rl_walphabetic(i32 %20)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %cond.end24
  br label %while.end

if.end30:                                         ; preds = %cond.end24
  %21 = load i32, i32* %p, align 4
  store i32 %21, i32* @rl_point, align 4
  br label %while.cond13

while.end:                                        ; preds = %if.then29, %while.cond13
  br label %if.end31

if.end31:                                         ; preds = %while.end, %cond.end
  br label %while.cond32

while.cond32:                                     ; preds = %if.end49, %if.end31
  %22 = load i32, i32* @rl_point, align 4
  %tobool33 = icmp ne i32 %22, 0
  br i1 %tobool33, label %while.body34, label %while.end50

while.body34:                                     ; preds = %while.cond32
  %call35 = call i32 @__ctype_get_mb_cur_max()
  %cmp36 = icmp ugt i32 %call35, 1
  br i1 %cmp36, label %land.lhs.true37, label %cond.false41

land.lhs.true37:                                  ; preds = %while.body34
  %23 = load i32, i32* @rl_byte_oriented, align 4
  %cmp38 = icmp eq i32 %23, 0
  br i1 %cmp38, label %cond.true39, label %cond.false41

cond.true39:                                      ; preds = %land.lhs.true37
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* @rl_point, align 4
  %call40 = call i32 @_rl_find_prev_mbchar(i8* %24, i32 %25, i32 1)
  br label %cond.end43

cond.false41:                                     ; preds = %land.lhs.true37, %while.body34
  %26 = load i32, i32* @rl_point, align 4
  %sub42 = sub nsw i32 %26, 1
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false41, %cond.true39
  %cond44 = phi i32 [ %call40, %cond.true39 ], [ %sub42, %cond.false41 ]
  store i32 %cond44, i32* %p, align 4
  %27 = load i8*, i8** @rl_line_buffer, align 4
  %28 = load i32, i32* %p, align 4
  %call45 = call i32 @_rl_char_value(i8* %27, i32 %28)
  store i32 %call45, i32* %c, align 4
  %29 = load i32, i32* %c, align 4
  %call46 = call i32 @_rl_walphabetic(i32 %29)
  %cmp47 = icmp eq i32 %call46, 0
  br i1 %cmp47, label %if.then48, label %if.else

if.then48:                                        ; preds = %cond.end43
  br label %while.end50

if.else:                                          ; preds = %cond.end43
  %30 = load i32, i32* %p, align 4
  store i32 %30, i32* @rl_point, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.else
  br label %while.cond32

while.end50:                                      ; preds = %if.then48, %while.cond32
  %31 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %31, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %while.cond

while.end51:                                      ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end51, %if.then2, %if.then
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

declare i32 @_rl_char_value(i8*, i32) #1

declare i32 @_rl_walphabetic(i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_refresh_line(i32 %ignore1, i32 %ignore2) #0 {
entry:
  %ignore1.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  %curr_line = alloca i32, align 4
  store i32 %ignore1, i32* %ignore1.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  %call = call i32 @_rl_current_display_line()
  store i32 %call, i32* %curr_line, align 4
  %0 = load i32, i32* %curr_line, align 4
  call void @_rl_move_vert(i32 %0)
  %1 = load i8*, i8** @rl_line_buffer, align 4
  call void @_rl_move_cursor_relative(i32 0, i8* %1)
  call void @_rl_clear_to_eol(i32 0)
  call void @rl_redraw_prompt_last_line()
  store i32 1, i32* @rl_display_fixed, align 4
  ret i32 0
}

declare i32 @_rl_current_display_line() #1

declare void @_rl_move_vert(i32) #1

declare void @_rl_move_cursor_relative(i32, i8*) #1

declare void @_rl_clear_to_eol(i32) #1

declare void @rl_redraw_prompt_last_line() #1

; Function Attrs: noinline nounwind
define i32 @rl_clear_screen(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_refresh_line(i32 %1, i32 %2)
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @_rl_clear_screen()
  %call1 = call i32 @rl_forced_update_display()
  store i32 1, i32* @rl_display_fixed, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare void @_rl_clear_screen() #1

declare i32 @rl_forced_update_display() #1

; Function Attrs: noinline nounwind
define i32 @rl_skip_csi_sequence(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  br label %do.body

do.body:                                          ; preds = %land.end, %entry
  %call = call i32 @rl_read_key()
  store i32 %call, i32* %ch, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %1 = load i32, i32* %ch, align 4
  %cmp = icmp sge i32 %1, 32
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %2 = load i32, i32* %ch, align 4
  %cmp1 = icmp slt i32 %2, 64
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %3 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ]
  br i1 %3, label %do.body, label %do.end

do.end:                                           ; preds = %land.end
  %4 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %4, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %5 = load i32, i32* %ch, align 4
  %cmp2 = icmp slt i32 %5, 0
  %conv = zext i1 %cmp2 to i32
  ret i32 %conv
}

declare i32 @rl_read_key() #1

; Function Attrs: noinline nounwind
define i32 @rl_arrow_keys(i32 %count, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
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
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %ch, align 4
  %conv = trunc i32 %3 to i8
  %conv1 = zext i8 %conv to i32
  %4 = load i32, i32* %ch, align 4
  %cmp2 = icmp eq i32 %conv1, %4
  br i1 %cmp2, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end
  %5 = load i32, i32* %ch, align 4
  %conv4 = trunc i32 %5 to i8
  %conv5 = zext i8 %conv4 to i32
  %call6 = call i32 @islower(i32 %conv5) #4
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %6 = load i32, i32* %ch, align 4
  %conv7 = trunc i32 %6 to i8
  %conv8 = zext i8 %conv7 to i32
  %call9 = call i32 @toupper(i32 %conv8) #4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.end
  %7 = load i32, i32* %ch, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call9, %cond.true ], [ %7, %cond.false ]
  switch i32 %cond, label %sw.default [
    i32 65, label %sw.bb
    i32 66, label %sw.bb11
    i32 67, label %sw.bb13
    i32 68, label %sw.bb24
  ]

sw.bb:                                            ; preds = %cond.end
  %8 = load i32, i32* %count.addr, align 4
  %9 = load i32, i32* %ch, align 4
  %call10 = call i32 @rl_get_previous_history(i32 %8, i32 %9)
  br label %sw.epilog

sw.bb11:                                          ; preds = %cond.end
  %10 = load i32, i32* %count.addr, align 4
  %11 = load i32, i32* %ch, align 4
  %call12 = call i32 @rl_get_next_history(i32 %10, i32 %11)
  br label %sw.epilog

sw.bb13:                                          ; preds = %cond.end
  %call14 = call i32 @__ctype_get_mb_cur_max()
  %cmp15 = icmp ugt i32 %call14, 1
  br i1 %cmp15, label %land.lhs.true17, label %if.else

land.lhs.true17:                                  ; preds = %sw.bb13
  %12 = load i32, i32* @rl_byte_oriented, align 4
  %cmp18 = icmp eq i32 %12, 0
  br i1 %cmp18, label %if.then20, label %if.else

if.then20:                                        ; preds = %land.lhs.true17
  %13 = load i32, i32* %count.addr, align 4
  %14 = load i32, i32* %ch, align 4
  %call21 = call i32 @rl_forward_char(i32 %13, i32 %14)
  br label %if.end23

if.else:                                          ; preds = %land.lhs.true17, %sw.bb13
  %15 = load i32, i32* %count.addr, align 4
  %16 = load i32, i32* %ch, align 4
  %call22 = call i32 @rl_forward_byte(i32 %15, i32 %16)
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.then20
  br label %sw.epilog

sw.bb24:                                          ; preds = %cond.end
  %call25 = call i32 @__ctype_get_mb_cur_max()
  %cmp26 = icmp ugt i32 %call25, 1
  br i1 %cmp26, label %land.lhs.true28, label %if.else33

land.lhs.true28:                                  ; preds = %sw.bb24
  %17 = load i32, i32* @rl_byte_oriented, align 4
  %cmp29 = icmp eq i32 %17, 0
  br i1 %cmp29, label %if.then31, label %if.else33

if.then31:                                        ; preds = %land.lhs.true28
  %18 = load i32, i32* %count.addr, align 4
  %19 = load i32, i32* %ch, align 4
  %call32 = call i32 @rl_backward_char(i32 %18, i32 %19)
  br label %if.end35

if.else33:                                        ; preds = %land.lhs.true28, %sw.bb24
  %20 = load i32, i32* %count.addr, align 4
  %21 = load i32, i32* %ch, align 4
  %call34 = call i32 @rl_backward_byte(i32 %20, i32 %21)
  br label %if.end35

if.end35:                                         ; preds = %if.else33, %if.then31
  br label %sw.epilog

sw.default:                                       ; preds = %cond.end
  %call36 = call i32 @rl_ding()
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end35, %if.end23, %sw.bb11, %sw.bb
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #2

declare i32 @rl_get_previous_history(i32, i32) #1

declare i32 @rl_get_next_history(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_insert_char(i32 %count, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %string = alloca i8*, align 4
  %string_size = alloca i32, align 4
  %incoming = alloca [17 x i8], align 1
  %incoming_length = alloca i32, align 4
  %ps_back = alloca %struct.__mbstate_t, align 4
  %wc = alloca i32, align 4
  %ret = alloca i32, align 4
  %decreaser = alloca i32, align 4
  %str = alloca [2 x i8], align 1
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 0, i32* %incoming_length, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp1 = icmp eq i32 %call, 1
  br i1 %cmp1, label %if.then2, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %1 = load i32, i32* @rl_byte_oriented, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %lor.lhs.false, %if.end
  %2 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %2 to i8
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx3 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 1
  store i8 0, i8* %arrayidx3, align 1
  store i32 1, i32* %incoming_length, align 4
  br label %if.end32

if.else:                                          ; preds = %lor.lhs.false
  %3 = load i32, i32* @_rl_insert_char.stored_count, align 4
  %cmp4 = icmp sle i32 %3, 0
  br i1 %cmp4, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.else
  %4 = load i32, i32* %count.addr, align 4
  store i32 %4, i32* @_rl_insert_char.stored_count, align 4
  br label %if.end8

if.else7:                                         ; preds = %if.else
  %5 = load i32, i32* @_rl_insert_char.stored_count, align 4
  store i32 %5, i32* %count.addr, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %6 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %6, i8* bitcast (%struct.__mbstate_t* @ps to i8*), i32 8, i32 4, i1 false)
  %7 = load i32, i32* %c.addr, align 4
  %conv9 = trunc i32 %7 to i8
  %8 = load i32, i32* @pending_bytes_length, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* @pending_bytes_length, align 4
  %arrayidx10 = getelementptr inbounds [16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 %8
  store i8 %conv9, i8* %arrayidx10, align 1
  %9 = load i32, i32* @pending_bytes_length, align 4
  %call11 = call i32 @mbrtowc(i32* %wc, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 0), i32 %9, %struct.__mbstate_t* @ps)
  store i32 %call11, i32* %ret, align 4
  %10 = load i32, i32* %ret, align 4
  %cmp12 = icmp eq i32 %10, -2
  br i1 %cmp12, label %if.then14, label %if.else15

if.then14:                                        ; preds = %if.end8
  %11 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* bitcast (%struct.__mbstate_t* @ps to i8*), i8* %11, i32 8, i32 4, i1 false)
  store i32 1, i32* %retval, align 4
  br label %return

if.else15:                                        ; preds = %if.end8
  %12 = load i32, i32* %ret, align 4
  %cmp16 = icmp eq i32 %12, -1
  br i1 %cmp16, label %if.then18, label %if.else21

if.then18:                                        ; preds = %if.else15
  %13 = load i8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 0), align 1
  %arrayidx19 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  store i8 %13, i8* %arrayidx19, align 1
  %arrayidx20 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 1
  store i8 0, i8* %arrayidx20, align 1
  store i32 1, i32* %incoming_length, align 4
  %14 = load i32, i32* @pending_bytes_length, align 4
  %dec = add nsw i32 %14, -1
  store i32 %dec, i32* @pending_bytes_length, align 4
  %15 = load i32, i32* @pending_bytes_length, align 4
  call void @llvm.memmove.p0i8.p0i8.i32(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 1), i32 %15, i32 1, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast (%struct.__mbstate_t* @ps to i8*), i8 0, i32 8, i32 4, i1 false)
  br label %if.end30

if.else21:                                        ; preds = %if.else15
  %16 = load i32, i32* %ret, align 4
  %cmp22 = icmp eq i32 %16, 0
  br i1 %cmp22, label %if.then24, label %if.else27

if.then24:                                        ; preds = %if.else21
  %arrayidx25 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  store i8 0, i8* %arrayidx25, align 1
  store i32 0, i32* %incoming_length, align 4
  %17 = load i32, i32* @pending_bytes_length, align 4
  %dec26 = add nsw i32 %17, -1
  store i32 %dec26, i32* @pending_bytes_length, align 4
  call void @llvm.memset.p0i8.i32(i8* bitcast (%struct.__mbstate_t* @ps to i8*), i8 0, i32 8, i32 4, i1 false)
  br label %if.end29

if.else27:                                        ; preds = %if.else21
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  %18 = load i32, i32* @pending_bytes_length, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @pending_bytes, i32 0, i32 0), i32 %18, i32 1, i1 false)
  %19 = load i32, i32* @pending_bytes_length, align 4
  %arrayidx28 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 %19
  store i8 0, i8* %arrayidx28, align 1
  %20 = load i32, i32* @pending_bytes_length, align 4
  store i32 %20, i32* %incoming_length, align 4
  store i32 0, i32* @pending_bytes_length, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else27, %if.then24
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then18
  br label %if.end31

if.end31:                                         ; preds = %if.end30
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then2
  %21 = load i32, i32* %count.addr, align 4
  %cmp33 = icmp sgt i32 %21, 1
  br i1 %cmp33, label %land.lhs.true, label %if.end46

land.lhs.true:                                    ; preds = %if.end32
  %22 = load i32, i32* %count.addr, align 4
  %cmp35 = icmp sle i32 %22, 1024
  br i1 %cmp35, label %if.then37, label %if.end46

if.then37:                                        ; preds = %land.lhs.true
  %23 = load i32, i32* %count.addr, align 4
  %24 = load i32, i32* %incoming_length, align 4
  %mul = mul nsw i32 %23, %24
  store i32 %mul, i32* %string_size, align 4
  %25 = load i32, i32* %string_size, align 4
  %add = add nsw i32 1, %25
  %call38 = call i8* @xmalloc(i32 %add)
  store i8* %call38, i8** %string, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then37
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %string_size, align 4
  %cmp39 = icmp slt i32 %26, %27
  br i1 %cmp39, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %28 = load i8*, i8** %string, align 4
  %29 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %28, i32 %29
  %arraydecay41 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  %30 = load i32, i32* %incoming_length, align 4
  %call42 = call i8* @strncpy(i8* %add.ptr, i8* %arraydecay41, i32 %30)
  %31 = load i32, i32* %incoming_length, align 4
  %32 = load i32, i32* %i, align 4
  %add43 = add nsw i32 %32, %31
  store i32 %add43, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %incoming_length, align 4
  store i32 0, i32* @_rl_insert_char.stored_count, align 4
  %33 = load i8*, i8** %string, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %33, i32 %34
  store i8 0, i8* %arrayidx44, align 1
  %35 = load i8*, i8** %string, align 4
  %call45 = call i32 @rl_insert_text(i8* %35)
  %36 = load i8*, i8** %string, align 4
  call void @xfree(i8* %36)
  store i32 0, i32* %retval, align 4
  br label %return

if.end46:                                         ; preds = %land.lhs.true, %if.end32
  %37 = load i32, i32* %count.addr, align 4
  %cmp47 = icmp sgt i32 %37, 1024
  br i1 %cmp47, label %if.then49, label %if.end71

if.then49:                                        ; preds = %if.end46
  %38 = load i32, i32* %incoming_length, align 4
  %mul50 = mul nsw i32 %38, 1024
  store i32 %mul50, i32* %string_size, align 4
  %39 = load i32, i32* %string_size, align 4
  %add51 = add nsw i32 1, %39
  %call52 = call i8* @xmalloc(i32 %add51)
  store i8* %call52, i8** %string, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond53

while.cond53:                                     ; preds = %while.body56, %if.then49
  %40 = load i32, i32* %i, align 4
  %41 = load i32, i32* %string_size, align 4
  %cmp54 = icmp slt i32 %40, %41
  br i1 %cmp54, label %while.body56, label %while.end61

while.body56:                                     ; preds = %while.cond53
  %42 = load i8*, i8** %string, align 4
  %43 = load i32, i32* %i, align 4
  %add.ptr57 = getelementptr inbounds i8, i8* %42, i32 %43
  %arraydecay58 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  %44 = load i32, i32* %incoming_length, align 4
  %call59 = call i8* @strncpy(i8* %add.ptr57, i8* %arraydecay58, i32 %44)
  %45 = load i32, i32* %incoming_length, align 4
  %46 = load i32, i32* %i, align 4
  %add60 = add nsw i32 %46, %45
  store i32 %add60, i32* %i, align 4
  br label %while.cond53

while.end61:                                      ; preds = %while.cond53
  br label %while.cond62

while.cond62:                                     ; preds = %cond.end, %while.end61
  %47 = load i32, i32* %count.addr, align 4
  %tobool63 = icmp ne i32 %47, 0
  br i1 %tobool63, label %while.body64, label %while.end70

while.body64:                                     ; preds = %while.cond62
  %48 = load i32, i32* %count.addr, align 4
  %cmp65 = icmp sgt i32 %48, 1024
  br i1 %cmp65, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body64
  br label %cond.end

cond.false:                                       ; preds = %while.body64
  %49 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1024, %cond.true ], [ %49, %cond.false ]
  store i32 %cond, i32* %decreaser, align 4
  %50 = load i8*, i8** %string, align 4
  %51 = load i32, i32* %decreaser, align 4
  %52 = load i32, i32* %incoming_length, align 4
  %mul67 = mul nsw i32 %51, %52
  %arrayidx68 = getelementptr inbounds i8, i8* %50, i32 %mul67
  store i8 0, i8* %arrayidx68, align 1
  %53 = load i8*, i8** %string, align 4
  %call69 = call i32 @rl_insert_text(i8* %53)
  %54 = load i32, i32* %decreaser, align 4
  %55 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 %55, %54
  store i32 %sub, i32* %count.addr, align 4
  br label %while.cond62

while.end70:                                      ; preds = %while.cond62
  %56 = load i8*, i8** %string, align 4
  call void @xfree(i8* %56)
  store i32 0, i32* %incoming_length, align 4
  store i32 0, i32* @_rl_insert_char.stored_count, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end71:                                         ; preds = %if.end46
  %call72 = call i32 @__ctype_get_mb_cur_max()
  %cmp73 = icmp eq i32 %call72, 1
  br i1 %cmp73, label %if.then77, label %lor.lhs.false75

lor.lhs.false75:                                  ; preds = %if.end71
  %57 = load i32, i32* @rl_byte_oriented, align 4
  %tobool76 = icmp ne i32 %57, 0
  br i1 %tobool76, label %if.then77, label %if.else91

if.then77:                                        ; preds = %lor.lhs.false75, %if.end71
  %58 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %58, 2048
  %cmp78 = icmp eq i32 %and, 0
  br i1 %cmp78, label %land.lhs.true80, label %if.else84

land.lhs.true80:                                  ; preds = %if.then77
  %call81 = call i32 @_rl_pushed_input_available()
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %if.then83, label %if.else84

if.then83:                                        ; preds = %land.lhs.true80
  %59 = load i32, i32* %c.addr, align 4
  call void @_rl_insert_typein(i32 %59)
  br label %if.end90

if.else84:                                        ; preds = %land.lhs.true80, %if.then77
  %arrayidx85 = getelementptr inbounds [2 x i8], [2 x i8]* %str, i32 0, i32 1
  store i8 0, i8* %arrayidx85, align 1
  %60 = load i32, i32* %c.addr, align 4
  %conv86 = trunc i32 %60 to i8
  %arrayidx87 = getelementptr inbounds [2 x i8], [2 x i8]* %str, i32 0, i32 0
  store i8 %conv86, i8* %arrayidx87, align 1
  %arraydecay88 = getelementptr inbounds [2 x i8], [2 x i8]* %str, i32 0, i32 0
  %call89 = call i32 @rl_insert_text(i8* %arraydecay88)
  br label %if.end90

if.end90:                                         ; preds = %if.else84, %if.then83
  br label %if.end94

if.else91:                                        ; preds = %lor.lhs.false75
  %arraydecay92 = getelementptr inbounds [17 x i8], [17 x i8]* %incoming, i32 0, i32 0
  %call93 = call i32 @rl_insert_text(i8* %arraydecay92)
  store i32 0, i32* @_rl_insert_char.stored_count, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.else91, %if.end90
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end94, %while.end70, %while.end, %if.then14, %if.then
  %61 = load i32, i32* %retval, align 4
  ret i32 %61
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #3

declare i8* @xmalloc(i32) #1

declare i32 @_rl_pushed_input_available() #1

declare void @_rl_insert_typein(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_overwrite_char(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %mbkey = alloca [16 x i8], align 1
  %k = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp1 = icmp ugt i32 %call, 1
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %1 = load i32, i32* @rl_byte_oriented, align 4
  %cmp3 = icmp eq i32 %1, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %2 = load i32, i32* %c.addr, align 4
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mbkey, i32 0, i32 0
  %call4 = call i32 @_rl_read_mbstring(i32 %2, i8* %arraydecay, i32 16)
  store i32 %call4, i32* %k, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true2, %land.lhs.true, %entry
  %call5 = call i32 @rl_begin_undo_group()
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %count.addr, align 4
  %cmp6 = icmp slt i32 %3, %4
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp8 = icmp ugt i32 %call7, 1
  br i1 %cmp8, label %land.lhs.true9, label %if.else

land.lhs.true9:                                   ; preds = %for.body
  %5 = load i32, i32* @rl_byte_oriented, align 4
  %cmp10 = icmp eq i32 %5, 0
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true9
  %arraydecay12 = getelementptr inbounds [16 x i8], [16 x i8]* %mbkey, i32 0, i32 0
  %call13 = call i32 @rl_insert_text(i8* %arraydecay12)
  br label %if.end15

if.else:                                          ; preds = %land.lhs.true9, %for.body
  %6 = load i32, i32* %c.addr, align 4
  %call14 = call i32 @_rl_insert_char(i32 1, i32 %6)
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  %7 = load i32, i32* @rl_point, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp16 = icmp slt i32 %7, %8
  br i1 %cmp16, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end15
  %9 = load i32, i32* %c.addr, align 4
  %call18 = call i32 @rl_delete(i32 1, i32 %9)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end15
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call20 = call i32 @rl_end_undo_group()
  ret i32 0
}

declare i32 @_rl_read_mbstring(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_delete(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %xpoint = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @_rl_rubout_char(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %3, %4
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call3 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp sgt i32 %5, 1
  br i1 %cmp5, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %6 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then6, label %if.else15

if.then6:                                         ; preds = %lor.lhs.false, %if.end4
  %7 = load i32, i32* @rl_point, align 4
  store i32 %7, i32* %xpoint, align 4
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp8 = icmp ugt i32 %call7, 1
  br i1 %cmp8, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then6
  %8 = load i32, i32* @rl_byte_oriented, align 4
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.else

if.then10:                                        ; preds = %land.lhs.true
  %9 = load i32, i32* %count.addr, align 4
  %10 = load i32, i32* %key.addr, align 4
  %call11 = call i32 @rl_forward_char(i32 %9, i32 %10)
  br label %if.end13

if.else:                                          ; preds = %land.lhs.true, %if.then6
  %11 = load i32, i32* %count.addr, align 4
  %12 = load i32, i32* %key.addr, align 4
  %call12 = call i32 @rl_forward_byte(i32 %11, i32 %12)
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then10
  %13 = load i32, i32* %xpoint, align 4
  %14 = load i32, i32* @rl_point, align 4
  %call14 = call i32 @rl_kill_text(i32 %13, i32 %14)
  %15 = load i32, i32* %xpoint, align 4
  store i32 %15, i32* @rl_point, align 4
  br label %if.end22

if.else15:                                        ; preds = %lor.lhs.false
  %call16 = call i32 @__ctype_get_mb_cur_max()
  %cmp17 = icmp ugt i32 %call16, 1
  br i1 %cmp17, label %land.lhs.true18, label %cond.false

land.lhs.true18:                                  ; preds = %if.else15
  %16 = load i32, i32* @rl_byte_oriented, align 4
  %cmp19 = icmp eq i32 %16, 0
  br i1 %cmp19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true18
  %17 = load i8*, i8** @rl_line_buffer, align 4
  %18 = load i32, i32* @rl_point, align 4
  %call20 = call i32 @_rl_find_next_mbchar(i8* %17, i32 %18, i32 1, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true18, %if.else15
  %19 = load i32, i32* @rl_point, align 4
  %add = add nsw i32 %19, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call20, %cond.true ], [ %add, %cond.false ]
  store i32 %cond, i32* %xpoint, align 4
  %20 = load i32, i32* @rl_point, align 4
  %21 = load i32, i32* %xpoint, align 4
  %call21 = call i32 @rl_delete_text(i32 %20, i32 %21)
  br label %if.end22

if.end22:                                         ; preds = %cond.end, %if.end13
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end22, %if.then2, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define i32 @rl_insert(i32 %count, i32 %c) #0 {
entry:
  %count.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %n = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @rl_insert_mode, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %2 = load i32, i32* %c.addr, align 4
  %call = call i32 @_rl_insert_char(i32 %1, i32 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %c.addr, align 4
  %call1 = call i32 @_rl_overwrite_char(i32 %3, i32 %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call1, %cond.false ]
  store i32 %cond, i32* %r, align 4
  store i32 0, i32* %x, align 4
  store i32 65534, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end35, %if.then, %cond.end
  %5 = load i32, i32* @_rl_optimize_typeahead, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %6 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %6, 133120
  %cmp2 = icmp eq i32 %and, 0
  br i1 %cmp2, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %call4 = call i32 @_rl_pushed_input_available()
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %land.lhs.true6, label %land.end

land.lhs.true6:                                   ; preds = %land.lhs.true3
  %call7 = call i32 @_rl_input_queued(i32 0)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %land.lhs.true9, label %land.end

land.lhs.true9:                                   ; preds = %land.lhs.true6
  %call10 = call i32 @rl_read_key()
  store i32 %call10, i32* %n, align 4
  %cmp11 = icmp sgt i32 %call10, 0
  br i1 %cmp11, label %land.lhs.true12, label %land.end

land.lhs.true12:                                  ; preds = %land.lhs.true9
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %8 = load i32, i32* %n, align 4
  %conv = trunc i32 %8 to i8
  %idxprom = zext i8 %conv to i32
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %7, i32 %idxprom
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %9 = load i8, i8* %type, align 4
  %conv13 = sext i8 %9 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true12
  %10 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %11 = load i32, i32* %n, align 4
  %conv16 = trunc i32 %11 to i8
  %idxprom17 = zext i8 %conv16 to i32
  %arrayidx18 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %10, i32 %idxprom17
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx18, i32 0, i32 1
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %cmp19 = icmp eq i32 (i32, i32)* %12, @rl_insert
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true12, %land.lhs.true9, %land.lhs.true6, %land.lhs.true3, %land.lhs.true, %while.cond
  %13 = phi i1 [ false, %land.lhs.true12 ], [ false, %land.lhs.true9 ], [ false, %land.lhs.true6 ], [ false, %land.lhs.true3 ], [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp19, %land.rhs ]
  br i1 %13, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %14 = load i32, i32* @rl_insert_mode, align 4
  %cmp21 = icmp eq i32 %14, 1
  br i1 %cmp21, label %cond.true23, label %cond.false25

cond.true23:                                      ; preds = %while.body
  %15 = load i32, i32* %n, align 4
  %call24 = call i32 @_rl_insert_char(i32 1, i32 %15)
  br label %cond.end27

cond.false25:                                     ; preds = %while.body
  %16 = load i32, i32* %n, align 4
  %call26 = call i32 @_rl_overwrite_char(i32 1, i32 %16)
  br label %cond.end27

cond.end27:                                       ; preds = %cond.false25, %cond.true23
  %cond28 = phi i32 [ %call24, %cond.true23 ], [ %call26, %cond.false25 ]
  store i32 %cond28, i32* %r, align 4
  store i32 65534, i32* %n, align 4
  %17 = load i32, i32* %x, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %x, align 4
  %18 = load i32, i32* %r, align 4
  %cmp29 = icmp eq i32 %18, 1
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end27
  br label %while.cond

if.end:                                           ; preds = %cond.end27
  %19 = load i32, i32* @rl_done, align 4
  %tobool31 = icmp ne i32 %19, 0
  br i1 %tobool31, label %if.then34, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %20 = load i32, i32* %r, align 4
  %cmp32 = icmp ne i32 %20, 0
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %lor.lhs.false, %if.end
  br label %while.end

if.end35:                                         ; preds = %lor.lhs.false
  br label %while.cond

while.end:                                        ; preds = %if.then34, %land.end
  %21 = load i32, i32* %n, align 4
  %cmp36 = icmp ne i32 %21, 65534
  br i1 %cmp36, label %if.then38, label %if.end41

if.then38:                                        ; preds = %while.end
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** @rl_last_func, align 4
  call void @_rl_reset_argument()
  %22 = load i8*, i8** @rl_executing_keyseq, align 4
  store i32 0, i32* @rl_key_sequence_length, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %22, i32 0
  store i8 0, i8* %arrayidx39, align 1
  %23 = load i32, i32* %n, align 4
  %call40 = call i32 @rl_execute_next(i32 %23)
  store i32 %call40, i32* %r, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then38, %while.end
  %24 = load i32, i32* %r, align 4
  ret i32 %24
}

declare i32 @_rl_input_queued(i32) #1

declare void @_rl_reset_argument() #1

declare i32 @rl_execute_next(i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_quoted_insert(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, 524288
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @_rl_disable_tty_signals()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %1, 524288
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %count.addr, align 4
  %call3 = call %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %2)
  store %struct.__rl_callback_generic_arg* %call3, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_insert_next_callback, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i32, i32* %count.addr, align 4
  %call5 = call i32 @_rl_insert_next(i32 %3)
  store i32 %call5, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then2
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

declare i32 @_rl_disable_tty_signals() #1

declare %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @_rl_insert_next_callback(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  %count = alloca i32, align 4
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %0 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %count1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %0, i32 0, i32 0
  %1 = load i32, i32* %count1, align 4
  store i32 %1, i32* %count, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %2 = load i32, i32* %count, align 4
  %call = call i32 @_rl_insert_next(i32 %2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_insert_next(i32 %count) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
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
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_readline_state, align 4
  %and1 = and i32 %3, 4096
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %c, align 4
  call void @_rl_add_macro_char(i32 %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %5 = load i32, i32* @rl_readline_state, align 4
  %and4 = and i32 %5, 524288
  %cmp5 = icmp eq i32 %and4, 0
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end3
  %call7 = call i32 @_rl_restore_tty_signals()
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end3
  %6 = load i32, i32* %count.addr, align 4
  %7 = load i32, i32* %c, align 4
  %call9 = call i32 @_rl_insert_char(i32 %6, i32 %7)
  store i32 %call9, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @rl_tab_insert(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %call = call i32 @_rl_insert_char(i32 %0, i32 9)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_newline(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  store i32 1, i32* @rl_done, align 4
  %0 = load i32, i32* @_rl_history_preserve_point, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp = icmp eq i32 %1, %2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %3 = load i32, i32* @rl_point, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -1, %cond.true ], [ %3, %cond.false ]
  store i32 %cond, i32* @_rl_history_saved_point, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %entry
  %4 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %4, 33554432
  store i32 %or, i32* @rl_readline_state, align 4
  %5 = load i32, i32* @rl_editing_mode, align 4
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.end
  call void @_rl_vi_done_inserting()
  %6 = load i32, i32* @_rl_vi_last_command, align 4
  %call = call i32 @_rl_vi_textmod_command(i32 %6)
  %cmp3 = icmp eq i32 %call, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.then2
  call void @_rl_vi_reset_last()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %7 = load i32, i32* @rl_erase_empty_line, align 4
  %tobool7 = icmp ne i32 %7, 0
  br i1 %tobool7, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end6
  %8 = load i32, i32* @rl_point, align 4
  %cmp8 = icmp eq i32 %8, 0
  br i1 %cmp8, label %land.lhs.true9, label %if.end12

land.lhs.true9:                                   ; preds = %land.lhs.true
  %9 = load i32, i32* @rl_end, align 4
  %cmp10 = icmp eq i32 %9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %land.lhs.true9
  store i32 0, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %land.lhs.true9, %land.lhs.true, %if.end6
  %10 = load i32, i32* @_rl_echoing_p, align 4
  %tobool13 = icmp ne i32 %10, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  call void @_rl_update_final()
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end12
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then11
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare void @_rl_vi_done_inserting() #1

declare i32 @_rl_vi_textmod_command(i32) #1

declare void @_rl_vi_reset_last() #1

declare void @_rl_update_final() #1

; Function Attrs: noinline nounwind
define i32 @rl_do_lowercase_version(i32 %ignore1, i32 %ignore2) #0 {
entry:
  %ignore1.addr = alloca i32, align 4
  %ignore2.addr = alloca i32, align 4
  store i32 %ignore1, i32* %ignore1.addr, align 4
  store i32 %ignore2, i32* %ignore2.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @_rl_overwrite_rubout(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %opoint = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  store i32 %1, i32* %opoint, align 4
  store i32 0, i32* %l, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %2, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_backward_char(i32 1, i32 %4)
  %5 = load i8*, i8** @rl_line_buffer, align 4
  %6 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %8 = load i32, i32* @rl_point, align 4
  %call3 = call i32 @rl_character_len(i32 %conv, i32 %8)
  %9 = load i32, i32* %l, align 4
  %add = add nsw i32 %9, %call3
  store i32 %add, i32* %l, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call4 = call i32 @rl_begin_undo_group()
  %11 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp sgt i32 %11, 1
  br i1 %cmp5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %12 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then7, label %if.else

if.then7:                                         ; preds = %lor.lhs.false, %for.end
  %13 = load i32, i32* %opoint, align 4
  %14 = load i32, i32* @rl_point, align 4
  %call8 = call i32 @rl_kill_text(i32 %13, i32 %14)
  br label %if.end10

if.else:                                          ; preds = %lor.lhs.false
  %15 = load i32, i32* %opoint, align 4
  %16 = load i32, i32* @rl_point, align 4
  %call9 = call i32 @rl_delete_text(i32 %15, i32 %16)
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then7
  %17 = load i32, i32* @rl_point, align 4
  %18 = load i32, i32* @rl_end, align 4
  %cmp11 = icmp slt i32 %17, %18
  br i1 %cmp11, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %19 = load i32, i32* @rl_point, align 4
  store i32 %19, i32* %opoint, align 4
  %20 = load i32, i32* %l, align 4
  %call14 = call i32 @_rl_insert_char(i32 %20, i32 32)
  %21 = load i32, i32* %opoint, align 4
  store i32 %21, i32* @rl_point, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %call16 = call i32 @rl_end_undo_group()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

declare i32 @rl_character_len(i32, i32) #1

declare i32 @rl_kill_text(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_rubout(i32 %count, i32 %key) #0 {
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
  %call = call i32 @rl_delete(i32 %sub, i32 %2)
  store i32 %call, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.end3, label %if.then1

if.then1:                                         ; preds = %if.end
  %call2 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* @rl_insert_mode, align 4
  %cmp4 = icmp eq i32 %4, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end3
  %5 = load i32, i32* %count.addr, align 4
  %6 = load i32, i32* %key.addr, align 4
  %call6 = call i32 @_rl_overwrite_rubout(i32 %5, i32 %6)
  store i32 %call6, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end3
  %7 = load i32, i32* %count.addr, align 4
  %8 = load i32, i32* %key.addr, align 4
  %call8 = call i32 @_rl_rubout_char(i32 %7, i32 %8)
  store i32 %call8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then5, %if.then1, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define i32 @_rl_rubout_char(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %orig_point = alloca i32, align 4
  %c = alloca i8, align 1
  %l = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %1
  %2 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_delete(i32 %sub, i32 %2)
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
  store i32 %4, i32* %orig_point, align 4
  %5 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp sgt i32 %5, 1
  br i1 %cmp5, label %if.then6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end4
  %6 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then6, label %if.else

if.then6:                                         ; preds = %lor.lhs.false, %if.end4
  %7 = load i32, i32* %count.addr, align 4
  %8 = load i32, i32* %key.addr, align 4
  %call7 = call i32 @rl_backward_char(i32 %7, i32 %8)
  %9 = load i32, i32* %orig_point, align 4
  %10 = load i32, i32* @rl_point, align 4
  %call8 = call i32 @rl_kill_text(i32 %9, i32 %10)
  br label %if.end28

if.else:                                          ; preds = %lor.lhs.false
  %call9 = call i32 @__ctype_get_mb_cur_max()
  %cmp10 = icmp eq i32 %call9, 1
  br i1 %cmp10, label %if.then13, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %if.else
  %11 = load i32, i32* @rl_byte_oriented, align 4
  %tobool12 = icmp ne i32 %11, 0
  br i1 %tobool12, label %if.then13, label %if.else24

if.then13:                                        ; preds = %lor.lhs.false11, %if.else
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* @rl_point, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 %dec
  %14 = load i8, i8* %arrayidx, align 1
  store i8 %14, i8* %c, align 1
  %15 = load i32, i32* @rl_point, align 4
  %16 = load i32, i32* %orig_point, align 4
  %call14 = call i32 @rl_delete_text(i32 %15, i32 %16)
  %17 = load i32, i32* @rl_point, align 4
  %18 = load i32, i32* @rl_end, align 4
  %cmp15 = icmp eq i32 %17, %18
  br i1 %cmp15, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %if.then13
  %19 = load i8, i8* %c, align 1
  %conv = zext i8 %19 to i32
  %call16 = call i32 @isprint(i32 %conv) #4
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %land.lhs.true18, label %if.end23

land.lhs.true18:                                  ; preds = %land.lhs.true
  %20 = load i32, i32* @_rl_last_c_pos, align 4
  %tobool19 = icmp ne i32 %20, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %land.lhs.true18
  %21 = load i8, i8* %c, align 1
  %conv21 = zext i8 %21 to i32
  %22 = load i32, i32* @rl_point, align 4
  %call22 = call i32 @rl_character_len(i32 %conv21, i32 %22)
  store i32 %call22, i32* %l, align 4
  %23 = load i32, i32* %l, align 4
  call void @_rl_erase_at_end_of_line(i32 %23)
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %land.lhs.true18, %land.lhs.true, %if.then13
  br label %if.end27

if.else24:                                        ; preds = %lor.lhs.false11
  %24 = load i8*, i8** @rl_line_buffer, align 4
  %25 = load i32, i32* @rl_point, align 4
  %call25 = call i32 @_rl_find_prev_mbchar(i8* %24, i32 %25, i32 1)
  store i32 %call25, i32* @rl_point, align 4
  %26 = load i32, i32* @rl_point, align 4
  %27 = load i32, i32* %orig_point, align 4
  %call26 = call i32 @rl_delete_text(i32 %26, i32 %27)
  br label %if.end27

if.end27:                                         ; preds = %if.else24, %if.end23
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.then6
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end28, %if.then2, %if.then
  %28 = load i32, i32* %retval, align 4
  ret i32 %28
}

; Function Attrs: nounwind readonly
declare i32 @isprint(i32) #2

declare void @_rl_erase_at_end_of_line(i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_rubout_or_delete(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_end, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %key.addr, align 4
  %call = call i32 @_rl_rubout_char(i32 %3, i32 %4)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %5 = load i32, i32* %count.addr, align 4
  %6 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_delete(i32 %5, i32 %6)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @rl_delete_horizontal_space(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %start = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %1 = load i8*, i8** @rl_line_buffer, align 4
  %2 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %2, 1
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %sub
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %sub2 = sub nsw i32 %5, 1
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i32 %sub2
  %6 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %7 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %while.cond
  %8 = phi i1 [ false, %while.cond ], [ %7, %lor.end ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %9 = load i32, i32* @rl_point, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* @rl_point, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %10 = load i32, i32* @rl_point, align 4
  store i32 %10, i32* %start, align 4
  br label %while.cond7

while.cond7:                                      ; preds = %while.body22, %while.end
  %11 = load i32, i32* @rl_point, align 4
  %12 = load i32, i32* @rl_end, align 4
  %cmp8 = icmp slt i32 %11, %12
  br i1 %cmp8, label %land.rhs10, label %land.end21

land.rhs10:                                       ; preds = %while.cond7
  %13 = load i8*, i8** @rl_line_buffer, align 4
  %14 = load i32, i32* @rl_point, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %15 to i32
  %cmp13 = icmp eq i32 %conv12, 32
  br i1 %cmp13, label %lor.end20, label %lor.rhs15

lor.rhs15:                                        ; preds = %land.rhs10
  %16 = load i8*, i8** @rl_line_buffer, align 4
  %17 = load i32, i32* @rl_point, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i32 %17
  %18 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %18 to i32
  %cmp18 = icmp eq i32 %conv17, 9
  br label %lor.end20

lor.end20:                                        ; preds = %lor.rhs15, %land.rhs10
  %19 = phi i1 [ true, %land.rhs10 ], [ %cmp18, %lor.rhs15 ]
  br label %land.end21

land.end21:                                       ; preds = %lor.end20, %while.cond7
  %20 = phi i1 [ false, %while.cond7 ], [ %19, %lor.end20 ]
  br i1 %20, label %while.body22, label %while.end23

while.body22:                                     ; preds = %land.end21
  %21 = load i32, i32* @rl_point, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* @rl_point, align 4
  br label %while.cond7

while.end23:                                      ; preds = %land.end21
  %22 = load i32, i32* %start, align 4
  %23 = load i32, i32* @rl_point, align 4
  %cmp24 = icmp ne i32 %22, %23
  br i1 %cmp24, label %if.then, label %if.end

if.then:                                          ; preds = %while.end23
  %24 = load i32, i32* %start, align 4
  %25 = load i32, i32* @rl_point, align 4
  %call = call i32 @rl_delete_text(i32 %24, i32 %25)
  %26 = load i32, i32* %start, align 4
  store i32 %26, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end23
  %27 = load i32, i32* @rl_point, align 4
  %cmp26 = icmp slt i32 %27, 0
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end
  store i32 0, i32* @rl_point, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_delete_or_show_completions(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_end, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %2 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp eq i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %count.addr, align 4
  %4 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_possible_completions(i32 %3, i32 %4)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %5 = load i32, i32* %count.addr, align 4
  %6 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_delete(i32 %5, i32 %6)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare i32 @rl_possible_completions(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_insert_comment(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %rl_comment_text = alloca i8*, align 4
  %rl_comment_len = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_beg_of_line(i32 1, i32 %0)
  %1 = load i8*, i8** @_rl_comment_begin, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** @_rl_comment_begin, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %rl_comment_text, align 4
  %3 = load i32, i32* @rl_explicit_arg, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %4 = load i8*, i8** %rl_comment_text, align 4
  %call1 = call i32 @rl_insert_text(i8* %4)
  br label %if.end17

if.else:                                          ; preds = %cond.end
  %5 = load i8*, i8** %rl_comment_text, align 4
  %call2 = call i32 @strlen(i8* %5)
  store i32 %call2, i32* %rl_comment_len, align 4
  %6 = load i32, i32* %rl_comment_len, align 4
  %cmp3 = icmp eq i32 %6, 0
  br i1 %cmp3, label %cond.true4, label %cond.false5

cond.true4:                                       ; preds = %if.else
  br i1 true, label %if.then13, label %if.else15

cond.false5:                                      ; preds = %if.else
  %7 = load i8*, i8** %rl_comment_text, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %10 to i32
  %cmp8 = icmp eq i32 %conv, %conv7
  br i1 %cmp8, label %land.lhs.true, label %if.else15

land.lhs.true:                                    ; preds = %cond.false5
  %11 = load i8*, i8** %rl_comment_text, align 4
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* %rl_comment_len, align 4
  %call10 = call i32 @strncmp(i8* %11, i8* %12, i32 %13)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.else15

if.then13:                                        ; preds = %land.lhs.true, %cond.true4
  %14 = load i32, i32* @rl_point, align 4
  %15 = load i32, i32* @rl_point, align 4
  %16 = load i32, i32* %rl_comment_len, align 4
  %add = add nsw i32 %15, %16
  %call14 = call i32 @rl_delete_text(i32 %14, i32 %add)
  br label %if.end

if.else15:                                        ; preds = %land.lhs.true, %cond.false5, %cond.true4
  %17 = load i8*, i8** %rl_comment_text, align 4
  %call16 = call i32 @rl_insert_text(i8* %17)
  br label %if.end

if.end:                                           ; preds = %if.else15, %if.then13
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  %18 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %18()
  %call18 = call i32 @rl_newline(i32 1, i32 10)
  ret i32 0
}

declare i32 @strncmp(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_upcase_word(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %call = call i32 @rl_change_case(i32 %0, i32 1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @rl_change_case(i32 %count, i32 %op) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %op.addr = alloca i32, align 4
  %start = alloca i32, align 4
  %next = alloca i32, align 4
  %end = alloca i32, align 4
  %inword = alloca i32, align 4
  %c = alloca i32, align 4
  %nc = alloca i32, align 4
  %nop = alloca i32, align 4
  %wc = alloca i32, align 4
  %nwc = alloca i32, align 4
  %mb = alloca [17 x i8], align 1
  %mlen = alloca i32, align 4
  %m = alloca i32, align 4
  %mps = alloca %struct.__mbstate_t, align 4
  %t = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %start, align 4
  %1 = load i32, i32* %count.addr, align 4
  %call = call i32 @rl_forward_word(i32 %1, i32 0)
  %2 = load i32, i32* @rl_point, align 4
  store i32 %2, i32* %end, align 4
  %3 = load i32, i32* %op.addr, align 4
  %cmp = icmp ne i32 %3, 1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %op.addr, align 4
  %cmp1 = icmp ne i32 %4, 2
  br i1 %cmp1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* %op.addr, align 4
  %cmp3 = icmp ne i32 %5, 3
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true2
  %call4 = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %6 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp slt i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.then6
  %7 = load i32, i32* %start, align 4
  store i32 %7, i32* %t, align 4
  %8 = load i32, i32* %end, align 4
  store i32 %8, i32* %start, align 4
  %9 = load i32, i32* %t, align 4
  store i32 %9, i32* %end, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end7

if.end7:                                          ; preds = %do.end, %if.end
  %10 = bitcast %struct.__mbstate_t* %mps to i8*
  call void @llvm.memset.p0i8.i32(i8* %10, i8 0, i32 8, i32 4, i1 false)
  %11 = load i32, i32* %start, align 4
  %12 = load i32, i32* %end, align 4
  %call8 = call i32 @rl_modifying(i32 %11, i32 %12)
  store i32 0, i32* %inword, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end126, %if.then18, %if.end7
  %13 = load i32, i32* %start, align 4
  %14 = load i32, i32* %end, align 4
  %cmp9 = icmp slt i32 %13, %14
  br i1 %cmp9, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* %start, align 4
  %call10 = call i32 @_rl_char_value(i8* %15, i32 %16)
  store i32 %call10, i32* %c, align 4
  %call11 = call i32 @__ctype_get_mb_cur_max()
  %cmp12 = icmp ugt i32 %call11, 1
  br i1 %cmp12, label %land.lhs.true13, label %cond.false

land.lhs.true13:                                  ; preds = %while.body
  %17 = load i32, i32* @rl_byte_oriented, align 4
  %cmp14 = icmp eq i32 %17, 0
  br i1 %cmp14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true13
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %19 = load i32, i32* %start, align 4
  %call15 = call i32 @_rl_find_next_mbchar(i8* %18, i32 %19, i32 1, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true13, %while.body
  %20 = load i32, i32* %start, align 4
  %add = add nsw i32 %20, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call15, %cond.true ], [ %add, %cond.false ]
  store i32 %cond, i32* %next, align 4
  %21 = load i32, i32* %c, align 4
  %call16 = call i32 @_rl_walphabetic(i32 %21)
  %cmp17 = icmp eq i32 %call16, 0
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %cond.end
  store i32 0, i32* %inword, align 4
  %22 = load i32, i32* %next, align 4
  store i32 %22, i32* %start, align 4
  br label %while.cond

if.end19:                                         ; preds = %cond.end
  %23 = load i32, i32* %op.addr, align 4
  %cmp20 = icmp eq i32 %23, 3
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end19
  %24 = load i32, i32* %inword, align 4
  %tobool = icmp ne i32 %24, 0
  %cond22 = select i1 %tobool, i32 2, i32 1
  store i32 %cond22, i32* %nop, align 4
  store i32 1, i32* %inword, align 4
  br label %if.end23

if.else:                                          ; preds = %if.end19
  %25 = load i32, i32* %op.addr, align 4
  store i32 %25, i32* %nop, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.then21
  %call24 = call i32 @__ctype_get_mb_cur_max()
  %cmp25 = icmp eq i32 %call24, 1
  br i1 %cmp25, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end23
  %26 = load i32, i32* @rl_byte_oriented, align 4
  %tobool26 = icmp ne i32 %26, 0
  br i1 %tobool26, label %if.then37, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %lor.lhs.false
  br i1 false, label %cond.true28, label %cond.false32

cond.true28:                                      ; preds = %lor.lhs.false27
  %27 = load i32, i32* %c, align 4
  %conv = trunc i32 %27 to i8
  %conv29 = zext i8 %conv to i32
  %call30 = call i32 @isascii(i32 %conv29)
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %if.then37, label %if.else77

cond.false32:                                     ; preds = %lor.lhs.false27
  %28 = load i32, i32* %c, align 4
  %conv33 = trunc i32 %28 to i8
  %conv34 = zext i8 %conv33 to i32
  %cmp35 = icmp ult i32 %conv34, 128
  br i1 %cmp35, label %if.then37, label %if.else77

if.then37:                                        ; preds = %cond.false32, %cond.true28, %lor.lhs.false, %if.end23
  %29 = load i32, i32* %nop, align 4
  %cmp38 = icmp eq i32 %29, 1
  br i1 %cmp38, label %cond.true40, label %cond.false57

cond.true40:                                      ; preds = %if.then37
  %30 = load i32, i32* %c, align 4
  %conv41 = trunc i32 %30 to i8
  %conv42 = zext i8 %conv41 to i32
  %31 = load i32, i32* %c, align 4
  %cmp43 = icmp eq i32 %conv42, %31
  br i1 %cmp43, label %land.lhs.true45, label %cond.false54

land.lhs.true45:                                  ; preds = %cond.true40
  %32 = load i32, i32* %c, align 4
  %conv46 = trunc i32 %32 to i8
  %conv47 = zext i8 %conv46 to i32
  %call48 = call i32 @islower(i32 %conv47) #4
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %cond.true50, label %cond.false54

cond.true50:                                      ; preds = %land.lhs.true45
  %33 = load i32, i32* %c, align 4
  %conv51 = trunc i32 %33 to i8
  %conv52 = zext i8 %conv51 to i32
  %call53 = call i32 @toupper(i32 %conv52) #4
  br label %cond.end55

cond.false54:                                     ; preds = %land.lhs.true45, %cond.true40
  %34 = load i32, i32* %c, align 4
  br label %cond.end55

cond.end55:                                       ; preds = %cond.false54, %cond.true50
  %cond56 = phi i32 [ %call53, %cond.true50 ], [ %34, %cond.false54 ]
  br label %cond.end74

cond.false57:                                     ; preds = %if.then37
  %35 = load i32, i32* %c, align 4
  %conv58 = trunc i32 %35 to i8
  %conv59 = zext i8 %conv58 to i32
  %36 = load i32, i32* %c, align 4
  %cmp60 = icmp eq i32 %conv59, %36
  br i1 %cmp60, label %land.lhs.true62, label %cond.false71

land.lhs.true62:                                  ; preds = %cond.false57
  %37 = load i32, i32* %c, align 4
  %conv63 = trunc i32 %37 to i8
  %conv64 = zext i8 %conv63 to i32
  %call65 = call i32 @isupper(i32 %conv64) #4
  %tobool66 = icmp ne i32 %call65, 0
  br i1 %tobool66, label %cond.true67, label %cond.false71

cond.true67:                                      ; preds = %land.lhs.true62
  %38 = load i32, i32* %c, align 4
  %conv68 = trunc i32 %38 to i8
  %conv69 = zext i8 %conv68 to i32
  %call70 = call i32 @tolower(i32 %conv69) #4
  br label %cond.end72

cond.false71:                                     ; preds = %land.lhs.true62, %cond.false57
  %39 = load i32, i32* %c, align 4
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false71, %cond.true67
  %cond73 = phi i32 [ %call70, %cond.true67 ], [ %39, %cond.false71 ]
  br label %cond.end74

cond.end74:                                       ; preds = %cond.end72, %cond.end55
  %cond75 = phi i32 [ %cond56, %cond.end55 ], [ %cond73, %cond.end72 ]
  store i32 %cond75, i32* %nc, align 4
  %40 = load i32, i32* %nc, align 4
  %conv76 = trunc i32 %40 to i8
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* %start, align 4
  %arrayidx = getelementptr inbounds i8, i8* %41, i32 %42
  store i8 %conv76, i8* %arrayidx, align 1
  br label %if.end126

if.else77:                                        ; preds = %cond.false32, %cond.true28
  %43 = load i8*, i8** @rl_line_buffer, align 4
  %44 = load i32, i32* %start, align 4
  %add.ptr = getelementptr inbounds i8, i8* %43, i32 %44
  %45 = load i32, i32* %end, align 4
  %46 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %45, %46
  %call78 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %mps)
  store i32 %call78, i32* %m, align 4
  %47 = load i32, i32* %m, align 4
  %cmp79 = icmp eq i32 %47, -1
  br i1 %cmp79, label %if.then84, label %lor.lhs.false81

lor.lhs.false81:                                  ; preds = %if.else77
  %48 = load i32, i32* %m, align 4
  %cmp82 = icmp eq i32 %48, -2
  br i1 %cmp82, label %if.then84, label %if.else87

if.then84:                                        ; preds = %lor.lhs.false81, %if.else77
  %49 = load i8*, i8** @rl_line_buffer, align 4
  %50 = load i32, i32* %start, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %49, i32 %50
  %51 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %51 to i32
  store i32 %conv86, i32* %wc, align 4
  br label %if.end92

if.else87:                                        ; preds = %lor.lhs.false81
  %52 = load i32, i32* %m, align 4
  %cmp88 = icmp eq i32 %52, 0
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.else87
  store i32 0, i32* %wc, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.then90, %if.else87
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %if.then84
  %53 = load i32, i32* %nop, align 4
  %cmp93 = icmp eq i32 %53, 1
  br i1 %cmp93, label %cond.true95, label %cond.false103

cond.true95:                                      ; preds = %if.end92
  %54 = load i32, i32* %wc, align 4
  %call96 = call i32 @iswlower(i32 %54)
  %tobool97 = icmp ne i32 %call96, 0
  br i1 %tobool97, label %cond.true98, label %cond.false100

cond.true98:                                      ; preds = %cond.true95
  %55 = load i32, i32* %wc, align 4
  %call99 = call i32 @towupper(i32 %55)
  br label %cond.end101

cond.false100:                                    ; preds = %cond.true95
  %56 = load i32, i32* %wc, align 4
  br label %cond.end101

cond.end101:                                      ; preds = %cond.false100, %cond.true98
  %cond102 = phi i32 [ %call99, %cond.true98 ], [ %56, %cond.false100 ]
  br label %cond.end111

cond.false103:                                    ; preds = %if.end92
  %57 = load i32, i32* %wc, align 4
  %call104 = call i32 @iswupper(i32 %57)
  %tobool105 = icmp ne i32 %call104, 0
  br i1 %tobool105, label %cond.true106, label %cond.false108

cond.true106:                                     ; preds = %cond.false103
  %58 = load i32, i32* %wc, align 4
  %call107 = call i32 @towlower(i32 %58)
  br label %cond.end109

cond.false108:                                    ; preds = %cond.false103
  %59 = load i32, i32* %wc, align 4
  br label %cond.end109

cond.end109:                                      ; preds = %cond.false108, %cond.true106
  %cond110 = phi i32 [ %call107, %cond.true106 ], [ %59, %cond.false108 ]
  br label %cond.end111

cond.end111:                                      ; preds = %cond.end109, %cond.end101
  %cond112 = phi i32 [ %cond102, %cond.end101 ], [ %cond110, %cond.end109 ]
  store i32 %cond112, i32* %nwc, align 4
  %60 = load i32, i32* %nwc, align 4
  %61 = load i32, i32* %wc, align 4
  %cmp113 = icmp ne i32 %60, %61
  br i1 %cmp113, label %if.then115, label %if.end125

if.then115:                                       ; preds = %cond.end111
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %62 = load i32, i32* %nwc, align 4
  %call116 = call i32 @wcrtomb(i8* %arraydecay, i32 %62, %struct.__mbstate_t* %mps)
  store i32 %call116, i32* %mlen, align 4
  %63 = load i32, i32* %mlen, align 4
  %cmp117 = icmp sgt i32 %63, 0
  br i1 %cmp117, label %if.then119, label %if.end121

if.then119:                                       ; preds = %if.then115
  %64 = load i32, i32* %mlen, align 4
  %arrayidx120 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 %64
  store i8 0, i8* %arrayidx120, align 1
  br label %if.end121

if.end121:                                        ; preds = %if.then119, %if.then115
  %65 = load i8*, i8** @rl_line_buffer, align 4
  %66 = load i32, i32* %start, align 4
  %add.ptr122 = getelementptr inbounds i8, i8* %65, i32 %66
  %arraydecay123 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %67 = load i32, i32* %mlen, align 4
  %call124 = call i8* @strncpy(i8* %add.ptr122, i8* %arraydecay123, i32 %67)
  br label %if.end125

if.end125:                                        ; preds = %if.end121, %cond.end111
  br label %if.end126

if.end126:                                        ; preds = %if.end125, %cond.end74
  %68 = load i32, i32* %next, align 4
  store i32 %68, i32* %start, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %69 = load i32, i32* %end, align 4
  store i32 %69, i32* @rl_point, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %70 = load i32, i32* %retval, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind
define i32 @rl_downcase_word(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %call = call i32 @rl_change_case(i32 %0, i32 2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_capitalize_word(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %call = call i32 @rl_change_case(i32 %0, i32 3)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_transpose_words(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %word1 = alloca i8*, align 4
  %word2 = alloca i8*, align 4
  %w1_beg = alloca i32, align 4
  %w1_end = alloca i32, align 4
  %w2_beg = alloca i32, align 4
  %w2_end = alloca i32, align 4
  %orig_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %orig_point, align 4
  %1 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %3 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_forward_word(i32 %2, i32 %3)
  %4 = load i32, i32* @rl_point, align 4
  store i32 %4, i32* %w2_end, align 4
  %5 = load i32, i32* %key.addr, align 4
  %call1 = call i32 @rl_backward_word(i32 1, i32 %5)
  %6 = load i32, i32* @rl_point, align 4
  store i32 %6, i32* %w2_beg, align 4
  %7 = load i32, i32* %count.addr, align 4
  %8 = load i32, i32* %key.addr, align 4
  %call2 = call i32 @rl_backward_word(i32 %7, i32 %8)
  %9 = load i32, i32* @rl_point, align 4
  store i32 %9, i32* %w1_beg, align 4
  %10 = load i32, i32* %key.addr, align 4
  %call3 = call i32 @rl_forward_word(i32 1, i32 %10)
  %11 = load i32, i32* @rl_point, align 4
  store i32 %11, i32* %w1_end, align 4
  %12 = load i32, i32* %w1_beg, align 4
  %13 = load i32, i32* %w2_beg, align 4
  %cmp = icmp eq i32 %12, %13
  br i1 %cmp, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %14 = load i32, i32* %w2_beg, align 4
  %15 = load i32, i32* %w1_end, align 4
  %cmp4 = icmp slt i32 %14, %15
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %call6 = call i32 @rl_ding()
  %16 = load i32, i32* %orig_point, align 4
  store i32 %16, i32* @rl_point, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %lor.lhs.false
  %17 = load i32, i32* %w1_beg, align 4
  %18 = load i32, i32* %w1_end, align 4
  %call8 = call i8* @rl_copy_text(i32 %17, i32 %18)
  store i8* %call8, i8** %word1, align 4
  %19 = load i32, i32* %w2_beg, align 4
  %20 = load i32, i32* %w2_end, align 4
  %call9 = call i8* @rl_copy_text(i32 %19, i32 %20)
  store i8* %call9, i8** %word2, align 4
  %call10 = call i32 @rl_begin_undo_group()
  %21 = load i32, i32* %w2_beg, align 4
  store i32 %21, i32* @rl_point, align 4
  %22 = load i32, i32* %w2_beg, align 4
  %23 = load i32, i32* %w2_end, align 4
  %call11 = call i32 @rl_delete_text(i32 %22, i32 %23)
  %24 = load i8*, i8** %word1, align 4
  %call12 = call i32 @rl_insert_text(i8* %24)
  %25 = load i32, i32* %w1_beg, align 4
  store i32 %25, i32* @rl_point, align 4
  %26 = load i32, i32* %w1_beg, align 4
  %27 = load i32, i32* %w1_end, align 4
  %call13 = call i32 @rl_delete_text(i32 %26, i32 %27)
  %28 = load i8*, i8** %word2, align 4
  %call14 = call i32 @rl_insert_text(i8* %28)
  %29 = load i32, i32* %w2_end, align 4
  store i32 %29, i32* @rl_point, align 4
  %call15 = call i32 @rl_end_undo_group()
  %30 = load i8*, i8** %word1, align 4
  call void @xfree(i8* %30)
  %31 = load i8*, i8** %word2, align 4
  call void @xfree(i8* %31)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then5, %if.then
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

; Function Attrs: noinline nounwind
define i32 @rl_transpose_chars(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %dummy = alloca i8*, align 4
  %i = alloca i32, align 4
  %char_length = alloca i32, align 4
  %prev_point = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then2

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i32, i32* @rl_end, align 4
  %cmp1 = icmp slt i32 %2, 2
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %lor.lhs.false, %if.end
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %lor.lhs.false
  %call4 = call i32 @rl_begin_undo_group()
  %3 = load i32, i32* @rl_point, align 4
  %4 = load i32, i32* @rl_end, align 4
  %cmp5 = icmp eq i32 %3, %4
  br i1 %cmp5, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.end3
  %call7 = call i32 @__ctype_get_mb_cur_max()
  %cmp8 = icmp ugt i32 %call7, 1
  br i1 %cmp8, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.then6
  %5 = load i32, i32* @rl_byte_oriented, align 4
  %cmp9 = icmp eq i32 %5, 0
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %6 = load i8*, i8** @rl_line_buffer, align 4
  %7 = load i32, i32* @rl_point, align 4
  %call10 = call i32 @_rl_find_prev_mbchar(i8* %6, i32 %7, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.then6
  %8 = load i32, i32* @rl_point, align 4
  %sub = sub nsw i32 %8, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call10, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* @rl_point, align 4
  store i32 1, i32* %count.addr, align 4
  br label %if.end11

if.end11:                                         ; preds = %cond.end, %if.end3
  %9 = load i32, i32* @rl_point, align 4
  store i32 %9, i32* %prev_point, align 4
  %call12 = call i32 @__ctype_get_mb_cur_max()
  %cmp13 = icmp ugt i32 %call12, 1
  br i1 %cmp13, label %land.lhs.true14, label %cond.false18

land.lhs.true14:                                  ; preds = %if.end11
  %10 = load i32, i32* @rl_byte_oriented, align 4
  %cmp15 = icmp eq i32 %10, 0
  br i1 %cmp15, label %cond.true16, label %cond.false18

cond.true16:                                      ; preds = %land.lhs.true14
  %11 = load i8*, i8** @rl_line_buffer, align 4
  %12 = load i32, i32* @rl_point, align 4
  %call17 = call i32 @_rl_find_prev_mbchar(i8* %11, i32 %12, i32 1)
  br label %cond.end20

cond.false18:                                     ; preds = %land.lhs.true14, %if.end11
  %13 = load i32, i32* @rl_point, align 4
  %sub19 = sub nsw i32 %13, 1
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false18, %cond.true16
  %cond21 = phi i32 [ %call17, %cond.true16 ], [ %sub19, %cond.false18 ]
  store i32 %cond21, i32* @rl_point, align 4
  %14 = load i32, i32* %prev_point, align 4
  %15 = load i32, i32* @rl_point, align 4
  %sub22 = sub nsw i32 %14, %15
  store i32 %sub22, i32* %char_length, align 4
  %16 = load i32, i32* %char_length, align 4
  %add = add nsw i32 %16, 1
  %call23 = call i8* @xmalloc(i32 %add)
  store i8* %call23, i8** %dummy, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end20
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %char_length, align 4
  %cmp24 = icmp slt i32 %17, %18
  br i1 %cmp24, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load i8*, i8** @rl_line_buffer, align 4
  %20 = load i32, i32* @rl_point, align 4
  %21 = load i32, i32* %i, align 4
  %add25 = add nsw i32 %20, %21
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 %add25
  %22 = load i8, i8* %arrayidx, align 1
  %23 = load i8*, i8** %dummy, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %23, i32 %24
  store i8 %22, i8* %arrayidx26, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %26 = load i8*, i8** %dummy, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %26, i32 %27
  store i8 0, i8* %arrayidx27, align 1
  %28 = load i32, i32* @rl_point, align 4
  %29 = load i32, i32* @rl_point, align 4
  %30 = load i32, i32* %char_length, align 4
  %add28 = add nsw i32 %29, %30
  %call29 = call i32 @rl_delete_text(i32 %28, i32 %add28)
  %31 = load i8*, i8** @rl_line_buffer, align 4
  %32 = load i32, i32* @rl_point, align 4
  %33 = load i32, i32* %count.addr, align 4
  %call30 = call i32 @_rl_find_next_mbchar(i8* %31, i32 %32, i32 %33, i32 1)
  store i32 %call30, i32* @rl_point, align 4
  call void @_rl_fix_point(i32 0)
  %34 = load i8*, i8** %dummy, align 4
  %call31 = call i32 @rl_insert_text(i8* %34)
  %call32 = call i32 @rl_end_undo_group()
  %35 = load i8*, i8** %dummy, align 4
  call void @xfree(i8* %35)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then2, %if.then
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind
define i32 @_rl_char_search_internal(i32 %count, i32 %dir, i8* %smbchar, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %dir.addr = alloca i32, align 4
  %smbchar.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %pos = alloca i32, align 4
  %inc = alloca i32, align 4
  %prepos = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %dir, i32* %dir.addr, align 4
  store i8* %smbchar, i8** %smbchar.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32, i32* %dir.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @rl_point, align 4
  store i32 %1, i32* %pos, align 4
  %2 = load i32, i32* %dir.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  %cond = select i1 %cmp1, i32 -1, i32 1
  store i32 %cond, i32* %inc, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %if.end
  %3 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %dir.addr, align 4
  %cmp2 = icmp slt i32 %4, 0
  br i1 %cmp2, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %while.body
  %5 = load i32, i32* %pos, align 4
  %cmp3 = icmp sle i32 %5, 0
  br i1 %cmp3, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %while.body
  %6 = load i32, i32* %dir.addr, align 4
  %cmp4 = icmp sgt i32 %6, 0
  br i1 %cmp4, label %land.lhs.true5, label %if.end8

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %7 = load i32, i32* %pos, align 4
  %8 = load i32, i32* @rl_end, align 4
  %cmp6 = icmp sge i32 %7, %8
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %land.lhs.true5, %land.lhs.true
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  %9 = load i32, i32* %inc, align 4
  %cmp9 = icmp sgt i32 %9, 0
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end8
  %10 = load i8*, i8** @rl_line_buffer, align 4
  %11 = load i32, i32* %pos, align 4
  %call10 = call i32 @_rl_find_next_mbchar(i8* %10, i32 %11, i32 1, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %if.end8
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* %pos, align 4
  %call11 = call i32 @_rl_find_prev_mbchar(i8* %12, i32 %13, i32 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond12 = phi i32 [ %call10, %cond.true ], [ %call11, %cond.false ]
  store i32 %cond12, i32* %pos, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end40, %cond.end
  %14 = load i8*, i8** @rl_line_buffer, align 4
  %15 = load i32, i32* %pos, align 4
  %16 = load i32, i32* @rl_end, align 4
  %17 = load i8*, i8** %smbchar.addr, align 4
  %18 = load i32, i32* %len.addr, align 4
  %call13 = call i32 @_rl_is_mbchar_matched(i8* %14, i32 %15, i32 %16, i8* %17, i32 %18)
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.then15, label %if.end31

if.then15:                                        ; preds = %do.body
  %19 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, i32* %count.addr, align 4
  %20 = load i32, i32* %dir.addr, align 4
  %cmp16 = icmp slt i32 %20, 0
  br i1 %cmp16, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.then15
  %21 = load i32, i32* %dir.addr, align 4
  %cmp18 = icmp eq i32 %21, -1
  br i1 %cmp18, label %cond.true19, label %cond.false21

cond.true19:                                      ; preds = %if.then17
  %22 = load i8*, i8** @rl_line_buffer, align 4
  %23 = load i32, i32* %pos, align 4
  %call20 = call i32 @_rl_find_next_mbchar(i8* %22, i32 %23, i32 1, i32 0)
  br label %cond.end22

cond.false21:                                     ; preds = %if.then17
  %24 = load i32, i32* %pos, align 4
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true19
  %cond23 = phi i32 [ %call20, %cond.true19 ], [ %24, %cond.false21 ]
  store i32 %cond23, i32* @rl_point, align 4
  br label %if.end30

if.else:                                          ; preds = %if.then15
  %25 = load i32, i32* %dir.addr, align 4
  %cmp24 = icmp eq i32 %25, 1
  br i1 %cmp24, label %cond.true25, label %cond.false27

cond.true25:                                      ; preds = %if.else
  %26 = load i8*, i8** @rl_line_buffer, align 4
  %27 = load i32, i32* %pos, align 4
  %call26 = call i32 @_rl_find_prev_mbchar(i8* %26, i32 %27, i32 0)
  br label %cond.end28

cond.false27:                                     ; preds = %if.else
  %28 = load i32, i32* %pos, align 4
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false27, %cond.true25
  %cond29 = phi i32 [ %call26, %cond.true25 ], [ %28, %cond.false27 ]
  store i32 %cond29, i32* @rl_point, align 4
  br label %if.end30

if.end30:                                         ; preds = %cond.end28, %cond.end22
  br label %do.end

if.end31:                                         ; preds = %do.body
  %29 = load i32, i32* %pos, align 4
  store i32 %29, i32* %prepos, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end31
  %30 = load i32, i32* %dir.addr, align 4
  %cmp32 = icmp slt i32 %30, 0
  br i1 %cmp32, label %cond.true33, label %cond.false36

cond.true33:                                      ; preds = %do.cond
  %31 = load i8*, i8** @rl_line_buffer, align 4
  %32 = load i32, i32* %pos, align 4
  %call34 = call i32 @_rl_find_prev_mbchar(i8* %31, i32 %32, i32 0)
  store i32 %call34, i32* %pos, align 4
  %33 = load i32, i32* %prepos, align 4
  %cmp35 = icmp ne i32 %call34, %33
  %conv = zext i1 %cmp35 to i32
  br label %cond.end40

cond.false36:                                     ; preds = %do.cond
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %35 = load i32, i32* %pos, align 4
  %call37 = call i32 @_rl_find_next_mbchar(i8* %34, i32 %35, i32 1, i32 0)
  store i32 %call37, i32* %pos, align 4
  %36 = load i32, i32* %prepos, align 4
  %cmp38 = icmp ne i32 %call37, %36
  %conv39 = zext i1 %cmp38 to i32
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false36, %cond.true33
  %cond41 = phi i32 [ %conv, %cond.true33 ], [ %conv39, %cond.false36 ]
  %tobool42 = icmp ne i32 %cond41, 0
  br i1 %tobool42, label %do.body, label %do.end

do.end:                                           ; preds = %cond.end40, %if.end30
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then7, %if.then
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

declare i32 @_rl_is_mbchar_matched(i8*, i32, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_char_search(i32 %count, i32 %key) #0 {
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
  %1 = load i32, i32* %count.addr, align 4
  %call = call %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %1)
  store %struct.__rl_callback_generic_arg* %call, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %2 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %2, i32 0, i32 1
  store i32 2, i32* %i1, align 4
  %3 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %3, i32 0, i32 2
  store i32 -2, i32* %i2, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_char_search_callback, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %count.addr, align 4
  %call1 = call i32 @_rl_char_search(i32 %4, i32 2, i32 -2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_char_search_callback(%struct.__rl_callback_generic_arg* %data) #0 {
entry:
  %data.addr = alloca %struct.__rl_callback_generic_arg*, align 4
  store %struct.__rl_callback_generic_arg* %data, %struct.__rl_callback_generic_arg** %data.addr, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* null, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 1, i32* @_rl_want_redisplay, align 4
  %0 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %count = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %0, i32 0, i32 0
  %1 = load i32, i32* %count, align 4
  %2 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %i1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %2, i32 0, i32 1
  %3 = load i32, i32* %i1, align 4
  %4 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** %data.addr, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %4, i32 0, i32 2
  %5 = load i32, i32* %i2, align 4
  %call = call i32 @_rl_char_search(i32 %1, i32 %3, i32 %5)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @_rl_char_search(i32 %count, i32 %fdir, i32 %bdir) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %fdir.addr = alloca i32, align 4
  %bdir.addr = alloca i32, align 4
  %mbchar = alloca [16 x i8], align 1
  %mb_len = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %fdir, i32* %fdir.addr, align 4
  store i32 %bdir, i32* %bdir.addr, align 4
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mbchar, i32 0, i32 0
  %call = call i32 @_rl_read_mbchar(i8* %arraydecay, i32 16)
  store i32 %call, i32* %mb_len, align 4
  %0 = load i32, i32* %mb_len, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %2
  %3 = load i32, i32* %bdir.addr, align 4
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %mbchar, i32 0, i32 0
  %4 = load i32, i32* %mb_len, align 4
  %call4 = call i32 @_rl_char_search_internal(i32 %sub, i32 %3, i8* %arraydecay3, i32 %4)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  %5 = load i32, i32* %count.addr, align 4
  %6 = load i32, i32* %fdir.addr, align 4
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %mbchar, i32 0, i32 0
  %7 = load i32, i32* %mb_len, align 4
  %call6 = call i32 @_rl_char_search_internal(i32 %5, i32 %6, i8* %arraydecay5, i32 %7)
  store i32 %call6, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then2, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @rl_backward_char_search(i32 %count, i32 %key) #0 {
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
  %1 = load i32, i32* %count.addr, align 4
  %call = call %struct.__rl_callback_generic_arg* @_rl_callback_data_alloc(i32 %1)
  store %struct.__rl_callback_generic_arg* %call, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %2 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i1 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %2, i32 0, i32 1
  store i32 -2, i32* %i1, align 4
  %3 = load %struct.__rl_callback_generic_arg*, %struct.__rl_callback_generic_arg** @_rl_callback_data, align 4
  %i2 = getelementptr inbounds %struct.__rl_callback_generic_arg, %struct.__rl_callback_generic_arg* %3, i32 0, i32 2
  store i32 2, i32* %i2, align 4
  store i32 (%struct.__rl_callback_generic_arg*)* @_rl_char_search_callback, i32 (%struct.__rl_callback_generic_arg*)** @_rl_callback_func, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %count.addr, align 4
  %call1 = call i32 @_rl_char_search(i32 %4, i32 -2, i32 2)
  store i32 %call1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @_rl_set_mark_at_pos(i32 %position) #0 {
entry:
  %retval = alloca i32, align 4
  %position.addr = alloca i32, align 4
  store i32 %position, i32* %position.addr, align 4
  %0 = load i32, i32* %position.addr, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %position.addr, align 4
  store i32 %2, i32* @rl_mark, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @rl_set_mark(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_explicit_arg, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %count.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* @rl_point, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %2, %cond.false ]
  %call = call i32 @_rl_set_mark_at_pos(i32 %cond)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @rl_exchange_point_and_mark(i32 %count, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_mark, align 4
  %1 = load i32, i32* @rl_end, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* @rl_mark, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* @rl_mark, align 4
  %cmp1 = icmp eq i32 %2, -1
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %call = call i32 @rl_ding()
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.else
  %3 = load i32, i32* @rl_point, align 4
  store i32 %3, i32* %t, align 4
  %4 = load i32, i32* @rl_mark, align 4
  store i32 %4, i32* @rl_point, align 4
  %5 = load i32, i32* %t, align 4
  store i32 %5, i32* @rl_mark, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end3

if.end3:                                          ; preds = %do.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare void @_rl_add_macro_char(i32) #1

declare i32 @_rl_restore_tty_signals() #1

declare i32 @rl_modifying(i32, i32) #1

declare i32 @isascii(i32) #1

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #2

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

declare i32 @iswlower(i32) #1

declare i32 @towupper(i32) #1

declare i32 @iswupper(i32) #1

declare i32 @towlower(i32) #1

declare i32 @wcrtomb(i8*, i32, %struct.__mbstate_t*) #1

declare i32 @_rl_read_mbchar(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
