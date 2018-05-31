; ModuleID = 'hashlib.c'
source_filename = "hashlib.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"hashlib.c\00", align 1

; Function Attrs: noinline nounwind
define %struct.hash_table* @hash_create(i32 %buckets) #0 {
entry:
  %buckets.addr = alloca i32, align 4
  %new_table = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  store i32 %buckets, i32* %buckets.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 52)
  %0 = bitcast i8* %call to %struct.hash_table*
  store %struct.hash_table* %0, %struct.hash_table** %new_table, align 4
  %1 = load i32, i32* %buckets.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 128, i32* %buckets.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %buckets.addr, align 4
  %mul = mul i32 %2, 4
  %call1 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 57)
  %3 = bitcast i8* %call1 to %struct.bucket_contents**
  %4 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 0
  store %struct.bucket_contents** %3, %struct.bucket_contents*** %bucket_array, align 4
  %5 = load i32, i32* %buckets.addr, align 4
  %6 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %6, i32 0, i32 1
  store i32 %5, i32* %nbuckets, align 4
  %7 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 2
  store i32 0, i32* %nentries, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %buckets.addr, align 4
  %cmp2 = icmp slt i32 %8, %9
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %bucket_array3 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array3, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  store %struct.bucket_contents* null, %struct.bucket_contents** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  ret %struct.hash_table* %14
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @hash_size(%struct.hash_table* %table) #0 {
entry:
  %table.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 2
  %2 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define %struct.hash_table* @hash_copy(%struct.hash_table* %table, i8* (i8*)* %cpdata) #0 {
entry:
  %retval = alloca %struct.hash_table*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %cpdata.addr = alloca i8* (i8*)*, align 4
  %new_table = alloca %struct.hash_table*, align 4
  %i = alloca i32, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i8* (i8*)* %cpdata, i8* (i8*)** %cpdata.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.hash_table* null, %struct.hash_table** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 1
  %2 = load i32, i32* %nbuckets, align 4
  %call = call %struct.hash_table* @hash_create(i32 %2)
  store %struct.hash_table* %call, %struct.hash_table** %new_table, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets1 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %4, i32 0, i32 1
  %5 = load i32, i32* %nbuckets1, align 4
  %cmp2 = icmp slt i32 %3, %5
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %6, i32 0, i32 0
  %7 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %7, i32 %8
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  %10 = load i8* (i8*)*, i8* (i8*)** %cpdata.addr, align 4
  %call3 = call %struct.bucket_contents* @copy_bucket_array(%struct.bucket_contents* %9, i8* (i8*)* %10)
  %11 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %bucket_array4 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 0
  %12 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array4, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %12, i32 %13
  store %struct.bucket_contents* %call3, %struct.bucket_contents** %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %15, i32 0, i32 2
  %16 = load i32, i32* %nentries, align 4
  %17 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  %nentries6 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %17, i32 0, i32 2
  store i32 %16, i32* %nentries6, align 4
  %18 = load %struct.hash_table*, %struct.hash_table** %new_table, align 4
  store %struct.hash_table* %18, %struct.hash_table** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %19 = load %struct.hash_table*, %struct.hash_table** %retval, align 4
  ret %struct.hash_table* %19
}

