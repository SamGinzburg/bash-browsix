; ModuleID = 'stringlib.c'
source_filename = "stringlib.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.STRING_INT_ALIST = type { i8*, i32 }

@.str = private unnamed_addr constant [12 x i8] c"stringlib.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @find_string_in_alist(i8* %string, %struct.STRING_INT_ALIST* %alist, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %alist.addr = alloca %struct.STRING_INT_ALIST*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.STRING_INT_ALIST* %alist, %struct.STRING_INT_ALIST** %alist.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* %r, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %0, i32 %1
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %flags.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %4 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %4, i32 %5
  %word3 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx2, i32 0, i32 0
  %6 = load i8*, i8** %word3, align 4
  %7 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strmatch(i8* %6, i8* %7, i32 32)
  %cmp = icmp ne i32 %call, 1
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %8 = load i8*, i8** %string.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %10 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %10, i32 %11
  %word7 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx6, i32 0, i32 0
  %12 = load i8*, i8** %word7, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp eq i32 %conv5, %conv9
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.else
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %15, i32 %16
  %word13 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx12, i32 0, i32 0
  %17 = load i8*, i8** %word13, align 4
  %call14 = call i32 @strcmp(i8* %14, i8* %17)
  %cmp15 = icmp eq i32 %call14, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.else
  %18 = phi i1 [ false, %if.else ], [ %cmp15, %land.rhs ]
  %land.ext = zext i1 %18 to i32
  store i32 %land.ext, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %land.end, %if.then
  %19 = load i32, i32* %r, align 4
  %tobool17 = icmp ne i32 %19, 0
  br i1 %tobool17, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.end
  %20 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %20, i32 %21
  %token = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx19, i32 0, i32 1
  %22 = load i32, i32* %token, align 4
  store i32 %22, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %23 = load i32, i32* %i, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then18
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i32 @strmatch(i8*, i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8* @find_token_in_alist(i32 %token, %struct.STRING_INT_ALIST* %alist, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %token.addr = alloca i32, align 4
  %alist.addr = alloca %struct.STRING_INT_ALIST*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %token, i32* %token.addr, align 4
  store %struct.STRING_INT_ALIST* %alist, %struct.STRING_INT_ALIST** %alist.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %0, i32 %1
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %3, i32 %4
  %token2 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx1, i32 0, i32 1
  %5 = load i32, i32* %token2, align 4
  %6 = load i32, i32* %token.addr, align 4
  %cmp = icmp eq i32 %5, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %7 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %7, i32 %8
  %word4 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx3, i32 0, i32 0
  %9 = load i8*, i8** %word4, align 4
  %call = call i32 @strlen(i8* %9)
  %add = add i32 1, %call
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 88)
  %10 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %10, i32 %11
  %word7 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx6, i32 0, i32 0
  %12 = load i8*, i8** %word7, align 4
  %call8 = call i8* @strcpy(i8* %call5, i8* %12)
  store i8* %call8, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @find_index_in_alist(i8* %string, %struct.STRING_INT_ALIST* %alist, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %alist.addr = alloca %struct.STRING_INT_ALIST*, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.STRING_INT_ALIST* %alist, %struct.STRING_INT_ALIST** %alist.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 0, i32* %r, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %0, i32 %1
  %word = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %flags.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %4 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %4, i32 %5
  %word3 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx2, i32 0, i32 0
  %6 = load i8*, i8** %word3, align 4
  %7 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strmatch(i8* %6, i8* %7, i32 32)
  %cmp = icmp ne i32 %call, 1
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %8 = load i8*, i8** %string.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %10 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %10, i32 %11
  %word7 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx6, i32 0, i32 0
  %12 = load i8*, i8** %word7, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp eq i32 %conv5, %conv9
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.else
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load %struct.STRING_INT_ALIST*, %struct.STRING_INT_ALIST** %alist.addr, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx12 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %15, i32 %16
  %word13 = getelementptr inbounds %struct.STRING_INT_ALIST, %struct.STRING_INT_ALIST* %arrayidx12, i32 0, i32 0
  %17 = load i8*, i8** %word13, align 4
  %call14 = call i32 @strcmp(i8* %14, i8* %17)
  %cmp15 = icmp eq i32 %call14, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.else
  %18 = phi i1 [ false, %if.else ], [ %cmp15, %land.rhs ]
  %land.ext = zext i1 %18 to i32
  store i32 %land.ext, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %land.end, %if.then
  %19 = load i32, i32* %r, align 4
  %tobool17 = icmp ne i32 %19, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then18
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define i8* @substring(i8* %string, i32 %start, i32 %end) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %result = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %0, %1
  store i32 %sub, i32* %len, align 4
  %2 = load i32, i32* %len, align 4
  %add = add nsw i32 %2, 1
  %call = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 135)
  store i8* %call, i8** %result, align 4
  %3 = load i8*, i8** %result, align 4
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %start.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i32, i32* %len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* %add.ptr, i32 %6, i32 1, i1 false)
  %7 = load i8*, i8** %result, align 4
  %8 = load i32, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 %8
  store i8 0, i8* %arrayidx, align 1
  %9 = load i8*, i8** %result, align 4
  ret i8* %9
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define i8* @strsub(i8* %string, i8* %pat, i8* %rep, i32 %global) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %pat.addr = alloca i8*, align 4
  %rep.addr = alloca i8*, align 4
  %global.addr = alloca i32, align 4
  %patlen = alloca i32, align 4
  %replen = alloca i32, align 4
  %templen = alloca i32, align 4
  %tempsize = alloca i32, align 4
  %repl = alloca i32, align 4
  %i = alloca i32, align 4
  %temp = alloca i8*, align 4
  %r = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %rep, i8** %rep.addr, align 4
  store i32 %global, i32* %global.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %patlen, align 4
  %1 = load i8*, i8** %rep.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  store i32 %call1, i32* %replen, align 4
  store i8* null, i8** %temp, align 4
  store i32 0, i32* %tempsize, align 4
  store i32 0, i32* %templen, align 4
  store i32 0, i32* %i, align 4
  store i32 1, i32* %repl, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end53, %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %repl, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %6 = load i32, i32* %patlen, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  br i1 true, label %if.then, label %if.else

