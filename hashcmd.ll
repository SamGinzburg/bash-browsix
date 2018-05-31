; ModuleID = 'hashcmd.c'
source_filename = "hashcmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct._pathdata = type { i8*, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@hashed_filenames = global %struct.hash_table* null, align 4
@hashing_enabled = external global i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"hashcmd.c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind
define void @phash_create() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp = icmp eq %struct.hash_table* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.hash_table* @hash_create(i32 64)
  store %struct.hash_table* %call, %struct.hash_table** @hashed_filenames, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare %struct.hash_table* @hash_create(i32) #1

; Function Attrs: noinline nounwind
define void @phash_flush() #0 {
entry:
  %0 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %tobool = icmp ne %struct.hash_table* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  call void @hash_flush(%struct.hash_table* %1, void (i8*)* @phash_freedata)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare void @hash_flush(%struct.hash_table*, void (i8*)*) #1

; Function Attrs: noinline nounwind
define internal void @phash_freedata(i8* %data) #0 {
entry:
  %data.addr = alloca i8*, align 4
  store i8* %data, i8** %data.addr, align 4
  %0 = load i8*, i8** %data.addr, align 4
  %1 = bitcast i8* %0 to %struct._pathdata*
  %path = getelementptr inbounds %struct._pathdata, %struct._pathdata* %1, i32 0, i32 0
  %2 = load i8*, i8** %path, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 54)
  %3 = load i8*, i8** %data.addr, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 55)
  ret void
}

; Function Attrs: noinline nounwind
define i32 @phash_remove(i8* %filename) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i32, i32* @hashing_enabled, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp1 = icmp eq %struct.hash_table* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %filename.addr, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %call = call %struct.bucket_contents* @hash_remove(i8* %2, %struct.hash_table* %3, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %item, align 4
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %tobool = icmp ne %struct.bucket_contents* %4, null
  br i1 %tobool, label %if.then2, label %if.end7

if.then2:                                         ; preds = %if.end
  %5 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %5, i32 0, i32 2
  %6 = load i8*, i8** %data, align 4
  %tobool3 = icmp ne i8* %6, null
  br i1 %tobool3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.then2
  %7 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data5 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %7, i32 0, i32 2
  %8 = load i8*, i8** %data5, align 4
  call void @phash_freedata(i8* %8)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.then2
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %9, i32 0, i32 1
  %10 = load i8*, i8** %key, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 80)
  %11 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %12 = bitcast %struct.bucket_contents* %11 to i8*
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 81)
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.end6, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare %struct.bucket_contents* @hash_remove(i8*, %struct.hash_table*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @phash_insert(i8* %filename, i8* %full_path, i32 %check_dot, i32 %found) #0 {
entry:
  %filename.addr = alloca i8*, align 4
  %full_path.addr = alloca i8*, align 4
  %check_dot.addr = alloca i32, align 4
  %found.addr = alloca i32, align 4
  %item = alloca %struct.bucket_contents*, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i8* %full_path, i8** %full_path.addr, align 4
  store i32 %check_dot, i32* %check_dot.addr, align 4
  store i32 %found, i32* %found.addr, align 4
  %0 = load i32, i32* @hashing_enabled, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp1 = icmp eq %struct.hash_table* %1, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @phash_create()
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %2 = load i8*, i8** %filename.addr, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %call = call %struct.bucket_contents* @hash_insert(i8* %2, %struct.hash_table* %3, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %item, align 4
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %4, i32 0, i32 2
  %5 = load i8*, i8** %data, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end3
  %6 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data5 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %6, i32 0, i32 2
  %7 = load i8*, i8** %data5, align 4
  %8 = bitcast i8* %7 to %struct._pathdata*
  %path = getelementptr inbounds %struct._pathdata, %struct._pathdata* %8, i32 0, i32 0
  %9 = load i8*, i8** %path, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 107)
  br label %if.end11

if.else:                                          ; preds = %if.end3
  %10 = load i8*, i8** %filename.addr, align 4
  %call6 = call i32 @strlen(i8* %10)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 110)
  %11 = load i8*, i8** %filename.addr, align 4
  %call8 = call i8* @strcpy(i8* %call7, i8* %11)
  %12 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %key = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %12, i32 0, i32 1
  store i8* %call8, i8** %key, align 4
  %call9 = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 111)
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data10 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 2
  store i8* %call9, i8** %data10, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then4
  %14 = load i8*, i8** %full_path.addr, align 4
  %call12 = call i32 @strlen(i8* %14)
  %add13 = add i32 1, %call12
  %call14 = call i8* @sh_xmalloc(i32 %add13, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 113)
  %15 = load i8*, i8** %full_path.addr, align 4
  %call15 = call i8* @strcpy(i8* %call14, i8* %15)
  %16 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data16 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %16, i32 0, i32 2
  %17 = load i8*, i8** %data16, align 4
  %18 = bitcast i8* %17 to %struct._pathdata*
  %path17 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %18, i32 0, i32 0
  store i8* %call15, i8** %path17, align 4
  %19 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data18 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %19, i32 0, i32 2
  %20 = load i8*, i8** %data18, align 4
  %21 = bitcast i8* %20 to %struct._pathdata*
  %flags = getelementptr inbounds %struct._pathdata, %struct._pathdata* %21, i32 0, i32 1
  store i32 0, i32* %flags, align 4
  %22 = load i32, i32* %check_dot.addr, align 4
  %tobool19 = icmp ne i32 %22, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end11
  %23 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data21 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %23, i32 0, i32 2
  %24 = load i8*, i8** %data21, align 4
  %25 = bitcast i8* %24 to %struct._pathdata*
  %flags22 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %25, i32 0, i32 1
  %26 = load i32, i32* %flags22, align 4
  %or = or i32 %26, 2
  store i32 %or, i32* %flags22, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end11
  %27 = load i8*, i8** %full_path.addr, align 4
  %28 = load i8, i8* %27, align 1
  %conv = sext i8 %28 to i32
  %cmp24 = icmp ne i32 %conv, 47
  br i1 %cmp24, label %if.then26, label %if.end30