; Function Attrs: noinline nounwind
define internal %struct.bucket_contents* @copy_bucket_array(%struct.bucket_contents* %ba, i8* (i8*)* %cpdata) #0 {
entry:
  %retval = alloca %struct.bucket_contents*, align 4
  %ba.addr = alloca %struct.bucket_contents*, align 4
  %cpdata.addr = alloca i8* (i8*)*, align 4
  %new_bucket = alloca %struct.bucket_contents*, align 4
  %n = alloca %struct.bucket_contents*, align 4
  %e = alloca %struct.bucket_contents*, align 4
  store %struct.bucket_contents* %ba, %struct.bucket_contents** %ba.addr, align 4
  store i8* (i8*)* %cpdata, i8* (i8*)** %cpdata.addr, align 4
  %0 = load %struct.bucket_contents*, %struct.bucket_contents** %ba.addr, align 4
  %cmp = icmp eq %struct.bucket_contents* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.bucket_contents* null, %struct.bucket_contents** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store %struct.bucket_contents* null, %struct.bucket_contents** %n, align 4
  %1 = load %struct.bucket_contents*, %struct.bucket_contents** %ba.addr, align 4
  store %struct.bucket_contents* %1, %struct.bucket_contents** %e, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %tobool = icmp ne %struct.bucket_contents* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %cmp1 = icmp eq %struct.bucket_contents* %3, null
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %for.body
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 88)
  %4 = bitcast i8* %call to %struct.bucket_contents*
  store %struct.bucket_contents* %4, %struct.bucket_contents** %new_bucket, align 4
  %5 = load %struct.bucket_contents*, %struct.bucket_contents** %new_bucket, align 4
  store %struct.bucket_contents* %5, %struct.bucket_contents** %n, align 4
  br label %if.end5

if.else:                                          ; preds = %for.body
  %call3 = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 93)
  %6 = bitcast i8* %call3 to %struct.bucket_contents*
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 0
  store %struct.bucket_contents* %6, %struct.bucket_contents** %next, align 4
  %8 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %next4 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %8, i32 0, i32 0
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %next4, align 4
  store %struct.bucket_contents* %9, %struct.bucket_contents** %n, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then2
  %10 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %10, i32 0, i32 1
  %11 = load i8*, i8** %key, align 4
  %call6 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 97)
  %12 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %key8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %12, i32 0, i32 1
  %13 = load i8*, i8** %key8, align 4
  %call9 = call i8* @strcpy(i8* %call7, i8* %13)
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %key10 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %14, i32 0, i32 1
  store i8* %call9, i8** %key10, align 4
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 2
  %16 = load i8*, i8** %data, align 4
  %tobool11 = icmp ne i8* %16, null
  br i1 %tobool11, label %cond.true, label %cond.false22

cond.true:                                        ; preds = %if.end5
  %17 = load i8* (i8*)*, i8* (i8*)** %cpdata.addr, align 4
  %tobool12 = icmp ne i8* (i8*)* %17, null
  br i1 %tobool12, label %cond.true13, label %cond.false

cond.true13:                                      ; preds = %cond.true
  %18 = load i8* (i8*)*, i8* (i8*)** %cpdata.addr, align 4
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %data14 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data14, align 4
  %call15 = call i8* %18(i8* %20)
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %21 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %data16 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %21, i32 0, i32 2
  %22 = load i8*, i8** %data16, align 4
  %call17 = call i32 @strlen(i8* %22)
  %add18 = add i32 1, %call17
  %call19 = call i8* @sh_xmalloc(i32 %add18, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 98)
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %data20 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 2
  %24 = load i8*, i8** %data20, align 4
  %call21 = call i8* @strcpy(i8* %call19, i8* %24)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true13
  %cond = phi i8* [ %call15, %cond.true13 ], [ %call21, %cond.false ]
  br label %cond.end23

