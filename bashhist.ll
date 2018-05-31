; ModuleID = 'bashhist.c'
source_filename = "bashhist.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.dstack = type { i8*, i32, i32 }
%struct.ignorevar = type { i8*, %struct.ign*, i32, i8*, i32 (%struct.ign*)* }
%struct.ign = type { i8*, i32, i32 }
%struct.BASH_INPUT = type { i32, i8*, %union.INPUT_STREAM, i32 ()*, i32 (i32)* }
%union.INPUT_STREAM = type { %struct._IO_FILE* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct._hist_entry = type { i8*, i8*, i8* }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@remember_on_history = global i32 0, align 4
@enable_history_list = global i32 0, align 4
@double_quotes_inhibit_history_expansion = global i32 0, align 4
@command_oriented_history = global i32 1, align 4
@current_command_first_line_saved = global i32 0, align 4
@history_quotes_inhibit_expansion = external global i32, align 4
@.str = private unnamed_addr constant [8 x i8] c";&()|<>\00", align 1
@history_search_delimiter_chars = external global i8*, align 4
@history_inhibit_expansion_function = external global i32 (i8*, i32)*, align 4
@.str.1 = private unnamed_addr constant [10 x i8] c"histchars\00", align 1
@history_expansion = external global i32, align 4
@history_expansion_inhibited = common global i32 0, align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"HISTCONTROL\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"HISTIGNORE\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"HISTSIZE\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"500\00", align 1
@.str.6 = private unnamed_addr constant [13 x i8] c"HISTFILESIZE\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"HISTFILE\00", align 1
@history_lines_read_from_file = external global i32, align 4
@history_lines_in_file = common global i32 0, align 4
@history_lines_this_session = common global i32 0, align 4
@history_base = external global i32, align 4
@history_length = external global i32, align 4
@.str.8 = private unnamed_addr constant [22 x i8] c"%s: cannot create: %s\00", align 1
@force_append_history = common global i32 0, align 4
@history_lines_written_to_file = external global i32, align 4
@.str.9 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@hist_verify = common global i32 0, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.10 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@rl_dispatching = external global i32, align 4
@.str.11 = private unnamed_addr constant [11 x i8] c"bashhist.c\00", align 1
@history_reediting = common global i32 0, align 4
@rl_done = external global i32, align 4
@hist_last_line_added = common global i32 0, align 4
@current_command_line_count = external global i32, align 4
@parser_state = external global i32, align 4
@literal_history = common global i32 0, align 4
@dstack = external global %struct.dstack, align 4
@history_control = common global i32 0, align 4
@.str.12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"%s%s%s\00", align 1
@histignore = internal global %struct.ignorevar { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), %struct.ign* null, i32 0, i8* null, i32 (%struct.ign*)* @histignore_item_func }, align 4
@hist_last_line_pushed = common global i32 0, align 4
@dont_save_function_defs = common global i32 0, align 4
@history_expansion_char = external global i8, align 1
@extended_glob = external global i32, align 4
@history_subst_char = external global i8, align 1
@bash_input = external global %struct.BASH_INPUT, align 4

