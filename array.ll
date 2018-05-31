; ModuleID = 'array.c'
source_filename = "array.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.g_list = type { %struct.g_list* }

@.str = private unnamed_addr constant [8 x i8] c"array.c\00", align 1
@lastarray = internal global %struct.array* null, align 4
@lastref = internal global %struct.array_element* null, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define %struct.array* @array_create() #0 {
entry:
  %r = alloca %struct.array*, align 4
  %head = alloca %struct.array_element*, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 96)
  %0 = bitcast i8* %call to %struct.array*
  store %struct.array* %0, %struct.array** %r, align 4
  %1 = load %struct.array*, %struct.array** %r, align 4
  %type = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 0
  store i32 0, i32* %type, align 8
  %2 = load %struct.array*, %struct.array** %r, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %2, i32 0, i32 1
  store i64 -1, i64* %max_index, align 8
  %3 = load %struct.array*, %struct.array** %r, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  store i32 0, i32* %num_elements, align 8
  %call1 = call %struct.array_element* @array_create_element(i64 -1, i8* null)
  store %struct.array_element* %call1, %struct.array_element** %head, align 4
  %4 = load %struct.array_element*, %struct.array_element** %head, align 4
  %5 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %5, i32 0, i32 2
  store %struct.array_element* %4, %struct.array_element** %next, align 4
  %6 = load %struct.array_element*, %struct.array_element** %head, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 3
  store %struct.array_element* %4, %struct.array_element** %prev, align 8
  %7 = load %struct.array_element*, %struct.array_element** %head, align 4
  %8 = load %struct.array*, %struct.array** %r, align 4
  %head2 = getelementptr inbounds %struct.array, %struct.array* %8, i32 0, i32 3
  store %struct.array_element* %7, %struct.array_element** %head2, align 4
  %9 = load %struct.array*, %struct.array** %r, align 4
  ret %struct.array* %9
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.array_element* @array_create_element(i64 %indx, i8* %value) #0 {
entry:
  %indx.addr = alloca i64, align 8
  %value.addr = alloca i8*, align 4
  %r = alloca %struct.array_element*, align 4
  store i64 %indx, i64* %indx.addr, align 8
  store i8* %value, i8** %value.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 584)
  %0 = bitcast i8* %call to %struct.array_element*
  store %struct.array_element* %0, %struct.array_element** %r, align 4
  %1 = load i64, i64* %indx.addr, align 8
  %2 = load %struct.array_element*, %struct.array_element** %r, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %2, i32 0, i32 0
  store i64 %1, i64* %ind, align 8
  %3 = load i8*, i8** %value.addr, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i8*, i8** %value.addr, align 4
  %call1 = call i32 @strlen(i8* %4)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 586)
  %5 = load i8*, i8** %value.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %5)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call3, %cond.true ], [ null, %cond.false ]
  %6 = load %struct.array_element*, %struct.array_element** %r, align 4
  %value4 = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 1
  store i8* %cond, i8** %value4, align 8
  %7 = load %struct.array_element*, %struct.array_element** %r, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 3
  store %struct.array_element* null, %struct.array_element** %prev, align 8
  %8 = load %struct.array_element*, %struct.array_element** %r, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %8, i32 0, i32 2
  store %struct.array_element* null, %struct.array_element** %next, align 4
  %9 = load %struct.array_element*, %struct.array_element** %r, align 4
  ret %struct.array_element* %9
}

; Function Attrs: noinline nounwind
define void @array_flush(%struct.array* %a) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  %r = alloca %struct.array_element*, align 4
  %r1 = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.end

if.end:                                           ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %2, i32 0, i32 2
  %3 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %3, %struct.array_element** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %if.end
  %4 = load %struct.array_element*, %struct.array_element** %r, align 4
  %5 = load %struct.array*, %struct.array** %a.addr, align 4
  %head1 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head1, align 4
  %cmp2 = icmp ne %struct.array_element* %4, %6
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.array_element*, %struct.array_element** %r, align 4
  %next3 = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 2
  %8 = load %struct.array_element*, %struct.array_element** %next3, align 4
  store %struct.array_element* %8, %struct.array_element** %r1, align 4
  %9 = load %struct.array_element*, %struct.array_element** %r, align 4
  call void @array_dispose_element(%struct.array_element* %9)
  %10 = load %struct.array_element*, %struct.array_element** %r1, align 4
  store %struct.array_element* %10, %struct.array_element** %r, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load %struct.array*, %struct.array** %a.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %11, i32 0, i32 3
  %12 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %13 = load %struct.array*, %struct.array** %a.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %13, i32 0, i32 3
  %14 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 3
  store %struct.array_element* %12, %struct.array_element** %prev, align 8
  %15 = load %struct.array*, %struct.array** %a.addr, align 4
  %head6 = getelementptr inbounds %struct.array, %struct.array* %15, i32 0, i32 3
  %16 = load %struct.array_element*, %struct.array_element** %head6, align 4
  %next7 = getelementptr inbounds %struct.array_element, %struct.array_element* %16, i32 0, i32 2
  store %struct.array_element* %12, %struct.array_element** %next7, align 4
  %17 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %17, i32 0, i32 1
  store i64 -1, i64* %max_index, align 8
  %18 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %18, i32 0, i32 2
  store i32 0, i32* %num_elements, align 8
  br label %do.body

do.body:                                          ; preds = %for.end
  %19 = load %struct.array*, %struct.array** %a.addr, align 4
  %20 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp8 = icmp eq %struct.array* %19, %20
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %do.body
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.then, %if.end10
  ret void
}

; Function Attrs: noinline nounwind
define void @array_dispose_element(%struct.array_element* %ae) #0 {
entry:
  %ae.addr = alloca %struct.array_element*, align 4
  store %struct.array_element* %ae, %struct.array_element** %ae.addr, align 4
  %0 = load %struct.array_element*, %struct.array_element** %ae.addr, align 4
  %tobool = icmp ne %struct.array_element* %0, null
  br i1 %tobool, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load %struct.array_element*, %struct.array_element** %ae.addr, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %1, i32 0, i32 1
  %2 = load i8*, i8** %value, align 8
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %do.body
  %3 = load %struct.array_element*, %struct.array_element** %ae.addr, align 4
  %value3 = getelementptr inbounds %struct.array_element, %struct.array_element* %3, i32 0, i32 1
  %4 = load i8*, i8** %value3, align 8
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 606)
  br label %if.end

if.end:                                           ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %5 = load %struct.array_element*, %struct.array_element** %ae.addr, align 4
  %6 = bitcast %struct.array_element* %5 to i8*
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 607)
  br label %if.end4

if.end4:                                          ; preds = %do.end, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @array_dispose(%struct.array* %a) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  call void @array_flush(%struct.array* %1)
  %2 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %2, i32 0, i32 3
  %3 = load %struct.array_element*, %struct.array_element** %head, align 4
  call void @array_dispose_element(%struct.array_element* %3)
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %5 = bitcast %struct.array* %4 to i8*
  call void @sh_xfree(i8* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 133)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_copy(%struct.array* %a) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %a.addr = alloca %struct.array*, align 4
  %a1 = alloca %struct.array*, align 4
  %ae = alloca %struct.array_element*, align 4
  %new = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call %struct.array* @array_create()
  store %struct.array* %call, %struct.array** %a1, align 4
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %type = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 0
  %2 = load i32, i32* %type, align 8
  %3 = load %struct.array*, %struct.array** %a1, align 4
  %type1 = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 0
  store i32 %2, i32* %type1, align 8
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 1
  %5 = load i64, i64* %max_index, align 8
  %6 = load %struct.array*, %struct.array** %a1, align 4
  %max_index2 = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 1
  store i64 %5, i64* %max_index2, align 8
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 2
  %8 = load i32, i32* %num_elements, align 8
  %9 = load %struct.array*, %struct.array** %a1, align 4
  %num_elements3 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 2
  store i32 %8, i32* %num_elements3, align 8
  %10 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 2
  %12 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %12, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %13 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %14 = load %struct.array*, %struct.array** %a.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %14, i32 0, i32 3
  %15 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %cmp5 = icmp ne %struct.array_element* %13, %15
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %16, i32 0, i32 0
  %17 = load i64, i64* %ind, align 8
  %18 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  %19 = load i8*, i8** %value, align 8
  %call6 = call %struct.array_element* @array_create_element(i64 %17, i8* %19)
  store %struct.array_element* %call6, %struct.array_element** %new, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %20 = load %struct.array_element*, %struct.array_element** %new, align 4
  %21 = load %struct.array*, %struct.array** %a1, align 4
  %head7 = getelementptr inbounds %struct.array, %struct.array* %21, i32 0, i32 3
  %22 = load %struct.array_element*, %struct.array_element** %head7, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %22, i32 0, i32 3
  %23 = load %struct.array_element*, %struct.array_element** %prev, align 8
  %next8 = getelementptr inbounds %struct.array_element, %struct.array_element* %23, i32 0, i32 2
  store %struct.array_element* %20, %struct.array_element** %next8, align 4
  %24 = load %struct.array*, %struct.array** %a1, align 4
  %head9 = getelementptr inbounds %struct.array, %struct.array* %24, i32 0, i32 3
  %25 = load %struct.array_element*, %struct.array_element** %head9, align 4
  %prev10 = getelementptr inbounds %struct.array_element, %struct.array_element* %25, i32 0, i32 3
  %26 = load %struct.array_element*, %struct.array_element** %prev10, align 8
  %27 = load %struct.array_element*, %struct.array_element** %new, align 4
  %prev11 = getelementptr inbounds %struct.array_element, %struct.array_element* %27, i32 0, i32 3
  store %struct.array_element* %26, %struct.array_element** %prev11, align 8
  %28 = load %struct.array_element*, %struct.array_element** %new, align 4
  %29 = load %struct.array*, %struct.array** %a1, align 4
  %head12 = getelementptr inbounds %struct.array, %struct.array* %29, i32 0, i32 3
  %30 = load %struct.array_element*, %struct.array_element** %head12, align 4
  %prev13 = getelementptr inbounds %struct.array_element, %struct.array_element* %30, i32 0, i32 3
  store %struct.array_element* %28, %struct.array_element** %prev13, align 8
  %31 = load %struct.array*, %struct.array** %a1, align 4
  %head14 = getelementptr inbounds %struct.array, %struct.array* %31, i32 0, i32 3
  %32 = load %struct.array_element*, %struct.array_element** %head14, align 4
  %33 = load %struct.array_element*, %struct.array_element** %new, align 4
  %next15 = getelementptr inbounds %struct.array_element, %struct.array_element* %33, i32 0, i32 2
  store %struct.array_element* %32, %struct.array_element** %next15, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %34 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next16 = getelementptr inbounds %struct.array_element, %struct.array_element* %34, i32 0, i32 2
  %35 = load %struct.array_element*, %struct.array_element** %next16, align 4
  store %struct.array_element* %35, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %36 = load %struct.array*, %struct.array** %a1, align 4
  store %struct.array* %36, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %37 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %37
}

; Function Attrs: noinline nounwind
define %struct.array* @array_slice(%struct.array* %array, %struct.array_element* %s, %struct.array_element* %e) #0 {
entry:
  %array.addr = alloca %struct.array*, align 4
  %s.addr = alloca %struct.array_element*, align 4
  %e.addr = alloca %struct.array_element*, align 4
  %a = alloca %struct.array*, align 4
  %p = alloca %struct.array_element*, align 4
  %n = alloca %struct.array_element*, align 4
  %i = alloca i32, align 4
  %mi = alloca i64, align 8
  store %struct.array* %array, %struct.array** %array.addr, align 4
  store %struct.array_element* %s, %struct.array_element** %s.addr, align 4
  store %struct.array_element* %e, %struct.array_element** %e.addr, align 4
  %call = call %struct.array* @array_create()
  store %struct.array* %call, %struct.array** %a, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %type = getelementptr inbounds %struct.array, %struct.array* %0, i32 0, i32 0
  %1 = load i32, i32* %type, align 8
  %2 = load %struct.array*, %struct.array** %a, align 4
  %type1 = getelementptr inbounds %struct.array, %struct.array* %2, i32 0, i32 0
  store i32 %1, i32* %type1, align 8
  store i64 0, i64* %mi, align 8
  %3 = load %struct.array_element*, %struct.array_element** %s.addr, align 4
  store %struct.array_element* %3, %struct.array_element** %p, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load %struct.array_element*, %struct.array_element** %p, align 4
  %5 = load %struct.array_element*, %struct.array_element** %e.addr, align 4
  %cmp = icmp ne %struct.array_element* %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.array_element*, %struct.array_element** %p, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 0
  %7 = load i64, i64* %ind, align 8
  %8 = load %struct.array_element*, %struct.array_element** %p, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %8, i32 0, i32 1
  %9 = load i8*, i8** %value, align 8
  %call2 = call %struct.array_element* @array_create_element(i64 %7, i8* %9)
  store %struct.array_element* %call2, %struct.array_element** %n, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %10 = load %struct.array_element*, %struct.array_element** %n, align 4
  %11 = load %struct.array*, %struct.array** %a, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %11, i32 0, i32 3
  %12 = load %struct.array_element*, %struct.array_element** %head, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 3
  %13 = load %struct.array_element*, %struct.array_element** %prev, align 8
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 2
  store %struct.array_element* %10, %struct.array_element** %next, align 4
  %14 = load %struct.array*, %struct.array** %a, align 4
  %head3 = getelementptr inbounds %struct.array, %struct.array* %14, i32 0, i32 3
  %15 = load %struct.array_element*, %struct.array_element** %head3, align 4
  %prev4 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 3
  %16 = load %struct.array_element*, %struct.array_element** %prev4, align 8
  %17 = load %struct.array_element*, %struct.array_element** %n, align 4
  %prev5 = getelementptr inbounds %struct.array_element, %struct.array_element* %17, i32 0, i32 3
  store %struct.array_element* %16, %struct.array_element** %prev5, align 8
  %18 = load %struct.array_element*, %struct.array_element** %n, align 4
  %19 = load %struct.array*, %struct.array** %a, align 4
  %head6 = getelementptr inbounds %struct.array, %struct.array* %19, i32 0, i32 3
  %20 = load %struct.array_element*, %struct.array_element** %head6, align 4
  %prev7 = getelementptr inbounds %struct.array_element, %struct.array_element* %20, i32 0, i32 3
  store %struct.array_element* %18, %struct.array_element** %prev7, align 8
  %21 = load %struct.array*, %struct.array** %a, align 4
  %head8 = getelementptr inbounds %struct.array, %struct.array* %21, i32 0, i32 3
  %22 = load %struct.array_element*, %struct.array_element** %head8, align 4
  %23 = load %struct.array_element*, %struct.array_element** %n, align 4
  %next9 = getelementptr inbounds %struct.array_element, %struct.array_element* %23, i32 0, i32 2
  store %struct.array_element* %22, %struct.array_element** %next9, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %24 = load %struct.array_element*, %struct.array_element** %n, align 4
  %ind10 = getelementptr inbounds %struct.array_element, %struct.array_element* %24, i32 0, i32 0
  %25 = load i64, i64* %ind10, align 8
  store i64 %25, i64* %mi, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %26 = load %struct.array_element*, %struct.array_element** %p, align 4
  %next11 = getelementptr inbounds %struct.array_element, %struct.array_element* %26, i32 0, i32 2
  %27 = load %struct.array_element*, %struct.array_element** %next11, align 4
  store %struct.array_element* %27, %struct.array_element** %p, align 4
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %29 = load i32, i32* %i, align 4
  %30 = load %struct.array*, %struct.array** %a, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %30, i32 0, i32 2
  store i32 %29, i32* %num_elements, align 8
  %31 = load i64, i64* %mi, align 8
  %32 = load %struct.array*, %struct.array** %a, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %32, i32 0, i32 1
  store i64 %31, i64* %max_index, align 8
  %33 = load %struct.array*, %struct.array** %a, align 4
  ret %struct.array* %33
}

