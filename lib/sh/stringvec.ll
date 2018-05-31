; ModuleID = 'stringvec.c'
source_filename = "stringvec.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.g_list = type { %struct.g_list* }

@.str = private unnamed_addr constant [12 x i8] c"stringvec.c\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define i8** @strvec_create(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %mul = mul i32 %0, 4
  %call = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 40)
  %1 = bitcast i8* %call to i8**
  ret i8** %1
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8** @strvec_mcreate(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %mul = mul i32 %0, 4
  %call = call i8* @malloc(i32 %mul)
  %1 = bitcast i8* %call to i8**
  ret i8** %1
}

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define i8** @strvec_resize(i8** %array, i32 %nsize) #0 {
entry:
  %array.addr = alloca i8**, align 4
  %nsize.addr = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 %nsize, i32* %nsize.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %1 = bitcast i8** %0 to i8*
  %2 = load i32, i32* %nsize.addr, align 4
  %mul = mul i32 %2, 4
  %call = call i8* @sh_xrealloc(i8* %1, i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 56)
  %3 = bitcast i8* %call to i8**
  ret i8** %3
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8** @strvec_mresize(i8** %array, i32 %nsize) #0 {
entry:
  %array.addr = alloca i8**, align 4
  %nsize.addr = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 %nsize, i32* %nsize.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %1 = bitcast i8** %0 to i8*
  %2 = load i32, i32* %nsize.addr, align 4
  %mul = mul i32 %2, 4
  %call = call i8* @realloc(i8* %1, i32 %mul)
  %3 = bitcast i8* %call to i8**
  ret i8** %3
}

declare i8* @realloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @strvec_len(i8** %array) #0 {
entry:
  %array.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8**, i8*** %array.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define void @strvec_flush(i8** %array) #0 {
entry:
  %array.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i8**, i8*** %array.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8**, i8*** %array.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx1, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 89)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @strvec_dispose(i8** %array) #0 {
entry:
  %array.addr = alloca i8**, align 4
  store i8** %array, i8*** %array.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %array.addr, align 4
  call void @strvec_flush(i8** %1)
  %2 = load i8**, i8*** %array.addr, align 4
  %3 = bitcast i8** %2 to i8*
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 100)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define i32 @strvec_remove(i8** %array, i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %array.addr = alloca i8**, align 4
  %name.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca i8*, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %if.end
  %1 = load i8**, i8*** %array.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 %2
  %3 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %name.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8**, i8*** %array.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %9 to i32
  %cmp5 = icmp eq i32 %conv, %conv4
  br i1 %cmp5, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %for.body
  %10 = load i8*, i8** %name.addr, align 4
  %11 = load i8**, i8*** %array.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx7, align 4
  %call = call i32 @strcmp(i8* %10, i8* %13)
  %cmp8 = icmp eq i32 %call, 0
  br i1 %cmp8, label %if.then10, label %if.end18

if.then10:                                        ; preds = %land.lhs.true
  %14 = load i8**, i8*** %array.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx11, align 4
  store i8* %16, i8** %x, align 4
  %17 = load i32, i32* %i, align 4
  store i32 %17, i32* %j, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc, %if.then10
  %18 = load i8**, i8*** %array.addr, align 4
  %19 = load i32, i32* %j, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %18, i32 %19
  %20 = load i8*, i8** %arrayidx13, align 4
  %tobool14 = icmp ne i8* %20, null
  br i1 %tobool14, label %for.body15, label %for.end

for.body15:                                       ; preds = %for.cond12
  %21 = load i8**, i8*** %array.addr, align 4
  %22 = load i32, i32* %j, align 4
  %add = add nsw i32 %22, 1
  %arrayidx16 = getelementptr inbounds i8*, i8** %21, i32 %add
  %23 = load i8*, i8** %arrayidx16, align 4
  %24 = load i8**, i8*** %array.addr, align 4
  %25 = load i32, i32* %j, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %24, i32 %25
  store i8* %23, i8** %arrayidx17, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body15
  %26 = load i32, i32* %j, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond12

for.end:                                          ; preds = %for.cond12
  %27 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 119)
  store i32 1, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %land.lhs.true, %for.body
  br label %for.inc19

for.inc19:                                        ; preds = %if.end18
  %28 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %28, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end21, %for.end, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define i8** @strvec_copy(i8** %array) #0 {