cond.false:                                       ; preds = %land.lhs.true
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %7, i32 %8
  %arrayidx3 = getelementptr inbounds i8, i8* %add.ptr, i32 0
  %9 = load i8, i8* %arrayidx3, align 1
  %conv = sext i8 %9 to i32
  %10 = load i8*, i8** %pat.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %11 to i32
  %cmp6 = icmp eq i32 %conv, %conv5
  br i1 %cmp6, label %land.lhs.true8, label %if.else

land.lhs.true8:                                   ; preds = %cond.false
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %i, align 4
  %add.ptr9 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8*, i8** %pat.addr, align 4
  %15 = load i32, i32* %patlen, align 4
  %call10 = call i32 @strncmp(i8* %add.ptr9, i8* %14, i32 %15)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true8, %cond.true
  %16 = load i32, i32* %replen, align 4
  %tobool13 = icmp ne i32 %16, 0
  br i1 %tobool13, label %if.then14, label %if.end23

if.then14:                                        ; preds = %if.then
  br label %do.body

do.body:                                          ; preds = %if.then14
  %17 = load i32, i32* %templen, align 4
  %18 = load i32, i32* %replen, align 4
  %add = add nsw i32 %17, %18
  %19 = load i32, i32* %tempsize, align 4
  %cmp15 = icmp sge i32 %add, %19
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then17
  %20 = load i32, i32* %templen, align 4
  %21 = load i32, i32* %replen, align 4
  %add18 = add nsw i32 %20, %21
  %22 = load i32, i32* %tempsize, align 4
  %cmp19 = icmp sge i32 %add18, %22
  br i1 %cmp19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %23 = load i32, i32* %replen, align 4
  %mul = mul nsw i32 %23, 2
  %24 = load i32, i32* %tempsize, align 4
  %add21 = add nsw i32 %24, %mul
  store i32 %add21, i32* %tempsize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load i8*, i8** %temp, align 4
  %26 = load i32, i32* %tempsize, align 4
  %call22 = call i8* @sh_xrealloc(i8* %25, i32 %26, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 159)
  store i8* %call22, i8** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end23

if.end23:                                         ; preds = %do.end, %if.then
  %27 = load i8*, i8** %rep.addr, align 4
  store i8* %27, i8** %r, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.body26, %if.end23
  %28 = load i8*, i8** %r, align 4
  %29 = load i8, i8* %28, align 1
  %tobool25 = icmp ne i8 %29, 0
  br i1 %tobool25, label %for.body26, label %for.end

for.body26:                                       ; preds = %for.cond24
  %30 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  %31 = load i8, i8* %30, align 1
  %32 = load i8*, i8** %temp, align 4
  %33 = load i32, i32* %templen, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %templen, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %32, i32 %33
  store i8 %31, i8* %arrayidx27, align 1
  br label %for.cond24