; Function Attrs: noinline nounwind
define void @array_walk(%struct.array* %a, i32 (%struct.array_element*, i8*)* %func, i8* %udata) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  %func.addr = alloca i32 (%struct.array_element*, i8*)*, align 4
  %udata.addr = alloca i8*, align 4
  %ae = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i32 (%struct.array_element*, i8*)* %func, i32 (%struct.array_element*, i8*)** %func.addr, align 4
  store i8* %udata, i8** %udata.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 3
  %4 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %4, i32 0, i32 2
  %5 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %5, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %head2 = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 3
  %8 = load %struct.array_element*, %struct.array_element** %head2, align 4
  %cmp3 = icmp ne %struct.array_element* %6, %8
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32 (%struct.array_element*, i8*)*, i32 (%struct.array_element*, i8*)** %func.addr, align 4
  %10 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %11 = load i8*, i8** %udata.addr, align 4
  %call = call i32 %9(%struct.array_element* %10, i8* %11)
  %cmp4 = icmp slt i32 %call, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %for.body
  br label %for.end

if.end6:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end6
  %12 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next7 = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 2
  %13 = load %struct.array_element*, %struct.array_element** %next7, align 4
  store %struct.array_element* %13, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %if.then5, %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define %struct.array_element* @array_shift(%struct.array* %a, i32 %n, i32 %flags) #0 {
entry:
  %retval = alloca %struct.array_element*, align 4
  %a.addr = alloca %struct.array*, align 4
  %n.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %ae = alloca %struct.array_element*, align 4
  %ret = alloca %struct.array_element*, align 4
  %i = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp sle i32 %3, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array_element* null, %struct.array_element** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  br label %do.body

do.body:                                          ; preds = %if.end
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %5 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp4 = icmp eq %struct.array* %4, %5
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %do.body
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end6
  store i32 0, i32* %i, align 4
  %6 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 3
  %7 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 2
  %8 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %8, %struct.array_element** %ae, align 4
  store %struct.array_element* %8, %struct.array_element** %ret, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end
  %9 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %10 = load %struct.array*, %struct.array** %a.addr, align 4
  %head7 = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head7, align 4
  %cmp8 = icmp ne %struct.array_element* %9, %11
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %n.addr, align 4
  %cmp9 = icmp slt i32 %12, %13
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %14 = phi i1 [ false, %for.cond ], [ %cmp9, %land.rhs ]
  br i1 %14, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next10 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 2
  %16 = load %struct.array_element*, %struct.array_element** %next10, align 4
  store %struct.array_element* %16, %struct.array_element** %ae, align 4
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %18 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %19 = load %struct.array*, %struct.array** %a.addr, align 4
  %head11 = getelementptr inbounds %struct.array, %struct.array* %19, i32 0, i32 3
  %20 = load %struct.array_element*, %struct.array_element** %head11, align 4
  %cmp12 = icmp eq %struct.array_element* %18, %20
  br i1 %cmp12, label %if.then13, label %if.end30

if.then13:                                        ; preds = %for.end
  %21 = load i32, i32* %flags.addr, align 4
  %and = and i32 %21, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then13
  %22 = load %struct.array*, %struct.array** %a.addr, align 4
  call void @array_flush(%struct.array* %22)
  store %struct.array_element* null, %struct.array_element** %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.then13
  %23 = load %struct.array_element*, %struct.array_element** %ret, align 4
  store %struct.array_element* %23, %struct.array_element** %ae, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc21, %if.end15
  %24 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next17 = getelementptr inbounds %struct.array_element, %struct.array_element* %24, i32 0, i32 2
  %25 = load %struct.array_element*, %struct.array_element** %next17, align 4
  %26 = load %struct.array*, %struct.array** %a.addr, align 4
  %head18 = getelementptr inbounds %struct.array, %struct.array* %26, i32 0, i32 3
  %27 = load %struct.array_element*, %struct.array_element** %head18, align 4
  %cmp19 = icmp ne %struct.array_element* %25, %27
  br i1 %cmp19, label %for.body20, label %for.end23

for.body20:                                       ; preds = %for.cond16
  br label %for.inc21

for.inc21:                                        ; preds = %for.body20
  %28 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next22 = getelementptr inbounds %struct.array_element, %struct.array_element* %28, i32 0, i32 2
  %29 = load %struct.array_element*, %struct.array_element** %next22, align 4
  store %struct.array_element* %29, %struct.array_element** %ae, align 4
  br label %for.cond16

for.end23:                                        ; preds = %for.cond16
  %30 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next24 = getelementptr inbounds %struct.array_element, %struct.array_element* %30, i32 0, i32 2
  store %struct.array_element* null, %struct.array_element** %next24, align 4
  %31 = load %struct.array*, %struct.array** %a.addr, align 4
  %head25 = getelementptr inbounds %struct.array, %struct.array* %31, i32 0, i32 3
  %32 = load %struct.array_element*, %struct.array_element** %head25, align 4
  %33 = load %struct.array*, %struct.array** %a.addr, align 4
  %head26 = getelementptr inbounds %struct.array, %struct.array* %33, i32 0, i32 3
  %34 = load %struct.array_element*, %struct.array_element** %head26, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %34, i32 0, i32 3
  store %struct.array_element* %32, %struct.array_element** %prev, align 8
  %35 = load %struct.array*, %struct.array** %a.addr, align 4
  %head27 = getelementptr inbounds %struct.array, %struct.array* %35, i32 0, i32 3
  %36 = load %struct.array_element*, %struct.array_element** %head27, align 4
  %next28 = getelementptr inbounds %struct.array_element, %struct.array_element* %36, i32 0, i32 2
  store %struct.array_element* %32, %struct.array_element** %next28, align 4
  %37 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %37, i32 0, i32 1
  store i64 -1, i64* %max_index, align 8
  %38 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements29 = getelementptr inbounds %struct.array, %struct.array* %38, i32 0, i32 2
  store i32 0, i32* %num_elements29, align 8
  %39 = load %struct.array_element*, %struct.array_element** %ret, align 4
  store %struct.array_element* %39, %struct.array_element** %retval, align 4
  br label %return

if.end30:                                         ; preds = %for.end
  %40 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev31 = getelementptr inbounds %struct.array_element, %struct.array_element* %40, i32 0, i32 3
  %41 = load %struct.array_element*, %struct.array_element** %prev31, align 8
  %next32 = getelementptr inbounds %struct.array_element, %struct.array_element* %41, i32 0, i32 2
  store %struct.array_element* null, %struct.array_element** %next32, align 4
  %42 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %43 = load %struct.array*, %struct.array** %a.addr, align 4
  %head33 = getelementptr inbounds %struct.array, %struct.array* %43, i32 0, i32 3
  %44 = load %struct.array_element*, %struct.array_element** %head33, align 4
  %next34 = getelementptr inbounds %struct.array_element, %struct.array_element* %44, i32 0, i32 2
  store %struct.array_element* %42, %struct.array_element** %next34, align 4
  %45 = load %struct.array*, %struct.array** %a.addr, align 4
  %head35 = getelementptr inbounds %struct.array, %struct.array* %45, i32 0, i32 3
  %46 = load %struct.array_element*, %struct.array_element** %head35, align 4
  %47 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev36 = getelementptr inbounds %struct.array_element, %struct.array_element* %47, i32 0, i32 3
  store %struct.array_element* %46, %struct.array_element** %prev36, align 8
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc41, %if.end30
  %48 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %49 = load %struct.array*, %struct.array** %a.addr, align 4
  %head38 = getelementptr inbounds %struct.array, %struct.array* %49, i32 0, i32 3
  %50 = load %struct.array_element*, %struct.array_element** %head38, align 4
  %cmp39 = icmp ne %struct.array_element* %48, %50
  br i1 %cmp39, label %for.body40, label %for.end43

for.body40:                                       ; preds = %for.cond37
  %51 = load i32, i32* %n.addr, align 4
  %conv = sext i32 %51 to i64
  %52 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %52, i32 0, i32 0
  %53 = load i64, i64* %ind, align 8
  %sub = sub nsw i64 %53, %conv
  store i64 %sub, i64* %ind, align 8
  br label %for.inc41

for.inc41:                                        ; preds = %for.body40
  %54 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next42 = getelementptr inbounds %struct.array_element, %struct.array_element* %54, i32 0, i32 2
  %55 = load %struct.array_element*, %struct.array_element** %next42, align 4
  store %struct.array_element* %55, %struct.array_element** %ae, align 4
  br label %for.cond37

for.end43:                                        ; preds = %for.cond37
  %56 = load i32, i32* %n.addr, align 4
  %57 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements44 = getelementptr inbounds %struct.array, %struct.array* %57, i32 0, i32 2
  %58 = load i32, i32* %num_elements44, align 8
  %sub45 = sub nsw i32 %58, %56
  store i32 %sub45, i32* %num_elements44, align 8
  %59 = load %struct.array*, %struct.array** %a.addr, align 4
  %head46 = getelementptr inbounds %struct.array, %struct.array* %59, i32 0, i32 3
  %60 = load %struct.array_element*, %struct.array_element** %head46, align 4
  %prev47 = getelementptr inbounds %struct.array_element, %struct.array_element* %60, i32 0, i32 3
  %61 = load %struct.array_element*, %struct.array_element** %prev47, align 8
  %ind48 = getelementptr inbounds %struct.array_element, %struct.array_element* %61, i32 0, i32 0
  %62 = load i64, i64* %ind48, align 8
  %63 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index49 = getelementptr inbounds %struct.array, %struct.array* %63, i32 0, i32 1
  store i64 %62, i64* %max_index49, align 8
  %64 = load i32, i32* %flags.addr, align 4
  %and50 = and i32 %64, 1
  %tobool51 = icmp ne i32 %and50, 0
  br i1 %tobool51, label %if.then52, label %if.end58

if.then52:                                        ; preds = %for.end43
  %65 = load %struct.array_element*, %struct.array_element** %ret, align 4
  store %struct.array_element* %65, %struct.array_element** %ae, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.body55, %if.then52
  %66 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %tobool54 = icmp ne %struct.array_element* %66, null
  br i1 %tobool54, label %for.body55, label %for.end57

for.body55:                                       ; preds = %for.cond53
  %67 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next56 = getelementptr inbounds %struct.array_element, %struct.array_element* %67, i32 0, i32 2
  %68 = load %struct.array_element*, %struct.array_element** %next56, align 4
  store %struct.array_element* %68, %struct.array_element** %ret, align 4
  %69 = load %struct.array_element*, %struct.array_element** %ae, align 4
  call void @array_dispose_element(%struct.array_element* %69)
  %70 = load %struct.array_element*, %struct.array_element** %ret, align 4
  store %struct.array_element* %70, %struct.array_element** %ae, align 4
  br label %for.cond53

for.end57:                                        ; preds = %for.cond53
  store %struct.array_element* null, %struct.array_element** %retval, align 4
  br label %return

if.end58:                                         ; preds = %for.end43
  %71 = load %struct.array_element*, %struct.array_element** %ret, align 4
  store %struct.array_element* %71, %struct.array_element** %retval, align 4
  br label %return

return:                                           ; preds = %if.end58, %for.end57, %for.end23, %if.then14, %if.then
  %72 = load %struct.array_element*, %struct.array_element** %retval, align 4
  ret %struct.array_element* %72
}

