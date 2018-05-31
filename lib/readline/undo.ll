; ModuleID = 'undo.c'
source_filename = "undo.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._hist_entry = type { i8*, i8*, i8* }

@_rl_doing_an_undo = global i32 0, align 4
@_rl_undo_group_level = global i32 0, align 4
@rl_undo_list = global %struct.undo_list* null, align 4
@rl_readline_state = external global i32, align 4
@rl_point = external global i32, align 4
@rl_end = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@rl_editing_mode = external global i32, align 4
@rl_mark = external global i32, align 4

; Function Attrs: noinline nounwind
define void @rl_add_undo(i32 %what, i32 %start, i32 %end, i8* %text) #0 {
entry:
  %what.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %text.addr = alloca i8*, align 4
  %temp = alloca %struct.undo_list*, align 4
  store i32 %what, i32* %what.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i32, i32* %what.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %2 = load i32, i32* %end.addr, align 4
  %3 = load i8*, i8** %text.addr, align 4
  %call = call %struct.undo_list* @alloc_undo_entry(i32 %0, i32 %1, i32 %2, i8* %3)
  store %struct.undo_list* %call, %struct.undo_list** %temp, align 4
  %4 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %5 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %5, i32 0, i32 0
  store %struct.undo_list* %4, %struct.undo_list** %next, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  store %struct.undo_list* %6, %struct.undo_list** @rl_undo_list, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal %struct.undo_list* @alloc_undo_entry(i32 %what, i32 %start, i32 %end, i8* %text) #0 {
entry:
  %what.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %text.addr = alloca i8*, align 4
  %temp = alloca %struct.undo_list*, align 4
  store i32 %what, i32* %what.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  %call = call i8* @xmalloc(i32 20)
  %0 = bitcast i8* %call to %struct.undo_list*
  store %struct.undo_list* %0, %struct.undo_list** %temp, align 4
  %1 = load i32, i32* %what.addr, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %what1 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 4
  store i32 %1, i32* %what1, align 4
  %3 = load i32, i32* %start.addr, align 4
  %4 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %start2 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %4, i32 0, i32 1
  store i32 %3, i32* %start2, align 4
  %5 = load i32, i32* %end.addr, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %end3 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %6, i32 0, i32 2
  store i32 %5, i32* %end3, align 4
  %7 = load i8*, i8** %text.addr, align 4
  %8 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %text4 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %8, i32 0, i32 3
  store i8* %7, i8** %text4, align 4
  %9 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %9, i32 0, i32 0
  store %struct.undo_list* null, %struct.undo_list** %next, align 4
  %10 = load %struct.undo_list*, %struct.undo_list** %temp, align 4
  ret %struct.undo_list* %10
}

; Function Attrs: noinline nounwind
define void @_rl_free_undo_list(%struct.undo_list* %ul) #0 {
entry:
  %ul.addr = alloca %struct.undo_list*, align 4
  %release = alloca %struct.undo_list*, align 4
  store %struct.undo_list* %ul, %struct.undo_list** %ul.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %struct.undo_list*, %struct.undo_list** %ul.addr, align 4
  %tobool = icmp ne %struct.undo_list* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.undo_list*, %struct.undo_list** %ul.addr, align 4
  store %struct.undo_list* %1, %struct.undo_list** %release, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** %ul.addr, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 0
  %3 = load %struct.undo_list*, %struct.undo_list** %next, align 4
  store %struct.undo_list* %3, %struct.undo_list** %ul.addr, align 4
  %4 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %4, i32 0, i32 4
  %5 = load i32, i32* %what, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %6 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %text = getelementptr inbounds %struct.undo_list, %struct.undo_list* %6, i32 0, i32 3
  %7 = load i8*, i8** %text, align 4
  call void @xfree(i8* %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %8 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %9 = bitcast %struct.undo_list* %8 to i8*
  call void @xfree(i8* %9)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define void @rl_free_undo_list() #0 {
entry:
  %release = alloca %struct.undo_list*, align 4
  %orig_list = alloca %struct.undo_list*, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %0, %struct.undo_list** %orig_list, align 4
  %1 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  call void @_rl_free_undo_list(%struct.undo_list* %1)
  store %struct.undo_list* null, %struct.undo_list** @rl_undo_list, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** %orig_list, align 4
  %3 = bitcast %struct.undo_list* %2 to i8**
  call void @_hs_replace_history_data(i32 -1, i8** %3, i8** null)
  ret void
}