; Function Attrs: noinline nounwind
define void @bash_initialize_history() #0 {
entry:
  store i32 1, i32* @history_quotes_inhibit_expansion, align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i8** @history_search_delimiter_chars, align 4
  store i32 (i8*, i32)* @bash_history_inhibit_expansion, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  call void @sv_histchars(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @bash_history_inhibit_expansion(i8* %string, i32 %i) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  %t = alloca i32, align 4
  %hx = alloca [2 x i8], align 1
  store i8* %string, i8** %string.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i8, i8* @history_expansion_char, align 1
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %hx, i32 0, i32 0
  store i8 %0, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [2 x i8], [2 x i8]* %hx, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  %1 = load i32, i32* %i.addr, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i.addr, align 4
  %sub = sub nsw i32 %3, 1
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 %sub
  %4 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv, 91
  br i1 %cmp3, label %land.lhs.true5, label %if.else

land.lhs.true5:                                   ; preds = %land.lhs.true
  br i1 true, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true5
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %i.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 %6
  %add.ptr6 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  %call = call i8* @mbschr(i8* %add.ptr6, i32 93)
  %cmp7 = icmp ne i8* %call, null
  br i1 %cmp7, label %if.then, label %if.else

cond.false:                                       ; preds = %land.lhs.true5
  br i1 false, label %if.then, label %if.else

if.then:                                          ; preds = %cond.false, %cond.true
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %cond.false, %cond.true, %land.lhs.true, %entry
  %7 = load i32, i32* %i.addr, align 4
  %cmp9 = icmp sgt i32 %7, 1
  br i1 %cmp9, label %land.lhs.true11, label %if.else32

land.lhs.true11:                                  ; preds = %if.else
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load i32, i32* %i.addr, align 4
  %sub12 = sub nsw i32 %9, 1
  %arrayidx13 = getelementptr inbounds i8, i8* %8, i32 %sub12
  %10 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %10 to i32
  %cmp15 = icmp eq i32 %conv14, 123
  br i1 %cmp15, label %land.lhs.true17, label %if.else32

land.lhs.true17:                                  ; preds = %land.lhs.true11
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i32, i32* %i.addr, align 4
  %sub18 = sub nsw i32 %12, 2
  %arrayidx19 = getelementptr inbounds i8, i8* %11, i32 %sub18
  %13 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %13 to i32
  %cmp21 = icmp eq i32 %conv20, 36
  br i1 %cmp21, label %land.lhs.true23, label %if.else32

land.lhs.true23:                                  ; preds = %land.lhs.true17
  br i1 true, label %cond.true24, label %cond.false30

cond.true24:                                      ; preds = %land.lhs.true23
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %i.addr, align 4
  %add.ptr25 = getelementptr inbounds i8, i8* %14, i32 %15
  %add.ptr26 = getelementptr inbounds i8, i8* %add.ptr25, i32 1
  %call27 = call i8* @mbschr(i8* %add.ptr26, i32 125)
  %cmp28 = icmp ne i8* %call27, null
  br i1 %cmp28, label %if.then31, label %if.else32

cond.false30:                                     ; preds = %land.lhs.true23
  br i1 false, label %if.then31, label %if.else32

if.then31:                                        ; preds = %cond.false30, %cond.true24
  store i32 1, i32* %retval, align 4
  br label %return

if.else32:                                        ; preds = %cond.false30, %cond.true24, %land.lhs.true17, %land.lhs.true11, %if.else
  %16 = load i32, i32* %i.addr, align 4
  %cmp33 = icmp sgt i32 %16, 1
  br i1 %cmp33, label %land.lhs.true35, label %if.else47

land.lhs.true35:                                  ; preds = %if.else32
  %17 = load i8*, i8** %string.addr, align 4
  %18 = load i32, i32* %i.addr, align 4
  %sub36 = sub nsw i32 %18, 1
  %arrayidx37 = getelementptr inbounds i8, i8* %17, i32 %sub36
  %19 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %19 to i32
  %cmp39 = icmp eq i32 %conv38, 36
  br i1 %cmp39, label %land.lhs.true41, label %if.else47

land.lhs.true41:                                  ; preds = %land.lhs.true35
  %20 = load i8*, i8** %string.addr, align 4
  %21 = load i32, i32* %i.addr, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %22 to i32
  %cmp44 = icmp eq i32 %conv43, 33
  br i1 %cmp44, label %if.then46, label %if.else47

if.then46:                                        ; preds = %land.lhs.true41
  store i32 1, i32* %retval, align 4
  br label %return

if.else47:                                        ; preds = %land.lhs.true41, %land.lhs.true35, %if.else32
  %23 = load i32, i32* @extended_glob, align 4
  %tobool = icmp ne i32 %23, 0
  br i1 %tobool, label %land.lhs.true48, label %if.else65

land.lhs.true48:                                  ; preds = %if.else47
  %24 = load i32, i32* %i.addr, align 4
  %cmp49 = icmp sgt i32 %24, 1
  br i1 %cmp49, label %land.lhs.true51, label %if.else65

land.lhs.true51:                                  ; preds = %land.lhs.true48
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %i.addr, align 4
  %add = add nsw i32 %26, 1
  %arrayidx52 = getelementptr inbounds i8, i8* %25, i32 %add
  %27 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %27 to i32
  %cmp54 = icmp eq i32 %conv53, 40
  br i1 %cmp54, label %land.lhs.true56, label %if.else65

land.lhs.true56:                                  ; preds = %land.lhs.true51
  br i1 true, label %cond.true57, label %cond.false63

cond.true57:                                      ; preds = %land.lhs.true56
  %28 = load i8*, i8** %string.addr, align 4
  %29 = load i32, i32* %i.addr, align 4
  %add.ptr58 = getelementptr inbounds i8, i8* %28, i32 %29
  %add.ptr59 = getelementptr inbounds i8, i8* %add.ptr58, i32 2
  %call60 = call i8* @mbschr(i8* %add.ptr59, i32 41)
  %cmp61 = icmp ne i8* %call60, null
  br i1 %cmp61, label %if.then64, label %if.else65

cond.false63:                                     ; preds = %land.lhs.true56
  br i1 false, label %if.then64, label %if.else65

if.then64:                                        ; preds = %cond.false63, %cond.true57
  store i32 1, i32* %retval, align 4
  br label %return

if.else65:                                        ; preds = %cond.false63, %cond.true57, %land.lhs.true51, %land.lhs.true48, %if.else47
  %30 = load i8*, i8** %string.addr, align 4
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %hx, i32 0, i32 0
  %call66 = call i32 @skip_to_histexp(i8* %30, i32 0, i8* %arraydecay, i32 513)
  store i32 %call66, i32* %t, align 4
  %cmp67 = icmp sgt i32 %call66, 0
  br i1 %cmp67, label %if.then69, label %if.else80

if.then69:                                        ; preds = %if.else65
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then69
  %31 = load i32, i32* %t, align 4
  %32 = load i32, i32* %i.addr, align 4
  %cmp70 = icmp slt i32 %31, %32
  br i1 %cmp70, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %33 = load i8*, i8** %string.addr, align 4
  %34 = load i32, i32* %t, align 4
  %add72 = add nsw i32 %34, 1
  %arraydecay73 = getelementptr inbounds [2 x i8], [2 x i8]* %hx, i32 0, i32 0
  %call74 = call i32 @skip_to_histexp(i8* %33, i32 %add72, i8* %arraydecay73, i32 513)
  store i32 %call74, i32* %t, align 4
  %35 = load i32, i32* %t, align 4
  %cmp75 = icmp sle i32 %35, 0
  br i1 %cmp75, label %if.then77, label %if.end

if.then77:                                        ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %36 = load i32, i32* %t, align 4
  %37 = load i32, i32* %i.addr, align 4
  %cmp78 = icmp sgt i32 %36, %37
  %conv79 = zext i1 %cmp78 to i32
  store i32 %conv79, i32* %retval, align 4
  br label %return

if.else80:                                        ; preds = %if.else65
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else80, %while.end, %if.then77, %if.then64, %if.then46, %if.then31, %if.then
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

declare void @sv_histchars(i8*) #1

; Function Attrs: noinline nounwind
define void @bash_history_reinit(i32 %interact) #0 {
entry:
  %interact.addr = alloca i32, align 4
  store i32 %interact, i32* %interact.addr, align 4
  %0 = load i32, i32* %interact.addr, align 4
  %cmp = icmp ne i32 %0, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @history_expansion, align 4
  store i32 1, i32* @history_expansion_inhibited, align 4
  store i32 (i8*, i32)* @bash_history_inhibit_expansion, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  %1 = load i32, i32* @enable_history_list, align 4
  store i32 %1, i32* @remember_on_history, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @bash_history_disable() #0 {
entry:
  store i32 0, i32* @remember_on_history, align 4
  store i32 1, i32* @history_expansion_inhibited, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @bash_history_enable() #0 {
entry:
  store i32 1, i32* @enable_history_list, align 4
  store i32 1, i32* @remember_on_history, align 4
  store i32 0, i32* @history_expansion_inhibited, align 4
  store i32 (i8*, i32)* @bash_history_inhibit_expansion, i32 (i8*, i32)** @history_inhibit_expansion_function, align 4
  call void @sv_history_control(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0))
  call void @sv_histignore(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0))
  ret void
}

declare void @sv_history_control(i8*) #1

declare void @sv_histignore(i8*) #1

