; ModuleID = 'assoc.c'
source_filename = "assoc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.g_list = type { %struct.g_list* }

@.str = private unnamed_addr constant [8 x i8] c"assoc.c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define void @assoc_dispose(%struct.hash_table* %hash) #0 {
entry:
  %hash.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  call void @hash_flush(%struct.hash_table* %1, void (i8*)* null)
  %2 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  call void @hash_dispose(%struct.hash_table* %2)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @hash_flush(%struct.hash_table*, void (i8*)*) #1

declare void @hash_dispose(%struct.hash_table*) #1

; Function Attrs: noinline nounwind
define void @assoc_flush(%struct.hash_table* %hash) #0 {
entry:
  %hash.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  call void @hash_flush(%struct.hash_table* %0, void (i8*)* null)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @assoc_insert(%struct.hash_table* %hash, i8* %key, i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %hash.addr = alloca %struct.hash_table*, align 4
  %key.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %b = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i8* %key, i8** %key.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %key.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %0, %struct.hash_table* %1, i32 2)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %b, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %cmp = icmp eq %struct.bucket_contents* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %key1 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %3, i32 0, i32 1
  %4 = load i8*, i8** %key1, align 4
  %5 = load i8*, i8** %key.addr, align 4
  %cmp2 = icmp ne i8* %4, %5
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %6 = load i8*, i8** %key.addr, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 84)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  br label %do.body

do.body:                                          ; preds = %if.end4
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 2
  %8 = load i8*, i8** %data, align 4
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %do.body
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data6 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %9, i32 0, i32 2
  %10 = load i8*, i8** %data6, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 85)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end7
  %11 = load i8*, i8** %value.addr, align 4
  %tobool8 = icmp ne i8* %11, null
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.end
  %12 = load i8*, i8** %value.addr, align 4
  %call9 = call i32 @strlen(i8* %12)
  %add = add i32 1, %call9
  %call10 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 86)
  %13 = load i8*, i8** %value.addr, align 4
  %call11 = call i8* @strcpy(i8* %call10, i8* %13)
  br label %cond.end

cond.false:                                       ; preds = %do.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call11, %cond.true ], [ null, %cond.false ]
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data12 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %14, i32 0, i32 2
  store i8* %cond, i8** %data12, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare %struct.bucket_contents* @hash_search(i8*, %struct.hash_table*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i8* @assoc_replace(%struct.hash_table* %hash, i8* %key, i8* %value) #0 {
entry:
  %retval = alloca i8*, align 4
  %hash.addr = alloca %struct.hash_table*, align 4
  %key.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %b = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i8* %key, i8** %key.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %key.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %0, %struct.hash_table* %1, i32 2)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %b, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %cmp = icmp eq %struct.bucket_contents* %2, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %key1 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %3, i32 0, i32 1
  %4 = load i8*, i8** %key1, align 4
  %5 = load i8*, i8** %key.addr, align 4
  %cmp2 = icmp ne i8* %4, %5
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %6 = load i8*, i8** %key.addr, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 107)
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 2
  %8 = load i8*, i8** %data, align 4
  store i8* %8, i8** %t, align 4
  %9 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %9, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  %10 = load i8*, i8** %value.addr, align 4
  %call5 = call i32 @strlen(i8* %10)
  %add = add i32 1, %call5
  %call6 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 109)
  %11 = load i8*, i8** %value.addr, align 4
  %call7 = call i8* @strcpy(i8* %call6, i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.end4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call7, %cond.true ], [ null, %cond.false ]
  %12 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %12, i32 0, i32 2
  store i8* %cond, i8** %data8, align 4
  %13 = load i8*, i8** %t, align 4
  store i8* %13, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

; Function Attrs: noinline nounwind
define void @assoc_remove(%struct.hash_table* %hash, i8* %string) #0 {
entry:
  %hash.addr = alloca %struct.hash_table*, align 4
  %string.addr = alloca i8*, align 4
  %b = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %0, %struct.hash_table* %1, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %b, align 4
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %tobool = icmp ne %struct.bucket_contents* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %3, i32 0, i32 2
  %4 = load i8*, i8** %data, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 123)
  %5 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %5, i32 0, i32 1
  %6 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 124)
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %8 = bitcast %struct.bucket_contents* %7 to i8*
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 125)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare %struct.bucket_contents* @hash_remove(i8*, %struct.hash_table*, i32) #1

; Function Attrs: noinline nounwind
define i8* @assoc_reference(%struct.hash_table* %hash, i8* %string) #0 {
entry:
  %retval = alloca i8*, align 4
  %hash.addr = alloca %struct.hash_table*, align 4
  %string.addr = alloca i8*, align 4
  %b = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %1, %struct.hash_table* %2, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %b, align 4
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %tobool = icmp ne %struct.bucket_contents* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %b, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %5, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %6 = load i8*, i8** %retval, align 4
  ret i8* %6
}

; Function Attrs: noinline nounwind
define %struct.hash_table* @assoc_quote(%struct.hash_table* %h) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %call = call i8* @quote_string(i8* %16)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  %18 = load i8*, i8** %data8, align 4
  %tobool9 = icmp ne i8* %18, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %do.body
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data11 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data11, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 160)
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end12
  %21 = load i8*, i8** %t, align 4
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data13 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 2
  store i8* %21, i8** %data13, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 0
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %24, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %26 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  store %struct.hash_table* %26, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end15, %if.then
  %27 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %27
}

declare i8* @quote_string(i8*) #1

; Function Attrs: noinline nounwind
define %struct.hash_table* @assoc_quote_escapes(%struct.hash_table* %h) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %call = call i8* @quote_escapes(i8* %16)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  %18 = load i8*, i8** %data8, align 4
  %tobool9 = icmp ne i8* %18, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %do.body
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data11 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data11, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 184)
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end12
  %21 = load i8*, i8** %t, align 4
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data13 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 2
  store i8* %21, i8** %data13, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 0
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %24, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %26 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  store %struct.hash_table* %26, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end15, %if.then
  %27 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %27
}

declare i8* @quote_escapes(i8*) #1

; Function Attrs: noinline nounwind
define %struct.hash_table* @assoc_dequote(%struct.hash_table* %h) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %call = call i8* @dequote_string(i8* %16)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  %18 = load i8*, i8** %data8, align 4
  %tobool9 = icmp ne i8* %18, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %do.body
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data11 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data11, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 206)
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end12
  %21 = load i8*, i8** %t, align 4
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data13 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 2
  store i8* %21, i8** %data13, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 0
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %24, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %26 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  store %struct.hash_table* %26, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end15, %if.then
  %27 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %27
}

declare i8* @dequote_string(i8*) #1