declare void @_hs_replace_history_data(i32, i8**, i8**) #1

; Function Attrs: noinline nounwind
define %struct.undo_list* @_rl_copy_undo_entry(%struct.undo_list* %entry1) #0 {
entry:
  %entry.addr = alloca %struct.undo_list*, align 4
  %new = alloca %struct.undo_list*, align 4
  store %struct.undo_list* %entry1, %struct.undo_list** %entry.addr, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %0, i32 0, i32 4
  %1 = load i32, i32* %what, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %start = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 1
  %3 = load i32, i32* %start, align 4
  %4 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %end = getelementptr inbounds %struct.undo_list, %struct.undo_list* %4, i32 0, i32 2
  %5 = load i32, i32* %end, align 4
  %call = call %struct.undo_list* @alloc_undo_entry(i32 %1, i32 %3, i32 %5, i8* null)
  store %struct.undo_list* %call, %struct.undo_list** %new, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %text = getelementptr inbounds %struct.undo_list, %struct.undo_list* %6, i32 0, i32 3
  %7 = load i8*, i8** %text, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %8 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %text2 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %8, i32 0, i32 3
  %9 = load i8*, i8** %text2, align 4
  %call3 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call3
  %call4 = call i8* @xmalloc(i32 %add)
  %10 = load %struct.undo_list*, %struct.undo_list** %entry.addr, align 4
  %text5 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %10, i32 0, i32 3
  %11 = load i8*, i8** %text5, align 4
  %call6 = call i8* @strcpy(i8* %call4, i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call6, %cond.true ], [ null, %cond.false ]
  %12 = load %struct.undo_list*, %struct.undo_list** %new, align 4
  %text7 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %12, i32 0, i32 3
  store i8* %cond, i8** %text7, align 4
  %13 = load %struct.undo_list*, %struct.undo_list** %new, align 4
  ret %struct.undo_list* %13
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define %struct.undo_list* @_rl_copy_undo_list(%struct.undo_list* %head) #0 {
entry:
  %retval = alloca %struct.undo_list*, align 4
  %head.addr = alloca %struct.undo_list*, align 4
  %list = alloca %struct.undo_list*, align 4
  %new = alloca %struct.undo_list*, align 4
  %roving = alloca %struct.undo_list*, align 4
  %c = alloca %struct.undo_list*, align 4
  store %struct.undo_list* %head, %struct.undo_list** %head.addr, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** %head.addr, align 4
  %cmp = icmp eq %struct.undo_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.undo_list*, %struct.undo_list** %head.addr, align 4
  store %struct.undo_list* %1, %struct.undo_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.undo_list*, %struct.undo_list** %head.addr, align 4
  store %struct.undo_list* %2, %struct.undo_list** %list, align 4
  store %struct.undo_list* null, %struct.undo_list** %new, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end4, %if.end
  %3 = load %struct.undo_list*, %struct.undo_list** %list, align 4
  %tobool = icmp ne %struct.undo_list* %3, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load %struct.undo_list*, %struct.undo_list** %list, align 4
  %call = call %struct.undo_list* @_rl_copy_undo_entry(%struct.undo_list* %4)
  store %struct.undo_list* %call, %struct.undo_list** %c, align 4
  %5 = load %struct.undo_list*, %struct.undo_list** %new, align 4
  %cmp1 = icmp eq %struct.undo_list* %5, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %while.body
  %6 = load %struct.undo_list*, %struct.undo_list** %c, align 4
  store %struct.undo_list* %6, %struct.undo_list** %new, align 4
  store %struct.undo_list* %6, %struct.undo_list** %roving, align 4
  br label %if.end4