cond.false22:                                     ; preds = %if.end5
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.end
  %cond24 = phi i8* [ %cond, %cond.end ], [ null, %cond.false22 ]
  %25 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %data25 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %25, i32 0, i32 2
  store i8* %cond24, i8** %data25, align 4
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %khash = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 3
  %27 = load i32, i32* %khash, align 4
  %28 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %khash26 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %28, i32 0, i32 3
  store i32 %27, i32* %khash26, align 4
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %times_found = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 4
  %30 = load i32, i32* %times_found, align 4
  %31 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %times_found27 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %31, i32 0, i32 4
  store i32 %30, i32* %times_found27, align 4
  %32 = load %struct.bucket_contents*, %struct.bucket_contents** %n, align 4
  %next28 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %32, i32 0, i32 0
  store %struct.bucket_contents* null, %struct.bucket_contents** %next28, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end23
  %33 = load %struct.bucket_contents*, %struct.bucket_contents** %e, align 4
  %next29 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %33, i32 0, i32 0
  %34 = load %struct.bucket_contents*, %struct.bucket_contents** %next29, align 4
  store %struct.bucket_contents* %34, %struct.bucket_contents** %e, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %35 = load %struct.bucket_contents*, %struct.bucket_contents** %new_bucket, align 4
  store %struct.bucket_contents* %35, %struct.bucket_contents** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %36 = load %struct.bucket_contents*, %struct.bucket_contents** %retval, align 4
  ret %struct.bucket_contents* %36
}

; Function Attrs: noinline nounwind
define i32 @hash_string(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8, i8* %0, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %mul = mul i32 %2, 16777619
  store i32 %mul, i32* %i, align 4
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %5 = load i32, i32* %i, align 4
  %xor = xor i32 %5, %conv
  store i32 %xor, i32* %i, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %s.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %s.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %i, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind
define i32 @hash_bucket(i8* %string, %struct.hash_table* %table) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %h = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @hash_string(i8* %0)
  store i32 %call, i32* %h, align 4
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %1, i32 0, i32 1
  %2 = load i32, i32* %nbuckets, align 4
  %sub = sub nsw i32 %2, 1
  %and = and i32 %call, %sub
  ret i32 %and
}

; Function Attrs: noinline nounwind
define %struct.bucket_contents* @hash_search(i8* %string, %struct.hash_table* %table, i32 %flags) #0 {
entry:
  %retval = alloca %struct.bucket_contents*, align 4
  %string.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %flags.addr = alloca i32, align 4
  %list = alloca %struct.bucket_contents*, align 4
  %bucket = alloca i32, align 4
  %hv = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 2
  %cmp1 = icmp eq i32 %and, 0
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %3, i32 0, i32 2
  %4 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ 0, %cond.false ]
  %cmp2 = icmp eq i32 %cond, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  store %struct.bucket_contents* null, %struct.bucket_contents** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end, %lor.lhs.false
  %5 = load i8*, i8** %string.addr, align 4
  %call = call i32 @hash_string(i8* %5)
  store i32 %call, i32* %hv, align 4
  %6 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %6, i32 0, i32 1
  %7 = load i32, i32* %nbuckets, align 4
  %sub = sub nsw i32 %7, 1
  %and3 = and i32 %call, %sub
  store i32 %and3, i32* %bucket, align 4
  %8 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %8, i32 0, i32 0
  %9 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %tobool4 = icmp ne %struct.bucket_contents** %9, null
  br i1 %tobool4, label %cond.true5, label %cond.false7

cond.true5:                                       ; preds = %if.end
  %10 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array6 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %10, i32 0, i32 0
  %11 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array6, align 4
  %12 = load i32, i32* %bucket, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %11, i32 %12
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end8

cond.false7:                                      ; preds = %if.end
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.true5
  %cond9 = phi %struct.bucket_contents* [ %13, %cond.true5 ], [ null, %cond.false7 ]
  store %struct.bucket_contents* %cond9, %struct.bucket_contents** %list, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end8
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %tobool10 = icmp ne %struct.bucket_contents* %14, null
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %hv, align 4
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %khash = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 3
  %17 = load i32, i32* %khash, align 4
  %cmp11 = icmp eq i32 %15, %17
  br i1 %cmp11, label %land.lhs.true12, label %if.end24

land.lhs.true12:                                  ; preds = %for.body
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 1
  %19 = load i8*, i8** %key, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx13, align 1
  %conv = sext i8 %20 to i32
  %21 = load i8*, i8** %string.addr, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %22 to i32
  %cmp16 = icmp eq i32 %conv, %conv15
  br i1 %cmp16, label %land.lhs.true18, label %if.end24