; Function Attrs: noinline nounwind
define %struct.hash_table* @assoc_dequote_escapes(%struct.hash_table* %h) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %call = call i8* @dequote_escapes(i8* %16)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  %18 = load i8*, i8** %data8, align 4
  %tobool9 = icmp ne i8* %18, null
  br i1 %tobool9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %do.body
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data11 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data11, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 228)
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end12
  %21 = load i8*, i8** %t, align 4
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data13 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 2
  store i8* %21, i8** %data13, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 0
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %24, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %26 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  store %struct.hash_table* %26, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end15, %if.then
  %27 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %27
}

declare i8* @dequote_escapes(i8*) #1

; Function Attrs: noinline nounwind
define %struct.hash_table* @assoc_remove_quoted_nulls(%struct.hash_table* %h) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %t = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %call = call i8* @remove_quoted_nulls(i8* %16)
  store i8* %call, i8** %t, align 4
  %17 = load i8*, i8** %t, align 4
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 2
  store i8* %17, i8** %data8, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body7
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 0
  %20 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %20, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  %22 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  store %struct.hash_table* %22, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end10, %if.then
  %23 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %23
}

declare i8* @remove_quoted_nulls(i8*) #1

; Function Attrs: noinline nounwind
define i8* @assoc_subrange(%struct.hash_table* %hash, i64 %start, i64 %nelem, i32 %starsub, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %hash.addr = alloca %struct.hash_table*, align 4
  %start.addr = alloca i64, align 8
  %nelem.addr = alloca i64, align 8
  %starsub.addr = alloca i32, align 4
  %quoted.addr = alloca i32, align 4
  %l = alloca %struct.word_list*, align 4
  %save = alloca %struct.word_list*, align 4
  %h = alloca %struct.word_list*, align 4
  %t = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ret = alloca i8*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i64 %start, i64* %start.addr, align 8
  store i64 %nelem, i64* %nelem.addr, align 8
  store i32 %starsub, i32* %starsub.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %0, i32 0, i32 2
  %1 = load i32, i32* %nentries, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %call = call %struct.word_list* @assoc_to_word_list(%struct.hash_table* %2)
  store %struct.word_list* %call, %struct.word_list** %l, align 4
  store %struct.word_list* %call, %struct.word_list** %save, align 4
  %3 = load %struct.word_list*, %struct.word_list** %save, align 4
  %cmp1 = icmp eq %struct.word_list* %3, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %4, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %conv = sext i32 %5 to i64
  %6 = load i64, i64* %start.addr, align 8
  %cmp4 = icmp slt i64 %conv, %6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp4, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 0
  %9 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %9, %struct.word_list** %l, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %11 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp6 = icmp eq %struct.word_list* %11, null
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.end
  %12 = load %struct.word_list*, %struct.word_list** %save, align 4
  call void @dispose_words(%struct.word_list* %12)
  store i8* null, i8** %retval, align 4
  br label %return

if.end9:                                          ; preds = %for.end
  store i32 0, i32* %j, align 4
  %13 = load %struct.word_list*, %struct.word_list** %l, align 4
  store %struct.word_list* %13, %struct.word_list** %t, align 4
  store %struct.word_list* %13, %struct.word_list** %h, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc19, %if.end9
  %14 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool11 = icmp ne %struct.word_list* %14, null
  br i1 %tobool11, label %land.rhs12, label %land.end16

land.rhs12:                                       ; preds = %for.cond10
  %15 = load i32, i32* %j, align 4
  %conv13 = sext i32 %15 to i64
  %16 = load i64, i64* %nelem.addr, align 8
  %cmp14 = icmp slt i64 %conv13, %16
  br label %land.end16

land.end16:                                       ; preds = %land.rhs12, %for.cond10
  %17 = phi i1 [ false, %for.cond10 ], [ %cmp14, %land.rhs12 ]
  br i1 %17, label %for.body17, label %for.end21

for.body17:                                       ; preds = %land.end16
  %18 = load %struct.word_list*, %struct.word_list** %l, align 4
  store %struct.word_list* %18, %struct.word_list** %t, align 4
  %19 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next18 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 0
  %20 = load %struct.word_list*, %struct.word_list** %next18, align 4
  store %struct.word_list* %20, %struct.word_list** %l, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body17
  %21 = load i32, i32* %j, align 4
  %inc20 = add nsw i32 %21, 1
  store i32 %inc20, i32* %j, align 4
  br label %for.cond10

for.end21:                                        ; preds = %land.end16
  %22 = load %struct.word_list*, %struct.word_list** %t, align 4
  %next22 = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 0
  store %struct.word_list* null, %struct.word_list** %next22, align 4
  %23 = load i32, i32* %starsub.addr, align 4
  %tobool23 = icmp ne i32 %23, 0
  %cond = select i1 %tobool23, i32 42, i32 64
  %24 = load %struct.word_list*, %struct.word_list** %h, align 4
  %25 = load i32, i32* %quoted.addr, align 4
  %call24 = call i8* @string_list_pos_params(i32 %cond, %struct.word_list* %24, i32 %25)
  store i8* %call24, i8** %ret, align 4
  %26 = load %struct.word_list*, %struct.word_list** %t, align 4
  %27 = load %struct.word_list*, %struct.word_list** %l, align 4
  %cmp25 = icmp ne %struct.word_list* %26, %27
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %for.end21
  %28 = load %struct.word_list*, %struct.word_list** %l, align 4
  %29 = load %struct.word_list*, %struct.word_list** %t, align 4
  %next28 = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 0
  store %struct.word_list* %28, %struct.word_list** %next28, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %for.end21
  %30 = load %struct.word_list*, %struct.word_list** %save, align 4
  call void @dispose_words(%struct.word_list* %30)
  %31 = load i8*, i8** %ret, align 4
  store i8* %31, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.then8, %if.then2, %if.then
  %32 = load i8*, i8** %retval, align 4
  ret i8* %32
}

; Function Attrs: noinline nounwind
define %struct.word_list* @assoc_to_word_list(%struct.hash_table* %h) #0 {
entry:
  %h.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %call = call %struct.word_list* @assoc_to_word_list_internal(%struct.hash_table* %0, i32 0)
  ret %struct.word_list* %call
}

declare void @dispose_words(%struct.word_list*) #1

declare i8* @string_list_pos_params(i32, %struct.word_list*, i32) #1