if.else:                                          ; preds = %while.body
  %7 = load %struct.undo_list*, %struct.undo_list** %c, align 4
  %8 = load %struct.undo_list*, %struct.undo_list** %roving, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %8, i32 0, i32 0
  store %struct.undo_list* %7, %struct.undo_list** %next, align 4
  %9 = load %struct.undo_list*, %struct.undo_list** %roving, align 4
  %next3 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %9, i32 0, i32 0
  %10 = load %struct.undo_list*, %struct.undo_list** %next3, align 4
  store %struct.undo_list* %10, %struct.undo_list** %roving, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  %11 = load %struct.undo_list*, %struct.undo_list** %list, align 4
  %next5 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %11, i32 0, i32 0
  %12 = load %struct.undo_list*, %struct.undo_list** %next5, align 4
  store %struct.undo_list* %12, %struct.undo_list** %list, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load %struct.undo_list*, %struct.undo_list** %roving, align 4
  %next6 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %13, i32 0, i32 0
  store %struct.undo_list* null, %struct.undo_list** %next6, align 4
  %14 = load %struct.undo_list*, %struct.undo_list** %new, align 4
  store %struct.undo_list* %14, %struct.undo_list** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %15 = load %struct.undo_list*, %struct.undo_list** %retval, align 4
  ret %struct.undo_list* %15
}

; Function Attrs: noinline nounwind
define i32 @rl_do_undo() #0 {
entry:
  %retval = alloca i32, align 4
  %release = alloca %struct.undo_list*, align 4
  %waiting_for_begin = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %cur = alloca %struct._hist_entry*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  store i32 0, i32* %waiting_for_begin, align 4
  store i32 0, i32* %end, align 4
  store i32 0, i32* %start, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %cmp = icmp eq %struct.undo_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %do.body
  store i32 1, i32* @_rl_doing_an_undo, align 4
  %1 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %1, 65536
  store i32 %or, i32* @rl_readline_state, align 4
  %2 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 4
  %3 = load i32, i32* %what, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %4 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %what2 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %4, i32 0, i32 4
  %5 = load i32, i32* %what2, align 4
  %cmp3 = icmp eq i32 %5, 1
  br i1 %cmp3, label %if.then4, label %if.end27

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  %6 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %start5 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %6, i32 0, i32 1
  %7 = load i32, i32* %start5, align 4
  %cmp6 = icmp eq i32 %7, -1
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then4
  %8 = load i32, i32* @rl_point, align 4
  br label %cond.end12

cond.false:                                       ; preds = %if.then4
  %9 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %start7 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %9, i32 0, i32 1
  %10 = load i32, i32* %start7, align 4
  %cmp8 = icmp eq i32 %10, -2
  br i1 %cmp8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %cond.false
  %11 = load i32, i32* @rl_end, align 4
  br label %cond.end

cond.false10:                                     ; preds = %cond.false
  %12 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %start11 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %12, i32 0, i32 1
  %13 = load i32, i32* %start11, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false10, %cond.true9
  %cond = phi i32 [ %11, %cond.true9 ], [ %13, %cond.false10 ]
  br label %cond.end12

cond.end12:                                       ; preds = %cond.end, %cond.true
  %cond13 = phi i32 [ %8, %cond.true ], [ %cond, %cond.end ]
  store i32 %cond13, i32* %start, align 4
  %14 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end14 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %14, i32 0, i32 2
  %15 = load i32, i32* %end14, align 4
  %cmp15 = icmp eq i32 %15, -1
  br i1 %cmp15, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %cond.end12
  %16 = load i32, i32* @rl_point, align 4
  br label %cond.end25

