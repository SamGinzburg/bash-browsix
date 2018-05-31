; ModuleID = 'history.c'
source_filename = "history.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._hist_entry = type { i8*, i8*, i8* }
%struct._hist_state = type { %struct._hist_entry**, i32, i32, i32, i32 }

@history_base = global i32 1, align 4
@the_history = internal global %struct._hist_entry** null, align 4
@history_offset = common global i32 0, align 4
@history_length = common global i32 0, align 4
@history_size = internal global i32 0, align 4
@history_stifled = internal global i32 0, align 4
@history_comment_char = external global i8, align 1
@history_max_entries = common global i32 0, align 4
@max_input_history = common global i32 0, align 4
@.str = private unnamed_addr constant [5 x i8] c"X%lu\00", align 1

; Function Attrs: noinline nounwind
define %struct._hist_state* @history_get_history_state() #0 {
entry:
  %state = alloca %struct._hist_state*, align 4
  %call = call i8* @xmalloc(i32 20)
  %0 = bitcast i8* %call to %struct._hist_state*
  store %struct._hist_state* %0, %struct._hist_state** %state, align 4
  %1 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %2 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %entries = getelementptr inbounds %struct._hist_state, %struct._hist_state* %2, i32 0, i32 0
  store %struct._hist_entry** %1, %struct._hist_entry*** %entries, align 4
  %3 = load i32, i32* @history_offset, align 4
  %4 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %offset = getelementptr inbounds %struct._hist_state, %struct._hist_state* %4, i32 0, i32 1
  store i32 %3, i32* %offset, align 4
  %5 = load i32, i32* @history_length, align 4
  %6 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %length = getelementptr inbounds %struct._hist_state, %struct._hist_state* %6, i32 0, i32 2
  store i32 %5, i32* %length, align 4
  %7 = load i32, i32* @history_size, align 4
  %8 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %size = getelementptr inbounds %struct._hist_state, %struct._hist_state* %8, i32 0, i32 3
  store i32 %7, i32* %size, align 4
  %9 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %flags = getelementptr inbounds %struct._hist_state, %struct._hist_state* %9, i32 0, i32 4
  store i32 0, i32* %flags, align 4
  %10 = load i32, i32* @history_stifled, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %11 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  %flags1 = getelementptr inbounds %struct._hist_state, %struct._hist_state* %11, i32 0, i32 4
  %12 = load i32, i32* %flags1, align 4
  %or = or i32 %12, 1
  store i32 %or, i32* %flags1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = load %struct._hist_state*, %struct._hist_state** %state, align 4
  ret %struct._hist_state* %13
}

declare i8* @xmalloc(i32) #1

; Function Attrs: noinline nounwind
define void @history_set_history_state(%struct._hist_state* %state) #0 {
entry:
  %state.addr = alloca %struct._hist_state*, align 4
  store %struct._hist_state* %state, %struct._hist_state** %state.addr, align 4
  %0 = load %struct._hist_state*, %struct._hist_state** %state.addr, align 4
  %entries = getelementptr inbounds %struct._hist_state, %struct._hist_state* %0, i32 0, i32 0
  %1 = load %struct._hist_entry**, %struct._hist_entry*** %entries, align 4
  store %struct._hist_entry** %1, %struct._hist_entry*** @the_history, align 4
  %2 = load %struct._hist_state*, %struct._hist_state** %state.addr, align 4
  %offset = getelementptr inbounds %struct._hist_state, %struct._hist_state* %2, i32 0, i32 1
  %3 = load i32, i32* %offset, align 4
  store i32 %3, i32* @history_offset, align 4
  %4 = load %struct._hist_state*, %struct._hist_state** %state.addr, align 4
  %length = getelementptr inbounds %struct._hist_state, %struct._hist_state* %4, i32 0, i32 2
  %5 = load i32, i32* %length, align 4
  store i32 %5, i32* @history_length, align 4
  %6 = load %struct._hist_state*, %struct._hist_state** %state.addr, align 4
  %size = getelementptr inbounds %struct._hist_state, %struct._hist_state* %6, i32 0, i32 3
  %7 = load i32, i32* %size, align 4
  store i32 %7, i32* @history_size, align 4
  %8 = load %struct._hist_state*, %struct._hist_state** %state.addr, align 4
  %flags = getelementptr inbounds %struct._hist_state, %struct._hist_state* %8, i32 0, i32 4
  %9 = load i32, i32* %flags, align 4
  %and = and i32 %9, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* @history_stifled, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @using_history() #0 {