; Function Attrs: noinline nounwind
define i32 @array_rshift(%struct.array* %a, i32 %n, i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.array*, align 4
  %n.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %ae = alloca %struct.array_element*, align 4
  %new = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %lor.lhs.false
  %3 = load i8*, i8** %s.addr, align 4
  %cmp2 = icmp eq i8* %3, null
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp sle i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  %5 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements5 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 2
  %6 = load i32, i32* %num_elements5, align 8
  store i32 %6, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 3
  %8 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %8, i32 0, i32 2
  %9 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %9, %struct.array_element** %ae, align 4
  %10 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %10, null
  br i1 %tobool, label %if.then7, label %if.end18

if.then7:                                         ; preds = %if.end6
  %11 = load i8*, i8** %s.addr, align 4
  %call = call %struct.array_element* @array_create_element(i64 0, i8* %11)
  store %struct.array_element* %call, %struct.array_element** %new, align 4
  br label %do.body

do.body:                                          ; preds = %if.then7
  %12 = load %struct.array_element*, %struct.array_element** %new, align 4
  %13 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 3
  %14 = load %struct.array_element*, %struct.array_element** %prev, align 8
  %next8 = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 2
  store %struct.array_element* %12, %struct.array_element** %next8, align 4
  %15 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev9 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 3
  %16 = load %struct.array_element*, %struct.array_element** %prev9, align 8
  %17 = load %struct.array_element*, %struct.array_element** %new, align 4
  %prev10 = getelementptr inbounds %struct.array_element, %struct.array_element* %17, i32 0, i32 3
  store %struct.array_element* %16, %struct.array_element** %prev10, align 8
  %18 = load %struct.array_element*, %struct.array_element** %new, align 4
  %19 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev11 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 3
  store %struct.array_element* %18, %struct.array_element** %prev11, align 8
  %20 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %21 = load %struct.array_element*, %struct.array_element** %new, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %21, i32 0, i32 2
  store %struct.array_element* %20, %struct.array_element** %next12, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %22 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements13 = getelementptr inbounds %struct.array, %struct.array* %22, i32 0, i32 2
  %23 = load i32, i32* %num_elements13, align 8
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %num_elements13, align 8
  %24 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements14 = getelementptr inbounds %struct.array, %struct.array* %24, i32 0, i32 2
  %25 = load i32, i32* %num_elements14, align 8
  %cmp15 = icmp eq i32 %25, 1
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %do.end
  %26 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %26, i32 0, i32 1
  store i64 0, i64* %max_index, align 8
  store i32 1, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %do.end
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end6
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end18
  %27 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %28 = load %struct.array*, %struct.array** %a.addr, align 4
  %head19 = getelementptr inbounds %struct.array, %struct.array* %28, i32 0, i32 3
  %29 = load %struct.array_element*, %struct.array_element** %head19, align 4
  %cmp20 = icmp ne %struct.array_element* %27, %29
  br i1 %cmp20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %30 = load i32, i32* %n.addr, align 4
  %conv = sext i32 %30 to i64
  %31 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %31, i32 0, i32 0
  %32 = load i64, i64* %ind, align 8
  %add = add nsw i64 %32, %conv
  store i64 %add, i64* %ind, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %33 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next21 = getelementptr inbounds %struct.array_element, %struct.array_element* %33, i32 0, i32 2
  %34 = load %struct.array_element*, %struct.array_element** %next21, align 4
  store %struct.array_element* %34, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %35 = load %struct.array*, %struct.array** %a.addr, align 4
  %head22 = getelementptr inbounds %struct.array, %struct.array* %35, i32 0, i32 3
  %36 = load %struct.array_element*, %struct.array_element** %head22, align 4
  %prev23 = getelementptr inbounds %struct.array_element, %struct.array_element* %36, i32 0, i32 3
  %37 = load %struct.array_element*, %struct.array_element** %prev23, align 8
  %ind24 = getelementptr inbounds %struct.array_element, %struct.array_element* %37, i32 0, i32 0
  %38 = load i64, i64* %ind24, align 8
  %39 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index25 = getelementptr inbounds %struct.array, %struct.array* %39, i32 0, i32 1
  store i64 %38, i64* %max_index25, align 8
  br label %do.body26

do.body26:                                        ; preds = %for.end
  %40 = load %struct.array*, %struct.array** %a.addr, align 4
  %41 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp27 = icmp eq %struct.array* %40, %41
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %do.body26
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %do.body26
  br label %do.end31

do.end31:                                         ; preds = %if.end30
  %42 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements32 = getelementptr inbounds %struct.array, %struct.array* %42, i32 0, i32 2
  %43 = load i32, i32* %num_elements32, align 8
  store i32 %43, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end31, %if.then16, %if.then4, %if.then
  %44 = load i32, i32* %retval, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind
define %struct.array_element* @array_unshift_element(%struct.array* %a) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %call = call %struct.array_element* @array_shift(%struct.array* %0, i32 1, i32 0)
  ret %struct.array_element* %call
}

; Function Attrs: noinline nounwind
define i32 @array_shift_element(%struct.array* %a, i8* %v) #0 {
entry:
  %a.addr = alloca %struct.array*, align 4
  %v.addr = alloca i8*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i8* %v, i8** %v.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %1 = load i8*, i8** %v.addr, align 4
  %call = call i32 @array_rshift(%struct.array* %0, i32 1, i8* %1)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define %struct.array* @array_quote(%struct.array* %array) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %array.addr = alloca %struct.array*, align 4
  %a = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %array, %struct.array** %array.addr, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %array.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %array.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %array.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %a, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %a, align 4
  %9 = load %struct.array*, %struct.array** %array.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  %call = call i8* @quote_string(i8* %12)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %13 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value7 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 1
  %14 = load i8*, i8** %value7, align 8
  %tobool = icmp ne i8* %14, null
  br i1 %tobool, label %if.then8, label %if.end10

if.then8:                                         ; preds = %do.body
  %15 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value9 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 1
  %16 = load i8*, i8** %value9, align 8
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 332)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %17 = load i8*, i8** %t, align 4
  %18 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value11 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  store i8* %17, i8** %value11, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %19 = load %struct.array_element*, %struct.array_element** %a, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 2
  %20 = load %struct.array_element*, %struct.array_element** %next12, align 4
  store %struct.array_element* %20, %struct.array_element** %a, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load %struct.array*, %struct.array** %array.addr, align 4
  store %struct.array* %21, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %22 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %22
}

declare i8* @quote_string(i8*) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_quote_escapes(%struct.array* %array) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %array.addr = alloca %struct.array*, align 4
  %a = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %array, %struct.array** %array.addr, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %array.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %array.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %array.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %a, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %a, align 4
  %9 = load %struct.array*, %struct.array** %array.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  %call = call i8* @quote_escapes(i8* %12)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %13 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value7 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 1
  %14 = load i8*, i8** %value7, align 8
  %tobool = icmp ne i8* %14, null
  br i1 %tobool, label %if.then8, label %if.end10

if.then8:                                         ; preds = %do.body
  %15 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value9 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 1
  %16 = load i8*, i8** %value9, align 8
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 349)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %17 = load i8*, i8** %t, align 4
  %18 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value11 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  store i8* %17, i8** %value11, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %19 = load %struct.array_element*, %struct.array_element** %a, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 2
  %20 = load %struct.array_element*, %struct.array_element** %next12, align 4
  store %struct.array_element* %20, %struct.array_element** %a, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load %struct.array*, %struct.array** %array.addr, align 4
  store %struct.array* %21, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %22 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %22
}

declare i8* @quote_escapes(i8*) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_dequote(%struct.array* %array) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %array.addr = alloca %struct.array*, align 4
  %a = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %array, %struct.array** %array.addr, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %array.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %array.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %array.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %a, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %a, align 4
  %9 = load %struct.array*, %struct.array** %array.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  %call = call i8* @dequote_string(i8* %12)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %13 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value7 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 1
  %14 = load i8*, i8** %value7, align 8
  %tobool = icmp ne i8* %14, null
  br i1 %tobool, label %if.then8, label %if.end10

if.then8:                                         ; preds = %do.body
  %15 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value9 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 1
  %16 = load i8*, i8** %value9, align 8
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 366)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %17 = load i8*, i8** %t, align 4
  %18 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value11 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  store i8* %17, i8** %value11, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %19 = load %struct.array_element*, %struct.array_element** %a, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 2
  %20 = load %struct.array_element*, %struct.array_element** %next12, align 4
  store %struct.array_element* %20, %struct.array_element** %a, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load %struct.array*, %struct.array** %array.addr, align 4
  store %struct.array* %21, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %22 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %22
}

declare i8* @dequote_string(i8*) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_dequote_escapes(%struct.array* %array) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %array.addr = alloca %struct.array*, align 4
  %a = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %array, %struct.array** %array.addr, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %array.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %array.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %array.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %a, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %a, align 4
  %9 = load %struct.array*, %struct.array** %array.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  %call = call i8* @dequote_escapes(i8* %12)
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %13 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value7 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 1
  %14 = load i8*, i8** %value7, align 8
  %tobool = icmp ne i8* %14, null
  br i1 %tobool, label %if.then8, label %if.end10

if.then8:                                         ; preds = %do.body
  %15 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value9 = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 1
  %16 = load i8*, i8** %value9, align 8
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 383)
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end10
  %17 = load i8*, i8** %t, align 4
  %18 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value11 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  store i8* %17, i8** %value11, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %19 = load %struct.array_element*, %struct.array_element** %a, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 2
  %20 = load %struct.array_element*, %struct.array_element** %next12, align 4
  store %struct.array_element* %20, %struct.array_element** %a, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %21 = load %struct.array*, %struct.array** %array.addr, align 4
  store %struct.array* %21, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %22 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %22
}

declare i8* @dequote_escapes(i8*) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_remove_quoted_nulls(%struct.array* %array) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %array.addr = alloca %struct.array*, align 4
  %a = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %array, %struct.array** %array.addr, align 4
  %0 = load %struct.array*, %struct.array** %array.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %array.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %array.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %array.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %a, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %a, align 4
  %9 = load %struct.array*, %struct.array** %array.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  %call = call i8* @remove_quoted_nulls(i8* %12)
  %13 = load %struct.array_element*, %struct.array_element** %a, align 4
  %value7 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 1
  store i8* %call, i8** %value7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load %struct.array_element*, %struct.array_element** %a, align 4
  %next8 = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 2
  %15 = load %struct.array_element*, %struct.array_element** %next8, align 4
  store %struct.array_element* %15, %struct.array_element** %a, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load %struct.array*, %struct.array** %array.addr, align 4
  store %struct.array* %16, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %17 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %17
}

declare i8* @remove_quoted_nulls(i8*) #1

; Function Attrs: noinline nounwind
define i8* @array_subrange(%struct.array* %a, i64 %start, i64 %nelem, i32 %starsub, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %start.addr = alloca i64, align 8
  %nelem.addr = alloca i64, align 8
  %starsub.addr = alloca i32, align 4
  %quoted.addr = alloca i32, align 4
  %a2 = alloca %struct.array*, align 4
  %h = alloca %struct.array_element*, align 4
  %p = alloca %struct.array_element*, align 4
  %i = alloca i64, align 8
  %ifs = alloca i8*, align 4
  %sifs = alloca i8*, align 4
  %t = alloca i8*, align 4
  %slen = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i64 %start, i64* %start.addr, align 8
  store i64 %nelem, i64* %nelem.addr, align 8
  store i32 %starsub, i32* %starsub.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %tobool = icmp ne %struct.array* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array_element* [ %2, %cond.true ], [ null, %cond.false ]
  store %struct.array_element* %cond, %struct.array_element** %p, align 4
  %3 = load %struct.array_element*, %struct.array_element** %p, align 4
  %cmp = icmp eq %struct.array_element* %3, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 2
  %5 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %5, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %6 = load i64, i64* %start.addr, align 8
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 1
  %8 = load i64, i64* %max_index, align 8
  %cmp3 = icmp sgt i64 %6, %8
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %cond.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %9 = load %struct.array_element*, %struct.array_element** %p, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %9, i32 0, i32 2
  %10 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %10, %struct.array_element** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %11 = load %struct.array_element*, %struct.array_element** %p, align 4
  %12 = load %struct.array*, %struct.array** %a.addr, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %12, i32 0, i32 3
  %13 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %cmp5 = icmp ne %struct.array_element* %11, %13
  br i1 %cmp5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %14 = load i64, i64* %start.addr, align 8
  %15 = load %struct.array_element*, %struct.array_element** %p, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %15, i32 0, i32 0
  %16 = load i64, i64* %ind, align 8
  %cmp6 = icmp sgt i64 %14, %16
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %17 = phi i1 [ false, %for.cond ], [ %cmp6, %land.rhs ]
  br i1 %17, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load %struct.array_element*, %struct.array_element** %p, align 4
  %next7 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 2
  %19 = load %struct.array_element*, %struct.array_element** %next7, align 4
  store %struct.array_element* %19, %struct.array_element** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %20 = load %struct.array_element*, %struct.array_element** %p, align 4
  %21 = load %struct.array*, %struct.array** %a.addr, align 4
  %head8 = getelementptr inbounds %struct.array, %struct.array* %21, i32 0, i32 3
  %22 = load %struct.array_element*, %struct.array_element** %head8, align 4
  %cmp9 = icmp eq %struct.array_element* %20, %22
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end11:                                         ; preds = %for.end
  store i64 0, i64* %i, align 8
  %23 = load %struct.array_element*, %struct.array_element** %p, align 4
  store %struct.array_element* %23, %struct.array_element** %h, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc19, %if.end11
  %24 = load %struct.array_element*, %struct.array_element** %p, align 4
  %25 = load %struct.array*, %struct.array** %a.addr, align 4
  %head13 = getelementptr inbounds %struct.array, %struct.array* %25, i32 0, i32 3
  %26 = load %struct.array_element*, %struct.array_element** %head13, align 4
  %cmp14 = icmp ne %struct.array_element* %24, %26
  br i1 %cmp14, label %land.rhs15, label %land.end17

land.rhs15:                                       ; preds = %for.cond12
  %27 = load i64, i64* %i, align 8
  %28 = load i64, i64* %nelem.addr, align 8
  %cmp16 = icmp slt i64 %27, %28
  br label %land.end17

land.end17:                                       ; preds = %land.rhs15, %for.cond12
  %29 = phi i1 [ false, %for.cond12 ], [ %cmp16, %land.rhs15 ]
  br i1 %29, label %for.body18, label %for.end21

for.body18:                                       ; preds = %land.end17
  br label %for.inc19

for.inc19:                                        ; preds = %for.body18
  %30 = load i64, i64* %i, align 8
  %inc = add nsw i64 %30, 1
  store i64 %inc, i64* %i, align 8
  %31 = load %struct.array_element*, %struct.array_element** %p, align 4
  %next20 = getelementptr inbounds %struct.array_element, %struct.array_element* %31, i32 0, i32 2
  %32 = load %struct.array_element*, %struct.array_element** %next20, align 4
  store %struct.array_element* %32, %struct.array_element** %p, align 4
  br label %for.cond12

for.end21:                                        ; preds = %land.end17
  %33 = load %struct.array*, %struct.array** %a.addr, align 4
  %34 = load %struct.array_element*, %struct.array_element** %h, align 4
  %35 = load %struct.array_element*, %struct.array_element** %p, align 4
  %call = call %struct.array* @array_slice(%struct.array* %33, %struct.array_element* %34, %struct.array_element* %35)
  store %struct.array* %call, %struct.array** %a2, align 4
  %36 = load i32, i32* %quoted.addr, align 4
  %and = and i32 %36, 3
  %tobool22 = icmp ne i32 %and, 0
  br i1 %tobool22, label %if.then23, label %if.else

if.then23:                                        ; preds = %for.end21
  %37 = load %struct.array*, %struct.array** %a2, align 4
  %call24 = call %struct.array* @array_quote(%struct.array* %37)
  br label %if.end26

if.else:                                          ; preds = %for.end21
  %38 = load %struct.array*, %struct.array** %a2, align 4
  %call25 = call %struct.array* @array_quote_escapes(%struct.array* %38)
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  %39 = load i32, i32* %starsub.addr, align 4
  %tobool27 = icmp ne i32 %39, 0
  br i1 %tobool27, label %land.lhs.true, label %if.else34

land.lhs.true:                                    ; preds = %if.end26
  %40 = load i32, i32* %quoted.addr, align 4
  %and28 = and i32 %40, 3
  %tobool29 = icmp ne i32 %and28, 0
  br i1 %tobool29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %land.lhs.true
  %41 = load %struct.array*, %struct.array** %a2, align 4
  %call31 = call %struct.array* @array_remove_quoted_nulls(%struct.array* %41)
  %call32 = call i8* @ifs_firstchar(i32* null)
  store i8* %call32, i8** %sifs, align 4
  %42 = load %struct.array*, %struct.array** %a2, align 4
  %43 = load i8*, i8** %sifs, align 4
  %call33 = call i8* @array_to_string(%struct.array* %42, i8* %43, i32 0)
  store i8* %call33, i8** %t, align 4
  %44 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 453)
  br label %if.end56