cond.false17:                                     ; preds = %cond.end12
  %17 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end18 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %17, i32 0, i32 2
  %18 = load i32, i32* %end18, align 4
  %cmp19 = icmp eq i32 %18, -2
  br i1 %cmp19, label %cond.true20, label %cond.false21

cond.true20:                                      ; preds = %cond.false17
  %19 = load i32, i32* @rl_end, align 4
  br label %cond.end23

cond.false21:                                     ; preds = %cond.false17
  %20 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %end22 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %20, i32 0, i32 2
  %21 = load i32, i32* %end22, align 4
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false21, %cond.true20
  %cond24 = phi i32 [ %19, %cond.true20 ], [ %21, %cond.false21 ]
  br label %cond.end25

cond.end25:                                       ; preds = %cond.end23, %cond.true16
  %cond26 = phi i32 [ %16, %cond.true16 ], [ %cond24, %cond.end23 ]
  store i32 %cond26, i32* %end, align 4
  br label %if.end27

if.end27:                                         ; preds = %cond.end25, %lor.lhs.false
  %22 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %what28 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %22, i32 0, i32 4
  %23 = load i32, i32* %what28, align 4
  switch i32 %23, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb30
    i32 3, label %sw.bb32
    i32 2, label %sw.bb33
  ]

sw.bb:                                            ; preds = %if.end27
  %24 = load i32, i32* %start, align 4
  store i32 %24, i32* @rl_point, align 4
  %25 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %text = getelementptr inbounds %struct.undo_list, %struct.undo_list* %25, i32 0, i32 3
  %26 = load i8*, i8** %text, align 4
  %call = call i32 @rl_insert_text(i8* %26)
  %27 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %text29 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %27, i32 0, i32 3
  %28 = load i8*, i8** %text29, align 4
  call void @xfree(i8* %28)
  br label %sw.epilog

sw.bb30:                                          ; preds = %if.end27
  %29 = load i32, i32* %start, align 4
  %30 = load i32, i32* %end, align 4
  %call31 = call i32 @rl_delete_text(i32 %29, i32 %30)
  %31 = load i32, i32* %start, align 4
  store i32 %31, i32* @rl_point, align 4
  br label %sw.epilog

sw.bb32:                                          ; preds = %if.end27
  %32 = load i32, i32* %waiting_for_begin, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %waiting_for_begin, align 4
  br label %sw.epilog

sw.bb33:                                          ; preds = %if.end27
  %33 = load i32, i32* %waiting_for_begin, align 4
  %tobool = icmp ne i32 %33, 0
  br i1 %tobool, label %if.then34, label %if.else

if.then34:                                        ; preds = %sw.bb33
  %34 = load i32, i32* %waiting_for_begin, align 4
  %dec = add nsw i32 %34, -1
  store i32 %dec, i32* %waiting_for_begin, align 4
  br label %if.end36

if.else:                                          ; preds = %sw.bb33
  %call35 = call i32 @rl_ding()
  br label %if.end36

if.end36:                                         ; preds = %if.else, %if.then34
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end27, %if.end36, %sw.bb32, %sw.bb30, %sw.bb
  store i32 0, i32* @_rl_doing_an_undo, align 4
  %35 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %35, -65537
  store i32 %and, i32* @rl_readline_state, align 4
  %36 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %36, %struct.undo_list** %release, align 4
  %37 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %37, i32 0, i32 0
  %38 = load %struct.undo_list*, %struct.undo_list** %next, align 4
  store %struct.undo_list* %38, %struct.undo_list** @rl_undo_list, align 4
  %call37 = call %struct._hist_entry* @current_history()
  store %struct._hist_entry* %call37, %struct._hist_entry** %cur, align 4
  %39 = load %struct._hist_entry*, %struct._hist_entry** %cur, align 4
  %tobool38 = icmp ne %struct._hist_entry* %39, null
  br i1 %tobool38, label %land.lhs.true, label %if.end50