land.lhs.true18:                                  ; preds = %land.lhs.true12
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %key19 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 1
  %24 = load i8*, i8** %key19, align 4
  %25 = load i8*, i8** %string.addr, align 4
  %call20 = call i32 @strcmp(i8* %24, i8* %25)
  %cmp21 = icmp eq i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %land.lhs.true18
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %times_found = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 4
  %27 = load i32, i32* %times_found, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %times_found, align 4
  %28 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  store %struct.bucket_contents* %28, %struct.bucket_contents** %retval, align 4
  br label %return

if.end24:                                         ; preds = %land.lhs.true18, %land.lhs.true12, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end24
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 0
  %30 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %30, %struct.bucket_contents** %list, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %31 = load i32, i32* %flags.addr, align 4
  %and25 = and i32 %31, 2
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.end39

if.then27:                                        ; preds = %for.end
  %call28 = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 192)
  %32 = bitcast i8* %call28 to %struct.bucket_contents*
  store %struct.bucket_contents* %32, %struct.bucket_contents** %list, align 4
  %33 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array29 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %33, i32 0, i32 0
  %34 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array29, align 4
  %35 = load i32, i32* %bucket, align 4
  %arrayidx30 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %34, i32 %35
  %36 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx30, align 4
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %next31 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %37, i32 0, i32 0
  store %struct.bucket_contents* %36, %struct.bucket_contents** %next31, align 4
  %38 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %39 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array32 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %39, i32 0, i32 0
  %40 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array32, align 4
  %41 = load i32, i32* %bucket, align 4
  %arrayidx33 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %40, i32 %41
  store %struct.bucket_contents* %38, %struct.bucket_contents** %arrayidx33, align 4
  %42 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %42, i32 0, i32 2
  store i8* null, i8** %data, align 4
  %43 = load i8*, i8** %string.addr, align 4
  %44 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %key34 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %44, i32 0, i32 1
  store i8* %43, i8** %key34, align 4
  %45 = load i32, i32* %hv, align 4
  %46 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %khash35 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %46, i32 0, i32 3
  store i32 %45, i32* %khash35, align 4
  %47 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  %times_found36 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %47, i32 0, i32 4
  store i32 0, i32* %times_found36, align 4
  %48 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries37 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %48, i32 0, i32 2
  %49 = load i32, i32* %nentries37, align 4
  %inc38 = add nsw i32 %49, 1
  store i32 %inc38, i32* %nentries37, align 4
  %50 = load %struct.bucket_contents*, %struct.bucket_contents** %list, align 4
  store %struct.bucket_contents* %50, %struct.bucket_contents** %retval, align 4
  br label %return

if.end39:                                         ; preds = %for.end
  store %struct.bucket_contents* null, %struct.bucket_contents** %retval, align 4
  br label %return

return:                                           ; preds = %if.end39, %if.then27, %if.then23, %if.then
  %51 = load %struct.bucket_contents*, %struct.bucket_contents** %retval, align 4
  ret %struct.bucket_contents* %51
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: noinline nounwind
define %struct.bucket_contents* @hash_remove(i8* %string, %struct.hash_table* %table, i32 %flags) #0 {
entry:
  %retval = alloca %struct.bucket_contents*, align 4
  %string.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %flags.addr = alloca i32, align 4
  %bucket = alloca i32, align 4
  %prev = alloca %struct.bucket_contents*, align 4
  %temp = alloca %struct.bucket_contents*, align 4
  %hv = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  store %struct.bucket_contents* null, %struct.bucket_contents** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %4 = load i8*, i8** %string.addr, align 4
  %call = call i32 @hash_string(i8* %4)
  store i32 %call, i32* %hv, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %sub = sub nsw i32 %6, 1
  %and = and i32 %call, %sub
  store i32 %and, i32* %bucket, align 4
  store %struct.bucket_contents* null, %struct.bucket_contents** %prev, align 4
  %7 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 0
  %8 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %9 = load i32, i32* %bucket, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %8, i32 %9
  %10 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  store %struct.bucket_contents* %10, %struct.bucket_contents** %temp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %tobool2 = icmp ne %struct.bucket_contents* %11, null
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32, i32* %hv, align 4
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %khash = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 3
  %14 = load i32, i32* %khash, align 4
  %cmp3 = icmp eq i32 %12, %14
  br i1 %cmp3, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %for.body
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %15, i32 0, i32 1
  %16 = load i8*, i8** %key, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx4, align 1
  %conv = sext i8 %17 to i32
  %18 = load i8*, i8** %string.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %18, i32 0
  %19 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %19 to i32
  %cmp7 = icmp eq i32 %conv, %conv6
  br i1 %cmp7, label %land.lhs.true9, label %if.end23