if.else34:                                        ; preds = %land.lhs.true, %if.end26
  %45 = load i32, i32* %quoted.addr, align 4
  %and35 = and i32 %45, 3
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %if.then37, label %if.else53

if.then37:                                        ; preds = %if.else34
  %call38 = call i8* @ifs_firstchar(i32* %slen)
  store i8* %call38, i8** %sifs, align 4
  %call39 = call i8* @getifs()
  store i8* %call39, i8** %ifs, align 4
  %46 = load i8*, i8** %ifs, align 4
  %cmp40 = icmp eq i8* %46, null
  br i1 %cmp40, label %if.then44, label %lor.lhs.false41

lor.lhs.false41:                                  ; preds = %if.then37
  %47 = load i8*, i8** %ifs, align 4
  %48 = load i8, i8* %47, align 1
  %conv = sext i8 %48 to i32
  %cmp42 = icmp eq i32 %conv, 0
  br i1 %cmp42, label %if.then44, label %if.end51

if.then44:                                        ; preds = %lor.lhs.false41, %if.then37
  %49 = load i32, i32* %slen, align 4
  %cmp45 = icmp slt i32 %49, 2
  br i1 %cmp45, label %if.then47, label %if.end49

if.then47:                                        ; preds = %if.then44
  %50 = load i8*, i8** %sifs, align 4
  %call48 = call i8* @sh_xrealloc(i8* %50, i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 460)
  store i8* %call48, i8** %sifs, align 4
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %if.then44
  %51 = load i8*, i8** %sifs, align 4
  %arrayidx = getelementptr inbounds i8, i8* %51, i32 0
  store i8 32, i8* %arrayidx, align 1
  %52 = load i8*, i8** %sifs, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %52, i32 1
  store i8 0, i8* %arrayidx50, align 1
  br label %if.end51

if.end51:                                         ; preds = %if.end49, %lor.lhs.false41
  %53 = load %struct.array*, %struct.array** %a2, align 4
  %54 = load i8*, i8** %sifs, align 4
  %call52 = call i8* @array_to_string(%struct.array* %53, i8* %54, i32 0)
  store i8* %call52, i8** %t, align 4
  %55 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 465)
  br label %if.end55

if.else53:                                        ; preds = %if.else34
  %56 = load %struct.array*, %struct.array** %a2, align 4
  %call54 = call i8* @array_to_string(%struct.array* %56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 0)
  store i8* %call54, i8** %t, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.else53, %if.end51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.then30
  %57 = load %struct.array*, %struct.array** %a2, align 4
  call void @array_dispose(%struct.array* %57)
  %58 = load i8*, i8** %t, align 4
  store i8* %58, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end56, %if.then10, %if.then
  %59 = load i8*, i8** %retval, align 4
  ret i8* %59
}

declare i8* @ifs_firstchar(i32*) #1

; Function Attrs: noinline nounwind
define i8* @array_to_string(%struct.array* %a, i8* %sep, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %sep.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i8* %sep, i8** %sep.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %call = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 919)
  %call3 = call i8* @strcpy(i8* %call, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call3, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 3
  %4 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %4, i32 0, i32 2
  %5 = load %struct.array_element*, %struct.array_element** %next, align 4
  %6 = load %struct.array*, %struct.array** %a.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 3
  %7 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %8 = load i8*, i8** %sep.addr, align 4
  %9 = load i32, i32* %quoted.addr, align 4
  %call6 = call i8* @array_to_string_internal(%struct.array_element* %5, %struct.array_element* %7, i8* %8, i32 %9)
  store i8* %call6, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then2, %if.then
  %10 = load i8*, i8** %retval, align 4
  ret i8* %10
}

declare i8* @getifs() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @array_patsub(%struct.array* %a, i8* %pat, i8* %rep, i32 %mflags) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %pat.addr = alloca i8*, align 4
  %rep.addr = alloca i8*, align 4
  %mflags.addr = alloca i32, align 4
  %a2 = alloca %struct.array*, align 4
  %e = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  %sifs = alloca i8*, align 4
  %ifs = alloca i8*, align 4
  %slen = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %rep, i8** %rep.addr, align 4
  store i32 %mflags, i32* %mflags.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %a.addr, align 4
  %call = call %struct.array* @array_copy(%struct.array* %5)
  store %struct.array* %call, %struct.array** %a2, align 4
  %6 = load %struct.array*, %struct.array** %a2, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 3
  %7 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 2
  %8 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %8, %struct.array_element** %e, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load %struct.array_element*, %struct.array_element** %e, align 4
  %10 = load %struct.array*, %struct.array** %a2, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %9, %11
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 8
  %14 = load i8*, i8** %pat.addr, align 4
  %15 = load i8*, i8** %rep.addr, align 4
  %16 = load i32, i32* %mflags.addr, align 4
  %call7 = call i8* @pat_subst(i8* %13, i8* %14, i8* %15, i32 %16)
  store i8* %call7, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %17 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value8 = getelementptr inbounds %struct.array_element, %struct.array_element* %17, i32 0, i32 1
  %18 = load i8*, i8** %value8, align 8
  %tobool = icmp ne i8* %18, null
  br i1 %tobool, label %if.then9, label %if.end11

if.then9:                                         ; preds = %do.body
  %19 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value10 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 1
  %20 = load i8*, i8** %value10, align 8
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 490)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end11
  %21 = load i8*, i8** %t, align 4
  %22 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value12 = getelementptr inbounds %struct.array_element, %struct.array_element* %22, i32 0, i32 1
  store i8* %21, i8** %value12, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %23 = load %struct.array_element*, %struct.array_element** %e, align 4
  %next13 = getelementptr inbounds %struct.array_element, %struct.array_element* %23, i32 0, i32 2
  %24 = load %struct.array_element*, %struct.array_element** %next13, align 4
  store %struct.array_element* %24, %struct.array_element** %e, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %25 = load i32, i32* %mflags.addr, align 4
  %and = and i32 %25, 32
  %tobool14 = icmp ne i32 %and, 0
  br i1 %tobool14, label %if.then15, label %if.else

if.then15:                                        ; preds = %for.end
  %26 = load %struct.array*, %struct.array** %a2, align 4
  %call16 = call %struct.array* @array_quote(%struct.array* %26)
  br label %if.end18

if.else:                                          ; preds = %for.end
  %27 = load %struct.array*, %struct.array** %a2, align 4
  %call17 = call %struct.array* @array_quote_escapes(%struct.array* %27)
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then15
  %28 = load i32, i32* %mflags.addr, align 4
  %and19 = and i32 %28, 128
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.else25

if.then21:                                        ; preds = %if.end18
  %29 = load %struct.array*, %struct.array** %a2, align 4
  %call22 = call %struct.array* @array_remove_quoted_nulls(%struct.array* %29)
  %call23 = call i8* @ifs_firstchar(i32* null)
  store i8* %call23, i8** %sifs, align 4
  %30 = load %struct.array*, %struct.array** %a2, align 4
  %31 = load i8*, i8** %sifs, align 4
  %call24 = call i8* @array_to_string(%struct.array* %30, i8* %31, i32 0)
  store i8* %call24, i8** %t, align 4
  %32 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 503)
  br label %if.end47

if.else25:                                        ; preds = %if.end18
  %33 = load i32, i32* %mflags.addr, align 4
  %and26 = and i32 %33, 32
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.else44

if.then28:                                        ; preds = %if.else25
  %call29 = call i8* @ifs_firstchar(i32* %slen)
  store i8* %call29, i8** %sifs, align 4
  %call30 = call i8* @getifs()
  store i8* %call30, i8** %ifs, align 4
  %34 = load i8*, i8** %ifs, align 4
  %cmp31 = icmp eq i8* %34, null
  br i1 %cmp31, label %if.then35, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.then28
  %35 = load i8*, i8** %ifs, align 4
  %36 = load i8, i8* %35, align 1
  %conv = sext i8 %36 to i32
  %cmp33 = icmp eq i32 %conv, 0
  br i1 %cmp33, label %if.then35, label %if.end42

if.then35:                                        ; preds = %lor.lhs.false32, %if.then28
  %37 = load i32, i32* %slen, align 4
  %cmp36 = icmp slt i32 %37, 2
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then35
  %38 = load i8*, i8** %sifs, align 4
  %call39 = call i8* @sh_xrealloc(i8* %38, i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 510)
  store i8* %call39, i8** %sifs, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.then35
  %39 = load i8*, i8** %sifs, align 4
  %arrayidx = getelementptr inbounds i8, i8* %39, i32 0
  store i8 32, i8* %arrayidx, align 1
  %40 = load i8*, i8** %sifs, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8 0, i8* %arrayidx41, align 1
  br label %if.end42

if.end42:                                         ; preds = %if.end40, %lor.lhs.false32
  %41 = load %struct.array*, %struct.array** %a2, align 4
  %42 = load i8*, i8** %sifs, align 4
  %call43 = call i8* @array_to_string(%struct.array* %41, i8* %42, i32 0)
  store i8* %call43, i8** %t, align 4
  %43 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 515)
  br label %if.end46

if.else44:                                        ; preds = %if.else25
  %44 = load %struct.array*, %struct.array** %a2, align 4
  %call45 = call i8* @array_to_string(%struct.array* %44, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 0)
  store i8* %call45, i8** %t, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else44, %if.end42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then21
  %45 = load %struct.array*, %struct.array** %a2, align 4
  call void @array_dispose(%struct.array* %45)
  %46 = load i8*, i8** %t, align 4
  store i8* %46, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end47, %if.then
  %47 = load i8*, i8** %retval, align 4
  ret i8* %47
}

declare i8* @pat_subst(i8*, i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @array_modcase(%struct.array* %a, i8* %pat, i32 %modop, i32 %mflags) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %pat.addr = alloca i8*, align 4
  %modop.addr = alloca i32, align 4
  %mflags.addr = alloca i32, align 4
  %a2 = alloca %struct.array*, align 4
  %e = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  %sifs = alloca i8*, align 4
  %ifs = alloca i8*, align 4
  %slen = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %modop, i32* %modop.addr, align 4
  store i32 %mflags, i32* %mflags.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 3
  %2 = load %struct.array_element*, %struct.array_element** %head, align 4
  %cmp1 = icmp eq %struct.array_element* %2, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements, align 8
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %5 = load %struct.array*, %struct.array** %a.addr, align 4
  %call = call %struct.array* @array_copy(%struct.array* %5)
  store %struct.array* %call, %struct.array** %a2, align 4
  %6 = load %struct.array*, %struct.array** %a2, align 4
  %head4 = getelementptr inbounds %struct.array, %struct.array* %6, i32 0, i32 3
  %7 = load %struct.array_element*, %struct.array_element** %head4, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 2
  %8 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %8, %struct.array_element** %e, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load %struct.array_element*, %struct.array_element** %e, align 4
  %10 = load %struct.array*, %struct.array** %a2, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %9, %11
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 8
  %14 = load i8*, i8** %pat.addr, align 4
  %15 = load i32, i32* %modop.addr, align 4
  %call7 = call i8* @sh_modcase(i8* %13, i8* %14, i32 %15)
  store i8* %call7, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %16 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value8 = getelementptr inbounds %struct.array_element, %struct.array_element* %16, i32 0, i32 1
  %17 = load i8*, i8** %value8, align 8
  %tobool = icmp ne i8* %17, null
  br i1 %tobool, label %if.then9, label %if.end11

if.then9:                                         ; preds = %do.body
  %18 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value10 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  %19 = load i8*, i8** %value10, align 8
  call void @sh_xfree(i8* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 541)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end11
  %20 = load i8*, i8** %t, align 4
  %21 = load %struct.array_element*, %struct.array_element** %e, align 4
  %value12 = getelementptr inbounds %struct.array_element, %struct.array_element* %21, i32 0, i32 1
  store i8* %20, i8** %value12, align 8
  br label %for.inc

for.inc:                                          ; preds = %do.end
  %22 = load %struct.array_element*, %struct.array_element** %e, align 4
  %next13 = getelementptr inbounds %struct.array_element, %struct.array_element* %22, i32 0, i32 2
  %23 = load %struct.array_element*, %struct.array_element** %next13, align 4
  store %struct.array_element* %23, %struct.array_element** %e, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %24 = load i32, i32* %mflags.addr, align 4
  %and = and i32 %24, 32
  %tobool14 = icmp ne i32 %and, 0
  br i1 %tobool14, label %if.then15, label %if.else

if.then15:                                        ; preds = %for.end
  %25 = load %struct.array*, %struct.array** %a2, align 4
  %call16 = call %struct.array* @array_quote(%struct.array* %25)
  br label %if.end18

if.else:                                          ; preds = %for.end
  %26 = load %struct.array*, %struct.array** %a2, align 4
  %call17 = call %struct.array* @array_quote_escapes(%struct.array* %26)
  br label %if.end18

if.end18:                                         ; preds = %if.else, %if.then15
  %27 = load i32, i32* %mflags.addr, align 4
  %and19 = and i32 %27, 128
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.else25

if.then21:                                        ; preds = %if.end18
  %28 = load %struct.array*, %struct.array** %a2, align 4
  %call22 = call %struct.array* @array_remove_quoted_nulls(%struct.array* %28)
  %call23 = call i8* @ifs_firstchar(i32* null)
  store i8* %call23, i8** %sifs, align 4
  %29 = load %struct.array*, %struct.array** %a2, align 4
  %30 = load i8*, i8** %sifs, align 4
  %call24 = call i8* @array_to_string(%struct.array* %29, i8* %30, i32 0)
  store i8* %call24, i8** %t, align 4
  %31 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 554)
  br label %if.end47

