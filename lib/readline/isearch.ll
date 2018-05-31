; ModuleID = 'isearch.c'
source_filename = "isearch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__rl_search_context = type { i32, i32, i8*, i32, i32, i8**, i8*, i32, i32, i32, i32, i32, i32, i8*, %struct.undo_list*, %struct._keymap_entry*, %struct._keymap_entry*, i32, i32, i32, i32, [16 x i8], [16 x i8], i8*, i32, i32, i8* }
%struct.undo_list = type { %struct.undo_list*, i32, i32, i8*, i32 }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct._hist_entry = type { i8*, i8*, i8* }

@_rl_isearch_terminators = global i8* null, align 4
@_rl_iscxt = global %struct.__rl_search_context* null, align 4
@rl_point = external global i32, align 4
@rl_mark = external global i32, align 4
@_rl_keymap = external global %struct._keymap_entry*, align 4
@rl_readline_state = external global i32, align 4
@rl_byte_oriented = external global i32, align 4
@_rl_caught_signal = external global i32, align 4
@_rl_keyseq_timeout = external global i32, align 4
@last_isearch_string = internal global i8* null, align 4
@last_isearch_string_len = internal global i32 0, align 4
@rl_end = external global i32, align 4
@rl_line_buffer = external global i8*, align 4
@.str = private unnamed_addr constant [8 x i8] c"failed \00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"reverse-\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"i-search)`\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"': \00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@rl_redisplay_function = external global void ()*, align 4
@.str.5 = private unnamed_addr constant [3 x i8] c"\1B\0A\00", align 1
@_rl_saved_line_for_history = external global %struct._hist_entry*, align 4

; Function Attrs: noinline nounwind
define %struct.__rl_search_context* @_rl_scxt_alloc(i32 %type, i32 %flags) #0 {
entry:
  %type.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %cxt = alloca %struct.__rl_search_context*, align 4
  store i32 %type, i32* %type.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i8* @xmalloc(i32 132)
  %0 = bitcast i8* %call to %struct.__rl_search_context*
  store %struct.__rl_search_context* %0, %struct.__rl_search_context** %cxt, align 4
  %1 = load i32, i32* %type.addr, align 4
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %type1 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %2, i32 0, i32 0
  store i32 %1, i32* %type1, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sflags = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %4, i32 0, i32 1
  store i32 %3, i32* %sflags, align 4
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %5, i32 0, i32 2
  store i8* null, i8** %search_string, align 4
  %6 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %6, i32 0, i32 3
  store i32 0, i32* %search_string_index, align 4
  %7 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string_size = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %7, i32 0, i32 4
  store i32 0, i32* %search_string_size, align 4
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lines = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %8, i32 0, i32 5
  store i8** null, i8*** %lines, align 4
  %9 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %allocated_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %9, i32 0, i32 6
  store i8* null, i8** %allocated_line, align 4
  %10 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %hindex = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %10, i32 0, i32 8
  store i32 0, i32* %hindex, align 4
  %11 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %hlen = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %11, i32 0, i32 7
  store i32 0, i32* %hlen, align 4
  %12 = load i32, i32* @rl_point, align 4
  %13 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_point = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %13, i32 0, i32 9
  store i32 %12, i32* %save_point, align 4
  %14 = load i32, i32* @rl_mark, align 4
  %15 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_mark = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %15, i32 0, i32 10
  store i32 %14, i32* %save_mark, align 4
  %call2 = call i32 @where_history()
  %16 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %16, i32 0, i32 11
  store i32 %call2, i32* %save_line, align 4
  %17 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_line3 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %17, i32 0, i32 11
  %18 = load i32, i32* %save_line3, align 4
  %19 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %last_found_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %19, i32 0, i32 12
  store i32 %18, i32* %last_found_line, align 4
  %20 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %prev_line_found = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %20, i32 0, i32 13
  store i8* null, i8** %prev_line_found, align 4
  %21 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_undo_list = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %21, i32 0, i32 14
  store %struct.undo_list* null, %struct.undo_list** %save_undo_list, align 4
  %22 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %23 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %keymap = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %23, i32 0, i32 15
  store %struct._keymap_entry* %22, %struct._keymap_entry** %keymap, align 4
  %24 = load %struct._keymap_entry*, %struct._keymap_entry** @_rl_keymap, align 4
  %25 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %okeymap = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %25, i32 0, i32 16
  store %struct._keymap_entry* %24, %struct._keymap_entry** %okeymap, align 4
  %26 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %history_pos = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %26, i32 0, i32 17
  store i32 0, i32* %history_pos, align 4
  %27 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %direction = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %27, i32 0, i32 18
  store i32 0, i32* %direction, align 4
  %28 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lastc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %28, i32 0, i32 20
  store i32 0, i32* %lastc, align 4
  %29 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %prevc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %29, i32 0, i32 19
  store i32 0, i32* %prevc, align 4
  %30 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %30, i32 0, i32 23
  store i8* null, i8** %sline, align 4
  %31 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %31, i32 0, i32 25
  store i32 0, i32* %sline_index, align 4
  %32 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline_len = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %32, i32 0, i32 24
  store i32 0, i32* %sline_len, align 4
  %33 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_terminators = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %33, i32 0, i32 26
  store i8* null, i8** %search_terminators, align 4
  %34 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  ret %struct.__rl_search_context* %34
}

declare i8* @xmalloc(i32) #1

declare i32 @where_history() #1