; Function Attrs: noinline nounwind
define void @load_history() #0 {
entry:
  %hf = alloca i8*, align 4
  %call = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
  call void @sv_histsize(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  %call1 = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  %call2 = call %struct.variable* @set_if_not(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0), i8* %call1)
  call void @sv_histsize(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0))
  %call3 = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call3, i8** %hf, align 4
  %0 = load i8*, i8** %hf, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %hf, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end

land.lhs.true5:                                   ; preds = %land.lhs.true
  %3 = load i8*, i8** %hf, align 4
  %call6 = call i32 @file_exists(i8* %3)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true5
  %4 = load i8*, i8** %hf, align 4
  %call8 = call i32 @read_history(i8* %4)
  %5 = load i32, i32* @history_lines_read_from_file, align 4
  store i32 %5, i32* @history_lines_in_file, align 4
  call void @using_history()
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true5, %land.lhs.true, %entry
  ret void
}

declare %struct.variable* @set_if_not(i8*, i8*) #1

declare void @sv_histsize(i8*) #1

declare i8* @get_string_value(i8*) #1

declare i32 @file_exists(i8*) #1

declare i32 @read_history(i8*) #1

declare void @using_history() #1

; Function Attrs: noinline nounwind
define void @bash_clear_history() #0 {
entry:
  call void @clear_history()
  store i32 0, i32* @history_lines_this_session, align 4
  ret void
}

declare void @clear_history() #1

; Function Attrs: noinline nounwind
define i32 @bash_delete_histent(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %discard = alloca %struct._hist_entry*, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32, i32* %i.addr, align 4
  %call = call %struct._hist_entry* @remove_history(i32 %0)
  store %struct._hist_entry* %call, %struct._hist_entry** %discard, align 4
  %1 = load %struct._hist_entry*, %struct._hist_entry** %discard, align 4
  %tobool = icmp ne %struct._hist_entry* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct._hist_entry*, %struct._hist_entry** %discard, align 4
  %call1 = call i8* @free_history_entry(%struct._hist_entry* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* @history_lines_this_session, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* @history_lines_this_session, align 4
  ret i32 1
}

declare %struct._hist_entry* @remove_history(i32) #1

declare i8* @free_history_entry(%struct._hist_entry*) #1

; Function Attrs: noinline nounwind
define i32 @bash_delete_last_history() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %hlist = alloca %struct._hist_entry**, align 4
  %histent = alloca %struct._hist_entry*, align 4
  %r = alloca i32, align 4
  %call = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call, %struct._hist_entry*** %hlist, align 4
  %0 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %cmp = icmp eq %struct._hist_entry** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %1, i32 %2
  %3 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool = icmp ne %struct._hist_entry* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %dec = add nsw i32 %5, -1
  store i32 %dec, i32* %i, align 4
  %6 = load i32, i32* @history_base, align 4
  %7 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, %7
  %call1 = call %struct._hist_entry* @history_get(i32 %add)
  store %struct._hist_entry* %call1, %struct._hist_entry** %histent, align 4
  %8 = load %struct._hist_entry*, %struct._hist_entry** %histent, align 4
  %cmp2 = icmp eq %struct._hist_entry* %8, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.end
  %9 = load i32, i32* %i, align 4
  %call5 = call i32 @bash_delete_histent(i32 %9)
  store i32 %call5, i32* %r, align 4
  %call6 = call i32 @where_history()
  %10 = load i32, i32* @history_length, align 4
  %cmp7 = icmp sgt i32 %call6, %10
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end4
  %11 = load i32, i32* @history_length, align 4
  %call9 = call i32 @history_set_pos(i32 %11)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end4
  %12 = load i32, i32* %r, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then3, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare %struct._hist_entry** @history_list() #1

declare %struct._hist_entry* @history_get(i32) #1

declare i32 @where_history() #1

declare i32 @history_set_pos(i32) #1

; Function Attrs: noinline nounwind
define i32 @maybe_append_history(i8* %filename) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %fd = alloca i32, align 4
  %result = alloca i32, align 4
  %buf = alloca %struct.stat, align 8
  store i8* %filename, i8** %filename.addr, align 4
  store i32 0, i32* %result, align 4
  %0 = load i32, i32* @history_lines_this_session, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @history_lines_this_session, align 4
  %call = call i32 @where_history()
  %cmp1 = icmp sle i32 %1, %call
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %filename.addr, align 4
  %call2 = call i32 @stat(i8* %2, %struct.stat* %buf)
  %cmp3 = icmp eq i32 %call2, -1
  br i1 %cmp3, label %land.lhs.true4, label %if.end15

land.lhs.true4:                                   ; preds = %if.then
  %call5 = call i32* @__errno_location()
  %3 = load i32, i32* %call5, align 4
  %cmp6 = icmp eq i32 %3, 2
  br i1 %cmp6, label %if.then7, label %if.end15

if.then7:                                         ; preds = %land.lhs.true4
  %4 = load i8*, i8** %filename.addr, align 4
  %call8 = call i32 (i8*, i32, ...) @open(i8* %4, i32 65, i32 384)
  store i32 %call8, i32* %fd, align 4
  %5 = load i32, i32* %fd, align 4
  %cmp9 = icmp slt i32 %5, 0
  br i1 %cmp9, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then7
  %call11 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.8, i32 0, i32 0))
  %6 = load i8*, i8** %filename.addr, align 4
  %call12 = call i32* @__errno_location()
  %7 = load i32, i32* %call12, align 4
  %call13 = call i8* @strerror(i32 %7)
  call void (i8*, ...) @builtin_error(i8* %call11, i8* %6, i8* %call13)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then7
  %8 = load i32, i32* %fd, align 4
  %call14 = call i32 @close(i32 %8)
  br label %if.end15

if.end15:                                         ; preds = %if.end, %land.lhs.true4, %if.then
  %9 = load i32, i32* @history_lines_this_session, align 4
  %10 = load i8*, i8** %filename.addr, align 4
  %call16 = call i32 @append_history(i32 %9, i8* %10)
  store i32 %call16, i32* %result, align 4
  %11 = load i32, i32* @history_lines_this_session, align 4
  %12 = load i32, i32* @history_lines_in_file, align 4
  %add = add nsw i32 %12, %11
  store i32 %add, i32* @history_lines_in_file, align 4
  store i32 0, i32* @history_lines_this_session, align 4
  br label %if.end17

