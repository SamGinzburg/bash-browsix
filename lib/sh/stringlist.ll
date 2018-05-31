; ModuleID = 'stringlist.c'
source_filename = "stringlist.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._list_of_strings = type { i8**, i32, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [13 x i8] c"stringlist.c\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"%s%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_create(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 46)
  %0 = bitcast i8* %call to %struct._list_of_strings*
  store %struct._list_of_strings* %0, %struct._list_of_strings** %ret, align 4
  %1 = load i32, i32* %n.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %2, 1
  %call1 = call i8** @strvec_create(i32 %add)
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  store i8** %call1, i8*** %list, align 4
  %4 = load i32, i32* %n.addr, align 4
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 1
  store i32 %4, i32* %list_size, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  %9 = load i8**, i8*** %list2, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %9, i32 %10
  store i8* null, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else:                                          ; preds = %entry
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %12, i32 0, i32 0
  store i8** null, i8*** %list3, align 4
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_size4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 1
  store i32 0, i32* %list_size4, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  %14 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %14, i32 0, i32 2
  store i32 0, i32* %list_len, align 4
  %15 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  ret %struct._list_of_strings* %15
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_resize(%struct._list_of_strings* %sl, i32 %n) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %n.addr, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %1)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %call, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 1
  %4 = load i32, i32* %list_size, align 4
  %cmp1 = icmp sgt i32 %2, %4
  br i1 %cmp1, label %if.then2, label %if.end9

if.then2:                                         ; preds = %if.end
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  %6 = load i8**, i8*** %list, align 4
  %7 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %7, 1
  %call3 = call i8** @strvec_resize(i8** %6, i32 %add)
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  store i8** %call3, i8*** %list4, align 4
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size5 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %9, i32 0, i32 1
  %10 = load i32, i32* %list_size5, align 4
  store i32 %10, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then2
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %n.addr, align 4
  %cmp6 = icmp sle i32 %11, %12
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list7 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 0
  %14 = load i8**, i8*** %list7, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %14, i32 %15
  store i8* null, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i32, i32* %n.addr, align 4
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size8 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %18, i32 0, i32 1
  store i32 %17, i32* %list_size8, align 4
  br label %if.end9

if.end9:                                          ; preds = %for.end, %if.end
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %19, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then
  %20 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %20
}

declare i8** @strvec_resize(i8**, i32) #1

; Function Attrs: noinline nounwind
define void @strlist_flush(%struct._list_of_strings* %sl) #0 {
entry:
  %sl.addr = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list, align 4
  %cmp1 = icmp eq i8** %2, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list2, align 4
  call void @strvec_flush(i8** %4)
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 2
  store i32 0, i32* %list_len, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @strvec_flush(i8**) #1

; Function Attrs: noinline nounwind
define void @strlist_dispose(%struct._list_of_strings* %sl) #0 {
entry:
  %sl.addr = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list, align 4
  %tobool = icmp ne i8** %2, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list2, align 4
  call void @strvec_dispose(i8** %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %6 = bitcast %struct._list_of_strings* %5 to i8*
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 101)
  br label %return

return:                                           ; preds = %if.end3, %if.then
  ret void
}