for.end:                                          ; preds = %for.cond24
  %34 = load i32, i32* %patlen, align 4
  %tobool28 = icmp ne i32 %34, 0
  br i1 %tobool28, label %cond.true29, label %cond.false30

cond.true29:                                      ; preds = %for.end
  %35 = load i32, i32* %patlen, align 4
  br label %cond.end

cond.false30:                                     ; preds = %for.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false30, %cond.true29
  %cond = phi i32 [ %35, %cond.true29 ], [ 1, %cond.false30 ]
  %36 = load i32, i32* %i, align 4
  %add31 = add nsw i32 %36, %cond
  store i32 %add31, i32* %i, align 4
  %37 = load i32, i32* %global.addr, align 4
  %cmp32 = icmp ne i32 %37, 0
  %conv33 = zext i1 %cmp32 to i32
  store i32 %conv33, i32* %repl, align 4
  br label %if.end53

if.else:                                          ; preds = %land.lhs.true8, %cond.false, %cond.true, %for.body
  br label %do.body34

do.body34:                                        ; preds = %if.else
  %38 = load i32, i32* %templen, align 4
  %add35 = add nsw i32 %38, 1
  %39 = load i32, i32* %tempsize, align 4
  %cmp36 = icmp sge i32 %add35, %39
  br i1 %cmp36, label %if.then38, label %if.end47

if.then38:                                        ; preds = %do.body34
  br label %while.cond39

while.cond39:                                     ; preds = %while.body43, %if.then38
  %40 = load i32, i32* %templen, align 4
  %add40 = add nsw i32 %40, 1
  %41 = load i32, i32* %tempsize, align 4
  %cmp41 = icmp sge i32 %add40, %41
  br i1 %cmp41, label %while.body43, label %while.end45

while.body43:                                     ; preds = %while.cond39
  %42 = load i32, i32* %tempsize, align 4
  %add44 = add nsw i32 %42, 16
  store i32 %add44, i32* %tempsize, align 4
  br label %while.cond39

while.end45:                                      ; preds = %while.cond39
  %43 = load i8*, i8** %temp, align 4
  %44 = load i32, i32* %tempsize, align 4
  %call46 = call i8* @sh_xrealloc(i8* %43, i32 %44, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 169)
  store i8* %call46, i8** %temp, align 4
  br label %if.end47

if.end47:                                         ; preds = %while.end45, %do.body34
  br label %do.end48

do.end48:                                         ; preds = %if.end47
  %45 = load i8*, i8** %string.addr, align 4
  %46 = load i32, i32* %i, align 4
  %inc49 = add nsw i32 %46, 1
  store i32 %inc49, i32* %i, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx50, align 1
  %48 = load i8*, i8** %temp, align 4
  %49 = load i32, i32* %templen, align 4
  %inc51 = add nsw i32 %49, 1
  store i32 %inc51, i32* %templen, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 %47, i8* %arrayidx52, align 1
  br label %if.end53

if.end53:                                         ; preds = %do.end48, %cond.end
  br label %for.cond

for.end54:                                        ; preds = %for.cond
  %50 = load i8*, i8** %temp, align 4
  %tobool55 = icmp ne i8* %50, null
  br i1 %tobool55, label %if.then56, label %if.else58

if.then56:                                        ; preds = %for.end54
  %51 = load i8*, i8** %temp, align 4
  %52 = load i32, i32* %templen, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %51, i32 %52
  store i8 0, i8* %arrayidx57, align 1
  br label %if.end63

if.else58:                                        ; preds = %for.end54
  %53 = load i8*, i8** %string.addr, align 4
  %call59 = call i32 @strlen(i8* %53)
  %add60 = add i32 1, %call59
  %call61 = call i8* @sh_xmalloc(i32 %add60, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 176)
  %54 = load i8*, i8** %string.addr, align 4
  %call62 = call i8* @strcpy(i8* %call61, i8* %54)
  store i8* %call62, i8** %temp, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.else58, %if.then56
  %55 = load i8*, i8** %temp, align 4
  ret i8* %55
}

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @strcreplace(i8* %string, i32 %c, i8* %text, i32 %do_glob) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %c.addr = alloca i32, align 4
  %text.addr = alloca i8*, align 4
  %do_glob.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  %p = alloca i8*, align 4
  %r = alloca i8*, align 4
  %t = alloca i8*, align 4
  %len = alloca i32, align 4
  %rlen = alloca i32, align 4
  %ind = alloca i32, align 4
  %tlen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %do_glob, i32* %do_glob.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false13

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false13

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %text.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %cond.true5, label %cond.false10