if.else:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* @history_lines_this_session, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.else, %if.end15
  %13 = load i32, i32* %result, align 4
  store i32 %13, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end17, %if.then10
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @stat(i8*, %struct.stat*) #1

declare i32* @__errno_location() #1

declare i32 @open(i8*, i32, ...) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @strerror(i32) #1

declare i32 @close(i32) #1

declare i32 @append_history(i32, i8*) #1

; Function Attrs: noinline nounwind
define i32 @maybe_save_shell_history() #0 {
entry:
  %result = alloca i32, align 4
  %hf = alloca i8*, align 4
  %file = alloca i32, align 4
  store i32 0, i32* %result, align 4
  %0 = load i32, i32* @history_lines_this_session, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end22

if.then:                                          ; preds = %entry
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call, i8** %hf, align 4
  %1 = load i8*, i8** %hf, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end21

land.lhs.true:                                    ; preds = %if.then
  %2 = load i8*, i8** %hf, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then2, label %if.end21

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** %hf, align 4
  %call3 = call i32 @file_exists(i8* %4)
  %cmp4 = icmp eq i32 %call3, 0
  br i1 %cmp4, label %if.then6, label %if.end12

if.then6:                                         ; preds = %if.then2
  %5 = load i8*, i8** %hf, align 4
  %call7 = call i32 (i8*, i32, ...) @open(i8* %5, i32 577, i32 384)
  store i32 %call7, i32* %file, align 4
  %6 = load i32, i32* %file, align 4
  %cmp8 = icmp ne i32 %6, -1
  br i1 %cmp8, label %if.then10, label %if.end

if.then10:                                        ; preds = %if.then6
  %7 = load i32, i32* %file, align 4
  %call11 = call i32 @close(i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then10, %if.then6
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then2
  call void @using_history()
  %8 = load i32, i32* @history_lines_this_session, align 4
  %call13 = call i32 @where_history()
  %cmp14 = icmp sle i32 %8, %call13
  br i1 %cmp14, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* @force_append_history, align 4
  %tobool16 = icmp ne i32 %9, 0
  br i1 %tobool16, label %if.then17, label %if.else

if.then17:                                        ; preds = %lor.lhs.false, %if.end12
  %10 = load i32, i32* @history_lines_this_session, align 4
  %11 = load i8*, i8** %hf, align 4
  %call18 = call i32 @append_history(i32 %10, i8* %11)
  store i32 %call18, i32* %result, align 4
  %12 = load i32, i32* @history_lines_this_session, align 4
  %13 = load i32, i32* @history_lines_in_file, align 4
  %add = add nsw i32 %13, %12
  store i32 %add, i32* @history_lines_in_file, align 4
  br label %if.end20

if.else:                                          ; preds = %lor.lhs.false
  %14 = load i8*, i8** %hf, align 4
  %call19 = call i32 @write_history(i8* %14)
  store i32 %call19, i32* %result, align 4
  %15 = load i32, i32* @history_lines_written_to_file, align 4
  store i32 %15, i32* @history_lines_in_file, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  store i32 0, i32* @history_lines_this_session, align 4
  call void @sv_histsize(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %land.lhs.true, %if.then
  br label %if.end22

if.end22:                                         ; preds = %if.end21, %entry
  %16 = load i32, i32* %result, align 4
  ret i32 %16
}

declare i32 @write_history(i8*) #1

; Function Attrs: noinline nounwind
define i8* @pre_process_line(i8* %line, i32 %print_changes, i32 %addit) #0 {
entry:
  %retval = alloca i8*, align 4
  %line.addr = alloca i8*, align 4
  %print_changes.addr = alloca i32, align 4
  %addit.addr = alloca i32, align 4
  %history_value = alloca i8*, align 4
  %return_value = alloca i8*, align 4
  %expanded = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %print_changes, i32* %print_changes.addr, align 4
  store i32 %addit, i32* %addit.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  store i8* %0, i8** %return_value, align 4
  store i32 0, i32* %expanded, align 4
  %1 = load i32, i32* @history_expansion_inhibited, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.end43, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @history_expansion, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.end43

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i8*, i8** %line.addr, align 4
  %call = call i32 @history_expansion_p(i8* %3)
  %tobool3 = icmp ne i32 %call, 0
  br i1 %tobool3, label %if.then, label %if.end43

if.then:                                          ; preds = %land.lhs.true2
  %4 = load i8*, i8** %line.addr, align 4
  %call4 = call i32 @history_expand(i8* %4, i8** %history_value)
  store i32 %call4, i32* %expanded, align 4
  %5 = load i32, i32* %expanded, align 4
  %tobool5 = icmp ne i32 %5, 0
  br i1 %tobool5, label %if.then6, label %if.end42

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %print_changes.addr, align 4
  %tobool7 = icmp ne i32 %6, 0
  br i1 %tobool7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %if.then6
  %7 = load i32, i32* %expanded, align 4
  %cmp = icmp slt i32 %7, 0
  br i1 %cmp, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.then8
  %8 = load i8*, i8** %history_value, align 4
  call void (i8*, ...) @internal_error(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* %8)
  br label %if.end14

if.else:                                          ; preds = %if.then8
  %9 = load i32, i32* @hist_verify, align 4
  %cmp10 = icmp eq i32 %9, 0
  br i1 %cmp10, label %if.then12, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %10 = load i32, i32* %expanded, align 4
  %cmp11 = icmp eq i32 %10, 2
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %lor.lhs.false, %if.else
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %12 = load i8*, i8** %history_value, align 4
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* %12)
  br label %if.end

if.end:                                           ; preds = %if.then12, %lor.lhs.false
  br label %if.end14

if.end14:                                         ; preds = %if.end, %if.then9
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then6
  %13 = load i32, i32* %expanded, align 4
  %cmp16 = icmp slt i32 %13, 0
  br i1 %cmp16, label %if.then19, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end15
  %14 = load i32, i32* %expanded, align 4
  %cmp18 = icmp eq i32 %14, 2
  br i1 %cmp18, label %if.then19, label %if.end35

if.then19:                                        ; preds = %lor.lhs.false17, %if.end15
  %15 = load i32, i32* %expanded, align 4
  %cmp20 = icmp eq i32 %15, 2
  br i1 %cmp20, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %if.then19
  %16 = load i32, i32* @rl_dispatching, align 4
  %cmp22 = icmp eq i32 %16, 0
  br i1 %cmp22, label %land.lhs.true23, label %if.end26