declare void @strvec_dispose(i8**) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @strlist_remove(%struct._list_of_strings* %sl, i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %s.addr = alloca i8*, align 4
  %r = alloca i32, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list, align 4
  %cmp1 = icmp eq i8** %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  %4 = load i32, i32* %list_len, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  %6 = load i8**, i8*** %list4, align 4
  %7 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strvec_remove(i8** %6, i8* %7)
  store i32 %call, i32* %r, align 4
  %8 = load i32, i32* %r, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %9, i32 0, i32 2
  %10 = load i32, i32* %list_len6, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* %list_len6, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %11 = load i32, i32* %r, align 4
  store i32 %11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @strvec_remove(i8**, i8*) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_copy(%struct._list_of_strings* %sl) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %new = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 1
  %2 = load i32, i32* %list_size, align 4
  %call = call %struct._list_of_strings* @strlist_create(i32 %2)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %new, align 4
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list, align 4
  %tobool = icmp ne i8** %4, null
  br i1 %tobool, label %if.then1, label %if.end15

if.then1:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then1
  %5 = load i32, i32* %i, align 4
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size2 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 1
  %7 = load i32, i32* %list_size2, align 4
  %cmp3 = icmp slt i32 %5, %7
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  %9 = load i8**, i8*** %list4, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx, align 4
  %tobool5 = icmp ne i8* %11, null
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %12 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list6 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %12, i32 0, i32 0
  %13 = load i8**, i8*** %list6, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %13, i32 %14
  %15 = load i8*, i8** %arrayidx7, align 4
  %call8 = call i32 @strlen(i8* %15)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 134)
  %16 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list10 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %16, i32 0, i32 0
  %17 = load i8**, i8*** %list10, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %17, i32 %18
  %19 = load i8*, i8** %arrayidx11, align 4
  %call12 = call i8* @strcpy(i8* %call9, i8* %19)
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call12, %cond.true ], [ null, %cond.false ]
  %20 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list13 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %20, i32 0, i32 0
  %21 = load i8**, i8*** %list13, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %21, i32 %22
  store i8* %cond, i8** %arrayidx14, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %23 = load i32, i32* %i, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end15

if.end15:                                         ; preds = %for.end, %if.end
  %24 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_size16 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %24, i32 0, i32 1
  %25 = load i32, i32* %list_size16, align 4
  %26 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list_size17 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %26, i32 0, i32 1
  store i32 %25, i32* %list_size17, align 4
  %27 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %27, i32 0, i32 2
  %28 = load i32, i32* %list_len, align 4
  %29 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list_len18 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %29, i32 0, i32 2
  store i32 %28, i32* %list_len18, align 4
  %30 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list19 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %30, i32 0, i32 0
  %31 = load i8**, i8*** %list19, align 4
  %tobool20 = icmp ne i8** %31, null
  br i1 %tobool20, label %if.then21, label %if.end25

if.then21:                                        ; preds = %if.end15
  %32 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list22 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %32, i32 0, i32 0
  %33 = load i8**, i8*** %list22, align 4
  %34 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  %list_len23 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %34, i32 0, i32 2
  %35 = load i32, i32* %list_len23, align 4
  %arrayidx24 = getelementptr inbounds i8*, i8** %33, i32 %35
  store i8* null, i8** %arrayidx24, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then21, %if.end15
  %36 = load %struct._list_of_strings*, %struct._list_of_strings** %new, align 4
  store %struct._list_of_strings* %36, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end25, %if.then
  %37 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %37
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_merge(%struct._list_of_strings* %m1, %struct._list_of_strings* %m2) #0 {
entry:
  %m1.addr = alloca %struct._list_of_strings*, align 4
  %m2.addr = alloca %struct._list_of_strings*, align 4
  %sl = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %l1 = alloca i32, align 4
  %l2 = alloca i32, align 4
  store %struct._list_of_strings* %m1, %struct._list_of_strings** %m1.addr, align 4
  store %struct._list_of_strings* %m2, %struct._list_of_strings** %m2.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %tobool = icmp ne %struct._list_of_strings* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 2
  %2 = load i32, i32* %list_len, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %l1, align 4
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %tobool1 = icmp ne %struct._list_of_strings* %3, null
  br i1 %tobool1, label %cond.true2, label %cond.false4

cond.true2:                                       ; preds = %cond.end
  %4 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list_len3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %4, i32 0, i32 2
  %5 = load i32, i32* %list_len3, align 4
  br label %cond.end5

cond.false4:                                      ; preds = %cond.end
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true2
  %cond6 = phi i32 [ %5, %cond.true2 ], [ 0, %cond.false4 ]
  store i32 %cond6, i32* %l2, align 4
  %6 = load i32, i32* %l1, align 4
  %7 = load i32, i32* %l2, align 4
  %add = add nsw i32 %6, %7
  %add7 = add nsw i32 %add, 1
  %call = call %struct._list_of_strings* @strlist_create(i32 %add7)
  store %struct._list_of_strings* %call, %struct._list_of_strings** %sl, align 4
  store i32 0, i32* %n, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end5
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %l1, align 4
  %cmp = icmp slt i32 %8, %9
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %10, i32 0, i32 0
  %11 = load i8**, i8*** %list, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx, align 4
  %tobool8 = icmp ne i8* %13, null
  br i1 %tobool8, label %cond.true9, label %cond.false18