cond.true5:                                       ; preds = %cond.true
  %5 = load i8*, i8** %text.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i32 2
  %6 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %6 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false

cond.true9:                                       ; preds = %cond.true5
  %7 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %7)
  br label %cond.end

cond.false:                                       ; preds = %cond.true5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true9
  %cond = phi i32 [ %call, %cond.true9 ], [ 2, %cond.false ]
  br label %cond.end11

cond.false10:                                     ; preds = %cond.true
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.end
  %cond12 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false10 ]
  br label %cond.end14

cond.false13:                                     ; preds = %land.lhs.true, %entry
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.end11
  %cond15 = phi i32 [ %cond12, %cond.end11 ], [ 0, %cond.false13 ]
  store i32 %cond15, i32* %len, align 4
  %8 = load i32, i32* %len, align 4
  %9 = load i8*, i8** %string.addr, align 4
  %call16 = call i32 @strlen(i8* %9)
  %add = add i32 %8, %call16
  %add17 = add i32 %add, 2
  store i32 %add17, i32* %rlen, align 4
  %10 = load i32, i32* %rlen, align 4
  %call18 = call i8* @sh_xmalloc(i32 %10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 195)
  store i8* %call18, i8** %ret, align 4
  %11 = load i8*, i8** %string.addr, align 4
  store i8* %11, i8** %p, align 4
  %12 = load i8*, i8** %ret, align 4
  store i8* %12, i8** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end95, %if.end65, %cond.end14
  %13 = load i8*, i8** %p, align 4
  %tobool19 = icmp ne i8* %13, null
  br i1 %tobool19, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %14 = load i8*, i8** %p, align 4
  %15 = load i8, i8* %14, align 1
  %conv20 = sext i8 %15 to i32
  %tobool21 = icmp ne i32 %conv20, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %16 = phi i1 [ false, %for.cond ], [ %tobool21, %land.rhs ]
  br i1 %16, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %17 = load i8*, i8** %p, align 4
  %18 = load i8, i8* %17, align 1
  %conv22 = sext i8 %18 to i32
  %19 = load i32, i32* %c.addr, align 4
  %cmp = icmp eq i32 %conv22, %19
  br i1 %cmp, label %if.then, label %if.end66

if.then:                                          ; preds = %for.body
  %20 = load i32, i32* %len, align 4
  %tobool24 = icmp ne i32 %20, 0
  br i1 %tobool24, label %if.then25, label %if.end65

if.then25:                                        ; preds = %if.then
  %21 = load i8*, i8** %r, align 4
  %22 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %21 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %22 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %ind, align 4
  %23 = load i32, i32* %do_glob.addr, align 4
  %tobool26 = icmp ne i32 %23, 0
  br i1 %tobool26, label %land.lhs.true27, label %if.else

land.lhs.true27:                                  ; preds = %if.then25
  %24 = load i8*, i8** %text.addr, align 4
  %call28 = call i32 @glob_pattern_p(i8* %24)
  %tobool29 = icmp ne i32 %call28, 0
  br i1 %tobool29, label %if.then32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true27
  %25 = load i8*, i8** %text.addr, align 4
  %call30 = call i8* @strchr(i8* %25, i32 92)
  %tobool31 = icmp ne i8* %call30, null
  br i1 %tobool31, label %if.then32, label %if.else

if.then32:                                        ; preds = %lor.lhs.false, %land.lhs.true27
  %26 = load i8*, i8** %text.addr, align 4
  %call33 = call i8* @quote_globbing_chars(i8* %26)
  store i8* %call33, i8** %t, align 4
  %27 = load i8*, i8** %t, align 4
  %call34 = call i32 @strlen(i8* %27)
  store i32 %call34, i32* %tlen, align 4
  br label %do.body

do.body:                                          ; preds = %if.then32
  %28 = load i32, i32* %ind, align 4
  %29 = load i32, i32* %tlen, align 4
  %add35 = add nsw i32 %28, %29
  %30 = load i32, i32* %rlen, align 4
  %cmp36 = icmp sge i32 %add35, %30
  br i1 %cmp36, label %if.then38, label %if.end