entry:
  %array.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %ret = alloca i8**, align 4
  store i8** %array, i8*** %array.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %call = call i32 @strvec_len(i8** %0)
  store i32 %call, i32* %len, align 4
  %1 = load i32, i32* %len, align 4
  %add = add nsw i32 %1, 1
  %mul = mul i32 %add, 4
  %call1 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 153)
  %2 = bitcast i8* %call1 to i8**
  store i8** %2, i8*** %ret, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i8**, i8*** %array.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8**, i8*** %array.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx2, align 4
  %call3 = call i32 @strlen(i8* %8)
  %add4 = add i32 1, %call3
  %call5 = call i8* @sh_xmalloc(i32 %add4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 155)
  %9 = load i8**, i8*** %array.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx6, align 4
  %call7 = call i8* @strcpy(i8* %call5, i8* %11)
  %12 = load i8**, i8*** %ret, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %12, i32 %13
  store i8* %call7, i8** %arrayidx8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i8**, i8*** %ret, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %15, i32 %16
  store i8* null, i8** %arrayidx9, align 4
  %17 = load i8**, i8*** %ret, align 4
  ret i8** %17
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @strvec_strcmp(i8** %s1, i8** %s2) #0 {
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

declare i32 @strcoll(i8*, i8*) #1

; Function Attrs: noinline nounwind
define void @strvec_sort(i8** %array) #0 {
entry:
  %array.addr = alloca i8**, align 4
  store i8** %array, i8*** %array.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %1 = bitcast i8** %0 to i8*
  %2 = load i8**, i8*** %array.addr, align 4
  %call = call i32 @strvec_len(i8** %2)
  call void @qsort(i8* %1, i32 %call, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @strvec_strcmp to i32 (i8*, i8*)*))
  ret void
}

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

; Function Attrs: noinline nounwind
define i8** @strvec_from_word_list(%struct.word_list* %list, i32 %alloc, i32 %starting_index, i32* %ip) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %alloc.addr = alloca i32, align 4
  %starting_index.addr = alloca i32, align 4
  %ip.addr = alloca i32*, align 4
  %count = alloca i32, align 4
  %array = alloca i8**, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %alloc, i32* %alloc.addr, align 4
  store i32 %starting_index, i32* %starting_index.addr, align 4
  store i32* %ip, i32** %ip.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 bitcast (i32 (...)* @list_length to i32 (%struct.word_list*)*)(%struct.word_list* %0)
  store i32 %call, i32* %count, align 4
  %1 = load i32, i32* %count, align 4
  %add = add nsw i32 1, %1
  %2 = load i32, i32* %starting_index.addr, align 4
  %add1 = add nsw i32 %add, %2
  %mul = mul i32 %add1, 4
  %call2 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 204)
  %3 = bitcast i8* %call2 to i8**
  store i8** %3, i8*** %array, align 4
  store i32 0, i32* %count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %count, align 4
  %5 = load i32, i32* %starting_index.addr, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8**, i8*** %array, align 4
  %7 = load i32, i32* %count, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %6, i32 %7
  store i8* null, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %count, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %count, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i32, i32* %starting_index.addr, align 4
  store i32 %9, i32* %count, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc16, %for.end
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %10, null
  br i1 %tobool, label %for.body4, label %for.end18

for.body4:                                        ; preds = %for.cond3
  %11 = load i32, i32* %alloc.addr, align 4
  %tobool5 = icmp ne i32 %11, 0
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body4
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word6, align 4
  %call7 = call i32 @strlen(i8* %14)
  %add8 = add i32 1, %call7
  %call9 = call i8* @sh_xmalloc(i32 %add8, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 209)
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word10 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word10, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word11, align 4
  %call12 = call i8* @strcpy(i8* %call9, i8* %17)
  br label %cond.end

cond.false:                                       ; preds = %for.body4
  %18 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word14, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call12, %cond.true ], [ %20, %cond.false ]
  %21 = load i8**, i8*** %array, align 4
  %22 = load i32, i32* %count, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %21, i32 %22
  store i8* %cond, i8** %arrayidx15, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %cond.end
  %23 = load i32, i32* %count, align 4
  %inc17 = add nsw i32 %23, 1
  store i32 %inc17, i32* %count, align 4
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 0
  %25 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %25, %struct.word_list** %list.addr, align 4
  br label %for.cond3

