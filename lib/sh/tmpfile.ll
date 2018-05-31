; ModuleID = 'tmpfile.c'
source_filename = "tmpfile.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct._IO_FILE = type opaque

@sh_mktmpname.seeded = internal global i32 0, align 4
@.str = private unnamed_addr constant [10 x i8] c"tmpfile.c\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"shtmp\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"%s/%s.XXXXXX\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"TMPDIR\00", align 1
@tmpnamelen = internal global i32 -1, align 4
@sys_tmpdir = internal global i8* null, align 4
@.str.6 = private unnamed_addr constant [5 x i8] c"/tmp\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"/var/tmp\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"/usr/tmp\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind
define i8* @sh_mktmpname(i8* %nameroot, i32 %flags) #0 {
entry:
  %nameroot.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %filename = alloca i8*, align 4
  %tdir = alloca i8*, align 4
  %lroot = alloca i8*, align 4
  %sb = alloca %struct.stat, align 8
  %r = alloca i32, align 4
  %tdlen = alloca i32, align 4
  store i8* %nameroot, i8** %nameroot.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i8* @sh_xmalloc(i32 4097, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 144)
  store i8* %call, i8** %filename, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %call1 = call i8* @get_tmpdir(i32 %0)
  store i8* %call1, i8** %tdir, align 4
  %1 = load i8*, i8** %tdir, align 4
  %call2 = call i32 @strlen(i8* %1)
  store i32 %call2, i32* %tdlen, align 4
  %2 = load i8*, i8** %nameroot.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** %nameroot.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %3, %cond.true ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %lroot, align 4
  %4 = load i8*, i8** %filename, align 4
  %5 = load i8*, i8** %tdir, align 4
  %6 = load i8*, i8** %lroot, align 4
  %call3 = call i32 (i8*, i8*, ...) @sprintf(i8* %4, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i8* %5, i8* %6)
  %7 = load i8*, i8** %filename, align 4
  %call4 = call i8* @mktemp(i8* %7)
  %cmp = icmp eq i8* %call4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %8 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 154)
  store i8* null, i8** %filename, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %9 = load i8*, i8** %filename, align 4
  ret i8* %9
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @get_tmpdir(i32 %flags) #0 {
entry:
  %flags.addr = alloca i32, align 4
  %tdir = alloca i8*, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0))
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %tdir, align 4
  %1 = load i8*, i8** %tdir, align 4
  %tobool1 = icmp ne i8* %1, null
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %cond.end
  %2 = load i8*, i8** %tdir, align 4
  %call2 = call i32 @file_iswdir(i8* %2)
  %cmp = icmp eq i32 %call2, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %3 = load i8*, i8** %tdir, align 4
  %call3 = call i32 @strlen(i8* %3)
  %cmp4 = icmp ugt i32 %call3, 4096
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  store i8* null, i8** %tdir, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %cond.end
  %4 = load i8*, i8** %tdir, align 4
  %cmp5 = icmp eq i8* %4, null
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %call7 = call i8* @get_sys_tmpdir()
  store i8* %call7, i8** %tdir, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  %5 = load i32, i32* @tmpnamelen, align 4
  %cmp9 = icmp eq i32 %5, -1
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end8
  %6 = load i8*, i8** %tdir, align 4
  %call11 = call i32 @pathconf(i8* %6, i32 3)
  store i32 %call11, i32* @tmpnamelen, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end8
  %7 = load i8*, i8** %tdir, align 4
  ret i8* %7
}