cond.true9:                                       ; preds = %for.body
  %14 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list10 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %14, i32 0, i32 0
  %15 = load i8**, i8*** %list10, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx11, align 4
  %call12 = call i32 @strlen(i8* %17)
  %add13 = add i32 1, %call12
  %call14 = call i8* @sh_xmalloc(i32 %add13, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 158)
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list15 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %18, i32 0, i32 0
  %19 = load i8**, i8*** %list15, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx16 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx16, align 4
  %call17 = call i8* @strcpy(i8* %call14, i8* %21)
  br label %cond.end19

cond.false18:                                     ; preds = %for.body
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false18, %cond.true9
  %cond20 = phi i8* [ %call17, %cond.true9 ], [ null, %cond.false18 ]
  %22 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list21 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %22, i32 0, i32 0
  %23 = load i8**, i8*** %list21, align 4
  %24 = load i32, i32* %n, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %23, i32 %24
  store i8* %cond20, i8** %arrayidx22, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end19
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  %26 = load i32, i32* %n, align 4
  %inc23 = add nsw i32 %26, 1
  store i32 %inc23, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc44, %for.end
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %l2, align 4
  %cmp25 = icmp slt i32 %27, %28
  br i1 %cmp25, label %for.body26, label %for.end47

for.body26:                                       ; preds = %for.cond24
  %29 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list27 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %29, i32 0, i32 0
  %30 = load i8**, i8*** %list27, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx28, align 4
  %tobool29 = icmp ne i8* %32, null
  br i1 %tobool29, label %cond.true30, label %cond.false39

cond.true30:                                      ; preds = %for.body26
  %33 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list31 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %33, i32 0, i32 0
  %34 = load i8**, i8*** %list31, align 4
  %35 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds i8*, i8** %34, i32 %35
  %36 = load i8*, i8** %arrayidx32, align 4
  %call33 = call i32 @strlen(i8* %36)
  %add34 = add i32 1, %call33
  %call35 = call i8* @sh_xmalloc(i32 %add34, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 160)
  %37 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list36 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %37, i32 0, i32 0
  %38 = load i8**, i8*** %list36, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx37 = getelementptr inbounds i8*, i8** %38, i32 %39
  %40 = load i8*, i8** %arrayidx37, align 4
  %call38 = call i8* @strcpy(i8* %call35, i8* %40)
  br label %cond.end40

cond.false39:                                     ; preds = %for.body26
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false39, %cond.true30
  %cond41 = phi i8* [ %call38, %cond.true30 ], [ null, %cond.false39 ]
  %41 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list42 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %41, i32 0, i32 0
  %42 = load i8**, i8*** %list42, align 4
  %43 = load i32, i32* %n, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %42, i32 %43
  store i8* %cond41, i8** %arrayidx43, align 4
  br label %for.inc44

for.inc44:                                        ; preds = %cond.end40
  %44 = load i32, i32* %i, align 4
  %inc45 = add nsw i32 %44, 1
  store i32 %inc45, i32* %i, align 4
  %45 = load i32, i32* %n, align 4
  %inc46 = add nsw i32 %45, 1
  store i32 %inc46, i32* %n, align 4
  br label %for.cond24

for.end47:                                        ; preds = %for.cond24
  %46 = load i32, i32* %n, align 4
  %47 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list_len48 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %47, i32 0, i32 2
  store i32 %46, i32* %list_len48, align 4
  %48 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  %list49 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %48, i32 0, i32 0
  %49 = load i8**, i8*** %list49, align 4
  %50 = load i32, i32* %n, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %49, i32 %50
  store i8* null, i8** %arrayidx50, align 4
  %51 = load %struct._list_of_strings*, %struct._list_of_strings** %sl, align 4
  ret %struct._list_of_strings* %51
}

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_append(%struct._list_of_strings* %m1, %struct._list_of_strings* %m2) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %m1.addr = alloca %struct._list_of_strings*, align 4
  %m2.addr = alloca %struct._list_of_strings*, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  store %struct._list_of_strings* %m1, %struct._list_of_strings** %m1.addr, align 4
  store %struct._list_of_strings* %m2, %struct._list_of_strings** %m2.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %tobool = icmp ne %struct._list_of_strings* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %call = call %struct._list_of_strings* @strlist_copy(%struct._list_of_strings* %2)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._list_of_strings* [ %call, %cond.true ], [ null, %cond.false ]
  store %struct._list_of_strings* %cond, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  %4 = load i32, i32* %list_len, align 4
  store i32 %4, i32* %len1, align 4
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %tobool1 = icmp ne %struct._list_of_strings* %5, null
  br i1 %tobool1, label %cond.true2, label %cond.false4

