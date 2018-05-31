; ModuleID = './tilde.c'
source_filename = "./tilde.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

@tilde_expansion_preexpansion_hook = global i8* (i8*)* null, align 4
@tilde_expansion_failure_hook = global i8* (i8*)* null, align 4
@default_prefixes = internal global [3 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* null], align 4
@tilde_additional_prefixes = global i8** getelementptr inbounds ([3 x i8*], [3 x i8*]* @default_prefixes, i32 0, i32 0), align 4
@default_suffixes = internal global [3 x i8*] [i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8* null], align 4
@tilde_additional_suffixes = global i8** getelementptr inbounds ([3 x i8*], [3 x i8*]* @default_suffixes, i32 0, i32 0), align 4
@.str = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c" ~\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"\09~\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind
define i8* @tilde_expand(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %result = alloca i8*, align 4
  %result_size = alloca i32, align 4
  %result_index = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %tilde_word = alloca i8*, align 4
  %expansion = alloca i8*, align 4
  %len = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 0, i32* %result_size, align 4
  store i32 0, i32* %result_index, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8* @strchr(i8* %0, i32 126)
  store i8* %call, i8** %result, align 4
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 %call1, 16
  store i32 %add, i32* %result_size, align 4
  %call2 = call i8* @xmalloc(i32 %add)
  store i8* %call2, i8** %result, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %call3 = call i32 @strlen(i8* %2)
  %add4 = add i32 %call3, 1
  store i32 %add4, i32* %result_size, align 4
  %call5 = call i8* @xmalloc(i32 %add4)
  store i8* %call5, i8** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.body

while.body:                                       ; preds = %if.end, %if.end41
  %3 = load i8*, i8** %string.addr, align 4
  %call6 = call i32 @tilde_find_prefix(i8* %3, i32* %len)
  store i32 %call6, i32* %start, align 4
  %4 = load i32, i32* %result_index, align 4
  %5 = load i32, i32* %start, align 4
  %add7 = add nsw i32 %4, %5
  %add8 = add nsw i32 %add7, 1
  %6 = load i32, i32* %result_size, align 4
  %cmp = icmp sgt i32 %add8, %6
  br i1 %cmp, label %if.then9, label %if.end14

if.then9:                                         ; preds = %while.body
  %7 = load i8*, i8** %result, align 4
  %8 = load i32, i32* %start, align 4
  %add10 = add nsw i32 %8, 20
  %9 = load i32, i32* %result_size, align 4
  %add11 = add nsw i32 %9, %add10
  store i32 %add11, i32* %result_size, align 4
  %add12 = add nsw i32 1, %add11
  %call13 = call i8* @xrealloc(i8* %7, i32 %add12)
  store i8* %call13, i8** %result, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then9, %while.body
  %10 = load i8*, i8** %result, align 4
  %11 = load i32, i32* %result_index, align 4
  %add.ptr = getelementptr inbounds i8, i8* %10, i32 %11
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %start, align 4
  %call15 = call i8* @strncpy(i8* %add.ptr, i8* %12, i32 %13)
  %14 = load i32, i32* %start, align 4
  %15 = load i32, i32* %result_index, align 4
  %add16 = add nsw i32 %15, %14
  store i32 %add16, i32* %result_index, align 4
  %16 = load i32, i32* %start, align 4
  %17 = load i8*, i8** %string.addr, align 4
  %add.ptr17 = getelementptr inbounds i8, i8* %17, i32 %16
  store i8* %add.ptr17, i8** %string.addr, align 4
  %18 = load i8*, i8** %string.addr, align 4
  %call18 = call i32 @tilde_find_suffix(i8* %18)
  store i32 %call18, i32* %end, align 4
  %19 = load i32, i32* %start, align 4
  %tobool19 = icmp ne i32 %19, 0
  br i1 %tobool19, label %if.end22, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end14
  %20 = load i32, i32* %end, align 4
  %tobool20 = icmp ne i32 %20, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %land.lhs.true
  br label %while.end

if.end22:                                         ; preds = %land.lhs.true, %if.end14
  %21 = load i32, i32* %end, align 4
  %add23 = add nsw i32 1, %21
  %call24 = call i8* @xmalloc(i32 %add23)
  store i8* %call24, i8** %tilde_word, align 4
  %22 = load i8*, i8** %tilde_word, align 4
  %23 = load i8*, i8** %string.addr, align 4
  %24 = load i32, i32* %end, align 4
  %call25 = call i8* @strncpy(i8* %22, i8* %23, i32 %24)
  %25 = load i8*, i8** %tilde_word, align 4
  %26 = load i32, i32* %end, align 4
  %arrayidx = getelementptr inbounds i8, i8* %25, i32 %26
  store i8 0, i8* %arrayidx, align 1
  %27 = load i32, i32* %end, align 4
  %28 = load i8*, i8** %string.addr, align 4
  %add.ptr26 = getelementptr inbounds i8, i8* %28, i32 %27
  store i8* %add.ptr26, i8** %string.addr, align 4
  %29 = load i8*, i8** %tilde_word, align 4
  %call27 = call i8* @tilde_expand_word(i8* %29)
  store i8* %call27, i8** %expansion, align 4
  %30 = load i8*, i8** %expansion, align 4
  %cmp28 = icmp eq i8* %30, null
  br i1 %cmp28, label %if.then29, label %if.else30

if.then29:                                        ; preds = %if.end22
  %31 = load i8*, i8** %tilde_word, align 4
  store i8* %31, i8** %expansion, align 4
  br label %if.end31

if.else30:                                        ; preds = %if.end22
  %32 = load i8*, i8** %tilde_word, align 4
  call void @xfree(i8* %32)
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %if.then29
  %33 = load i8*, i8** %expansion, align 4
  %call32 = call i32 @strlen(i8* %33)
  store i32 %call32, i32* %len, align 4
  %34 = load i32, i32* %result_index, align 4
  %35 = load i32, i32* %len, align 4
  %add33 = add nsw i32 %34, %35
  %add34 = add nsw i32 %add33, 1
  %36 = load i32, i32* %result_size, align 4
  %cmp35 = icmp sgt i32 %add34, %36
  br i1 %cmp35, label %if.then36, label %if.end41

if.then36:                                        ; preds = %if.end31
  %37 = load i8*, i8** %result, align 4
  %38 = load i32, i32* %len, align 4
  %add37 = add nsw i32 %38, 20
  %39 = load i32, i32* %result_size, align 4
  %add38 = add nsw i32 %39, %add37
  store i32 %add38, i32* %result_size, align 4
  %add39 = add nsw i32 1, %add38
  %call40 = call i8* @xrealloc(i8* %37, i32 %add39)
  store i8* %call40, i8** %result, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.then36, %if.end31
  %40 = load i8*, i8** %result, align 4
  %41 = load i32, i32* %result_index, align 4
  %add.ptr42 = getelementptr inbounds i8, i8* %40, i32 %41
  %42 = load i8*, i8** %expansion, align 4
  %call43 = call i8* @strcpy(i8* %add.ptr42, i8* %42)
  %43 = load i32, i32* %len, align 4
  %44 = load i32, i32* %result_index, align 4
  %add44 = add nsw i32 %44, %43
  store i32 %add44, i32* %result_index, align 4
  %45 = load i8*, i8** %expansion, align 4
  call void @xfree(i8* %45)
  br label %while.body

while.end:                                        ; preds = %if.then21
  %46 = load i8*, i8** %result, align 4
  %47 = load i32, i32* %result_index, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %46, i32 %47
  store i8 0, i8* %arrayidx45, align 1
  %48 = load i8*, i8** %result, align 4
  ret i8* %48
}