declare i32 @strlen(i8*) #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare i8* @mktemp(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @sh_mktmpfd(i8* %nameroot, i32 %flags, i8** %namep) #0 {
entry:
  %nameroot.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %namep.addr = alloca i8**, align 4
  %filename = alloca i8*, align 4
  %tdir = alloca i8*, align 4
  %lroot = alloca i8*, align 4
  %fd = alloca i32, align 4
  %tdlen = alloca i32, align 4
  store i8* %nameroot, i8** %nameroot.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8** %namep, i8*** %namep.addr, align 4
  %call = call i8* @sh_xmalloc(i32 4097, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 190)
  store i8* %call, i8** %filename, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %call1 = call i8* @get_tmpdir(i32 %0)
  store i8* %call1, i8** %tdir, align 4
  %1 = load i8*, i8** %tdir, align 4
  %call2 = call i32 @strlen(i8* %1)
  store i32 %call2, i32* %tdlen, align 4
  %2 = load i8*, i8** %nameroot.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %3 = load i8*, i8** %nameroot.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %3, %cond.true ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), %cond.false ]
  store i8* %cond, i8** %lroot, align 4
  %4 = load i8*, i8** %filename, align 4
  %5 = load i8*, i8** %tdir, align 4
  %6 = load i8*, i8** %lroot, align 4
  %call3 = call i32 (i8*, i8*, ...) @sprintf(i8* %4, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i8* %5, i8* %6)
  %7 = load i8*, i8** %filename, align 4
  %call4 = call i32 @mkstemp(i8* %7)
  store i32 %call4, i32* %fd, align 4
  %8 = load i32, i32* %fd, align 4
  %cmp = icmp slt i32 %8, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end
  %9 = load i8**, i8*** %namep.addr, align 4
  %cmp5 = icmp eq i8** %9, null
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %cond.end
  %10 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %10, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 201)
  store i8* null, i8** %filename, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %11 = load i8**, i8*** %namep.addr, align 4
  %tobool6 = icmp ne i8** %11, null
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  %12 = load i8*, i8** %filename, align 4
  %13 = load i8**, i8*** %namep.addr, align 4
  store i8* %12, i8** %13, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end
  %14 = load i32, i32* %fd, align 4
  ret i32 %14
}

declare i32 @mkstemp(i8*) #1

; Function Attrs: noinline nounwind
define %struct._IO_FILE* @sh_mktmpfp(i8* %nameroot, i32 %flags, i8** %namep) #0 {
entry:
  %retval = alloca %struct._IO_FILE*, align 4
  %nameroot.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %namep.addr = alloca i8**, align 4
  %fd = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 4
  store i8* %nameroot, i8** %nameroot.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8** %namep, i8*** %namep.addr, align 4
  %0 = load i8*, i8** %nameroot.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  %2 = load i8**, i8*** %namep.addr, align 4
  %call = call i32 @sh_mktmpfd(i8* %0, i32 %1, i8** %2)
  store i32 %call, i32* %fd, align 4
  %3 = load i32, i32* %fd, align 4
  %cmp = icmp slt i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store %struct._IO_FILE* null, %struct._IO_FILE** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %fd, align 4
  %5 = load i32, i32* %flags.addr, align 4
  %and = and i32 %5, 2
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0)
  %call1 = call %struct._IO_FILE* @fdopen(i32 %4, i8* %cond)
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %fp, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %cmp2 = icmp eq %struct._IO_FILE* %6, null
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %fd, align 4
  %call4 = call i32 @close(i32 %7)
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  store %struct._IO_FILE* %8, %struct._IO_FILE** %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %retval, align 4
  ret %struct._IO_FILE* %9
}

declare %struct._IO_FILE* @fdopen(i32, i8*) #1

declare i32 @close(i32) #1

declare i8* @get_string_value(i8*) #1

declare i32 @file_iswdir(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @get_sys_tmpdir() #0 {
entry:
  %retval = alloca i8*, align 4
  %0 = load i8*, i8** @sys_tmpdir, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8** @sys_tmpdir, align 4
  %2 = load i8*, i8** @sys_tmpdir, align 4
  %call = call i32 @file_iswdir(i8* %2)
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %3, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i8** @sys_tmpdir, align 4
  %4 = load i8*, i8** @sys_tmpdir, align 4
  %call4 = call i32 @file_iswdir(i8* %4)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end3
  %5 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %5, i8** %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end3
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i8** @sys_tmpdir, align 4
  %6 = load i8*, i8** @sys_tmpdir, align 4
  %call8 = call i32 @file_iswdir(i8* %6)
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  %7 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end7
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i32 0, i32 0), i8** @sys_tmpdir, align 4
  %8 = load i8*, i8** @sys_tmpdir, align 4
  %call12 = call i32 @file_iswdir(i8* %8)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %9 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %9, i8** %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end11
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8** @sys_tmpdir, align 4
  %10 = load i8*, i8** @sys_tmpdir, align 4
  store i8* %10, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then14, %if.then10, %if.then6, %if.then2, %if.then
  %11 = load i8*, i8** %retval, align 4
  ret i8* %11
}

declare i32 @pathconf(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