land.lhs.true23:                                  ; preds = %land.lhs.true21
  %17 = load i8*, i8** %history_value, align 4
  %18 = load i8, i8* %17, align 1
  %conv = sext i8 %18 to i32
  %tobool24 = icmp ne i32 %conv, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true23
  %19 = load i8*, i8** %history_value, align 4
  call void @maybe_add_history(i8* %19)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %land.lhs.true23, %land.lhs.true21, %if.then19
  %20 = load i8*, i8** %history_value, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 559)
  %21 = load i32, i32* @history_reediting, align 4
  %tobool27 = icmp ne i32 %21, 0
  br i1 %tobool27, label %land.lhs.true28, label %if.end34

land.lhs.true28:                                  ; preds = %if.end26
  %22 = load i32, i32* %expanded, align 4
  %cmp29 = icmp slt i32 %22, 0
  br i1 %cmp29, label %land.lhs.true31, label %if.end34

land.lhs.true31:                                  ; preds = %land.lhs.true28
  %23 = load i32, i32* @rl_done, align 4
  %tobool32 = icmp ne i32 %23, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %land.lhs.true31
  %24 = load i8*, i8** %line.addr, align 4
  call void @re_edit(i8* %24)
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %land.lhs.true31, %land.lhs.true28, %if.end26
  store i8* null, i8** %retval, align 4
  br label %return

if.end35:                                         ; preds = %lor.lhs.false17
  %25 = load i32, i32* @hist_verify, align 4
  %tobool36 = icmp ne i32 %25, 0
  br i1 %tobool36, label %land.lhs.true37, label %if.end41

land.lhs.true37:                                  ; preds = %if.end35
  %26 = load i32, i32* %expanded, align 4
  %cmp38 = icmp eq i32 %26, 1
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %land.lhs.true37
  %27 = load i8*, i8** %history_value, align 4
  call void @re_edit(i8* %27)
  %28 = load i8*, i8** %history_value, align 4
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 574)
  store i8* null, i8** %retval, align 4
  br label %return

if.end41:                                         ; preds = %land.lhs.true37, %if.end35
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then
  store i32 1, i32* %expanded, align 4
  %29 = load i8*, i8** %history_value, align 4
  store i8* %29, i8** %return_value, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %land.lhs.true2, %land.lhs.true, %entry
  %30 = load i32, i32* %addit.addr, align 4
  %tobool44 = icmp ne i32 %30, 0
  br i1 %tobool44, label %land.lhs.true45, label %if.end51

land.lhs.true45:                                  ; preds = %if.end43
  %31 = load i32, i32* @remember_on_history, align 4
  %tobool46 = icmp ne i32 %31, 0
  br i1 %tobool46, label %land.lhs.true47, label %if.end51

land.lhs.true47:                                  ; preds = %land.lhs.true45
  %32 = load i8*, i8** %return_value, align 4
  %33 = load i8, i8* %32, align 1
  %conv48 = sext i8 %33 to i32
  %tobool49 = icmp ne i32 %conv48, 0
  br i1 %tobool49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %land.lhs.true47
  %34 = load i8*, i8** %return_value, align 4
  call void @maybe_add_history(i8* %34)
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %land.lhs.true47, %land.lhs.true45, %if.end43
  %35 = load i8*, i8** %return_value, align 4
  store i8* %35, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end51, %if.then40, %if.end34
  %36 = load i8*, i8** %retval, align 4
  ret i8* %36
}

; Function Attrs: noinline nounwind
define internal i32 @history_expansion_p(i8* %line) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %2 = load i8, i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %5 = load i8, i8* @history_expansion_char, align 1
  %conv1 = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv3 = sext i8 %7 to i32
  %8 = load i8, i8* @history_subst_char, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp eq i32 %conv3, %conv4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i32 @history_expand(i8*, i8**) #1

declare void @internal_error(i8*, ...) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define void @maybe_add_history(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 0, i32* @hist_last_line_added, align 4
  %0 = load i32, i32* @current_command_line_count, align 4
  %cmp = icmp sgt i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @current_command_first_line_saved, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %2 = load i32, i32* @parser_state, align 4
  %and = and i32 %2, 131072
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %3 = load i32, i32* @literal_history, align 4
  %tobool2 = icmp ne i32 %3, 0
  br i1 %tobool2, label %if.then7, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* getelementptr inbounds (%struct.dstack, %struct.dstack* @dstack, i32 0, i32 1), align 4
  %cmp4 = icmp ne i32 %4, 0
  br i1 %cmp4, label %if.then7, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false3
  %5 = load i8*, i8** %line.addr, align 4
  %call = call i32 @shell_comment(i8* %5)
  %cmp6 = icmp eq i32 %call, 0
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %lor.lhs.false5, %lor.lhs.false3, %lor.lhs.false, %land.lhs.true
  %6 = load i8*, i8** %line.addr, align 4
  call void @bash_add_history(i8* %6)
  br label %if.end

if.end:                                           ; preds = %if.then7, %lor.lhs.false5, %if.then
  br label %return

if.end8:                                          ; preds = %entry
  %7 = load i8*, i8** %line.addr, align 4
  %call9 = call i32 @check_add_history(i8* %7, i32 0)
  store i32 %call9, i32* @current_command_first_line_saved, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.end
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @re_edit(i8* %text) #0 {
entry:
  %text.addr = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %text.addr, align 4
  %call = call i32 @bash_re_edit(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @shell_comment(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** %p, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %6 = load i8*, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %8 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true, %for.cond
  %9 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %8, %lor.end ]
  br i1 %9, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %11 = load i8*, i8** %p, align 4
  %tobool7 = icmp ne i8* %11, null
  br i1 %tobool7, label %land.rhs8, label %land.end12

land.rhs8:                                        ; preds = %for.end
  %12 = load i8*, i8** %p, align 4
  %13 = load i8, i8* %12, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp eq i32 %conv9, 35
  br label %land.end12

land.end12:                                       ; preds = %land.rhs8, %for.end
  %14 = phi i1 [ false, %for.end ], [ %cmp10, %land.rhs8 ]
  %land.ext = zext i1 %14 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define void @bash_add_history(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %add_it = alloca i32, align 4
  %offset = alloca i32, align 4
  %curlen = alloca i32, align 4
  %current = alloca %struct._hist_entry*, align 4
  %old = alloca %struct._hist_entry*, align 4
  %chars_to_add = alloca i8*, align 4
  %new_line = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 1, i32* %add_it, align 4
  %0 = load i32, i32* @command_oriented_history, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end67

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @current_command_line_count, align 4
  %cmp = icmp sgt i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end67

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @parser_state, align 4
  %and = and i32 %2, 131072
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %if.then
  %3 = load i32, i32* @literal_history, align 4
  %tobool3 = icmp ne i32 %3, 0
  br i1 %tobool3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %4 = load i32, i32* @current_command_line_count, align 4
  %cmp5 = icmp sgt i32 %4, 2
  br i1 %cmp5, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %5 = load i8*, i8** %line.addr, align 4
  %6 = load i8*, i8** %line.addr, align 4
  %call = call i32 @strlen(i8* %6)
  %sub = sub i32 %call, 1
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %sub
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv, 10
  br i1 %cmp7, label %if.then9, label %if.else

if.then9:                                         ; preds = %land.lhs.true6
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i32 0, i32 0), i8** %chars_to_add, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true6, %land.lhs.true4, %land.lhs.true2, %if.then
  %8 = load i32, i32* @literal_history, align 4
  %tobool10 = icmp ne i32 %8, 0
  br i1 %tobool10, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %9 = load i8*, i8** %line.addr, align 4
  %call11 = call i8* @history_delimiting_chars(i8* %9)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i32 0, i32 0), %cond.true ], [ %call11, %cond.false ]
  store i8* %cond, i8** %chars_to_add, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then9
  call void @using_history()
  %call12 = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call12, %struct._hist_entry** %current, align 4
  %10 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %tobool13 = icmp ne %struct._hist_entry* %10, null
  br i1 %tobool13, label %if.then14, label %if.end66