; Function Attrs: noinline nounwind
define void @_rl_scxt_dispose(%struct.__rl_search_context* %cxt, i32 %flags) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %flags.addr = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %0, i32 0, i32 2
  %1 = load i8*, i8** %search_string, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string1 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %2, i32 0, i32 2
  %3 = load i8*, i8** %search_string1, align 4
  call void @free(i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %allocated_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %4, i32 0, i32 6
  %5 = load i8*, i8** %allocated_line, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %6 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %allocated_line4 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %6, i32 0, i32 6
  %7 = load i8*, i8** %allocated_line4, align 4
  call void @free(i8* %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %8, i32 0, i32 5
  %9 = load i8**, i8*** %lines, align 4
  %tobool6 = icmp ne i8** %9, null
  br i1 %tobool6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end5
  %10 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines8 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %10, i32 0, i32 5
  %11 = load i8**, i8*** %lines8, align 4
  %12 = bitcast i8** %11 to i8*
  call void @free(i8* %12)
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end5
  %13 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %14 = bitcast %struct.__rl_search_context* %13 to i8*
  call void @xfree(i8* %14)
  ret void
}

declare void @free(i8*) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define i32 @rl_reverse_search_history(i32 %sign, i32 %key) #0 {
entry:
  %sign.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %sign, i32* %sign.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %sign.addr, align 4
  %sub = sub nsw i32 0, %0
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_search_history(i32 %sub, i32 %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @rl_search_history(i32 %direction, i32 %invoking_key) #0 {
entry:
  %retval = alloca i32, align 4
  %direction.addr = alloca i32, align 4
  %invoking_key.addr = alloca i32, align 4
  %cxt = alloca %struct.__rl_search_context*, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %direction, i32* %direction.addr, align 4
  store i32 %invoking_key, i32* %invoking_key.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 128
  store i32 %or, i32* @rl_readline_state, align 4
  %1 = load i32, i32* %direction.addr, align 4
  %call = call %struct.__rl_search_context* @_rl_isearch_init(i32 %1)
  store %struct.__rl_search_context* %call, %struct.__rl_search_context** %cxt, align 4
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %2, i32 0, i32 2
  %3 = load i8*, i8** %search_string, align 4
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sflags = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %4, i32 0, i32 1
  %5 = load i32, i32* %sflags, align 4
  call void @rl_display_search(i8* %3, i32 %5, i32 -1)
  %6 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %6, 524288
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 -1, i32* %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end4, %if.end
  %7 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %call1 = call i32 @_rl_search_getchar(%struct.__rl_search_context* %7)
  store i32 %call1, i32* %c, align 4
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %9 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lastc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %9, i32 0, i32 20
  %10 = load i32, i32* %lastc, align 4
  %call2 = call i32 @_rl_isearch_dispatch(%struct.__rl_search_context* %8, i32 %10)
  store i32 %call2, i32* %r, align 4
  %11 = load i32, i32* %r, align 4
  %cmp = icmp sle i32 %11, 0
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.cond
  br label %for.end

if.end4:                                          ; preds = %for.cond
  br label %for.cond

for.end:                                          ; preds = %if.then3
  %12 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %13 = load i32, i32* %r, align 4
  %call5 = call i32 @_rl_isearch_cleanup(%struct.__rl_search_context* %12, i32 %13)
  store i32 %call5, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind
define i32 @rl_forward_search_history(i32 %sign, i32 %key) #0 {
entry:
  %sign.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %sign, i32* %sign.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* %sign.addr, align 4
  %1 = load i32, i32* %key.addr, align 4
  %call = call i32 @rl_search_history(i32 %0, i32 %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @_rl_search_getchar(%struct.__rl_search_context* %cxt) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %c = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %0 = load i32, i32* @rl_readline_state, align 4
  %or = or i32 %0, 64
  store i32 %or, i32* @rl_readline_state, align 4
  %call = call i32 @rl_read_key()
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %1, i32 0, i32 20
  store i32 %call, i32* %lastc, align 4
  store i32 %call, i32* %c, align 4
  %2 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %2, -65
  store i32 %and, i32* @rl_readline_state, align 4
  %call1 = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call1, 1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* @rl_byte_oriented, align 4
  %cmp2 = icmp eq i32 %3, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc3 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %4, i32 0, i32 20
  %5 = load i32, i32* %lastc3, align 4
  %6 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %6, i32 0, i32 21
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 0
  %call4 = call i32 @_rl_read_mbstring(i32 %5, i8* %arraydecay, i32 16)
  %7 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc5 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %7, i32 0, i32 20
  store i32 %call4, i32* %lastc5, align 4
  store i32 %call4, i32* %c, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %8 = load volatile i32, i32* @_rl_caught_signal, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then6, label %if.end7

if.then6:                                         ; preds = %do.body
  %9 = load volatile i32, i32* @_rl_caught_signal, align 4
  call void @_rl_signal_handler(i32 %9)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end7
  %10 = load i32, i32* %c, align 4
  ret i32 %10
}

declare i32 @rl_read_key() #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @_rl_read_mbstring(i32, i8*, i32) #1

declare void @_rl_signal_handler(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_isearch_dispatch(%struct.__rl_search_context* %cxt, i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %c.addr = alloca i32, align 4
  %n = alloca i32, align 4
  %wstart = alloca i32, align 4
  %wlen = alloca i32, align 4
  %limit = alloca i32, align 4
  %cval = alloca i32, align 4
  %f = alloca i32 (i32, i32)*, align 4
  %j = alloca i32, align 4
  %l = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 (i32, i32)* null, i32 (i32, i32)** %f, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %1, i32 0, i32 1
  %2 = load i32, i32* %sflags, align 4
  %or = or i32 %2, 4
  store i32 %or, i32* %sflags, align 4
  %3 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %3, i32 0, i32 12
  %4 = load i32, i32* %last_found_line, align 4
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %5, i32 0, i32 17
  store i32 %4, i32* %history_pos, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp sge i32 %6, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end60

land.lhs.true:                                    ; preds = %if.end
  %7 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %7, i32 0, i32 15
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap, align 4
  %9 = load i32, i32* %c.addr, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %9
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %10 = load i8, i8* %type, align 4
  %conv = sext i8 %10 to i32
  %cmp2 = icmp eq i32 %conv, 1
  br i1 %cmp2, label %land.lhs.true4, label %if.end60

land.lhs.true4:                                   ; preds = %land.lhs.true
  %11 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_terminators = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %11, i32 0, i32 26
  %12 = load i8*, i8** %search_terminators, align 4
  %13 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %13, i32 0, i32 20
  %14 = load i32, i32* %lastc, align 4
  %call = call i8* @strchr(i8* %12, i32 %14)
  %cmp5 = icmp eq i8* %call, null
  br i1 %cmp5, label %if.then7, label %if.end60

if.then7:                                         ; preds = %land.lhs.true4
  %15 = load i32, i32* @_rl_keyseq_timeout, align 4
  %cmp8 = icmp sgt i32 %15, 0
  br i1 %cmp8, label %land.lhs.true10, label %if.end31

land.lhs.true10:                                  ; preds = %if.then7
  %16 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %16, 524288
  %cmp11 = icmp eq i32 %and, 0
  br i1 %cmp11, label %land.lhs.true13, label %if.end31

land.lhs.true13:                                  ; preds = %land.lhs.true10
  %17 = load i32, i32* @rl_readline_state, align 4
  %and14 = and i32 %17, 131072
  %cmp15 = icmp eq i32 %and14, 0
  br i1 %cmp15, label %land.lhs.true17, label %if.end31

land.lhs.true17:                                  ; preds = %land.lhs.true13
  %call18 = call i32 @_rl_pushed_input_available()
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %land.lhs.true21, label %if.end31

land.lhs.true21:                                  ; preds = %land.lhs.true17
  %18 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap22 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %18, i32 0, i32 15
  %19 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap22, align 4
  %20 = load i32, i32* %c.addr, align 4
  %arrayidx23 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %19, i32 %20
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx23, i32 0, i32 1
  %21 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  %22 = bitcast i32 (i32, i32)* %21 to %struct._keymap_entry*
  %arrayidx24 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %22, i32 256
  %function25 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx24, i32 0, i32 1
  %23 = load i32 (i32, i32)*, i32 (i32, i32)** %function25, align 4
  %tobool = icmp ne i32 (i32, i32)* %23, null
  br i1 %tobool, label %land.lhs.true26, label %if.end31

land.lhs.true26:                                  ; preds = %land.lhs.true21
  %24 = load i32, i32* @_rl_keyseq_timeout, align 4
  %mul = mul nsw i32 %24, 1000
  %call27 = call i32 @_rl_input_queued(i32 %mul)
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %land.lhs.true26
  br label %add_character

if.end31:                                         ; preds = %land.lhs.true26, %land.lhs.true21, %land.lhs.true17, %land.lhs.true13, %land.lhs.true10, %if.then7
  %25 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap32 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %25, i32 0, i32 15
  %26 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap32, align 4
  %27 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %okeymap = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %27, i32 0, i32 16
  store %struct._keymap_entry* %26, %struct._keymap_entry** %okeymap, align 4
  %28 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap33 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %28, i32 0, i32 15
  %29 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap33, align 4
  %30 = load i32, i32* %c.addr, align 4
  %arrayidx34 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %29, i32 %30
  %function35 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx34, i32 0, i32 1
  %31 = load i32 (i32, i32)*, i32 (i32, i32)** %function35, align 4
  %32 = bitcast i32 (i32, i32)* %31 to %struct._keymap_entry*
  %33 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap36 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %33, i32 0, i32 15
  store %struct._keymap_entry* %32, %struct._keymap_entry** %keymap36, align 4
  %34 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags37 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %34, i32 0, i32 1
  %35 = load i32, i32* %sflags37, align 4
  %or38 = or i32 %35, 8
  store i32 %or38, i32* %sflags37, align 4
  %36 = load i32, i32* %c.addr, align 4
  %37 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %37, i32 0, i32 19
  store i32 %36, i32* %prevc, align 4
  %call39 = call i32 @__ctype_get_mb_cur_max()
  %cmp40 = icmp ugt i32 %call39, 1
  br i1 %cmp40, label %land.lhs.true42, label %if.end59

land.lhs.true42:                                  ; preds = %if.end31
  %38 = load i32, i32* @rl_byte_oriented, align 4
  %cmp43 = icmp eq i32 %38, 0
  br i1 %cmp43, label %if.then45, label %if.end59

if.then45:                                        ; preds = %land.lhs.true42
  %39 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %39, i32 0, i32 21
  %arrayidx46 = getelementptr inbounds [16 x i8], [16 x i8]* %mb, i32 0, i32 1
  %40 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %40 to i32
  %cmp48 = icmp eq i32 %conv47, 0
  br i1 %cmp48, label %if.then50, label %if.else

if.then50:                                        ; preds = %if.then45
  %41 = load i32, i32* %c.addr, align 4
  %conv51 = trunc i32 %41 to i8
  %42 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %pmb = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %42, i32 0, i32 22
  %arrayidx52 = getelementptr inbounds [16 x i8], [16 x i8]* %pmb, i32 0, i32 0
  store i8 %conv51, i8* %arrayidx52, align 4
  %43 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %pmb53 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %43, i32 0, i32 22
  %arrayidx54 = getelementptr inbounds [16 x i8], [16 x i8]* %pmb53, i32 0, i32 1
  store i8 0, i8* %arrayidx54, align 1
  br label %if.end58

if.else:                                          ; preds = %if.then45
  %44 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %pmb55 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %44, i32 0, i32 22
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %pmb55, i32 0, i32 0
  %45 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb56 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %45, i32 0, i32 21
  %arraydecay57 = getelementptr inbounds [16 x i8], [16 x i8]* %mb56, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay, i8* %arraydecay57, i32 16, i32 4, i1 false)
  br label %if.end58

if.end58:                                         ; preds = %if.else, %if.then50
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %land.lhs.true42, %if.end31
  store i32 1, i32* %retval, align 4
  br label %return

if.end60:                                         ; preds = %land.lhs.true4, %land.lhs.true, %if.end
  br label %add_character

add_character:                                    ; preds = %if.end60, %if.then30
  %46 = load i32, i32* %c.addr, align 4
  %cmp61 = icmp sge i32 %46, 0
  br i1 %cmp61, label %land.lhs.true63, label %if.end124

land.lhs.true63:                                  ; preds = %add_character
  %47 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap64 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %47, i32 0, i32 15
  %48 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap64, align 4
  %49 = load i32, i32* %c.addr, align 4
  %arrayidx65 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %48, i32 %49
  %type66 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx65, i32 0, i32 0
  %50 = load i8, i8* %type66, align 4
  %conv67 = sext i8 %50 to i32
  %cmp68 = icmp eq i32 %conv67, 0
  br i1 %cmp68, label %if.then70, label %if.end124

if.then70:                                        ; preds = %land.lhs.true63
  %51 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap71 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %51, i32 0, i32 15
  %52 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap71, align 4
  %53 = load i32, i32* %c.addr, align 4
  %arrayidx72 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %52, i32 %53
  %function73 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx72, i32 0, i32 1
  %54 = load i32 (i32, i32)*, i32 (i32, i32)** %function73, align 4
  store i32 (i32, i32)* %54, i32 (i32, i32)** %f, align 4
  %55 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp74 = icmp eq i32 (i32, i32)* %55, @rl_reverse_search_history
  br i1 %cmp74, label %if.then76, label %if.else81

if.then76:                                        ; preds = %if.then70
  %56 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags77 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %56, i32 0, i32 1
  %57 = load i32, i32* %sflags77, align 4
  %and78 = and i32 %57, 1
  %tobool79 = icmp ne i32 %and78, 0
  %cond = select i1 %tobool79, i32 -1, i32 -2
  %58 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc80 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %58, i32 0, i32 20
  store i32 %cond, i32* %lastc80, align 4
  br label %if.end123

if.else81:                                        ; preds = %if.then70
  %59 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp82 = icmp eq i32 (i32, i32)* %59, @rl_forward_search_history
  br i1 %cmp82, label %if.then84, label %if.else90

if.then84:                                        ; preds = %if.else81
  %60 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags85 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %60, i32 0, i32 1
  %61 = load i32, i32* %sflags85, align 4
  %and86 = and i32 %61, 1
  %tobool87 = icmp ne i32 %and86, 0
  %cond88 = select i1 %tobool87, i32 -2, i32 -1
  %62 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc89 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %62, i32 0, i32 20
  store i32 %cond88, i32* %lastc89, align 4
  br label %if.end122

if.else90:                                        ; preds = %if.else81
  %63 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp91 = icmp eq i32 (i32, i32)* %63, @rl_rubout
  br i1 %cmp91, label %if.then93, label %if.else95

if.then93:                                        ; preds = %if.else90
  %64 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc94 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %64, i32 0, i32 20
  store i32 -3, i32* %lastc94, align 4
  br label %if.end121

if.else95:                                        ; preds = %if.else90
  %65 = load i32, i32* %c.addr, align 4
  %cmp96 = icmp eq i32 %65, 7
  br i1 %cmp96, label %if.then100, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else95
  %66 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp98 = icmp eq i32 (i32, i32)* %66, @rl_abort
  br i1 %cmp98, label %if.then100, label %if.else102

if.then100:                                       ; preds = %lor.lhs.false, %if.else95
  %67 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc101 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %67, i32 0, i32 20
  store i32 -4, i32* %lastc101, align 4
  br label %if.end120

if.else102:                                       ; preds = %lor.lhs.false
  %68 = load i32, i32* %c.addr, align 4
  %cmp103 = icmp eq i32 %68, 23
  br i1 %cmp103, label %if.then108, label %lor.lhs.false105

lor.lhs.false105:                                 ; preds = %if.else102
  %69 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp106 = icmp eq i32 (i32, i32)* %69, @rl_unix_word_rubout
  br i1 %cmp106, label %if.then108, label %if.else110

if.then108:                                       ; preds = %lor.lhs.false105, %if.else102
  %70 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc109 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %70, i32 0, i32 20
  store i32 -5, i32* %lastc109, align 4
  br label %if.end119

if.else110:                                       ; preds = %lor.lhs.false105
  %71 = load i32, i32* %c.addr, align 4
  %cmp111 = icmp eq i32 %71, 25
  br i1 %cmp111, label %if.then116, label %lor.lhs.false113

lor.lhs.false113:                                 ; preds = %if.else110
  %72 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp114 = icmp eq i32 (i32, i32)* %72, @rl_yank
  br i1 %cmp114, label %if.then116, label %if.end118

if.then116:                                       ; preds = %lor.lhs.false113, %if.else110
  %73 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc117 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %73, i32 0, i32 20
  store i32 -6, i32* %lastc117, align 4
  br label %if.end118

if.end118:                                        ; preds = %if.then116, %lor.lhs.false113
  br label %if.end119

if.end119:                                        ; preds = %if.end118, %if.then108
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %if.then100
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %if.then93
  br label %if.end122

if.end122:                                        ; preds = %if.end121, %if.then84
  br label %if.end123

if.end123:                                        ; preds = %if.end122, %if.then76
  br label %if.end124

if.end124:                                        ; preds = %if.end123, %land.lhs.true63, %add_character
  %74 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags125 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %74, i32 0, i32 1
  %75 = load i32, i32* %sflags125, align 4
  %and126 = and i32 %75, 8
  %tobool127 = icmp ne i32 %and126, 0
  br i1 %tobool127, label %if.then128, label %if.end241

if.then128:                                       ; preds = %if.end124
  %76 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %okeymap129 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %76, i32 0, i32 16
  %77 = load %struct._keymap_entry*, %struct._keymap_entry** %okeymap129, align 4
  %78 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap130 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %78, i32 0, i32 15
  store %struct._keymap_entry* %77, %struct._keymap_entry** %keymap130, align 4
  %79 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags131 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %79, i32 0, i32 1
  %80 = load i32, i32* %sflags131, align 4
  %and132 = and i32 %80, -9
  store i32 %and132, i32* %sflags131, align 4
  %81 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc133 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %81, i32 0, i32 20
  %82 = load i32, i32* %lastc133, align 4
  %cmp134 = icmp sgt i32 %82, 0
  br i1 %cmp134, label %land.lhs.true136, label %if.else166

land.lhs.true136:                                 ; preds = %if.then128
  %83 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc137 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %83, i32 0, i32 19
  %84 = load i32, i32* %prevc137, align 4
  %cmp138 = icmp slt i32 %84, 32
  br i1 %cmp138, label %land.lhs.true140, label %lor.lhs.false145

land.lhs.true140:                                 ; preds = %land.lhs.true136
  %85 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc141 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %85, i32 0, i32 19
  %86 = load i32, i32* %prevc141, align 4
  %and142 = and i32 %86, 128
  %cmp143 = icmp eq i32 %and142, 0
  br i1 %cmp143, label %land.lhs.true157, label %lor.lhs.false145

lor.lhs.false145:                                 ; preds = %land.lhs.true140, %land.lhs.true136
  %87 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc146 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %87, i32 0, i32 19
  %88 = load i32, i32* %prevc146, align 4
  %cmp147 = icmp sgt i32 %88, 127
  br i1 %cmp147, label %land.lhs.true149, label %lor.lhs.false153

land.lhs.true149:                                 ; preds = %lor.lhs.false145
  %89 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc150 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %89, i32 0, i32 19
  %90 = load i32, i32* %prevc150, align 4
  %cmp151 = icmp sle i32 %90, 255
  br i1 %cmp151, label %land.lhs.true157, label %lor.lhs.false153

lor.lhs.false153:                                 ; preds = %land.lhs.true149, %lor.lhs.false145
  %91 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc154 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %91, i32 0, i32 19
  %92 = load i32, i32* %prevc154, align 4
  %cmp155 = icmp eq i32 %92, 127
  br i1 %cmp155, label %land.lhs.true157, label %if.else166

land.lhs.true157:                                 ; preds = %lor.lhs.false153, %land.lhs.true149, %land.lhs.true140
  %93 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc158 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %93, i32 0, i32 19
  %94 = load i32, i32* %prevc158, align 4
  %cmp159 = icmp ne i32 %94, 7
  br i1 %cmp159, label %if.then161, label %if.else166

if.then161:                                       ; preds = %land.lhs.true157
  %95 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc162 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %95, i32 0, i32 20
  %96 = load i32, i32* %lastc162, align 4
  %call163 = call i32 @rl_stuff_char(i32 %96)
  %97 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc164 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %97, i32 0, i32 19
  %98 = load i32, i32* %prevc164, align 4
  %call165 = call i32 @rl_execute_next(i32 %98)
  store i32 0, i32* %retval, align 4
  br label %return

if.else166:                                       ; preds = %land.lhs.true157, %lor.lhs.false153, %if.then128
  %99 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc167 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %99, i32 0, i32 20
  %100 = load i32, i32* %lastc167, align 4
  %cmp168 = icmp sgt i32 %100, 0
  br i1 %cmp168, label %land.lhs.true170, label %if.else220

land.lhs.true170:                                 ; preds = %if.else166
  %101 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc171 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %101, i32 0, i32 19
  %102 = load i32, i32* %prevc171, align 4
  %cmp172 = icmp sgt i32 %102, 0
  br i1 %cmp172, label %land.lhs.true174, label %if.else220

land.lhs.true174:                                 ; preds = %land.lhs.true170
  %103 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %keymap175 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %103, i32 0, i32 15
  %104 = load %struct._keymap_entry*, %struct._keymap_entry** %keymap175, align 4
  %105 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc176 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %105, i32 0, i32 19
  %106 = load i32, i32* %prevc176, align 4
  %arrayidx177 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %104, i32 %106
  %type178 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx177, i32 0, i32 0
  %107 = load i8, i8* %type178, align 4
  %conv179 = sext i8 %107 to i32
  %cmp180 = icmp eq i32 %conv179, 1
  br i1 %cmp180, label %land.lhs.true182, label %if.else220

land.lhs.true182:                                 ; preds = %land.lhs.true174
  %108 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp183 = icmp eq i32 (i32, i32)* %108, null
  br i1 %cmp183, label %if.then188, label %lor.lhs.false185

lor.lhs.false185:                                 ; preds = %land.lhs.true182
  %109 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp186 = icmp eq i32 (i32, i32)* %109, @rl_insert
  br i1 %cmp186, label %if.then188, label %if.else220

if.then188:                                       ; preds = %lor.lhs.false185, %land.lhs.true182
  %110 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc189 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %110, i32 0, i32 20
  %111 = load i32, i32* %lastc189, align 4
  %call190 = call i32 @rl_execute_next(i32 %111)
  %112 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc191 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %112, i32 0, i32 19
  %113 = load i32, i32* %prevc191, align 4
  %114 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc192 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %114, i32 0, i32 20
  store i32 %113, i32* %lastc192, align 4
  %call193 = call i32 @__ctype_get_mb_cur_max()
  %cmp194 = icmp ugt i32 %call193, 1
  br i1 %cmp194, label %land.lhs.true196, label %if.end218

land.lhs.true196:                                 ; preds = %if.then188
  %115 = load i32, i32* @rl_byte_oriented, align 4
  %cmp197 = icmp eq i32 %115, 0
  br i1 %cmp197, label %if.then199, label %if.end218

if.then199:                                       ; preds = %land.lhs.true196
  %116 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %pmb200 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %116, i32 0, i32 22
  %arrayidx201 = getelementptr inbounds [16 x i8], [16 x i8]* %pmb200, i32 0, i32 1
  %117 = load i8, i8* %arrayidx201, align 1
  %conv202 = sext i8 %117 to i32
  %cmp203 = icmp eq i32 %conv202, 0
  br i1 %cmp203, label %if.then205, label %if.else212

if.then205:                                       ; preds = %if.then199
  %118 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc206 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %118, i32 0, i32 20
  %119 = load i32, i32* %lastc206, align 4
  %conv207 = trunc i32 %119 to i8
  %120 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb208 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %120, i32 0, i32 21
  %arrayidx209 = getelementptr inbounds [16 x i8], [16 x i8]* %mb208, i32 0, i32 0
  store i8 %conv207, i8* %arrayidx209, align 4
  %121 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb210 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %121, i32 0, i32 21
  %arrayidx211 = getelementptr inbounds [16 x i8], [16 x i8]* %mb210, i32 0, i32 1
  store i8 0, i8* %arrayidx211, align 1
  br label %if.end217

if.else212:                                       ; preds = %if.then199
  %122 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb213 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %122, i32 0, i32 21
  %arraydecay214 = getelementptr inbounds [16 x i8], [16 x i8]* %mb213, i32 0, i32 0
  %123 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %pmb215 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %123, i32 0, i32 22
  %arraydecay216 = getelementptr inbounds [16 x i8], [16 x i8]* %pmb215, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay214, i8* %arraydecay216, i32 16, i32 4, i1 false)
  br label %if.end217

if.end217:                                        ; preds = %if.else212, %if.then205
  br label %if.end218

if.end218:                                        ; preds = %if.end217, %land.lhs.true196, %if.then188
  %124 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc219 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %124, i32 0, i32 19
  store i32 0, i32* %prevc219, align 4
  br label %if.end239

if.else220:                                       ; preds = %lor.lhs.false185, %land.lhs.true174, %land.lhs.true170, %if.else166
  %125 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc221 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %125, i32 0, i32 20
  %126 = load i32, i32* %lastc221, align 4
  %cmp222 = icmp sgt i32 %126, 0
  br i1 %cmp222, label %land.lhs.true224, label %if.end238

land.lhs.true224:                                 ; preds = %if.else220
  %127 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc225 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %127, i32 0, i32 19
  %128 = load i32, i32* %prevc225, align 4
  %cmp226 = icmp sgt i32 %128, 0
  br i1 %cmp226, label %land.lhs.true228, label %if.end238

land.lhs.true228:                                 ; preds = %land.lhs.true224
  %129 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %tobool229 = icmp ne i32 (i32, i32)* %129, null
  br i1 %tobool229, label %land.lhs.true230, label %if.end238

land.lhs.true230:                                 ; preds = %land.lhs.true228
  %130 = load i32 (i32, i32)*, i32 (i32, i32)** %f, align 4
  %cmp231 = icmp ne i32 (i32, i32)* %130, @rl_insert
  br i1 %cmp231, label %if.then233, label %if.end238

if.then233:                                       ; preds = %land.lhs.true230
  %131 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc234 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %131, i32 0, i32 20
  %132 = load i32, i32* %lastc234, align 4
  %call235 = call i32 @rl_stuff_char(i32 %132)
  %133 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prevc236 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %133, i32 0, i32 19
  %134 = load i32, i32* %prevc236, align 4
  %call237 = call i32 @rl_execute_next(i32 %134)
  store i32 0, i32* %retval, align 4
  br label %return

if.end238:                                        ; preds = %land.lhs.true230, %land.lhs.true228, %land.lhs.true224, %if.else220
  br label %if.end239

if.end239:                                        ; preds = %if.end238, %if.end218
  br label %if.end240

if.end240:                                        ; preds = %if.end239
  br label %if.end241

if.end241:                                        ; preds = %if.end240, %if.end124
  %135 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc242 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %135, i32 0, i32 20
  %136 = load i32, i32* %lastc242, align 4
  %cmp243 = icmp sgt i32 %136, 0
  br i1 %cmp243, label %land.lhs.true245, label %if.end263

land.lhs.true245:                                 ; preds = %if.end241
  %137 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_terminators246 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %137, i32 0, i32 26
  %138 = load i8*, i8** %search_terminators246, align 4
  %139 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc247 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %139, i32 0, i32 20
  %140 = load i32, i32* %lastc247, align 4
  %call248 = call i8* @strchr(i8* %138, i32 %140)
  %tobool249 = icmp ne i8* %call248, null
  br i1 %tobool249, label %if.then250, label %if.end263

if.then250:                                       ; preds = %land.lhs.true245
  %141 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc251 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %141, i32 0, i32 20
  %142 = load i32, i32* %lastc251, align 4
  %cmp252 = icmp eq i32 %142, 27
  br i1 %cmp252, label %land.lhs.true254, label %if.end262

land.lhs.true254:                                 ; preds = %if.then250
  %call255 = call i32 @_rl_pushed_input_available()
  %tobool256 = icmp ne i32 %call255, 0
  br i1 %tobool256, label %if.then260, label %lor.lhs.false257

lor.lhs.false257:                                 ; preds = %land.lhs.true254
  %call258 = call i32 @_rl_input_available()
  %tobool259 = icmp ne i32 %call258, 0
  br i1 %tobool259, label %if.then260, label %if.end262

if.then260:                                       ; preds = %lor.lhs.false257, %land.lhs.true254
  %call261 = call i32 @rl_execute_next(i32 27)
  br label %if.end262

if.end262:                                        ; preds = %if.then260, %lor.lhs.false257, %if.then250
  store i32 0, i32* %retval, align 4
  br label %return

if.end263:                                        ; preds = %land.lhs.true245, %if.end241
  %call264 = call i32 @__ctype_get_mb_cur_max()
  %cmp265 = icmp ugt i32 %call264, 1
  br i1 %cmp265, label %land.lhs.true267, label %if.else314

land.lhs.true267:                                 ; preds = %if.end263
  %143 = load i32, i32* @rl_byte_oriented, align 4
  %cmp268 = icmp eq i32 %143, 0
  br i1 %cmp268, label %if.then270, label %if.else314

if.then270:                                       ; preds = %land.lhs.true267
  %144 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc271 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %144, i32 0, i32 20
  %145 = load i32, i32* %lastc271, align 4
  %cmp272 = icmp sge i32 %145, 0
  br i1 %cmp272, label %land.lhs.true274, label %if.end313

land.lhs.true274:                                 ; preds = %if.then270
  %146 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb275 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %146, i32 0, i32 21
  %arrayidx276 = getelementptr inbounds [16 x i8], [16 x i8]* %mb275, i32 0, i32 0
  %147 = load i8, i8* %arrayidx276, align 4
  %conv277 = sext i8 %147 to i32
  %tobool278 = icmp ne i32 %conv277, 0
  br i1 %tobool278, label %land.lhs.true279, label %if.end313

land.lhs.true279:                                 ; preds = %land.lhs.true274
  %148 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb280 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %148, i32 0, i32 21
  %arrayidx281 = getelementptr inbounds [16 x i8], [16 x i8]* %mb280, i32 0, i32 1
  %149 = load i8, i8* %arrayidx281, align 1
  %conv282 = sext i8 %149 to i32
  %cmp283 = icmp eq i32 %conv282, 0
  br i1 %cmp283, label %land.lhs.true285, label %if.end313

land.lhs.true285:                                 ; preds = %land.lhs.true279
  %150 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc286 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %150, i32 0, i32 20
  %151 = load i32, i32* %lastc286, align 4
  %cmp287 = icmp slt i32 %151, 32
  br i1 %cmp287, label %land.lhs.true289, label %lor.lhs.false294

land.lhs.true289:                                 ; preds = %land.lhs.true285
  %152 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc290 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %152, i32 0, i32 20
  %153 = load i32, i32* %lastc290, align 4
  %and291 = and i32 %153, 128
  %cmp292 = icmp eq i32 %and291, 0
  br i1 %cmp292, label %land.lhs.true306, label %lor.lhs.false294

lor.lhs.false294:                                 ; preds = %land.lhs.true289, %land.lhs.true285
  %154 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc295 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %154, i32 0, i32 20
  %155 = load i32, i32* %lastc295, align 4
  %cmp296 = icmp sgt i32 %155, 127
  br i1 %cmp296, label %land.lhs.true298, label %lor.lhs.false302

land.lhs.true298:                                 ; preds = %lor.lhs.false294
  %156 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc299 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %156, i32 0, i32 20
  %157 = load i32, i32* %lastc299, align 4
  %cmp300 = icmp sle i32 %157, 255
  br i1 %cmp300, label %land.lhs.true306, label %lor.lhs.false302

lor.lhs.false302:                                 ; preds = %land.lhs.true298, %lor.lhs.false294
  %158 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc303 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %158, i32 0, i32 20
  %159 = load i32, i32* %lastc303, align 4
  %cmp304 = icmp eq i32 %159, 127
  br i1 %cmp304, label %land.lhs.true306, label %if.end313

land.lhs.true306:                                 ; preds = %lor.lhs.false302, %land.lhs.true298, %land.lhs.true289
  %160 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc307 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %160, i32 0, i32 20
  %161 = load i32, i32* %lastc307, align 4
  %cmp308 = icmp ne i32 %161, 7
  br i1 %cmp308, label %if.then310, label %if.end313

if.then310:                                       ; preds = %land.lhs.true306
  %162 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc311 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %162, i32 0, i32 20
  %163 = load i32, i32* %lastc311, align 4
  %call312 = call i32 @rl_execute_next(i32 %163)
  store i32 0, i32* %retval, align 4
  br label %return

if.end313:                                        ; preds = %land.lhs.true306, %lor.lhs.false302, %land.lhs.true279, %land.lhs.true274, %if.then270
  br label %if.end347

if.else314:                                       ; preds = %land.lhs.true267, %if.end263
  %164 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc315 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %164, i32 0, i32 20
  %165 = load i32, i32* %lastc315, align 4
  %cmp316 = icmp sge i32 %165, 0
  br i1 %cmp316, label %land.lhs.true318, label %if.end346

land.lhs.true318:                                 ; preds = %if.else314
  %166 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc319 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %166, i32 0, i32 20
  %167 = load i32, i32* %lastc319, align 4
  %cmp320 = icmp slt i32 %167, 32
  br i1 %cmp320, label %land.lhs.true322, label %lor.lhs.false327

land.lhs.true322:                                 ; preds = %land.lhs.true318
  %168 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc323 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %168, i32 0, i32 20
  %169 = load i32, i32* %lastc323, align 4
  %and324 = and i32 %169, 128
  %cmp325 = icmp eq i32 %and324, 0
  br i1 %cmp325, label %land.lhs.true339, label %lor.lhs.false327

lor.lhs.false327:                                 ; preds = %land.lhs.true322, %land.lhs.true318
  %170 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc328 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %170, i32 0, i32 20
  %171 = load i32, i32* %lastc328, align 4
  %cmp329 = icmp sgt i32 %171, 127
  br i1 %cmp329, label %land.lhs.true331, label %lor.lhs.false335

land.lhs.true331:                                 ; preds = %lor.lhs.false327
  %172 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc332 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %172, i32 0, i32 20
  %173 = load i32, i32* %lastc332, align 4
  %cmp333 = icmp sle i32 %173, 255
  br i1 %cmp333, label %land.lhs.true339, label %lor.lhs.false335

lor.lhs.false335:                                 ; preds = %land.lhs.true331, %lor.lhs.false327
  %174 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc336 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %174, i32 0, i32 20
  %175 = load i32, i32* %lastc336, align 4
  %cmp337 = icmp eq i32 %175, 127
  br i1 %cmp337, label %land.lhs.true339, label %if.end346

land.lhs.true339:                                 ; preds = %lor.lhs.false335, %land.lhs.true331, %land.lhs.true322
  %176 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc340 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %176, i32 0, i32 20
  %177 = load i32, i32* %lastc340, align 4
  %cmp341 = icmp ne i32 %177, 7
  br i1 %cmp341, label %if.then343, label %if.end346

if.then343:                                       ; preds = %land.lhs.true339
  %178 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc344 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %178, i32 0, i32 20
  %179 = load i32, i32* %lastc344, align 4
  %call345 = call i32 @rl_execute_next(i32 %179)
  store i32 0, i32* %retval, align 4
  br label %return

if.end346:                                        ; preds = %land.lhs.true339, %lor.lhs.false335, %if.else314
  br label %if.end347

if.end347:                                        ; preds = %if.end346, %if.end313
  %180 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc348 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %180, i32 0, i32 20
  %181 = load i32, i32* %lastc348, align 4
  switch i32 %181, label %sw.default [
    i32 -1, label %sw.bb
    i32 -2, label %sw.bb379
    i32 -3, label %sw.bb391
    i32 -4, label %sw.bb431
    i32 -5, label %sw.bb434
    i32 -6, label %sw.bb506
  ]

sw.bb:                                            ; preds = %if.end347
  %182 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %182, i32 0, i32 3
  %183 = load i32, i32* %search_string_index, align 4
  %cmp349 = icmp eq i32 %183, 0
  br i1 %cmp349, label %if.then351, label %if.else363

if.then351:                                       ; preds = %sw.bb
  %184 = load i8*, i8** @last_isearch_string, align 4
  %tobool352 = icmp ne i8* %184, null
  br i1 %tobool352, label %if.then353, label %if.end362

if.then353:                                       ; preds = %if.then351
  %185 = load i32, i32* @last_isearch_string_len, align 4
  %add = add nsw i32 64, %185
  %186 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %186, i32 0, i32 4
  store i32 %add, i32* %search_string_size, align 4
  %187 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %187, i32 0, i32 2
  %188 = load i8*, i8** %search_string, align 4
  %189 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size354 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %189, i32 0, i32 4
  %190 = load i32, i32* %search_string_size354, align 4
  %call355 = call i8* @xrealloc(i8* %188, i32 %190)
  %191 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string356 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %191, i32 0, i32 2
  store i8* %call355, i8** %search_string356, align 4
  %192 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string357 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %192, i32 0, i32 2
  %193 = load i8*, i8** %search_string357, align 4
  %194 = load i8*, i8** @last_isearch_string, align 4
  %call358 = call i8* @strcpy(i8* %193, i8* %194)
  %195 = load i32, i32* @last_isearch_string_len, align 4
  %196 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index359 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %196, i32 0, i32 3
  store i32 %195, i32* %search_string_index359, align 4
  %197 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string360 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %197, i32 0, i32 2
  %198 = load i8*, i8** %search_string360, align 4
  %199 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags361 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %199, i32 0, i32 1
  %200 = load i32, i32* %sflags361, align 4
  call void @rl_display_search(i8* %198, i32 %200, i32 -1)
  br label %sw.epilog

if.end362:                                        ; preds = %if.then351
  store i32 1, i32* %retval, align 4
  br label %return

if.else363:                                       ; preds = %sw.bb
  %201 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags364 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %201, i32 0, i32 1
  %202 = load i32, i32* %sflags364, align 4
  %and365 = and i32 %202, 1
  %tobool366 = icmp ne i32 %and365, 0
  br i1 %tobool366, label %if.then367, label %if.else368

if.then367:                                       ; preds = %if.else363
  %203 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %203, i32 0, i32 25
  %204 = load i32, i32* %sline_index, align 4
  %dec = add nsw i32 %204, -1
  store i32 %dec, i32* %sline_index, align 4
  br label %if.end377

if.else368:                                       ; preds = %if.else363
  %205 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index369 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %205, i32 0, i32 25
  %206 = load i32, i32* %sline_index369, align 4
  %207 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_len = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %207, i32 0, i32 24
  %208 = load i32, i32* %sline_len, align 4
  %cmp370 = icmp ne i32 %206, %208
  br i1 %cmp370, label %if.then372, label %if.else374

if.then372:                                       ; preds = %if.else368
  %209 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index373 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %209, i32 0, i32 25
  %210 = load i32, i32* %sline_index373, align 4
  %inc = add nsw i32 %210, 1
  store i32 %inc, i32* %sline_index373, align 4
  br label %if.end376

if.else374:                                       ; preds = %if.else368
  %call375 = call i32 @rl_ding()
  br label %if.end376

if.end376:                                        ; preds = %if.else374, %if.then372
  br label %if.end377

if.end377:                                        ; preds = %if.end376, %if.then367
  br label %if.end378

if.end378:                                        ; preds = %if.end377
  br label %sw.epilog

sw.bb379:                                         ; preds = %if.end347
  %211 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %211, i32 0, i32 18
  %212 = load i32, i32* %direction, align 4
  %sub = sub nsw i32 0, %212
  %213 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction380 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %213, i32 0, i32 18
  store i32 %sub, i32* %direction380, align 4
  %214 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction381 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %214, i32 0, i32 18
  %215 = load i32, i32* %direction381, align 4
  %cmp382 = icmp slt i32 %215, 0
  br i1 %cmp382, label %if.then384, label %if.else387

if.then384:                                       ; preds = %sw.bb379
  %216 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags385 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %216, i32 0, i32 1
  %217 = load i32, i32* %sflags385, align 4
  %or386 = or i32 %217, 1
  store i32 %or386, i32* %sflags385, align 4
  br label %if.end390

if.else387:                                       ; preds = %sw.bb379
  %218 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags388 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %218, i32 0, i32 1
  %219 = load i32, i32* %sflags388, align 4
  %and389 = and i32 %219, -2
  store i32 %and389, i32* %sflags388, align 4
  br label %if.end390

if.end390:                                        ; preds = %if.else387, %if.then384
  br label %sw.epilog

sw.bb391:                                         ; preds = %if.end347
  %220 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index392 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %220, i32 0, i32 3
  %221 = load i32, i32* %search_string_index392, align 4
  %cmp393 = icmp eq i32 %221, 0
  br i1 %cmp393, label %if.then395, label %if.else397

if.then395:                                       ; preds = %sw.bb391
  %call396 = call i32 @rl_ding()
  br label %if.end424

if.else397:                                       ; preds = %sw.bb391
  %call398 = call i32 @__ctype_get_mb_cur_max()
  %cmp399 = icmp eq i32 %call398, 1
  br i1 %cmp399, label %if.then403, label %lor.lhs.false401

lor.lhs.false401:                                 ; preds = %if.else397
  %222 = load i32, i32* @rl_byte_oriented, align 4
  %tobool402 = icmp ne i32 %222, 0
  br i1 %tobool402, label %if.then403, label %if.else408

if.then403:                                       ; preds = %lor.lhs.false401, %if.else397
  %223 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string404 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %223, i32 0, i32 2
  %224 = load i8*, i8** %search_string404, align 4
  %225 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index405 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %225, i32 0, i32 3
  %226 = load i32, i32* %search_string_index405, align 4
  %dec406 = add nsw i32 %226, -1
  store i32 %dec406, i32* %search_string_index405, align 4
  %arrayidx407 = getelementptr inbounds i8, i8* %224, i32 %dec406
  store i8 0, i8* %arrayidx407, align 1
  br label %if.end423

if.else408:                                       ; preds = %lor.lhs.false401
  %227 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string409 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %227, i32 0, i32 2
  %228 = load i8*, i8** %search_string409, align 4
  %229 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index410 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %229, i32 0, i32 3
  %230 = load i32, i32* %search_string_index410, align 4
  %call411 = call i32 @_rl_find_prev_mbchar(i8* %228, i32 %230, i32 1)
  store i32 %call411, i32* %wstart, align 4
  %231 = load i32, i32* %wstart, align 4
  %cmp412 = icmp sge i32 %231, 0
  br i1 %cmp412, label %if.then414, label %if.else418

if.then414:                                       ; preds = %if.else408
  %232 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string415 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %232, i32 0, i32 2
  %233 = load i8*, i8** %search_string415, align 4
  %234 = load i32, i32* %wstart, align 4
  %235 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index416 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %235, i32 0, i32 3
  store i32 %234, i32* %search_string_index416, align 4
  %arrayidx417 = getelementptr inbounds i8, i8* %233, i32 %234
  store i8 0, i8* %arrayidx417, align 1
  br label %if.end422

if.else418:                                       ; preds = %if.else408
  %236 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string419 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %236, i32 0, i32 2
  %237 = load i8*, i8** %search_string419, align 4
  %238 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index420 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %238, i32 0, i32 3
  store i32 0, i32* %search_string_index420, align 4
  %arrayidx421 = getelementptr inbounds i8, i8* %237, i32 0
  store i8 0, i8* %arrayidx421, align 1
  br label %if.end422

if.end422:                                        ; preds = %if.else418, %if.then414
  br label %if.end423

if.end423:                                        ; preds = %if.end422, %if.then403
  br label %if.end424

if.end424:                                        ; preds = %if.end423, %if.then395
  %239 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index425 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %239, i32 0, i32 3
  %240 = load i32, i32* %search_string_index425, align 4
  %cmp426 = icmp eq i32 %240, 0
  br i1 %cmp426, label %if.then428, label %if.end430

if.then428:                                       ; preds = %if.end424
  %call429 = call i32 @rl_ding()
  br label %if.end430

if.end430:                                        ; preds = %if.then428, %if.end424
  br label %sw.epilog

sw.bb431:                                         ; preds = %if.end347
  %241 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %241, i32 0, i32 5
  %242 = load i8**, i8*** %lines, align 4
  %243 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %243, i32 0, i32 11
  %244 = load i32, i32* %save_line, align 4
  %arrayidx432 = getelementptr inbounds i8*, i8** %242, i32 %244
  %245 = load i8*, i8** %arrayidx432, align 4
  call void @rl_replace_line(i8* %245, i32 0)
  %246 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_point = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %246, i32 0, i32 9
  %247 = load i32, i32* %save_point, align 4
  store i32 %247, i32* @rl_point, align 4
  %248 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_mark = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %248, i32 0, i32 10
  %249 = load i32, i32* %save_mark, align 4
  store i32 %249, i32* @rl_mark, align 4
  call void @rl_restore_prompt()
  %call433 = call i32 @rl_clear_message()
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb434:                                         ; preds = %if.end347
  %250 = load i32, i32* @rl_point, align 4
  %251 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index435 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %251, i32 0, i32 3
  %252 = load i32, i32* %search_string_index435, align 4
  %add436 = add nsw i32 %250, %252
  store i32 %add436, i32* %wstart, align 4
  %253 = load i32, i32* %wstart, align 4
  %254 = load i32, i32* @rl_end, align 4
  %cmp437 = icmp sge i32 %253, %254
  br i1 %cmp437, label %if.then439, label %if.end441

if.then439:                                       ; preds = %sw.bb434
  %call440 = call i32 @rl_ding()
  br label %sw.epilog

if.end441:                                        ; preds = %sw.bb434
  %255 = load i8*, i8** @rl_line_buffer, align 4
  %256 = load i32, i32* %wstart, align 4
  %call442 = call i32 @_rl_char_value(i8* %255, i32 %256)
  store i32 %call442, i32* %cval, align 4
  %257 = load i32, i32* %cval, align 4
  %call443 = call i32 @_rl_walphabetic(i32 %257)
  %cmp444 = icmp eq i32 %call443, 0
  br i1 %cmp444, label %if.then446, label %if.end448

if.then446:                                       ; preds = %if.end441
  %call447 = call i32 @rl_ding()
  br label %sw.epilog

if.end448:                                        ; preds = %if.end441
  %call449 = call i32 @__ctype_get_mb_cur_max()
  %cmp450 = icmp ugt i32 %call449, 1
  br i1 %cmp450, label %land.lhs.true452, label %cond.false

land.lhs.true452:                                 ; preds = %if.end448
  %258 = load i32, i32* @rl_byte_oriented, align 4
  %cmp453 = icmp eq i32 %258, 0
  br i1 %cmp453, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true452
  %259 = load i8*, i8** @rl_line_buffer, align 4
  %260 = load i32, i32* %wstart, align 4
  %call455 = call i32 @_rl_find_next_mbchar(i8* %259, i32 %260, i32 1, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true452, %if.end448
  %261 = load i32, i32* %wstart, align 4
  %add456 = add nsw i32 %261, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond457 = phi i32 [ %call455, %cond.true ], [ %add456, %cond.false ]
  store i32 %cond457, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end476, %cond.end
  %262 = load i32, i32* %n, align 4
  %263 = load i32, i32* @rl_end, align 4
  %cmp458 = icmp slt i32 %262, %263
  br i1 %cmp458, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %264 = load i8*, i8** @rl_line_buffer, align 4
  %265 = load i32, i32* %n, align 4
  %call460 = call i32 @_rl_char_value(i8* %264, i32 %265)
  store i32 %call460, i32* %cval, align 4
  %266 = load i32, i32* %cval, align 4
  %call461 = call i32 @_rl_walphabetic(i32 %266)
  %cmp462 = icmp eq i32 %call461, 0
  br i1 %cmp462, label %if.then464, label %if.end465

if.then464:                                       ; preds = %while.body
  br label %while.end

if.end465:                                        ; preds = %while.body
  %call466 = call i32 @__ctype_get_mb_cur_max()
  %cmp467 = icmp ugt i32 %call466, 1
  br i1 %cmp467, label %land.lhs.true469, label %cond.false474

land.lhs.true469:                                 ; preds = %if.end465
  %267 = load i32, i32* @rl_byte_oriented, align 4
  %cmp470 = icmp eq i32 %267, 0
  br i1 %cmp470, label %cond.true472, label %cond.false474

cond.true472:                                     ; preds = %land.lhs.true469
  %268 = load i8*, i8** @rl_line_buffer, align 4
  %269 = load i32, i32* %n, align 4
  %call473 = call i32 @_rl_find_next_mbchar(i8* %268, i32 %269, i32 1, i32 1)
  br label %cond.end476

cond.false474:                                    ; preds = %land.lhs.true469, %if.end465
  %270 = load i32, i32* %n, align 4
  %add475 = add nsw i32 %270, 1
  br label %cond.end476

cond.end476:                                      ; preds = %cond.false474, %cond.true472
  %cond477 = phi i32 [ %call473, %cond.true472 ], [ %add475, %cond.false474 ]
  store i32 %cond477, i32* %n, align 4
  br label %while.cond

while.end:                                        ; preds = %if.then464, %while.cond
  %271 = load i32, i32* %n, align 4
  %272 = load i32, i32* %wstart, align 4
  %sub478 = sub nsw i32 %271, %272
  %add479 = add nsw i32 %sub478, 1
  store i32 %add479, i32* %wlen, align 4
  %273 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index480 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %273, i32 0, i32 3
  %274 = load i32, i32* %search_string_index480, align 4
  %275 = load i32, i32* %wlen, align 4
  %add481 = add nsw i32 %274, %275
  %add482 = add nsw i32 %add481, 1
  %276 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size483 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %276, i32 0, i32 4
  %277 = load i32, i32* %search_string_size483, align 4
  %cmp484 = icmp sge i32 %add482, %277
  br i1 %cmp484, label %if.then486, label %if.end494

if.then486:                                       ; preds = %while.end
  %278 = load i32, i32* %wlen, align 4
  %add487 = add nsw i32 %278, 1
  %279 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size488 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %279, i32 0, i32 4
  %280 = load i32, i32* %search_string_size488, align 4
  %add489 = add nsw i32 %280, %add487
  store i32 %add489, i32* %search_string_size488, align 4
  %281 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string490 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %281, i32 0, i32 2
  %282 = load i8*, i8** %search_string490, align 4
  %283 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size491 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %283, i32 0, i32 4
  %284 = load i32, i32* %search_string_size491, align 4
  %call492 = call i8* @xrealloc(i8* %282, i32 %284)
  %285 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string493 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %285, i32 0, i32 2
  store i8* %call492, i8** %search_string493, align 4
  br label %if.end494

if.end494:                                        ; preds = %if.then486, %while.end
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end494
  %286 = load i32, i32* %wstart, align 4
  %287 = load i32, i32* %n, align 4
  %cmp495 = icmp slt i32 %286, %287
  br i1 %cmp495, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %288 = load i8*, i8** @rl_line_buffer, align 4
  %289 = load i32, i32* %wstart, align 4
  %arrayidx497 = getelementptr inbounds i8, i8* %288, i32 %289
  %290 = load i8, i8* %arrayidx497, align 1
  %291 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string498 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %291, i32 0, i32 2
  %292 = load i8*, i8** %search_string498, align 4
  %293 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index499 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %293, i32 0, i32 3
  %294 = load i32, i32* %search_string_index499, align 4
  %inc500 = add nsw i32 %294, 1
  store i32 %inc500, i32* %search_string_index499, align 4
  %arrayidx501 = getelementptr inbounds i8, i8* %292, i32 %294
  store i8 %290, i8* %arrayidx501, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %295 = load i32, i32* %wstart, align 4
  %inc502 = add nsw i32 %295, 1
  store i32 %inc502, i32* %wstart, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %296 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string503 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %296, i32 0, i32 2
  %297 = load i8*, i8** %search_string503, align 4
  %298 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index504 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %298, i32 0, i32 3
  %299 = load i32, i32* %search_string_index504, align 4
  %arrayidx505 = getelementptr inbounds i8, i8* %297, i32 %299
  store i8 0, i8* %arrayidx505, align 1
  br label %sw.epilog

sw.bb506:                                         ; preds = %if.end347
  %300 = load i32, i32* @rl_point, align 4
  %301 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index507 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %301, i32 0, i32 3
  %302 = load i32, i32* %search_string_index507, align 4
  %add508 = add nsw i32 %300, %302
  store i32 %add508, i32* %wstart, align 4
  %303 = load i32, i32* %wstart, align 4
  %304 = load i32, i32* @rl_end, align 4
  %cmp509 = icmp sge i32 %303, %304
  br i1 %cmp509, label %if.then511, label %if.end513

if.then511:                                       ; preds = %sw.bb506
  %call512 = call i32 @rl_ding()
  br label %sw.epilog

if.end513:                                        ; preds = %sw.bb506
  %305 = load i32, i32* @rl_end, align 4
  %306 = load i32, i32* %wstart, align 4
  %sub514 = sub nsw i32 %305, %306
  %add515 = add nsw i32 %sub514, 1
  store i32 %add515, i32* %n, align 4
  %307 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index516 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %307, i32 0, i32 3
  %308 = load i32, i32* %search_string_index516, align 4
  %309 = load i32, i32* %n, align 4
  %add517 = add nsw i32 %308, %309
  %add518 = add nsw i32 %add517, 1
  %310 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size519 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %310, i32 0, i32 4
  %311 = load i32, i32* %search_string_size519, align 4
  %cmp520 = icmp sge i32 %add518, %311
  br i1 %cmp520, label %if.then522, label %if.end530

if.then522:                                       ; preds = %if.end513
  %312 = load i32, i32* %n, align 4
  %add523 = add nsw i32 %312, 1
  %313 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size524 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %313, i32 0, i32 4
  %314 = load i32, i32* %search_string_size524, align 4
  %add525 = add nsw i32 %314, %add523
  store i32 %add525, i32* %search_string_size524, align 4
  %315 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string526 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %315, i32 0, i32 2
  %316 = load i8*, i8** %search_string526, align 4
  %317 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size527 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %317, i32 0, i32 4
  %318 = load i32, i32* %search_string_size527, align 4
  %call528 = call i8* @xrealloc(i8* %316, i32 %318)
  %319 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string529 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %319, i32 0, i32 2
  store i8* %call528, i8** %search_string529, align 4
  br label %if.end530

if.end530:                                        ; preds = %if.then522, %if.end513
  %320 = load i32, i32* %wstart, align 4
  store i32 %320, i32* %n, align 4
  br label %for.cond531

for.cond531:                                      ; preds = %for.inc540, %if.end530
  %321 = load i32, i32* %n, align 4
  %322 = load i32, i32* @rl_end, align 4
  %cmp532 = icmp slt i32 %321, %322
  br i1 %cmp532, label %for.body534, label %for.end542

for.body534:                                      ; preds = %for.cond531
  %323 = load i8*, i8** @rl_line_buffer, align 4
  %324 = load i32, i32* %n, align 4
  %arrayidx535 = getelementptr inbounds i8, i8* %323, i32 %324
  %325 = load i8, i8* %arrayidx535, align 1
  %326 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string536 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %326, i32 0, i32 2
  %327 = load i8*, i8** %search_string536, align 4
  %328 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index537 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %328, i32 0, i32 3
  %329 = load i32, i32* %search_string_index537, align 4
  %inc538 = add nsw i32 %329, 1
  store i32 %inc538, i32* %search_string_index537, align 4
  %arrayidx539 = getelementptr inbounds i8, i8* %327, i32 %329
  store i8 %325, i8* %arrayidx539, align 1
  br label %for.inc540

for.inc540:                                       ; preds = %for.body534
  %330 = load i32, i32* %n, align 4
  %inc541 = add nsw i32 %330, 1
  store i32 %inc541, i32* %n, align 4
  br label %for.cond531

for.end542:                                       ; preds = %for.cond531
  %331 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string543 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %331, i32 0, i32 2
  %332 = load i8*, i8** %search_string543, align 4
  %333 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index544 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %333, i32 0, i32 3
  %334 = load i32, i32* %search_string_index544, align 4
  %arrayidx545 = getelementptr inbounds i8, i8* %332, i32 %334
  store i8 0, i8* %arrayidx545, align 1
  br label %sw.epilog

sw.default:                                       ; preds = %if.end347
  %335 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index546 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %335, i32 0, i32 3
  %336 = load i32, i32* %search_string_index546, align 4
  %add547 = add nsw i32 %336, 2
  %337 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size548 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %337, i32 0, i32 4
  %338 = load i32, i32* %search_string_size548, align 4
  %cmp549 = icmp sge i32 %add547, %338
  br i1 %cmp549, label %if.then551, label %if.end558

if.then551:                                       ; preds = %sw.default
  %339 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size552 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %339, i32 0, i32 4
  %340 = load i32, i32* %search_string_size552, align 4
  %add553 = add nsw i32 %340, 128
  store i32 %add553, i32* %search_string_size552, align 4
  %341 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string554 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %341, i32 0, i32 2
  %342 = load i8*, i8** %search_string554, align 4
  %343 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_size555 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %343, i32 0, i32 4
  %344 = load i32, i32* %search_string_size555, align 4
  %call556 = call i8* @xrealloc(i8* %342, i32 %344)
  %345 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string557 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %345, i32 0, i32 2
  store i8* %call556, i8** %search_string557, align 4
  br label %if.end558

if.end558:                                        ; preds = %if.then551, %sw.default
  %call559 = call i32 @__ctype_get_mb_cur_max()
  %cmp560 = icmp ugt i32 %call559, 1
  br i1 %cmp560, label %land.lhs.true562, label %if.else629

land.lhs.true562:                                 ; preds = %if.end558
  %346 = load i32, i32* @rl_byte_oriented, align 4
  %cmp563 = icmp eq i32 %346, 0
  br i1 %cmp563, label %if.then565, label %if.else629

if.then565:                                       ; preds = %land.lhs.true562
  %347 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb566 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %347, i32 0, i32 21
  %arrayidx567 = getelementptr inbounds [16 x i8], [16 x i8]* %mb566, i32 0, i32 0
  %348 = load i8, i8* %arrayidx567, align 4
  %conv568 = sext i8 %348 to i32
  %cmp569 = icmp eq i32 %conv568, 0
  br i1 %cmp569, label %if.then577, label %lor.lhs.false571

lor.lhs.false571:                                 ; preds = %if.then565
  %349 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb572 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %349, i32 0, i32 21
  %arrayidx573 = getelementptr inbounds [16 x i8], [16 x i8]* %mb572, i32 0, i32 1
  %350 = load i8, i8* %arrayidx573, align 1
  %conv574 = sext i8 %350 to i32
  %cmp575 = icmp eq i32 %conv574, 0
  br i1 %cmp575, label %if.then577, label %if.else584

if.then577:                                       ; preds = %lor.lhs.false571, %if.then565
  %351 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb578 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %351, i32 0, i32 21
  %arrayidx579 = getelementptr inbounds [16 x i8], [16 x i8]* %mb578, i32 0, i32 0
  %352 = load i8, i8* %arrayidx579, align 4
  %353 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string580 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %353, i32 0, i32 2
  %354 = load i8*, i8** %search_string580, align 4
  %355 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index581 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %355, i32 0, i32 3
  %356 = load i32, i32* %search_string_index581, align 4
  %inc582 = add nsw i32 %356, 1
  store i32 %inc582, i32* %search_string_index581, align 4
  %arrayidx583 = getelementptr inbounds i8, i8* %354, i32 %356
  store i8 %352, i8* %arrayidx583, align 1
  br label %if.end628

if.else584:                                       ; preds = %lor.lhs.false571
  store i32 0, i32* %j, align 4
  %357 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb585 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %357, i32 0, i32 21
  %arraydecay586 = getelementptr inbounds [16 x i8], [16 x i8]* %mb585, i32 0, i32 0
  %tobool587 = icmp ne i8* %arraydecay586, null
  br i1 %tobool587, label %land.lhs.true588, label %cond.false613

land.lhs.true588:                                 ; preds = %if.else584
  %358 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb589 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %358, i32 0, i32 21
  %arrayidx590 = getelementptr inbounds [16 x i8], [16 x i8]* %mb589, i32 0, i32 0
  %359 = load i8, i8* %arrayidx590, align 4
  %conv591 = sext i8 %359 to i32
  %tobool592 = icmp ne i32 %conv591, 0
  br i1 %tobool592, label %cond.true593, label %cond.false613

cond.true593:                                     ; preds = %land.lhs.true588
  %360 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb594 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %360, i32 0, i32 21
  %arrayidx595 = getelementptr inbounds [16 x i8], [16 x i8]* %mb594, i32 0, i32 1
  %361 = load i8, i8* %arrayidx595, align 1
  %conv596 = sext i8 %361 to i32
  %tobool597 = icmp ne i32 %conv596, 0
  br i1 %tobool597, label %cond.true598, label %cond.false610

cond.true598:                                     ; preds = %cond.true593
  %362 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb599 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %362, i32 0, i32 21
  %arrayidx600 = getelementptr inbounds [16 x i8], [16 x i8]* %mb599, i32 0, i32 2
  %363 = load i8, i8* %arrayidx600, align 2
  %conv601 = sext i8 %363 to i32
  %tobool602 = icmp ne i32 %conv601, 0
  br i1 %tobool602, label %cond.true603, label %cond.false607

cond.true603:                                     ; preds = %cond.true598
  %364 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb604 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %364, i32 0, i32 21
  %arraydecay605 = getelementptr inbounds [16 x i8], [16 x i8]* %mb604, i32 0, i32 0
  %call606 = call i32 @strlen(i8* %arraydecay605)
  br label %cond.end608

cond.false607:                                    ; preds = %cond.true598
  br label %cond.end608

cond.end608:                                      ; preds = %cond.false607, %cond.true603
  %cond609 = phi i32 [ %call606, %cond.true603 ], [ 2, %cond.false607 ]
  br label %cond.end611

cond.false610:                                    ; preds = %cond.true593
  br label %cond.end611

cond.end611:                                      ; preds = %cond.false610, %cond.end608
  %cond612 = phi i32 [ %cond609, %cond.end608 ], [ 1, %cond.false610 ]
  br label %cond.end614

cond.false613:                                    ; preds = %land.lhs.true588, %if.else584
  br label %cond.end614

cond.end614:                                      ; preds = %cond.false613, %cond.end611
  %cond615 = phi i32 [ %cond612, %cond.end611 ], [ 0, %cond.false613 ]
  store i32 %cond615, i32* %l, align 4
  br label %for.cond616

for.cond616:                                      ; preds = %for.body619, %cond.end614
  %365 = load i32, i32* %j, align 4
  %366 = load i32, i32* %l, align 4
  %cmp617 = icmp slt i32 %365, %366
  br i1 %cmp617, label %for.body619, label %for.end627

for.body619:                                      ; preds = %for.cond616
  %367 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %mb620 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %367, i32 0, i32 21
  %368 = load i32, i32* %j, align 4
  %inc621 = add nsw i32 %368, 1
  store i32 %inc621, i32* %j, align 4
  %arrayidx622 = getelementptr inbounds [16 x i8], [16 x i8]* %mb620, i32 0, i32 %368
  %369 = load i8, i8* %arrayidx622, align 1
  %370 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string623 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %370, i32 0, i32 2
  %371 = load i8*, i8** %search_string623, align 4
  %372 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index624 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %372, i32 0, i32 3
  %373 = load i32, i32* %search_string_index624, align 4
  %inc625 = add nsw i32 %373, 1
  store i32 %inc625, i32* %search_string_index624, align 4
  %arrayidx626 = getelementptr inbounds i8, i8* %371, i32 %373
  store i8 %369, i8* %arrayidx626, align 1
  br label %for.cond616

for.end627:                                       ; preds = %for.cond616
  br label %if.end628

if.end628:                                        ; preds = %for.end627, %if.then577
  br label %if.end636

if.else629:                                       ; preds = %land.lhs.true562, %if.end558
  %374 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc630 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %374, i32 0, i32 20
  %375 = load i32, i32* %lastc630, align 4
  %conv631 = trunc i32 %375 to i8
  %376 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string632 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %376, i32 0, i32 2
  %377 = load i8*, i8** %search_string632, align 4
  %378 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index633 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %378, i32 0, i32 3
  %379 = load i32, i32* %search_string_index633, align 4
  %inc634 = add nsw i32 %379, 1
  store i32 %inc634, i32* %search_string_index633, align 4
  %arrayidx635 = getelementptr inbounds i8, i8* %377, i32 %379
  store i8 %conv631, i8* %arrayidx635, align 1
  br label %if.end636

if.end636:                                        ; preds = %if.else629, %if.end628
  %380 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string637 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %380, i32 0, i32 2
  %381 = load i8*, i8** %search_string637, align 4
  %382 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index638 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %382, i32 0, i32 3
  %383 = load i32, i32* %search_string_index638, align 4
  %arrayidx639 = getelementptr inbounds i8, i8* %381, i32 %383
  store i8 0, i8* %arrayidx639, align 1
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end636, %for.end542, %if.then511, %for.end, %if.then446, %if.then439, %if.end430, %if.end390, %if.end378, %if.then353
  %384 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags640 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %384, i32 0, i32 1
  %385 = load i32, i32* %sflags640, align 4
  %and641 = and i32 %385, -7
  store i32 %and641, i32* %sflags640, align 4
  br label %for.cond642

for.cond642:                                      ; preds = %cond.end768, %sw.epilog
  %386 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index643 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %386, i32 0, i32 3
  %387 = load i32, i32* %search_string_index643, align 4
  %cmp644 = icmp eq i32 %387, 0
  br i1 %cmp644, label %if.then646, label %if.end649

if.then646:                                       ; preds = %for.cond642
  %388 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags647 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %388, i32 0, i32 1
  %389 = load i32, i32* %sflags647, align 4
  %or648 = or i32 %389, 4
  store i32 %or648, i32* %sflags647, align 4
  br label %for.end771

if.end649:                                        ; preds = %for.cond642
  %390 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_len650 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %390, i32 0, i32 24
  %391 = load i32, i32* %sline_len650, align 4
  %392 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index651 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %392, i32 0, i32 3
  %393 = load i32, i32* %search_string_index651, align 4
  %sub652 = sub nsw i32 %391, %393
  %add653 = add nsw i32 %sub652, 1
  store i32 %add653, i32* %limit, align 4
  br label %while.cond654

while.cond654:                                    ; preds = %if.end699, %if.end649
  %394 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags655 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %394, i32 0, i32 1
  %395 = load i32, i32* %sflags655, align 4
  %and656 = and i32 %395, 1
  %tobool657 = icmp ne i32 %and656, 0
  br i1 %tobool657, label %cond.true658, label %cond.false662

cond.true658:                                     ; preds = %while.cond654
  %396 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index659 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %396, i32 0, i32 25
  %397 = load i32, i32* %sline_index659, align 4
  %cmp660 = icmp sge i32 %397, 0
  %conv661 = zext i1 %cmp660 to i32
  br label %cond.end666

cond.false662:                                    ; preds = %while.cond654
  %398 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index663 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %398, i32 0, i32 25
  %399 = load i32, i32* %sline_index663, align 4
  %400 = load i32, i32* %limit, align 4
  %cmp664 = icmp slt i32 %399, %400
  %conv665 = zext i1 %cmp664 to i32
  br label %cond.end666

cond.end666:                                      ; preds = %cond.false662, %cond.true658
  %cond667 = phi i32 [ %conv661, %cond.true658 ], [ %conv665, %cond.false662 ]
  %tobool668 = icmp ne i32 %cond667, 0
  br i1 %tobool668, label %while.body669, label %while.end700

while.body669:                                    ; preds = %cond.end666
  %401 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index670 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %401, i32 0, i32 3
  %402 = load i32, i32* %search_string_index670, align 4
  %cmp671 = icmp eq i32 %402, 0
  br i1 %cmp671, label %cond.true673, label %cond.false674

cond.true673:                                     ; preds = %while.body669
  br i1 true, label %if.then692, label %if.else695

cond.false674:                                    ; preds = %while.body669
  %403 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string675 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %403, i32 0, i32 2
  %404 = load i8*, i8** %search_string675, align 4
  %arrayidx676 = getelementptr inbounds i8, i8* %404, i32 0
  %405 = load i8, i8* %arrayidx676, align 1
  %conv677 = sext i8 %405 to i32
  %406 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %406, i32 0, i32 23
  %407 = load i8*, i8** %sline, align 4
  %408 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index678 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %408, i32 0, i32 25
  %409 = load i32, i32* %sline_index678, align 4
  %add.ptr = getelementptr inbounds i8, i8* %407, i32 %409
  %arrayidx679 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %410 = load i8, i8* %arrayidx679, align 1
  %conv680 = sext i8 %410 to i32
  %cmp681 = icmp eq i32 %conv677, %conv680
  br i1 %cmp681, label %land.lhs.true683, label %if.else695

land.lhs.true683:                                 ; preds = %cond.false674
  %411 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string684 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %411, i32 0, i32 2
  %412 = load i8*, i8** %search_string684, align 4
  %413 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline685 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %413, i32 0, i32 23
  %414 = load i8*, i8** %sline685, align 4
  %415 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index686 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %415, i32 0, i32 25
  %416 = load i32, i32* %sline_index686, align 4
  %add.ptr687 = getelementptr inbounds i8, i8* %414, i32 %416
  %417 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index688 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %417, i32 0, i32 3
  %418 = load i32, i32* %search_string_index688, align 4
  %call689 = call i32 @strncmp(i8* %412, i8* %add.ptr687, i32 %418)
  %cmp690 = icmp eq i32 %call689, 0
  br i1 %cmp690, label %if.then692, label %if.else695

if.then692:                                       ; preds = %land.lhs.true683, %cond.true673
  %419 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags693 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %419, i32 0, i32 1
  %420 = load i32, i32* %sflags693, align 4
  %or694 = or i32 %420, 2
  store i32 %or694, i32* %sflags693, align 4
  br label %while.end700

if.else695:                                       ; preds = %land.lhs.true683, %cond.false674, %cond.true673
  %421 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction696 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %421, i32 0, i32 18
  %422 = load i32, i32* %direction696, align 4
  %423 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index697 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %423, i32 0, i32 25
  %424 = load i32, i32* %sline_index697, align 4
  %add698 = add nsw i32 %424, %422
  store i32 %add698, i32* %sline_index697, align 4
  br label %if.end699

if.end699:                                        ; preds = %if.else695
  br label %while.cond654

while.end700:                                     ; preds = %if.then692, %cond.end666
  %425 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags701 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %425, i32 0, i32 1
  %426 = load i32, i32* %sflags701, align 4
  %and702 = and i32 %426, 2
  %tobool703 = icmp ne i32 %and702, 0
  br i1 %tobool703, label %if.then704, label %if.end705

if.then704:                                       ; preds = %while.end700
  br label %for.end771

if.end705:                                        ; preds = %while.end700
  br label %do.body

do.body:                                          ; preds = %lor.end, %if.end705
  %427 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %direction706 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %427, i32 0, i32 18
  %428 = load i32, i32* %direction706, align 4
  %429 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos707 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %429, i32 0, i32 17
  %430 = load i32, i32* %history_pos707, align 4
  %add708 = add nsw i32 %430, %428
  store i32 %add708, i32* %history_pos707, align 4
  %431 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags709 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %431, i32 0, i32 1
  %432 = load i32, i32* %sflags709, align 4
  %and710 = and i32 %432, 1
  %tobool711 = icmp ne i32 %and710, 0
  br i1 %tobool711, label %cond.true712, label %cond.false716

cond.true712:                                     ; preds = %do.body
  %433 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos713 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %433, i32 0, i32 17
  %434 = load i32, i32* %history_pos713, align 4
  %cmp714 = icmp slt i32 %434, 0
  br i1 %cmp714, label %if.then720, label %if.end723

cond.false716:                                    ; preds = %do.body
  %435 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos717 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %435, i32 0, i32 17
  %436 = load i32, i32* %history_pos717, align 4
  %437 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %hlen = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %437, i32 0, i32 7
  %438 = load i32, i32* %hlen, align 4
  %cmp718 = icmp eq i32 %436, %438
  br i1 %cmp718, label %if.then720, label %if.end723

if.then720:                                       ; preds = %cond.false716, %cond.true712
  %439 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags721 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %439, i32 0, i32 1
  %440 = load i32, i32* %sflags721, align 4
  %or722 = or i32 %440, 4
  store i32 %or722, i32* %sflags721, align 4
  br label %do.end

if.end723:                                        ; preds = %cond.false716, %cond.true712
  %441 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines724 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %441, i32 0, i32 5
  %442 = load i8**, i8*** %lines724, align 4
  %443 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos725 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %443, i32 0, i32 17
  %444 = load i32, i32* %history_pos725, align 4
  %arrayidx726 = getelementptr inbounds i8*, i8** %442, i32 %444
  %445 = load i8*, i8** %arrayidx726, align 4
  %446 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline727 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %446, i32 0, i32 23
  store i8* %445, i8** %sline727, align 4
  %447 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline728 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %447, i32 0, i32 23
  %448 = load i8*, i8** %sline728, align 4
  %call729 = call i32 @strlen(i8* %448)
  %449 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_len730 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %449, i32 0, i32 24
  store i32 %call729, i32* %sline_len730, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end723
  %450 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prev_line_found = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %450, i32 0, i32 13
  %451 = load i8*, i8** %prev_line_found, align 4
  %tobool731 = icmp ne i8* %451, null
  br i1 %tobool731, label %land.lhs.true732, label %lor.rhs

land.lhs.true732:                                 ; preds = %do.cond
  %452 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prev_line_found733 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %452, i32 0, i32 13
  %453 = load i8*, i8** %prev_line_found733, align 4
  %arrayidx734 = getelementptr inbounds i8, i8* %453, i32 0
  %454 = load i8, i8* %arrayidx734, align 1
  %conv735 = sext i8 %454 to i32
  %455 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines736 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %455, i32 0, i32 5
  %456 = load i8**, i8*** %lines736, align 4
  %457 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos737 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %457, i32 0, i32 17
  %458 = load i32, i32* %history_pos737, align 4
  %arrayidx738 = getelementptr inbounds i8*, i8** %456, i32 %458
  %459 = load i8*, i8** %arrayidx738, align 4
  %arrayidx739 = getelementptr inbounds i8, i8* %459, i32 0
  %460 = load i8, i8* %arrayidx739, align 1
  %conv740 = sext i8 %460 to i32
  %cmp741 = icmp eq i32 %conv735, %conv740
  br i1 %cmp741, label %land.lhs.true743, label %lor.rhs

land.lhs.true743:                                 ; preds = %land.lhs.true732
  %461 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prev_line_found744 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %461, i32 0, i32 13
  %462 = load i8*, i8** %prev_line_found744, align 4
  %463 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines745 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %463, i32 0, i32 5
  %464 = load i8**, i8*** %lines745, align 4
  %465 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos746 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %465, i32 0, i32 17
  %466 = load i32, i32* %history_pos746, align 4
  %arrayidx747 = getelementptr inbounds i8*, i8** %464, i32 %466
  %467 = load i8*, i8** %arrayidx747, align 4
  %call748 = call i32 @strcmp(i8* %462, i8* %467)
  %cmp749 = icmp eq i32 %call748, 0
  br i1 %cmp749, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true743, %land.lhs.true732, %do.cond
  %468 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index751 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %468, i32 0, i32 3
  %469 = load i32, i32* %search_string_index751, align 4
  %470 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_len752 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %470, i32 0, i32 24
  %471 = load i32, i32* %sline_len752, align 4
  %cmp753 = icmp sgt i32 %469, %471
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.lhs.true743
  %472 = phi i1 [ true, %land.lhs.true743 ], [ %cmp753, %lor.rhs ]
  br i1 %472, label %do.body, label %do.end

do.end:                                           ; preds = %lor.end, %if.then720
  %473 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags755 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %473, i32 0, i32 1
  %474 = load i32, i32* %sflags755, align 4
  %and756 = and i32 %474, 4
  %tobool757 = icmp ne i32 %and756, 0
  br i1 %tobool757, label %if.then758, label %if.end759

if.then758:                                       ; preds = %do.end
  br label %for.end771

if.end759:                                        ; preds = %do.end
  %475 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags760 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %475, i32 0, i32 1
  %476 = load i32, i32* %sflags760, align 4
  %and761 = and i32 %476, 1
  %tobool762 = icmp ne i32 %and761, 0
  br i1 %tobool762, label %cond.true763, label %cond.false767

cond.true763:                                     ; preds = %if.end759
  %477 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_len764 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %477, i32 0, i32 24
  %478 = load i32, i32* %sline_len764, align 4
  %479 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index765 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %479, i32 0, i32 3
  %480 = load i32, i32* %search_string_index765, align 4
  %sub766 = sub nsw i32 %478, %480
  br label %cond.end768

cond.false767:                                    ; preds = %if.end759
  br label %cond.end768

cond.end768:                                      ; preds = %cond.false767, %cond.true763
  %cond769 = phi i32 [ %sub766, %cond.true763 ], [ 0, %cond.false767 ]
  %481 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index770 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %481, i32 0, i32 25
  store i32 %cond769, i32* %sline_index770, align 4
  br label %for.cond642

for.end771:                                       ; preds = %if.then758, %if.then704, %if.then646
  %482 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags772 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %482, i32 0, i32 1
  %483 = load i32, i32* %sflags772, align 4
  %and773 = and i32 %483, 4
  %tobool774 = icmp ne i32 %and773, 0
  br i1 %tobool774, label %if.then775, label %if.end790

if.then775:                                       ; preds = %for.end771
  %call776 = call i32 @rl_ding()
  %484 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line777 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %484, i32 0, i32 12
  %485 = load i32, i32* %last_found_line777, align 4
  %486 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos778 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %486, i32 0, i32 17
  store i32 %485, i32* %history_pos778, align 4
  %487 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string779 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %487, i32 0, i32 2
  %488 = load i8*, i8** %search_string779, align 4
  %489 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags780 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %489, i32 0, i32 1
  %490 = load i32, i32* %sflags780, align 4
  %491 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos781 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %491, i32 0, i32 17
  %492 = load i32, i32* %history_pos781, align 4
  %493 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line782 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %493, i32 0, i32 11
  %494 = load i32, i32* %save_line782, align 4
  %cmp783 = icmp eq i32 %492, %494
  br i1 %cmp783, label %cond.true785, label %cond.false786

cond.true785:                                     ; preds = %if.then775
  br label %cond.end788

cond.false786:                                    ; preds = %if.then775
  %495 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos787 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %495, i32 0, i32 17
  %496 = load i32, i32* %history_pos787, align 4
  br label %cond.end788

cond.end788:                                      ; preds = %cond.false786, %cond.true785
  %cond789 = phi i32 [ -1, %cond.true785 ], [ %496, %cond.false786 ]
  call void @rl_display_search(i8* %488, i32 %490, i32 %cond789)
  store i32 1, i32* %retval, align 4
  br label %return

if.end790:                                        ; preds = %for.end771
  %497 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags791 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %497, i32 0, i32 1
  %498 = load i32, i32* %sflags791, align 4
  %and792 = and i32 %498, 2
  %tobool793 = icmp ne i32 %and792, 0
  br i1 %tobool793, label %if.then794, label %if.end816

if.then794:                                       ; preds = %if.end790
  %499 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines795 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %499, i32 0, i32 5
  %500 = load i8**, i8*** %lines795, align 4
  %501 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos796 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %501, i32 0, i32 17
  %502 = load i32, i32* %history_pos796, align 4
  %arrayidx797 = getelementptr inbounds i8*, i8** %500, i32 %502
  %503 = load i8*, i8** %arrayidx797, align 4
  %504 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %prev_line_found798 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %504, i32 0, i32 13
  store i8* %503, i8** %prev_line_found798, align 4
  %505 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines799 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %505, i32 0, i32 5
  %506 = load i8**, i8*** %lines799, align 4
  %507 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos800 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %507, i32 0, i32 17
  %508 = load i32, i32* %history_pos800, align 4
  %arrayidx801 = getelementptr inbounds i8*, i8** %506, i32 %508
  %509 = load i8*, i8** %arrayidx801, align 4
  call void @rl_replace_line(i8* %509, i32 0)
  %510 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index802 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %510, i32 0, i32 25
  %511 = load i32, i32* %sline_index802, align 4
  store i32 %511, i32* @rl_point, align 4
  %512 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos803 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %512, i32 0, i32 17
  %513 = load i32, i32* %history_pos803, align 4
  %514 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line804 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %514, i32 0, i32 12
  store i32 %513, i32* %last_found_line804, align 4
  %515 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string805 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %515, i32 0, i32 2
  %516 = load i8*, i8** %search_string805, align 4
  %517 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sflags806 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %517, i32 0, i32 1
  %518 = load i32, i32* %sflags806, align 4
  %519 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos807 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %519, i32 0, i32 17
  %520 = load i32, i32* %history_pos807, align 4
  %521 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line808 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %521, i32 0, i32 11
  %522 = load i32, i32* %save_line808, align 4
  %cmp809 = icmp eq i32 %520, %522
  br i1 %cmp809, label %cond.true811, label %cond.false812

cond.true811:                                     ; preds = %if.then794
  br label %cond.end814

cond.false812:                                    ; preds = %if.then794
  %523 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %history_pos813 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %523, i32 0, i32 17
  %524 = load i32, i32* %history_pos813, align 4
  br label %cond.end814

cond.end814:                                      ; preds = %cond.false812, %cond.true811
  %cond815 = phi i32 [ -1, %cond.true811 ], [ %524, %cond.false812 ]
  call void @rl_display_search(i8* %516, i32 %518, i32 %cond815)
  br label %if.end816

if.end816:                                        ; preds = %cond.end814, %if.end790
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end816, %cond.end788, %sw.bb431, %if.end362, %if.then343, %if.then310, %if.end262, %if.then233, %if.then161, %if.end59, %if.then
  %525 = load i32, i32* %retval, align 4
  ret i32 %525
}

declare i8* @strchr(i8*, i32) #1

declare i32 @_rl_pushed_input_available() #1

declare i32 @_rl_input_queued(i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @rl_rubout(i32, i32) #1

declare i32 @rl_abort(i32, i32) #1

declare i32 @rl_unix_word_rubout(i32, i32) #1

declare i32 @rl_yank(i32, i32) #1

declare i32 @rl_stuff_char(i32) #1

declare i32 @rl_execute_next(i32) #1

declare i32 @rl_insert(i32, i32) #1

declare i32 @_rl_input_available() #1

declare i8* @xrealloc(i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal void @rl_display_search(i8* %search_string, i32 %flags, i32 %where) #0 {
entry:
  %search_string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %where.addr = alloca i32, align 4
  %message = alloca i8*, align 4
  %msglen = alloca i32, align 4
  %searchlen = alloca i32, align 4
  store i8* %search_string, i8** %search_string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %where, i32* %where.addr, align 4
  %0 = load i8*, i8** %search_string.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %search_string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %search_string.addr, align 4
  %call = call i32 @strlen(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %searchlen, align 4
  %4 = load i32, i32* %searchlen, align 4
  %add = add nsw i32 %4, 64
  %call2 = call i8* @xmalloc(i32 %add)
  store i8* %call2, i8** %message, align 4
  store i32 0, i32* %msglen, align 4
  %5 = load i8*, i8** %message, align 4
  %6 = load i32, i32* %msglen, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %msglen, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  store i8 40, i8* %arrayidx, align 1
  %7 = load i32, i32* %flags.addr, align 4
  %and = and i32 %7, 4
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %8 = load i8*, i8** %message, align 4
  %9 = load i32, i32* %msglen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 %9
  %call4 = call i8* @strcpy(i8* %add.ptr, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  %10 = load i32, i32* %msglen, align 4
  %add5 = add nsw i32 %10, 7
  store i32 %add5, i32* %msglen, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %11 = load i32, i32* %flags.addr, align 4
  %and6 = and i32 %11, 1
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end12

if.then8:                                         ; preds = %if.end
  %12 = load i8*, i8** %message, align 4
  %13 = load i32, i32* %msglen, align 4
  %add.ptr9 = getelementptr inbounds i8, i8* %12, i32 %13
  %call10 = call i8* @strcpy(i8* %add.ptr9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  %14 = load i32, i32* %msglen, align 4
  %add11 = add nsw i32 %14, 8
  store i32 %add11, i32* %msglen, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then8, %if.end
  %15 = load i8*, i8** %message, align 4
  %16 = load i32, i32* %msglen, align 4
  %add.ptr13 = getelementptr inbounds i8, i8* %15, i32 %16
  %call14 = call i8* @strcpy(i8* %add.ptr13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0))
  %17 = load i32, i32* %msglen, align 4
  %add15 = add nsw i32 %17, 10
  store i32 %add15, i32* %msglen, align 4
  %18 = load i8*, i8** %search_string.addr, align 4
  %tobool16 = icmp ne i8* %18, null
  br i1 %tobool16, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.end12
  %19 = load i8*, i8** %message, align 4
  %20 = load i32, i32* %msglen, align 4
  %add.ptr18 = getelementptr inbounds i8, i8* %19, i32 %20
  %21 = load i8*, i8** %search_string.addr, align 4
  %call19 = call i8* @strcpy(i8* %add.ptr18, i8* %21)
  %22 = load i32, i32* %searchlen, align 4
  %23 = load i32, i32* %msglen, align 4
  %add20 = add nsw i32 %23, %22
  store i32 %add20, i32* %msglen, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then17, %if.end12
  %24 = load i8*, i8** %message, align 4
  %25 = load i32, i32* %msglen, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %24, i32 %25
  %call23 = call i8* @strcpy(i8* %add.ptr22, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
  %26 = load i8*, i8** %message, align 4
  %call24 = call i32 (i8*, ...) @rl_message(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* %26)
  %27 = load i8*, i8** %message, align 4
  call void @xfree(i8* %27)
  %28 = load void ()*, void ()** @rl_redisplay_function, align 4
  call void %28()
  ret void
}

declare i32 @rl_ding() #1

declare i32 @_rl_find_prev_mbchar(i8*, i32, i32) #1

declare void @rl_replace_line(i8*, i32) #1

declare void @rl_restore_prompt() #1

declare i32 @rl_clear_message() #1

declare i32 @_rl_char_value(i8*, i32) #1

declare i32 @_rl_walphabetic(i32) #1

declare i32 @_rl_find_next_mbchar(i8*, i32, i32, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @_rl_isearch_cleanup(%struct.__rl_search_context* %cxt, i32 %r) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %r.addr = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  store i32 %r, i32* %r.addr, align 4
  %0 = load i32, i32* %r.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  call void @_rl_isearch_fini(%struct.__rl_search_context* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  call void @_rl_scxt_dispose(%struct.__rl_search_context* %2, i32 0)
  store %struct.__rl_search_context* null, %struct.__rl_search_context** @_rl_iscxt, align 4
  %3 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %3, -129
  store i32 %and, i32* @rl_readline_state, align 4
  %4 = load i32, i32* %r.addr, align 4
  %cmp1 = icmp ne i32 %4, 0
  %conv = zext i1 %cmp1 to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define internal void @_rl_isearch_fini(%struct.__rl_search_context* %cxt) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %0 = load i8*, i8** @rl_line_buffer, align 4
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lines = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %1, i32 0, i32 5
  %2 = load i8**, i8*** %lines, align 4
  %3 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %3, i32 0, i32 11
  %4 = load i32, i32* %save_line, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %call = call i8* @strcpy(i8* %0, i8* %5)
  call void @rl_restore_prompt()
  %6 = load i8*, i8** @last_isearch_string, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** @last_isearch_string, align 4
  call void @free(i8* %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %8, i32 0, i32 2
  %9 = load i8*, i8** %search_string, align 4
  store i8* %9, i8** @last_isearch_string, align 4
  %10 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %10, i32 0, i32 3
  %11 = load i32, i32* %search_string_index, align 4
  store i32 %11, i32* @last_isearch_string_len, align 4
  %12 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %search_string1 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %12, i32 0, i32 2
  store i8* null, i8** %search_string1, align 4
  %13 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %13, i32 0, i32 12
  %14 = load i32, i32* %last_found_line, align 4
  %15 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line2 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %15, i32 0, i32 11
  %16 = load i32, i32* %save_line2, align 4
  %cmp = icmp slt i32 %14, %16
  br i1 %cmp, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %17 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line4 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %17, i32 0, i32 11
  %18 = load i32, i32* %save_line4, align 4
  %19 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line5 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %19, i32 0, i32 12
  %20 = load i32, i32* %last_found_line5, align 4
  %sub = sub nsw i32 %18, %20
  %call6 = call i32 @rl_get_previous_history(i32 %sub, i32 0)
  br label %if.end11

if.else:                                          ; preds = %if.end
  %21 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line7 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %21, i32 0, i32 12
  %22 = load i32, i32* %last_found_line7, align 4
  %23 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line8 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %23, i32 0, i32 11
  %24 = load i32, i32* %save_line8, align 4
  %sub9 = sub nsw i32 %22, %24
  %call10 = call i32 @rl_get_next_history(i32 %sub9, i32 0)
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then3
  %25 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %25, i32 0, i32 25
  %26 = load i32, i32* %sline_index, align 4
  %cmp12 = icmp slt i32 %26, 0
  br i1 %cmp12, label %if.then13, label %if.end23

if.then13:                                        ; preds = %if.end11
  %27 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %last_found_line14 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %27, i32 0, i32 12
  %28 = load i32, i32* %last_found_line14, align 4
  %29 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_line15 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %29, i32 0, i32 11
  %30 = load i32, i32* %save_line15, align 4
  %cmp16 = icmp eq i32 %28, %30
  br i1 %cmp16, label %if.then17, label %if.else19

if.then17:                                        ; preds = %if.then13
  %31 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_point = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %31, i32 0, i32 9
  %32 = load i32, i32* %save_point, align 4
  %33 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index18 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %33, i32 0, i32 25
  store i32 %32, i32* %sline_index18, align 4
  br label %if.end22

if.else19:                                        ; preds = %if.then13
  %34 = load i8*, i8** @rl_line_buffer, align 4
  %call20 = call i32 @strlen(i8* %34)
  %35 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index21 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %35, i32 0, i32 25
  store i32 %call20, i32* %sline_index21, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else19, %if.then17
  %36 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %save_mark = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %36, i32 0, i32 10
  %37 = load i32, i32* %save_mark, align 4
  store i32 %37, i32* @rl_mark, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end11
  %38 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %sline_index24 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %38, i32 0, i32 25
  %39 = load i32, i32* %sline_index24, align 4
  store i32 %39, i32* @rl_point, align 4
  %call25 = call i32 @rl_clear_message()
  ret void
}

; Function Attrs: noinline nounwind
define i32 @_rl_isearch_callback(%struct.__rl_search_context* %cxt) #0 {
entry:
  %cxt.addr = alloca %struct.__rl_search_context*, align 4
  %c = alloca i32, align 4
  %r = alloca i32, align 4
  store %struct.__rl_search_context* %cxt, %struct.__rl_search_context** %cxt.addr, align 4
  %0 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %call = call i32 @_rl_search_getchar(%struct.__rl_search_context* %0)
  store i32 %call, i32* %c, align 4
  %1 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %2 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %lastc = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %2, i32 0, i32 20
  %3 = load i32, i32* %lastc, align 4
  %call1 = call i32 @_rl_isearch_dispatch(%struct.__rl_search_context* %1, i32 %3)
  store i32 %call1, i32* %r, align 4
  %4 = load i32, i32* %r, align 4
  %cmp = icmp sle i32 %4, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt.addr, align 4
  %6 = load i32, i32* %r, align 4
  %call2 = call i32 @_rl_isearch_cleanup(%struct.__rl_search_context* %5, i32 %6)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call2, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

declare i32 @rl_message(i8*, ...) #1

declare i32 @rl_get_previous_history(i32, i32) #1

declare i32 @rl_get_next_history(i32, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.__rl_search_context* @_rl_isearch_init(i32 %direction) #0 {
entry:
  %direction.addr = alloca i32, align 4
  %cxt = alloca %struct.__rl_search_context*, align 4
  %i = alloca i32, align 4
  %hlist = alloca %struct._hist_entry**, align 4
  store i32 %direction, i32* %direction.addr, align 4
  %call = call %struct.__rl_search_context* @_rl_scxt_alloc(i32 1, i32 0)
  store %struct.__rl_search_context* %call, %struct.__rl_search_context** %cxt, align 4
  %0 = load i32, i32* %direction.addr, align 4
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
  %3 = load i8*, i8** @_rl_isearch_terminators, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load i8*, i8** @_rl_isearch_terminators, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %4, %cond.true ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), %cond.false ]
  %5 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_terminators = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %5, i32 0, i32 26
  store i8* %cond, i8** %search_terminators, align 4
  %call1 = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call1, %struct._hist_entry*** %hlist, align 4
  %call2 = call i32 @rl_maybe_replace_line()
  store i32 0, i32* %i, align 4
  %6 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %tobool3 = icmp ne %struct._hist_entry** %6, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %cond.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then4
  %7 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %7, i32 %8
  %9 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool5 = icmp ne %struct._hist_entry* %9, null
  br i1 %tobool5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end6

if.end6:                                          ; preds = %for.end, %cond.end
  %11 = load i32, i32* %i, align 4
  %12 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %hlen = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %12, i32 0, i32 7
  store i32 %11, i32* %hlen, align 4
  %add = add nsw i32 1, %11
  %mul = mul i32 %add, 4
  %call7 = call i8* @xmalloc(i32 %mul)
  %13 = bitcast i8* %call7 to i8**
  %14 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lines = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %14, i32 0, i32 5
  store i8** %13, i8*** %lines, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc15, %if.end6
  %15 = load i32, i32* %i, align 4
  %16 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %hlen9 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %16, i32 0, i32 7
  %17 = load i32, i32* %hlen9, align 4
  %cmp10 = icmp slt i32 %15, %17
  br i1 %cmp10, label %for.body11, label %for.end17

for.body11:                                       ; preds = %for.cond8
  %18 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %18, i32 %19
  %20 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx12, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %20, i32 0, i32 0
  %21 = load i8*, i8** %line, align 4
  %22 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lines13 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %22, i32 0, i32 5
  %23 = load i8**, i8*** %lines13, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %23, i32 %24
  store i8* %21, i8** %arrayidx14, align 4
  br label %for.inc15

for.inc15:                                        ; preds = %for.body11
  %25 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %25, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond8

for.end17:                                        ; preds = %for.cond8
  %26 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %tobool18 = icmp ne %struct._hist_entry* %26, null
  br i1 %tobool18, label %if.then19, label %if.else

if.then19:                                        ; preds = %for.end17
  %27 = load %struct._hist_entry*, %struct._hist_entry** @_rl_saved_line_for_history, align 4
  %line20 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %27, i32 0, i32 0
  %28 = load i8*, i8** %line20, align 4
  %29 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lines21 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %29, i32 0, i32 5
  %30 = load i8**, i8*** %lines21, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %30, i32 %31
  store i8* %28, i8** %arrayidx22, align 4
  br label %if.end32

if.else:                                          ; preds = %for.end17
  %32 = load i8*, i8** @rl_line_buffer, align 4
  %call23 = call i32 @strlen(i8* %32)
  %add24 = add i32 1, %call23
  %call25 = call i8* @xmalloc(i32 %add24)
  %33 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %allocated_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %33, i32 0, i32 6
  store i8* %call25, i8** %allocated_line, align 4
  %34 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %allocated_line26 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %34, i32 0, i32 6
  %35 = load i8*, i8** %allocated_line26, align 4
  %36 = load i8*, i8** @rl_line_buffer, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %36, i32 0
  %call28 = call i8* @strcpy(i8* %35, i8* %arrayidx27)
  %37 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %allocated_line29 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %37, i32 0, i32 6
  %38 = load i8*, i8** %allocated_line29, align 4
  %39 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %lines30 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %39, i32 0, i32 5
  %40 = load i8**, i8*** %lines30, align 4
  %41 = load i32, i32* %i, align 4
  %arrayidx31 = getelementptr inbounds i8*, i8** %40, i32 %41
  store i8* %38, i8** %arrayidx31, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then19
  %42 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %hlen33 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %42, i32 0, i32 7
  %43 = load i32, i32* %hlen33, align 4
  %inc34 = add nsw i32 %43, 1
  store i32 %inc34, i32* %hlen33, align 4
  %44 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %save_line = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %44, i32 0, i32 11
  %45 = load i32, i32* %save_line, align 4
  %46 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %history_pos = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %46, i32 0, i32 17
  store i32 %45, i32* %history_pos, align 4
  call void @rl_save_prompt()
  %47 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string_size = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %47, i32 0, i32 4
  store i32 128, i32* %search_string_size, align 4
  %call35 = call i8* @xmalloc(i32 128)
  %48 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %48, i32 0, i32 2
  store i8* %call35, i8** %search_string, align 4
  %49 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string36 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %49, i32 0, i32 2
  %50 = load i8*, i8** %search_string36, align 4
  %51 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %search_string_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %51, i32 0, i32 3
  store i32 0, i32* %search_string_index, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %50, i32 0
  store i8 0, i8* %arrayidx37, align 1
  %52 = load i32, i32* %direction.addr, align 4
  %cmp38 = icmp sge i32 %52, 0
  %cond39 = select i1 %cmp38, i32 1, i32 -1
  %53 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %direction40 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %53, i32 0, i32 18
  store i32 %cond39, i32* %direction40, align 4
  %54 = load i8*, i8** @rl_line_buffer, align 4
  %55 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %55, i32 0, i32 23
  store i8* %54, i8** %sline, align 4
  %56 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline41 = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %56, i32 0, i32 23
  %57 = load i8*, i8** %sline41, align 4
  %call42 = call i32 @strlen(i8* %57)
  %58 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline_len = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %58, i32 0, i32 24
  store i32 %call42, i32* %sline_len, align 4
  %59 = load i32, i32* @rl_point, align 4
  %60 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  %sline_index = getelementptr inbounds %struct.__rl_search_context, %struct.__rl_search_context* %60, i32 0, i32 25
  store i32 %59, i32* %sline_index, align 4
  %61 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  store %struct.__rl_search_context* %61, %struct.__rl_search_context** @_rl_iscxt, align 4
  %62 = load %struct.__rl_search_context*, %struct.__rl_search_context** %cxt, align 4
  ret %struct.__rl_search_context* %62
}

declare %struct._hist_entry** @history_list() #1

declare i32 @rl_maybe_replace_line() #1

declare void @rl_save_prompt() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