land.lhs.true9:                                   ; preds = %land.lhs.true
  %20 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %key10 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %20, i32 0, i32 1
  %21 = load i8*, i8** %key10, align 4
  %22 = load i8*, i8** %string.addr, align 4
  %call11 = call i32 @strcmp(i8* %21, i8* %22)
  %cmp12 = icmp eq i32 %call11, 0
  br i1 %cmp12, label %if.then14, label %if.end23

if.then14:                                        ; preds = %land.lhs.true9
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %prev, align 4
  %tobool15 = icmp ne %struct.bucket_contents* %23, null
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.then14
  %24 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %24, i32 0, i32 0
  %25 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %prev, align 4
  %next17 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %26, i32 0, i32 0
  store %struct.bucket_contents* %25, %struct.bucket_contents** %next17, align 4
  br label %if.end21

if.else:                                          ; preds = %if.then14
  %27 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %next18 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %27, i32 0, i32 0
  %28 = load %struct.bucket_contents*, %struct.bucket_contents** %next18, align 4
  %29 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array19 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %29, i32 0, i32 0
  %30 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array19, align 4
  %31 = load i32, i32* %bucket, align 4
  %arrayidx20 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %30, i32 %31
  store %struct.bucket_contents* %28, %struct.bucket_contents** %arrayidx20, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.then16
  %32 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries22 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %32, i32 0, i32 2
  %33 = load i32, i32* %nentries22, align 4
  %dec = add nsw i32 %33, -1
  store i32 %dec, i32* %nentries22, align 4
  %34 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  store %struct.bucket_contents* %34, %struct.bucket_contents** %retval, align 4
  br label %return

if.end23:                                         ; preds = %land.lhs.true9, %land.lhs.true, %for.body
  %35 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  store %struct.bucket_contents* %35, %struct.bucket_contents** %prev, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %36 = load %struct.bucket_contents*, %struct.bucket_contents** %temp, align 4
  %next24 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %36, i32 0, i32 0
  %37 = load %struct.bucket_contents*, %struct.bucket_contents** %next24, align 4
  store %struct.bucket_contents* %37, %struct.bucket_contents** %temp, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.bucket_contents* null, %struct.bucket_contents** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.end21, %if.then
  %38 = load %struct.bucket_contents*, %struct.bucket_contents** %retval, align 4
  ret %struct.bucket_contents* %38
}