cond.true2:                                       ; preds = %if.end
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list_len3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 2
  %7 = load i32, i32* %list_len3, align 4
  br label %cond.end5

cond.false4:                                      ; preds = %if.end
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false4, %cond.true2
  %cond6 = phi i32 [ %7, %cond.true2 ], [ 0, %cond.false4 ]
  store i32 %cond6, i32* %len2, align 4
  %8 = load i32, i32* %len2, align 4
  %tobool7 = icmp ne i32 %8, 0
  br i1 %tobool7, label %if.then8, label %if.end31

if.then8:                                         ; preds = %cond.end5
  %9 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %10 = load i32, i32* %len1, align 4
  %11 = load i32, i32* %len2, align 4
  %add = add nsw i32 %10, %11
  %add9 = add nsw i32 %add, 1
  %call10 = call %struct._list_of_strings* @strlist_resize(%struct._list_of_strings* %9, i32 %add9)
  store %struct._list_of_strings* %call10, %struct._list_of_strings** %m1.addr, align 4
  store i32 0, i32* %i, align 4
  %12 = load i32, i32* %len1, align 4
  store i32 %12, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then8
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %len2, align 4
  %cmp11 = icmp slt i32 %13, %14
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %15, i32 0, i32 0
  %16 = load i8**, i8*** %list, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx, align 4
  %tobool12 = icmp ne i8* %18, null
  br i1 %tobool12, label %cond.true13, label %cond.false22

cond.true13:                                      ; preds = %for.body
  %19 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list14 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %19, i32 0, i32 0
  %20 = load i8**, i8*** %list14, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %20, i32 %21
  %22 = load i8*, i8** %arrayidx15, align 4
  %call16 = call i32 @strlen(i8* %22)
  %add17 = add i32 1, %call16
  %call18 = call i8* @sh_xmalloc(i32 %add17, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 183)
  %23 = load %struct._list_of_strings*, %struct._list_of_strings** %m2.addr, align 4
  %list19 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %23, i32 0, i32 0
  %24 = load i8**, i8*** %list19, align 4
  %25 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx20, align 4
  %call21 = call i8* @strcpy(i8* %call18, i8* %26)
  br label %cond.end23

cond.false22:                                     ; preds = %for.body
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true13
  %cond24 = phi i8* [ %call21, %cond.true13 ], [ null, %cond.false22 ]
  %27 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list25 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %27, i32 0, i32 0
  %28 = load i8**, i8*** %list25, align 4
  %29 = load i32, i32* %n, align 4
  %arrayidx26 = getelementptr inbounds i8*, i8** %28, i32 %29
  store i8* %cond24, i8** %arrayidx26, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %30 = load i32, i32* %i, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %i, align 4
  %31 = load i32, i32* %n, align 4
  %inc27 = add nsw i32 %31, 1
  store i32 %inc27, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %32 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list28 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %32, i32 0, i32 0
  %33 = load i8**, i8*** %list28, align 4
  %34 = load i32, i32* %n, align 4
  %arrayidx29 = getelementptr inbounds i8*, i8** %33, i32 %34
  store i8* null, i8** %arrayidx29, align 4
  %35 = load i32, i32* %n, align 4
  %36 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  %list_len30 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %36, i32 0, i32 2
  store i32 %35, i32* %list_len30, align 4
  br label %if.end31