for.end18:                                        ; preds = %for.cond3
  %26 = load i8**, i8*** %array, align 4
  %27 = load i32, i32* %count, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %26, i32 %27
  store i8* null, i8** %arrayidx19, align 4
  %28 = load i32*, i32** %ip.addr, align 4
  %tobool20 = icmp ne i32* %28, null
  br i1 %tobool20, label %if.then, label %if.end

if.then:                                          ; preds = %for.end18
  %29 = load i32, i32* %count, align 4
  %30 = load i32*, i32** %ip.addr, align 4
  store i32 %29, i32* %30, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end18
  %31 = load i8**, i8*** %array, align 4
  ret i8** %31
}

declare i32 @list_length(...) #1

; Function Attrs: noinline nounwind
define %struct.word_list* @strvec_to_word_list(i8** %array, i32 %alloc, i32 %starting_index) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %array.addr = alloca i8**, align 4
  %alloc.addr = alloca i32, align 4
  %starting_index.addr = alloca i32, align 4
  %list = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_desc*, align 4
  %i = alloca i32, align 4
  %count = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 %alloc, i32* %alloc.addr, align 4
  store i32 %starting_index, i32* %starting_index.addr, align 4
  %0 = load i8**, i8*** %array.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8**, i8*** %array.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 0
  %2 = load i8*, i8** %arrayidx, align 4
  %cmp1 = icmp eq i8* %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8**, i8*** %array.addr, align 4
  %4 = load i32, i32* %count, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx2, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %count, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %count, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %starting_index.addr, align 4
  store i32 %7, i32* %i, align 4
  store %struct.word_list* null, %struct.word_list** %list, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc14, %for.end
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %count, align 4
  %cmp4 = icmp slt i32 %8, %9
  br i1 %cmp4, label %for.body5, label %for.end16

for.body5:                                        ; preds = %for.cond3
  %10 = load i32, i32* %alloc.addr, align 4
  %tobool6 = icmp ne i32 %10, 0
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body5
  %11 = load i8**, i8*** %array.addr, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx7, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %13, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), %cond.false ]
  %call = call %struct.word_desc* @make_bare_word(i8* %cond)
  store %struct.word_desc* %call, %struct.word_desc** %w, align 4
  %14 = load i32, i32* %alloc.addr, align 4
  %cmp8 = icmp eq i32 %14, 0
  br i1 %cmp8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %cond.end
  %15 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word, align 4
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 242)
  %17 = load i8**, i8*** %array.addr, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %17, i32 %18
  %19 = load i8*, i8** %arrayidx10, align 4
  %20 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  store i8* %19, i8** %word11, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %cond.end
  %21 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %22 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call13 = call %struct.word_list* @make_word_list(%struct.word_desc* %21, %struct.word_list* %22)
  store %struct.word_list* %call13, %struct.word_list** %list, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %if.end12
  %23 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %23, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond3

for.end16:                                        ; preds = %for.cond3
  %24 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool17 = icmp ne %struct.word_list* %24, null
  br i1 %tobool17, label %land.lhs.true, label %cond.false21

land.lhs.true:                                    ; preds = %for.end16
  %25 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 0
  %26 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool18 = icmp ne %struct.word_list* %26, null
  br i1 %tobool18, label %cond.true19, label %cond.false21

cond.true19:                                      ; preds = %land.lhs.true
  %27 = load %struct.word_list*, %struct.word_list** %list, align 4
  %28 = bitcast %struct.word_list* %27 to %struct.g_list*
  %call20 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %28)
  %29 = bitcast %struct.g_list* %call20 to %struct.word_list*
  br label %cond.end22

cond.false21:                                     ; preds = %land.lhs.true, %for.end16
  %30 = load %struct.word_list*, %struct.word_list** %list, align 4
  br label %cond.end22

cond.end22:                                       ; preds = %cond.false21, %cond.true19
  %cond23 = phi %struct.word_list* [ %29, %cond.true19 ], [ %30, %cond.false21 ]
  store %struct.word_list* %cond23, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end22, %if.then
  %31 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %31
}

declare %struct.word_desc* @make_bare_word(i8*) #1

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.g_list* @list_reverse(...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