entry:
  %0 = load i32, i32* @history_length, align 4
  store i32 %0, i32* @history_offset, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @history_total_bytes() #0 {
entry:
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %tobool = icmp ne %struct._hist_entry** %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %1, i32 %2
  %3 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool1 = icmp ne %struct._hist_entry* %3, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %5, i32 %6
  %7 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx2, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %7, i32 0, i32 0
  %8 = load i8*, i8** %line, align 4
  %call = call i32 @strlen(i8* %8)
  %9 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %9, i32 %10
  %11 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx3, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 1
  %12 = load i8*, i8** %timestamp, align 4
  %call4 = call i32 @strlen(i8* %12)
  %add = add i32 %call, %call4
  %13 = load i32, i32* %result, align 4
  %add5 = add i32 %13, %add
  store i32 %add5, i32* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %15 = load i32, i32* %result, align 4
  ret i32 %15
}

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @where_history() #0 {
entry:
  %0 = load i32, i32* @history_offset, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define i32 @history_set_pos(i32 %pos) #0 {
entry:
  %retval = alloca i32, align 4
  %pos.addr = alloca i32, align 4
  store i32 %pos, i32* %pos.addr, align 4
  %0 = load i32, i32* %pos.addr, align 4
  %1 = load i32, i32* @history_length, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %pos.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %tobool = icmp ne %struct._hist_entry** %3, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %4 = load i32, i32* %pos.addr, align 4
  store i32 %4, i32* @history_offset, align 4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define %struct._hist_entry** @history_list() #0 {
entry:
  %0 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  ret %struct._hist_entry** %0
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @current_history() #0 {
entry:
  %0 = load i32, i32* @history_offset, align 4
  %1 = load i32, i32* @history_length, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %cmp1 = icmp eq %struct._hist_entry** %2, null
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %3 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %4 = load i32, i32* @history_offset, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %3, i32 %4
  %5 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._hist_entry* [ null, %cond.true ], [ %5, %cond.false ]
  ret %struct._hist_entry* %cond
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @previous_history() #0 {
entry:
  %0 = load i32, i32* @history_offset, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %2 = load i32, i32* @history_offset, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @history_offset, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %1, i32 %dec
  %3 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._hist_entry* [ %3, %cond.true ], [ null, %cond.false ]
  ret %struct._hist_entry* %cond
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @next_history() #0 {
entry:
  %0 = load i32, i32* @history_offset, align 4
  %1 = load i32, i32* @history_length, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %3 = load i32, i32* @history_offset, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @history_offset, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %2, i32 %inc
  %4 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._hist_entry* [ null, %cond.true ], [ %4, %cond.false ]
  ret %struct._hist_entry* %cond
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @history_get(i32 %offset) #0 {
entry:
  %offset.addr = alloca i32, align 4
  %local_index = alloca i32, align 4
  store i32 %offset, i32* %offset.addr, align 4
  %0 = load i32, i32* %offset.addr, align 4
  %1 = load i32, i32* @history_base, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %local_index, align 4
  %2 = load i32, i32* %local_index, align 4
  %3 = load i32, i32* @history_length, align 4
  %cmp = icmp sge i32 %2, %3
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i32, i32* %local_index, align 4
  %cmp1 = icmp slt i32 %4, 0
  br i1 %cmp1, label %cond.true, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %5 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %cmp3 = icmp eq %struct._hist_entry** %5, null
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false2
  %6 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %7 = load i32, i32* %local_index, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %6, i32 %7
  %8 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._hist_entry* [ null, %cond.true ], [ %8, %cond.false ]
  ret %struct._hist_entry* %cond
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @alloc_history_entry(i8* %string, i8* %ts) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %ts.addr = alloca i8*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %ts, i8** %ts.addr, align 4
  %call = call i8* @xmalloc(i32 12)
  %0 = bitcast i8* %call to %struct._hist_entry*
  store %struct._hist_entry* %0, %struct._hist_entry** %temp, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @xmalloc(i32 %add)
  %3 = load i8*, i8** %string.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i8*, i8** %string.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ %4, %cond.false ]
  %5 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 0
  store i8* %cond, i8** %line, align 4
  %6 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 2
  store i8* null, i8** %data, align 4
  %7 = load i8*, i8** %ts.addr, align 4
  %8 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 1
  store i8* %7, i8** %timestamp, align 4
  %9 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  ret %struct._hist_entry* %9
}

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i32 @history_get_time(%struct._hist_entry* %hist) #0 {
entry:
  %retval = alloca i32, align 4
  %hist.addr = alloca %struct._hist_entry*, align 4
  %ts = alloca i8*, align 4
  %t = alloca i32, align 4
  store %struct._hist_entry* %hist, %struct._hist_entry** %hist.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 1
  %2 = load i8*, i8** %timestamp, align 4
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp2 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 1
  %4 = load i8*, i8** %timestamp2, align 4
  store i8* %4, i8** %ts, align 4
  %5 = load i8*, i8** %ts, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* @history_comment_char, align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp ne i32 %conv, %conv3
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %8 = load i8*, i8** %ts, align 4
  %add.ptr = getelementptr inbounds i8, i8* %8, i32 1
  %call8 = call i32 @strtol(i8* %add.ptr, i8** null, i32 10)
  store i32 %call8, i32* %t, align 4
  %call9 = call i32* @__errno_location()
  %9 = load i32, i32* %call9, align 4
  %cmp10 = icmp eq i32 %9, 34
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  store i32 0, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end7
  %10 = load i32, i32* %t, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end13, %if.then12, %if.then6, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i32* @__errno_location() #1