if.end31:                                         ; preds = %for.end, %cond.end5
  %37 = load %struct._list_of_strings*, %struct._list_of_strings** %m1.addr, align 4
  store %struct._list_of_strings* %37, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end31, %cond.end
  %38 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %38
}

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_prefix_suffix(%struct._list_of_strings* %sl, i8* %prefix, i8* %suffix) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %prefix.addr = alloca i8*, align 4
  %suffix.addr = alloca i8*, align 4
  %plen = alloca i32, align 4
  %slen = alloca i32, align 4
  %tlen = alloca i32, align 4
  %llen = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i8*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i8* %prefix, i8** %prefix.addr, align 4
  store i8* %suffix, i8** %suffix.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list, align 4
  %cmp1 = icmp eq i8** %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 2
  %4 = load i32, i32* %list_len, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %5, %struct._list_of_strings** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %6 = load i8*, i8** %prefix.addr, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false16

land.lhs.true:                                    ; preds = %if.end
  %7 = load i8*, i8** %prefix.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %cond.true, label %cond.false16

cond.true:                                        ; preds = %land.lhs.true
  %9 = load i8*, i8** %prefix.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %10 to i32
  %tobool7 = icmp ne i32 %conv6, 0
  br i1 %tobool7, label %cond.true8, label %cond.false13

cond.true8:                                       ; preds = %cond.true
  %11 = load i8*, i8** %prefix.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %12 to i32
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %cond.true12, label %cond.false

cond.true12:                                      ; preds = %cond.true8
  %13 = load i8*, i8** %prefix.addr, align 4
  %call = call i32 @strlen(i8* %13)
  br label %cond.end

cond.false:                                       ; preds = %cond.true8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true12
  %cond = phi i32 [ %call, %cond.true12 ], [ 2, %cond.false ]
  br label %cond.end14

cond.false13:                                     ; preds = %cond.true
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.end
  %cond15 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false13 ]
  br label %cond.end17

cond.false16:                                     ; preds = %land.lhs.true, %if.end
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.end14
  %cond18 = phi i32 [ %cond15, %cond.end14 ], [ 0, %cond.false16 ]
  store i32 %cond18, i32* %plen, align 4
  %14 = load i8*, i8** %suffix.addr, align 4
  %tobool19 = icmp ne i8* %14, null
  br i1 %tobool19, label %land.lhs.true20, label %cond.false40

land.lhs.true20:                                  ; preds = %cond.end17
  %15 = load i8*, i8** %suffix.addr, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %16 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br i1 %tobool23, label %cond.true24, label %cond.false40

cond.true24:                                      ; preds = %land.lhs.true20
  %17 = load i8*, i8** %suffix.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %17, i32 1
  %18 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %18 to i32
  %tobool27 = icmp ne i32 %conv26, 0
  br i1 %tobool27, label %cond.true28, label %cond.false37

cond.true28:                                      ; preds = %cond.true24
  %19 = load i8*, i8** %suffix.addr, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %19, i32 2
  %20 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %20 to i32
  %tobool31 = icmp ne i32 %conv30, 0
  br i1 %tobool31, label %cond.true32, label %cond.false34

cond.true32:                                      ; preds = %cond.true28
  %21 = load i8*, i8** %suffix.addr, align 4
  %call33 = call i32 @strlen(i8* %21)
  br label %cond.end35

cond.false34:                                     ; preds = %cond.true28
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false34, %cond.true32
  %cond36 = phi i32 [ %call33, %cond.true32 ], [ 2, %cond.false34 ]
  br label %cond.end38

cond.false37:                                     ; preds = %cond.true24
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false37, %cond.end35
  %cond39 = phi i32 [ %cond36, %cond.end35 ], [ 1, %cond.false37 ]
  br label %cond.end41

cond.false40:                                     ; preds = %land.lhs.true20, %cond.end17
  br label %cond.end41

cond.end41:                                       ; preds = %cond.false40, %cond.end38
  %cond42 = phi i32 [ %cond39, %cond.end38 ], [ 0, %cond.false40 ]
  store i32 %cond42, i32* %slen, align 4
  %22 = load i32, i32* %plen, align 4
  %cmp43 = icmp eq i32 %22, 0
  br i1 %cmp43, label %land.lhs.true45, label %if.end49

land.lhs.true45:                                  ; preds = %cond.end41
  %23 = load i32, i32* %slen, align 4
  %cmp46 = icmp eq i32 %23, 0
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %land.lhs.true45
  %24 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %24, %struct._list_of_strings** %retval, align 4
  br label %return