; Function Attrs: noinline nounwind
define i8* @assoc_patsub(%struct.hash_table* %h, i8* %pat, i8* %rep, i32 %mflags) #0 {
entry:
  %retval = alloca i8*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %pat.addr = alloca i8*, align 4
  %rep.addr = alloca i8*, align 4
  %mflags.addr = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %i = alloca i32, align 4
  %slen = alloca i32, align 4
  %h2 = alloca %struct.hash_table*, align 4
  %t = alloca i8*, align 4
  %sifs = alloca i8*, align 4
  %ifs = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %rep, i8** %rep.addr, align 4
  store i32 %mflags, i32* %mflags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %call = call %struct.hash_table* @hash_copy(%struct.hash_table* %3, i8* (i8*)* null)
  store %struct.hash_table* %call, %struct.hash_table** %h2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %4, %6
  br i1 %cmp2, label %for.body, label %for.end16

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %tobool = icmp ne %struct.hash_table* %7, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %9, i32 0, i32 1
  %10 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %8, %10
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %11 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 0
  %12 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %12, i32 %13
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %14, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %15, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 2
  %17 = load i8*, i8** %data, align 4
  %18 = load i8*, i8** %pat.addr, align 4
  %19 = load i8*, i8** %rep.addr, align 4
  %20 = load i32, i32* %mflags.addr, align 4
  %call8 = call i8* @pat_subst(i8* %17, i8* %18, i8* %19, i32 %20)
  store i8* %call8, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %21 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data9 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %21, i32 0, i32 2
  %22 = load i8*, i8** %data9, align 4
  %tobool10 = icmp ne i8* %22, null
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %do.body
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data12 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 2
  %24 = load i8*, i8** %data12, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 321)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end13
  %25 = load i8*, i8** %t, align 4
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data14 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 2
  store i8* %25, i8** %data14, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %27, i32 0, i32 0
  %28 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %28, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %29 = load i32, i32* %i, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end16:                                        ; preds = %for.cond
  %30 = load i32, i32* %mflags.addr, align 4
  %and = and i32 %30, 32
  %tobool17 = icmp ne i32 %and, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %for.end16
  %31 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call19 = call %struct.hash_table* @assoc_quote(%struct.hash_table* %31)
  br label %if.end21

if.else:                                          ; preds = %for.end16
  %32 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call20 = call %struct.hash_table* @assoc_quote_escapes(%struct.hash_table* %32)
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then18
  %33 = load i32, i32* %mflags.addr, align 4
  %and22 = and i32 %33, 128
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end21
  %34 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call25 = call %struct.hash_table* @assoc_remove_quoted_nulls(%struct.hash_table* %34)
  %call26 = call i8* @ifs_firstchar(i32* null)
  store i8* %call26, i8** %sifs, align 4
  %35 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %36 = load i8*, i8** %sifs, align 4
  %call27 = call i8* @assoc_to_string(%struct.hash_table* %35, i8* %36, i32 0)
  store i8* %call27, i8** %t, align 4
  %37 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 335)
  br label %if.end51

if.else28:                                        ; preds = %if.end21
  %38 = load i32, i32* %mflags.addr, align 4
  %and29 = and i32 %38, 32
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %if.then31, label %if.else48

if.then31:                                        ; preds = %if.else28
  %call32 = call i8* @ifs_firstchar(i32* %slen)
  store i8* %call32, i8** %sifs, align 4
  %call33 = call i8* @getifs()
  store i8* %call33, i8** %ifs, align 4
  %39 = load i8*, i8** %ifs, align 4
  %cmp34 = icmp eq i8* %39, null
  br i1 %cmp34, label %if.then38, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.then31
  %40 = load i8*, i8** %ifs, align 4
  %41 = load i8, i8* %40, align 1
  %conv = sext i8 %41 to i32
  %cmp36 = icmp eq i32 %conv, 0
  br i1 %cmp36, label %if.then38, label %if.end46

if.then38:                                        ; preds = %lor.lhs.false35, %if.then31
  %42 = load i32, i32* %slen, align 4
  %cmp39 = icmp slt i32 %42, 2
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then38
  %43 = load i8*, i8** %sifs, align 4
  %call42 = call i8* @sh_xrealloc(i8* %43, i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 345)
  store i8* %call42, i8** %sifs, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then38
  %44 = load i8*, i8** %sifs, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %44, i32 0
  store i8 32, i8* %arrayidx44, align 1
  %45 = load i8*, i8** %sifs, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %45, i32 1
  store i8 0, i8* %arrayidx45, align 1
  br label %if.end46

if.end46:                                         ; preds = %if.end43, %lor.lhs.false35
  %46 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %47 = load i8*, i8** %sifs, align 4
  %call47 = call i8* @assoc_to_string(%struct.hash_table* %46, i8* %47, i32 0)
  store i8* %call47, i8** %t, align 4
  %48 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 350)
  br label %if.end50

if.else48:                                        ; preds = %if.else28
  %49 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call49 = call i8* @assoc_to_string(%struct.hash_table* %49, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 0)
  store i8* %call49, i8** %t, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.else48, %if.end46
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then24
  %50 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  call void @assoc_dispose(%struct.hash_table* %50)
  %51 = load i8*, i8** %t, align 4
  store i8* %51, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end51, %if.then
  %52 = load i8*, i8** %retval, align 4
  ret i8* %52
}

declare %struct.hash_table* @hash_copy(%struct.hash_table*, i8* (i8*)*) #1

declare i8* @pat_subst(i8*, i8*, i8*, i32) #1

declare i8* @ifs_firstchar(i32*) #1

; Function Attrs: noinline nounwind
define i8* @assoc_to_string(%struct.hash_table* %h, i8* %sep, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %sep.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %i = alloca i32, align 4
  %result = alloca i8*, align 4
  %t = alloca i8*, align 4
  %w = alloca i8*, align 4
  %list = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  store i8* %sep, i8** %sep.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 540)
  %call3 = call i8* @strcpy(i8* %call, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call3, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  store i8* null, i8** %result, align 4
  store %struct.word_list* null, %struct.word_list** %list, align 4
  store %struct.word_list* null, %struct.word_list** %l, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %if.end4
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp5 = icmp slt i32 %3, %5
  br i1 %cmp5, label %for.body, label %for.end29

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets6 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets6, align 4
  %cmp7 = icmp slt i32 %7, %9
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool9 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond8
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  store i8* %16, i8** %w, align 4
  %17 = load i8*, i8** %w, align 4
  %cmp11 = icmp eq i8* %17, null
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body10
  br label %for.inc

if.end13:                                         ; preds = %for.body10
  %18 = load i32, i32* %quoted.addr, align 4
  %tobool14 = icmp ne i32 %18, 0
  br i1 %tobool14, label %cond.true15, label %cond.false17

cond.true15:                                      ; preds = %if.end13
  %19 = load i8*, i8** %w, align 4
  %call16 = call i8* @quote_string(i8* %19)
  br label %cond.end21

cond.false17:                                     ; preds = %if.end13
  %20 = load i8*, i8** %w, align 4
  %call18 = call i32 @strlen(i8* %20)
  %add = add i32 1, %call18
  %call19 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 553)
  %21 = load i8*, i8** %w, align 4
  %call20 = call i8* @strcpy(i8* %call19, i8* %21)
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false17, %cond.true15
  %cond22 = phi i8* [ %call16, %cond.true15 ], [ %call20, %cond.false17 ]
  store i8* %cond22, i8** %t, align 4
  %22 = load i8*, i8** %t, align 4
  %call23 = call %struct.word_desc* @make_bare_word(i8* %22)
  %23 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call24 = call %struct.word_list* @make_word_list(%struct.word_desc* %call23, %struct.word_list* %23)
  store %struct.word_list* %call24, %struct.word_list** %list, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end21
  %24 = load i8*, i8** %t, align 4
  %tobool25 = icmp ne i8* %24, null
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.body
  %25 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 555)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end27
  br label %for.inc