declare i32 @strtol(i8*, i8**, i32) #1

; Function Attrs: noinline nounwind
define void @add_history(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  %new_length = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i32, i32* @history_stifled, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @history_length, align 4
  %2 = load i32, i32* @history_max_entries, align 4
  %cmp = icmp eq i32 %1, %2
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* @history_length, align 4
  %cmp1 = icmp eq i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  br label %return

if.end:                                           ; preds = %if.then
  %4 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %4, i32 0
  %5 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool3 = icmp ne %struct._hist_entry* %5, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %6 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %arrayidx5 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %6, i32 0
  %7 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx5, align 4
  %call = call i8* @free_history_entry(%struct._hist_entry* %7)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %8 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %9 = bitcast %struct._hist_entry** %8 to i8*
  %10 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %add.ptr = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %10, i32 1
  %11 = bitcast %struct._hist_entry** %add.ptr to i8*
  %12 = load i32, i32* @history_length, align 4
  %mul = mul i32 %12, 4
  call void @llvm.memmove.p0i8.p0i8.i32(i8* %9, i8* %11, i32 %mul, i32 4, i1 false)
  %13 = load i32, i32* @history_length, align 4
  store i32 %13, i32* %new_length, align 4
  %14 = load i32, i32* @history_base, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @history_base, align 4
  br label %if.end27

if.else:                                          ; preds = %land.lhs.true, %entry
  %15 = load i32, i32* @history_size, align 4
  %cmp7 = icmp eq i32 %15, 0
  br i1 %cmp7, label %if.then8, label %if.else18

if.then8:                                         ; preds = %if.else
  %16 = load i32, i32* @history_stifled, align 4
  %tobool9 = icmp ne i32 %16, 0
  br i1 %tobool9, label %land.lhs.true10, label %if.else14

land.lhs.true10:                                  ; preds = %if.then8
  %17 = load i32, i32* @history_max_entries, align 4
  %cmp11 = icmp sgt i32 %17, 0
  br i1 %cmp11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %land.lhs.true10
  %18 = load i32, i32* @history_max_entries, align 4
  %cmp13 = icmp sgt i32 %18, 8192
  br i1 %cmp13, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then12
  br label %cond.end

cond.false:                                       ; preds = %if.then12
  %19 = load i32, i32* @history_max_entries, align 4
  %add = add nsw i32 %19, 2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 8192, %cond.true ], [ %add, %cond.false ]
  store i32 %cond, i32* @history_size, align 4
  br label %if.end15

if.else14:                                        ; preds = %land.lhs.true10, %if.then8
  store i32 502, i32* @history_size, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.else14, %cond.end
  %20 = load i32, i32* @history_size, align 4
  %mul16 = mul i32 %20, 4
  %call17 = call i8* @xmalloc(i32 %mul16)
  %21 = bitcast i8* %call17 to %struct._hist_entry**
  store %struct._hist_entry** %21, %struct._hist_entry*** @the_history, align 4
  store i32 1, i32* %new_length, align 4
  br label %if.end26

if.else18:                                        ; preds = %if.else
  %22 = load i32, i32* @history_length, align 4
  %23 = load i32, i32* @history_size, align 4
  %sub = sub nsw i32 %23, 1
  %cmp19 = icmp eq i32 %22, %sub
  br i1 %cmp19, label %if.then20, label %if.end24

