; ModuleID = 'shquote.c'
source_filename = "shquote.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"shquote.c\00", align 1
@sh_syntaxtab = external global [0 x i32], align 4
@bstab = internal constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\00\01\00\01\01\01\01\01\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\00\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@locale_mb_cur_max = external global i32, align 4
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define i8* @sh_single_quote(i8* %string) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %c = alloca i32, align 4
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 4, %call
  %add = add i32 3, %mul
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 102)
  store i8* %call1, i8** %result, align 4
  %1 = load i8*, i8** %result, align 4
  store i8* %1, i8** %r, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 39
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %string.addr, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 92, i8* %6, align 1
  %7 = load i8*, i8** %r, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr7, i8** %r, align 4
  store i8 39, i8* %7, align 1
  %8 = load i8*, i8** %r, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr8, i8** %r, align 4
  store i8 0, i8* %8, align 1
  %9 = load i8*, i8** %result, align 4
  store i8* %9, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %10 = load i8*, i8** %r, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr9, i8** %r, align 4
  store i8 39, i8* %10, align 1
  %11 = load i8*, i8** %string.addr, align 4
  store i8* %11, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %12, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %13 = load i8*, i8** %s, align 4
  %14 = load i8, i8* %13, align 1
  %conv10 = sext i8 %14 to i32
  store i32 %conv10, i32* %c, align 4
  %tobool11 = icmp ne i32 %conv10, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %15 = phi i1 [ false, %for.cond ], [ %tobool11, %land.rhs ]
  br i1 %15, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %16 = load i32, i32* %c, align 4
  %conv12 = trunc i32 %16 to i8
  %17 = load i8*, i8** %r, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr13, i8** %r, align 4
  store i8 %conv12, i8* %17, align 1
  %18 = load i32, i32* %c, align 4
  %cmp14 = icmp eq i32 %18, 39
  br i1 %cmp14, label %if.then16, label %if.end20

if.then16:                                        ; preds = %for.body
  %19 = load i8*, i8** %r, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr17, i8** %r, align 4
  store i8 92, i8* %19, align 1
  %20 = load i8*, i8** %r, align 4
  %incdec.ptr18 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr18, i8** %r, align 4
  store i8 39, i8* %20, align 1
  %21 = load i8*, i8** %r, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr19, i8** %r, align 4
  store i8 39, i8* %21, align 1
  br label %if.end20

if.end20:                                         ; preds = %if.then16, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %22 = load i8*, i8** %s, align 4
  %incdec.ptr21 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr21, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %23 = load i8*, i8** %r, align 4
  %incdec.ptr22 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr22, i8** %r, align 4
  store i8 39, i8* %23, align 1
  %24 = load i8*, i8** %r, align 4
  store i8 0, i8* %24, align 1
  %25 = load i8*, i8** %result, align 4
  store i8* %25, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %26 = load i8*, i8** %retval, align 4
  ret i8* %26
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i8* @sh_double_quote(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %c = alloca i8, align 1
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 2, %call
  %add = add i32 3, %mul
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 142)
  store i8* %call1, i8** %result, align 4
  %1 = load i8*, i8** %result, align 4
  store i8* %1, i8** %r, align 4
  %2 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 34, i8* %2, align 1
  %3 = load i8*, i8** %string.addr, align 4
  store i8* %3, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  store i8 %6, i8* %c, align 1
  %conv = zext i8 %6 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load i8, i8* %c, align 1
  %idxprom = zext i8 %8 to i32
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %9 = load i32, i32* %arrayidx, align 4
  %and = and i32 %9, 64
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %10 = load i8, i8* %c, align 1
  %conv4 = zext i8 %10 to i32
  %cmp = icmp ne i32 %conv4, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %11 = load i8*, i8** %r, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr6, i8** %r, align 4
  store i8 92, i8* %11, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  %12 = load i8, i8* %c, align 1
  %13 = load i8*, i8** %r, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr7, i8** %r, align 4
  store i8 %12, i8* %13, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i8*, i8** %s, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr8, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %15 = load i8*, i8** %r, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr9, i8** %r, align 4
  store i8 34, i8* %15, align 1
  %16 = load i8*, i8** %r, align 4
  store i8 0, i8* %16, align 1
  %17 = load i8*, i8** %result, align 4
  ret i8* %17
}