for.inc:                                          ; preds = %do.end, %if.then12
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 0
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %27, %struct.bucket_contents** %tlist, align 4
  br label %for.cond8

for.end:                                          ; preds = %for.cond8
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end29:                                        ; preds = %for.cond
  %29 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool30 = icmp ne %struct.word_list* %29, null
  br i1 %tobool30, label %land.lhs.true31, label %cond.false36

land.lhs.true31:                                  ; preds = %for.end29
  %30 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next32 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 0
  %31 = load %struct.word_list*, %struct.word_list** %next32, align 4
  %tobool33 = icmp ne %struct.word_list* %31, null
  br i1 %tobool33, label %cond.true34, label %cond.false36

cond.true34:                                      ; preds = %land.lhs.true31
  %32 = load %struct.word_list*, %struct.word_list** %list, align 4
  %33 = bitcast %struct.word_list* %32 to %struct.g_list*
  %call35 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %33)
  %34 = bitcast %struct.g_list* %call35 to %struct.word_list*
  br label %cond.end37

cond.false36:                                     ; preds = %land.lhs.true31, %for.end29
  %35 = load %struct.word_list*, %struct.word_list** %list, align 4
  br label %cond.end37

cond.end37:                                       ; preds = %cond.false36, %cond.true34
  %cond38 = phi %struct.word_list* [ %34, %cond.true34 ], [ %35, %cond.false36 ]
  store %struct.word_list* %cond38, %struct.word_list** %l, align 4
  %36 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool39 = icmp ne %struct.word_list* %36, null
  br i1 %tobool39, label %cond.true40, label %cond.false42

cond.true40:                                      ; preds = %cond.end37
  %37 = load %struct.word_list*, %struct.word_list** %l, align 4
  %38 = load i8*, i8** %sep.addr, align 4
  %call41 = call i8* @string_list_internal(%struct.word_list* %37, i8* %38)
  br label %cond.end45

cond.false42:                                     ; preds = %cond.end37
  %call43 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 560)
  %call44 = call i8* @strcpy(i8* %call43, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0))
  br label %cond.end45

cond.end45:                                       ; preds = %cond.false42, %cond.true40
  %cond46 = phi i8* [ %call41, %cond.true40 ], [ %call44, %cond.false42 ]
  store i8* %cond46, i8** %result, align 4
  %39 = load %struct.word_list*, %struct.word_list** %l, align 4
  call void @dispose_words(%struct.word_list* %39)
  %40 = load i8*, i8** %result, align 4
  store i8* %40, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end45, %if.then2, %if.then
  %41 = load i8*, i8** %retval, align 4
  ret i8* %41
}

declare i8* @getifs() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @assoc_modcase(%struct.hash_table* %h, i8* %pat, i32 %modop, i32 %mflags) #0 {
entry:
  %retval = alloca i8*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %pat.addr = alloca i8*, align 4
  %modop.addr = alloca i32, align 4
  %mflags.addr = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %i = alloca i32, align 4
  %slen = alloca i32, align 4
  %h2 = alloca %struct.hash_table*, align 4
  %t = alloca i8*, align 4
  %sifs = alloca i8*, align 4
  %ifs = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %modop, i32* %modop.addr, align 4
  store i32 %mflags, i32* %mflags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %call = call %struct.hash_table* @hash_copy(%struct.hash_table* %3, i8* (i8*)* null)
  store %struct.hash_table* %call, %struct.hash_table** %h2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %4, %6
  br i1 %cmp2, label %for.body, label %for.end16

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %tobool = icmp ne %struct.hash_table* %7, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %9, i32 0, i32 1
  %10 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %8, %10
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %11 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 0
  %12 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %12, i32 %13
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %14, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %15, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 2
  %17 = load i8*, i8** %data, align 4
  %18 = load i8*, i8** %pat.addr, align 4
  %19 = load i32, i32* %modop.addr, align 4
  %call8 = call i8* @sh_modcase(i8* %17, i8* %18, i32 %19)
  store i8* %call8, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body7
  %20 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data9 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %20, i32 0, i32 2
  %21 = load i8*, i8** %data9, align 4
  %tobool10 = icmp ne i8* %21, null
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %do.body
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data12 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 2
  %23 = load i8*, i8** %data12, align 4
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 380)
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end13
  %24 = load i8*, i8** %t, align 4
  %25 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data14 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %25, i32 0, i32 2
  store i8* %24, i8** %data14, align 4
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 0
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %27, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end16:                                        ; preds = %for.cond
  %29 = load i32, i32* %mflags.addr, align 4
  %and = and i32 %29, 32
  %tobool17 = icmp ne i32 %and, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %for.end16
  %30 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call19 = call %struct.hash_table* @assoc_quote(%struct.hash_table* %30)
  br label %if.end21

if.else:                                          ; preds = %for.end16
  %31 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call20 = call %struct.hash_table* @assoc_quote_escapes(%struct.hash_table* %31)
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then18
  %32 = load i32, i32* %mflags.addr, align 4
  %and22 = and i32 %32, 128
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end21
  %33 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call25 = call %struct.hash_table* @assoc_remove_quoted_nulls(%struct.hash_table* %33)
  %call26 = call i8* @ifs_firstchar(i32* null)
  store i8* %call26, i8** %sifs, align 4
  %34 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %35 = load i8*, i8** %sifs, align 4
  %call27 = call i8* @assoc_to_string(%struct.hash_table* %34, i8* %35, i32 0)
  store i8* %call27, i8** %t, align 4
  %36 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 394)
  br label %if.end51

if.else28:                                        ; preds = %if.end21
  %37 = load i32, i32* %mflags.addr, align 4
  %and29 = and i32 %37, 32
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %if.then31, label %if.else48

if.then31:                                        ; preds = %if.else28
  %call32 = call i8* @ifs_firstchar(i32* %slen)
  store i8* %call32, i8** %sifs, align 4
  %call33 = call i8* @getifs()
  store i8* %call33, i8** %ifs, align 4
  %38 = load i8*, i8** %ifs, align 4
  %cmp34 = icmp eq i8* %38, null
  br i1 %cmp34, label %if.then38, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.then31
  %39 = load i8*, i8** %ifs, align 4
  %40 = load i8, i8* %39, align 1
  %conv = sext i8 %40 to i32
  %cmp36 = icmp eq i32 %conv, 0
  br i1 %cmp36, label %if.then38, label %if.end46