if.then20:                                        ; preds = %if.else18
  %24 = load i32, i32* @history_size, align 4
  %add21 = add nsw i32 %24, 50
  store i32 %add21, i32* @history_size, align 4
  %25 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %26 = bitcast %struct._hist_entry** %25 to i8*
  %27 = load i32, i32* @history_size, align 4
  %mul22 = mul i32 %27, 4
  %call23 = call i8* @xrealloc(i8* %26, i32 %mul22)
  %28 = bitcast i8* %call23 to %struct._hist_entry**
  store %struct._hist_entry** %28, %struct._hist_entry*** @the_history, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then20, %if.else18
  %29 = load i32, i32* @history_length, align 4
  %add25 = add nsw i32 %29, 1
  store i32 %add25, i32* %new_length, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.end24, %if.end15
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end6
  %30 = load i8*, i8** %string.addr, align 4
  %call28 = call i8* @hist_inittime()
  %call29 = call %struct._hist_entry* @alloc_history_entry(i8* %30, i8* %call28)
  store %struct._hist_entry* %call29, %struct._hist_entry** %temp, align 4
  %31 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %32 = load i32, i32* %new_length, align 4
  %arrayidx30 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %31, i32 %32
  store %struct._hist_entry* null, %struct._hist_entry** %arrayidx30, align 4
  %33 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %34 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %35 = load i32, i32* %new_length, align 4
  %sub31 = sub nsw i32 %35, 1
  %arrayidx32 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %34, i32 %sub31
  store %struct._hist_entry* %33, %struct._hist_entry** %arrayidx32, align 4
  %36 = load i32, i32* %new_length, align 4
  store i32 %36, i32* @history_length, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.then2
  ret void
}

; Function Attrs: noinline nounwind
define i8* @free_history_entry(%struct._hist_entry* %hist) #0 {
entry:
  %retval = alloca i8*, align 4
  %hist.addr = alloca %struct._hist_entry*, align 4
  %x = alloca i8*, align 4
  store %struct._hist_entry* %hist, %struct._hist_entry** %hist.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %1, i32 0, i32 0
  %2 = load i8*, i8** %line, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %line2 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 0
  %4 = load i8*, i8** %line2, align 4
  call void @free(i8* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %5 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 1
  %6 = load i8*, i8** %timestamp, align 4
  %tobool4 = icmp ne i8* %6, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end3
  %7 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp6 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %7, i32 0, i32 1
  %8 = load i8*, i8** %timestamp6, align 4
  call void @free(i8* %8)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end3
  %9 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %9, i32 0, i32 2
  %10 = load i8*, i8** %data, align 4
  store i8* %10, i8** %x, align 4
  %11 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %12 = bitcast %struct._hist_entry* %11 to i8*
  call void @xfree(i8* %12)
  %13 = load i8*, i8** %x, align 4
  store i8* %13, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare i8* @xrealloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @hist_inittime() #0 {
entry:
  %t = alloca i32, align 4
  %ts = alloca [64 x i8], align 1
  %ret = alloca i8*, align 4
  %call = call i32 @time(i32* null)
  store i32 %call, i32* %t, align 4
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %ts, i32 0, i32 0
  %0 = load i32, i32* %t, align 4
  %call1 = call i32 (i8*, i32, i8*, ...) @snprintf(i8* %arraydecay, i32 63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %0)
  %arraydecay2 = getelementptr inbounds [64 x i8], [64 x i8]* %ts, i32 0, i32 0
  %call3 = call i32 @strlen(i8* %arraydecay2)
  %add = add i32 1, %call3
  %call4 = call i8* @xmalloc(i32 %add)
  %arraydecay5 = getelementptr inbounds [64 x i8], [64 x i8]* %ts, i32 0, i32 0
  %call6 = call i8* @strcpy(i8* %call4, i8* %arraydecay5)
  store i8* %call6, i8** %ret, align 4
  %1 = load i8, i8* @history_comment_char, align 1
  %2 = load i8*, i8** %ret, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  store i8 %1, i8* %arrayidx, align 1
  %3 = load i8*, i8** %ret, align 4
  ret i8* %3
}