if.else25:                                        ; preds = %if.end18
  %32 = load i32, i32* %mflags.addr, align 4
  %and26 = and i32 %32, 32
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then28, label %if.else44

if.then28:                                        ; preds = %if.else25
  %call29 = call i8* @ifs_firstchar(i32* %slen)
  store i8* %call29, i8** %sifs, align 4
  %call30 = call i8* @getifs()
  store i8* %call30, i8** %ifs, align 4
  %33 = load i8*, i8** %ifs, align 4
  %cmp31 = icmp eq i8* %33, null
  br i1 %cmp31, label %if.then35, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %if.then28
  %34 = load i8*, i8** %ifs, align 4
  %35 = load i8, i8* %34, align 1
  %conv = sext i8 %35 to i32
  %cmp33 = icmp eq i32 %conv, 0
  br i1 %cmp33, label %if.then35, label %if.end42

if.then35:                                        ; preds = %lor.lhs.false32, %if.then28
  %36 = load i32, i32* %slen, align 4
  %cmp36 = icmp slt i32 %36, 2
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %if.then35
  %37 = load i8*, i8** %sifs, align 4
  %call39 = call i8* @sh_xrealloc(i8* %37, i32 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 561)
  store i8* %call39, i8** %sifs, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %if.then35
  %38 = load i8*, i8** %sifs, align 4
  %arrayidx = getelementptr inbounds i8, i8* %38, i32 0
  store i8 32, i8* %arrayidx, align 1
  %39 = load i8*, i8** %sifs, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %39, i32 1
  store i8 0, i8* %arrayidx41, align 1
  br label %if.end42

if.end42:                                         ; preds = %if.end40, %lor.lhs.false32
  %40 = load %struct.array*, %struct.array** %a2, align 4
  %41 = load i8*, i8** %sifs, align 4
  %call43 = call i8* @array_to_string(%struct.array* %40, i8* %41, i32 0)
  store i8* %call43, i8** %t, align 4
  %42 = load i8*, i8** %sifs, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 566)
  br label %if.end46

if.else44:                                        ; preds = %if.else25
  %43 = load %struct.array*, %struct.array** %a2, align 4
  %call45 = call i8* @array_to_string(%struct.array* %43, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 0)
  store i8* %call45, i8** %t, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else44, %if.end42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then21
  %44 = load %struct.array*, %struct.array** %a2, align 4
  call void @array_dispose(%struct.array* %44)
  %45 = load i8*, i8** %t, align 4
  store i8* %45, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end47, %if.then
  %46 = load i8*, i8** %retval, align 4
  ret i8* %46
}

declare i8* @sh_modcase(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i32 @array_insert(%struct.array* %a, i64 %i, i8* %v) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca %struct.array*, align 4
  %i.addr = alloca i64, align 8
  %v.addr = alloca i8*, align 4
  %new = alloca %struct.array_element*, align 4
  %ae = alloca %struct.array_element*, align 4
  %start = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i64 %i, i64* %i.addr, align 8
  store i8* %v, i8** %v.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i64, i64* %i.addr, align 8
  %2 = load i8*, i8** %v.addr, align 4
  %call = call %struct.array_element* @array_create_element(i64 %1, i8* %2)
  store %struct.array_element* %call, %struct.array_element** %new, align 4
  %3 = load i64, i64* %i.addr, align 8
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 1
  %5 = load i64, i64* %max_index, align 8
  %cmp1 = icmp sgt i64 %3, %5
  br i1 %cmp1, label %if.then2, label %if.end13

if.then2:                                         ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.then2
  %6 = load %struct.array_element*, %struct.array_element** %new, align 4
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 3
  %8 = load %struct.array_element*, %struct.array_element** %head, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %8, i32 0, i32 3
  %9 = load %struct.array_element*, %struct.array_element** %prev, align 8
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %9, i32 0, i32 2
  store %struct.array_element* %6, %struct.array_element** %next, align 4
  %10 = load %struct.array*, %struct.array** %a.addr, align 4
  %head3 = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head3, align 4
  %prev4 = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 3
  %12 = load %struct.array_element*, %struct.array_element** %prev4, align 8
  %13 = load %struct.array_element*, %struct.array_element** %new, align 4
  %prev5 = getelementptr inbounds %struct.array_element, %struct.array_element* %13, i32 0, i32 3
  store %struct.array_element* %12, %struct.array_element** %prev5, align 8
  %14 = load %struct.array_element*, %struct.array_element** %new, align 4
  %15 = load %struct.array*, %struct.array** %a.addr, align 4
  %head6 = getelementptr inbounds %struct.array, %struct.array* %15, i32 0, i32 3
  %16 = load %struct.array_element*, %struct.array_element** %head6, align 4
  %prev7 = getelementptr inbounds %struct.array_element, %struct.array_element* %16, i32 0, i32 3
  store %struct.array_element* %14, %struct.array_element** %prev7, align 8
  %17 = load %struct.array*, %struct.array** %a.addr, align 4
  %head8 = getelementptr inbounds %struct.array, %struct.array* %17, i32 0, i32 3
  %18 = load %struct.array_element*, %struct.array_element** %head8, align 4
  %19 = load %struct.array_element*, %struct.array_element** %new, align 4
  %next9 = getelementptr inbounds %struct.array_element, %struct.array_element* %19, i32 0, i32 2
  store %struct.array_element* %18, %struct.array_element** %next9, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %20 = load i64, i64* %i.addr, align 8
  %21 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index10 = getelementptr inbounds %struct.array, %struct.array* %21, i32 0, i32 1
  store i64 %20, i64* %max_index10, align 8
  %22 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %22, i32 0, i32 2
  %23 = load i32, i32* %num_elements, align 8
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %num_elements, align 8
  br label %do.body11

do.body11:                                        ; preds = %do.end
  %24 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %24, %struct.array** @lastarray, align 4
  %25 = load %struct.array_element*, %struct.array_element** %new, align 4
  store %struct.array_element* %25, %struct.array_element** @lastref, align 4
  br label %do.end12

do.end12:                                         ; preds = %do.body11
  store i32 0, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.end
  %26 = load %struct.array*, %struct.array** @lastarray, align 4
  %tobool = icmp ne %struct.array* %26, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end13
  %27 = load %struct.array*, %struct.array** %a.addr, align 4
  %28 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp14 = icmp eq %struct.array* %27, %28
  br i1 %cmp14, label %land.lhs.true15, label %cond.false

land.lhs.true15:                                  ; preds = %land.lhs.true
  %29 = load i64, i64* %i.addr, align 8
  %30 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %30, i32 0, i32 0
  %31 = load i64, i64* %ind, align 8
  %cmp16 = icmp sge i64 %29, %31
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true15
  %32 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true15, %land.lhs.true, %if.end13
  %33 = load %struct.array*, %struct.array** %a.addr, align 4
  %head17 = getelementptr inbounds %struct.array, %struct.array* %33, i32 0, i32 3
  %34 = load %struct.array_element*, %struct.array_element** %head17, align 4
  %next18 = getelementptr inbounds %struct.array_element, %struct.array_element* %34, i32 0, i32 2
  %35 = load %struct.array_element*, %struct.array_element** %next18, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array_element* [ %32, %cond.true ], [ %35, %cond.false ]
  store %struct.array_element* %cond, %struct.array_element** %start, align 4
  %36 = load %struct.array_element*, %struct.array_element** %start, align 4
  store %struct.array_element* %36, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %37 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %38 = load %struct.array*, %struct.array** %a.addr, align 4
  %head19 = getelementptr inbounds %struct.array, %struct.array* %38, i32 0, i32 3
  %39 = load %struct.array_element*, %struct.array_element** %head19, align 4
  %cmp20 = icmp ne %struct.array_element* %37, %39
  br i1 %cmp20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %40 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind21 = getelementptr inbounds %struct.array_element, %struct.array_element* %40, i32 0, i32 0
  %41 = load i64, i64* %ind21, align 8
  %42 = load i64, i64* %i.addr, align 8
  %cmp22 = icmp eq i64 %41, %42
  br i1 %cmp22, label %if.then23, label %if.else

if.then23:                                        ; preds = %for.body
  %43 = load %struct.array_element*, %struct.array_element** %new, align 4
  call void @array_dispose_element(%struct.array_element* %43)
  %44 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %44, i32 0, i32 1
  %45 = load i8*, i8** %value, align 8
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 653)
  %46 = load i8*, i8** %v.addr, align 4
  %tobool24 = icmp ne i8* %46, null
  br i1 %tobool24, label %cond.true25, label %cond.false29

cond.true25:                                      ; preds = %if.then23
  %47 = load i8*, i8** %v.addr, align 4
  %call26 = call i32 @strlen(i8* %47)
  %add = add i32 1, %call26
  %call27 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 654)
  %48 = load i8*, i8** %v.addr, align 4
  %call28 = call i8* @strcpy(i8* %call27, i8* %48)
  br label %cond.end30

cond.false29:                                     ; preds = %if.then23
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false29, %cond.true25
  %cond31 = phi i8* [ %call28, %cond.true25 ], [ null, %cond.false29 ]
  %49 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value32 = getelementptr inbounds %struct.array_element, %struct.array_element* %49, i32 0, i32 1
  store i8* %cond31, i8** %value32, align 8
  br label %do.body33

do.body33:                                        ; preds = %cond.end30
  %50 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %50, %struct.array** @lastarray, align 4
  %51 = load %struct.array_element*, %struct.array_element** %ae, align 4
  store %struct.array_element* %51, %struct.array_element** @lastref, align 4
  br label %do.end34

do.end34:                                         ; preds = %do.body33
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %for.body
  %52 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind35 = getelementptr inbounds %struct.array_element, %struct.array_element* %52, i32 0, i32 0
  %53 = load i64, i64* %ind35, align 8
  %54 = load i64, i64* %i.addr, align 8
  %cmp36 = icmp sgt i64 %53, %54
  br i1 %cmp36, label %if.then37, label %if.end50

if.then37:                                        ; preds = %if.else
  br label %do.body38

do.body38:                                        ; preds = %if.then37
  %55 = load %struct.array_element*, %struct.array_element** %new, align 4
  %56 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev39 = getelementptr inbounds %struct.array_element, %struct.array_element* %56, i32 0, i32 3
  %57 = load %struct.array_element*, %struct.array_element** %prev39, align 8
  %next40 = getelementptr inbounds %struct.array_element, %struct.array_element* %57, i32 0, i32 2
  store %struct.array_element* %55, %struct.array_element** %next40, align 4
  %58 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev41 = getelementptr inbounds %struct.array_element, %struct.array_element* %58, i32 0, i32 3
  %59 = load %struct.array_element*, %struct.array_element** %prev41, align 8
  %60 = load %struct.array_element*, %struct.array_element** %new, align 4
  %prev42 = getelementptr inbounds %struct.array_element, %struct.array_element* %60, i32 0, i32 3
  store %struct.array_element* %59, %struct.array_element** %prev42, align 8
  %61 = load %struct.array_element*, %struct.array_element** %new, align 4
  %62 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev43 = getelementptr inbounds %struct.array_element, %struct.array_element* %62, i32 0, i32 3
  store %struct.array_element* %61, %struct.array_element** %prev43, align 8
  %63 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %64 = load %struct.array_element*, %struct.array_element** %new, align 4
  %next44 = getelementptr inbounds %struct.array_element, %struct.array_element* %64, i32 0, i32 2
  store %struct.array_element* %63, %struct.array_element** %next44, align 4
  br label %do.end45

do.end45:                                         ; preds = %do.body38
  %65 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements46 = getelementptr inbounds %struct.array, %struct.array* %65, i32 0, i32 2
  %66 = load i32, i32* %num_elements46, align 8
  %inc47 = add nsw i32 %66, 1
  store i32 %inc47, i32* %num_elements46, align 8
  br label %do.body48

do.body48:                                        ; preds = %do.end45
  %67 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %67, %struct.array** @lastarray, align 4
  %68 = load %struct.array_element*, %struct.array_element** %new, align 4
  store %struct.array_element* %68, %struct.array_element** @lastref, align 4
  br label %do.end49

do.end49:                                         ; preds = %do.body48
  store i32 0, i32* %retval, align 4
  br label %return

if.end50:                                         ; preds = %if.else
  br label %if.end51

if.end51:                                         ; preds = %if.end50
  br label %for.inc

for.inc:                                          ; preds = %if.end51
  %69 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next52 = getelementptr inbounds %struct.array_element, %struct.array_element* %69, i32 0, i32 2
  %70 = load %struct.array_element*, %struct.array_element** %next52, align 4
  store %struct.array_element* %70, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %71 = load %struct.array_element*, %struct.array_element** %new, align 4
  call void @array_dispose_element(%struct.array_element* %71)
  br label %do.body53

do.body53:                                        ; preds = %for.end
  %72 = load %struct.array*, %struct.array** %a.addr, align 4
  %73 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp54 = icmp eq %struct.array* %72, %73
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %do.body53
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %do.body53
  br label %do.end57

do.end57:                                         ; preds = %if.end56
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end57, %do.end49, %do.end34, %do.end12, %if.then
  %74 = load i32, i32* %retval, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind
define %struct.array_element* @array_remove(%struct.array* %a, i64 %i) #0 {
entry:
  %retval = alloca %struct.array_element*, align 4
  %a.addr = alloca %struct.array*, align 4
  %i.addr = alloca i64, align 8
  %ae = alloca %struct.array_element*, align 4
  %start = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i64 %i, i64* %i.addr, align 8
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.array_element* null, %struct.array_element** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** @lastarray, align 4
  %tobool = icmp ne %struct.array* %3, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %5 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp2 = icmp eq %struct.array* %4, %5
  br i1 %cmp2, label %land.lhs.true3, label %cond.false

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load i64, i64* %i.addr, align 8
  %7 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 0
  %8 = load i64, i64* %ind, align 8
  %cmp4 = icmp sge i64 %6, %8
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true3
  %9 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true3, %land.lhs.true, %if.end
  %10 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %10, i32 0, i32 3
  %11 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 2
  %12 = load %struct.array_element*, %struct.array_element** %next, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array_element* [ %9, %cond.true ], [ %12, %cond.false ]
  store %struct.array_element* %cond, %struct.array_element** %start, align 4
  %13 = load %struct.array_element*, %struct.array_element** %start, align 4
  store %struct.array_element* %13, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %14 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %15 = load %struct.array*, %struct.array** %a.addr, align 4
  %head5 = getelementptr inbounds %struct.array, %struct.array* %15, i32 0, i32 3
  %16 = load %struct.array_element*, %struct.array_element** %head5, align 4
  %cmp6 = icmp ne %struct.array_element* %14, %16
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %17 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind7 = getelementptr inbounds %struct.array_element, %struct.array_element* %17, i32 0, i32 0
  %18 = load i64, i64* %ind7, align 8
  %19 = load i64, i64* %i.addr, align 8
  %cmp8 = icmp eq i64 %18, %19
  br i1 %cmp8, label %if.then9, label %if.end42