; Function Attrs: noinline nounwind
define %struct.bucket_contents* @hash_insert(i8* %string, %struct.hash_table* %table, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %table.addr = alloca %struct.hash_table*, align 4
  %flags.addr = alloca i32, align 4
  %item = alloca %struct.bucket_contents*, align 4
  %bucket = alloca i32, align 4
  %hv = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.hash_table* @hash_create(i32 0)
  store %struct.hash_table* %call, %struct.hash_table** %table.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %flags.addr, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %call1 = call %struct.bucket_contents* @hash_search(i8* %2, %struct.hash_table* %3, i32 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.bucket_contents* [ null, %cond.true ], [ %call1, %cond.false ]
  store %struct.bucket_contents* %cond, %struct.bucket_contents** %item, align 4
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %cmp2 = icmp eq %struct.bucket_contents* %4, null
  br i1 %cmp2, label %if.then3, label %if.end9

if.then3:                                         ; preds = %cond.end
  %5 = load i8*, i8** %string.addr, align 4
  %call4 = call i32 @hash_string(i8* %5)
  store i32 %call4, i32* %hv, align 4
  %6 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %6, i32 0, i32 1
  %7 = load i32, i32* %nbuckets, align 4
  %sub = sub nsw i32 %7, 1
  %and5 = and i32 %call4, %sub
  store i32 %and5, i32* %bucket, align 4
  %call6 = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 265)
  %8 = bitcast i8* %call6 to %struct.bucket_contents*
  store %struct.bucket_contents* %8, %struct.bucket_contents** %item, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %9, i32 0, i32 0
  %10 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %11 = load i32, i32* %bucket, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %10, i32 %11
  %12 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 0
  store %struct.bucket_contents* %12, %struct.bucket_contents** %next, align 4
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %15 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array7 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %15, i32 0, i32 0
  %16 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array7, align 4
  %17 = load i32, i32* %bucket, align 4
  %arrayidx8 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %16, i32 %17
  store %struct.bucket_contents* %14, %struct.bucket_contents** %arrayidx8, align 4
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 2
  store i8* null, i8** %data, align 4
  %19 = load i8*, i8** %string.addr, align 4
  %20 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %20, i32 0, i32 1
  store i8* %19, i8** %key, align 4
  %21 = load i32, i32* %hv, align 4
  %22 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %khash = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %22, i32 0, i32 3
  store i32 %21, i32* %khash, align 4
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %times_found = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 4
  store i32 0, i32* %times_found, align 4
  %24 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %24, i32 0, i32 2
  %25 = load i32, i32* %nentries, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %nentries, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then3, %cond.end
  %26 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  ret %struct.bucket_contents* %26
}

; Function Attrs: noinline nounwind
define void @hash_flush(%struct.hash_table* %table, void (i8*)* %free_data) #0 {
entry:
  %table.addr = alloca %struct.hash_table*, align 4
  %free_data.addr = alloca void (i8*)*, align 4
  %i = alloca i32, align 4
  %bucket = alloca %struct.bucket_contents*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store void (i8*)* %free_data, void (i8*)** %free_data.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  br label %return

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %4, %6
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %7, i32 0, i32 0
  %8 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %8, i32 %9
  %10 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  store %struct.bucket_contents* %10, %struct.bucket_contents** %bucket, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end7, %for.body
  %11 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  %tobool3 = icmp ne %struct.bucket_contents* %11, null
  br i1 %tobool3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  store %struct.bucket_contents* %12, %struct.bucket_contents** %item, align 4
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %bucket, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 0
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %14, %struct.bucket_contents** %bucket, align 4
  %15 = load void (i8*)*, void (i8*)** %free_data.addr, align 4
  %tobool4 = icmp ne void (i8*)* %15, null
  br i1 %tobool4, label %if.then5, label %if.else

if.then5:                                         ; preds = %while.body
  %16 = load void (i8*)*, void (i8*)** %free_data.addr, align 4
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %17, i32 0, i32 2
  %18 = load i8*, i8** %data, align 4
  call void %16(i8* %18)
  br label %if.end7

if.else:                                          ; preds = %while.body
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data6 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data6, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 306)
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then5
  %21 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %21, i32 0, i32 1
  %22 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 307)
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %24 = bitcast %struct.bucket_contents* %23 to i8*
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 308)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array8 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %25, i32 0, i32 0
  %26 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array8, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %26, i32 %27
  store %struct.bucket_contents* null, %struct.bucket_contents** %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %while.end
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %29 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries10 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %29, i32 0, i32 2
  store i32 0, i32* %nentries10, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @hash_dispose(%struct.hash_table* %table) #0 {