if.then38:                                        ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then38
  %31 = load i32, i32* %ind, align 4
  %32 = load i32, i32* %tlen, align 4
  %add39 = add nsw i32 %31, %32
  %33 = load i32, i32* %rlen, align 4
  %cmp40 = icmp sge i32 %add39, %33
  br i1 %cmp40, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %34 = load i32, i32* %rlen, align 4
  %35 = load i32, i32* %rlen, align 4
  %add42 = add nsw i32 %35, %34
  store i32 %add42, i32* %rlen, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %36 = load i8*, i8** %ret, align 4
  %37 = load i32, i32* %rlen, align 4
  %call43 = call i8* @sh_xrealloc(i8* %36, i32 %37, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 208)
  store i8* %call43, i8** %ret, align 4
  br label %if.end

if.end:                                           ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %38 = load i8*, i8** %ret, align 4
  %39 = load i32, i32* %ind, align 4
  %add.ptr = getelementptr inbounds i8, i8* %38, i32 %39
  store i8* %add.ptr, i8** %r, align 4
  %40 = load i8*, i8** %r, align 4
  %41 = load i8*, i8** %t, align 4
  %call44 = call i8* @strcpy(i8* %40, i8* %41)
  %42 = load i32, i32* %tlen, align 4
  %43 = load i8*, i8** %r, align 4
  %add.ptr45 = getelementptr inbounds i8, i8* %43, i32 %42
  store i8* %add.ptr45, i8** %r, align 4
  %44 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 212)
  br label %if.end64

if.else:                                          ; preds = %lor.lhs.false, %if.then25
  br label %do.body46

do.body46:                                        ; preds = %if.else
  %45 = load i32, i32* %ind, align 4
  %46 = load i32, i32* %len, align 4
  %add47 = add nsw i32 %45, %46
  %47 = load i32, i32* %rlen, align 4
  %cmp48 = icmp sge i32 %add47, %47
  br i1 %cmp48, label %if.then50, label %if.end59

if.then50:                                        ; preds = %do.body46
  br label %while.cond51

while.cond51:                                     ; preds = %while.body55, %if.then50
  %48 = load i32, i32* %ind, align 4
  %49 = load i32, i32* %len, align 4
  %add52 = add nsw i32 %48, %49
  %50 = load i32, i32* %rlen, align 4
  %cmp53 = icmp sge i32 %add52, %50
  br i1 %cmp53, label %while.body55, label %while.end57

while.body55:                                     ; preds = %while.cond51
  %51 = load i32, i32* %rlen, align 4
  %52 = load i32, i32* %rlen, align 4
  %add56 = add nsw i32 %52, %51
  store i32 %add56, i32* %rlen, align 4
  br label %while.cond51

while.end57:                                      ; preds = %while.cond51
  %53 = load i8*, i8** %ret, align 4
  %54 = load i32, i32* %rlen, align 4
  %call58 = call i8* @sh_xrealloc(i8* %53, i32 %54, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 216)
  store i8* %call58, i8** %ret, align 4
  br label %if.end59

if.end59:                                         ; preds = %while.end57, %do.body46
  br label %do.end60

do.end60:                                         ; preds = %if.end59
  %55 = load i8*, i8** %ret, align 4
  %56 = load i32, i32* %ind, align 4
  %add.ptr61 = getelementptr inbounds i8, i8* %55, i32 %56
  store i8* %add.ptr61, i8** %r, align 4
  %57 = load i8*, i8** %r, align 4
  %58 = load i8*, i8** %text.addr, align 4
  %call62 = call i8* @strcpy(i8* %57, i8* %58)
  %59 = load i32, i32* %len, align 4
  %60 = load i8*, i8** %r, align 4
  %add.ptr63 = getelementptr inbounds i8, i8* %60, i32 %59
  store i8* %add.ptr63, i8** %r, align 4
  br label %if.end64

if.end64:                                         ; preds = %do.end60, %do.end
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then
  %61 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %for.cond

if.end66:                                         ; preds = %for.body
  %62 = load i8*, i8** %p, align 4
  %63 = load i8, i8* %62, align 1
  %conv67 = sext i8 %63 to i32
  %cmp68 = icmp eq i32 %conv67, 92
  br i1 %cmp68, label %land.lhs.true70, label %if.end77

land.lhs.true70:                                  ; preds = %if.end66
  %64 = load i8*, i8** %p, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %64, i32 1
  %65 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %65 to i32
  %66 = load i32, i32* %c.addr, align 4
  %cmp73 = icmp eq i32 %conv72, %66
  br i1 %cmp73, label %if.then75, label %if.end77