; Function Attrs: noinline nounwind
define i8* @sh_mkdoublequoted(i8* %s, i32 %slen, i32 %flags) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %slen.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %r = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %rlen = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %slen, i32* %slen.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %slen.addr, align 4
  %add = add nsw i32 %1, 3
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %slen.addr, align 4
  %mul = mul nsw i32 2, %2
  %add1 = add nsw i32 %mul, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %add1, %cond.false ]
  store i32 %cond, i32* %rlen, align 4
  %3 = load i32, i32* %rlen, align 4
  %call = call i8* @sh_xmalloc(i32 %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 177)
  store i8* %call, i8** %r, align 4
  store i8* %call, i8** %ret, align 4
  %4 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 34, i8* %4, align 1
  br label %while.cond

while.cond:                                       ; preds = %if.end, %cond.end
  %5 = load i8*, i8** %s.addr, align 4
  %6 = load i8, i8* %5, align 1
  %tobool = icmp ne i8 %6, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %flags.addr, align 4
  %tobool2 = icmp ne i32 %7, 0
  br i1 %tobool2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %8 = load i8*, i8** %s.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv = sext i8 %9 to i32
  %cmp3 = icmp eq i32 %conv, 34
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %10 = load i8*, i8** %r, align 4
  %incdec.ptr5 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr5, i8** %r, align 4
  store i8 92, i8* %10, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %11 = load i8*, i8** %s.addr, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr6, i8** %s.addr, align 4
  %12 = load i8, i8* %11, align 1
  %13 = load i8*, i8** %r, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr7, i8** %r, align 4
  store i8 %12, i8* %13, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %14 = load i8*, i8** %r, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr8, i8** %r, align 4
  store i8 34, i8* %14, align 1
  %15 = load i8*, i8** %r, align 4
  store i8 0, i8* %15, align 1
  %16 = load i8*, i8** %ret, align 4
  ret i8* %16
}

; Function Attrs: noinline nounwind
define i8* @sh_un_double_quote(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %c = alloca i32, align 4
  %pass_next = alloca i32, align 4
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 202)
  store i8* %call1, i8** %result, align 4
  store i8* %call1, i8** %r, align 4
  store i32 0, i32* %pass_next, align 4
  %1 = load i8*, i8** %string.addr, align 4
  store i8* %1, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %c, align 4
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %6 = load i32, i32* %pass_next, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load i32, i32* %c, align 4
  %conv4 = trunc i32 %7 to i8
  %8 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 %conv4, i8* %8, align 1
  store i32 0, i32* %pass_next, align 4
  br label %for.inc

if.end:                                           ; preds = %for.body
  %9 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %9, 92
  br i1 %cmp, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end
  %10 = load i8*, i8** %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx, align 1
  %idxprom = zext i8 %11 to i32
  %arrayidx6 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %12 = load i32, i32* %arrayidx6, align 4
  %and = and i32 %12, 64
  %tobool7 = icmp ne i32 %and, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  store i32 1, i32* %pass_next, align 4
  br label %for.inc

if.end9:                                          ; preds = %land.lhs.true, %if.end
  %13 = load i32, i32* %c, align 4
  %conv10 = trunc i32 %13 to i8
  %14 = load i8*, i8** %r, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr11, i8** %r, align 4
  store i8 %conv10, i8* %14, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end9, %if.then8, %if.then
  %15 = load i8*, i8** %s, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr12, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %16 = load i8*, i8** %r, align 4
  store i8 0, i8* %16, align 1
  %17 = load i8*, i8** %result, align 4
  ret i8* %17
}