if.then38:                                        ; preds = %lor.lhs.false35, %if.then31
  %41 = load i32, i32* %slen, align 4
  %cmp39 = icmp slt i32 %41, 2
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then38
  %42 = load i8*, i8** %sifs, align 4
  %call42 = call i8* @sh_xrealloc(i8* %42, i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 404)
  store i8* %call42, i8** %sifs, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then38
  %43 = load i8*, i8** %sifs, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %43, i32 0
  store i8 32, i8* %arrayidx44, align 1
  %44 = load i8*, i8** %sifs, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8 0, i8* %arrayidx45, align 1
  br label %if.end46

if.end46:                                         ; preds = %if.end43, %lor.lhs.false35
  %45 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %46 = load i8*, i8** %sifs, align 4
  %call47 = call i8* @assoc_to_string(%struct.hash_table* %45, i8* %46, i32 0)
  store i8* %call47, i8** %t, align 4
  %47 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %47, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 409)
  br label %if.end50

if.else48:                                        ; preds = %if.else28
  %48 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  %call49 = call i8* @assoc_to_string(%struct.hash_table* %48, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 0)
  store i8* %call49, i8** %t, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.else48, %if.end46
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then24
  %49 = load %struct.hash_table*, %struct.hash_table** %h2, align 4
  call void @assoc_dispose(%struct.hash_table* %49)
  %50 = load i8*, i8** %t, align 4
  store i8* %50, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end51, %if.then
  %51 = load i8*, i8** %retval, align 4
  ret i8* %51
}