if.then14:                                        ; preds = %if.end
  %11 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line15 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 0
  %12 = load i8*, i8** %line15, align 4
  %call16 = call i32 @strlen(i8* %12)
  store i32 %call16, i32* %curlen, align 4
  %13 = load i32, i32* getelementptr inbounds (%struct.dstack, %struct.dstack* @dstack, i32 0, i32 1), align 4
  %cmp17 = icmp eq i32 %13, 0
  br i1 %cmp17, label %land.lhs.true19, label %if.end37

land.lhs.true19:                                  ; preds = %if.then14
  %14 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line20 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %14, i32 0, i32 0
  %15 = load i8*, i8** %line20, align 4
  %16 = load i32, i32* %curlen, align 4
  %sub21 = sub nsw i32 %16, 1
  %arrayidx22 = getelementptr inbounds i8, i8* %15, i32 %sub21
  %17 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %17 to i32
  %cmp24 = icmp eq i32 %conv23, 92
  br i1 %cmp24, label %land.lhs.true26, label %if.end37

land.lhs.true26:                                  ; preds = %land.lhs.true19
  %18 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line27 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %18, i32 0, i32 0
  %19 = load i8*, i8** %line27, align 4
  %20 = load i32, i32* %curlen, align 4
  %sub28 = sub nsw i32 %20, 2
  %arrayidx29 = getelementptr inbounds i8, i8* %19, i32 %sub28
  %21 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %21 to i32
  %cmp31 = icmp ne i32 %conv30, 92
  br i1 %cmp31, label %if.then33, label %if.end37

if.then33:                                        ; preds = %land.lhs.true26
  %22 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line34 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %22, i32 0, i32 0
  %23 = load i8*, i8** %line34, align 4
  %24 = load i32, i32* %curlen, align 4
  %sub35 = sub nsw i32 %24, 1
  %arrayidx36 = getelementptr inbounds i8, i8* %23, i32 %sub35
  store i8 0, i8* %arrayidx36, align 1
  %25 = load i32, i32* %curlen, align 4
  %dec = add nsw i32 %25, -1
  store i32 %dec, i32* %curlen, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.12, i32 0, i32 0), i8** %chars_to_add, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then33, %land.lhs.true26, %land.lhs.true19, %if.then14
  %26 = load i32, i32* getelementptr inbounds (%struct.dstack, %struct.dstack* @dstack, i32 0, i32 1), align 4
  %cmp38 = icmp eq i32 %26, 0
  br i1 %cmp38, label %land.lhs.true40, label %if.end52

land.lhs.true40:                                  ; preds = %if.end37
  %27 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line41 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %27, i32 0, i32 0
  %28 = load i8*, i8** %line41, align 4
  %29 = load i32, i32* %curlen, align 4
  %sub42 = sub nsw i32 %29, 1
  %arrayidx43 = getelementptr inbounds i8, i8* %28, i32 %sub42
  %30 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %30 to i32
  %cmp45 = icmp eq i32 %conv44, 10
  br i1 %cmp45, label %land.lhs.true47, label %if.end52