entry:
  %table.addr = alloca %struct.hash_table*, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %0, i32 0, i32 0
  %1 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %2 = bitcast %struct.bucket_contents** %1 to i8*
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 321)
  %3 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %4 = bitcast %struct.hash_table* %3 to i8*
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 322)
  ret void
}

; Function Attrs: noinline nounwind
define void @hash_walk(%struct.hash_table* %table, i32 (%struct.bucket_contents*)* %func) #0 {
entry:
  %table.addr = alloca %struct.hash_table*, align 4
  %func.addr = alloca i32 (%struct.bucket_contents*)*, align 4
  %i = alloca i32, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store %struct.hash_table* %table, %struct.hash_table** %table.addr, align 4
  store i32 (%struct.bucket_contents*)* %func, i32 (%struct.bucket_contents*)** %func.addr, align 4
  %0 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool = icmp ne %struct.hash_table* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false
  %2 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nentries = getelementptr inbounds %struct.hash_table, %struct.hash_table* %2, i32 0, i32 2
  %3 = load i32, i32* %nentries, align 4
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ 0, %cond.false ]
  %cmp1 = icmp eq i32 %cond, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end, %entry
  br label %for.end17

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %if.end
  %4 = load i32, i32* %i, align 4
  %5 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets = getelementptr inbounds %struct.hash_table, %struct.hash_table* %5, i32 0, i32 1
  %6 = load i32, i32* %nbuckets, align 4
  %cmp2 = icmp slt i32 %4, %6
  br i1 %cmp2, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  %7 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %tobool3 = icmp ne %struct.hash_table* %7, null
  br i1 %tobool3, label %land.lhs.true, label %cond.false7

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %9 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %nbuckets4 = getelementptr inbounds %struct.hash_table, %struct.hash_table* %9, i32 0, i32 1
  %10 = load i32, i32* %nbuckets4, align 4
  %cmp5 = icmp slt i32 %8, %10
  br i1 %cmp5, label %cond.true6, label %cond.false7

cond.true6:                                       ; preds = %land.lhs.true
  %11 = load %struct.hash_table*, %struct.hash_table** %table.addr, align 4
  %bucket_array = getelementptr inbounds %struct.hash_table, %struct.hash_table* %11, i32 0, i32 0
  %12 = load %struct.bucket_contents**, %struct.bucket_contents*** %bucket_array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.bucket_contents*, %struct.bucket_contents** %12, i32 %13
  %14 = load %struct.bucket_contents*, %struct.bucket_contents** %arrayidx, align 4
  br label %cond.end8

cond.false7:                                      ; preds = %land.lhs.true, %for.body
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false7, %cond.true6
  %cond9 = phi %struct.bucket_contents* [ %14, %cond.true6 ], [ null, %cond.false7 ]
  store %struct.bucket_contents* %cond9, %struct.bucket_contents** %item, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc, %cond.end8
  %15 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %tobool11 = icmp ne %struct.bucket_contents* %15, null
  br i1 %tobool11, label %for.body12, label %for.end

for.body12:                                       ; preds = %for.cond10
  %16 = load i32 (%struct.bucket_contents*)*, i32 (%struct.bucket_contents*)** %func.addr, align 4
  %17 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %call = call i32 %16(%struct.bucket_contents* %17)
  %cmp13 = icmp slt i32 %call, 0
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %for.body12
  br label %for.end17

if.end15:                                         ; preds = %for.body12
  br label %for.inc

for.inc:                                          ; preds = %if.end15
  %18 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %next = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %18, i32 0, i32 0
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %next, align 4
  store %struct.bucket_contents* %19, %struct.bucket_contents** %item, align 4
  br label %for.cond10

for.end:                                          ; preds = %for.cond10
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %if.then, %if.then14, %for.cond
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