if.then75:                                        ; preds = %land.lhs.true70
  %67 = load i8*, i8** %p, align 4
  %incdec.ptr76 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %incdec.ptr76, i8** %p, align 4
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %land.lhs.true70, %if.end66
  %68 = load i8*, i8** %r, align 4
  %69 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast78 = ptrtoint i8* %68 to i32
  %sub.ptr.rhs.cast79 = ptrtoint i8* %69 to i32
  %sub.ptr.sub80 = sub i32 %sub.ptr.lhs.cast78, %sub.ptr.rhs.cast79
  store i32 %sub.ptr.sub80, i32* %ind, align 4
  br label %do.body81

do.body81:                                        ; preds = %if.end77
  %70 = load i32, i32* %ind, align 4
  %add82 = add nsw i32 %70, 2
  %71 = load i32, i32* %rlen, align 4
  %cmp83 = icmp sge i32 %add82, %71
  br i1 %cmp83, label %if.then85, label %if.end94

if.then85:                                        ; preds = %do.body81
  br label %while.cond86

while.cond86:                                     ; preds = %while.body90, %if.then85
  %72 = load i32, i32* %ind, align 4
  %add87 = add nsw i32 %72, 2
  %73 = load i32, i32* %rlen, align 4
  %cmp88 = icmp sge i32 %add87, %73
  br i1 %cmp88, label %while.body90, label %while.end92

while.body90:                                     ; preds = %while.cond86
  %74 = load i32, i32* %rlen, align 4
  %75 = load i32, i32* %rlen, align 4
  %add91 = add nsw i32 %75, %74
  store i32 %add91, i32* %rlen, align 4
  br label %while.cond86

while.end92:                                      ; preds = %while.cond86
  %76 = load i8*, i8** %ret, align 4
  %77 = load i32, i32* %rlen, align 4
  %call93 = call i8* @sh_xrealloc(i8* %76, i32 %77, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 230)
  store i8* %call93, i8** %ret, align 4
  br label %if.end94

if.end94:                                         ; preds = %while.end92, %do.body81
  br label %do.end95

do.end95:                                         ; preds = %if.end94
  %78 = load i8*, i8** %ret, align 4
  %79 = load i32, i32* %ind, align 4
  %add.ptr96 = getelementptr inbounds i8, i8* %78, i32 %79
  store i8* %add.ptr96, i8** %r, align 4
  %80 = load i8*, i8** %p, align 4
  %incdec.ptr97 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %incdec.ptr97, i8** %p, align 4
  %81 = load i8, i8* %80, align 1
  %82 = load i8*, i8** %r, align 4
  %incdec.ptr98 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %incdec.ptr98, i8** %r, align 4
  store i8 %81, i8* %82, align 1
  br label %for.cond

for.end:                                          ; preds = %land.end
  %83 = load i8*, i8** %r, align 4
  store i8 0, i8* %83, align 1
  %84 = load i8*, i8** %ret, align 4
  ret i8* %84
}

declare i32 @glob_pattern_p(i8*) #1

declare i8* @strchr(i8*, i32) #1

declare i8* @quote_globbing_chars(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @strip_trailing(i8* %string, i32 %len, i32 %newlines_only) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %newlines_only.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %newlines_only, i32* %newlines_only.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %len.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %newlines_only.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %while.body
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i32, i32* %len.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp1 = icmp eq i32 %conv, 10
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %while.body
  %5 = load i32, i32* %newlines_only.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.else, label %land.lhs.true4

land.lhs.true4:                                   ; preds = %lor.lhs.false
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %len.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %8 to i32
  %cmp7 = icmp eq i32 %conv6, 32
  br i1 %cmp7, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %land.lhs.true4
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i32, i32* %len.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %11 to i32
  %cmp12 = icmp eq i32 %conv11, 9
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false9, %land.lhs.true4, %land.lhs.true
  %12 = load i32, i32* %len.addr, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %len.addr, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false9, %lor.lhs.false
  br label %while.end

if.end:                                           ; preds = %if.then
  br label %while.cond

while.end:                                        ; preds = %if.else, %while.cond
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %len.addr, align 4
  %add = add nsw i32 %14, 1
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i32 %add
  store i8 0, i8* %arrayidx14, align 1
  ret void
}

; Function Attrs: noinline nounwind
define void @xbcopy(i8* %s, i8* %d, i32 %n) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %d.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %d, i8** %d.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8*, i8** %d.addr, align 4
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i32, i32* %n.addr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* %1, i32 %2, i32 1, i1 false)
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