land.lhs.true47:                                  ; preds = %land.lhs.true40
  %31 = load i8*, i8** %chars_to_add, align 4
  %32 = load i8, i8* %31, align 1
  %conv48 = sext i8 %32 to i32
  %cmp49 = icmp eq i32 %conv48, 59
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %land.lhs.true47
  %33 = load i8*, i8** %chars_to_add, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %incdec.ptr, i8** %chars_to_add, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %land.lhs.true47, %land.lhs.true40, %if.end37
  %34 = load i32, i32* %curlen, align 4
  %add = add nsw i32 1, %34
  %35 = load i8*, i8** %line.addr, align 4
  %call53 = call i32 @strlen(i8* %35)
  %add54 = add i32 %add, %call53
  %36 = load i8*, i8** %chars_to_add, align 4
  %call55 = call i32 @strlen(i8* %36)
  %add56 = add i32 %add54, %call55
  %call57 = call i8* @sh_xmalloc(i32 %add56, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 837)
  store i8* %call57, i8** %new_line, align 4
  %37 = load i8*, i8** %new_line, align 4
  %38 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %line58 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %38, i32 0, i32 0
  %39 = load i8*, i8** %line58, align 4
  %40 = load i8*, i8** %chars_to_add, align 4
  %41 = load i8*, i8** %line.addr, align 4
  %call59 = call i32 (i8*, i8*, ...) @sprintf(i8* %37, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0), i8* %39, i8* %40, i8* %41)
  %call60 = call i32 @where_history()
  store i32 %call60, i32* %offset, align 4
  %42 = load i32, i32* %offset, align 4
  %43 = load i8*, i8** %new_line, align 4
  %44 = load %struct._hist_entry*, %struct._hist_entry** %current, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %44, i32 0, i32 2
  %45 = load i8*, i8** %data, align 4
  %call61 = call %struct._hist_entry* @replace_history_entry(i32 %42, i8* %43, i8* %45)
  store %struct._hist_entry* %call61, %struct._hist_entry** %old, align 4
  %46 = load i8*, i8** %new_line, align 4
  call void @sh_xfree(i8* %46, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 841)
  %47 = load %struct._hist_entry*, %struct._hist_entry** %old, align 4
  %tobool62 = icmp ne %struct._hist_entry* %47, null
  br i1 %tobool62, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end52
  %48 = load %struct._hist_entry*, %struct._hist_entry** %old, align 4
  %call64 = call i8* @free_history_entry(%struct._hist_entry* %48)
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end52
  store i32 0, i32* %add_it, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.end65, %if.end
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %land.lhs.true, %entry
  %49 = load i32, i32* %add_it, align 4
  %tobool68 = icmp ne i32 %49, 0
  br i1 %tobool68, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end67
  %50 = load i8*, i8** %line.addr, align 4
  call void @really_add_history(i8* %50)
  br label %if.end70

if.end70:                                         ; preds = %if.then69, %if.end67
  call void @using_history()
  ret void
}

; Function Attrs: noinline nounwind
define i32 @check_add_history(i8* %line, i32 %force) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %force.addr = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 %force, i32* %force.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  %call = call i32 @check_history_control(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 4
  %call1 = call i32 @history_should_ignore(i8* %1)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* @history_control, align 4
  %and = and i32 %2, 4
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %3 = load i8*, i8** %line.addr, align 4
  call void @hc_erasedups(i8* %3)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %4 = load i32, i32* %force.addr, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %5 = load i8*, i8** %line.addr, align 4
  call void @really_add_history(i8* %5)
  call void @using_history()
  br label %if.end6

if.else:                                          ; preds = %if.end
  %6 = load i8*, i8** %line.addr, align 4
  call void @bash_add_history(i8* %6)
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then5
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.end6
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define internal i32 @check_history_control(i8* %line) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  %r = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load i32, i32* @history_control, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @history_control, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %2 = load i8*, i8** %line.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 32
  br i1 %cmp1, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %land.lhs.true, %if.end
  %4 = load i32, i32* @history_control, align 4
  %and5 = and i32 %4, 2
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end26

if.then7:                                         ; preds = %if.end4
  call void @using_history()
  %call = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %temp, align 4
  %5 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %cmp8 = icmp eq %struct._hist_entry* %5, null
  br i1 %cmp8, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then7
  %6 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line10 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 0
  %7 = load i8*, i8** %line10, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv11 = sext i8 %8 to i32
  %9 = load i8*, i8** %line.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %10 to i32
  %cmp14 = icmp eq i32 %conv11, %conv13
  br i1 %cmp14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %11 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line16 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 0
  %12 = load i8*, i8** %line16, align 4
  %13 = load i8*, i8** %line.addr, align 4
  %call17 = call i32 @strcmp(i8* %12, i8* %13)
  %cmp18 = icmp eq i32 %call17, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %14 = phi i1 [ false, %lor.rhs ], [ %cmp18, %land.rhs ]
  %land.ext = zext i1 %14 to i32
  %cmp20 = icmp eq i32 %land.ext, 0
  br label %lor.end

lor.end:                                          ; preds = %land.end, %if.then7
  %15 = phi i1 [ true, %if.then7 ], [ %cmp20, %land.end ]
  %lor.ext = zext i1 %15 to i32
  store i32 %lor.ext, i32* %r, align 4
  call void @using_history()
  %16 = load i32, i32* %r, align 4
  %cmp22 = icmp eq i32 %16, 0
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %lor.end
  %17 = load i32, i32* %r, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

if.end25:                                         ; preds = %lor.end
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end26, %if.then24, %if.then3, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind
define internal i32 @history_should_ignore(i8* %line) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %match = alloca i32, align 4
  %npat = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 2), align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %match, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 2), align 4
  %cmp1 = icmp slt i32 %1, %2
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 1), align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.ign, %struct.ign* %3, i32 %4
  %flags = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx, i32 0, i32 2
  %5 = load i32, i32* %flags, align 4
  %and = and i32 %5, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then2, label %if.else

if.then2:                                         ; preds = %for.body
  %6 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 1), align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.ign, %struct.ign* %6, i32 %7
  %val = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx3, i32 0, i32 0
  %8 = load i8*, i8** %val, align 4
  %call = call i8* @expand_histignore_pattern(i8* %8)
  store i8* %call, i8** %npat, align 4
  br label %if.end6

if.else:                                          ; preds = %for.body
  %9 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 1), align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds %struct.ign, %struct.ign* %9, i32 %10
  %val5 = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx4, i32 0, i32 0
  %11 = load i8*, i8** %val5, align 4
  store i8* %11, i8** %npat, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then2
  %12 = load i8*, i8** %npat, align 4
  %13 = load i8*, i8** %line.addr, align 4
  %14 = load i32, i32* @extended_glob, align 4
  %tobool7 = icmp ne i32 %14, 0
  %cond = select i1 %tobool7, i32 32, i32 0
  %call8 = call i32 @strmatch(i8* %12, i8* %13, i32 %cond)
  %cmp9 = icmp ne i32 %call8, 1
  %conv = zext i1 %cmp9 to i32
  store i32 %conv, i32* %match, align 4
  %15 = load %struct.ign*, %struct.ign** getelementptr inbounds (%struct.ignorevar, %struct.ignorevar* @histignore, i32 0, i32 1), align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds %struct.ign, %struct.ign* %15, i32 %16
  %flags11 = getelementptr inbounds %struct.ign, %struct.ign* %arrayidx10, i32 0, i32 2
  %17 = load i32, i32* %flags11, align 4
  %and12 = and i32 %17, 1
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end6
  %18 = load i8*, i8** %npat, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 970)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end6
  %19 = load i32, i32* %match, align 4
  %tobool16 = icmp ne i32 %19, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  br label %for.end