; Function Attrs: noinline nounwind
define i8* @sh_backslash_quote(i8* %string, i8* %table, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %table.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %c = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  %slen = alloca i32, align 4
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  %backslash_table = alloca i8*, align 4
  %send = alloca i8*, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_k = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %table, i8** %table.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %slen, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %slen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 %3
  store i8* %add.ptr, i8** %send, align 4
  %4 = load i32, i32* %slen, align 4
  %mul = mul i32 2, %4
  %add = add i32 %mul, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 246)
  store i8* %call1, i8** %result, align 4
  %5 = load i8*, i8** %table.addr, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %6 = load i8*, i8** %table.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %6, %cond.true ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @bstab, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %backslash_table, align 4
  %call2 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call2, i32* %mb_cur_max, align 4
  %7 = load i8*, i8** %result, align 4
  store i8* %7, i8** %r, align 4
  %8 = load i8*, i8** %string.addr, align 4
  store i8* %8, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc97, %cond.end
  %9 = load i8*, i8** %s, align 4
  %tobool3 = icmp ne i8* %9, null
  br i1 %tobool3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %10 = load i8*, i8** %s, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  store i32 %conv, i32* %c, align 4
  %tobool4 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %12 = phi i1 [ false, %for.cond ], [ %tobool4, %land.rhs ]
  br i1 %12, label %for.body, label %for.end99

for.body:                                         ; preds = %land.end
  %13 = load i32, i32* %c, align 4
  %cmp = icmp sge i32 %13, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %14 = load i32, i32* %c, align 4
  %cmp6 = icmp sle i32 %14, 127
  br i1 %cmp6, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true
  %15 = load i8*, i8** %backslash_table, align 4
  %16 = load i32, i32* %c, align 4
  %conv9 = trunc i32 %16 to i8
  %idxprom = zext i8 %conv9 to i32
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 %idxprom
  %17 = load i8, i8* %arrayidx, align 1
  %conv10 = sext i8 %17 to i32
  %cmp11 = icmp eq i32 %conv10, 1
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  %18 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 92, i8* %18, align 1
  %19 = load i32, i32* %c, align 4
  %conv13 = trunc i32 %19 to i8
  %20 = load i8*, i8** %r, align 4
  %incdec.ptr14 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr14, i8** %r, align 4
  store i8 %conv13, i8* %20, align 1
  br label %for.inc97

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true, %for.body
  %21 = load i32, i32* %mb_cur_max, align 4
  %cmp15 = icmp sgt i32 %21, 1
  br i1 %cmp15, label %land.lhs.true17, label %if.end55

land.lhs.true17:                                  ; preds = %if.end
  %22 = load i32, i32* %c, align 4
  %conv18 = trunc i32 %22 to i8
  %call19 = call i32 @is_basic(i8 signext %conv18)
  %cmp20 = icmp eq i32 %call19, 0
  br i1 %cmp20, label %if.then22, label %if.end55

if.then22:                                        ; preds = %land.lhs.true17
  br label %do.body

do.body:                                          ; preds = %if.then22
  %23 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp23 = icmp sgt i32 %23, 1
  br i1 %cmp23, label %if.then25, label %if.else50

if.then25:                                        ; preds = %do.body
  %24 = load i8*, i8** %s, align 4
  %25 = load i8, i8* %24, align 1
  %call26 = call i32 @is_basic(i8 signext %25)
  store i32 %call26, i32* %_k, align 4
  %26 = load i32, i32* %_k, align 4
  %tobool27 = icmp ne i32 %26, 0
  br i1 %tobool27, label %if.then28, label %if.else

if.then28:                                        ; preds = %if.then25
  store i32 1, i32* %mblength, align 4
  br label %if.end30

if.else:                                          ; preds = %if.then25
  %27 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %28 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %27, i8* %28, i32 8, i32 4, i1 false)
  %29 = load i8*, i8** %s, align 4
  %30 = load i8*, i8** %send, align 4
  %31 = load i8*, i8** %s, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %30 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %31 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call29 = call i32 @mbrlen(i8* %29, i32 %sub.ptr.sub, %struct.__mbstate_t* %state)
  store i32 %call29, i32* %mblength, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then28
  %32 = load i32, i32* %mblength, align 4
  %cmp31 = icmp eq i32 %32, -2
  br i1 %cmp31, label %if.then35, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end30
  %33 = load i32, i32* %mblength, align 4
  %cmp33 = icmp eq i32 %33, -1
  br i1 %cmp33, label %if.then35, label %if.else36

if.then35:                                        ; preds = %lor.lhs.false, %if.end30
  %34 = bitcast %struct.__mbstate_t* %state to i8*
  %35 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %34, i8* %35, i32 8, i32 4, i1 false)
  store i32 1, i32* %mblength, align 4
  br label %if.end43