if.then9:                                         ; preds = %for.body
  %20 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev = getelementptr inbounds %struct.array_element, %struct.array_element* %20, i32 0, i32 3
  %21 = load %struct.array_element*, %struct.array_element** %prev, align 8
  %22 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next10 = getelementptr inbounds %struct.array_element, %struct.array_element* %22, i32 0, i32 2
  %23 = load %struct.array_element*, %struct.array_element** %next10, align 4
  %prev11 = getelementptr inbounds %struct.array_element, %struct.array_element* %23, i32 0, i32 3
  store %struct.array_element* %21, %struct.array_element** %prev11, align 8
  %24 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next12 = getelementptr inbounds %struct.array_element, %struct.array_element* %24, i32 0, i32 2
  %25 = load %struct.array_element*, %struct.array_element** %next12, align 4
  %26 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev13 = getelementptr inbounds %struct.array_element, %struct.array_element* %26, i32 0, i32 3
  %27 = load %struct.array_element*, %struct.array_element** %prev13, align 8
  %next14 = getelementptr inbounds %struct.array_element, %struct.array_element* %27, i32 0, i32 2
  store %struct.array_element* %25, %struct.array_element** %next14, align 4
  %28 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements15 = getelementptr inbounds %struct.array, %struct.array* %28, i32 0, i32 2
  %29 = load i32, i32* %num_elements15, align 8
  %dec = add nsw i32 %29, -1
  store i32 %dec, i32* %num_elements15, align 8
  %30 = load i64, i64* %i.addr, align 8
  %31 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %31, i32 0, i32 1
  %32 = load i64, i64* %max_index, align 8
  %cmp16 = icmp eq i64 %30, %32
  br i1 %cmp16, label %if.then17, label %if.end21

if.then17:                                        ; preds = %if.then9
  %33 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev18 = getelementptr inbounds %struct.array_element, %struct.array_element* %33, i32 0, i32 3
  %34 = load %struct.array_element*, %struct.array_element** %prev18, align 8
  %ind19 = getelementptr inbounds %struct.array_element, %struct.array_element* %34, i32 0, i32 0
  %35 = load i64, i64* %ind19, align 8
  %36 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index20 = getelementptr inbounds %struct.array, %struct.array* %36, i32 0, i32 1
  store i64 %35, i64* %max_index20, align 8
  br label %if.end21

if.end21:                                         ; preds = %if.then17, %if.then9
  %37 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next22 = getelementptr inbounds %struct.array_element, %struct.array_element* %37, i32 0, i32 2
  %38 = load %struct.array_element*, %struct.array_element** %next22, align 4
  %39 = load %struct.array*, %struct.array** %a.addr, align 4
  %head23 = getelementptr inbounds %struct.array, %struct.array* %39, i32 0, i32 3
  %40 = load %struct.array_element*, %struct.array_element** %head23, align 4
  %cmp24 = icmp ne %struct.array_element* %38, %40
  br i1 %cmp24, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.end21
  br label %do.body

do.body:                                          ; preds = %if.then25
  %41 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %41, %struct.array** @lastarray, align 4
  %42 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next26 = getelementptr inbounds %struct.array_element, %struct.array_element* %42, i32 0, i32 2
  %43 = load %struct.array_element*, %struct.array_element** %next26, align 4
  store %struct.array_element* %43, %struct.array_element** @lastref, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end41

if.else:                                          ; preds = %if.end21
  %44 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev27 = getelementptr inbounds %struct.array_element, %struct.array_element* %44, i32 0, i32 3
  %45 = load %struct.array_element*, %struct.array_element** %prev27, align 8
  %46 = load %struct.array*, %struct.array** %a.addr, align 4
  %head28 = getelementptr inbounds %struct.array, %struct.array* %46, i32 0, i32 3
  %47 = load %struct.array_element*, %struct.array_element** %head28, align 4
  %cmp29 = icmp ne %struct.array_element* %45, %47
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.else
  br label %do.body31

do.body31:                                        ; preds = %if.then30
  %48 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %48, %struct.array** @lastarray, align 4
  %49 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %prev32 = getelementptr inbounds %struct.array_element, %struct.array_element* %49, i32 0, i32 3
  %50 = load %struct.array_element*, %struct.array_element** %prev32, align 8
  store %struct.array_element* %50, %struct.array_element** @lastref, align 4
  br label %do.end33

do.end33:                                         ; preds = %do.body31
  br label %if.end40

if.else34:                                        ; preds = %if.else
  br label %do.body35

do.body35:                                        ; preds = %if.else34
  %51 = load %struct.array*, %struct.array** %a.addr, align 4
  %52 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp36 = icmp eq %struct.array* %51, %52
  br i1 %cmp36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %do.body35
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %do.body35
  br label %do.end39

do.end39:                                         ; preds = %if.end38
  br label %if.end40

if.end40:                                         ; preds = %do.end39, %do.end33
  br label %if.end41

if.end41:                                         ; preds = %if.end40, %do.end
  %53 = load %struct.array_element*, %struct.array_element** %ae, align 4
  store %struct.array_element* %53, %struct.array_element** %retval, align 4
  br label %return

if.end42:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end42
  %54 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next43 = getelementptr inbounds %struct.array_element, %struct.array_element* %54, i32 0, i32 2
  %55 = load %struct.array_element*, %struct.array_element** %next43, align 4
  store %struct.array_element* %55, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store %struct.array_element* null, %struct.array_element** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.end41, %if.then
  %56 = load %struct.array_element*, %struct.array_element** %retval, align 4
  ret %struct.array_element* %56
}

; Function Attrs: noinline nounwind
define i8* @array_reference(%struct.array* %a, i64 %i) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %i.addr = alloca i64, align 8
  %ae = alloca %struct.array_element*, align 4
  %start = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i64 %i, i64* %i.addr, align 8
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i64, i64* %i.addr, align 8
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %max_index = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 1
  %5 = load i64, i64* %max_index, align 8
  %cmp2 = icmp sgt i64 %3, %5
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %6 = load %struct.array*, %struct.array** @lastarray, align 4
  %tobool = icmp ne %struct.array* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end4
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %8 = load %struct.array*, %struct.array** @lastarray, align 4
  %cmp5 = icmp eq %struct.array* %7, %8
  br i1 %cmp5, label %land.lhs.true6, label %cond.false

land.lhs.true6:                                   ; preds = %land.lhs.true
  %9 = load i64, i64* %i.addr, align 8
  %10 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %10, i32 0, i32 0
  %11 = load i64, i64* %ind, align 8
  %cmp7 = icmp sge i64 %9, %11
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true6
  %12 = load %struct.array_element*, %struct.array_element** @lastref, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true6, %land.lhs.true, %if.end4
  %13 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %13, i32 0, i32 3
  %14 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 2
  %15 = load %struct.array_element*, %struct.array_element** %next, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array_element* [ %12, %cond.true ], [ %15, %cond.false ]
  store %struct.array_element* %cond, %struct.array_element** %start, align 4
  %16 = load %struct.array_element*, %struct.array_element** %start, align 4
  store %struct.array_element* %16, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %17 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %18 = load %struct.array*, %struct.array** %a.addr, align 4
  %head8 = getelementptr inbounds %struct.array, %struct.array* %18, i32 0, i32 3
  %19 = load %struct.array_element*, %struct.array_element** %head8, align 4
  %cmp9 = icmp ne %struct.array_element* %17, %19
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %20 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind10 = getelementptr inbounds %struct.array_element, %struct.array_element* %20, i32 0, i32 0
  %21 = load i64, i64* %ind10, align 8
  %22 = load i64, i64* %i.addr, align 8
  %cmp11 = icmp eq i64 %21, %22
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %for.body
  br label %do.body

do.body:                                          ; preds = %if.then12
  %23 = load %struct.array*, %struct.array** %a.addr, align 4
  store %struct.array* %23, %struct.array** @lastarray, align 4
  %24 = load %struct.array_element*, %struct.array_element** %ae, align 4
  store %struct.array_element* %24, %struct.array_element** @lastref, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %25 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %25, i32 0, i32 1
  %26 = load i8*, i8** %value, align 8
  store i8* %26, i8** %retval, align 4
  br label %return

if.end13:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end13
  %27 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next14 = getelementptr inbounds %struct.array_element, %struct.array_element* %27, i32 0, i32 2
  %28 = load %struct.array_element*, %struct.array_element** %next14, align 4
  store %struct.array_element* %28, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.body15

do.body15:                                        ; preds = %for.end
  store %struct.array* null, %struct.array** @lastarray, align 4
  store %struct.array_element* null, %struct.array_element** @lastref, align 4
  br label %do.end16

do.end16:                                         ; preds = %do.body15
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %do.end16, %do.end, %if.then3, %if.then
  %29 = load i8*, i8** %retval, align 4
  ret i8* %29
}

; Function Attrs: noinline nounwind
define %struct.word_list* @array_to_word_list(%struct.array* %a) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %a.addr = alloca %struct.array*, align 4
  %list = alloca %struct.word_list*, align 4
  %ae = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store %struct.word_list* null, %struct.word_list** %list, align 4
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 3
  %4 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %4, i32 0, i32 2
  %5 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %5, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %head2 = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 3
  %8 = load %struct.array_element*, %struct.array_element** %head2, align 4
  %cmp3 = icmp ne %struct.array_element* %6, %8
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %9, i32 0, i32 1
  %10 = load i8*, i8** %value, align 8
  %call = call %struct.word_desc* @make_bare_word(i8* %10)
  %11 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call4 = call %struct.word_list* @make_word_list(%struct.word_desc* %call, %struct.word_list* %11)
  store %struct.word_list* %call4, %struct.word_list** %list, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next5 = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 2
  %13 = load %struct.array_element*, %struct.array_element** %next5, align 4
  store %struct.array_element* %13, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %14 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool = icmp ne %struct.word_list* %14, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %15 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next6 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 0
  %16 = load %struct.word_list*, %struct.word_list** %next6, align 4
  %tobool7 = icmp ne %struct.word_list* %16, null
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %17 = load %struct.word_list*, %struct.word_list** %list, align 4
  %18 = bitcast %struct.word_list* %17 to %struct.g_list*
  %call8 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %18)
  %19 = bitcast %struct.g_list* %call8 to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %20 = load %struct.word_list*, %struct.word_list** %list, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %19, %cond.true ], [ %20, %cond.false ]
  store %struct.word_list* %cond, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %21 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %21
}

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare %struct.word_desc* @make_bare_word(i8*) #1

declare %struct.g_list* @list_reverse(...) #1

; Function Attrs: noinline nounwind
define %struct.array* @array_from_word_list(%struct.word_list* %list) #0 {
entry:
  %retval = alloca %struct.array*, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %a = alloca %struct.array*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct.array* null, %struct.array** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call = call %struct.array* @array_create()
  store %struct.array* %call, %struct.array** %a, align 4
  %1 = load %struct.array*, %struct.array** %a, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call1 = call %struct.array* @array_assign_list(%struct.array* %1, %struct.word_list* %2)
  store %struct.array* %call1, %struct.array** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load %struct.array*, %struct.array** %retval, align 4
  ret %struct.array* %3
}

; Function Attrs: noinline nounwind
define %struct.array* @array_assign_list(%struct.array* %array, %struct.word_list* %list) #0 {
entry:
  %array.addr = alloca %struct.array*, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %l = alloca %struct.word_list*, align 4
  %i = alloca i64, align 8
  store %struct.array* %array, %struct.array** %array.addr, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %l, align 4
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %l, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.array*, %struct.array** %array.addr, align 4
  %3 = load i64, i64* %i, align 8
  %4 = load %struct.word_list*, %struct.word_list** %l, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word1, align 4
  %call = call i32 @array_insert(%struct.array* %2, i64 %3, i8* %6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load %struct.word_list*, %struct.word_list** %l, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 0
  %8 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %8, %struct.word_list** %l, align 4
  %9 = load i64, i64* %i, align 8
  %inc = add nsw i64 %9, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load %struct.array*, %struct.array** %array.addr, align 4
  ret %struct.array* %10
}

; Function Attrs: noinline nounwind
define %struct.word_list* @array_keys_to_word_list(%struct.array* %a) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %a.addr = alloca %struct.array*, align 4
  %list = alloca %struct.word_list*, align 4
  %ae = alloca %struct.array_element*, align 4
  %t = alloca i8*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store %struct.word_list* null, %struct.word_list** %list, align 4
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 3
  %4 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %4, i32 0, i32 2
  %5 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %5, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %7 = load %struct.array*, %struct.array** %a.addr, align 4
  %head2 = getelementptr inbounds %struct.array, %struct.array* %7, i32 0, i32 3
  %8 = load %struct.array_element*, %struct.array_element** %head2, align 4
  %cmp3 = icmp ne %struct.array_element* %6, %8
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %9, i32 0, i32 0
  %10 = load i64, i64* %ind, align 8
  %call = call i8* @itos(i64 %10)
  store i8* %call, i8** %t, align 4
  %11 = load i8*, i8** %t, align 4
  %call4 = call %struct.word_desc* @make_bare_word(i8* %11)
  %12 = load %struct.word_list*, %struct.word_list** %list, align 4
  %call5 = call %struct.word_list* @make_word_list(%struct.word_desc* %call4, %struct.word_list* %12)
  store %struct.word_list* %call5, %struct.word_list** %list, align 4
  %13 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 773)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next6 = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 2
  %15 = load %struct.array_element*, %struct.array_element** %next6, align 4
  store %struct.array_element* %15, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load %struct.word_list*, %struct.word_list** %list, align 4
  %tobool = icmp ne %struct.word_list* %16, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %for.end
  %17 = load %struct.word_list*, %struct.word_list** %list, align 4
  %next7 = getelementptr inbounds %struct.word_list, %struct.word_list* %17, i32 0, i32 0
  %18 = load %struct.word_list*, %struct.word_list** %next7, align 4
  %tobool8 = icmp ne %struct.word_list* %18, null
  br i1 %tobool8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %19 = load %struct.word_list*, %struct.word_list** %list, align 4
  %20 = bitcast %struct.word_list* %19 to %struct.g_list*
  %call9 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %20)
  %21 = bitcast %struct.g_list* %call9 to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %for.end
  %22 = load %struct.word_list*, %struct.word_list** %list, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %21, %cond.true ], [ %22, %cond.false ]
  store %struct.word_list* %cond, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %23 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %23
}