; Function Attrs: noinline nounwind
define void @add_history_time(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %hs = alloca %struct._hist_entry*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @history_length, align 4
  %cmp1 = icmp slt i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %3 = load i32, i32* @history_length, align 4
  %sub = sub nsw i32 %3, 1
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %2, i32 %sub
  %4 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %4, %struct._hist_entry** %hs, align 4
  %5 = load %struct._hist_entry*, %struct._hist_entry** %hs, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 1
  %6 = load i8*, i8** %timestamp, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %7 = load %struct._hist_entry*, %struct._hist_entry** %hs, align 4
  %timestamp3 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %7, i32 0, i32 1
  %8 = load i8*, i8** %timestamp3, align 4
  call void @free(i8* %8)
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %9 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %9)
  %add = add i32 1, %call
  %call5 = call i8* @xmalloc(i32 %add)
  %10 = load i8*, i8** %string.addr, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %10)
  %11 = load %struct._hist_entry*, %struct._hist_entry** %hs, align 4
  %timestamp7 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 1
  store i8* %call6, i8** %timestamp7, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then
  ret void
}

declare void @free(i8*) #1

declare void @xfree(i8*) #1

; Function Attrs: noinline nounwind
define %struct._hist_entry* @copy_history_entry(%struct._hist_entry* %hist) #0 {
entry:
  %retval = alloca %struct._hist_entry*, align 4
  %hist.addr = alloca %struct._hist_entry*, align 4
  %ret = alloca %struct._hist_entry*, align 4
  %ts = alloca i8*, align 4
  store %struct._hist_entry* %hist, %struct._hist_entry** %hist.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %cmp = icmp eq %struct._hist_entry* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  store %struct._hist_entry* %1, %struct._hist_entry** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %2, i32 0, i32 0
  %3 = load i8*, i8** %line, align 4
  %call = call %struct._hist_entry* @alloc_history_entry(i8* %3, i8* null)
  store %struct._hist_entry* %call, %struct._hist_entry** %ret, align 4
  %4 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %4, i32 0, i32 1
  %5 = load i8*, i8** %timestamp, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %6 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp1 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 1
  %7 = load i8*, i8** %timestamp1, align 4
  %call2 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call2
  %call3 = call i8* @xmalloc(i32 %add)
  %8 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp4 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 1
  %9 = load i8*, i8** %timestamp4, align 4
  %call5 = call i8* @strcpy(i8* %call3, i8* %9)
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %10 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %timestamp6 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %10, i32 0, i32 1
  %11 = load i8*, i8** %timestamp6, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call5, %cond.true ], [ %11, %cond.false ]
  store i8* %cond, i8** %ts, align 4
  %12 = load i8*, i8** %ts, align 4
  %13 = load %struct._hist_entry*, %struct._hist_entry** %ret, align 4
  %timestamp7 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %13, i32 0, i32 1
  store i8* %12, i8** %timestamp7, align 4
  %14 = load %struct._hist_entry*, %struct._hist_entry** %hist.addr, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %14, i32 0, i32 2
  %15 = load i8*, i8** %data, align 4
  %16 = load %struct._hist_entry*, %struct._hist_entry** %ret, align 4
  %data8 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %16, i32 0, i32 2
  store i8* %15, i8** %data8, align 4
  %17 = load %struct._hist_entry*, %struct._hist_entry** %ret, align 4
  store %struct._hist_entry* %17, %struct._hist_entry** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %18 = load %struct._hist_entry*, %struct._hist_entry** %retval, align 4
  ret %struct._hist_entry* %18
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @replace_history_entry(i32 %which, i8* %line, i8* %data) #0 {
entry:
  %retval = alloca %struct._hist_entry*, align 4
  %which.addr = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %data.addr = alloca i8*, align 4
  %temp = alloca %struct._hist_entry*, align 4
  %old_value = alloca %struct._hist_entry*, align 4
  store i32 %which, i32* %which.addr, align 4
  store i8* %line, i8** %line.addr, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i32, i32* %which.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %which.addr, align 4
  %2 = load i32, i32* @history_length, align 4
  %cmp1 = icmp sge i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct._hist_entry* null, %struct._hist_entry** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %call = call i8* @xmalloc(i32 12)
  %3 = bitcast i8* %call to %struct._hist_entry*
  store %struct._hist_entry* %3, %struct._hist_entry** %temp, align 4
  %4 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %5 = load i32, i32* %which.addr, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %4, i32 %5
  %6 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %6, %struct._hist_entry** %old_value, align 4
  %7 = load i8*, i8** %line.addr, align 4
  %call2 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call2
  %call3 = call i8* @xmalloc(i32 %add)
  %8 = load i8*, i8** %line.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %8)
  %9 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %line5 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %9, i32 0, i32 0
  store i8* %call4, i8** %line5, align 4
  %10 = load i8*, i8** %data.addr, align 4
  %11 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %data6 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 2
  store i8* %10, i8** %data6, align 4
  %12 = load %struct._hist_entry*, %struct._hist_entry** %old_value, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %12, i32 0, i32 1
  %13 = load i8*, i8** %timestamp, align 4
  %call7 = call i32 @strlen(i8* %13)
  %add8 = add i32 1, %call7
  %call9 = call i8* @xmalloc(i32 %add8)
  %14 = load %struct._hist_entry*, %struct._hist_entry** %old_value, align 4
  %timestamp10 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %14, i32 0, i32 1
  %15 = load i8*, i8** %timestamp10, align 4
  %call11 = call i8* @strcpy(i8* %call9, i8* %15)
  %16 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %timestamp12 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %16, i32 0, i32 1
  store i8* %call11, i8** %timestamp12, align 4
  %17 = load %struct._hist_entry*, %struct._hist_entry** %temp, align 4
  %18 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %19 = load i32, i32* %which.addr, align 4
  %arrayidx13 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %18, i32 %19
  store %struct._hist_entry* %17, %struct._hist_entry** %arrayidx13, align 4
  %20 = load %struct._hist_entry*, %struct._hist_entry** %old_value, align 4
  store %struct._hist_entry* %20, %struct._hist_entry** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %21 = load %struct._hist_entry*, %struct._hist_entry** %retval, align 4
  ret %struct._hist_entry* %21
}