if.then26:                                        ; preds = %if.end23
  %29 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data27 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %29, i32 0, i32 2
  %30 = load i8*, i8** %data27, align 4
  %31 = bitcast i8* %30 to %struct._pathdata*
  %flags28 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %31, i32 0, i32 1
  %32 = load i32, i32* %flags28, align 4
  %or29 = or i32 %32, 1
  store i32 %or29, i32* %flags28, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then26, %if.end23
  %33 = load i32, i32* %found.addr, align 4
  %34 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %times_found = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %34, i32 0, i32 4
  store i32 %33, i32* %times_found, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then
  ret void
}

declare %struct.bucket_contents* @hash_insert(i8*, %struct.hash_table*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i8* @phash_search(i8* %filename) #0 {
entry:
  %retval = alloca i8*, align 4
  %filename.addr = alloca i8*, align 4
  %item = alloca %struct.bucket_contents*, align 4
  %path = alloca i8*, align 4
  %dotted_filename = alloca i8*, align 4
  %tail = alloca i8*, align 4
  %same = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  %0 = load i32, i32* @hashing_enabled, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %cmp1 = icmp eq %struct.hash_table* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %filename.addr, align 4
  %3 = load %struct.hash_table*, %struct.hash_table** @hashed_filenames, align 4
  %call = call %struct.bucket_contents* @hash_search(i8* %2, %struct.hash_table* %3, i32 0)
  store %struct.bucket_contents* %call, %struct.bucket_contents** %item, align 4
  %4 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %cmp2 = icmp eq %struct.bucket_contents* %4, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %5 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %5, i32 0, i32 2
  %6 = load i8*, i8** %data, align 4
  %7 = bitcast i8* %6 to %struct._pathdata*
  %path5 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %7, i32 0, i32 0
  %8 = load i8*, i8** %path5, align 4
  store i8* %8, i8** %path, align 4
  %9 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data6 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %9, i32 0, i32 2
  %10 = load i8*, i8** %data6, align 4
  %11 = bitcast i8* %10 to %struct._pathdata*
  %flags = getelementptr inbounds %struct._pathdata, %struct._pathdata* %11, i32 0, i32 1
  %12 = load i32, i32* %flags, align 4
  %and = and i32 %12, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then7, label %if.end53

if.then7:                                         ; preds = %if.end4
  %13 = load %struct.bucket_contents*, %struct.bucket_contents** %item, align 4
  %data8 = getelementptr inbounds %struct.bucket_contents, %struct.bucket_contents* %13, i32 0, i32 2
  %14 = load i8*, i8** %data8, align 4
  %15 = bitcast i8* %14 to %struct._pathdata*
  %flags9 = getelementptr inbounds %struct._pathdata, %struct._pathdata* %15, i32 0, i32 1
  %16 = load i32, i32* %flags9, align 4
  %and10 = and i32 %16, 1
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then7
  %17 = load i8*, i8** %path, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then7
  %18 = load i8*, i8** %filename.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %17, %cond.true ], [ %18, %cond.false ]
  store i8* %cond, i8** %tail, align 4
  %19 = load i8*, i8** %tail, align 4
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %20 to i32
  %cmp12 = icmp ne i32 %conv, 46
  br i1 %cmp12, label %if.then19, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %cond.end
  %21 = load i8*, i8** %tail, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %22 to i32
  %cmp17 = icmp ne i32 %conv16, 47
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %lor.lhs.false14, %cond.end
  %23 = load i8*, i8** %tail, align 4
  %call20 = call i32 @strlen(i8* %23)
  %add = add i32 3, %call20
  %call21 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 153)
  store i8* %call21, i8** %dotted_filename, align 4
  %24 = load i8*, i8** %dotted_filename, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %24, i32 0
  store i8 46, i8* %arrayidx22, align 1
  %25 = load i8*, i8** %dotted_filename, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %25, i32 1
  store i8 47, i8* %arrayidx23, align 1
  %26 = load i8*, i8** %dotted_filename, align 4
  %add.ptr = getelementptr inbounds i8, i8* %26, i32 2
  %27 = load i8*, i8** %tail, align 4
  %call24 = call i8* @strcpy(i8* %add.ptr, i8* %27)
  br label %if.end29