declare i8* @itos(i64) #1

; Function Attrs: noinline nounwind
define i8** @array_to_argv(%struct.array* %a) #0 {
entry:
  %retval = alloca i8**, align 4
  %a.addr = alloca %struct.array*, align 4
  %ret = alloca i8**, align 4
  %t = alloca i8*, align 4
  %i = alloca i32, align 4
  %ae = alloca %struct.array_element*, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements2 = getelementptr inbounds %struct.array, %struct.array* %3, i32 0, i32 2
  %4 = load i32, i32* %num_elements2, align 8
  %add = add nsw i32 %4, 1
  %call = call i8** @strvec_create(i32 %add)
  store i8** %call, i8*** %ret, align 4
  store i32 0, i32* %i, align 4
  %5 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %5, i32 0, i32 3
  %6 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %6, i32 0, i32 2
  %7 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %7, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %9 = load %struct.array*, %struct.array** %a.addr, align 4
  %head3 = getelementptr inbounds %struct.array, %struct.array* %9, i32 0, i32 3
  %10 = load %struct.array_element*, %struct.array_element** %head3, align 4
  %cmp4 = icmp ne %struct.array_element* %8, %10
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 8
  store i8* %12, i8** %t, align 4
  %13 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %13, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %14 = load i8*, i8** %t, align 4
  %call5 = call i32 @strlen(i8* %14)
  %add6 = add i32 1, %call5
  %call7 = call i8* @sh_xmalloc(i32 %add6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 805)
  %15 = load i8*, i8** %t, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %15)
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call8, %cond.true ], [ null, %cond.false ]
  %16 = load i8**, i8*** %ret, align 4
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %16, i32 %17
  store i8* %cond, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %18 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next9 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 2
  %19 = load %struct.array_element*, %struct.array_element** %next9, align 4
  store %struct.array_element* %19, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8**, i8*** %ret, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %20, i32 %21
  store i8* null, i8** %arrayidx10, align 4
  %22 = load i8**, i8*** %ret, align 4
  store i8** %22, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %23 = load i8**, i8*** %retval, align 4
  ret i8** %23
}

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define i8* @array_to_assign(%struct.array* %a, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %a.addr = alloca %struct.array*, align 4
  %quoted.addr = alloca i32, align 4
  %result = alloca i8*, align 4
  %valstr = alloca i8*, align 4
  %is = alloca i8*, align 4
  %indstr = alloca [22 x i8], align 1
  %ae = alloca %struct.array_element*, align 4
  %rsize = alloca i32, align 4
  %rlen = alloca i32, align 4
  %elen = alloca i32, align 4
  store %struct.array* %a, %struct.array** %a.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.array*, %struct.array** %a.addr, align 4
  %cmp = icmp eq %struct.array* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.array*, %struct.array** %a.addr, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %1, i32 0, i32 2
  %2 = load i32, i32* %num_elements, align 8
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 128, i32* %rsize, align 4
  %call = call i8* @sh_xmalloc(i32 128, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 869)
  store i8* %call, i8** %result, align 4
  %3 = load i8*, i8** %result, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 40, i8* %arrayidx, align 1
  store i32 1, i32* %rlen, align 4
  %4 = load %struct.array*, %struct.array** %a.addr, align 4
  %head = getelementptr inbounds %struct.array, %struct.array* %4, i32 0, i32 3
  %5 = load %struct.array_element*, %struct.array_element** %head, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %5, i32 0, i32 2
  %6 = load %struct.array_element*, %struct.array_element** %next, align 4
  store %struct.array_element* %6, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %8 = load %struct.array*, %struct.array** %a.addr, align 4
  %head2 = getelementptr inbounds %struct.array, %struct.array* %8, i32 0, i32 3
  %9 = load %struct.array_element*, %struct.array_element** %head2, align 4
  %cmp3 = icmp ne %struct.array_element* %7, %9
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %ind = getelementptr inbounds %struct.array_element, %struct.array_element* %10, i32 0, i32 0
  %11 = load i64, i64* %ind, align 8
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %indstr, i32 0, i32 0
  %call4 = call i8* @inttostr(i64 %11, i8* %arraydecay, i32 22)
  store i8* %call4, i8** %is, align 4
  %12 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 1
  %13 = load i8*, i8** %value, align 8
  %tobool = icmp ne i8* %13, null
  br i1 %tobool, label %cond.true, label %cond.false13

cond.true:                                        ; preds = %for.body
  %14 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value5 = getelementptr inbounds %struct.array_element, %struct.array_element* %14, i32 0, i32 1
  %15 = load i8*, i8** %value5, align 8
  %call6 = call i32 @ansic_shouldquote(i8* %15)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %cond.true8, label %cond.false

cond.true8:                                       ; preds = %cond.true
  %16 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value9 = getelementptr inbounds %struct.array_element, %struct.array_element* %16, i32 0, i32 1
  %17 = load i8*, i8** %value9, align 8
  %call10 = call i8* @ansic_quote(i8* %17, i32 0, i32* null)
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %18 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value11 = getelementptr inbounds %struct.array_element, %struct.array_element* %18, i32 0, i32 1
  %19 = load i8*, i8** %value11, align 8
  %call12 = call i8* @sh_double_quote(i8* %19)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true8
  %cond = phi i8* [ %call10, %cond.true8 ], [ %call12, %cond.false ]
  br label %cond.end14

cond.false13:                                     ; preds = %for.body
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false13, %cond.end
  %cond15 = phi i8* [ %cond, %cond.end ], [ null, %cond.false13 ]
  store i8* %cond15, i8** %valstr, align 4
  %20 = load i8*, i8** %is, align 4
  %tobool16 = icmp ne i8* %20, null
  br i1 %tobool16, label %land.lhs.true, label %cond.false35

land.lhs.true:                                    ; preds = %cond.end14
  %21 = load i8*, i8** %is, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx17, align 1
  %conv = sext i8 %22 to i32
  %tobool18 = icmp ne i32 %conv, 0
  br i1 %tobool18, label %cond.true19, label %cond.false35

cond.true19:                                      ; preds = %land.lhs.true
  %23 = load i8*, i8** %is, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %23, i32 1
  %24 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %24 to i32
  %tobool22 = icmp ne i32 %conv21, 0
  br i1 %tobool22, label %cond.true23, label %cond.false32

cond.true23:                                      ; preds = %cond.true19
  %25 = load i8*, i8** %is, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %25, i32 2
  %26 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %26 to i32
  %tobool26 = icmp ne i32 %conv25, 0
  br i1 %tobool26, label %cond.true27, label %cond.false29

cond.true27:                                      ; preds = %cond.true23
  %27 = load i8*, i8** %is, align 4
  %call28 = call i32 @strlen(i8* %27)
  br label %cond.end30

cond.false29:                                     ; preds = %cond.true23
  br label %cond.end30

cond.end30:                                       ; preds = %cond.false29, %cond.true27
  %cond31 = phi i32 [ %call28, %cond.true27 ], [ 2, %cond.false29 ]
  br label %cond.end33

cond.false32:                                     ; preds = %cond.true19
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false32, %cond.end30
  %cond34 = phi i32 [ %cond31, %cond.end30 ], [ 1, %cond.false32 ]
  br label %cond.end36

cond.false35:                                     ; preds = %land.lhs.true, %cond.end14
  br label %cond.end36

cond.end36:                                       ; preds = %cond.false35, %cond.end33
  %cond37 = phi i32 [ %cond34, %cond.end33 ], [ 0, %cond.false35 ]
  %add = add i32 %cond37, 8
  %28 = load i8*, i8** %valstr, align 4
  %tobool38 = icmp ne i8* %28, null
  br i1 %tobool38, label %land.lhs.true39, label %cond.false59

land.lhs.true39:                                  ; preds = %cond.end36
  %29 = load i8*, i8** %valstr, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %29, i32 0
  %30 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %30 to i32
  %tobool42 = icmp ne i32 %conv41, 0
  br i1 %tobool42, label %cond.true43, label %cond.false59

cond.true43:                                      ; preds = %land.lhs.true39
  %31 = load i8*, i8** %valstr, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %31, i32 1
  %32 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %32 to i32
  %tobool46 = icmp ne i32 %conv45, 0
  br i1 %tobool46, label %cond.true47, label %cond.false56

cond.true47:                                      ; preds = %cond.true43
  %33 = load i8*, i8** %valstr, align 4
  %arrayidx48 = getelementptr inbounds i8, i8* %33, i32 2
  %34 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %34 to i32
  %tobool50 = icmp ne i32 %conv49, 0
  br i1 %tobool50, label %cond.true51, label %cond.false53

cond.true51:                                      ; preds = %cond.true47
  %35 = load i8*, i8** %valstr, align 4
  %call52 = call i32 @strlen(i8* %35)
  br label %cond.end54

cond.false53:                                     ; preds = %cond.true47
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false53, %cond.true51
  %cond55 = phi i32 [ %call52, %cond.true51 ], [ 2, %cond.false53 ]
  br label %cond.end57

cond.false56:                                     ; preds = %cond.true43
  br label %cond.end57

cond.end57:                                       ; preds = %cond.false56, %cond.end54
  %cond58 = phi i32 [ %cond55, %cond.end54 ], [ 1, %cond.false56 ]
  br label %cond.end60

cond.false59:                                     ; preds = %land.lhs.true39, %cond.end36
  br label %cond.end60

cond.end60:                                       ; preds = %cond.false59, %cond.end57
  %cond61 = phi i32 [ %cond58, %cond.end57 ], [ 0, %cond.false59 ]
  %add62 = add i32 %add, %cond61
  store i32 %add62, i32* %elen, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end60
  %36 = load i32, i32* %rlen, align 4
  %37 = load i32, i32* %elen, align 4
  %add63 = add nsw i32 %37, 1
  %add64 = add nsw i32 %36, %add63
  %38 = load i32, i32* %rsize, align 4
  %cmp65 = icmp sge i32 %add64, %38
  br i1 %cmp65, label %if.then67, label %if.end74

if.then67:                                        ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then67
  %39 = load i32, i32* %rlen, align 4
  %40 = load i32, i32* %elen, align 4
  %add68 = add nsw i32 %40, 1
  %add69 = add nsw i32 %39, %add68
  %41 = load i32, i32* %rsize, align 4
  %cmp70 = icmp sge i32 %add69, %41
  br i1 %cmp70, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %42 = load i32, i32* %rsize, align 4
  %43 = load i32, i32* %rsize, align 4
  %add72 = add nsw i32 %43, %42
  store i32 %add72, i32* %rsize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %44 = load i8*, i8** %result, align 4
  %45 = load i32, i32* %rsize, align 4
  %call73 = call i8* @sh_xrealloc(i8* %44, i32 %45, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 881)
  store i8* %call73, i8** %result, align 4
  br label %if.end74

if.end74:                                         ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end74
  %46 = load i8*, i8** %result, align 4
  %47 = load i32, i32* %rlen, align 4
  %inc = add nsw i32 %47, 1
  store i32 %inc, i32* %rlen, align 4
  %arrayidx75 = getelementptr inbounds i8, i8* %46, i32 %47
  store i8 91, i8* %arrayidx75, align 1
  %48 = load i8*, i8** %result, align 4
  %49 = load i32, i32* %rlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %48, i32 %49
  %50 = load i8*, i8** %is, align 4
  %call76 = call i8* @strcpy(i8* %add.ptr, i8* %50)
  %51 = load i8*, i8** %is, align 4
  %tobool77 = icmp ne i8* %51, null
  br i1 %tobool77, label %land.lhs.true78, label %cond.false98

land.lhs.true78:                                  ; preds = %do.end
  %52 = load i8*, i8** %is, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %52, i32 0
  %53 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %53 to i32
  %tobool81 = icmp ne i32 %conv80, 0
  br i1 %tobool81, label %cond.true82, label %cond.false98

cond.true82:                                      ; preds = %land.lhs.true78
  %54 = load i8*, i8** %is, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %54, i32 1
  %55 = load i8, i8* %arrayidx83, align 1
  %conv84 = sext i8 %55 to i32
  %tobool85 = icmp ne i32 %conv84, 0
  br i1 %tobool85, label %cond.true86, label %cond.false95

cond.true86:                                      ; preds = %cond.true82
  %56 = load i8*, i8** %is, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %56, i32 2
  %57 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %57 to i32
  %tobool89 = icmp ne i32 %conv88, 0
  br i1 %tobool89, label %cond.true90, label %cond.false92

cond.true90:                                      ; preds = %cond.true86
  %58 = load i8*, i8** %is, align 4
  %call91 = call i32 @strlen(i8* %58)
  br label %cond.end93

cond.false92:                                     ; preds = %cond.true86
  br label %cond.end93

cond.end93:                                       ; preds = %cond.false92, %cond.true90
  %cond94 = phi i32 [ %call91, %cond.true90 ], [ 2, %cond.false92 ]
  br label %cond.end96

cond.false95:                                     ; preds = %cond.true82
  br label %cond.end96

cond.end96:                                       ; preds = %cond.false95, %cond.end93
  %cond97 = phi i32 [ %cond94, %cond.end93 ], [ 1, %cond.false95 ]
  br label %cond.end99

cond.false98:                                     ; preds = %land.lhs.true78, %do.end
  br label %cond.end99

cond.end99:                                       ; preds = %cond.false98, %cond.end96
  %cond100 = phi i32 [ %cond97, %cond.end96 ], [ 0, %cond.false98 ]
  %59 = load i32, i32* %rlen, align 4
  %add101 = add i32 %59, %cond100
  store i32 %add101, i32* %rlen, align 4
  %60 = load i8*, i8** %result, align 4
  %61 = load i32, i32* %rlen, align 4
  %inc102 = add nsw i32 %61, 1
  store i32 %inc102, i32* %rlen, align 4
  %arrayidx103 = getelementptr inbounds i8, i8* %60, i32 %61
  store i8 93, i8* %arrayidx103, align 1
  %62 = load i8*, i8** %result, align 4
  %63 = load i32, i32* %rlen, align 4
  %inc104 = add nsw i32 %63, 1
  store i32 %inc104, i32* %rlen, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %62, i32 %63
  store i8 61, i8* %arrayidx105, align 1
  %64 = load i8*, i8** %valstr, align 4
  %tobool106 = icmp ne i8* %64, null
  br i1 %tobool106, label %if.then107, label %if.end135

if.then107:                                       ; preds = %cond.end99
  %65 = load i8*, i8** %result, align 4
  %66 = load i32, i32* %rlen, align 4
  %add.ptr108 = getelementptr inbounds i8, i8* %65, i32 %66
  %67 = load i8*, i8** %valstr, align 4
  %call109 = call i8* @strcpy(i8* %add.ptr108, i8* %67)
  %68 = load i8*, i8** %valstr, align 4
  %tobool110 = icmp ne i8* %68, null
  br i1 %tobool110, label %land.lhs.true111, label %cond.false131

land.lhs.true111:                                 ; preds = %if.then107
  %69 = load i8*, i8** %valstr, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %69, i32 0
  %70 = load i8, i8* %arrayidx112, align 1
  %conv113 = sext i8 %70 to i32
  %tobool114 = icmp ne i32 %conv113, 0
  br i1 %tobool114, label %cond.true115, label %cond.false131

cond.true115:                                     ; preds = %land.lhs.true111
  %71 = load i8*, i8** %valstr, align 4
  %arrayidx116 = getelementptr inbounds i8, i8* %71, i32 1
  %72 = load i8, i8* %arrayidx116, align 1
  %conv117 = sext i8 %72 to i32
  %tobool118 = icmp ne i32 %conv117, 0
  br i1 %tobool118, label %cond.true119, label %cond.false128

cond.true119:                                     ; preds = %cond.true115
  %73 = load i8*, i8** %valstr, align 4
  %arrayidx120 = getelementptr inbounds i8, i8* %73, i32 2
  %74 = load i8, i8* %arrayidx120, align 1
  %conv121 = sext i8 %74 to i32
  %tobool122 = icmp ne i32 %conv121, 0
  br i1 %tobool122, label %cond.true123, label %cond.false125

cond.true123:                                     ; preds = %cond.true119
  %75 = load i8*, i8** %valstr, align 4
  %call124 = call i32 @strlen(i8* %75)
  br label %cond.end126

cond.false125:                                    ; preds = %cond.true119
  br label %cond.end126

cond.end126:                                      ; preds = %cond.false125, %cond.true123
  %cond127 = phi i32 [ %call124, %cond.true123 ], [ 2, %cond.false125 ]
  br label %cond.end129

cond.false128:                                    ; preds = %cond.true115
  br label %cond.end129

cond.end129:                                      ; preds = %cond.false128, %cond.end126
  %cond130 = phi i32 [ %cond127, %cond.end126 ], [ 1, %cond.false128 ]
  br label %cond.end132

cond.false131:                                    ; preds = %land.lhs.true111, %if.then107
  br label %cond.end132

cond.end132:                                      ; preds = %cond.false131, %cond.end129
  %cond133 = phi i32 [ %cond130, %cond.end129 ], [ 0, %cond.false131 ]
  %76 = load i32, i32* %rlen, align 4
  %add134 = add i32 %76, %cond133
  store i32 %add134, i32* %rlen, align 4
  br label %if.end135

if.end135:                                        ; preds = %cond.end132, %cond.end99
  %77 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next136 = getelementptr inbounds %struct.array_element, %struct.array_element* %77, i32 0, i32 2
  %78 = load %struct.array_element*, %struct.array_element** %next136, align 4
  %79 = load %struct.array*, %struct.array** %a.addr, align 4
  %head137 = getelementptr inbounds %struct.array, %struct.array* %79, i32 0, i32 3
  %80 = load %struct.array_element*, %struct.array_element** %head137, align 4
  %cmp138 = icmp ne %struct.array_element* %78, %80
  br i1 %cmp138, label %if.then140, label %if.end143

if.then140:                                       ; preds = %if.end135
  %81 = load i8*, i8** %result, align 4
  %82 = load i32, i32* %rlen, align 4
  %inc141 = add nsw i32 %82, 1
  store i32 %inc141, i32* %rlen, align 4
  %arrayidx142 = getelementptr inbounds i8, i8* %81, i32 %82
  store i8 32, i8* %arrayidx142, align 1
  br label %if.end143

if.end143:                                        ; preds = %if.then140, %if.end135
  br label %do.body144

do.body144:                                       ; preds = %if.end143
  %83 = load i8*, i8** %valstr, align 4
  %tobool145 = icmp ne i8* %83, null
  br i1 %tobool145, label %if.then146, label %if.end147

if.then146:                                       ; preds = %do.body144
  %84 = load i8*, i8** %valstr, align 4
  call void @sh_xfree(i8* %84, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 896)
  br label %if.end147

if.end147:                                        ; preds = %if.then146, %do.body144
  br label %do.end148

do.end148:                                        ; preds = %if.end147
  br label %for.inc

for.inc:                                          ; preds = %do.end148
  %85 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next149 = getelementptr inbounds %struct.array_element, %struct.array_element* %85, i32 0, i32 2
  %86 = load %struct.array_element*, %struct.array_element** %next149, align 4
  store %struct.array_element* %86, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.body150

do.body150:                                       ; preds = %for.end
  %87 = load i32, i32* %rlen, align 4
  %add151 = add nsw i32 %87, 1
  %88 = load i32, i32* %rsize, align 4
  %cmp152 = icmp sge i32 %add151, %88
  br i1 %cmp152, label %if.then154, label %if.end163

if.then154:                                       ; preds = %do.body150
  br label %while.cond155

while.cond155:                                    ; preds = %while.body159, %if.then154
  %89 = load i32, i32* %rlen, align 4
  %add156 = add nsw i32 %89, 1
  %90 = load i32, i32* %rsize, align 4
  %cmp157 = icmp sge i32 %add156, %90
  br i1 %cmp157, label %while.body159, label %while.end161

while.body159:                                    ; preds = %while.cond155
  %91 = load i32, i32* %rsize, align 4
  %add160 = add nsw i32 %91, 8
  store i32 %add160, i32* %rsize, align 4
  br label %while.cond155

while.end161:                                     ; preds = %while.cond155
  %92 = load i8*, i8** %result, align 4
  %93 = load i32, i32* %rsize, align 4
  %call162 = call i8* @sh_xrealloc(i8* %92, i32 %93, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 898)
  store i8* %call162, i8** %result, align 4
  br label %if.end163

if.end163:                                        ; preds = %while.end161, %do.body150
  br label %do.end164

do.end164:                                        ; preds = %if.end163
  %94 = load i8*, i8** %result, align 4
  %95 = load i32, i32* %rlen, align 4
  %inc165 = add nsw i32 %95, 1
  store i32 %inc165, i32* %rlen, align 4
  %arrayidx166 = getelementptr inbounds i8, i8* %94, i32 %95
  store i8 41, i8* %arrayidx166, align 1
  %96 = load i8*, i8** %result, align 4
  %97 = load i32, i32* %rlen, align 4
  %arrayidx167 = getelementptr inbounds i8, i8* %96, i32 %97
  store i8 0, i8* %arrayidx167, align 1
  %98 = load i32, i32* %quoted.addr, align 4
  %tobool168 = icmp ne i32 %98, 0
  br i1 %tobool168, label %if.then169, label %if.end171

if.then169:                                       ; preds = %do.end164
  %99 = load i8*, i8** %result, align 4
  %call170 = call i8* @sh_single_quote(i8* %99)
  store i8* %call170, i8** %valstr, align 4
  %100 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %100, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 904)
  %101 = load i8*, i8** %valstr, align 4
  store i8* %101, i8** %result, align 4
  br label %if.end171