; Function Attrs: noinline nounwind
define void @_hs_append_history_line(i32 %which, i8* %line) #0 {
entry:
  %which.addr = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %hent = alloca %struct._hist_entry*, align 4
  %newlen = alloca i32, align 4
  %curlen = alloca i32, align 4
  %newline = alloca i8*, align 4
  store i32 %which, i32* %which.addr, align 4
  store i8* %line, i8** %line.addr, align 4
  %0 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %1 = load i32, i32* %which.addr, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %0, i32 %1
  %2 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %2, %struct._hist_entry** %hent, align 4
  %3 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %line1 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 0
  %4 = load i8*, i8** %line1, align 4
  %call = call i32 @strlen(i8* %4)
  store i32 %call, i32* %curlen, align 4
  %5 = load i32, i32* %curlen, align 4
  %6 = load i8*, i8** %line.addr, align 4
  %call2 = call i32 @strlen(i8* %6)
  %add = add i32 %5, %call2
  %add3 = add i32 %add, 2
  store i32 %add3, i32* %newlen, align 4
  %7 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %line4 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %7, i32 0, i32 0
  %8 = load i8*, i8** %line4, align 4
  %9 = load i32, i32* %newlen, align 4
  %call5 = call i8* @realloc(i8* %8, i32 %9)
  store i8* %call5, i8** %newline, align 4
  %10 = load i8*, i8** %newline, align 4
  %tobool = icmp ne i8* %10, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %newline, align 4
  %12 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %line6 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %12, i32 0, i32 0
  store i8* %11, i8** %line6, align 4
  %13 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %line7 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %13, i32 0, i32 0
  %14 = load i8*, i8** %line7, align 4
  %15 = load i32, i32* %curlen, align 4
  %inc = add i32 %15, 1
  store i32 %inc, i32* %curlen, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %14, i32 %15
  store i8 10, i8* %arrayidx8, align 1
  %16 = load %struct._hist_entry*, %struct._hist_entry** %hent, align 4
  %line9 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %16, i32 0, i32 0
  %17 = load i8*, i8** %line9, align 4
  %18 = load i32, i32* %curlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8*, i8** %line.addr, align 4
  %call10 = call i8* @strcpy(i8* %add.ptr, i8* %19)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i8* @realloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define void @_hs_replace_history_data(i32 %which, i8** %old, i8** %new) #0 {
entry:
  %which.addr = alloca i32, align 4
  %old.addr = alloca i8**, align 4
  %new.addr = alloca i8**, align 4
  %entry1 = alloca %struct._hist_entry*, align 4
  %i = alloca i32, align 4
  %last = alloca i32, align 4
  store i32 %which, i32* %which.addr, align 4
  store i8** %old, i8*** %old.addr, align 4
  store i8** %new, i8*** %new.addr, align 4
  %0 = load i32, i32* %which.addr, align 4
  %cmp = icmp slt i32 %0, -2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %which.addr, align 4
  %2 = load i32, i32* @history_length, align 4
  %cmp2 = icmp sge i32 %1, %2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* @history_length, align 4
  %cmp4 = icmp eq i32 %3, 0
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false3
  %4 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %cmp6 = icmp eq %struct._hist_entry** %4, null
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false3, %lor.lhs.false, %entry
  br label %if.end33