if.end49:                                         ; preds = %land.lhs.true45, %cond.end41
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end49
  %25 = load i32, i32* %i, align 4
  %26 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len50 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %26, i32 0, i32 2
  %27 = load i32, i32* %list_len50, align 4
  %cmp51 = icmp slt i32 %25, %27
  br i1 %cmp51, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list53 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %28, i32 0, i32 0
  %29 = load i8**, i8*** %list53, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %29, i32 %30
  %31 = load i8*, i8** %arrayidx54, align 4
  %tobool55 = icmp ne i8* %31, null
  br i1 %tobool55, label %land.lhs.true56, label %cond.false84

land.lhs.true56:                                  ; preds = %for.body
  %32 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list57 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %32, i32 0, i32 0
  %33 = load i8**, i8*** %list57, align 4
  %34 = load i32, i32* %i, align 4
  %arrayidx58 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx58, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %35, i32 0
  %36 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %36 to i32
  %tobool61 = icmp ne i32 %conv60, 0
  br i1 %tobool61, label %cond.true62, label %cond.false84

cond.true62:                                      ; preds = %land.lhs.true56
  %37 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list63 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %37, i32 0, i32 0
  %38 = load i8**, i8*** %list63, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx64 = getelementptr inbounds i8*, i8** %38, i32 %39
  %40 = load i8*, i8** %arrayidx64, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %40, i32 1
  %41 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %41 to i32
  %tobool67 = icmp ne i32 %conv66, 0
  br i1 %tobool67, label %cond.true68, label %cond.false81

cond.true68:                                      ; preds = %cond.true62
  %42 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list69 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %42, i32 0, i32 0
  %43 = load i8**, i8*** %list69, align 4
  %44 = load i32, i32* %i, align 4
  %arrayidx70 = getelementptr inbounds i8*, i8** %43, i32 %44
  %45 = load i8*, i8** %arrayidx70, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %45, i32 2
  %46 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %46 to i32
  %tobool73 = icmp ne i32 %conv72, 0
  br i1 %tobool73, label %cond.true74, label %cond.false78

cond.true74:                                      ; preds = %cond.true68
  %47 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list75 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %47, i32 0, i32 0
  %48 = load i8**, i8*** %list75, align 4
  %49 = load i32, i32* %i, align 4
  %arrayidx76 = getelementptr inbounds i8*, i8** %48, i32 %49
  %50 = load i8*, i8** %arrayidx76, align 4
  %call77 = call i32 @strlen(i8* %50)
  br label %cond.end79

cond.false78:                                     ; preds = %cond.true68
  br label %cond.end79

cond.end79:                                       ; preds = %cond.false78, %cond.true74
  %cond80 = phi i32 [ %call77, %cond.true74 ], [ 2, %cond.false78 ]
  br label %cond.end82

cond.false81:                                     ; preds = %cond.true62
  br label %cond.end82

cond.end82:                                       ; preds = %cond.false81, %cond.end79
  %cond83 = phi i32 [ %cond80, %cond.end79 ], [ 1, %cond.false81 ]
  br label %cond.end85

cond.false84:                                     ; preds = %land.lhs.true56, %for.body
  br label %cond.end85

cond.end85:                                       ; preds = %cond.false84, %cond.end82
  %cond86 = phi i32 [ %cond83, %cond.end82 ], [ 0, %cond.false84 ]
  store i32 %cond86, i32* %llen, align 4
  %51 = load i32, i32* %plen, align 4
  %52 = load i32, i32* %llen, align 4
  %add = add nsw i32 %51, %52
  %53 = load i32, i32* %slen, align 4
  %add87 = add nsw i32 %add, %53
  %add88 = add nsw i32 %add87, 1
  store i32 %add88, i32* %tlen, align 4
  %54 = load i32, i32* %tlen, align 4
  %add89 = add nsw i32 %54, 1
  %call90 = call i8* @sh_xmalloc(i32 %add89, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 212)
  store i8* %call90, i8** %t, align 4
  %55 = load i32, i32* %plen, align 4
  %tobool91 = icmp ne i32 %55, 0
  br i1 %tobool91, label %if.then92, label %if.end94