if.end171:                                        ; preds = %if.then169, %do.end164
  %102 = load i8*, i8** %result, align 4
  store i8* %102, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end171, %if.then
  %103 = load i8*, i8** %retval, align 4
  ret i8* %103
}

declare i8* @inttostr(i64, i8*, i32) #1

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

declare i8* @sh_double_quote(i8*) #1

declare i8* @sh_single_quote(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @array_to_string_internal(%struct.array_element* %start, %struct.array_element* %end, i8* %sep, i32 %quoted) #0 {
entry:
  %retval = alloca i8*, align 4
  %start.addr = alloca %struct.array_element*, align 4
  %end.addr = alloca %struct.array_element*, align 4
  %sep.addr = alloca i8*, align 4
  %quoted.addr = alloca i32, align 4
  %result = alloca i8*, align 4
  %t = alloca i8*, align 4
  %ae = alloca %struct.array_element*, align 4
  %slen = alloca i32, align 4
  %rsize = alloca i32, align 4
  %rlen = alloca i32, align 4
  %reg = alloca i32, align 4
  store %struct.array_element* %start, %struct.array_element** %start.addr, align 4
  store %struct.array_element* %end, %struct.array_element** %end.addr, align 4
  store i8* %sep, i8** %sep.addr, align 4
  store i32 %quoted, i32* %quoted.addr, align 4
  %0 = load %struct.array_element*, %struct.array_element** %start.addr, align 4
  %1 = load %struct.array_element*, %struct.array_element** %end.addr, align 4
  %cmp = icmp eq %struct.array_element* %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %sep.addr, align 4
  %call = call i32 @strlen(i8* %2)
  store i32 %call, i32* %slen, align 4
  store i8* null, i8** %result, align 4
  store i32 0, i32* %rlen, align 4
  store i32 0, i32* %rsize, align 4
  %3 = load %struct.array_element*, %struct.array_element** %start.addr, align 4
  store %struct.array_element* %3, %struct.array_element** %ae, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %5 = load %struct.array_element*, %struct.array_element** %end.addr, align 4
  %cmp1 = icmp ne %struct.array_element* %4, %5
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %rsize, align 4
  %cmp2 = icmp eq i32 %6, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %for.body
  store i32 64, i32* %rsize, align 4
  %call4 = call i8* @sh_xmalloc(i32 64, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 832)
  store i8* %call4, i8** %result, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %for.body
  %7 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value = getelementptr inbounds %struct.array_element, %struct.array_element* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 8
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %if.then6, label %if.end34

if.then6:                                         ; preds = %if.end5
  %9 = load i32, i32* %quoted.addr, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  %10 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value8 = getelementptr inbounds %struct.array_element, %struct.array_element* %10, i32 0, i32 1
  %11 = load i8*, i8** %value8, align 8
  %call9 = call i8* @quote_string(i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  %12 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %value10 = getelementptr inbounds %struct.array_element, %struct.array_element* %12, i32 0, i32 1
  %13 = load i8*, i8** %value10, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call9, %cond.true ], [ %13, %cond.false ]
  store i8* %cond, i8** %t, align 4
  %14 = load i8*, i8** %t, align 4
  %call11 = call i32 @strlen(i8* %14)
  store i32 %call11, i32* %reg, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end
  %15 = load i32, i32* %rlen, align 4
  %16 = load i32, i32* %reg, align 4
  %17 = load i32, i32* %slen, align 4
  %add = add nsw i32 %16, %17
  %add12 = add nsw i32 %add, 2
  %add13 = add nsw i32 %15, %add12
  %18 = load i32, i32* %rsize, align 4
  %cmp14 = icmp sge i32 %add13, %18
  br i1 %cmp14, label %if.then15, label %if.end22

if.then15:                                        ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then15
  %19 = load i32, i32* %rlen, align 4
  %20 = load i32, i32* %reg, align 4
  %21 = load i32, i32* %slen, align 4
  %add16 = add nsw i32 %20, %21
  %add17 = add nsw i32 %add16, 2
  %add18 = add nsw i32 %19, %add17
  %22 = load i32, i32* %rsize, align 4
  %cmp19 = icmp sge i32 %add18, %22
  br i1 %cmp19, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %23 = load i32, i32* %rsize, align 4
  %24 = load i32, i32* %rsize, align 4
  %add20 = add nsw i32 %24, %23
  store i32 %add20, i32* %rsize, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load i8*, i8** %result, align 4
  %26 = load i32, i32* %rsize, align 4
  %call21 = call i8* @sh_xrealloc(i8* %25, i32 %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 837)
  store i8* %call21, i8** %result, align 4
  br label %if.end22

if.end22:                                         ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end22
  %27 = load i8*, i8** %result, align 4
  %28 = load i32, i32* %rlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8*, i8** %t, align 4
  %call23 = call i8* @strcpy(i8* %add.ptr, i8* %29)
  %30 = load i32, i32* %reg, align 4
  %31 = load i32, i32* %rlen, align 4
  %add24 = add nsw i32 %31, %30
  store i32 %add24, i32* %rlen, align 4
  %32 = load i32, i32* %quoted.addr, align 4
  %tobool25 = icmp ne i32 %32, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %do.end
  %33 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 841)
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %do.end
  %34 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next = getelementptr inbounds %struct.array_element, %struct.array_element* %34, i32 0, i32 2
  %35 = load %struct.array_element*, %struct.array_element** %next, align 4
  %36 = load %struct.array_element*, %struct.array_element** %end.addr, align 4
  %cmp28 = icmp ne %struct.array_element* %35, %36
  br i1 %cmp28, label %if.then29, label %if.end33

if.then29:                                        ; preds = %if.end27
  %37 = load i8*, i8** %result, align 4
  %38 = load i32, i32* %rlen, align 4
  %add.ptr30 = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8*, i8** %sep.addr, align 4
  %call31 = call i8* @strcpy(i8* %add.ptr30, i8* %39)
  %40 = load i32, i32* %slen, align 4
  %41 = load i32, i32* %rlen, align 4
  %add32 = add nsw i32 %41, %40
  store i32 %add32, i32* %rlen, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then29, %if.end27
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.end5
  br label %for.inc

for.inc:                                          ; preds = %if.end34
  %42 = load %struct.array_element*, %struct.array_element** %ae, align 4
  %next35 = getelementptr inbounds %struct.array_element, %struct.array_element* %42, i32 0, i32 2
  %43 = load %struct.array_element*, %struct.array_element** %next35, align 4
  store %struct.array_element* %43, %struct.array_element** %ae, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %44 = load i8*, i8** %result, align 4
  %tobool36 = icmp ne i8* %44, null
  br i1 %tobool36, label %if.then37, label %if.end38

if.then37:                                        ; preds = %for.end
  %45 = load i8*, i8** %result, align 4
  %46 = load i32, i32* %rlen, align 4
  %arrayidx = getelementptr inbounds i8, i8* %45, i32 %46
  store i8 0, i8* %arrayidx, align 1
  br label %if.end38

if.end38:                                         ; preds = %if.then37, %for.end
  %47 = load i8*, i8** %result, align 4
  store i8* %47, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end38, %if.then
  %48 = load i8*, i8** %retval, align 4
  ret i8* %48
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