if.end:                                           ; preds = %lor.lhs.false5
  %5 = load i32, i32* %which.addr, align 4
  %cmp7 = icmp sge i32 %5, 0
  br i1 %cmp7, label %if.then8, label %if.end13

if.then8:                                         ; preds = %if.end
  %6 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %7 = load i32, i32* %which.addr, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %6, i32 %7
  %8 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %8, %struct._hist_entry** %entry1, align 4
  %9 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %tobool = icmp ne %struct._hist_entry* %9, null
  br i1 %tobool, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.then8
  %10 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %10, i32 0, i32 2
  %11 = load i8*, i8** %data, align 4
  %12 = load i8**, i8*** %old.addr, align 4
  %13 = bitcast i8** %12 to i8*
  %cmp9 = icmp eq i8* %11, %13
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %land.lhs.true
  %14 = load i8**, i8*** %new.addr, align 4
  %15 = bitcast i8** %14 to i8*
  %16 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data11 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %16, i32 0, i32 2
  store i8* %15, i8** %data11, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %land.lhs.true, %if.then8
  br label %if.end33

if.end13:                                         ; preds = %if.end
  store i32 -1, i32* %last, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end13
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* @history_length, align 4
  %cmp14 = icmp slt i32 %17, %18
  br i1 %cmp14, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %19, i32 %20
  %21 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx15, align 4
  store %struct._hist_entry* %21, %struct._hist_entry** %entry1, align 4
  %22 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %cmp16 = icmp eq %struct._hist_entry* %22, null
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %for.body
  br label %for.inc

if.end18:                                         ; preds = %for.body
  %23 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data19 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %23, i32 0, i32 2
  %24 = load i8*, i8** %data19, align 4
  %25 = load i8**, i8*** %old.addr, align 4
  %26 = bitcast i8** %25 to i8*
  %cmp20 = icmp eq i8* %24, %26
  br i1 %cmp20, label %if.then21, label %if.end26

if.then21:                                        ; preds = %if.end18
  %27 = load i32, i32* %i, align 4
  store i32 %27, i32* %last, align 4
  %28 = load i32, i32* %which.addr, align 4
  %cmp22 = icmp eq i32 %28, -1
  br i1 %cmp22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.then21
  %29 = load i8**, i8*** %new.addr, align 4
  %30 = bitcast i8** %29 to i8*
  %31 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data24 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %31, i32 0, i32 2
  store i8* %30, i8** %data24, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.then21
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end18
  br label %for.inc

for.inc:                                          ; preds = %if.end26, %if.then17
  %32 = load i32, i32* %i, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %33 = load i32, i32* %which.addr, align 4
  %cmp27 = icmp eq i32 %33, -2
  br i1 %cmp27, label %land.lhs.true28, label %if.end33

land.lhs.true28:                                  ; preds = %for.end
  %34 = load i32, i32* %last, align 4
  %cmp29 = icmp sge i32 %34, 0
  br i1 %cmp29, label %if.then30, label %if.end33

if.then30:                                        ; preds = %land.lhs.true28
  %35 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %36 = load i32, i32* %last, align 4
  %arrayidx31 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %35, i32 %36
  %37 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx31, align 4
  store %struct._hist_entry* %37, %struct._hist_entry** %entry1, align 4
  %38 = load i8**, i8*** %new.addr, align 4
  %39 = bitcast i8** %38 to i8*
  %40 = load %struct._hist_entry*, %struct._hist_entry** %entry1, align 4
  %data32 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %40, i32 0, i32 2
  store i8* %39, i8** %data32, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then, %if.end12, %if.then30, %land.lhs.true28, %for.end
  ret void
}