declare i8* @sh_modcase(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @assoc_to_assign(%struct.hash_table* %hash, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %hash.addr = alloca %struct.hash_table*, align 4
  %quoted.addr = alloca i32, align 4
  %ret = alloca i8*, align 4
  %istr = alloca i8*, align 4
  %vstr = alloca i8*, align 4
  %i = alloca i32, align 4
  %rsize = alloca i32, align 4
  %rlen = alloca i32, align 4
  %elen = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %hash, %struct.hash_table** %hash.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 128, i32* %rsize, align 4
  %call = call i8* @sh_xmalloc(i32 128, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 432)
  store i8* %call, i8** %ret, align 4
  %3 = load i8*, i8** %ret, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 40, i8* %arrayidx, align 1
  store i32 1, i32* %rlen, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc200, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %4, %6
  br i1 %cmp2, label %for.body, label %for.end202

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %tobool = icmp ne %struct.hash_table* %7, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %9, i32 0, i32 1
  %10 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %8, %10
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %11 = load %struct.hash_table*, %struct.hash_table** %hash.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 0
  %12 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %12, i32 %13
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx5, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %14, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %cond.end
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool7 = icmp ne %struct.bucket_contents* %15, null
  br i1 %tobool7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 1
  %17 = load i8*, i8** %key, align 4
  %call9 = call i32 @ansic_shouldquote(i8* %17)
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %for.body8
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key12 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 1
  %19 = load i8*, i8** %key12, align 4
  %call13 = call i8* @ansic_quote(i8* %19, i32 0, i32* null)
  store i8* %call13, i8** %istr, align 4
  br label %if.end44

if.else:                                          ; preds = %for.body8
  %20 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key14 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %20, i32 0, i32 1
  %21 = load i8*, i8** %key14, align 4
  %call15 = call i32 @sh_contains_shell_metas(i8* %21)
  %tobool16 = icmp ne i32 %call15, 0
  br i1 %tobool16, label %if.then17, label %if.else20

if.then17:                                        ; preds = %if.else
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key18 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 1
  %23 = load i8*, i8** %key18, align 4
  %call19 = call i8* @sh_double_quote(i8* %23)
  store i8* %call19, i8** %istr, align 4
  br label %if.end43

if.else20:                                        ; preds = %if.else
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key21 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %24, i32 0, i32 1
  %25 = load i8*, i8** %key21, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx22, align 1
  %conv = sext i8 %26 to i32
  %cmp23 = icmp eq i32 %conv, 64
  br i1 %cmp23, label %land.lhs.true31, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.else20
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key26 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %27, i32 0, i32 1
  %28 = load i8*, i8** %key26, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %28, i32 0
  %29 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %29 to i32
  %cmp29 = icmp eq i32 %conv28, 42
  br i1 %cmp29, label %land.lhs.true31, label %if.else40

land.lhs.true31:                                  ; preds = %lor.lhs.false25, %if.else20
  %30 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key32 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %30, i32 0, i32 1
  %31 = load i8*, i8** %key32, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %31, i32 1
  %32 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %32 to i32
  %cmp35 = icmp eq i32 %conv34, 0
  br i1 %cmp35, label %if.then37, label %if.else40

if.then37:                                        ; preds = %land.lhs.true31
  %33 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key38 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %33, i32 0, i32 1
  %34 = load i8*, i8** %key38, align 4
  %call39 = call i8* @sh_double_quote(i8* %34)
  store i8* %call39, i8** %istr, align 4
  br label %if.end42

if.else40:                                        ; preds = %land.lhs.true31, %lor.lhs.false25
  %35 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key41 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %35, i32 0, i32 1
  %36 = load i8*, i8** %key41, align 4
  store i8* %36, i8** %istr, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.else40, %if.then37
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.then17
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then11
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %37, i32 0, i32 2
  %38 = load i8*, i8** %data, align 4
  %tobool45 = icmp ne i8* %38, null
  br i1 %tobool45, label %cond.true46, label %cond.false58

cond.true46:                                      ; preds = %if.end44
  %39 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data47 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %39, i32 0, i32 2
  %40 = load i8*, i8** %data47, align 4
  %call48 = call i32 @ansic_shouldquote(i8* %40)
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %cond.true50, label %cond.false53

cond.true50:                                      ; preds = %cond.true46
  %41 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data51 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %41, i32 0, i32 2
  %42 = load i8*, i8** %data51, align 4
  %call52 = call i8* @ansic_quote(i8* %42, i32 0, i32* null)
  br label %cond.end56

cond.false53:                                     ; preds = %cond.true46
  %43 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data54 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %43, i32 0, i32 2
  %44 = load i8*, i8** %data54, align 4
  %call55 = call i8* @sh_double_quote(i8* %44)
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false53, %cond.true50
  %cond57 = phi i8* [ %call52, %cond.true50 ], [ %call55, %cond.false53 ]
  br label %cond.end59

cond.false58:                                     ; preds = %if.end44
  br label %cond.end59

cond.end59:                                       ; preds = %cond.false58, %cond.end56
  %cond60 = phi i8* [ %cond57, %cond.end56 ], [ null, %cond.false58 ]
  store i8* %cond60, i8** %vstr, align 4
  %45 = load i8*, i8** %istr, align 4
  %tobool61 = icmp ne i8* %45, null
  br i1 %tobool61, label %land.lhs.true62, label %cond.false82

land.lhs.true62:                                  ; preds = %cond.end59
  %46 = load i8*, i8** %istr, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %46, i32 0
  %47 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %47 to i32
  %tobool65 = icmp ne i32 %conv64, 0
  br i1 %tobool65, label %cond.true66, label %cond.false82

cond.true66:                                      ; preds = %land.lhs.true62
  %48 = load i8*, i8** %istr, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %48, i32 1
  %49 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %49 to i32
  %tobool69 = icmp ne i32 %conv68, 0
  br i1 %tobool69, label %cond.true70, label %cond.false79

cond.true70:                                      ; preds = %cond.true66
  %50 = load i8*, i8** %istr, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %50, i32 2
  %51 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %51 to i32
  %tobool73 = icmp ne i32 %conv72, 0
  br i1 %tobool73, label %cond.true74, label %cond.false76

cond.true74:                                      ; preds = %cond.true70
  %52 = load i8*, i8** %istr, align 4
  %call75 = call i32 @strlen(i8* %52)
  br label %cond.end77

cond.false76:                                     ; preds = %cond.true70
  br label %cond.end77

cond.end77:                                       ; preds = %cond.false76, %cond.true74
  %cond78 = phi i32 [ %call75, %cond.true74 ], [ 2, %cond.false76 ]
  br label %cond.end80

cond.false79:                                     ; preds = %cond.true66
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false79, %cond.end77
  %cond81 = phi i32 [ %cond78, %cond.end77 ], [ 1, %cond.false79 ]
  br label %cond.end83

cond.false82:                                     ; preds = %land.lhs.true62, %cond.end59
  br label %cond.end83

cond.end83:                                       ; preds = %cond.false82, %cond.end80
  %cond84 = phi i32 [ %cond81, %cond.end80 ], [ 0, %cond.false82 ]
  %add = add i32 %cond84, 8
  %53 = load i8*, i8** %vstr, align 4
  %tobool85 = icmp ne i8* %53, null
  br i1 %tobool85, label %land.lhs.true86, label %cond.false106

land.lhs.true86:                                  ; preds = %cond.end83
  %54 = load i8*, i8** %vstr, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %54, i32 0
  %55 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %55 to i32
  %tobool89 = icmp ne i32 %conv88, 0
  br i1 %tobool89, label %cond.true90, label %cond.false106

cond.true90:                                      ; preds = %land.lhs.true86
  %56 = load i8*, i8** %vstr, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %56, i32 1
  %57 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %57 to i32
  %tobool93 = icmp ne i32 %conv92, 0
  br i1 %tobool93, label %cond.true94, label %cond.false103

cond.true94:                                      ; preds = %cond.true90
  %58 = load i8*, i8** %vstr, align 4
  %arrayidx95 = getelementptr inbounds i8, i8* %58, i32 2
  %59 = load i8, i8* %arrayidx95, align 1
  %conv96 = sext i8 %59 to i32
  %tobool97 = icmp ne i32 %conv96, 0
  br i1 %tobool97, label %cond.true98, label %cond.false100

cond.true98:                                      ; preds = %cond.true94
  %60 = load i8*, i8** %vstr, align 4
  %call99 = call i32 @strlen(i8* %60)
  br label %cond.end101

cond.false100:                                    ; preds = %cond.true94
  br label %cond.end101

cond.end101:                                      ; preds = %cond.false100, %cond.true98
  %cond102 = phi i32 [ %call99, %cond.true98 ], [ 2, %cond.false100 ]
  br label %cond.end104

cond.false103:                                    ; preds = %cond.true90
  br label %cond.end104

cond.end104:                                      ; preds = %cond.false103, %cond.end101
  %cond105 = phi i32 [ %cond102, %cond.end101 ], [ 1, %cond.false103 ]
  br label %cond.end107

cond.false106:                                    ; preds = %land.lhs.true86, %cond.end83
  br label %cond.end107

cond.end107:                                      ; preds = %cond.false106, %cond.end104
  %cond108 = phi i32 [ %cond105, %cond.end104 ], [ 0, %cond.false106 ]
  %add109 = add i32 %add, %cond108
  store i32 %add109, i32* %elen, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end107
  %61 = load i32, i32* %rlen, align 4
  %62 = load i32, i32* %elen, align 4
  %add110 = add nsw i32 %62, 1
  %add111 = add nsw i32 %61, %add110
  %63 = load i32, i32* %rsize, align 4
  %cmp112 = icmp sge i32 %add111, %63
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then114
  %64 = load i32, i32* %rlen, align 4
  %65 = load i32, i32* %elen, align 4
  %add115 = add nsw i32 %65, 1
  %add116 = add nsw i32 %64, %add115
  %66 = load i32, i32* %rsize, align 4
  %cmp117 = icmp sge i32 %add116, %66
  br i1 %cmp117, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %67 = load i32, i32* %rsize, align 4
  %68 = load i32, i32* %rsize, align 4
  %add119 = add nsw i32 %68, %67
  store i32 %add119, i32* %rsize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %69 = load i8*, i8** %ret, align 4
  %70 = load i32, i32* %rsize, align 4
  %call120 = call i8* @sh_xrealloc(i8* %69, i32 %70, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 454)
  store i8* %call120, i8** %ret, align 4
  br label %if.end121

if.end121:                                        ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end121
  %71 = load i8*, i8** %ret, align 4
  %72 = load i32, i32* %rlen, align 4
  %inc = add nsw i32 %72, 1
  store i32 %inc, i32* %rlen, align 4
  %arrayidx122 = getelementptr inbounds i8, i8* %71, i32 %72
  store i8 91, i8* %arrayidx122, align 1
  %73 = load i8*, i8** %ret, align 4
  %74 = load i32, i32* %rlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %73, i32 %74
  %75 = load i8*, i8** %istr, align 4
  %call123 = call i8* @strcpy(i8* %add.ptr, i8* %75)
  %76 = load i8*, i8** %istr, align 4
  %tobool124 = icmp ne i8* %76, null
  br i1 %tobool124, label %land.lhs.true125, label %cond.false145

land.lhs.true125:                                 ; preds = %do.end
  %77 = load i8*, i8** %istr, align 4
  %arrayidx126 = getelementptr inbounds i8, i8* %77, i32 0
  %78 = load i8, i8* %arrayidx126, align 1
  %conv127 = sext i8 %78 to i32
  %tobool128 = icmp ne i32 %conv127, 0
  br i1 %tobool128, label %cond.true129, label %cond.false145

cond.true129:                                     ; preds = %land.lhs.true125
  %79 = load i8*, i8** %istr, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %79, i32 1
  %80 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %80 to i32
  %tobool132 = icmp ne i32 %conv131, 0
  br i1 %tobool132, label %cond.true133, label %cond.false142

cond.true133:                                     ; preds = %cond.true129
  %81 = load i8*, i8** %istr, align 4
  %arrayidx134 = getelementptr inbounds i8, i8* %81, i32 2
  %82 = load i8, i8* %arrayidx134, align 1
  %conv135 = sext i8 %82 to i32
  %tobool136 = icmp ne i32 %conv135, 0
  br i1 %tobool136, label %cond.true137, label %cond.false139

cond.true137:                                     ; preds = %cond.true133
  %83 = load i8*, i8** %istr, align 4
  %call138 = call i32 @strlen(i8* %83)
  br label %cond.end140

cond.false139:                                    ; preds = %cond.true133
  br label %cond.end140

cond.end140:                                      ; preds = %cond.false139, %cond.true137
  %cond141 = phi i32 [ %call138, %cond.true137 ], [ 2, %cond.false139 ]
  br label %cond.end143

cond.false142:                                    ; preds = %cond.true129
  br label %cond.end143

cond.end143:                                      ; preds = %cond.false142, %cond.end140
  %cond144 = phi i32 [ %cond141, %cond.end140 ], [ 1, %cond.false142 ]
  br label %cond.end146

cond.false145:                                    ; preds = %land.lhs.true125, %do.end
  br label %cond.end146

cond.end146:                                      ; preds = %cond.false145, %cond.end143
  %cond147 = phi i32 [ %cond144, %cond.end143 ], [ 0, %cond.false145 ]
  %84 = load i32, i32* %rlen, align 4
  %add148 = add i32 %84, %cond147
  store i32 %add148, i32* %rlen, align 4
  %85 = load i8*, i8** %ret, align 4
  %86 = load i32, i32* %rlen, align 4
  %inc149 = add nsw i32 %86, 1
  store i32 %inc149, i32* %rlen, align 4
  %arrayidx150 = getelementptr inbounds i8, i8* %85, i32 %86
  store i8 93, i8* %arrayidx150, align 1
  %87 = load i8*, i8** %ret, align 4
  %88 = load i32, i32* %rlen, align 4
  %inc151 = add nsw i32 %88, 1
  store i32 %inc151, i32* %rlen, align 4
  %arrayidx152 = getelementptr inbounds i8, i8* %87, i32 %88
  store i8 61, i8* %arrayidx152, align 1
  %89 = load i8*, i8** %vstr, align 4
  %tobool153 = icmp ne i8* %89, null
  br i1 %tobool153, label %if.then154, label %if.end182

if.then154:                                       ; preds = %cond.end146
  %90 = load i8*, i8** %ret, align 4
  %91 = load i32, i32* %rlen, align 4
  %add.ptr155 = getelementptr inbounds i8, i8* %90, i32 %91
  %92 = load i8*, i8** %vstr, align 4
  %call156 = call i8* @strcpy(i8* %add.ptr155, i8* %92)
  %93 = load i8*, i8** %vstr, align 4
  %tobool157 = icmp ne i8* %93, null
  br i1 %tobool157, label %land.lhs.true158, label %cond.false178

land.lhs.true158:                                 ; preds = %if.then154
  %94 = load i8*, i8** %vstr, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %94, i32 0
  %95 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %95 to i32
  %tobool161 = icmp ne i32 %conv160, 0
  br i1 %tobool161, label %cond.true162, label %cond.false178

cond.true162:                                     ; preds = %land.lhs.true158
  %96 = load i8*, i8** %vstr, align 4
  %arrayidx163 = getelementptr inbounds i8, i8* %96, i32 1
  %97 = load i8, i8* %arrayidx163, align 1
  %conv164 = sext i8 %97 to i32
  %tobool165 = icmp ne i32 %conv164, 0
  br i1 %tobool165, label %cond.true166, label %cond.false175

cond.true166:                                     ; preds = %cond.true162
  %98 = load i8*, i8** %vstr, align 4
  %arrayidx167 = getelementptr inbounds i8, i8* %98, i32 2
  %99 = load i8, i8* %arrayidx167, align 1
  %conv168 = sext i8 %99 to i32
  %tobool169 = icmp ne i32 %conv168, 0
  br i1 %tobool169, label %cond.true170, label %cond.false172

cond.true170:                                     ; preds = %cond.true166
  %100 = load i8*, i8** %vstr, align 4
  %call171 = call i32 @strlen(i8* %100)
  br label %cond.end173

cond.false172:                                    ; preds = %cond.true166
  br label %cond.end173

cond.end173:                                      ; preds = %cond.false172, %cond.true170
  %cond174 = phi i32 [ %call171, %cond.true170 ], [ 2, %cond.false172 ]
  br label %cond.end176

cond.false175:                                    ; preds = %cond.true162
  br label %cond.end176

cond.end176:                                      ; preds = %cond.false175, %cond.end173
  %cond177 = phi i32 [ %cond174, %cond.end173 ], [ 1, %cond.false175 ]
  br label %cond.end179

cond.false178:                                    ; preds = %land.lhs.true158, %if.then154
  br label %cond.end179

cond.end179:                                      ; preds = %cond.false178, %cond.end176
  %cond180 = phi i32 [ %cond177, %cond.end176 ], [ 0, %cond.false178 ]
  %101 = load i32, i32* %rlen, align 4
  %add181 = add i32 %101, %cond180
  store i32 %add181, i32* %rlen, align 4
  br label %if.end182

if.end182:                                        ; preds = %cond.end179, %cond.end146
  %102 = load i8*, i8** %ret, align 4
  %103 = load i32, i32* %rlen, align 4
  %inc183 = add nsw i32 %103, 1
  store i32 %inc183, i32* %rlen, align 4
  %arrayidx184 = getelementptr inbounds i8, i8* %102, i32 %103
  store i8 32, i8* %arrayidx184, align 1
  %104 = load i8*, i8** %istr, align 4
  %105 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key185 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %105, i32 0, i32 1
  %106 = load i8*, i8** %key185, align 4
  %cmp186 = icmp ne i8* %104, %106
  br i1 %cmp186, label %if.then188, label %if.end194

if.then188:                                       ; preds = %if.end182
  br label %do.body189

do.body189:                                       ; preds = %if.then188
  %107 = load i8*, i8** %istr, align 4
  %tobool190 = icmp ne i8* %107, null
  br i1 %tobool190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %do.body189
  %108 = load i8*, i8** %istr, align 4
  call void @sh_xfree(i8* %108, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 470)
  br label %if.end192

if.end192:                                        ; preds = %if.then191, %do.body189
  br label %do.end193

do.end193:                                        ; preds = %if.end192
  br label %if.end194

if.end194:                                        ; preds = %do.end193, %if.end182
  br label %do.body195

do.body195:                                       ; preds = %if.end194
  %109 = load i8*, i8** %vstr, align 4
  %tobool196 = icmp ne i8* %109, null
  br i1 %tobool196, label %if.then197, label %if.end198

if.then197:                                       ; preds = %do.body195
  %110 = load i8*, i8** %vstr, align 4
  call void @sh_xfree(i8* %110, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 472)
  br label %if.end198

if.end198:                                        ; preds = %if.then197, %do.body195
  br label %do.end199

do.end199:                                        ; preds = %if.end198
  br label %for.inc

for.inc:                                          ; preds = %do.end199
  %111 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %111, i32 0, i32 0
  %112 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %112, %struct.bucket_contents** %tlist, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc200

for.inc200:                                       ; preds = %for.end
  %113 = load i32, i32* %i, align 4
  %inc201 = add nsw i32 %113, 1
  store i32 %inc201, i32* %i, align 4
  br label %for.cond

for.end202:                                       ; preds = %for.cond
  br label %do.body203

do.body203:                                       ; preds = %for.end202
  %114 = load i32, i32* %rlen, align 4
  %add204 = add nsw i32 %114, 1
  %115 = load i32, i32* %rsize, align 4
  %cmp205 = icmp sge i32 %add204, %115
  br i1 %cmp205, label %if.then207, label %if.end216

if.then207:                                       ; preds = %do.body203
  br label %while.cond208

while.cond208:                                    ; preds = %while.body212, %if.then207
  %116 = load i32, i32* %rlen, align 4
  %add209 = add nsw i32 %116, 1
  %117 = load i32, i32* %rsize, align 4
  %cmp210 = icmp sge i32 %add209, %117
  br i1 %cmp210, label %while.body212, label %while.end214

while.body212:                                    ; preds = %while.cond208
  %118 = load i32, i32* %rsize, align 4
  %add213 = add nsw i32 %118, 8
  store i32 %add213, i32* %rsize, align 4
  br label %while.cond208

while.end214:                                     ; preds = %while.cond208
  %119 = load i8*, i8** %ret, align 4
  %120 = load i32, i32* %rsize, align 4
  %call215 = call i8* @sh_xrealloc(i8* %119, i32 %120, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 475)
  store i8* %call215, i8** %ret, align 4
  br label %if.end216

if.end216:                                        ; preds = %while.end214, %do.body203
  br label %do.end217

do.end217:                                        ; preds = %if.end216
  %121 = load i8*, i8** %ret, align 4
  %122 = load i32, i32* %rlen, align 4
  %inc218 = add nsw i32 %122, 1
  store i32 %inc218, i32* %rlen, align 4
  %arrayidx219 = getelementptr inbounds i8, i8* %121, i32 %122
  store i8 41, i8* %arrayidx219, align 1
  %123 = load i8*, i8** %ret, align 4
  %124 = load i32, i32* %rlen, align 4
  %arrayidx220 = getelementptr inbounds i8, i8* %123, i32 %124
  store i8 0, i8* %arrayidx220, align 1
  %125 = load i32, i32* %quoted.addr, align 4
  %tobool221 = icmp ne i32 %125, 0
  br i1 %tobool221, label %if.then222, label %if.end224

if.then222:                                       ; preds = %do.end217
  %126 = load i8*, i8** %ret, align 4
  %call223 = call i8* @sh_single_quote(i8* %126)
  store i8* %call223, i8** %vstr, align 4
  %127 = load i8*, i8** %ret, align 4
  call void @sh_xfree(i8* %127, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 482)
  %128 = load i8*, i8** %vstr, align 4
  store i8* %128, i8** %ret, align 4
  br label %if.end224

if.end224:                                        ; preds = %if.then222, %do.end217
  %129 = load i8*, i8** %ret, align 4
  store i8* %129, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end224, %if.then
  %130 = load i8*, i8** %retval, align 4
  ret i8* %130
}

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

declare i32 @sh_contains_shell_metas(i8*) #1

declare i8* @sh_double_quote(i8*) #1

declare i8* @sh_single_quote(i8*) #1

; Function Attrs: noinline nounwind
define internal %struct.word_list* @assoc_to_word_list_internal(%struct.hash_table* %h, i32 %t) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %h.addr = alloca %struct.hash_table*, align 4
  %t.addr = alloca i32, align 4
  %list = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %tlist = alloca %struct.bucket_contents*, align 4
  %w = alloca i8*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store %struct.word_list* null, %struct.word_list** %list, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %tobool = icmp ne %struct.hash_table* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %nbuckets3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 1
  %9 = load i32, i32* %nbuckets3, align 4
  %cmp4 = icmp slt i32 %7, %9
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %10 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ %13, %cond.true ], [ null, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %cond.end
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %tobool6 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %15 = load i32, i32* %t.addr, align 4
  %cmp8 = icmp eq i32 %15, 0
  br i1 %cmp8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %for.body7
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 2
  %17 = load i8*, i8** %data, align 4
  br label %cond.end11

cond.false10:                                     ; preds = %for.body7
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 1
  %19 = load i8*, i8** %key, align 4
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %cond12 = phi i8* [ %17, %cond.true9 ], [ %19, %cond.false10 ]
  store i8* %cond12, i8** %w, align 4
  %20 = load i8*, i8** %w, align 4
  %call = call %struct.word_desc* @make_bare_word(i8* %20)
  %21 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call13 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* %21)
  store %struct.word_list* %call13, %struct.word_list** %list, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end11
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %tlist, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 0
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %23, %struct.bucket_contents** %tlist, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %24 = load i32, i32* %i, align 4
  %inc = add nsw i32 %24, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  %25 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool16 = icmp ne %struct.word_list* %25, null
  br i1 %tobool16, label %land.lhs.true17, label %cond.false22