if.else36:                                        ; preds = %lor.lhs.false
  %36 = load i32, i32* %mblength, align 4
  %cmp37 = icmp ult i32 %36, 1
  br i1 %cmp37, label %cond.true39, label %cond.false40

cond.true39:                                      ; preds = %if.else36
  br label %cond.end41

cond.false40:                                     ; preds = %if.else36
  %37 = load i32, i32* %mblength, align 4
  br label %cond.end41

cond.end41:                                       ; preds = %cond.false40, %cond.true39
  %cond42 = phi i32 [ 1, %cond.true39 ], [ %37, %cond.false40 ]
  store i32 %cond42, i32* %mblength, align 4
  br label %if.end43

if.end43:                                         ; preds = %cond.end41, %if.then35
  store i32 0, i32* %_k, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc, %if.end43
  %38 = load i32, i32* %_k, align 4
  %39 = load i32, i32* %mblength, align 4
  %cmp45 = icmp ult i32 %38, %39
  br i1 %cmp45, label %for.body47, label %for.end

for.body47:                                       ; preds = %for.cond44
  %40 = load i8*, i8** %s, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr48, i8** %s, align 4
  %41 = load i8, i8* %40, align 1
  %42 = load i8*, i8** %r, align 4
  %incdec.ptr49 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr49, i8** %r, align 4
  store i8 %41, i8* %42, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body47
  %43 = load i32, i32* %_k, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %_k, align 4
  br label %for.cond44

for.end:                                          ; preds = %for.cond44
  br label %if.end53

if.else50:                                        ; preds = %do.body
  %44 = load i8*, i8** %s, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr51, i8** %s, align 4
  %45 = load i8, i8* %44, align 1
  %46 = load i8*, i8** %r, align 4
  %incdec.ptr52 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr52, i8** %r, align 4
  store i8 %45, i8* %46, align 1
  br label %if.end53

if.end53:                                         ; preds = %if.else50, %for.end
  br label %do.end

do.end:                                           ; preds = %if.end53
  %47 = load i8*, i8** %s, align 4
  %incdec.ptr54 = getelementptr inbounds i8, i8* %47, i32 -1
  store i8* %incdec.ptr54, i8** %s, align 4
  br label %for.inc97

if.end55:                                         ; preds = %land.lhs.true17, %if.end
  %48 = load i8*, i8** %backslash_table, align 4
  %49 = load i32, i32* %c, align 4
  %conv56 = trunc i32 %49 to i8
  %idxprom57 = zext i8 %conv56 to i32
  %arrayidx58 = getelementptr inbounds i8, i8* %48, i32 %idxprom57
  %50 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %50 to i32
  %cmp60 = icmp eq i32 %conv59, 1
  br i1 %cmp60, label %if.then62, label %if.else64

if.then62:                                        ; preds = %if.end55
  %51 = load i8*, i8** %r, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %incdec.ptr63, i8** %r, align 4
  store i8 92, i8* %51, align 1
  br label %if.end94

if.else64:                                        ; preds = %if.end55
  %52 = load i32, i32* %c, align 4
  %cmp65 = icmp eq i32 %52, 35
  br i1 %cmp65, label %land.lhs.true67, label %if.else72

land.lhs.true67:                                  ; preds = %if.else64
  %53 = load i8*, i8** %s, align 4
  %54 = load i8*, i8** %string.addr, align 4
  %cmp68 = icmp eq i8* %53, %54
  br i1 %cmp68, label %if.then70, label %if.else72

if.then70:                                        ; preds = %land.lhs.true67
  %55 = load i8*, i8** %r, align 4
  %incdec.ptr71 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr71, i8** %r, align 4
  store i8 92, i8* %55, align 1
  br label %if.end93

if.else72:                                        ; preds = %land.lhs.true67, %if.else64
  %56 = load i32, i32* %flags.addr, align 4
  %and = and i32 %56, 1
  %tobool73 = icmp ne i32 %and, 0
  br i1 %tobool73, label %land.lhs.true74, label %if.end92

land.lhs.true74:                                  ; preds = %if.else72
  %57 = load i32, i32* %c, align 4
  %cmp75 = icmp eq i32 %57, 126
  br i1 %cmp75, label %land.lhs.true77, label %if.end92

