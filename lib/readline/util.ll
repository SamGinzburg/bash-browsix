; ModuleID = 'util.c'
source_filename = "util.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct._IO_FILE = type opaque

@_rl_allow_pathname_alphabetic_chars = global i32 0, align 4
@.str = private unnamed_addr constant [9 x i8] c"/-_=~.#$\00", align 1
@rl_readline_state = external global i32, align 4
@rl_executing_macro = external global i8*, align 4
@rl_last_func = external global i32 (i32, i32)*, align 4
@_rl_top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@rl_line_buffer = external global i8*, align 4
@rl_line_buffer_len = external global i32, align 4
@rl_point = external global i32, align 4
@rl_end = external global i32, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c"~\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"readline: \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @rl_alphabetic(i32 %c) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isalnum(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* @_rl_allow_pathname_alphabetic_chars, align 4
  %tobool5 = icmp ne i32 %3, 0
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %4 = load i32, i32* %c.addr, align 4
  %call6 = call i8* @strchr(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 %4)
  %cmp7 = icmp ne i8* %call6, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %5 = phi i1 [ false, %if.end ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #1

declare i8* @strchr(i8*, i32) #2

; Function Attrs: noinline nounwind
define i32 @_rl_walphabetic(i32 %wc) #0 {
entry:
  %retval = alloca i32, align 4
  %wc.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  %call = call i32 @iswalnum(i32 %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %wc.addr, align 4
  %and = and i32 %1, 127
  store i32 %and, i32* %c, align 4
  %2 = load i32, i32* @_rl_allow_pathname_alphabetic_chars, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end
  %3 = load i32, i32* %c, align 4
  %call2 = call i8* @strchr(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 %3)
  %cmp = icmp ne i8* %call2, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end
  %4 = phi i1 [ false, %if.end ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @iswalnum(i32) #2

; Function Attrs: noinline nounwind
define i32 @_rl_abort_internal() #0 {
entry:
  %retval = alloca i32, align 4
  %call = call i32 @rl_ding()
  %call1 = call i32 @rl_clear_message()
  call void @_rl_reset_argument()
  %call2 = call i32 @rl_clear_pending_input()
  %0 = load i32, i32* @rl_readline_state, align 4
  %and = and i32 %0, -4097
  store i32 %and, i32* @rl_readline_state, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i8*, i8** @rl_executing_macro, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @_rl_pop_executing_macro()
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load i32, i32* @rl_readline_state, align 4
  %and3 = and i32 %2, -2097153
  store i32 %and3, i32* @rl_readline_state, align 4
  store i32 (i32, i32)* null, i32 (i32, i32)** @rl_last_func, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @_rl_top_level, i32 0, i32 0), i32 1) #6
  unreachable

return:                                           ; No predecessors!
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32 @rl_ding() #2

declare i32 @rl_clear_message() #2

declare void @_rl_reset_argument() #2

declare i32 @rl_clear_pending_input() #2

declare void @_rl_pop_executing_macro() #2

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #3

; Function Attrs: noinline nounwind
define i32 @rl_abort(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @_rl_abort_internal()
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @_rl_null_function(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @rl_tty_status(i32 %count, i32 %key) #0 {
entry:
  %count.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %call = call i32 @rl_ding()
  ret i32 0
}

; Function Attrs: noinline nounwind
define i8* @rl_copy_text(i32 %from, i32 %to) #0 {
entry:
  %from.addr = alloca i32, align 4
  %to.addr = alloca i32, align 4
  %length = alloca i32, align 4
  %copy = alloca i8*, align 4
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
  %6 = load i32, i32* %from.addr, align 4
  %sub = sub nsw i32 %5, %6
  store i32 %sub, i32* %length, align 4
  %7 = load i32, i32* %length, align 4
  %add = add nsw i32 1, %7
  %call = call i8* @xmalloc(i32 %add)
  store i8* %call, i8** %copy, align 4
  %8 = load i8*, i8** %copy, align 4
  %9 = load i8*, i8** @rl_line_buffer, align 4
  %10 = load i32, i32* %from.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i32, i32* %length, align 4
  %call1 = call i8* @strncpy(i8* %8, i8* %add.ptr, i32 %11)
  %12 = load i8*, i8** %copy, align 4
  %13 = load i32, i32* %length, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 0, i8* %arrayidx, align 1
  %14 = load i8*, i8** %copy, align 4
  ret i8* %14
}

declare i8* @xmalloc(i32) #2

declare i8* @strncpy(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind
define void @rl_extend_line_buffer(i32 %len) #0 {
entry:
  %len.addr = alloca i32, align 4
  store i32 %len, i32* %len.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %len.addr, align 4
  %1 = load i32, i32* @rl_line_buffer_len, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* @rl_line_buffer_len, align 4
  %add = add nsw i32 %2, 256
  store i32 %add, i32* @rl_line_buffer_len, align 4
  %3 = load i8*, i8** @rl_line_buffer, align 4
  %4 = load i32, i32* @rl_line_buffer_len, align 4
  %call = call i8* @xrealloc(i8* %3, i32 %4)
  store i8* %call, i8** @rl_line_buffer, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @_rl_set_the_line()
  ret void
}

declare i8* @xrealloc(i8*, i32) #2

declare void @_rl_set_the_line() #2

; Function Attrs: noinline nounwind
define i32 @rl_tilde_expand(i32 %ignore, i32 %key) #0 {
entry:
  %retval = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %key.addr = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %homedir = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %len = alloca i32, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  store i32 %key, i32* %key.addr, align 4
  %0 = load i32, i32* @rl_point, align 4
  store i32 %0, i32* %end, align 4
  %1 = load i32, i32* %end, align 4
  %sub = sub nsw i32 %1, 1
  store i32 %sub, i32* %start, align 4
  %2 = load i32, i32* @rl_point, align 4
  %3 = load i32, i32* @rl_end, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** @rl_line_buffer, align 4
  %5 = load i32, i32* @rl_point, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 126
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @tilde_expand(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call, i8** %homedir, align 4
  %7 = load i8*, i8** %homedir, align 4
  %8 = load i32, i32* %start, align 4
  %9 = load i32, i32* %end, align 4
  %call3 = call i32 @_rl_replace_text(i8* %7, i32 %8, i32 %9)
  %10 = load i8*, i8** %homedir, align 4
  call void @xfree(i8* %10)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %11 = load i32, i32* %start, align 4
  %cmp4 = icmp sge i32 %11, 0
  br i1 %cmp4, label %land.lhs.true6, label %if.else22

land.lhs.true6:                                   ; preds = %if.else
  %12 = load i8*, i8** @rl_line_buffer, align 4
  %13 = load i32, i32* %start, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %14 to i32
  %cmp9 = icmp ne i32 %conv8, 126
  br i1 %cmp9, label %if.then11, label %if.else22

if.then11:                                        ; preds = %land.lhs.true6
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then11
  %15 = load i8*, i8** @rl_line_buffer, align 4
  %16 = load i32, i32* %start, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %17 to i32
  %cmp14 = icmp eq i32 %conv13, 32
  br i1 %cmp14, label %land.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond
  %18 = load i8*, i8** @rl_line_buffer, align 4
  %19 = load i32, i32* %start, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %20 to i32
  %cmp18 = icmp eq i32 %conv17, 9
  br i1 %cmp18, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %lor.lhs.false
  %21 = load i32, i32* %start, align 4
  %cmp20 = icmp sge i32 %21, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.lhs.false, %for.cond
  %22 = phi i1 [ false, %lor.lhs.false ], [ false, %for.cond ], [ %cmp20, %land.rhs ]
  br i1 %22, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %start, align 4
  %dec = add nsw i32 %23, -1
  store i32 %dec, i32* %start, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %24 = load i32, i32* %start, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %start, align 4
  br label %if.end26

if.else22:                                        ; preds = %land.lhs.true6, %if.else
  %25 = load i32, i32* %start, align 4
  %cmp23 = icmp slt i32 %25, 0
  br i1 %cmp23, label %if.then25, label %if.end

if.then25:                                        ; preds = %if.else22
  store i32 0, i32* %start, align 4
  br label %if.end

if.end:                                           ; preds = %if.then25, %if.else22
  br label %if.end26

if.end26:                                         ; preds = %if.end, %for.end
  br label %if.end27

if.end27:                                         ; preds = %if.end26
  %26 = load i32, i32* %start, align 4
  store i32 %26, i32* %end, align 4
  br label %do.body

do.body:                                          ; preds = %land.end42, %if.end27
  %27 = load i32, i32* %end, align 4
  %inc28 = add nsw i32 %27, 1
  store i32 %inc28, i32* %end, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %28 = load i8*, i8** @rl_line_buffer, align 4
  %29 = load i32, i32* %end, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %28, i32 %29
  %30 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %30 to i32
  %cmp31 = icmp eq i32 %conv30, 32
  br i1 %cmp31, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.cond
  %31 = load i8*, i8** @rl_line_buffer, align 4
  %32 = load i32, i32* %end, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %31, i32 %32
  %33 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %33 to i32
  %cmp35 = icmp eq i32 %conv34, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %do.cond
  %34 = phi i1 [ true, %do.cond ], [ %cmp35, %lor.rhs ]
  %lor.ext = zext i1 %34 to i32
  %cmp37 = icmp eq i32 %lor.ext, 0
  br i1 %cmp37, label %land.rhs39, label %land.end42

land.rhs39:                                       ; preds = %lor.end
  %35 = load i32, i32* %end, align 4
  %36 = load i32, i32* @rl_end, align 4
  %cmp40 = icmp slt i32 %35, %36
  br label %land.end42

land.end42:                                       ; preds = %land.rhs39, %lor.end
  %37 = phi i1 [ false, %lor.end ], [ %cmp40, %land.rhs39 ]
  br i1 %37, label %do.body, label %do.end

do.end:                                           ; preds = %land.end42
  %38 = load i8*, i8** @rl_line_buffer, align 4
  %39 = load i32, i32* %end, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %40 to i32
  %cmp45 = icmp eq i32 %conv44, 32
  br i1 %cmp45, label %if.then55, label %lor.lhs.false47

lor.lhs.false47:                                  ; preds = %do.end
  %41 = load i8*, i8** @rl_line_buffer, align 4
  %42 = load i32, i32* %end, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %43 to i32
  %cmp50 = icmp eq i32 %conv49, 9
  br i1 %cmp50, label %if.then55, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %lor.lhs.false47
  %44 = load i32, i32* %end, align 4
  %45 = load i32, i32* @rl_end, align 4
  %cmp53 = icmp sge i32 %44, %45
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %lor.lhs.false52, %lor.lhs.false47, %do.end
  %46 = load i32, i32* %end, align 4
  %dec56 = add nsw i32 %46, -1
  store i32 %dec56, i32* %end, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %lor.lhs.false52
  %47 = load i8*, i8** @rl_line_buffer, align 4
  %48 = load i32, i32* %start, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %47, i32 %48
  %49 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %49 to i32
  %cmp60 = icmp eq i32 %conv59, 126
  br i1 %cmp60, label %if.then62, label %if.end70

if.then62:                                        ; preds = %if.end57
  %50 = load i32, i32* %end, align 4
  %51 = load i32, i32* %start, align 4
  %sub63 = sub nsw i32 %50, %51
  %add = add nsw i32 %sub63, 1
  store i32 %add, i32* %len, align 4
  %52 = load i32, i32* %len, align 4
  %add64 = add nsw i32 %52, 1
  %call65 = call i8* @xmalloc(i32 %add64)
  store i8* %call65, i8** %temp, align 4
  %53 = load i8*, i8** %temp, align 4
  %54 = load i8*, i8** @rl_line_buffer, align 4
  %55 = load i32, i32* %start, align 4
  %add.ptr = getelementptr inbounds i8, i8* %54, i32 %55
  %56 = load i32, i32* %len, align 4
  %call66 = call i8* @strncpy(i8* %53, i8* %add.ptr, i32 %56)
  %57 = load i8*, i8** %temp, align 4
  %58 = load i32, i32* %len, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %57, i32 %58
  store i8 0, i8* %arrayidx67, align 1
  %59 = load i8*, i8** %temp, align 4
  %call68 = call i8* @tilde_expand(i8* %59)
  store i8* %call68, i8** %homedir, align 4
  %60 = load i8*, i8** %temp, align 4
  call void @xfree(i8* %60)
  %61 = load i8*, i8** %homedir, align 4
  %62 = load i32, i32* %start, align 4
  %63 = load i32, i32* %end, align 4
  %call69 = call i32 @_rl_replace_text(i8* %61, i32 %62, i32 %63)
  %64 = load i8*, i8** %homedir, align 4
  call void @xfree(i8* %64)
  br label %if.end70

if.end70:                                         ; preds = %if.then62, %if.end57
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end70, %if.then
  %65 = load i32, i32* %retval, align 4
  ret i32 %65
}

declare i8* @tilde_expand(i8*) #2

declare i32 @_rl_replace_text(i8*, i32, i32) #2

declare void @xfree(i8*) #2

; Function Attrs: noinline nounwind
define void @_rl_ttymsg(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call3 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 @fflush(%struct._IO_FILE* %4)
  %arraydecay6 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay67 = bitcast i32* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  %call8 = call i32 @rl_forced_update_display()
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @vfprintf(%struct._IO_FILE*, i8*, i32*) #2

declare i32 @fflush(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

declare i32 @rl_forced_update_display() #2

; Function Attrs: noinline nounwind
define void @_rl_errmsg(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call3 = call i32 @vfprintf(%struct._IO_FILE* %1, i8* %2, i32* %arraydecay2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call5 = call i32 @fflush(%struct._IO_FILE* %4)
  %arraydecay6 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay67 = bitcast i32* %arraydecay6 to i8*
  call void @llvm.va_end(i8* %arraydecay67)
  ret void
}

; Function Attrs: noinline nounwind
define i8* @_rl_strindex(i8* %s1, i8* %s2) #0 {
entry:
  %retval = alloca i8*, align 4
  %s1.addr = alloca i8*, align 4
  %s2.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %len = alloca i32, align 4
  store i8* %s1, i8** %s1.addr, align 4
  store i8* %s2, i8** %s2.addr, align 4
  store i32 0, i32* %i, align 4
  %0 = load i8*, i8** %s2.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %l, align 4
  %1 = load i8*, i8** %s1.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  store i32 %call1, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %len, align 4
  %3 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %2, %3
  %4 = load i32, i32* %l, align 4
  %cmp = icmp sge i32 %sub, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %s1.addr, align 4
  %6 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8*, i8** %s2.addr, align 4
  %8 = load i32, i32* %l, align 4
  %call2 = call i32 @strncasecmp(i8* %add.ptr, i8* %7, i32 %8)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load i8*, i8** %s1.addr, align 4
  %10 = load i32, i32* %i, align 4
  %add.ptr4 = getelementptr inbounds i8, i8* %9, i32 %10
  store i8* %add.ptr4, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i8*, i8** %retval, align 4
  ret i8* %12
}

declare i32 @strlen(i8*) #2

declare i32 @strncasecmp(i8*, i8*, i32) #2

; Function Attrs: noinline nounwind
define i32 @_rl_qsort_string_compare(i8** %s1, i8** %s2) #0 {
entry:
  %s1.addr = alloca i8**, align 4
  %s2.addr = alloca i8**, align 4
  store i8** %s1, i8*** %s1.addr, align 4
  store i8** %s2, i8*** %s2.addr, align 4
  %0 = load i8**, i8*** %s1.addr, align 4
  %1 = load i8*, i8** %0, align 4
  %2 = load i8**, i8*** %s2.addr, align 4
  %3 = load i8*, i8** %2, align 4
  %call = call i32 @strcoll(i8* %1, i8* %3)
  ret i32 %call
}

declare i32 @strcoll(i8*, i8*) #2

; Function Attrs: noinline nounwind
define i32 @_rl_digit_p(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp sge i32 %0, 48
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp sle i32 %1, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define i32 @_rl_digit_value(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %sub = sub nsw i32 %0, 48
  ret i32 %sub
}

; Function Attrs: noinline nounwind
define i32 @_rl_lowercase_p(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @islower(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_pure_alphabetic(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isalpha(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_to_lower(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isupper(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i32, i32* %c.addr, align 4
  %conv5 = trunc i32 %3 to i8
  %conv6 = zext i8 %conv5 to i32
  %call7 = call i32 @tolower(i32 %conv6) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %c.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call7, %cond.true ], [ %4, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #1

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_to_upper(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @islower(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i32, i32* %c.addr, align 4
  %conv5 = trunc i32 %3 to i8
  %conv6 = zext i8 %conv5 to i32
  %call7 = call i32 @toupper(i32 %conv6) #5
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %c.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call7, %cond.true ], [ %4, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #1

; Function Attrs: noinline nounwind
define i32 @_rl_uppercase_p(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %1 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv1, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %c.addr, align 4
  %conv3 = trunc i32 %2 to i8
  %conv4 = zext i8 %conv3 to i32
  %call = call i32 @isupper(i32 %conv4) #5
  %tobool = icmp ne i32 %call, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define void @rl_free(i8* %mem) #0 {
entry:
  %mem.addr = alloca i8*, align 4
  store i8* %mem, i8** %mem.addr, align 4
  %0 = load i8*, i8** %mem.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %mem.addr, align 4
  call void @free(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @free(i8*) #2

; Function Attrs: noinline nounwind
define i8* @_rl_savestring(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add nsw i32 1, %call
  %call1 = call i8* @xmalloc(i32 %add)
  %1 = load i8*, i8** %s.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %1)
  ret i8* %call2
}

declare i8* @strcpy(i8*, i8*) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