declare i8* @strchr(i8*, i32) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @tilde_find_prefix(i8* %string, i32* %len) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %string_len = alloca i32, align 4
  %prefixes = alloca i8**, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* %len, i32** %len.addr, align 4
  %0 = load i8**, i8*** @tilde_additional_prefixes, align 4
  store i8** %0, i8*** %prefixes, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %string_len, align 4
  %2 = load i32*, i32** %len.addr, align 4
  store i32 0, i32* %2, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp eq i32 %conv2, 126
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %7 = load i8**, i8*** %prefixes, align 4
  %tobool = icmp ne i8** %7, null
  br i1 %tobool, label %if.then5, label %if.end24

if.then5:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %if.then5
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %string_len, align 4
  %cmp6 = icmp slt i32 %8, %9
  br i1 %cmp6, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %10 = load i8**, i8*** %prefixes, align 4
  %11 = load i32, i32* %j, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx, align 4
  %tobool9 = icmp ne i8* %12, null
  br i1 %tobool9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond8
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8**, i8*** %prefixes, align 4
  %16 = load i32, i32* %j, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx11, align 4
  %18 = load i8**, i8*** %prefixes, align 4
  %19 = load i32, i32* %j, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %18, i32 %19
  %20 = load i8*, i8** %arrayidx12, align 4
  %call13 = call i32 @strlen(i8* %20)
  %call14 = call i32 @strncmp(i8* %add.ptr, i8* %17, i32 %call13)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then17, label %if.end20