land.lhs.true77:                                  ; preds = %land.lhs.true74
  %58 = load i8*, i8** %s, align 4
  %59 = load i8*, i8** %string.addr, align 4
  %cmp78 = icmp eq i8* %58, %59
  br i1 %cmp78, label %if.then90, label %lor.lhs.false80

lor.lhs.false80:                                  ; preds = %land.lhs.true77
  %60 = load i8*, i8** %s, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %60, i32 -1
  %61 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %61 to i32
  %cmp83 = icmp eq i32 %conv82, 58
  br i1 %cmp83, label %if.then90, label %lor.lhs.false85

lor.lhs.false85:                                  ; preds = %lor.lhs.false80
  %62 = load i8*, i8** %s, align 4
  %arrayidx86 = getelementptr inbounds i8, i8* %62, i32 -1
  %63 = load i8, i8* %arrayidx86, align 1
  %conv87 = sext i8 %63 to i32
  %cmp88 = icmp eq i32 %conv87, 61
  br i1 %cmp88, label %if.then90, label %if.end92

if.then90:                                        ; preds = %lor.lhs.false85, %lor.lhs.false80, %land.lhs.true77
  %64 = load i8*, i8** %r, align 4
  %incdec.ptr91 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr91, i8** %r, align 4
  store i8 92, i8* %64, align 1
  br label %if.end92

if.end92:                                         ; preds = %if.then90, %lor.lhs.false85, %land.lhs.true74, %if.else72
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %if.then70
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.then62
  %65 = load i32, i32* %c, align 4
  %conv95 = trunc i32 %65 to i8
  %66 = load i8*, i8** %r, align 4
  %incdec.ptr96 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %incdec.ptr96, i8** %r, align 4
  store i8 %conv95, i8* %66, align 1
  br label %for.inc97

for.inc97:                                        ; preds = %if.end94, %do.end, %if.then
  %67 = load i8*, i8** %s, align 4
  %incdec.ptr98 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %incdec.ptr98, i8** %s, align 4
  br label %for.cond

for.end99:                                        ; preds = %land.end
  %68 = load i8*, i8** %r, align 4
  store i8 0, i8* %68, align 1
  %69 = load i8*, i8** %result, align 4
  ret i8* %69
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: noinline nounwind
define i8* @sh_backslash_quote_for_double_quotes(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %c = alloca i8, align 1
  %result = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %mul = mul i32 2, %call
  %add = add i32 %mul, 1
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 293)
  store i8* %call1, i8** %result, align 4
  %1 = load i8*, i8** %result, align 4
  store i8* %1, i8** %r, align 4
  %2 = load i8*, i8** %string.addr, align 4
  store i8* %2, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  store i8 %5, i8* %c, align 1
  %conv = zext i8 %5 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load i8, i8* %c, align 1
  %idxprom = zext i8 %7 to i32
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  %and = and i32 %8, 64
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %9 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 92, i8* %9, align 1
  br label %if.end11

if.else:                                          ; preds = %for.body
  %10 = load i8, i8* %c, align 1
  %conv4 = zext i8 %10 to i32
  %cmp = icmp eq i32 %conv4, 1
  br i1 %cmp, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %11 = load i8, i8* %c, align 1
  %conv6 = zext i8 %11 to i32
  %cmp7 = icmp eq i32 %conv6, 127
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %lor.lhs.false, %if.else
  %12 = load i8*, i8** %r, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr10, i8** %r, align 4
  store i8 1, i8* %12, align 1
  br label %if.end

if.end:                                           ; preds = %if.then9, %lor.lhs.false
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  %13 = load i8, i8* %c, align 1
  %14 = load i8*, i8** %r, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr12, i8** %r, align 4
  store i8 %13, i8* %14, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %15 = load i8*, i8** %s, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr13, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %16 = load i8*, i8** %r, align 4
  store i8 0, i8* %16, align 1
  %17 = load i8*, i8** %result, align 4
  ret i8* %17
}