land.lhs.true:                                    ; preds = %sw.epilog
  %40 = load %struct._hist_entry*, %struct._hist_entry** %cur, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %40, i32 0, i32 2
  %41 = load i8*, i8** %data, align 4
  %tobool39 = icmp ne i8* %41, null
  br i1 %tobool39, label %land.lhs.true40, label %if.end50

land.lhs.true40:                                  ; preds = %land.lhs.true
  %42 = load %struct._hist_entry*, %struct._hist_entry** %cur, align 4
  %data41 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %42, i32 0, i32 2
  %43 = load i8*, i8** %data41, align 4
  %44 = bitcast i8* %43 to %struct.undo_list*
  %45 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %cmp42 = icmp eq %struct.undo_list* %44, %45
  br i1 %cmp42, label %if.then43, label %if.end50

if.then43:                                        ; preds = %land.lhs.true40
  %call44 = call i32 @where_history()
  %46 = load i8*, i8** @rl_line_buffer, align 4
  %47 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %48 = bitcast %struct.undo_list* %47 to i8*
  %call45 = call %struct._hist_entry* @replace_history_entry(i32 %call44, i8* %46, i8* %48)
  store %struct._hist_entry* %call45, %struct._hist_entry** %temp, align 4
  %49 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %49, i32 0, i32 0
  %50 = load i8*, i8** %line, align 4
  call void @xfree(i8* %50)
  %51 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %51, i32 0, i32 1
  %52 = load i8*, i8** %timestamp, align 4
  %tobool46 = icmp ne i8* %52, null
  br i1 %tobool46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %if.then43
  %53 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp48 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %53, i32 0, i32 1
  %54 = load i8*, i8** %timestamp48, align 4
  call void @free(i8* %54)
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %if.then43
  %55 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %56 = bitcast %struct._hist_entry* %55 to i8*
  call void @xfree(i8* %56)
  br label %if.end50

if.end50:                                         ; preds = %if.end49, %land.lhs.true40, %land.lhs.true, %sw.epilog
  %57 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %58 = bitcast %struct.undo_list* %57 to i8**
  %59 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %60 = bitcast %struct.undo_list* %59 to i8**
  call void @_hs_replace_history_data(i32 -1, i8** %58, i8** %60)
  %61 = load %struct.undo_list*, %struct.undo_list** %release, align 4
  %62 = bitcast %struct.undo_list* %61 to i8*
  call void @xfree(i8* %62)
  br label %do.cond

do.cond:                                          ; preds = %if.end50
  %63 = load i32, i32* %waiting_for_begin, align 4
  %tobool51 = icmp ne i32 %63, 0
  br i1 %tobool51, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %if.then
  %64 = load i32, i32* %retval, align 4
  ret i32 %64
}

declare i32 @rl_insert_text(i8*) #1

declare i32 @rl_delete_text(i32, i32) #1

declare i32 @rl_ding() #1

declare %struct._hist_entry* @current_history() #1

declare %struct._hist_entry* @replace_history_entry(i32, i8*, i8*) #1

declare i32 @where_history() #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define i32 @_rl_fix_last_undo_of_type(i32 %type, i32 %start, i32 %end) #0 {
entry:
  %retval = alloca i32, align 4
  %type.addr = alloca i32, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %rl = alloca %struct.undo_list*, align 4
  store i32 %type, i32* %type.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  store %struct.undo_list* %0, %struct.undo_list** %rl, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.undo_list*, %struct.undo_list** %rl, align 4
  %tobool = icmp ne %struct.undo_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.undo_list*, %struct.undo_list** %rl, align 4
  %what = getelementptr inbounds %struct.undo_list, %struct.undo_list* %2, i32 0, i32 4
  %3 = load i32, i32* %what, align 4
  %4 = load i32, i32* %type.addr, align 4
  %cmp = icmp eq i32 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %start.addr, align 4
  %6 = load %struct.undo_list*, %struct.undo_list** %rl, align 4
  %start1 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %6, i32 0, i32 1
  store i32 %5, i32* %start1, align 4
  %7 = load i32, i32* %end.addr, align 4
  %8 = load %struct.undo_list*, %struct.undo_list** %rl, align 4
  %end2 = getelementptr inbounds %struct.undo_list, %struct.undo_list* %8, i32 0, i32 2
  store i32 %7, i32* %end2, align 4
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load %struct.undo_list*, %struct.undo_list** %rl, align 4
  %next = getelementptr inbounds %struct.undo_list, %struct.undo_list* %9, i32 0, i32 0
  %10 = load %struct.undo_list*, %struct.undo_list** %next, align 4
  store %struct.undo_list* %10, %struct.undo_list** %rl, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @rl_begin_undo_group() #0 {