; Function Attrs: noinline nounwind
define %struct._hist_entry* @remove_history(i32 %which) #0 {
entry:
  %retval = alloca %struct._hist_entry*, align 4
  %which.addr = alloca i32, align 4
  %return_value = alloca %struct._hist_entry*, align 4
  %i = alloca i32, align 4
  store i32 %which, i32* %which.addr, align 4
  %0 = load i32, i32* %which.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %which.addr, align 4
  %2 = load i32, i32* @history_length, align 4
  %cmp1 = icmp sge i32 %1, %2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* @history_length, align 4
  %cmp3 = icmp eq i32 %3, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %4 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %cmp5 = icmp eq %struct._hist_entry** %4, null
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct._hist_entry* null, %struct._hist_entry** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false4
  %5 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %6 = load i32, i32* %which.addr, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %5, i32 %6
  %7 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  store %struct._hist_entry* %7, %struct._hist_entry** %return_value, align 4
  %8 = load i32, i32* %which.addr, align 4
  store i32 %8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* @history_length, align 4
  %cmp6 = icmp slt i32 %9, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %12 = load i32, i32* %i, align 4
  %add = add nsw i32 %12, 1
  %arrayidx7 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %11, i32 %add
  %13 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx7, align 4
  %14 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %14, i32 %15
  store %struct._hist_entry* %13, %struct._hist_entry** %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* @history_length, align 4
  %dec = add nsw i32 %17, -1
  store i32 %dec, i32* @history_length, align 4
  %18 = load %struct._hist_entry*, %struct._hist_entry** %return_value, align 4
  store %struct._hist_entry* %18, %struct._hist_entry** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %19 = load %struct._hist_entry*, %struct._hist_entry** %retval, align 4
  ret %struct._hist_entry* %19
}

; Function Attrs: noinline nounwind
define void @stifle_history(i32 %max) #0 {
entry:
  %max.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %max, i32* %max.addr, align 4
  %0 = load i32, i32* %max.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %max.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @history_length, align 4
  %2 = load i32, i32* %max.addr, align 4
  %cmp1 = icmp sgt i32 %1, %2
  br i1 %cmp1, label %if.then2, label %if.end15

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* @history_length, align 4
  %4 = load i32, i32* %max.addr, align 4
  %sub = sub nsw i32 %3, %4
  store i32 %sub, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %5, %6
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %7, i32 %8
  %9 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %call = call i8* @free_history_entry(%struct._hist_entry* %9)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* @history_base, align 4
  store i32 0, i32* %j, align 4
  %12 = load i32, i32* @history_length, align 4
  %13 = load i32, i32* %max.addr, align 4
  %sub4 = sub nsw i32 %12, %13
  store i32 %sub4, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc10, %for.end
  %14 = load i32, i32* %j, align 4
  %15 = load i32, i32* %max.addr, align 4
  %cmp6 = icmp slt i32 %14, %15
  br i1 %cmp6, label %for.body7, label %for.end13

for.body7:                                        ; preds = %for.cond5
  %16 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %16, i32 %17
  %18 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx8, align 4
  %19 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %20 = load i32, i32* %j, align 4
  %arrayidx9 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %19, i32 %20
  store %struct._hist_entry* %18, %struct._hist_entry** %arrayidx9, align 4
  br label %for.inc10

for.inc10:                                        ; preds = %for.body7
  %21 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %21, 1
  store i32 %inc11, i32* %i, align 4
  %22 = load i32, i32* %j, align 4
  %inc12 = add nsw i32 %22, 1
  store i32 %inc12, i32* %j, align 4
  br label %for.cond5

for.end13:                                        ; preds = %for.cond5
  %23 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %24 = load i32, i32* %j, align 4
  %arrayidx14 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %23, i32 %24
  store %struct._hist_entry* null, %struct._hist_entry** %arrayidx14, align 4
  %25 = load i32, i32* %j, align 4
  store i32 %25, i32* @history_length, align 4
  br label %if.end15

if.end15:                                         ; preds = %for.end13, %if.end
  store i32 1, i32* @history_stifled, align 4
  %26 = load i32, i32* %max.addr, align 4
  store i32 %26, i32* @history_max_entries, align 4
  store i32 %26, i32* @max_input_history, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @unstifle_history() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i32, i32* @history_stifled, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @history_stifled, align 4
  %1 = load i32, i32* @history_max_entries, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* @history_max_entries, align 4
  %sub = sub nsw i32 0, %2
  store i32 %sub, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define i32 @history_is_stifled() #0 {
entry:
  %0 = load i32, i32* @history_stifled, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind
define void @clear_history() #0 {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @history_length, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %2, i32 %3
  %4 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %call = call i8* @free_history_entry(%struct._hist_entry* %4)
  %5 = load %struct._hist_entry**, %struct._hist_entry*** @the_history, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %5, i32 %6
  store %struct._hist_entry* null, %struct._hist_entry** %arrayidx1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* @history_length, align 4
  store i32 0, i32* @history_offset, align 4
  ret void
}

declare i32 @time(i32*) #1

declare i32 @snprintf(i8*, i32, i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