; Function Attrs: noinline nounwind
define i8* @sh_quote_reusable(i8* %s, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %s.addr, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %s.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then3, label %if.else6

if.then3:                                         ; preds = %if.else
  %call = call i8* @sh_xmalloc(i32 3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 322)
  store i8* %call, i8** %ret, align 4
  %4 = load i8*, i8** %ret, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 1
  store i8 39, i8* %arrayidx, align 1
  %5 = load i8*, i8** %ret, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i32 0
  store i8 39, i8* %arrayidx4, align 1
  %6 = load i8*, i8** %ret, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i32 2
  store i8 0, i8* %arrayidx5, align 1
  br label %if.end17

if.else6:                                         ; preds = %if.else
  %7 = load i8*, i8** %s.addr, align 4
  %call7 = call i32 @ansic_shouldquote(i8* %7)
  %tobool = icmp ne i32 %call7, 0
  br i1 %tobool, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else6
  %8 = load i8*, i8** %s.addr, align 4
  %call9 = call i8* @ansic_quote(i8* %8, i32 0, i32* null)
  store i8* %call9, i8** %ret, align 4
  br label %if.end16

if.else10:                                        ; preds = %if.else6
  %9 = load i32, i32* %flags.addr, align 4
  %tobool11 = icmp ne i32 %9, 0
  br i1 %tobool11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.else10
  %10 = load i8*, i8** %s.addr, align 4
  %call13 = call i8* @sh_backslash_quote(i8* %10, i8* null, i32 1)
  store i8* %call13, i8** %ret, align 4
  br label %if.end

if.else14:                                        ; preds = %if.else10
  %11 = load i8*, i8** %s.addr, align 4
  %call15 = call i8* @sh_single_quote(i8* %11)
  store i8* %call15, i8** %ret, align 4
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then12
  br label %if.end16

if.end16:                                         ; preds = %if.end, %if.then8
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then3
  br label %if.end18

if.end18:                                         ; preds = %if.end17
  %12 = load i8*, i8** %ret, align 4
  store i8* %12, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then
  %13 = load i8*, i8** %retval, align 4
  ret i8* %13
}

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

; Function Attrs: noinline nounwind
define i32 @sh_contains_shell_metas(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  switch i32 %conv2, label %sw.default [
    i32 32, label %sw.bb
    i32 9, label %sw.bb
    i32 10, label %sw.bb
    i32 39, label %sw.bb
    i32 34, label %sw.bb
    i32 92, label %sw.bb
    i32 124, label %sw.bb
    i32 38, label %sw.bb
    i32 59, label %sw.bb
    i32 40, label %sw.bb
    i32 41, label %sw.bb
    i32 60, label %sw.bb
    i32 62, label %sw.bb
    i32 33, label %sw.bb
    i32 123, label %sw.bb
    i32 125, label %sw.bb
    i32 42, label %sw.bb
    i32 91, label %sw.bb
    i32 63, label %sw.bb
    i32 93, label %sw.bb
    i32 94, label %sw.bb
    i32 36, label %sw.bb
    i32 96, label %sw.bb
    i32 126, label %sw.bb3
    i32 35, label %sw.bb13
  ]

sw.bb:                                            ; preds = %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body, %for.body
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %for.body
  %7 = load i8*, i8** %s, align 4
  %8 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %7, %8
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb3
  %9 = load i8*, i8** %s, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 -1
  %10 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %10 to i32
  %cmp6 = icmp eq i32 %conv5, 61
  br i1 %cmp6, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false
  %11 = load i8*, i8** %s, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i32 -1
  %12 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %12 to i32
  %cmp11 = icmp eq i32 %conv10, 58
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false, %sw.bb3
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false8
  br label %sw.epilog

sw.bb13:                                          ; preds = %for.body
  %13 = load i8*, i8** %s, align 4
  %14 = load i8*, i8** %string.addr, align 4
  %cmp14 = icmp eq i8* %13, %14
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %sw.bb13
  store i32 1, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %sw.bb13
  br label %sw.default

sw.default:                                       ; preds = %for.body, %if.end17
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %15 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then16, %if.then, %sw.bb
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

; Function Attrs: noinline nounwind
define i32 @sh_contains_quotes(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv2, 39
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i8*, i8** %s, align 4
  %8 = load i8, i8* %7, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp eq i32 %conv4, 34
  br i1 %cmp5, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %9 = load i8*, i8** %s, align 4
  %10 = load i8, i8* %9, align 1
  %conv8 = sext i8 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 92
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false, %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false7
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