if.end18:                                         ; preds = %if.end15
  br label %for.inc

for.inc:                                          ; preds = %if.end18
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then17, %for.cond
  %21 = load i32, i32* %match, align 4
  store i32 %21, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define internal void @hc_erasedups(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  %r = alloca i32, align 4
  store i8* %line, i8** %line.addr, align 4
  call void @using_history()
  br label %while.cond

while.cond:                                       ; preds = %if.end14, %entry
  %call = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %temp, align 4
  %tobool = icmp ne %struct._hist_entry* %call, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %0 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line1 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %0, i32 0, i32 0
  %1 = load i8*, i8** %line1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i8*, i8** %line.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, %conv3
  br i1 %cmp, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %while.body
  %5 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line5 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 0
  %6 = load i8*, i8** %line5, align 4
  %7 = load i8*, i8** %line.addr, align 4
  %call6 = call i32 @strcmp(i8* %6, i8* %7)
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then, label %if.end14

if.then:                                          ; preds = %land.lhs.true
  %call9 = call i32 @where_history()
  store i32 %call9, i32* %r, align 4
  %8 = load i32, i32* %r, align 4
  %call10 = call %struct._hist_entry* @remove_history(i32 %8)
  store %struct._hist_entry* %call10, %struct._hist_entry** %temp, align 4
  %9 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %tobool11 = icmp ne %struct._hist_entry* %9, null
  br i1 %tobool11, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.then
  %10 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %call13 = call i8* @free_history_entry(%struct._hist_entry* %10)
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.then
  br label %if.end14

if.end14:                                         ; preds = %if.end, %land.lhs.true, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @using_history()
  ret void
}

; Function Attrs: noinline nounwind
define internal void @really_add_history(i8* %line) #0 {
entry:
  %line.addr = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  store i32 1, i32* @hist_last_line_added, align 4
  store i32 0, i32* @hist_last_line_pushed, align 4
  %0 = load i8*, i8** %line.addr, align 4
  call void @add_history(i8* %0)
  %1 = load i32, i32* @history_lines_this_session, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @history_lines_this_session, align 4
  ret void
}

declare i32 @strlen(i8*) #1

declare i8* @history_delimiting_chars(i8*) #1

declare %struct._hist_entry* @previous_history() #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare %struct._hist_entry* @replace_history_entry(i32, i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @history_number() #0 {
entry:
  call void @using_history()
  %0 = load i32, i32* @remember_on_history, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* @history_base, align 4
  %call = call i32 @where_history()
  %add = add nsw i32 %1, %call
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ 1, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define void @setup_history_ignore(i8* %varname) #0 {
entry:
  %varname.addr = alloca i8*, align 4
  store i8* %varname, i8** %varname.addr, align 4
  call void @setup_ignore_patterns(%struct.ignorevar* @histignore)
  ret void
}

declare void @setup_ignore_patterns(%struct.ignorevar*) #1

; Function Attrs: noinline nounwind
define i8* @last_history_line() #0 {
entry:
  %retval = alloca i8*, align 4
  %he = alloca %struct._hist_entry*, align 4
  %call = call %struct._hist_entry* @last_history_entry()
  store %struct._hist_entry* %call, %struct._hist_entry** %he, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %he, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %he, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 0
  %2 = load i8*, i8** %line, align 4
  store i8* %2, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i8*, i8** %retval, align 4
  ret i8* %3
}

; Function Attrs: noinline nounwind
define internal %struct._hist_entry* @last_history_entry() #0 {
entry:
  %he = alloca %struct._hist_entry*, align 4
  call void @using_history()
  %call = call %struct._hist_entry* @previous_history()
  store %struct._hist_entry* %call, %struct._hist_entry** %he, align 4
  call void @using_history()
  %0 = load %struct._hist_entry*, %struct._hist_entry** %he, align 4
  ret %struct._hist_entry* %0
}

declare i8* @mbschr(i8*, i32) #1

declare i32 @skip_to_histexp(i8*, i32, i8*, i32) #1

declare i32 @bash_re_edit(i8*) #1

declare i32 @strcmp(i8*, i8*) #1

declare void @add_history(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @histignore_item_func(%struct.ign* %ign) #0 {
entry:
  %ign.addr = alloca %struct.ign*, align 4
  store %struct.ign* %ign, %struct.ign** %ign.addr, align 4
  %0 = load %struct.ign*, %struct.ign** %ign.addr, align 4
  %val = getelementptr inbounds %struct.ign, %struct.ign* %0, i32 0, i32 0
  %1 = load i8*, i8** %val, align 4
  %call = call i32 @should_expand(i8* %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.ign*, %struct.ign** %ign.addr, align 4
  %flags = getelementptr inbounds %struct.ign, %struct.ign* %2, i32 0, i32 2
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

; Function Attrs: noinline nounwind
define internal i32 @should_expand(i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %p, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 92
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %7 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %if.end8

if.else:                                          ; preds = %for.body
  %8 = load i8*, i8** %p, align 4
  %9 = load i8, i8* %8, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv4, 38
  br i1 %cmp5, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %10 = load i8*, i8** %p, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr9, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then7
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i8* @expand_histignore_pattern(i8* %pat) #0 {
entry:
  %retval = alloca i8*, align 4
  %pat.addr = alloca i8*, align 4
  %phe = alloca %struct._hist_entry*, align 4
  %ret = alloca i8*, align 4
  store i8* %pat, i8** %pat.addr, align 4
  %call = call %struct._hist_entry* @last_history_entry()
  store %struct._hist_entry* %call, %struct._hist_entry** %phe, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %phe, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %pat.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i32 941)
  %2 = load i8*, i8** %pat.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  store i8* %call3, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %pat.addr, align 4
  %4 = load %struct._hist_entry*, %struct._hist_entry** %phe, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %4, i32 0, i32 0
  %5 = load i8*, i8** %line, align 4
  %call4 = call i8* @strcreplace(i8* %3, i32 38, i8* %5, i32 1)
  store i8* %call4, i8** %ret, align 4
  %6 = load i8*, i8** %ret, align 4
  store i8* %6, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i8*, i8** %retval, align 4
  ret i8* %7
}

declare i32 @strmatch(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @strcreplace(i8*, i32, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