if.else:                                          ; preds = %lor.lhs.false14
  %28 = load i8*, i8** %tail, align 4
  %call25 = call i32 @strlen(i8* %28)
  %add26 = add i32 1, %call25
  %call27 = call i8* @sh_xmalloc(i32 %add26, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 158)
  %29 = load i8*, i8** %tail, align 4
  %call28 = call i8* @strcpy(i8* %call27, i8* %29)
  store i8* %call28, i8** %dotted_filename, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then19
  %30 = load i8*, i8** %dotted_filename, align 4
  %call30 = call i32 @executable_file(i8* %30)
  %tobool31 = icmp ne i32 %call30, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end29
  %31 = load i8*, i8** %dotted_filename, align 4
  store i8* %31, i8** %retval, align 4
  br label %return

if.end33:                                         ; preds = %if.end29
  %32 = load i8*, i8** %dotted_filename, align 4
  call void @sh_xfree(i8* %32, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 163)
  %33 = load i8*, i8** %path, align 4
  %34 = load i8, i8* %33, align 1
  %conv34 = sext i8 %34 to i32
  %cmp35 = icmp eq i32 %conv34, 46
  br i1 %cmp35, label %if.then37, label %if.end52

if.then37:                                        ; preds = %if.end33
  store i32 0, i32* %same, align 4
  %35 = load i8*, i8** %path, align 4
  %call38 = call i8* @strrchr(i8* %35, i32 47)
  store i8* %call38, i8** %tail, align 4
  %36 = load i8*, i8** %tail, align 4
  %tobool39 = icmp ne i8* %36, null
  br i1 %tobool39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.then37
  %37 = load i8*, i8** %tail, align 4
  store i8 0, i8* %37, align 1
  %38 = load i8*, i8** %path, align 4
  %call41 = call i32 @same_file(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i8* %38, %struct.stat* null, %struct.stat* null)
  store i32 %call41, i32* %same, align 4
  %39 = load i8*, i8** %tail, align 4
  store i8 47, i8* %39, align 1
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.then37
  %40 = load i32, i32* %same, align 4
  %tobool43 = icmp ne i32 %40, 0
  br i1 %tobool43, label %cond.true44, label %cond.false45

cond.true44:                                      ; preds = %if.end42
  br label %cond.end50

cond.false45:                                     ; preds = %if.end42
  %41 = load i8*, i8** %path, align 4
  %call46 = call i32 @strlen(i8* %41)
  %add47 = add i32 1, %call46
  %call48 = call i8* @sh_xmalloc(i32 %add47, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 191)
  %42 = load i8*, i8** %path, align 4
  %call49 = call i8* @strcpy(i8* %call48, i8* %42)
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false45, %cond.true44
  %cond51 = phi i8* [ null, %cond.true44 ], [ %call49, %cond.false45 ]
  store i8* %cond51, i8** %retval, align 4
  br label %return

if.end52:                                         ; preds = %if.end33
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end4
  %43 = load i8*, i8** %path, align 4
  %call54 = call i32 @strlen(i8* %43)
  %add55 = add i32 1, %call54
  %call56 = call i8* @sh_xmalloc(i32 %add55, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 195)
  %44 = load i8*, i8** %path, align 4
  %call57 = call i8* @strcpy(i8* %call56, i8* %44)
  store i8* %call57, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end53, %cond.end50, %if.then32, %if.then3, %if.then
  %45 = load i8*, i8** %retval, align 4
  ret i8* %45
}

declare %struct.bucket_contents* @hash_search(i8*, %struct.hash_table*, i32) #1

declare i32 @executable_file(i8*) #1

declare i8* @strrchr(i8*, i32) #1

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