land.lhs.true17:                                  ; preds = %for.end15
  %26 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next18 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 0
  %27 = load %struct.word_list*, %struct.word_list** %next18, align 4
  %tobool19 = icmp ne %struct.word_list* %27, null
  br i1 %tobool19, label %cond.true20, label %cond.false22

cond.true20:                                      ; preds = %land.lhs.true17
  %28 = load %struct.word_list*, %struct.word_list** %list, align 4
  %29 = bitcast %struct.word_list* %28 to %struct.g_list*
  %call21 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %29)
  %30 = bitcast %struct.g_list* %call21 to %struct.word_list*
  br label %cond.end23

cond.false22:                                     ; preds = %land.lhs.true17, %for.end15
  %31 = load %struct.word_list*, %struct.word_list** %list, align 4
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true20
  %cond24 = phi %struct.word_list* [ %30, %cond.true20 ], [ %31, %cond.false22 ]
  store %struct.word_list* %cond24, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end23, %if.then
  %32 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %32
}

; Function Attrs: noinline nounwind
define %struct.word_list* @assoc_keys_to_word_list(%struct.hash_table* %h) #0 {
entry:
  %h.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %h, %struct.hash_table** %h.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %h.addr, align 4
  %call = call %struct.word_list* @assoc_to_word_list_internal(%struct.hash_table* %0, i32 1)
  ret %struct.word_list* %call
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_bare_word(i8*) #1

declare %struct.g_list* @list_reverse(...) #1

declare i8* @string_list_internal(%struct.word_list*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