if.then17:                                        ; preds = %for.body10
  %21 = load i8**, i8*** %prefixes, align 4
  %22 = load i32, i32* %j, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %21, i32 %22
  %23 = load i8*, i8** %arrayidx18, align 4
  %call19 = call i32 @strlen(i8* %23)
  %sub = sub i32 %call19, 1
  %24 = load i32*, i32** %len.addr, align 4
  store i32 %sub, i32* %24, align 4
  %25 = load i32, i32* %i, align 4
  %26 = load i32*, i32** %len.addr, align 4
  %27 = load i32, i32* %26, align 4
  %add = add nsw i32 %25, %27
  store i32 %add, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %for.body10
  br label %for.inc

for.inc:                                          ; preds = %if.end20
  %28 = load i32, i32* %j, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %29 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %29, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  br label %if.end24

if.end24:                                         ; preds = %for.end23, %if.end
  %30 = load i32, i32* %string_len, align 4
  store i32 %30, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.then17, %if.then
  %31 = load i32, i32* %retval, align 4
  ret i32 %31
}

declare i8* @xrealloc(i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @tilde_find_suffix(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %string_len = alloca i32, align 4
  %suffixes = alloca i8**, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8**, i8*** @tilde_additional_suffixes, align 4
  store i8** %0, i8*** %suffixes, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %string_len, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %string_len, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 47
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end17

if.end:                                           ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %if.end
  %7 = load i8**, i8*** %suffixes, align 4
  %tobool = icmp ne i8** %7, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond3
  %8 = load i8**, i8*** %suffixes, align 4
  %9 = load i32, i32* %j, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %8, i32 %9
  %10 = load i8*, i8** %arrayidx4, align 4
  %tobool5 = icmp ne i8* %10, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond3
  %11 = phi i1 [ false, %for.cond3 ], [ %tobool5, %land.rhs ]
  br i1 %11, label %for.body6, label %for.end

for.body6:                                        ; preds = %land.end
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8**, i8*** %suffixes, align 4
  %15 = load i32, i32* %j, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx7, align 4
  %17 = load i8**, i8*** %suffixes, align 4
  %18 = load i32, i32* %j, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %17, i32 %18
  %19 = load i8*, i8** %arrayidx8, align 4
  %call9 = call i32 @strlen(i8* %19)
  %call10 = call i32 @strncmp(i8* %add.ptr, i8* %16, i32 %call9)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %for.body6
  %20 = load i32, i32* %i, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %for.body6
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %21 = load i32, i32* %j, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %land.end
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %22 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %22, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %if.then, %for.cond
  %23 = load i32, i32* %i, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end17, %if.then13
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind
define i8* @tilde_expand_word(i8* %filename) #0 {
entry:
  %retval = alloca i8*, align 4
  %filename.addr = alloca i8*, align 4
  %dirname = alloca i8*, align 4
  %expansion = alloca i8*, align 4
  %username = alloca i8*, align 4
  %user_len = alloca i32, align 4
  %user_entry = alloca %struct.passwd*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp ne i32 %conv, 126
  br i1 %cmp1, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %3 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call4 = call i8* @xmalloc(i32 %add)
  %4 = load i8*, i8** %filename.addr, align 4
  %call5 = call i8* @strcpy(i8* %call4, i8* %4)
  store i8* %call5, i8** %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %5 = load i8*, i8** %filename.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 1
  %6 = load i8, i8* %arrayidx, align 1
  %conv7 = sext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i8*, i8** %filename.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %8 to i32
  %cmp12 = icmp eq i32 %conv11, 47
  br i1 %cmp12, label %if.then14, label %if.end22

if.then14:                                        ; preds = %lor.lhs.false, %if.end6
  %call15 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i8* %call15, i8** %expansion, align 4
  %9 = load i8*, i8** %expansion, align 4
  %cmp16 = icmp eq i8* %9, null
  br i1 %cmp16, label %if.then18, label %if.end20

if.then18:                                        ; preds = %if.then14
  %call19 = call i8* @sh_get_home_dir()
  store i8* %call19, i8** %expansion, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.then14
  %10 = load i8*, i8** %expansion, align 4
  %11 = load i8*, i8** %filename.addr, align 4
  %call21 = call i8* @glue_prefix_and_suffix(i8* %10, i8* %11, i32 1)
  store i8* %call21, i8** %retval, align 4
  br label %return

if.end22:                                         ; preds = %lor.lhs.false
  %12 = load i8*, i8** %filename.addr, align 4
  %call23 = call i8* @isolate_tilde_prefix(i8* %12, i32* %user_len)
  store i8* %call23, i8** %username, align 4
  %13 = load i8* (i8*)*, i8* (i8*)** @tilde_expansion_preexpansion_hook, align 4
  %tobool = icmp ne i8* (i8*)* %13, null
  br i1 %tobool, label %if.then24, label %if.end30

if.then24:                                        ; preds = %if.end22
  %14 = load i8* (i8*)*, i8* (i8*)** @tilde_expansion_preexpansion_hook, align 4
  %15 = load i8*, i8** %username, align 4
  %call25 = call i8* %14(i8* %15)
  store i8* %call25, i8** %expansion, align 4
  %16 = load i8*, i8** %expansion, align 4
  %tobool26 = icmp ne i8* %16, null
  br i1 %tobool26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.then24
  %17 = load i8*, i8** %expansion, align 4
  %18 = load i8*, i8** %filename.addr, align 4
  %19 = load i32, i32* %user_len, align 4
  %call28 = call i8* @glue_prefix_and_suffix(i8* %17, i8* %18, i32 %19)
  store i8* %call28, i8** %dirname, align 4
  %20 = load i8*, i8** %username, align 4
  call void @xfree(i8* %20)
  %21 = load i8*, i8** %expansion, align 4
  call void @xfree(i8* %21)
  %22 = load i8*, i8** %dirname, align 4
  store i8* %22, i8** %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.then24
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end22
  store i8* null, i8** %dirname, align 4
  store %struct.passwd* null, %struct.passwd** %user_entry, align 4
  %23 = load %struct.passwd*, %struct.passwd** %user_entry, align 4
  %cmp31 = icmp eq %struct.passwd* %23, null
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %if.end30
  %24 = load i8* (i8*)*, i8* (i8*)** @tilde_expansion_failure_hook, align 4
  %tobool34 = icmp ne i8* (i8*)* %24, null
  br i1 %tobool34, label %if.then35, label %if.end41

if.then35:                                        ; preds = %if.then33
  %25 = load i8* (i8*)*, i8* (i8*)** @tilde_expansion_failure_hook, align 4
  %26 = load i8*, i8** %username, align 4
  %call36 = call i8* %25(i8* %26)
  store i8* %call36, i8** %expansion, align 4
  %27 = load i8*, i8** %expansion, align 4
  %tobool37 = icmp ne i8* %27, null
  br i1 %tobool37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then35
  %28 = load i8*, i8** %expansion, align 4
  %29 = load i8*, i8** %filename.addr, align 4
  %30 = load i32, i32* %user_len, align 4
  %call39 = call i8* @glue_prefix_and_suffix(i8* %28, i8* %29, i32 %30)
  store i8* %call39, i8** %dirname, align 4
  %31 = load i8*, i8** %expansion, align 4
  call void @xfree(i8* %31)
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.then35
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %if.then33
  %32 = load i8*, i8** %dirname, align 4
  %cmp42 = icmp eq i8* %32, null
  br i1 %cmp42, label %if.then44, label %if.end49

if.then44:                                        ; preds = %if.end41
  %33 = load i8*, i8** %filename.addr, align 4
  %call45 = call i32 @strlen(i8* %33)
  %add46 = add i32 1, %call45
  %call47 = call i8* @xmalloc(i32 %add46)
  %34 = load i8*, i8** %filename.addr, align 4
  %call48 = call i8* @strcpy(i8* %call47, i8* %34)
  store i8* %call48, i8** %dirname, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then44, %if.end41
  br label %if.end51

if.else:                                          ; preds = %if.end30
  %35 = load %struct.passwd*, %struct.passwd** %user_entry, align 4
  %pw_dir = getelementptr inbounds %struct.passwd, %struct.passwd* %35, i32 0, i32 5
  %36 = load i8*, i8** %pw_dir, align 4
  %37 = load i8*, i8** %filename.addr, align 4
  %38 = load i32, i32* %user_len, align 4
  %call50 = call i8* @glue_prefix_and_suffix(i8* %36, i8* %37, i32 %38)
  store i8* %call50, i8** %dirname, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.else, %if.end49
  %39 = load i8*, i8** %username, align 4
  call void @xfree(i8* %39)
  call void @endpwent()
  %40 = load i8*, i8** %dirname, align 4
  store i8* %40, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end51, %if.then27, %if.end20, %if.then3, %if.then
  %41 = load i8*, i8** %retval, align 4
  ret i8* %41
}

declare void @xfree(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_get_env_value(i8*) #1

declare i8* @sh_get_home_dir() #1

; Function Attrs: noinline nounwind
define internal i8* @glue_prefix_and_suffix(i8* %prefix, i8* %suffix, i32 %suffind) #0 {
entry:
  %prefix.addr = alloca i8*, align 4
  %suffix.addr = alloca i8*, align 4
  %suffind.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  %plen = alloca i32, align 4
  %slen = alloca i32, align 4
  store i8* %prefix, i8** %prefix.addr, align 4
  store i8* %suffix, i8** %suffix.addr, align 4
  store i32 %suffind, i32* %suffind.addr, align 4
  %0 = load i8*, i8** %prefix.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %prefix.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %prefix.addr, align 4
  %call = call i32 @strlen(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %plen, align 4
  %4 = load i8*, i8** %suffix.addr, align 4
  %5 = load i32, i32* %suffind.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %4, i32 %5
  %call2 = call i32 @strlen(i8* %add.ptr)
  store i32 %call2, i32* %slen, align 4
  %6 = load i32, i32* %plen, align 4
  %7 = load i32, i32* %slen, align 4
  %add = add nsw i32 %6, %7
  %add3 = add nsw i32 %add, 1
  %call4 = call i8* @xmalloc(i32 %add3)
  store i8* %call4, i8** %ret, align 4
  %8 = load i32, i32* %plen, align 4
  %tobool5 = icmp ne i32 %8, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %9 = load i8*, i8** %ret, align 4
  %10 = load i8*, i8** %prefix.addr, align 4
  %call6 = call i8* @strcpy(i8* %9, i8* %10)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %11 = load i8*, i8** %ret, align 4
  %12 = load i32, i32* %plen, align 4
  %add.ptr7 = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8*, i8** %suffix.addr, align 4
  %14 = load i32, i32* %suffind.addr, align 4
  %add.ptr8 = getelementptr inbounds i8, i8* %13, i32 %14
  %call9 = call i8* @strcpy(i8* %add.ptr7, i8* %add.ptr8)
  %15 = load i8*, i8** %ret, align 4
  ret i8* %15
}

; Function Attrs: noinline nounwind
define internal i8* @isolate_tilde_prefix(i8* %fname, i32* %lenp) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  %lenp.addr = alloca i32*, align 4
  %ret = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %fname, i8** %fname.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %fname.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %call1 = call i8* @xmalloc(i32 %call)
  store i8* %call1, i8** %ret, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %fname.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i8*, i8** %fname.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  %cmp = icmp ne i32 %conv3, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load i8*, i8** %fname.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i32 %9
  %10 = load i8, i8* %arrayidx5, align 1
  %11 = load i8*, i8** %ret, align 4
  %12 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %12, 1
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i32 %sub
  store i8 %10, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %14 = load i8*, i8** %ret, align 4
  %15 = load i32, i32* %i, align 4
  %sub7 = sub nsw i32 %15, 1
  %arrayidx8 = getelementptr inbounds i8, i8* %14, i32 %sub7
  store i8 0, i8* %arrayidx8, align 1
  %16 = load i32*, i32** %lenp.addr, align 4
  %tobool9 = icmp ne i32* %16, null
  br i1 %tobool9, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %17 = load i32, i32* %i, align 4
  %18 = load i32*, i32** %lenp.addr, align 4
  store i32 %17, i32* %18, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %19 = load i8*, i8** %ret, align 4
  ret i8* %19
}

declare void @endpwent() #1

declare i32 @strncmp(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