entry:
  call void @rl_add_undo(i32 2, i32 0, i32 0, i8* null)
  %0 = load i32, i32* @_rl_undo_group_level, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @_rl_undo_group_level, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_end_undo_group() #0 {
entry:
  call void @rl_add_undo(i32 3, i32 0, i32 0, i8* null)
  %0 = load i32, i32* @_rl_undo_group_level, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* @_rl_undo_group_level, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_modifying(i32 %start, i32 %end) #0 {
entry:
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %t = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  %0 = load i32, i32* %start.addr, align 4
  %1 = load i32, i32* %end.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %2 = load i32, i32* %start.addr, align 4
  store i32 %2, i32* %t, align 4
  %3 = load i32, i32* %end.addr, align 4
  store i32 %3, i32* %start.addr, align 4
  %4 = load i32, i32* %t, align 4
  store i32 %4, i32* %end.addr, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end

if.end:                                           ; preds = %do.end, %entry
  %5 = load i32, i32* %start.addr, align 4
  %6 = load i32, i32* %end.addr, align 4
  %cmp1 = icmp ne i32 %5, %6
  br i1 %cmp1, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %7 = load i32, i32* %start.addr, align 4
  %8 = load i32, i32* %end.addr, align 4
  %call = call i8* @rl_copy_text(i32 %7, i32 %8)
  store i8* %call, i8** %temp, align 4
  %call3 = call i32 @rl_begin_undo_group()
  %9 = load i32, i32* %start.addr, align 4
  %10 = load i32, i32* %end.addr, align 4
  %11 = load i8*, i8** %temp, align 4
  call void @rl_add_undo(i32 0, i32 %9, i32 %10, i8* %11)
  %12 = load i32, i32* %start.addr, align 4
  %13 = load i32, i32* %end.addr, align 4
  call void @rl_add_undo(i32 1, i32 %12, i32 %13, i8* null)
  %call4 = call i32 @rl_end_undo_group()
  br label %if.end5

if.end5:                                          ; preds = %if.then2, %if.end
  ret i32 0
}

declare i8* @rl_copy_text(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @rl_revert_line(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %cmp = icmp eq %struct.undo_list* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @rl_ding()
  br label %if.end4

if.else:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %1 = load %struct.undo_list*, %struct.undo_list** @rl_undo_list, align 4
  %tobool = icmp ne %struct.undo_list* %1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @rl_do_undo()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load i32, i32* @rl_editing_mode, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %while.end
  store i32 0, i32* @rl_mark, align 4
  store i32 0, i32* @rl_point, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %while.end
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_undo_command(i32 %count, i32 %key) #0 {
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
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end4, %if.end
  %1 = load i32, i32* %count.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @rl_do_undo()
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %while.body
  %2 = load i32, i32* %count.addr, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* %count.addr, align 4
  br label %if.end4

if.else:                                          ; preds = %while.body
  %call3 = call i32 @rl_ding()
  br label %while.end

if.end4:                                          ; preds = %if.then2
  br label %while.cond

while.end:                                        ; preds = %if.else, %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