if.then92:                                        ; preds = %cond.end85
  %56 = load i8*, i8** %t, align 4
  %57 = load i8*, i8** %prefix.addr, align 4
  %call93 = call i8* @strcpy(i8* %56, i8* %57)
  br label %if.end94

if.end94:                                         ; preds = %if.then92, %cond.end85
  %58 = load i8*, i8** %t, align 4
  %59 = load i32, i32* %plen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %58, i32 %59
  %60 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list95 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %60, i32 0, i32 0
  %61 = load i8**, i8*** %list95, align 4
  %62 = load i32, i32* %i, align 4
  %arrayidx96 = getelementptr inbounds i8*, i8** %61, i32 %62
  %63 = load i8*, i8** %arrayidx96, align 4
  %call97 = call i8* @strcpy(i8* %add.ptr, i8* %63)
  %64 = load i32, i32* %slen, align 4
  %tobool98 = icmp ne i32 %64, 0
  br i1 %tobool98, label %if.then99, label %if.end103

if.then99:                                        ; preds = %if.end94
  %65 = load i8*, i8** %t, align 4
  %66 = load i32, i32* %plen, align 4
  %add.ptr100 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i32, i32* %llen, align 4
  %add.ptr101 = getelementptr inbounds i8, i8* %add.ptr100, i32 %67
  %68 = load i8*, i8** %suffix.addr, align 4
  %call102 = call i8* @strcpy(i8* %add.ptr101, i8* %68)
  br label %if.end103

if.end103:                                        ; preds = %if.then99, %if.end94
  %69 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list104 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %69, i32 0, i32 0
  %70 = load i8**, i8*** %list104, align 4
  %71 = load i32, i32* %i, align 4
  %arrayidx105 = getelementptr inbounds i8*, i8** %70, i32 %71
  %72 = load i8*, i8** %arrayidx105, align 4
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 218)
  %73 = load i8*, i8** %t, align 4
  %74 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list106 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %74, i32 0, i32 0
  %75 = load i8**, i8*** %list106, align 4
  %76 = load i32, i32* %i, align 4
  %arrayidx107 = getelementptr inbounds i8*, i8** %75, i32 %76
  store i8* %73, i8** %arrayidx107, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end103
  %77 = load i32, i32* %i, align 4
  %inc = add nsw i32 %77, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %78 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  store %struct._list_of_strings* %78, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then48, %if.then
  %79 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %79
}

; Function Attrs: noinline nounwind
define void @strlist_print(%struct._list_of_strings* %sl, i8* %prefix) #0 {
entry:
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %prefix.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i8* %prefix, i8** %prefix.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %2, i32 0, i32 2
  %3 = load i32, i32* %list_len, align 4
  %cmp1 = icmp slt i32 %1, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %prefix.addr, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %5 = load i8*, i8** %prefix.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %5, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0), %cond.false ]
  %6 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %6, i32 0, i32 0
  %7 = load i8**, i8*** %list, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* %cond, i8* %9)
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @strlist_walk(%struct._list_of_strings* %sl, i32 (i8*)* %func) #0 {
entry:
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %func.addr = alloca i32 (i8*)*, align 4
  %i = alloca i32, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i32 (i8*)* %func, i32 (i8*)** %func.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %2 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %2, i32 0, i32 2
  %3 = load i32, i32* %list_len, align 4
  %cmp1 = icmp slt i32 %1, %3
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32 (i8*)*, i32 (i8*)** %func.addr, align 4
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  %6 = load i8**, i8*** %list, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx, align 4
  %call = call i32 %4(i8* %8)
  %cmp2 = icmp slt i32 %call, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %for.body
  br label %for.end

if.end4:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end4
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %if.then3, %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @strlist_sort(%struct._list_of_strings* %sl) #0 {
entry:
  %sl.addr = alloca %struct._list_of_strings*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 2
  %2 = load i32, i32* %list_len, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list, align 4
  %cmp3 = icmp eq i8** %4, null
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list4 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %5, i32 0, i32 0
  %6 = load i8**, i8*** %list4, align 4
  call void @strvec_sort(i8** %6)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @strvec_sort(i8**) #1

; Function Attrs: noinline nounwind
define %struct._list_of_strings* @strlist_from_word_list(%struct.word_list* %list, i32 %alloc, i32 %starting_index, i32* %ip) #0 {
entry:
  %retval = alloca %struct._list_of_strings*, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %alloc.addr = alloca i32, align 4
  %starting_index.addr = alloca i32, align 4
  %ip.addr = alloca i32*, align 4
  %ret = alloca %struct._list_of_strings*, align 4
  %slen = alloca i32, align 4
  %len = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %alloc, i32* %alloc.addr, align 4
  store i32 %starting_index, i32* %starting_index.addr, align 4
  store i32* %ip, i32** %ip.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %ip.addr, align 4
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  %2 = load i32*, i32** %ip.addr, align 4
  store i32 0, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then1, %if.then
  store %struct._list_of_strings* null, %struct._list_of_strings** %retval, align 4
  br label %return

if.end2:                                          ; preds = %entry
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 bitcast (i32 (...)* @list_length to i32 (%struct.word_list*)*)(%struct.word_list* %3)
  store i32 %call, i32* %slen, align 4
  %call3 = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 276)
  %4 = bitcast i8* %call3 to %struct._list_of_strings*
  store %struct._list_of_strings* %4, %struct._list_of_strings** %ret, align 4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %6 = load i32, i32* %alloc.addr, align 4
  %7 = load i32, i32* %starting_index.addr, align 4
  %call4 = call i8** @strvec_from_word_list(%struct.word_list* %5, i32 %6, i32 %7, i32* %len)
  %8 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list5 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %8, i32 0, i32 0
  store i8** %call4, i8*** %list5, align 4
  %9 = load i32, i32* %slen, align 4
  %10 = load i32, i32* %starting_index.addr, align 4
  %add = add nsw i32 %9, %10
  %11 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_size = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %11, i32 0, i32 1
  store i32 %add, i32* %list_size, align 4
  %12 = load i32, i32* %len, align 4
  %13 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  %list_len = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %13, i32 0, i32 2
  store i32 %12, i32* %list_len, align 4
  %14 = load i32*, i32** %ip.addr, align 4
  %tobool6 = icmp ne i32* %14, null
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end2
  %15 = load i32, i32* %len, align 4
  %16 = load i32*, i32** %ip.addr, align 4
  store i32 %15, i32* %16, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end2
  %17 = load %struct._list_of_strings*, %struct._list_of_strings** %ret, align 4
  store %struct._list_of_strings* %17, %struct._list_of_strings** %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.end
  %18 = load %struct._list_of_strings*, %struct._list_of_strings** %retval, align 4
  ret %struct._list_of_strings* %18
}

declare i32 @list_length(...) #1

declare i8** @strvec_from_word_list(%struct.word_list*, i32, i32, i32*) #1

; Function Attrs: noinline nounwind
define %struct.word_list* @strlist_to_word_list(%struct._list_of_strings* %sl, i32 %alloc, i32 %starting_index) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %sl.addr = alloca %struct._list_of_strings*, align 4
  %alloc.addr = alloca i32, align 4
  %starting_index.addr = alloca i32, align 4
  %list = alloca %struct.word_list*, align 4
  store %struct._list_of_strings* %sl, %struct._list_of_strings** %sl.addr, align 4
  store i32 %alloc, i32* %alloc.addr, align 4
  store i32 %starting_index, i32* %starting_index.addr, align 4
  %0 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %cmp = icmp eq %struct._list_of_strings* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list1 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %1, i32 0, i32 0
  %2 = load i8**, i8*** %list1, align 4
  %cmp2 = icmp eq i8** %2, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct._list_of_strings*, %struct._list_of_strings** %sl.addr, align 4
  %list3 = getelementptr inbounds %struct._list_of_strings, %struct._list_of_strings* %3, i32 0, i32 0
  %4 = load i8**, i8*** %list3, align 4
  %5 = load i32, i32* %alloc.addr, align 4
  %6 = load i32, i32* %starting_index.addr, align 4
  %call = call %struct.word_list* @strvec_to_word_list(i8** %4, i32 %5, i32 %6)
  store %struct.word_list* %call, %struct.word_list** %list, align 4
  %7 = load %struct.word_list*, %struct.word_list** %list, align 4
  store %struct.word_list* %7, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %8
}

declare %struct.word_list* @strvec_to_word_list(i8**, i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
