; ModuleID = 'glob.c'
source_filename = "glob.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.globval = type { %struct.globval*, i8* }
%struct.__dirstream = type opaque
%struct.dirent = type { i32, i32, i32, i32, i16, i8, [256 x i8] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.__mbstate_t = type { i32, i32 }

@noglob_dot_filenames = global i32 1, align 4
@glob_ignore_case = global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"glob.c\00", align 1
@glob_error_return = common global i8* null, align 4
@extended_glob = external global i32, align 4
@interrupt_state = external global i32, align 4
@terminating_signal = external global i32, align 4
@finddirs_error_return = internal global %struct.globval zeroinitializer, align 4
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.2 = private unnamed_addr constant [2 x i8] c".\00", align 1

; Function Attrs: noinline nounwind
define i32 @glob_pattern_p(i8* %pattern) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i8*, align 4
  %n = alloca i32, align 4
  %wpattern = alloca i32*, align 4
  %r = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %pattern.addr, align 4
  %call1 = call i32 @internal_glob_pattern_p(i8* %0)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %pattern.addr, align 4
  %call2 = call i32 @xdupmbstowcs(i32** %wpattern, i8*** null, i8* %1)
  store i32 %call2, i32* %n, align 4
  %2 = load i32, i32* %n, align 4
  %cmp3 = icmp eq i32 %2, -1
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %3 = load i8*, i8** %pattern.addr, align 4
  %call5 = call i32 @internal_glob_pattern_p(i8* %3)
  store i32 %call5, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %4 = load i32*, i32** %wpattern, align 4
  %call7 = call i32 @internal_glob_wpattern_p(i32* %4)
  store i32 %call7, i32* %r, align 4
  %5 = load i32*, i32** %wpattern, align 4
  %6 = bitcast i32* %5 to i8*
  call void @sh_xfree(i8* %6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 167)
  %7 = load i32, i32* %r, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then4, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal i32 @internal_glob_pattern_p(i8* %pattern) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  %c = alloca i8, align 1
  %bopen = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  %0 = load i8*, i8** %pattern.addr, align 4
  store i8* %0, i8** %p, align 4
  store i32 0, i32* %bopen, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end10, %if.end, %sw.bb3, %entry
  %1 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %2 = load i8, i8* %1, align 1
  store i8 %2, i8* %c, align 1
  %conv = zext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i8, i8* %c, align 1
  %conv2 = zext i8 %3 to i32
  switch i32 %conv2, label %sw.epilog [
    i32 63, label %sw.bb
    i32 42, label %sw.bb
    i32 91, label %sw.bb3
    i32 93, label %sw.bb4
    i32 43, label %sw.bb5
    i32 64, label %sw.bb5
    i32 33, label %sw.bb5
    i32 92, label %sw.bb11
  ]

sw.bb:                                            ; preds = %while.body, %while.body
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %while.body
  %4 = load i32, i32* %bopen, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %bopen, align 4
  br label %while.cond

sw.bb4:                                           ; preds = %while.body
  %5 = load i32, i32* %bopen, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb4
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb4
  br label %while.cond

sw.bb5:                                           ; preds = %while.body, %while.body, %while.body
  %6 = load i8*, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv6 = zext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 40
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %sw.bb5
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %sw.bb5
  br label %while.cond

sw.bb11:                                          ; preds = %while.body
  %8 = load i8*, i8** %p, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr12, i8** %p, align 4
  %9 = load i8, i8* %8, align 1
  %conv13 = zext i8 %9 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %sw.bb11
  store i32 0, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %sw.bb11
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end17, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then16, %if.then9, %if.then, %sw.bb
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i32 @xdupmbstowcs(i32**, i8***, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @internal_glob_wpattern_p(i32* %pattern) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i32*, align 4
  %p = alloca i32*, align 4
  %c = alloca i32, align 4
  %bopen = alloca i32, align 4
  store i32* %pattern, i32** %pattern.addr, align 4
  %0 = load i32*, i32** %pattern.addr, align 4
  store i32* %0, i32** %p, align 4
  store i32 0, i32* %bopen, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end6, %if.end, %sw.bb1, %entry
  %1 = load i32*, i32** %p, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %1, i32 1
  store i32* %incdec.ptr, i32** %p, align 4
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %c, align 4
  %cmp = icmp ne i32 %2, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %c, align 4
  switch i32 %3, label %sw.epilog [
    i32 63, label %sw.bb
    i32 42, label %sw.bb
    i32 91, label %sw.bb1
    i32 93, label %sw.bb2
    i32 43, label %sw.bb3
    i32 64, label %sw.bb3
    i32 33, label %sw.bb3
    i32 92, label %sw.bb7
  ]

sw.bb:                                            ; preds = %while.body, %while.body
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %while.body
  %4 = load i32, i32* %bopen, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %bopen, align 4
  br label %while.cond

sw.bb2:                                           ; preds = %while.body
  %5 = load i32, i32* %bopen, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb2
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb2
  br label %while.cond

sw.bb3:                                           ; preds = %while.body, %while.body, %while.body
  %6 = load i32*, i32** %p, align 4
  %7 = load i32, i32* %6, align 4
  %cmp4 = icmp eq i32 %7, 40
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %sw.bb3
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %sw.bb3
  br label %while.cond

sw.bb7:                                           ; preds = %while.body
  %8 = load i32*, i32** %p, align 4
  %incdec.ptr8 = getelementptr inbounds i32, i32* %8, i32 1
  store i32* %incdec.ptr8, i32** %p, align 4
  %9 = load i32, i32* %8, align 4
  %cmp9 = icmp eq i32 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %sw.bb7
  store i32 0, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %sw.bb7
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end11, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then10, %if.then5, %if.then, %sw.bb
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8** @glob_vector(i8* %pat, i8* %dir, i32 %flags) #0 {
entry:
  %retval = alloca i8**, align 4
  %pat.addr = alloca i8*, align 4
  %dir.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %d = alloca %struct.__dirstream*, align 4
  %dp = alloca %struct.dirent*, align 4
  %lastlink = alloca %struct.globval*, align 4
  %e = alloca %struct.globval*, align 4
  %dirlist = alloca %struct.globval*, align 4
  %nextlink = alloca %struct.globval*, align 4
  %nextname = alloca i8*, align 4
  %npat = alloca i8*, align 4
  %subdir = alloca i8*, align 4
  %count = alloca i32, align 4
  %lose = alloca i32, align 4
  %skip = alloca i32, align 4
  %ndirs = alloca i32, align 4
  %isdir = alloca i32, align 4
  %sdlen = alloca i32, align 4
  %add_current = alloca i32, align 4
  %patlen = alloca i32, align 4
  %name_vector = alloca i8**, align 4
  %i = alloca i32, align 4
  %mflags = alloca i32, align 4
  %pflags = alloca i32, align 4
  %nalloca = alloca i32, align 4
  %firstmalloc = alloca %struct.globval*, align 4
  %tmplink = alloca %struct.globval*, align 4
  %convfn = alloca i8*, align 4
  %dirlen = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %dir, i8** %dir.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.globval* null, %struct.globval** %lastlink, align 4
  store i32 0, i32* %add_current, align 4
  store i32 0, i32* %skip, align 4
  store i32 0, i32* %lose, align 4
  store i32 0, i32* %count, align 4
  store %struct.globval* null, %struct.globval** %firstmalloc, align 4
  store i32 0, i32* %nalloca, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %pat.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end15

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %dir.addr, align 4
  %call = call i32 @glob_testdir(i8* %3, i32 0)
  %cmp3 = icmp slt i32 %call, 0
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i8** @glob_error_return, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %4 = alloca i8, i32 8, align 8
  %5 = bitcast i8* %4 to %struct.globval*
  store %struct.globval* %5, %struct.globval** %nextlink, align 4
  %6 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %cmp6 = icmp eq %struct.globval* %6, null
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i8** null, i8*** %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end
  %7 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %next = getelementptr inbounds %struct.globval, %struct.globval* %7, i32 0, i32 0
  store %struct.globval* null, %struct.globval** %next, align 4
  %call10 = call i8* @malloc(i32 1)
  store i8* %call10, i8** %nextname, align 4
  %8 = load i8*, i8** %nextname, align 4
  %cmp11 = icmp eq i8* %8, null
  br i1 %cmp11, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.end9
  store i32 1, i32* %lose, align 4
  br label %if.end14

if.else:                                          ; preds = %if.end9
  %9 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %9, %struct.globval** %lastlink, align 4
  %10 = load i8*, i8** %nextname, align 4
  %11 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %name = getelementptr inbounds %struct.globval, %struct.globval* %11, i32 0, i32 1
  store i8* %10, i8** %name, align 4
  %12 = load i8*, i8** %nextname, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 0
  store i8 0, i8* %arrayidx, align 1
  store i32 1, i32* %count, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then13
  store i32 1, i32* %skip, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %lor.lhs.false
  %13 = load i8*, i8** %pat.addr, align 4
  %tobool = icmp ne i8* %13, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end15
  %14 = load i8*, i8** %pat.addr, align 4
  %15 = load i8, i8* %14, align 1
  %conv16 = sext i8 %15 to i32
  %tobool17 = icmp ne i32 %conv16, 0
  br i1 %tobool17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %16 = load i8*, i8** %pat.addr, align 4
  %call18 = call i32 @strlen(i8* %16)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.end15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call18, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %patlen, align 4
  %17 = load i32, i32* %skip, align 4
  %cmp19 = icmp eq i32 %17, 0
  br i1 %cmp19, label %land.lhs.true21, label %if.end68

land.lhs.true21:                                  ; preds = %cond.end
  %18 = load i8*, i8** %pat.addr, align 4
  %call22 = call i32 @glob_pattern_p(i8* %18)
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then25, label %if.end68

if.then25:                                        ; preds = %land.lhs.true21
  %19 = load i8*, i8** %dir.addr, align 4
  %call26 = call i32 @glob_testdir(i8* %19, i32 0)
  %cmp27 = icmp slt i32 %call26, 0
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.then25
  store i8** @glob_error_return, i8*** %retval, align 4
  br label %return

if.end30:                                         ; preds = %if.then25
  %20 = load i8*, i8** %dir.addr, align 4
  %call31 = call i32 @strlen(i8* %20)
  store i32 %call31, i32* %dirlen, align 4
  %21 = load i32, i32* %dirlen, align 4
  %22 = load i32, i32* %patlen, align 4
  %add = add nsw i32 %21, %22
  %add32 = add nsw i32 %add, 2
  %call33 = call i8* @malloc(i32 %add32)
  store i8* %call33, i8** %nextname, align 4
  %23 = load i32, i32* %patlen, align 4
  %add34 = add nsw i32 %23, 1
  %call35 = call i8* @malloc(i32 %add34)
  store i8* %call35, i8** %npat, align 4
  %24 = load i8*, i8** %nextname, align 4
  %cmp36 = icmp eq i8* %24, null
  br i1 %cmp36, label %if.then41, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.end30
  %25 = load i8*, i8** %npat, align 4
  %cmp39 = icmp eq i8* %25, null
  br i1 %cmp39, label %if.then41, label %if.else50

if.then41:                                        ; preds = %lor.lhs.false38, %if.end30
  br label %do.body

do.body:                                          ; preds = %if.then41
  %26 = load i8*, i8** %nextname, align 4
  %tobool42 = icmp ne i8* %26, null
  br i1 %tobool42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %do.body
  %27 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 638)
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end44
  br label %do.body45

do.body45:                                        ; preds = %do.end
  %28 = load i8*, i8** %npat, align 4
  %tobool46 = icmp ne i8* %28, null
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %do.body45
  %29 = load i8*, i8** %npat, align 4
  call void @sh_xfree(i8* %29, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 639)
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %do.body45
  br label %do.end49

do.end49:                                         ; preds = %if.end48
  store i32 1, i32* %lose, align 4
  br label %if.end67

if.else50:                                        ; preds = %lor.lhs.false38
  %30 = load i8*, i8** %npat, align 4
  %31 = load i8*, i8** %pat.addr, align 4
  %call51 = call i8* @strcpy(i8* %30, i8* %31)
  %32 = load i8*, i8** %npat, align 4
  call void @dequote_pathname(i8* %32)
  %33 = load i8*, i8** %nextname, align 4
  %34 = load i8*, i8** %dir.addr, align 4
  %call52 = call i8* @strcpy(i8* %33, i8* %34)
  %35 = load i8*, i8** %nextname, align 4
  %36 = load i32, i32* %dirlen, align 4
  %inc = add nsw i32 %36, 1
  store i32 %inc, i32* %dirlen, align 4
  %arrayidx53 = getelementptr inbounds i8, i8* %35, i32 %36
  store i8 47, i8* %arrayidx53, align 1
  %37 = load i8*, i8** %nextname, align 4
  %38 = load i32, i32* %dirlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8*, i8** %npat, align 4
  %call54 = call i8* @strcpy(i8* %add.ptr, i8* %39)
  %40 = load i8*, i8** %nextname, align 4
  %call55 = call i32 @lstat(i8* %40, %struct.stat* %finfo)
  %cmp56 = icmp sge i32 %call55, 0
  br i1 %cmp56, label %if.then58, label %if.else65

if.then58:                                        ; preds = %if.else50
  %41 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %41, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 653)
  %42 = alloca i8, i32 8, align 8
  %43 = bitcast i8* %42 to %struct.globval*
  store %struct.globval* %43, %struct.globval** %nextlink, align 4
  %44 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %tobool59 = icmp ne %struct.globval* %44, null
  br i1 %tobool59, label %if.then60, label %if.else63

if.then60:                                        ; preds = %if.then58
  %45 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %next61 = getelementptr inbounds %struct.globval, %struct.globval* %45, i32 0, i32 0
  store %struct.globval* null, %struct.globval** %next61, align 4
  %46 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %46, %struct.globval** %lastlink, align 4
  %47 = load i8*, i8** %npat, align 4
  %48 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %name62 = getelementptr inbounds %struct.globval, %struct.globval* %48, i32 0, i32 1
  store i8* %47, i8** %name62, align 4
  store i32 1, i32* %count, align 4
  br label %if.end64

if.else63:                                        ; preds = %if.then58
  %49 = load i8*, i8** %npat, align 4
  call void @sh_xfree(i8* %49, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 664)
  store i32 1, i32* %lose, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else63, %if.then60
  br label %if.end66

if.else65:                                        ; preds = %if.else50
  %50 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %50, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 670)
  %51 = load i8*, i8** %npat, align 4
  call void @sh_xfree(i8* %51, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 671)
  br label %if.end66

if.end66:                                         ; preds = %if.else65, %if.end64
  br label %if.end67

if.end67:                                         ; preds = %if.end66, %do.end49
  store i32 1, i32* %skip, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %land.lhs.true21, %cond.end
  %52 = load i32, i32* %skip, align 4
  %cmp69 = icmp eq i32 %52, 0
  br i1 %cmp69, label %if.then71, label %if.end259

if.then71:                                        ; preds = %if.end68
  %53 = load i8*, i8** %dir.addr, align 4
  %call72 = call %struct.__dirstream* @opendir(i8* %53)
  store %struct.__dirstream* %call72, %struct.__dirstream** %d, align 4
  %54 = load %struct.__dirstream*, %struct.__dirstream** %d, align 4
  %cmp73 = icmp eq %struct.__dirstream* %54, null
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.then71
  store i8** @glob_error_return, i8*** %retval, align 4
  br label %return

if.end76:                                         ; preds = %if.then71
  %55 = load i32, i32* @noglob_dot_filenames, align 4
  %tobool77 = icmp ne i32 %55, 0
  %cond78 = select i1 %tobool77, i32 4, i32 0
  %or = or i32 %cond78, 1
  store i32 %or, i32* %mflags, align 4
  %56 = load i32, i32* @glob_ignore_case, align 4
  %tobool79 = icmp ne i32 %56, 0
  br i1 %tobool79, label %if.then80, label %if.end82

if.then80:                                        ; preds = %if.end76
  %57 = load i32, i32* %mflags, align 4
  %or81 = or i32 %57, 16
  store i32 %or81, i32* %mflags, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then80, %if.end76
  %58 = load i32, i32* @extended_glob, align 4
  %tobool83 = icmp ne i32 %58, 0
  br i1 %tobool83, label %if.then84, label %if.end86

if.then84:                                        ; preds = %if.end82
  %59 = load i32, i32* %mflags, align 4
  %or85 = or i32 %59, 32
  store i32 %or85, i32* %mflags, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.then84, %if.end82
  %60 = load i32, i32* %flags.addr, align 4
  %and = and i32 %60, 528
  %cmp87 = icmp eq i32 %and, 528
  %conv88 = zext i1 %cmp87 to i32
  store i32 %conv88, i32* %add_current, align 4
  br label %while.body

while.body:                                       ; preds = %if.end86, %if.then108, %if.then116, %if.then122, %if.then145, %if.end194, %if.end257
  %61 = load volatile i32, i32* @interrupt_state, align 4
  %tobool89 = icmp ne i32 %61, 0
  br i1 %tobool89, label %if.then92, label %lor.lhs.false90

lor.lhs.false90:                                  ; preds = %while.body
  %62 = load volatile i32, i32* @terminating_signal, align 4
  %tobool91 = icmp ne i32 %62, 0
  br i1 %tobool91, label %if.then92, label %if.else93

if.then92:                                        ; preds = %lor.lhs.false90, %while.body
  store i32 1, i32* %lose, align 4
  br label %while.end

if.else93:                                        ; preds = %lor.lhs.false90
  %call94 = call i32 @signal_is_pending(i32 2)
  %tobool95 = icmp ne i32 %call94, 0
  br i1 %tobool95, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.else93
  store i32 1, i32* %lose, align 4
  br label %while.end

if.end97:                                         ; preds = %if.else93
  br label %if.end98

if.end98:                                         ; preds = %if.end97
  %63 = load %struct.__dirstream*, %struct.__dirstream** %d, align 4
  %call99 = call %struct.dirent* @readdir(%struct.__dirstream* %63)
  store %struct.dirent* %call99, %struct.dirent** %dp, align 4
  %64 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %cmp100 = icmp eq %struct.dirent* %64, null
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end98
  br label %while.end

if.end103:                                        ; preds = %if.end98
  %65 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_ino = getelementptr inbounds %struct.dirent, %struct.dirent* %65, i32 0, i32 0
  %66 = load i32, i32* %d_ino, align 4
  %cmp104 = icmp ne i32 %66, 0
  %conv105 = zext i1 %cmp104 to i32
  %cmp106 = icmp eq i32 %conv105, 0
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %if.end103
  br label %while.body

if.end109:                                        ; preds = %if.end103
  %call110 = call i32 @__ctype_get_mb_cur_max()
  %cmp111 = icmp ugt i32 %call110, 1
  br i1 %cmp111, label %land.lhs.true113, label %if.else117

land.lhs.true113:                                 ; preds = %if.end109
  %67 = load i8*, i8** %pat.addr, align 4
  %68 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name = getelementptr inbounds %struct.dirent, %struct.dirent* %68, i32 0, i32 6
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %d_name, i32 0, i32 0
  %69 = load i32, i32* %flags.addr, align 4
  %call114 = call i32 @mbskipname(i8* %67, i8* %arraydecay, i32 %69)
  %tobool115 = icmp ne i32 %call114, 0
  br i1 %tobool115, label %if.then116, label %if.else117

if.then116:                                       ; preds = %land.lhs.true113
  br label %while.body

if.else117:                                       ; preds = %land.lhs.true113, %if.end109
  %70 = load i8*, i8** %pat.addr, align 4
  %71 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name118 = getelementptr inbounds %struct.dirent, %struct.dirent* %71, i32 0, i32 6
  %arraydecay119 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name118, i32 0, i32 0
  %72 = load i32, i32* %flags.addr, align 4
  %call120 = call i32 @skipname(i8* %70, i8* %arraydecay119, i32 %72)
  %tobool121 = icmp ne i32 %call120, 0
  br i1 %tobool121, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.else117
  br label %while.body

if.end123:                                        ; preds = %if.else117
  br label %if.end124

if.end124:                                        ; preds = %if.end123
  %73 = load i32, i32* %flags.addr, align 4
  %and125 = and i32 %73, 24
  %tobool126 = icmp ne i32 %and125, 0
  br i1 %tobool126, label %if.then127, label %if.end147

if.then127:                                       ; preds = %if.end124
  %74 = load i32, i32* %flags.addr, align 4
  %and128 = and i32 %74, 16
  %tobool129 = icmp ne i32 %and128, 0
  %cond130 = select i1 %tobool129, i32 4, i32 0
  store i32 %cond130, i32* %pflags, align 4
  %75 = load i32, i32* %flags.addr, align 4
  %and131 = and i32 %75, 256
  %tobool132 = icmp ne i32 %and131, 0
  br i1 %tobool132, label %if.then133, label %if.end135

if.then133:                                       ; preds = %if.then127
  %76 = load i32, i32* %pflags, align 4
  %or134 = or i32 %76, 8
  store i32 %or134, i32* %pflags, align 4
  br label %if.end135

if.end135:                                        ; preds = %if.then133, %if.then127
  %77 = load i8*, i8** %dir.addr, align 4
  %78 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name136 = getelementptr inbounds %struct.dirent, %struct.dirent* %78, i32 0, i32 6
  %arraydecay137 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name136, i32 0, i32 0
  %79 = load i32, i32* %pflags, align 4
  %call138 = call i8* @sh_makepath(i8* %77, i8* %arraydecay137, i32 %79)
  store i8* %call138, i8** %subdir, align 4
  %80 = load i8*, i8** %subdir, align 4
  %81 = load i32, i32* %flags.addr, align 4
  %call139 = call i32 @glob_testdir(i8* %80, i32 %81)
  store i32 %call139, i32* %isdir, align 4
  %82 = load i32, i32* %isdir, align 4
  %cmp140 = icmp slt i32 %82, 0
  br i1 %cmp140, label %land.lhs.true142, label %if.end146

land.lhs.true142:                                 ; preds = %if.end135
  %83 = load i32, i32* %flags.addr, align 4
  %and143 = and i32 %83, 8
  %tobool144 = icmp ne i32 %and143, 0
  br i1 %tobool144, label %if.then145, label %if.end146

if.then145:                                       ; preds = %land.lhs.true142
  %84 = load i8*, i8** %subdir, align 4
  call void @sh_xfree(i8* %84, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 755)
  br label %while.body

if.end146:                                        ; preds = %land.lhs.true142, %if.end135
  br label %if.end147

if.end147:                                        ; preds = %if.end146, %if.end124
  %85 = load i32, i32* %flags.addr, align 4
  %and148 = and i32 %85, 16
  %tobool149 = icmp ne i32 %and148, 0
  br i1 %tobool149, label %if.then150, label %if.else199

if.then150:                                       ; preds = %if.end147
  %86 = load i32, i32* %isdir, align 4
  %cmp151 = icmp eq i32 %86, 0
  br i1 %cmp151, label %if.then153, label %if.end169

if.then153:                                       ; preds = %if.then150
  %87 = load i8*, i8** %pat.addr, align 4
  %88 = load i8*, i8** %subdir, align 4
  %89 = load i32, i32* %flags.addr, align 4
  %and154 = and i32 %89, -513
  %call155 = call %struct.globval* @finddirs(i8* %87, i8* %88, i32 %and154, %struct.globval** %e, i32* %ndirs)
  store %struct.globval* %call155, %struct.globval** %dirlist, align 4
  %90 = load %struct.globval*, %struct.globval** %dirlist, align 4
  %cmp156 = icmp eq %struct.globval* %90, @finddirs_error_return
  br i1 %cmp156, label %if.then158, label %if.end159

if.then158:                                       ; preds = %if.then153
  %91 = load i8*, i8** %subdir, align 4
  call void @sh_xfree(i8* %91, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 767)
  store i32 1, i32* %lose, align 4
  br label %while.end

if.end159:                                        ; preds = %if.then153
  %92 = load i32, i32* %ndirs, align 4
  %tobool160 = icmp ne i32 %92, 0
  br i1 %tobool160, label %if.then161, label %if.end168

if.then161:                                       ; preds = %if.end159
  %93 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %cmp162 = icmp eq %struct.globval* %93, null
  br i1 %cmp162, label %if.then164, label %if.end165

if.then164:                                       ; preds = %if.then161
  %94 = load %struct.globval*, %struct.globval** %e, align 4
  store %struct.globval* %94, %struct.globval** %firstmalloc, align 4
  br label %if.end165

if.end165:                                        ; preds = %if.then164, %if.then161
  %95 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %96 = load %struct.globval*, %struct.globval** %e, align 4
  %next166 = getelementptr inbounds %struct.globval, %struct.globval* %96, i32 0, i32 0
  store %struct.globval* %95, %struct.globval** %next166, align 4
  %97 = load %struct.globval*, %struct.globval** %dirlist, align 4
  store %struct.globval* %97, %struct.globval** %lastlink, align 4
  %98 = load i32, i32* %ndirs, align 4
  %99 = load i32, i32* %count, align 4
  %add167 = add i32 %99, %98
  store i32 %add167, i32* %count, align 4
  br label %if.end168

if.end168:                                        ; preds = %if.end165, %if.end159
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %if.then150
  %call170 = call i8* @malloc(i32 8)
  %100 = bitcast i8* %call170 to %struct.globval*
  store %struct.globval* %100, %struct.globval** %nextlink, align 4
  %101 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %cmp171 = icmp eq %struct.globval* %101, null
  br i1 %cmp171, label %if.then173, label %if.end174

if.then173:                                       ; preds = %if.end169
  %102 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %102, %struct.globval** %firstmalloc, align 4
  br label %if.end174

if.end174:                                        ; preds = %if.then173, %if.end169
  %103 = load i8*, i8** %subdir, align 4
  %call175 = call i32 @strlen(i8* %103)
  store i32 %call175, i32* %sdlen, align 4
  %104 = load i32, i32* %sdlen, align 4
  %add176 = add nsw i32 %104, 1
  %call177 = call i8* @malloc(i32 %add176)
  store i8* %call177, i8** %nextname, align 4
  %105 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %cmp178 = icmp eq %struct.globval* %105, null
  br i1 %cmp178, label %if.then183, label %lor.lhs.false180

lor.lhs.false180:                                 ; preds = %if.end174
  %106 = load i8*, i8** %nextname, align 4
  %cmp181 = icmp eq i8* %106, null
  br i1 %cmp181, label %if.then183, label %if.end194

if.then183:                                       ; preds = %lor.lhs.false180, %if.end174
  br label %do.body184

do.body184:                                       ; preds = %if.then183
  %107 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %tobool185 = icmp ne %struct.globval* %107, null
  br i1 %tobool185, label %if.then186, label %if.end187

if.then186:                                       ; preds = %do.body184
  %108 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %109 = bitcast %struct.globval* %108 to i8*
  call void @sh_xfree(i8* %109, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 788)
  br label %if.end187

if.end187:                                        ; preds = %if.then186, %do.body184
  br label %do.end188

do.end188:                                        ; preds = %if.end187
  br label %do.body189

do.body189:                                       ; preds = %do.end188
  %110 = load i8*, i8** %nextname, align 4
  %tobool190 = icmp ne i8* %110, null
  br i1 %tobool190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %do.body189
  %111 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %111, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 789)
  br label %if.end192

if.end192:                                        ; preds = %if.then191, %do.body189
  br label %do.end193

do.end193:                                        ; preds = %if.end192
  %112 = load i8*, i8** %subdir, align 4
  call void @sh_xfree(i8* %112, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 790)
  store i32 1, i32* %lose, align 4
  br label %while.end

if.end194:                                        ; preds = %lor.lhs.false180
  %113 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %114 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %next195 = getelementptr inbounds %struct.globval, %struct.globval* %114, i32 0, i32 0
  store %struct.globval* %113, %struct.globval** %next195, align 4
  %115 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %115, %struct.globval** %lastlink, align 4
  %116 = load i8*, i8** %nextname, align 4
  %117 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %name196 = getelementptr inbounds %struct.globval, %struct.globval* %117, i32 0, i32 1
  store i8* %116, i8** %name196, align 4
  %118 = load i8*, i8** %subdir, align 4
  %119 = load i8*, i8** %nextname, align 4
  %120 = load i32, i32* %sdlen, align 4
  %add197 = add nsw i32 %120, 1
  call void @bcopy(i8* %118, i8* %119, i32 %add197)
  %121 = load i8*, i8** %subdir, align 4
  call void @sh_xfree(i8* %121, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 798)
  %122 = load i32, i32* %count, align 4
  %inc198 = add i32 %122, 1
  store i32 %inc198, i32* %count, align 4
  br label %while.body

if.else199:                                       ; preds = %if.end147
  %123 = load i32, i32* %flags.addr, align 4
  %and200 = and i32 %123, 8
  %tobool201 = icmp ne i32 %and200, 0
  br i1 %tobool201, label %if.then202, label %if.end203

if.then202:                                       ; preds = %if.else199
  %124 = load i8*, i8** %subdir, align 4
  call void @sh_xfree(i8* %124, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 803)
  br label %if.end203

if.end203:                                        ; preds = %if.then202, %if.else199
  br label %if.end204

if.end204:                                        ; preds = %if.end203
  %125 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name205 = getelementptr inbounds %struct.dirent, %struct.dirent* %125, i32 0, i32 6
  %arraydecay206 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name205, i32 0, i32 0
  %126 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name207 = getelementptr inbounds %struct.dirent, %struct.dirent* %126, i32 0, i32 6
  %arraydecay208 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name207, i32 0, i32 0
  %call209 = call i32 @strlen(i8* %arraydecay208)
  %call210 = call i8* @fnx_fromfs(i8* %arraydecay206, i32 %call209)
  store i8* %call210, i8** %convfn, align 4
  %127 = load i8*, i8** %pat.addr, align 4
  %128 = load i8*, i8** %convfn, align 4
  %129 = load i32, i32* %mflags, align 4
  %call211 = call i32 @strmatch(i8* %127, i8* %128, i32 %129)
  %cmp212 = icmp ne i32 %call211, 1
  br i1 %cmp212, label %if.then214, label %if.end257

if.then214:                                       ; preds = %if.end204
  %130 = load i32, i32* %nalloca, align 4
  %cmp215 = icmp slt i32 %130, 100000
  br i1 %cmp215, label %if.then217, label %if.else219

if.then217:                                       ; preds = %if.then214
  %131 = alloca i8, i32 8, align 8
  %132 = bitcast i8* %131 to %struct.globval*
  store %struct.globval* %132, %struct.globval** %nextlink, align 4
  %133 = load i32, i32* %nalloca, align 4
  %add218 = add i32 %133, 8
  store i32 %add218, i32* %nalloca, align 4
  br label %if.end225

if.else219:                                       ; preds = %if.then214
  %call220 = call i8* @malloc(i32 8)
  %134 = bitcast i8* %call220 to %struct.globval*
  store %struct.globval* %134, %struct.globval** %nextlink, align 4
  %135 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %cmp221 = icmp eq %struct.globval* %135, null
  br i1 %cmp221, label %if.then223, label %if.end224

if.then223:                                       ; preds = %if.else219
  %136 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %136, %struct.globval** %firstmalloc, align 4
  br label %if.end224

if.end224:                                        ; preds = %if.then223, %if.else219
  br label %if.end225

if.end225:                                        ; preds = %if.end224, %if.then217
  %137 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name226 = getelementptr inbounds %struct.dirent, %struct.dirent* %137, i32 0, i32 6
  %arraydecay227 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name226, i32 0, i32 0
  %call228 = call i32 @strlen(i8* %arraydecay227)
  %add229 = add i32 %call228, 1
  %call230 = call i8* @malloc(i32 %add229)
  store i8* %call230, i8** %nextname, align 4
  %138 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %cmp231 = icmp eq %struct.globval* %138, null
  br i1 %cmp231, label %if.then236, label %lor.lhs.false233

lor.lhs.false233:                                 ; preds = %if.end225
  %139 = load i8*, i8** %nextname, align 4
  %cmp234 = icmp eq i8* %139, null
  br i1 %cmp234, label %if.then236, label %if.end247

if.then236:                                       ; preds = %lor.lhs.false233, %if.end225
  br label %do.body237

do.body237:                                       ; preds = %if.then236
  %140 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %tobool238 = icmp ne %struct.globval* %140, null
  br i1 %tobool238, label %if.then239, label %if.end240

if.then239:                                       ; preds = %do.body237
  %141 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %142 = bitcast %struct.globval* %141 to i8*
  call void @sh_xfree(i8* %142, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 823)
  br label %if.end240

if.end240:                                        ; preds = %if.then239, %do.body237
  br label %do.end241

do.end241:                                        ; preds = %if.end240
  br label %do.body242

do.body242:                                       ; preds = %do.end241
  %143 = load i8*, i8** %nextname, align 4
  %tobool243 = icmp ne i8* %143, null
  br i1 %tobool243, label %if.then244, label %if.end245

if.then244:                                       ; preds = %do.body242
  %144 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %144, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 824)
  br label %if.end245

if.end245:                                        ; preds = %if.then244, %do.body242
  br label %do.end246

do.end246:                                        ; preds = %if.end245
  store i32 1, i32* %lose, align 4
  br label %while.end

if.end247:                                        ; preds = %lor.lhs.false233
  %145 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %146 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %next248 = getelementptr inbounds %struct.globval, %struct.globval* %146, i32 0, i32 0
  store %struct.globval* %145, %struct.globval** %next248, align 4
  %147 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %147, %struct.globval** %lastlink, align 4
  %148 = load i8*, i8** %nextname, align 4
  %149 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %name249 = getelementptr inbounds %struct.globval, %struct.globval* %149, i32 0, i32 1
  store i8* %148, i8** %name249, align 4
  %150 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name250 = getelementptr inbounds %struct.dirent, %struct.dirent* %150, i32 0, i32 6
  %arraydecay251 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name250, i32 0, i32 0
  %151 = load i8*, i8** %nextname, align 4
  %152 = load %struct.dirent*, %struct.dirent** %dp, align 4
  %d_name252 = getelementptr inbounds %struct.dirent, %struct.dirent* %152, i32 0, i32 6
  %arraydecay253 = getelementptr inbounds [256 x i8], [256 x i8]* %d_name252, i32 0, i32 0
  %call254 = call i32 @strlen(i8* %arraydecay253)
  %add255 = add i32 %call254, 1
  call void @bcopy(i8* %arraydecay251, i8* %151, i32 %add255)
  %153 = load i32, i32* %count, align 4
  %inc256 = add i32 %153, 1
  store i32 %inc256, i32* %count, align 4
  br label %if.end257

if.end257:                                        ; preds = %if.end247, %if.end204
  br label %while.body

while.end:                                        ; preds = %do.end246, %do.end193, %if.then158, %if.then102, %if.then96, %if.then92
  %154 = load %struct.__dirstream*, %struct.__dirstream** %d, align 4
  %call258 = call i32 @closedir(%struct.__dirstream* %154)
  br label %if.end259

if.end259:                                        ; preds = %while.end, %if.end68
  %155 = load i32, i32* %add_current, align 4
  %tobool260 = icmp ne i32 %155, 0
  br i1 %tobool260, label %if.then261, label %if.end294

if.then261:                                       ; preds = %if.end259
  %156 = load i8*, i8** %dir.addr, align 4
  %call262 = call i32 @strlen(i8* %156)
  store i32 %call262, i32* %sdlen, align 4
  %157 = load i32, i32* %sdlen, align 4
  %add263 = add nsw i32 %157, 1
  %call264 = call i8* @malloc(i32 %add263)
  store i8* %call264, i8** %nextname, align 4
  %call265 = call i8* @malloc(i32 8)
  %158 = bitcast i8* %call265 to %struct.globval*
  store %struct.globval* %158, %struct.globval** %nextlink, align 4
  %159 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %cmp266 = icmp eq %struct.globval* %159, null
  br i1 %cmp266, label %if.then271, label %lor.lhs.false268

lor.lhs.false268:                                 ; preds = %if.then261
  %160 = load i8*, i8** %nextname, align 4
  %cmp269 = icmp eq i8* %160, null
  br i1 %cmp269, label %if.then271, label %if.else282

if.then271:                                       ; preds = %lor.lhs.false268, %if.then261
  br label %do.body272

do.body272:                                       ; preds = %if.then271
  %161 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %tobool273 = icmp ne %struct.globval* %161, null
  br i1 %tobool273, label %if.then274, label %if.end275

if.then274:                                       ; preds = %do.body272
  %162 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %163 = bitcast %struct.globval* %162 to i8*
  call void @sh_xfree(i8* %163, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 849)
  br label %if.end275

if.end275:                                        ; preds = %if.then274, %do.body272
  br label %do.end276

do.end276:                                        ; preds = %if.end275
  br label %do.body277

do.body277:                                       ; preds = %do.end276
  %164 = load i8*, i8** %nextname, align 4
  %tobool278 = icmp ne i8* %164, null
  br i1 %tobool278, label %if.then279, label %if.end280

if.then279:                                       ; preds = %do.body277
  %165 = load i8*, i8** %nextname, align 4
  call void @sh_xfree(i8* %165, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 850)
  br label %if.end280

if.end280:                                        ; preds = %if.then279, %do.body277
  br label %do.end281

do.end281:                                        ; preds = %if.end280
  store i32 1, i32* %lose, align 4
  br label %if.end293

if.else282:                                       ; preds = %lor.lhs.false268
  %166 = load i8*, i8** %nextname, align 4
  %167 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %name283 = getelementptr inbounds %struct.globval, %struct.globval* %167, i32 0, i32 1
  store i8* %166, i8** %name283, align 4
  %168 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %169 = load %struct.globval*, %struct.globval** %nextlink, align 4
  %next284 = getelementptr inbounds %struct.globval, %struct.globval* %169, i32 0, i32 0
  store %struct.globval* %168, %struct.globval** %next284, align 4
  %170 = load %struct.globval*, %struct.globval** %nextlink, align 4
  store %struct.globval* %170, %struct.globval** %lastlink, align 4
  %171 = load i32, i32* %flags.addr, align 4
  %and285 = and i32 %171, 256
  %tobool286 = icmp ne i32 %and285, 0
  br i1 %tobool286, label %if.then287, label %if.else289

if.then287:                                       ; preds = %if.else282
  %172 = load i8*, i8** %nextname, align 4
  %arrayidx288 = getelementptr inbounds i8, i8* %172, i32 0
  store i8 0, i8* %arrayidx288, align 1
  br label %if.end291

if.else289:                                       ; preds = %if.else282
  %173 = load i8*, i8** %dir.addr, align 4
  %174 = load i8*, i8** %nextname, align 4
  %175 = load i32, i32* %sdlen, align 4
  %add290 = add nsw i32 %175, 1
  call void @bcopy(i8* %173, i8* %174, i32 %add290)
  br label %if.end291

if.end291:                                        ; preds = %if.else289, %if.then287
  %176 = load i32, i32* %count, align 4
  %inc292 = add i32 %176, 1
  store i32 %inc292, i32* %count, align 4
  br label %if.end293

if.end293:                                        ; preds = %if.end291, %do.end281
  br label %if.end294

if.end294:                                        ; preds = %if.end293, %if.end259
  %177 = load i32, i32* %lose, align 4
  %cmp295 = icmp eq i32 %177, 0
  br i1 %cmp295, label %if.then297, label %if.end303

if.then297:                                       ; preds = %if.end294
  %178 = load i32, i32* %count, align 4
  %add298 = add i32 %178, 1
  %mul = mul i32 %add298, 4
  %call299 = call i8* @malloc(i32 %mul)
  %179 = bitcast i8* %call299 to i8**
  store i8** %179, i8*** %name_vector, align 4
  %180 = load i8**, i8*** %name_vector, align 4
  %cmp300 = icmp eq i8** %180, null
  %conv301 = zext i1 %cmp300 to i32
  %181 = load i32, i32* %lose, align 4
  %or302 = or i32 %181, %conv301
  store i32 %or302, i32* %lose, align 4
  br label %if.end303

if.end303:                                        ; preds = %if.then297, %if.end294
  %182 = load i32, i32* %lose, align 4
  %tobool304 = icmp ne i32 %182, 0
  br i1 %tobool304, label %if.then305, label %if.end324

if.then305:                                       ; preds = %if.end303
  store %struct.globval* null, %struct.globval** %tmplink, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end322, %if.then305
  %183 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %tobool306 = icmp ne %struct.globval* %183, null
  br i1 %tobool306, label %while.body307, label %while.end323

while.body307:                                    ; preds = %while.cond
  %184 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %tobool308 = icmp ne %struct.globval* %184, null
  br i1 %tobool308, label %if.then309, label %if.else314

if.then309:                                       ; preds = %while.body307
  %185 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %186 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %cmp310 = icmp eq %struct.globval* %185, %186
  br i1 %cmp310, label %if.then312, label %if.end313

if.then312:                                       ; preds = %if.then309
  store %struct.globval* null, %struct.globval** %firstmalloc, align 4
  br label %if.end313

if.end313:                                        ; preds = %if.then312, %if.then309
  %187 = load %struct.globval*, %struct.globval** %lastlink, align 4
  store %struct.globval* %187, %struct.globval** %tmplink, align 4
  br label %if.end315

if.else314:                                       ; preds = %while.body307
  store %struct.globval* null, %struct.globval** %tmplink, align 4
  br label %if.end315

if.end315:                                        ; preds = %if.else314, %if.end313
  %188 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %name316 = getelementptr inbounds %struct.globval, %struct.globval* %188, i32 0, i32 1
  %189 = load i8*, i8** %name316, align 4
  call void @sh_xfree(i8* %189, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 891)
  %190 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %next317 = getelementptr inbounds %struct.globval, %struct.globval* %190, i32 0, i32 0
  %191 = load %struct.globval*, %struct.globval** %next317, align 4
  store %struct.globval* %191, %struct.globval** %lastlink, align 4
  br label %do.body318

do.body318:                                       ; preds = %if.end315
  %192 = load %struct.globval*, %struct.globval** %tmplink, align 4
  %tobool319 = icmp ne %struct.globval* %192, null
  br i1 %tobool319, label %if.then320, label %if.end321

if.then320:                                       ; preds = %do.body318
  %193 = load %struct.globval*, %struct.globval** %tmplink, align 4
  %194 = bitcast %struct.globval* %193 to i8*
  call void @sh_xfree(i8* %194, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 893)
  br label %if.end321

if.end321:                                        ; preds = %if.then320, %do.body318
  br label %do.end322

do.end322:                                        ; preds = %if.end321
  br label %while.cond

while.end323:                                     ; preds = %while.cond
  store i8** null, i8*** %retval, align 4
  br label %return

if.end324:                                        ; preds = %if.end303
  %195 = load %struct.globval*, %struct.globval** %lastlink, align 4
  store %struct.globval* %195, %struct.globval** %tmplink, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end324
  %196 = load i32, i32* %i, align 4
  %197 = load i32, i32* %count, align 4
  %cmp325 = icmp ult i32 %196, %197
  br i1 %cmp325, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %198 = load %struct.globval*, %struct.globval** %tmplink, align 4
  %name327 = getelementptr inbounds %struct.globval, %struct.globval* %198, i32 0, i32 1
  %199 = load i8*, i8** %name327, align 4
  %200 = load i8**, i8*** %name_vector, align 4
  %201 = load i32, i32* %i, align 4
  %arrayidx328 = getelementptr inbounds i8*, i8** %200, i32 %201
  store i8* %199, i8** %arrayidx328, align 4
  %202 = load %struct.globval*, %struct.globval** %tmplink, align 4
  %next329 = getelementptr inbounds %struct.globval, %struct.globval* %202, i32 0, i32 0
  %203 = load %struct.globval*, %struct.globval** %next329, align 4
  store %struct.globval* %203, %struct.globval** %tmplink, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %204 = load i32, i32* %i, align 4
  %inc330 = add i32 %204, 1
  store i32 %inc330, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %205 = load i8**, i8*** %name_vector, align 4
  %206 = load i32, i32* %count, align 4
  %arrayidx331 = getelementptr inbounds i8*, i8** %205, i32 %206
  store i8* null, i8** %arrayidx331, align 4
  %207 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %tobool332 = icmp ne %struct.globval* %207, null
  br i1 %tobool332, label %if.then333, label %if.end344

if.then333:                                       ; preds = %for.end
  store %struct.globval* null, %struct.globval** %tmplink, align 4
  br label %while.cond334

while.cond334:                                    ; preds = %if.end342, %if.then333
  %208 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %tobool335 = icmp ne %struct.globval* %208, null
  br i1 %tobool335, label %while.body336, label %while.end343

while.body336:                                    ; preds = %while.cond334
  %209 = load %struct.globval*, %struct.globval** %lastlink, align 4
  store %struct.globval* %209, %struct.globval** %tmplink, align 4
  %210 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %211 = load %struct.globval*, %struct.globval** %firstmalloc, align 4
  %cmp337 = icmp eq %struct.globval* %210, %211
  br i1 %cmp337, label %if.then339, label %if.else340

if.then339:                                       ; preds = %while.body336
  store %struct.globval* null, %struct.globval** %firstmalloc, align 4
  store %struct.globval* null, %struct.globval** %lastlink, align 4
  br label %if.end342

if.else340:                                       ; preds = %while.body336
  %212 = load %struct.globval*, %struct.globval** %lastlink, align 4
  %next341 = getelementptr inbounds %struct.globval, %struct.globval* %212, i32 0, i32 0
  %213 = load %struct.globval*, %struct.globval** %next341, align 4
  store %struct.globval* %213, %struct.globval** %lastlink, align 4
  br label %if.end342

if.end342:                                        ; preds = %if.else340, %if.then339
  %214 = load %struct.globval*, %struct.globval** %tmplink, align 4
  %215 = bitcast %struct.globval* %214 to i8*
  call void @sh_xfree(i8* %215, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 921)
  br label %while.cond334

while.end343:                                     ; preds = %while.cond334
  br label %if.end344

if.end344:                                        ; preds = %while.end343, %for.end
  %216 = load i8**, i8*** %name_vector, align 4
  store i8** %216, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end344, %while.end323, %if.then75, %if.then29, %if.then8, %if.then5
  %217 = load i8**, i8*** %retval, align 4
  ret i8** %217
}

; Function Attrs: noinline nounwind
define internal i32 @glob_testdir(i8* %dir, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %dir.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %r = alloca i32, align 4
  store i8* %dir, i8** %dir.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %dir.addr, align 4
  %call = call i32 @lstat(i8* %1, %struct.stat* %finfo)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i8*, i8** %dir.addr, align 4
  %call1 = call i32 @stat(i8* %2, %struct.stat* %finfo)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call1, %cond.false ]
  store i32 %cond, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %4 = load i32, i32* %st_mode, align 8
  %and2 = and i32 %4, 61440
  %cmp3 = icmp eq i32 %and2, 16384
  %conv = zext i1 %cmp3 to i32
  %cmp4 = icmp eq i32 %conv, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end7, %if.then6, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i8* @malloc(i32) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal void @dequote_pathname(i8* %pathname) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %pathname.addr, align 4
  call void @wdequote_pathname(i8* %0)
  br label %if.end

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %pathname.addr, align 4
  call void @udequote_pathname(i8* %1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

declare i32 @lstat(i8*, %struct.stat*) #1

declare %struct.__dirstream* @opendir(i8*) #1

declare i32 @signal_is_pending(i32) #1

declare %struct.dirent* @readdir(%struct.__dirstream*) #1

; Function Attrs: noinline nounwind
define internal i32 @mbskipname(i8* %pat, i8* %dname, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  %dname.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %ret = alloca i32, align 4
  %ext = alloca i32, align 4
  %pat_wc = alloca i32*, align 4
  %dn_wc = alloca i32*, align 4
  %pat_n = alloca i32, align 4
  %dn_n = alloca i32, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %dname, i8** %dname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %dname.addr, align 4
  %call = call i8* @mbsmbchar(i8* %0)
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %pat.addr, align 4
  %call1 = call i8* @mbsmbchar(i8* %1)
  %cmp2 = icmp eq i8* %call1, null
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %pat.addr, align 4
  %3 = load i8*, i8** %dname.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call3 = call i32 @skipname(i8* %2, i8* %3, i32 %4)
  store i32 %call3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  store i32 0, i32* %ext, align 4
  %5 = load i8*, i8** %pat.addr, align 4
  %call4 = call i32 @extglob_pattern_p(i8* %5)
  store i32 %call4, i32* %ext, align 4
  store i32* null, i32** %dn_wc, align 4
  store i32* null, i32** %pat_wc, align 4
  %6 = load i8*, i8** %pat.addr, align 4
  %call5 = call i32 @xdupmbstowcs(i32** %pat_wc, i8*** null, i8* %6)
  store i32 %call5, i32* %pat_n, align 4
  %7 = load i32, i32* %pat_n, align 4
  %cmp6 = icmp ne i32 %7, -1
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %8 = load i8*, i8** %dname.addr, align 4
  %call8 = call i32 @xdupmbstowcs(i32** %dn_wc, i8*** null, i8* %8)
  store i32 %call8, i32* %dn_n, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end
  store i32 0, i32* %ret, align 4
  %9 = load i32, i32* %pat_n, align 4
  %cmp10 = icmp ne i32 %9, -1
  br i1 %cmp10, label %land.lhs.true11, label %if.else

land.lhs.true11:                                  ; preds = %if.end9
  %10 = load i32, i32* %dn_n, align 4
  %cmp12 = icmp ne i32 %10, -1
  br i1 %cmp12, label %if.then13, label %if.else

if.then13:                                        ; preds = %land.lhs.true11
  %11 = load i32, i32* %ext, align 4
  %tobool = icmp ne i32 %11, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then13
  %12 = load i32*, i32** %pat_wc, align 4
  %13 = load i32*, i32** %dn_wc, align 4
  %14 = load i32, i32* %flags.addr, align 4
  %call14 = call i32 @wextglob_skipname(i32* %12, i32* %13, i32 %14)
  br label %cond.end

cond.false:                                       ; preds = %if.then13
  %15 = load i32*, i32** %pat_wc, align 4
  %16 = load i32*, i32** %dn_wc, align 4
  %call15 = call i32 @wchkname(i32* %15, i32* %16)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call14, %cond.true ], [ %call15, %cond.false ]
  store i32 %cond, i32* %ret, align 4
  br label %if.end17

if.else:                                          ; preds = %land.lhs.true11, %if.end9
  %17 = load i8*, i8** %pat.addr, align 4
  %18 = load i8*, i8** %dname.addr, align 4
  %19 = load i32, i32* %flags.addr, align 4
  %call16 = call i32 @skipname(i8* %17, i8* %18, i32 %19)
  store i32 %call16, i32* %ret, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.else, %cond.end
  br label %do.body

do.body:                                          ; preds = %if.end17
  %20 = load i32*, i32** %pat_wc, align 4
  %tobool18 = icmp ne i32* %20, null
  br i1 %tobool18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %do.body
  %21 = load i32*, i32** %pat_wc, align 4
  %22 = bitcast i32* %21 to i8*
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 362)
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end20
  br label %do.body21

do.body21:                                        ; preds = %do.end
  %23 = load i32*, i32** %dn_wc, align 4
  %tobool22 = icmp ne i32* %23, null
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %do.body21
  %24 = load i32*, i32** %dn_wc, align 4
  %25 = bitcast i32* %24 to i8*
  call void @sh_xfree(i8* %25, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 363)
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %do.body21
  br label %do.end25

do.end25:                                         ; preds = %if.end24
  %26 = load i32, i32* %ret, align 4
  store i32 %26, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end25, %if.then
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind
define internal i32 @skipname(i8* %pat, i8* %dname, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  %dname.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %dname, i8** %dname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %call = call i32 @extglob_pattern_p(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %pat.addr, align 4
  %2 = load i8*, i8** %dname.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %call1 = call i32 @extglob_skipname(i8* %1, i8* %2, i32 %3)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* @noglob_dot_filenames, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %5 = load i8*, i8** %pat.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp ne i32 %conv, 46
  br i1 %cmp2, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true
  %7 = load i8*, i8** %pat.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %8 to i32
  %cmp7 = icmp ne i32 %conv6, 92
  br i1 %cmp7, label %land.lhs.true13, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true4
  %9 = load i8*, i8** %pat.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %10 to i32
  %cmp11 = icmp ne i32 %conv10, 46
  br i1 %cmp11, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %lor.lhs.false, %land.lhs.true4
  %11 = load i8*, i8** %dname.addr, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %12 to i32
  %cmp16 = icmp eq i32 %conv15, 46
  br i1 %cmp16, label %land.lhs.true18, label %if.else

land.lhs.true18:                                  ; preds = %land.lhs.true13
  %13 = load i8*, i8** %dname.addr, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %14 to i32
  %cmp21 = icmp eq i32 %conv20, 0
  br i1 %cmp21, label %if.then33, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %land.lhs.true18
  %15 = load i8*, i8** %dname.addr, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %16 to i32
  %cmp26 = icmp eq i32 %conv25, 46
  br i1 %cmp26, label %land.lhs.true28, label %if.else

land.lhs.true28:                                  ; preds = %lor.lhs.false23
  %17 = load i8*, i8** %dname.addr, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %18 to i32
  %cmp31 = icmp eq i32 %conv30, 0
  br i1 %cmp31, label %if.then33, label %if.else

if.then33:                                        ; preds = %land.lhs.true28, %land.lhs.true18
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true28, %lor.lhs.false23, %land.lhs.true13, %lor.lhs.false, %land.lhs.true, %if.end
  %19 = load i32, i32* @noglob_dot_filenames, align 4
  %tobool34 = icmp ne i32 %19, 0
  br i1 %tobool34, label %land.lhs.true35, label %if.end56

land.lhs.true35:                                  ; preds = %if.else
  %20 = load i8*, i8** %dname.addr, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %21 to i32
  %cmp38 = icmp eq i32 %conv37, 46
  br i1 %cmp38, label %land.lhs.true40, label %if.end56

land.lhs.true40:                                  ; preds = %land.lhs.true35
  %22 = load i8*, i8** %pat.addr, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %22, i32 0
  %23 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %23 to i32
  %cmp43 = icmp ne i32 %conv42, 46
  br i1 %cmp43, label %land.lhs.true45, label %if.end56

land.lhs.true45:                                  ; preds = %land.lhs.true40
  %24 = load i8*, i8** %pat.addr, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %24, i32 0
  %25 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %25 to i32
  %cmp48 = icmp ne i32 %conv47, 92
  br i1 %cmp48, label %if.then55, label %lor.lhs.false50

lor.lhs.false50:                                  ; preds = %land.lhs.true45
  %26 = load i8*, i8** %pat.addr, align 4
  %arrayidx51 = getelementptr inbounds i8, i8* %26, i32 1
  %27 = load i8, i8* %arrayidx51, align 1
  %conv52 = sext i8 %27 to i32
  %cmp53 = icmp ne i32 %conv52, 46
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %lor.lhs.false50, %land.lhs.true45
  store i32 1, i32* %retval, align 4
  br label %return

if.end56:                                         ; preds = %lor.lhs.false50, %land.lhs.true40, %land.lhs.true35, %if.else
  br label %if.end57

if.end57:                                         ; preds = %if.end56
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end57, %if.then55, %if.then33, %if.then
  %28 = load i32, i32* %retval, align 4
  ret i32 %28
}

declare i8* @sh_makepath(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.globval* @finddirs(i8* %pat, i8* %sdir, i32 %flags, %struct.globval** %ep, i32* %np) #0 {
entry:
  %retval = alloca %struct.globval*, align 4
  %pat.addr = alloca i8*, align 4
  %sdir.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %ep.addr = alloca %struct.globval**, align 4
  %np.addr = alloca i32*, align 4
  %r = alloca i8**, align 4
  %n = alloca i8*, align 4
  %ndirs = alloca i32, align 4
  %ret = alloca %struct.globval*, align 4
  %e = alloca %struct.globval*, align 4
  %g = alloca %struct.globval*, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %sdir, i8** %sdir.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store %struct.globval** %ep, %struct.globval*** %ep.addr, align 4
  store i32* %np, i32** %np.addr, align 4
  store %struct.globval* null, %struct.globval** %ret, align 4
  store %struct.globval* null, %struct.globval** %e, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %1 = load i8*, i8** %sdir.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %call = call i8** @glob_vector(i8* %0, i8* %1, i32 %2)
  store i8** %call, i8*** %r, align 4
  %3 = load i8**, i8*** %r, align 4
  %cmp = icmp eq i8** %3, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %4 = load i8**, i8*** %r, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx, align 4
  %cmp1 = icmp eq i8* %5, null
  br i1 %cmp1, label %if.then, label %if.end10

if.then:                                          ; preds = %lor.lhs.false, %entry
  %6 = load i32*, i32** %np.addr, align 4
  %tobool = icmp ne i32* %6, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %7 = load i32*, i32** %np.addr, align 4
  store i32 0, i32* %7, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %8 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  %tobool3 = icmp ne %struct.globval** %8, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %9 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  store %struct.globval* null, %struct.globval** %9, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %10 = load i8**, i8*** %r, align 4
  %tobool6 = icmp ne i8** %10, null
  br i1 %tobool6, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.end5
  %11 = load i8**, i8*** %r, align 4
  %cmp7 = icmp ne i8** %11, @glob_error_return
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true
  %12 = load i8**, i8*** %r, align 4
  %13 = bitcast i8** %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 510)
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %land.lhs.true, %if.end5
  store %struct.globval* null, %struct.globval** %retval, align 4
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  store i32 0, i32* %ndirs, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end10
  %14 = load i8**, i8*** %r, align 4
  %15 = load i32, i32* %ndirs, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %14, i32 %15
  %16 = load i8*, i8** %arrayidx11, align 4
  %cmp12 = icmp ne i8* %16, null
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call13 = call i8* @malloc(i32 8)
  %17 = bitcast i8* %call13 to %struct.globval*
  store %struct.globval* %17, %struct.globval** %g, align 4
  %18 = load %struct.globval*, %struct.globval** %g, align 4
  %cmp14 = icmp eq %struct.globval* %18, null
  br i1 %cmp14, label %if.then15, label %if.end23

if.then15:                                        ; preds = %for.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then15
  %19 = load %struct.globval*, %struct.globval** %ret, align 4
  %tobool16 = icmp ne %struct.globval* %19, null
  br i1 %tobool16, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %20 = load %struct.globval*, %struct.globval** %ret, align 4
  %next = getelementptr inbounds %struct.globval, %struct.globval* %20, i32 0, i32 0
  %21 = load %struct.globval*, %struct.globval** %next, align 4
  store %struct.globval* %21, %struct.globval** %g, align 4
  %22 = load %struct.globval*, %struct.globval** %ret, align 4
  %23 = bitcast %struct.globval* %22 to i8*
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 521)
  %24 = load %struct.globval*, %struct.globval** %g, align 4
  store %struct.globval* %24, %struct.globval** %ret, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %25 = load i8**, i8*** %r, align 4
  %26 = bitcast i8** %25 to i8*
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 525)
  %27 = load i32*, i32** %np.addr, align 4
  %tobool17 = icmp ne i32* %27, null
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %while.end
  %28 = load i32*, i32** %np.addr, align 4
  store i32 0, i32* %28, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %while.end
  %29 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  %tobool20 = icmp ne %struct.globval** %29, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  %30 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  store %struct.globval* null, %struct.globval** %30, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  store %struct.globval* @finddirs_error_return, %struct.globval** %retval, align 4
  br label %return

if.end23:                                         ; preds = %for.body
  %31 = load %struct.globval*, %struct.globval** %e, align 4
  %cmp24 = icmp eq %struct.globval* %31, null
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  %32 = load %struct.globval*, %struct.globval** %g, align 4
  store %struct.globval* %32, %struct.globval** %e, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  %33 = load %struct.globval*, %struct.globval** %ret, align 4
  %34 = load %struct.globval*, %struct.globval** %g, align 4
  %next27 = getelementptr inbounds %struct.globval, %struct.globval* %34, i32 0, i32 0
  store %struct.globval* %33, %struct.globval** %next27, align 4
  %35 = load %struct.globval*, %struct.globval** %g, align 4
  store %struct.globval* %35, %struct.globval** %ret, align 4
  %36 = load i8**, i8*** %r, align 4
  %37 = load i32, i32* %ndirs, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %36, i32 %37
  %38 = load i8*, i8** %arrayidx28, align 4
  %39 = load %struct.globval*, %struct.globval** %g, align 4
  %name = getelementptr inbounds %struct.globval, %struct.globval* %39, i32 0, i32 1
  store i8* %38, i8** %name, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end26
  %40 = load i32, i32* %ndirs, align 4
  %inc = add nsw i32 %40, 1
  store i32 %inc, i32* %ndirs, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %41 = load i8**, i8*** %r, align 4
  %42 = bitcast i8** %41 to i8*
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 541)
  %43 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  %tobool29 = icmp ne %struct.globval** %43, null
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %for.end
  %44 = load %struct.globval*, %struct.globval** %e, align 4
  %45 = load %struct.globval**, %struct.globval*** %ep.addr, align 4
  store %struct.globval* %44, %struct.globval** %45, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %for.end
  %46 = load i32*, i32** %np.addr, align 4
  %tobool32 = icmp ne i32* %46, null
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end31
  %47 = load i32, i32* %ndirs, align 4
  %48 = load i32*, i32** %np.addr, align 4
  store i32 %47, i32* %48, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end31
  %49 = load %struct.globval*, %struct.globval** %ret, align 4
  store %struct.globval* %49, %struct.globval** %retval, align 4
  br label %return

return:                                           ; preds = %if.end34, %if.end22, %if.end9
  %50 = load %struct.globval*, %struct.globval** %retval, align 4
  ret %struct.globval* %50
}

declare void @bcopy(i8*, i8*, i32) #1

declare i8* @fnx_fromfs(i8*, i32) #1

declare i32 @strmatch(i8*, i8*, i32) #1

declare i32 @closedir(%struct.__dirstream*) #1

; Function Attrs: noinline nounwind
define i8** @glob_filename(i8* %pathname, i32 %flags) #0 {
entry:
  %retval = alloca i8**, align 4
  %pathname.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %result = alloca i8**, align 4
  %result_size = alloca i32, align 4
  %directory_name = alloca i8*, align 4
  %filename = alloca i8*, align 4
  %dname = alloca i8*, align 4
  %fn = alloca i8*, align 4
  %directory_len = alloca i32, align 4
  %free_dirname = alloca i32, align 4
  %dflags = alloca i32, align 4
  %directories = alloca i8**, align 4
  %d = alloca i8*, align 4
  %p = alloca i8*, align 4
  %i = alloca i32, align 4
  %all_starstar = alloca i32, align 4
  %last_starstar = alloca i32, align 4
  %dl = alloca i32, align 4
  %prev = alloca i32, align 4
  %temp_results = alloca i8**, align 4
  %shouldbreak = alloca i32, align 4
  %array = alloca i8**, align 4
  %l = alloca i32, align 4
  %i272 = alloca i32, align 4
  %n = alloca i32, align 4
  %temp_results399 = alloca i8**, align 4
  %i474 = alloca i32, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i8* @malloc(i32 4)
  %0 = bitcast i8* %call to i8**
  store i8** %0, i8*** %result, align 4
  store i32 1, i32* %result_size, align 4
  %1 = load i8**, i8*** %result, align 4
  %cmp = icmp eq i8** %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8**, i8*** %result, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 0
  store i8* null, i8** %arrayidx, align 4
  store i8* null, i8** %directory_name, align 4
  %3 = load i8*, i8** %pathname.addr, align 4
  %call1 = call i8* @strrchr(i8* %3, i32 47)
  store i8* %call1, i8** %filename, align 4
  %4 = load i8*, i8** %filename, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.lhs.true, label %if.end5

land.lhs.true:                                    ; preds = %if.end
  %5 = load i32, i32* @extended_glob, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %land.lhs.true
  %6 = load i8*, i8** %pathname.addr, align 4
  %call4 = call i8* @glob_dirscan(i8* %6, i32 47)
  store i8* %call4, i8** %fn, align 4
  %7 = load i8*, i8** %fn, align 4
  store i8* %7, i8** %filename, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %8 = load i8*, i8** %filename, align 4
  %cmp6 = icmp eq i8* %8, null
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end5
  %9 = load i8*, i8** %pathname.addr, align 4
  store i8* %9, i8** %filename, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), i8** %directory_name, align 4
  store i32 0, i32* %directory_len, align 4
  store i32 0, i32* %free_dirname, align 4
  br label %if.end14

if.else:                                          ; preds = %if.end5
  %10 = load i8*, i8** %filename, align 4
  %11 = load i8*, i8** %pathname.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %10 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %11 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add = add nsw i32 %sub.ptr.sub, 1
  store i32 %add, i32* %directory_len, align 4
  %12 = load i32, i32* %directory_len, align 4
  %add8 = add i32 %12, 1
  %call9 = call i8* @malloc(i32 %add8)
  store i8* %call9, i8** %directory_name, align 4
  %13 = load i8*, i8** %directory_name, align 4
  %cmp10 = icmp eq i8* %13, null
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.else
  %14 = load i8**, i8*** %result, align 4
  %15 = bitcast i8** %14 to i8*
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1065)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.else
  %16 = load i8*, i8** %pathname.addr, align 4
  %17 = load i8*, i8** %directory_name, align 4
  %18 = load i32, i32* %directory_len, align 4
  call void @bcopy(i8* %16, i8* %17, i32 %18)
  %19 = load i8*, i8** %directory_name, align 4
  %20 = load i32, i32* %directory_len, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %19, i32 %20
  store i8 0, i8* %arrayidx13, align 1
  %21 = load i8*, i8** %filename, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr, i8** %filename, align 4
  store i32 1, i32* %free_dirname, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.end12, %if.then7
  %22 = load i32, i32* %directory_len, align 4
  %cmp15 = icmp ugt i32 %22, 0
  br i1 %cmp15, label %land.lhs.true16, label %if.end371

land.lhs.true16:                                  ; preds = %if.end14
  %23 = load i8*, i8** %directory_name, align 4
  %call17 = call i32 @glob_pattern_p(i8* %23)
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.then19, label %if.end371

if.then19:                                        ; preds = %land.lhs.true16
  store i32 0, i32* %last_starstar, align 4
  store i32 0, i32* %all_starstar, align 4
  %24 = load i8*, i8** %directory_name, align 4
  store i8* %24, i8** %d, align 4
  %25 = load i32, i32* %flags.addr, align 4
  %and = and i32 %25, -2
  store i32 %and, i32* %dflags, align 4
  %26 = load i32, i32* %flags.addr, align 4
  %and20 = and i32 %26, 1024
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %land.lhs.true22, label %if.end80

land.lhs.true22:                                  ; preds = %if.then19
  %27 = load i8*, i8** %d, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx23, align 1
  %conv = sext i8 %28 to i32
  %cmp24 = icmp eq i32 %conv, 42
  br i1 %cmp24, label %land.lhs.true26, label %if.end80

land.lhs.true26:                                  ; preds = %land.lhs.true22
  %29 = load i8*, i8** %d, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %29, i32 1
  %30 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %30 to i32
  %cmp29 = icmp eq i32 %conv28, 42
  br i1 %cmp29, label %land.lhs.true31, label %if.end80

land.lhs.true31:                                  ; preds = %land.lhs.true26
  %31 = load i8*, i8** %d, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %31, i32 2
  %32 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %32 to i32
  %cmp34 = icmp eq i32 %conv33, 47
  br i1 %cmp34, label %if.then40, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true31
  %33 = load i8*, i8** %d, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %33, i32 2
  %34 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %34 to i32
  %cmp38 = icmp eq i32 %conv37, 0
  br i1 %cmp38, label %if.then40, label %if.end80

if.then40:                                        ; preds = %lor.lhs.false, %land.lhs.true31
  %35 = load i8*, i8** %d, align 4
  store i8* %35, i8** %p, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end72, %if.then40
  %36 = load i8*, i8** %d, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %37 to i32
  %cmp43 = icmp eq i32 %conv42, 42
  br i1 %cmp43, label %land.lhs.true45, label %land.end

land.lhs.true45:                                  ; preds = %while.cond
  %38 = load i8*, i8** %d, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %38, i32 1
  %39 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %39 to i32
  %cmp48 = icmp eq i32 %conv47, 42
  br i1 %cmp48, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true45
  %40 = load i8*, i8** %d, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %40, i32 2
  %41 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %41 to i32
  %cmp52 = icmp eq i32 %conv51, 47
  br i1 %cmp52, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %42 = load i8*, i8** %d, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %42, i32 2
  %43 = load i8, i8* %arrayidx54, align 1
  %conv55 = sext i8 %43 to i32
  %cmp56 = icmp eq i32 %conv55, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %44 = phi i1 [ true, %land.rhs ], [ %cmp56, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true45, %while.cond
  %45 = phi i1 [ false, %land.lhs.true45 ], [ false, %while.cond ], [ %44, %lor.end ]
  br i1 %45, label %while.body, label %while.end73

while.body:                                       ; preds = %land.end
  %46 = load i8*, i8** %d, align 4
  store i8* %46, i8** %p, align 4
  %47 = load i8*, i8** %d, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %47, i32 2
  %48 = load i8, i8* %arrayidx58, align 1
  %tobool59 = icmp ne i8 %48, 0
  br i1 %tobool59, label %if.then60, label %if.end72

if.then60:                                        ; preds = %while.body
  %49 = load i8*, i8** %d, align 4
  %add.ptr = getelementptr inbounds i8, i8* %49, i32 3
  store i8* %add.ptr, i8** %d, align 4
  br label %while.cond61

while.cond61:                                     ; preds = %while.body65, %if.then60
  %50 = load i8*, i8** %d, align 4
  %51 = load i8, i8* %50, align 1
  %conv62 = sext i8 %51 to i32
  %cmp63 = icmp eq i32 %conv62, 47
  br i1 %cmp63, label %while.body65, label %while.end

while.body65:                                     ; preds = %while.cond61
  %52 = load i8*, i8** %d, align 4
  %incdec.ptr66 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr66, i8** %d, align 4
  br label %while.cond61

while.end:                                        ; preds = %while.cond61
  %53 = load i8*, i8** %d, align 4
  %54 = load i8, i8* %53, align 1
  %conv67 = sext i8 %54 to i32
  %cmp68 = icmp eq i32 %conv67, 0
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %while.end
  br label %while.end73

if.end71:                                         ; preds = %while.end
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %while.body
  br label %while.cond

while.end73:                                      ; preds = %if.then70, %land.end
  %55 = load i8*, i8** %d, align 4
  %56 = load i8, i8* %55, align 1
  %conv74 = sext i8 %56 to i32
  %cmp75 = icmp eq i32 %conv74, 0
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %while.end73
  store i32 1, i32* %all_starstar, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %while.end73
  %57 = load i8*, i8** %p, align 4
  store i8* %57, i8** %d, align 4
  %58 = load i32, i32* %dflags, align 4
  %or = or i32 %58, 528
  store i32 %or, i32* %dflags, align 4
  %59 = load i8*, i8** %d, align 4
  %call79 = call i32 @strlen(i8* %59)
  store i32 %call79, i32* %directory_len, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.end78, %lor.lhs.false, %land.lhs.true26, %land.lhs.true22, %if.then19
  %60 = load i32, i32* %flags.addr, align 4
  %and81 = and i32 %60, 1024
  %tobool82 = icmp ne i32 %and81, 0
  br i1 %tobool82, label %land.lhs.true83, label %if.end121

land.lhs.true83:                                  ; preds = %if.end80
  %61 = load i32, i32* %all_starstar, align 4
  %cmp84 = icmp eq i32 %61, 0
  br i1 %cmp84, label %if.then86, label %if.end121

if.then86:                                        ; preds = %land.lhs.true83
  %62 = load i32, i32* %directory_len, align 4
  store i32 %62, i32* %dl, align 4
  store i32 %62, i32* %prev, align 4
  br label %while.cond87

while.cond87:                                     ; preds = %while.body114, %if.then86
  %63 = load i32, i32* %dl, align 4
  %cmp88 = icmp sge i32 %63, 4
  br i1 %cmp88, label %land.lhs.true90, label %land.end113

land.lhs.true90:                                  ; preds = %while.cond87
  %64 = load i8*, i8** %d, align 4
  %65 = load i32, i32* %dl, align 4
  %sub = sub nsw i32 %65, 1
  %arrayidx91 = getelementptr inbounds i8, i8* %64, i32 %sub
  %66 = load i8, i8* %arrayidx91, align 1
  %conv92 = sext i8 %66 to i32
  %cmp93 = icmp eq i32 %conv92, 47
  br i1 %cmp93, label %land.lhs.true95, label %land.end113

land.lhs.true95:                                  ; preds = %land.lhs.true90
  %67 = load i8*, i8** %d, align 4
  %68 = load i32, i32* %dl, align 4
  %sub96 = sub nsw i32 %68, 2
  %arrayidx97 = getelementptr inbounds i8, i8* %67, i32 %sub96
  %69 = load i8, i8* %arrayidx97, align 1
  %conv98 = sext i8 %69 to i32
  %cmp99 = icmp eq i32 %conv98, 42
  br i1 %cmp99, label %land.lhs.true101, label %land.end113

land.lhs.true101:                                 ; preds = %land.lhs.true95
  %70 = load i8*, i8** %d, align 4
  %71 = load i32, i32* %dl, align 4
  %sub102 = sub nsw i32 %71, 3
  %arrayidx103 = getelementptr inbounds i8, i8* %70, i32 %sub102
  %72 = load i8, i8* %arrayidx103, align 1
  %conv104 = sext i8 %72 to i32
  %cmp105 = icmp eq i32 %conv104, 42
  br i1 %cmp105, label %land.rhs107, label %land.end113

land.rhs107:                                      ; preds = %land.lhs.true101
  %73 = load i8*, i8** %d, align 4
  %74 = load i32, i32* %dl, align 4
  %sub108 = sub nsw i32 %74, 4
  %arrayidx109 = getelementptr inbounds i8, i8* %73, i32 %sub108
  %75 = load i8, i8* %arrayidx109, align 1
  %conv110 = sext i8 %75 to i32
  %cmp111 = icmp eq i32 %conv110, 47
  br label %land.end113

land.end113:                                      ; preds = %land.rhs107, %land.lhs.true101, %land.lhs.true95, %land.lhs.true90, %while.cond87
  %76 = phi i1 [ false, %land.lhs.true101 ], [ false, %land.lhs.true95 ], [ false, %land.lhs.true90 ], [ false, %while.cond87 ], [ %cmp111, %land.rhs107 ]
  br i1 %76, label %while.body114, label %while.end116

while.body114:                                    ; preds = %land.end113
  %77 = load i32, i32* %dl, align 4
  store i32 %77, i32* %prev, align 4
  %78 = load i32, i32* %dl, align 4
  %sub115 = sub nsw i32 %78, 3
  store i32 %sub115, i32* %dl, align 4
  br label %while.cond87

while.end116:                                     ; preds = %land.end113
  %79 = load i32, i32* %dl, align 4
  %80 = load i32, i32* %directory_len, align 4
  %cmp117 = icmp ne i32 %79, %80
  br i1 %cmp117, label %if.then119, label %if.end120

if.then119:                                       ; preds = %while.end116
  store i32 1, i32* %last_starstar, align 4
  br label %if.end120

if.end120:                                        ; preds = %if.then119, %while.end116
  %81 = load i32, i32* %prev, align 4
  store i32 %81, i32* %directory_len, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %land.lhs.true83, %if.end80
  %82 = load i32, i32* %last_starstar, align 4
  %tobool122 = icmp ne i32 %82, 0
  br i1 %tobool122, label %land.lhs.true123, label %if.end143

land.lhs.true123:                                 ; preds = %if.end121
  %83 = load i32, i32* %directory_len, align 4
  %cmp124 = icmp ugt i32 %83, 4
  br i1 %cmp124, label %land.lhs.true126, label %if.end143

land.lhs.true126:                                 ; preds = %land.lhs.true123
  %84 = load i8*, i8** %filename, align 4
  %arrayidx127 = getelementptr inbounds i8, i8* %84, i32 0
  %85 = load i8, i8* %arrayidx127, align 1
  %conv128 = sext i8 %85 to i32
  %cmp129 = icmp eq i32 %conv128, 42
  br i1 %cmp129, label %land.lhs.true131, label %if.end143

land.lhs.true131:                                 ; preds = %land.lhs.true126
  %86 = load i8*, i8** %filename, align 4
  %arrayidx132 = getelementptr inbounds i8, i8* %86, i32 1
  %87 = load i8, i8* %arrayidx132, align 1
  %conv133 = sext i8 %87 to i32
  %cmp134 = icmp eq i32 %conv133, 42
  br i1 %cmp134, label %land.lhs.true136, label %if.end143

land.lhs.true136:                                 ; preds = %land.lhs.true131
  %88 = load i8*, i8** %filename, align 4
  %arrayidx137 = getelementptr inbounds i8, i8* %88, i32 2
  %89 = load i8, i8* %arrayidx137, align 1
  %conv138 = sext i8 %89 to i32
  %cmp139 = icmp eq i32 %conv138, 0
  br i1 %cmp139, label %if.then141, label %if.end143

if.then141:                                       ; preds = %land.lhs.true136
  %90 = load i32, i32* %directory_len, align 4
  %sub142 = sub i32 %90, 3
  store i32 %sub142, i32* %directory_len, align 4
  br label %if.end143

if.end143:                                        ; preds = %if.then141, %land.lhs.true136, %land.lhs.true131, %land.lhs.true126, %land.lhs.true123, %if.end121
  %91 = load i8*, i8** %d, align 4
  %92 = load i32, i32* %directory_len, align 4
  %sub144 = sub i32 %92, 1
  %arrayidx145 = getelementptr inbounds i8, i8* %91, i32 %sub144
  %93 = load i8, i8* %arrayidx145, align 1
  %conv146 = sext i8 %93 to i32
  %cmp147 = icmp eq i32 %conv146, 47
  br i1 %cmp147, label %if.then149, label %if.end152

if.then149:                                       ; preds = %if.end143
  %94 = load i8*, i8** %d, align 4
  %95 = load i32, i32* %directory_len, align 4
  %sub150 = sub i32 %95, 1
  %arrayidx151 = getelementptr inbounds i8, i8* %94, i32 %sub150
  store i8 0, i8* %arrayidx151, align 1
  br label %if.end152

if.end152:                                        ; preds = %if.then149, %if.end143
  %96 = load i8*, i8** %d, align 4
  %97 = load i32, i32* %dflags, align 4
  %call153 = call i8** @glob_filename(i8* %96, i32 %97)
  store i8** %call153, i8*** %directories, align 4
  %98 = load i32, i32* %free_dirname, align 4
  %tobool154 = icmp ne i32 %98, 0
  br i1 %tobool154, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end152
  %99 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %99, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1144)
  store i8* null, i8** %directory_name, align 4
  br label %if.end156

if.end156:                                        ; preds = %if.then155, %if.end152
  %100 = load i8**, i8*** %directories, align 4
  %cmp157 = icmp eq i8** %100, null
  br i1 %cmp157, label %if.then159, label %if.else160

if.then159:                                       ; preds = %if.end156
  br label %memory_error

if.else160:                                       ; preds = %if.end156
  %101 = load i8**, i8*** %directories, align 4
  %cmp161 = icmp eq i8** %101, @glob_error_return
  br i1 %cmp161, label %if.then163, label %if.else164

if.then163:                                       ; preds = %if.else160
  %102 = load i8**, i8*** %result, align 4
  %103 = bitcast i8** %102 to i8*
  call void @sh_xfree(i8* %103, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1152)
  store i8** @glob_error_return, i8*** %retval, align 4
  br label %return

if.else164:                                       ; preds = %if.else160
  %104 = load i8**, i8*** %directories, align 4
  %105 = load i8*, i8** %104, align 4
  %cmp165 = icmp eq i8* %105, null
  br i1 %cmp165, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.else164
  %106 = load i8**, i8*** %directories, align 4
  %107 = bitcast i8** %106 to i8*
  call void @sh_xfree(i8* %107, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1157)
  %108 = load i8**, i8*** %result, align 4
  %109 = bitcast i8** %108 to i8*
  call void @sh_xfree(i8* %109, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1158)
  store i8** @glob_error_return, i8*** %retval, align 4
  br label %return

if.end168:                                        ; preds = %if.else164
  br label %if.end169

if.end169:                                        ; preds = %if.end168
  br label %if.end170

if.end170:                                        ; preds = %if.end169
  %110 = load i32, i32* %all_starstar, align 4
  %tobool171 = icmp ne i32 %110, 0
  br i1 %tobool171, label %land.lhs.true172, label %if.end188

land.lhs.true172:                                 ; preds = %if.end170
  %111 = load i8*, i8** %filename, align 4
  %arrayidx173 = getelementptr inbounds i8, i8* %111, i32 0
  %112 = load i8, i8* %arrayidx173, align 1
  %conv174 = sext i8 %112 to i32
  %cmp175 = icmp eq i32 %conv174, 42
  br i1 %cmp175, label %land.lhs.true177, label %if.end188

land.lhs.true177:                                 ; preds = %land.lhs.true172
  %113 = load i8*, i8** %filename, align 4
  %arrayidx178 = getelementptr inbounds i8, i8* %113, i32 1
  %114 = load i8, i8* %arrayidx178, align 1
  %conv179 = sext i8 %114 to i32
  %cmp180 = icmp eq i32 %conv179, 42
  br i1 %cmp180, label %land.lhs.true182, label %if.end188

land.lhs.true182:                                 ; preds = %land.lhs.true177
  %115 = load i8*, i8** %filename, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %115, i32 2
  %116 = load i8, i8* %arrayidx183, align 1
  %conv184 = sext i8 %116 to i32
  %cmp185 = icmp eq i32 %conv184, 0
  br i1 %cmp185, label %if.then187, label %if.end188

if.then187:                                       ; preds = %land.lhs.true182
  %117 = load i8**, i8*** %directories, align 4
  %118 = bitcast i8** %117 to i8*
  call void @sh_xfree(i8* %118, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1166)
  %119 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %119, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1167)
  store i8* null, i8** %directory_name, align 4
  store i32 0, i32* %directory_len, align 4
  br label %only_filename

if.end188:                                        ; preds = %land.lhs.true182, %land.lhs.true177, %land.lhs.true172, %if.end170
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc360, %if.end188
  %120 = load i8**, i8*** %directories, align 4
  %121 = load i32, i32* %i, align 4
  %arrayidx189 = getelementptr inbounds i8*, i8** %120, i32 %121
  %122 = load i8*, i8** %arrayidx189, align 4
  %cmp190 = icmp ne i8* %122, null
  br i1 %cmp190, label %for.body, label %for.end362

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %shouldbreak, align 4
  %123 = load i8**, i8*** %directories, align 4
  %124 = load i32, i32* %i, align 4
  %arrayidx192 = getelementptr inbounds i8*, i8** %123, i32 %124
  %125 = load i8*, i8** %arrayidx192, align 4
  store i8* %125, i8** %dname, align 4
  %126 = load i32, i32* %flags.addr, align 4
  %and193 = and i32 %126, -530
  store i32 %and193, i32* %dflags, align 4
  %127 = load i32, i32* %flags.addr, align 4
  %and194 = and i32 %127, 1024
  %tobool195 = icmp ne i32 %and194, 0
  br i1 %tobool195, label %land.lhs.true196, label %if.end213

land.lhs.true196:                                 ; preds = %for.body
  %128 = load i8*, i8** %filename, align 4
  %arrayidx197 = getelementptr inbounds i8, i8* %128, i32 0
  %129 = load i8, i8* %arrayidx197, align 1
  %conv198 = sext i8 %129 to i32
  %cmp199 = icmp eq i32 %conv198, 42
  br i1 %cmp199, label %land.lhs.true201, label %if.end213

land.lhs.true201:                                 ; preds = %land.lhs.true196
  %130 = load i8*, i8** %filename, align 4
  %arrayidx202 = getelementptr inbounds i8, i8* %130, i32 1
  %131 = load i8, i8* %arrayidx202, align 1
  %conv203 = sext i8 %131 to i32
  %cmp204 = icmp eq i32 %conv203, 42
  br i1 %cmp204, label %land.lhs.true206, label %if.end213

land.lhs.true206:                                 ; preds = %land.lhs.true201
  %132 = load i8*, i8** %filename, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %132, i32 2
  %133 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %133 to i32
  %cmp209 = icmp eq i32 %conv208, 0
  br i1 %cmp209, label %if.then211, label %if.end213

if.then211:                                       ; preds = %land.lhs.true206
  %134 = load i32, i32* %dflags, align 4
  %or212 = or i32 %134, 528
  store i32 %or212, i32* %dflags, align 4
  br label %if.end213

if.end213:                                        ; preds = %if.then211, %land.lhs.true206, %land.lhs.true201, %land.lhs.true196, %for.body
  %135 = load i8*, i8** %dname, align 4
  %arrayidx214 = getelementptr inbounds i8, i8* %135, i32 0
  %136 = load i8, i8* %arrayidx214, align 1
  %conv215 = sext i8 %136 to i32
  %cmp216 = icmp eq i32 %conv215, 0
  br i1 %cmp216, label %land.lhs.true218, label %if.end224

land.lhs.true218:                                 ; preds = %if.end213
  %137 = load i8*, i8** %filename, align 4
  %arrayidx219 = getelementptr inbounds i8, i8* %137, i32 0
  %138 = load i8, i8* %arrayidx219, align 1
  %conv220 = sext i8 %138 to i32
  %tobool221 = icmp ne i32 %conv220, 0
  br i1 %tobool221, label %if.then222, label %if.end224

if.then222:                                       ; preds = %land.lhs.true218
  %139 = load i32, i32* %dflags, align 4
  %or223 = or i32 %139, 256
  store i32 %or223, i32* %dflags, align 4
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** %dname, align 4
  br label %if.end224

if.end224:                                        ; preds = %if.then222, %land.lhs.true218, %if.end213
  %140 = load i8*, i8** %filename, align 4
  %141 = load i8*, i8** %dname, align 4
  %142 = load i32, i32* %dflags, align 4
  %call225 = call i8** @glob_vector(i8* %140, i8* %141, i32 %142)
  store i8** %call225, i8*** %temp_results, align 4
  %143 = load i8**, i8*** %temp_results, align 4
  %cmp226 = icmp eq i8** %143, null
  br i1 %cmp226, label %if.then228, label %if.else229

if.then228:                                       ; preds = %if.end224
  br label %memory_error

if.else229:                                       ; preds = %if.end224
  %144 = load i8**, i8*** %temp_results, align 4
  %cmp230 = icmp eq i8** %144, @glob_error_return
  br i1 %cmp230, label %if.then232, label %if.else233

if.then232:                                       ; preds = %if.else229
  br label %if.end358

if.else233:                                       ; preds = %if.else229
  %145 = load i32, i32* %dflags, align 4
  %and234 = and i32 %145, 16
  %tobool235 = icmp ne i32 %and234, 0
  br i1 %tobool235, label %land.lhs.true236, label %if.else292

land.lhs.true236:                                 ; preds = %if.else233
  %146 = load i8*, i8** %filename, align 4
  %arrayidx237 = getelementptr inbounds i8, i8* %146, i32 0
  %147 = load i8, i8* %arrayidx237, align 1
  %conv238 = sext i8 %147 to i32
  %cmp239 = icmp eq i32 %conv238, 42
  br i1 %cmp239, label %land.lhs.true241, label %if.else292

land.lhs.true241:                                 ; preds = %land.lhs.true236
  %148 = load i8*, i8** %filename, align 4
  %arrayidx242 = getelementptr inbounds i8, i8* %148, i32 1
  %149 = load i8, i8* %arrayidx242, align 1
  %conv243 = sext i8 %149 to i32
  %cmp244 = icmp eq i32 %conv243, 42
  br i1 %cmp244, label %land.lhs.true246, label %if.else292

land.lhs.true246:                                 ; preds = %land.lhs.true241
  %150 = load i8*, i8** %filename, align 4
  %arrayidx247 = getelementptr inbounds i8, i8* %150, i32 2
  %151 = load i8, i8* %arrayidx247, align 1
  %conv248 = sext i8 %151 to i32
  %cmp249 = icmp eq i32 %conv248, 0
  br i1 %cmp249, label %if.then256, label %lor.lhs.false251

lor.lhs.false251:                                 ; preds = %land.lhs.true246
  %152 = load i8*, i8** %filename, align 4
  %arrayidx252 = getelementptr inbounds i8, i8* %152, i32 2
  %153 = load i8, i8* %arrayidx252, align 1
  %conv253 = sext i8 %153 to i32
  %cmp254 = icmp eq i32 %conv253, 47
  br i1 %cmp254, label %if.then256, label %if.else292

if.then256:                                       ; preds = %lor.lhs.false251, %land.lhs.true246
  %154 = load i32, i32* %dflags, align 4
  %and257 = and i32 %154, 256
  %tobool258 = icmp ne i32 %and257, 0
  br i1 %tobool258, label %land.lhs.true259, label %if.else290

land.lhs.true259:                                 ; preds = %if.then256
  %155 = load i32, i32* %flags.addr, align 4
  %and260 = and i32 %155, 256
  %cmp261 = icmp eq i32 %and260, 0
  br i1 %cmp261, label %land.lhs.true263, label %if.else290

land.lhs.true263:                                 ; preds = %land.lhs.true259
  %156 = load i8**, i8*** %temp_results, align 4
  %tobool264 = icmp ne i8** %156, null
  br i1 %tobool264, label %land.lhs.true265, label %if.else290

land.lhs.true265:                                 ; preds = %land.lhs.true263
  %157 = load i8**, i8*** %temp_results, align 4
  %158 = load i8*, i8** %157, align 4
  %tobool266 = icmp ne i8* %158, null
  br i1 %tobool266, label %land.lhs.true267, label %if.else290

land.lhs.true267:                                 ; preds = %land.lhs.true265
  %159 = load i8**, i8*** %temp_results, align 4
  %160 = load i8*, i8** %159, align 4
  %161 = load i8, i8* %160, align 1
  %conv268 = sext i8 %161 to i32
  %cmp269 = icmp eq i32 %conv268, 0
  br i1 %cmp269, label %if.then271, label %if.else290

if.then271:                                       ; preds = %land.lhs.true267
  store i32 0, i32* %n, align 4
  br label %for.cond273

for.cond273:                                      ; preds = %for.inc, %if.then271
  %162 = load i8**, i8*** %temp_results, align 4
  %163 = load i32, i32* %n, align 4
  %arrayidx274 = getelementptr inbounds i8*, i8** %162, i32 %163
  %164 = load i8*, i8** %arrayidx274, align 4
  %tobool275 = icmp ne i8* %164, null
  br i1 %tobool275, label %land.rhs276, label %land.end281

land.rhs276:                                      ; preds = %for.cond273
  %165 = load i8**, i8*** %temp_results, align 4
  %166 = load i32, i32* %n, align 4
  %arrayidx277 = getelementptr inbounds i8*, i8** %165, i32 %166
  %167 = load i8*, i8** %arrayidx277, align 4
  %168 = load i8, i8* %167, align 1
  %conv278 = sext i8 %168 to i32
  %cmp279 = icmp eq i32 %conv278, 0
  br label %land.end281

land.end281:                                      ; preds = %land.rhs276, %for.cond273
  %169 = phi i1 [ false, %for.cond273 ], [ %cmp279, %land.rhs276 ]
  br i1 %169, label %for.body282, label %for.end

for.body282:                                      ; preds = %land.end281
  br label %for.inc

for.inc:                                          ; preds = %for.body282
  %170 = load i32, i32* %n, align 4
  %inc = add nsw i32 %170, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond273

for.end:                                          ; preds = %land.end281
  %171 = load i32, i32* %n, align 4
  store i32 %171, i32* %i272, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %for.end
  %172 = load i8**, i8*** %temp_results, align 4
  %173 = load i32, i32* %i272, align 4
  %arrayidx283 = getelementptr inbounds i8*, i8** %172, i32 %173
  %174 = load i8*, i8** %arrayidx283, align 4
  %175 = load i8**, i8*** %temp_results, align 4
  %176 = load i32, i32* %i272, align 4
  %177 = load i32, i32* %n, align 4
  %sub284 = sub nsw i32 %176, %177
  %arrayidx285 = getelementptr inbounds i8*, i8** %175, i32 %sub284
  store i8* %174, i8** %arrayidx285, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %178 = load i8**, i8*** %temp_results, align 4
  %179 = load i32, i32* %i272, align 4
  %inc286 = add nsw i32 %179, 1
  store i32 %inc286, i32* %i272, align 4
  %arrayidx287 = getelementptr inbounds i8*, i8** %178, i32 %179
  %180 = load i8*, i8** %arrayidx287, align 4
  %cmp288 = icmp ne i8* %180, null
  br i1 %cmp288, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %181 = load i8**, i8*** %temp_results, align 4
  store i8** %181, i8*** %array, align 4
  store i32 1, i32* %shouldbreak, align 4
  br label %if.end291

if.else290:                                       ; preds = %land.lhs.true267, %land.lhs.true265, %land.lhs.true263, %land.lhs.true259, %if.then256
  %182 = load i8**, i8*** %temp_results, align 4
  store i8** %182, i8*** %array, align 4
  br label %if.end291

if.end291:                                        ; preds = %if.else290, %do.end
  br label %if.end295

if.else292:                                       ; preds = %lor.lhs.false251, %land.lhs.true241, %land.lhs.true236, %if.else233
  %183 = load i8**, i8*** %directories, align 4
  %184 = load i32, i32* %i, align 4
  %arrayidx293 = getelementptr inbounds i8*, i8** %183, i32 %184
  %185 = load i8*, i8** %arrayidx293, align 4
  %186 = load i8**, i8*** %temp_results, align 4
  %187 = load i32, i32* %flags.addr, align 4
  %call294 = call i8** @glob_dir_to_array(i8* %185, i8** %186, i32 %187)
  store i8** %call294, i8*** %array, align 4
  br label %if.end295

if.end295:                                        ; preds = %if.else292, %if.end291
  store i32 0, i32* %l, align 4
  br label %while.cond296

while.cond296:                                    ; preds = %while.body300, %if.end295
  %188 = load i8**, i8*** %array, align 4
  %189 = load i32, i32* %l, align 4
  %arrayidx297 = getelementptr inbounds i8*, i8** %188, i32 %189
  %190 = load i8*, i8** %arrayidx297, align 4
  %cmp298 = icmp ne i8* %190, null
  br i1 %cmp298, label %while.body300, label %while.end302

while.body300:                                    ; preds = %while.cond296
  %191 = load i32, i32* %l, align 4
  %inc301 = add i32 %191, 1
  store i32 %inc301, i32* %l, align 4
  br label %while.cond296

while.end302:                                     ; preds = %while.cond296
  %192 = load i8**, i8*** %result, align 4
  %193 = bitcast i8** %192 to i8*
  %194 = load i32, i32* %result_size, align 4
  %195 = load i32, i32* %l, align 4
  %add303 = add i32 %194, %195
  %mul = mul i32 %add303, 4
  %call304 = call i8* @realloc(i8* %193, i32 %mul)
  %196 = bitcast i8* %call304 to i8**
  store i8** %196, i8*** %result, align 4
  %197 = load i8**, i8*** %result, align 4
  %cmp305 = icmp eq i8** %197, null
  br i1 %cmp305, label %if.then307, label %if.end316

if.then307:                                       ; preds = %while.end302
  store i32 0, i32* %l, align 4
  br label %for.cond308

for.cond308:                                      ; preds = %for.inc313, %if.then307
  %198 = load i8**, i8*** %array, align 4
  %199 = load i32, i32* %l, align 4
  %arrayidx309 = getelementptr inbounds i8*, i8** %198, i32 %199
  %200 = load i8*, i8** %arrayidx309, align 4
  %tobool310 = icmp ne i8* %200, null
  br i1 %tobool310, label %for.body311, label %for.end315

for.body311:                                      ; preds = %for.cond308
  %201 = load i8**, i8*** %array, align 4
  %202 = load i32, i32* %l, align 4
  %arrayidx312 = getelementptr inbounds i8*, i8** %201, i32 %202
  %203 = load i8*, i8** %arrayidx312, align 4
  call void @sh_xfree(i8* %203, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1257)
  br label %for.inc313

for.inc313:                                       ; preds = %for.body311
  %204 = load i32, i32* %l, align 4
  %inc314 = add i32 %204, 1
  store i32 %inc314, i32* %l, align 4
  br label %for.cond308

for.end315:                                       ; preds = %for.cond308
  %205 = load i8**, i8*** %array, align 4
  %206 = bitcast i8** %205 to i8*
  call void @sh_xfree(i8* %206, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1258)
  br label %memory_error

if.end316:                                        ; preds = %while.end302
  store i32 0, i32* %l, align 4
  br label %for.cond317

for.cond317:                                      ; preds = %for.inc326, %if.end316
  %207 = load i8**, i8*** %array, align 4
  %208 = load i32, i32* %l, align 4
  %arrayidx318 = getelementptr inbounds i8*, i8** %207, i32 %208
  %209 = load i8*, i8** %arrayidx318, align 4
  %cmp319 = icmp ne i8* %209, null
  br i1 %cmp319, label %for.body321, label %for.end328

for.body321:                                      ; preds = %for.cond317
  %210 = load i8**, i8*** %array, align 4
  %211 = load i32, i32* %l, align 4
  %arrayidx322 = getelementptr inbounds i8*, i8** %210, i32 %211
  %212 = load i8*, i8** %arrayidx322, align 4
  %213 = load i8**, i8*** %result, align 4
  %214 = load i32, i32* %result_size, align 4
  %inc323 = add i32 %214, 1
  store i32 %inc323, i32* %result_size, align 4
  %sub324 = sub i32 %214, 1
  %arrayidx325 = getelementptr inbounds i8*, i8** %213, i32 %sub324
  store i8* %212, i8** %arrayidx325, align 4
  br label %for.inc326

for.inc326:                                       ; preds = %for.body321
  %215 = load i32, i32* %l, align 4
  %inc327 = add i32 %215, 1
  store i32 %inc327, i32* %l, align 4
  br label %for.cond317

for.end328:                                       ; preds = %for.cond317
  %216 = load i8**, i8*** %result, align 4
  %217 = load i32, i32* %result_size, align 4
  %sub329 = sub i32 %217, 1
  %arrayidx330 = getelementptr inbounds i8*, i8** %216, i32 %sub329
  store i8* null, i8** %arrayidx330, align 4
  %218 = load i8**, i8*** %array, align 4
  %219 = load i8**, i8*** %temp_results, align 4
  %cmp331 = icmp ne i8** %218, %219
  br i1 %cmp331, label %if.then333, label %if.else334

if.then333:                                       ; preds = %for.end328
  %220 = load i8**, i8*** %array, align 4
  %221 = bitcast i8** %220 to i8*
  call void @sh_xfree(i8* %221, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1269)
  br label %if.end354

if.else334:                                       ; preds = %for.end328
  %222 = load i32, i32* %dflags, align 4
  %and335 = and i32 %222, 16
  %tobool336 = icmp ne i32 %and335, 0
  br i1 %tobool336, label %land.lhs.true337, label %if.end353

land.lhs.true337:                                 ; preds = %if.else334
  %223 = load i8*, i8** %filename, align 4
  %arrayidx338 = getelementptr inbounds i8, i8* %223, i32 0
  %224 = load i8, i8* %arrayidx338, align 1
  %conv339 = sext i8 %224 to i32
  %cmp340 = icmp eq i32 %conv339, 42
  br i1 %cmp340, label %land.lhs.true342, label %if.end353

land.lhs.true342:                                 ; preds = %land.lhs.true337
  %225 = load i8*, i8** %filename, align 4
  %arrayidx343 = getelementptr inbounds i8, i8* %225, i32 1
  %226 = load i8, i8* %arrayidx343, align 1
  %conv344 = sext i8 %226 to i32
  %cmp345 = icmp eq i32 %conv344, 42
  br i1 %cmp345, label %land.lhs.true347, label %if.end353

land.lhs.true347:                                 ; preds = %land.lhs.true342
  %227 = load i8*, i8** %filename, align 4
  %arrayidx348 = getelementptr inbounds i8, i8* %227, i32 2
  %228 = load i8, i8* %arrayidx348, align 1
  %conv349 = sext i8 %228 to i32
  %cmp350 = icmp eq i32 %conv349, 0
  br i1 %cmp350, label %if.then352, label %if.end353

if.then352:                                       ; preds = %land.lhs.true347
  %229 = load i8**, i8*** %temp_results, align 4
  %230 = bitcast i8** %229 to i8*
  call void @sh_xfree(i8* %230, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1271)
  br label %if.end353

if.end353:                                        ; preds = %if.then352, %land.lhs.true347, %land.lhs.true342, %land.lhs.true337, %if.else334
  br label %if.end354

if.end354:                                        ; preds = %if.end353, %if.then333
  %231 = load i32, i32* %shouldbreak, align 4
  %tobool355 = icmp ne i32 %231, 0
  br i1 %tobool355, label %if.then356, label %if.end357

if.then356:                                       ; preds = %if.end354
  br label %for.end362

if.end357:                                        ; preds = %if.end354
  br label %if.end358

if.end358:                                        ; preds = %if.end357, %if.then232
  br label %if.end359

if.end359:                                        ; preds = %if.end358
  br label %for.inc360

for.inc360:                                       ; preds = %if.end359
  %232 = load i32, i32* %i, align 4
  %inc361 = add i32 %232, 1
  store i32 %inc361, i32* %i, align 4
  br label %for.cond

for.end362:                                       ; preds = %if.then356, %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond363

for.cond363:                                      ; preds = %for.inc368, %for.end362
  %233 = load i8**, i8*** %directories, align 4
  %234 = load i32, i32* %i, align 4
  %arrayidx364 = getelementptr inbounds i8*, i8** %233, i32 %234
  %235 = load i8*, i8** %arrayidx364, align 4
  %tobool365 = icmp ne i8* %235, null
  br i1 %tobool365, label %for.body366, label %for.end370

for.body366:                                      ; preds = %for.cond363
  %236 = load i8**, i8*** %directories, align 4
  %237 = load i32, i32* %i, align 4
  %arrayidx367 = getelementptr inbounds i8*, i8** %236, i32 %237
  %238 = load i8*, i8** %arrayidx367, align 4
  call void @sh_xfree(i8* %238, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1279)
  br label %for.inc368

for.inc368:                                       ; preds = %for.body366
  %239 = load i32, i32* %i, align 4
  %inc369 = add i32 %239, 1
  store i32 %inc369, i32* %i, align 4
  br label %for.cond363

for.end370:                                       ; preds = %for.cond363
  %240 = load i8**, i8*** %directories, align 4
  %241 = bitcast i8** %240 to i8*
  call void @sh_xfree(i8* %241, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1281)
  %242 = load i8**, i8*** %result, align 4
  store i8** %242, i8*** %retval, align 4
  br label %return

if.end371:                                        ; preds = %land.lhs.true16, %if.end14
  br label %only_filename

only_filename:                                    ; preds = %if.end371, %if.then187
  %243 = load i8*, i8** %filename, align 4
  %244 = load i8, i8* %243, align 1
  %conv372 = sext i8 %244 to i32
  %cmp373 = icmp eq i32 %conv372, 0
  br i1 %cmp373, label %if.then375, label %if.else398

if.then375:                                       ; preds = %only_filename
  %245 = load i8**, i8*** %result, align 4
  %246 = bitcast i8** %245 to i8*
  %call376 = call i8* @realloc(i8* %246, i32 8)
  %247 = bitcast i8* %call376 to i8**
  store i8** %247, i8*** %result, align 4
  %248 = load i8**, i8*** %result, align 4
  %cmp377 = icmp eq i8** %248, null
  br i1 %cmp377, label %if.then379, label %if.end383

if.then379:                                       ; preds = %if.then375
  %249 = load i32, i32* %free_dirname, align 4
  %tobool380 = icmp ne i32 %249, 0
  br i1 %tobool380, label %if.then381, label %if.end382

if.then381:                                       ; preds = %if.then379
  %250 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %250, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1294)
  br label %if.end382

if.end382:                                        ; preds = %if.then381, %if.then379
  store i8** null, i8*** %retval, align 4
  br label %return

if.end383:                                        ; preds = %if.then375
  %251 = load i32, i32* %directory_len, align 4
  %add384 = add i32 %251, 1
  %call385 = call i8* @malloc(i32 %add384)
  %252 = load i8**, i8*** %result, align 4
  %arrayidx386 = getelementptr inbounds i8*, i8** %252, i32 0
  store i8* %call385, i8** %arrayidx386, align 4
  %253 = load i8**, i8*** %result, align 4
  %arrayidx387 = getelementptr inbounds i8*, i8** %253, i32 0
  %254 = load i8*, i8** %arrayidx387, align 4
  %cmp388 = icmp eq i8* %254, null
  br i1 %cmp388, label %if.then390, label %if.end391

if.then390:                                       ; preds = %if.end383
  br label %memory_error

if.end391:                                        ; preds = %if.end383
  %255 = load i8*, i8** %directory_name, align 4
  %256 = load i8**, i8*** %result, align 4
  %arrayidx392 = getelementptr inbounds i8*, i8** %256, i32 0
  %257 = load i8*, i8** %arrayidx392, align 4
  %258 = load i32, i32* %directory_len, align 4
  %add393 = add i32 %258, 1
  call void @bcopy(i8* %255, i8* %257, i32 %add393)
  %259 = load i32, i32* %free_dirname, align 4
  %tobool394 = icmp ne i32 %259, 0
  br i1 %tobool394, label %if.then395, label %if.end396

if.then395:                                       ; preds = %if.end391
  %260 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %260, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1303)
  br label %if.end396

if.end396:                                        ; preds = %if.then395, %if.end391
  %261 = load i8**, i8*** %result, align 4
  %arrayidx397 = getelementptr inbounds i8*, i8** %261, i32 1
  store i8* null, i8** %arrayidx397, align 4
  %262 = load i8**, i8*** %result, align 4
  store i8** %262, i8*** %retval, align 4
  br label %return

if.else398:                                       ; preds = %only_filename
  %263 = load i32, i32* %directory_len, align 4
  %cmp400 = icmp ugt i32 %263, 0
  br i1 %cmp400, label %if.then402, label %if.end403

if.then402:                                       ; preds = %if.else398
  %264 = load i8*, i8** %directory_name, align 4
  call void @dequote_pathname(i8* %264)
  br label %if.end403

if.end403:                                        ; preds = %if.then402, %if.else398
  %265 = load i8**, i8*** %result, align 4
  %266 = bitcast i8** %265 to i8*
  call void @sh_xfree(i8* %266, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1319)
  %267 = load i32, i32* %flags.addr, align 4
  %and404 = and i32 %267, -2
  store i32 %and404, i32* %dflags, align 4
  %268 = load i32, i32* %directory_len, align 4
  %cmp405 = icmp eq i32 %268, 0
  br i1 %cmp405, label %if.then407, label %if.end409

if.then407:                                       ; preds = %if.end403
  %269 = load i32, i32* %dflags, align 4
  %or408 = or i32 %269, 256
  store i32 %or408, i32* %dflags, align 4
  br label %if.end409

if.end409:                                        ; preds = %if.then407, %if.end403
  %270 = load i32, i32* %flags.addr, align 4
  %and410 = and i32 %270, 1024
  %tobool411 = icmp ne i32 %and410, 0
  br i1 %tobool411, label %land.lhs.true412, label %if.end438

land.lhs.true412:                                 ; preds = %if.end409
  %271 = load i8*, i8** %filename, align 4
  %arrayidx413 = getelementptr inbounds i8, i8* %271, i32 0
  %272 = load i8, i8* %arrayidx413, align 1
  %conv414 = sext i8 %272 to i32
  %cmp415 = icmp eq i32 %conv414, 42
  br i1 %cmp415, label %land.lhs.true417, label %if.end438

land.lhs.true417:                                 ; preds = %land.lhs.true412
  %273 = load i8*, i8** %filename, align 4
  %arrayidx418 = getelementptr inbounds i8, i8* %273, i32 1
  %274 = load i8, i8* %arrayidx418, align 1
  %conv419 = sext i8 %274 to i32
  %cmp420 = icmp eq i32 %conv419, 42
  br i1 %cmp420, label %land.lhs.true422, label %if.end438

land.lhs.true422:                                 ; preds = %land.lhs.true417
  %275 = load i8*, i8** %filename, align 4
  %arrayidx423 = getelementptr inbounds i8, i8* %275, i32 2
  %276 = load i8, i8* %arrayidx423, align 1
  %conv424 = sext i8 %276 to i32
  %cmp425 = icmp eq i32 %conv424, 0
  br i1 %cmp425, label %if.then427, label %if.end438

if.then427:                                       ; preds = %land.lhs.true422
  %277 = load i32, i32* %dflags, align 4
  %or428 = or i32 %277, 528
  store i32 %or428, i32* %dflags, align 4
  %278 = load i32, i32* %directory_len, align 4
  %cmp429 = icmp eq i32 %278, 0
  br i1 %cmp429, label %land.lhs.true431, label %if.end437

land.lhs.true431:                                 ; preds = %if.then427
  %279 = load i32, i32* %flags.addr, align 4
  %and432 = and i32 %279, 16
  %cmp433 = icmp eq i32 %and432, 0
  br i1 %cmp433, label %if.then435, label %if.end437

if.then435:                                       ; preds = %land.lhs.true431
  %280 = load i32, i32* %dflags, align 4
  %and436 = and i32 %280, -513
  store i32 %and436, i32* %dflags, align 4
  br label %if.end437

if.end437:                                        ; preds = %if.then435, %land.lhs.true431, %if.then427
  br label %if.end438

if.end438:                                        ; preds = %if.end437, %land.lhs.true422, %land.lhs.true417, %land.lhs.true412, %if.end409
  %281 = load i8*, i8** %filename, align 4
  %282 = load i32, i32* %directory_len, align 4
  %cmp439 = icmp eq i32 %282, 0
  br i1 %cmp439, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end438
  br label %cond.end

cond.false:                                       ; preds = %if.end438
  %283 = load i8*, i8** %directory_name, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), %cond.true ], [ %283, %cond.false ]
  %284 = load i32, i32* %dflags, align 4
  %call441 = call i8** @glob_vector(i8* %281, i8* %cond, i32 %284)
  store i8** %call441, i8*** %temp_results399, align 4
  %285 = load i8**, i8*** %temp_results399, align 4
  %cmp442 = icmp eq i8** %285, null
  br i1 %cmp442, label %if.then447, label %lor.lhs.false444

lor.lhs.false444:                                 ; preds = %cond.end
  %286 = load i8**, i8*** %temp_results399, align 4
  %cmp445 = icmp eq i8** %286, @glob_error_return
  br i1 %cmp445, label %if.then447, label %if.end460

if.then447:                                       ; preds = %lor.lhs.false444, %cond.end
  %287 = load i32, i32* %free_dirname, align 4
  %tobool448 = icmp ne i32 %287, 0
  br i1 %tobool448, label %if.then449, label %if.end450

if.then449:                                       ; preds = %if.then447
  %288 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %288, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1348)
  br label %if.end450

if.end450:                                        ; preds = %if.then449, %if.then447
  br label %do.body451

do.body451:                                       ; preds = %if.end450
  %289 = load volatile i32, i32* @terminating_signal, align 4
  %tobool452 = icmp ne i32 %289, 0
  br i1 %tobool452, label %if.then453, label %if.end454

if.then453:                                       ; preds = %do.body451
  %290 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %290)
  br label %if.end454

if.end454:                                        ; preds = %if.then453, %do.body451
  %291 = load volatile i32, i32* @interrupt_state, align 4
  %tobool455 = icmp ne i32 %291, 0
  br i1 %tobool455, label %if.then456, label %if.end457

if.then456:                                       ; preds = %if.end454
  call void @throw_to_top_level()
  br label %if.end457

if.end457:                                        ; preds = %if.then456, %if.end454
  br label %do.end459

do.end459:                                        ; preds = %if.end457
  call void @run_pending_traps()
  %292 = load i8**, i8*** %temp_results399, align 4
  store i8** %292, i8*** %retval, align 4
  br label %return

if.end460:                                        ; preds = %lor.lhs.false444
  %293 = load i32, i32* %dflags, align 4
  %and461 = and i32 %293, 16
  %tobool462 = icmp ne i32 %and461, 0
  br i1 %tobool462, label %cond.true463, label %cond.false464

cond.true463:                                     ; preds = %if.end460
  br label %cond.end465

cond.false464:                                    ; preds = %if.end460
  %294 = load i8*, i8** %directory_name, align 4
  br label %cond.end465

cond.end465:                                      ; preds = %cond.false464, %cond.true463
  %cond466 = phi i8* [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), %cond.true463 ], [ %294, %cond.false464 ]
  %295 = load i8**, i8*** %temp_results399, align 4
  %296 = load i32, i32* %flags.addr, align 4
  %call467 = call i8** @glob_dir_to_array(i8* %cond466, i8** %295, i32 %296)
  store i8** %call467, i8*** %result, align 4
  %297 = load i32, i32* %free_dirname, align 4
  %tobool468 = icmp ne i32 %297, 0
  br i1 %tobool468, label %if.then469, label %if.end470

if.then469:                                       ; preds = %cond.end465
  %298 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %298, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1357)
  br label %if.end470

if.end470:                                        ; preds = %if.then469, %cond.end465
  %299 = load i8**, i8*** %result, align 4
  store i8** %299, i8*** %retval, align 4
  br label %return

memory_error:                                     ; preds = %if.then390, %for.end315, %if.then228, %if.then159
  %300 = load i8**, i8*** %result, align 4
  %cmp471 = icmp ne i8** %300, null
  br i1 %cmp471, label %if.then473, label %if.end484

if.then473:                                       ; preds = %memory_error
  store i32 0, i32* %i474, align 4
  br label %for.cond475

for.cond475:                                      ; preds = %for.inc481, %if.then473
  %301 = load i8**, i8*** %result, align 4
  %302 = load i32, i32* %i474, align 4
  %arrayidx476 = getelementptr inbounds i8*, i8** %301, i32 %302
  %303 = load i8*, i8** %arrayidx476, align 4
  %cmp477 = icmp ne i8* %303, null
  br i1 %cmp477, label %for.body479, label %for.end483

for.body479:                                      ; preds = %for.cond475
  %304 = load i8**, i8*** %result, align 4
  %305 = load i32, i32* %i474, align 4
  %arrayidx480 = getelementptr inbounds i8*, i8** %304, i32 %305
  %306 = load i8*, i8** %arrayidx480, align 4
  call void @sh_xfree(i8* %306, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1368)
  br label %for.inc481

for.inc481:                                       ; preds = %for.body479
  %307 = load i32, i32* %i474, align 4
  %inc482 = add i32 %307, 1
  store i32 %inc482, i32* %i474, align 4
  br label %for.cond475

for.end483:                                       ; preds = %for.cond475
  %308 = load i8**, i8*** %result, align 4
  %309 = bitcast i8** %308 to i8*
  call void @sh_xfree(i8* %309, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1369)
  br label %if.end484

if.end484:                                        ; preds = %for.end483, %memory_error
  %310 = load i32, i32* %free_dirname, align 4
  %tobool485 = icmp ne i32 %310, 0
  br i1 %tobool485, label %land.lhs.true486, label %if.end489

land.lhs.true486:                                 ; preds = %if.end484
  %311 = load i8*, i8** %directory_name, align 4
  %tobool487 = icmp ne i8* %311, null
  br i1 %tobool487, label %if.then488, label %if.end489

if.then488:                                       ; preds = %land.lhs.true486
  %312 = load i8*, i8** %directory_name, align 4
  call void @sh_xfree(i8* %312, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1373)
  br label %if.end489

if.end489:                                        ; preds = %if.then488, %land.lhs.true486, %if.end484
  br label %do.body490

do.body490:                                       ; preds = %if.end489
  %313 = load volatile i32, i32* @terminating_signal, align 4
  %tobool491 = icmp ne i32 %313, 0
  br i1 %tobool491, label %if.then492, label %if.end493

if.then492:                                       ; preds = %do.body490
  %314 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %314)
  br label %if.end493

if.end493:                                        ; preds = %if.then492, %do.body490
  %315 = load volatile i32, i32* @interrupt_state, align 4
  %tobool494 = icmp ne i32 %315, 0
  br i1 %tobool494, label %if.then495, label %if.end496

if.then495:                                       ; preds = %if.end493
  call void @throw_to_top_level()
  br label %if.end496

if.end496:                                        ; preds = %if.then495, %if.end493
  br label %do.end498

do.end498:                                        ; preds = %if.end496
  call void @run_pending_traps()
  store i8** null, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %do.end498, %if.end470, %do.end459, %if.end396, %if.end382, %for.end370, %if.then167, %if.then163, %if.then11, %if.then
  %316 = load i8**, i8*** %retval, align 4
  ret i8** %316
}

declare i8* @strrchr(i8*, i32) #1

declare i8* @glob_dirscan(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8** @glob_dir_to_array(i8* %dir, i8** %array, i32 %flags) #0 {
entry:
  %retval = alloca i8**, align 4
  %dir.addr = alloca i8*, align 4
  %array.addr = alloca i8**, align 4
  %flags.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %add_slash = alloca i32, align 4
  %result = alloca i8**, align 4
  %new = alloca i8*, align 4
  %sb = alloca %struct.stat, align 8
  %ind = alloca i32, align 4
  %rlen = alloca i32, align 4
  store i8* %dir, i8** %dir.addr, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %dir.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %l, align 4
  %1 = load i32, i32* %l, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end21

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end20

if.then1:                                         ; preds = %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then1
  %3 = load i8**, i8*** %array.addr, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 %4
  %5 = load i8*, i8** %arrayidx, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i8**, i8*** %array.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx3, align 4
  %call4 = call i32 @stat(i8* %8, %struct.stat* %sb)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %land.lhs.true, label %if.end19

land.lhs.true:                                    ; preds = %for.body
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 6
  %9 = load i32, i32* %st_mode, align 8
  %and6 = and i32 %9, 61440
  %cmp7 = icmp eq i32 %and6, 16384
  br i1 %cmp7, label %if.then8, label %if.end19

if.then8:                                         ; preds = %land.lhs.true
  %10 = load i8**, i8*** %array.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx9, align 4
  %call10 = call i32 @strlen(i8* %12)
  store i32 %call10, i32* %l, align 4
  %13 = load i8**, i8*** %array.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %13, i32 %14
  %15 = load i8*, i8** %arrayidx11, align 4
  %16 = load i32, i32* %l, align 4
  %add = add i32 %16, 2
  %call12 = call i8* @realloc(i8* %15, i32 %add)
  store i8* %call12, i8** %new, align 4
  %17 = load i8*, i8** %new, align 4
  %cmp13 = icmp eq i8* %17, null
  br i1 %cmp13, label %if.then14, label %if.end

if.then14:                                        ; preds = %if.then8
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then8
  %18 = load i8*, i8** %new, align 4
  %19 = load i32, i32* %l, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 47, i8* %arrayidx15, align 1
  %20 = load i8*, i8** %new, align 4
  %21 = load i32, i32* %l, align 4
  %add16 = add i32 %21, 1
  %arrayidx17 = getelementptr inbounds i8, i8* %20, i32 %add16
  store i8 0, i8* %arrayidx17, align 1
  %22 = load i8*, i8** %new, align 4
  %23 = load i8**, i8*** %array.addr, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %23, i32 %24
  store i8* %22, i8** %arrayidx18, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.end, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %25 = load i32, i32* %i, align 4
  %inc = add i32 %25, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end20

if.end20:                                         ; preds = %for.end, %if.then
  %26 = load i8**, i8*** %array.addr, align 4
  store i8** %26, i8*** %retval, align 4
  br label %return

if.end21:                                         ; preds = %entry
  %27 = load i8*, i8** %dir.addr, align 4
  %28 = load i32, i32* %l, align 4
  %sub = sub i32 %28, 1
  %arrayidx22 = getelementptr inbounds i8, i8* %27, i32 %sub
  %29 = load i8, i8* %arrayidx22, align 1
  %conv = sext i8 %29 to i32
  %cmp23 = icmp ne i32 %conv, 47
  %conv24 = zext i1 %cmp23 to i32
  store i32 %conv24, i32* %add_slash, align 4
  store i32 0, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end21
  %30 = load i8**, i8*** %array.addr, align 4
  %31 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx25, align 4
  %cmp26 = icmp ne i8* %32, null
  br i1 %cmp26, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %33 = load i32, i32* %i, align 4
  %inc28 = add i32 %33, 1
  store i32 %inc28, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %34 = load i32, i32* %i, align 4
  %add29 = add i32 %34, 1
  %mul = mul i32 %add29, 4
  %call30 = call i8* @malloc(i32 %mul)
  %35 = bitcast i8* %call30 to i8**
  store i8** %35, i8*** %result, align 4
  %36 = load i8**, i8*** %result, align 4
  %cmp31 = icmp eq i8** %36, null
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %while.end
  store i8** null, i8*** %retval, align 4
  br label %return

if.end34:                                         ; preds = %while.end
  store i32 0, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc92, %if.end34
  %37 = load i8**, i8*** %array.addr, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx36, align 4
  %cmp37 = icmp ne i8* %39, null
  br i1 %cmp37, label %for.body39, label %for.end94

for.body39:                                       ; preds = %for.cond35
  %40 = load i32, i32* %l, align 4
  %41 = load i8**, i8*** %array.addr, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %41, i32 %42
  %43 = load i8*, i8** %arrayidx40, align 4
  %call41 = call i32 @strlen(i8* %43)
  %add42 = add i32 %40, %call41
  %add43 = add i32 %add42, 3
  %call44 = call i8* @malloc(i32 %add43)
  %44 = load i8**, i8*** %result, align 4
  %45 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds i8*, i8** %44, i32 %45
  store i8* %call44, i8** %arrayidx45, align 4
  %46 = load i8**, i8*** %result, align 4
  %47 = load i32, i32* %i, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %46, i32 %47
  %48 = load i8*, i8** %arrayidx46, align 4
  %cmp47 = icmp eq i8* %48, null
  br i1 %cmp47, label %if.then49, label %if.end58

if.then49:                                        ; preds = %for.body39
  store i32 0, i32* %ind, align 4
  br label %for.cond50

for.cond50:                                       ; preds = %for.inc55, %if.then49
  %49 = load i32, i32* %ind, align 4
  %50 = load i32, i32* %i, align 4
  %cmp51 = icmp ult i32 %49, %50
  br i1 %cmp51, label %for.body53, label %for.end57

for.body53:                                       ; preds = %for.cond50
  %51 = load i8**, i8*** %result, align 4
  %52 = load i32, i32* %ind, align 4
  %arrayidx54 = getelementptr inbounds i8*, i8** %51, i32 %52
  %53 = load i8*, i8** %arrayidx54, align 4
  call void @sh_xfree(i8* %53, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 981)
  br label %for.inc55

for.inc55:                                        ; preds = %for.body53
  %54 = load i32, i32* %ind, align 4
  %inc56 = add nsw i32 %54, 1
  store i32 %inc56, i32* %ind, align 4
  br label %for.cond50

for.end57:                                        ; preds = %for.cond50
  %55 = load i8**, i8*** %result, align 4
  %56 = bitcast i8** %55 to i8*
  call void @sh_xfree(i8* %56, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 982)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end58:                                         ; preds = %for.body39
  %57 = load i8**, i8*** %result, align 4
  %58 = load i32, i32* %i, align 4
  %arrayidx59 = getelementptr inbounds i8*, i8** %57, i32 %58
  %59 = load i8*, i8** %arrayidx59, align 4
  %60 = load i8*, i8** %dir.addr, align 4
  %call60 = call i8* @strcpy(i8* %59, i8* %60)
  %61 = load i32, i32* %add_slash, align 4
  %tobool61 = icmp ne i32 %61, 0
  br i1 %tobool61, label %if.then62, label %if.end65

if.then62:                                        ; preds = %if.end58
  %62 = load i8**, i8*** %result, align 4
  %63 = load i32, i32* %i, align 4
  %arrayidx63 = getelementptr inbounds i8*, i8** %62, i32 %63
  %64 = load i8*, i8** %arrayidx63, align 4
  %65 = load i32, i32* %l, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %64, i32 %65
  store i8 47, i8* %arrayidx64, align 1
  br label %if.end65

if.end65:                                         ; preds = %if.then62, %if.end58
  %66 = load i8**, i8*** %result, align 4
  %67 = load i32, i32* %i, align 4
  %arrayidx66 = getelementptr inbounds i8*, i8** %66, i32 %67
  %68 = load i8*, i8** %arrayidx66, align 4
  %69 = load i32, i32* %l, align 4
  %add.ptr = getelementptr inbounds i8, i8* %68, i32 %69
  %70 = load i32, i32* %add_slash, align 4
  %add.ptr67 = getelementptr inbounds i8, i8* %add.ptr, i32 %70
  %71 = load i8**, i8*** %array.addr, align 4
  %72 = load i32, i32* %i, align 4
  %arrayidx68 = getelementptr inbounds i8*, i8** %71, i32 %72
  %73 = load i8*, i8** %arrayidx68, align 4
  %call69 = call i8* @strcpy(i8* %add.ptr67, i8* %73)
  %74 = load i32, i32* %flags.addr, align 4
  %and70 = and i32 %74, 1
  %tobool71 = icmp ne i32 %and70, 0
  br i1 %tobool71, label %if.then72, label %if.end91

if.then72:                                        ; preds = %if.end65
  %75 = load i8**, i8*** %result, align 4
  %76 = load i32, i32* %i, align 4
  %arrayidx73 = getelementptr inbounds i8*, i8** %75, i32 %76
  %77 = load i8*, i8** %arrayidx73, align 4
  %call74 = call i32 @stat(i8* %77, %struct.stat* %sb)
  %cmp75 = icmp eq i32 %call74, 0
  br i1 %cmp75, label %land.lhs.true77, label %if.end90

land.lhs.true77:                                  ; preds = %if.then72
  %st_mode78 = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 6
  %78 = load i32, i32* %st_mode78, align 8
  %and79 = and i32 %78, 61440
  %cmp80 = icmp eq i32 %and79, 16384
  br i1 %cmp80, label %if.then82, label %if.end90

if.then82:                                        ; preds = %land.lhs.true77
  %79 = load i8**, i8*** %result, align 4
  %80 = load i32, i32* %i, align 4
  %arrayidx83 = getelementptr inbounds i8*, i8** %79, i32 %80
  %81 = load i8*, i8** %arrayidx83, align 4
  %call84 = call i32 @strlen(i8* %81)
  store i32 %call84, i32* %rlen, align 4
  %82 = load i8**, i8*** %result, align 4
  %83 = load i32, i32* %i, align 4
  %arrayidx85 = getelementptr inbounds i8*, i8** %82, i32 %83
  %84 = load i8*, i8** %arrayidx85, align 4
  %85 = load i32, i32* %rlen, align 4
  %arrayidx86 = getelementptr inbounds i8, i8* %84, i32 %85
  store i8 47, i8* %arrayidx86, align 1
  %86 = load i8**, i8*** %result, align 4
  %87 = load i32, i32* %i, align 4
  %arrayidx87 = getelementptr inbounds i8*, i8** %86, i32 %87
  %88 = load i8*, i8** %arrayidx87, align 4
  %89 = load i32, i32* %rlen, align 4
  %add88 = add i32 %89, 1
  %arrayidx89 = getelementptr inbounds i8, i8* %88, i32 %add88
  store i8 0, i8* %arrayidx89, align 1
  br label %if.end90

if.end90:                                         ; preds = %if.then82, %land.lhs.true77, %if.then72
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.end65
  br label %for.inc92

for.inc92:                                        ; preds = %if.end91
  %90 = load i32, i32* %i, align 4
  %inc93 = add i32 %90, 1
  store i32 %inc93, i32* %i, align 4
  br label %for.cond35

for.end94:                                        ; preds = %for.cond35
  %91 = load i8**, i8*** %result, align 4
  %92 = load i32, i32* %i, align 4
  %arrayidx95 = getelementptr inbounds i8*, i8** %91, i32 %92
  store i8* null, i8** %arrayidx95, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond96

for.cond96:                                       ; preds = %for.inc102, %for.end94
  %93 = load i8**, i8*** %array.addr, align 4
  %94 = load i32, i32* %i, align 4
  %arrayidx97 = getelementptr inbounds i8*, i8** %93, i32 %94
  %95 = load i8*, i8** %arrayidx97, align 4
  %cmp98 = icmp ne i8* %95, null
  br i1 %cmp98, label %for.body100, label %for.end104

for.body100:                                      ; preds = %for.cond96
  %96 = load i8**, i8*** %array.addr, align 4
  %97 = load i32, i32* %i, align 4
  %arrayidx101 = getelementptr inbounds i8*, i8** %96, i32 %97
  %98 = load i8*, i8** %arrayidx101, align 4
  call void @sh_xfree(i8* %98, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1005)
  br label %for.inc102

for.inc102:                                       ; preds = %for.body100
  %99 = load i32, i32* %i, align 4
  %inc103 = add i32 %99, 1
  store i32 %inc103, i32* %i, align 4
  br label %for.cond96

for.end104:                                       ; preds = %for.cond96
  %100 = load i8**, i8*** %array.addr, align 4
  %101 = bitcast i8** %100 to i8*
  call void @sh_xfree(i8* %101, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 1006)
  %102 = load i8**, i8*** %result, align 4
  store i8** %102, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end104, %for.end57, %if.then33, %if.end20, %if.then14
  %103 = load i8**, i8*** %retval, align 4
  ret i8** %103
}

declare i8* @realloc(i8*, i32) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare void @run_pending_traps() #1

declare i32 @stat(i8*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define internal void @wdequote_pathname(i8* %pathname) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %len = alloca i32, align 4
  %n = alloca i32, align 4
  %wpathname = alloca i32*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %orig_wpathname = alloca i32*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  %0 = load i8*, i8** %pathname.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %len, align 4
  %1 = load i8*, i8** %pathname.addr, align 4
  %call1 = call i32 @xdupmbstowcs(i32** %wpathname, i8*** null, i8* %1)
  store i32 %call1, i32* %n, align 4
  %2 = load i32, i32* %n, align 4
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %pathname.addr, align 4
  call void @udequote_pathname(i8* %3)
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %wpathname, align 4
  store i32* %4, i32** %orig_wpathname, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end14, %if.end
  %5 = load i32*, i32** %wpathname, align 4
  %tobool = icmp ne i32* %5, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %6 = load i32*, i32** %wpathname, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %6, i32 %7
  %8 = load i32, i32* %arrayidx, align 4
  %tobool2 = icmp ne i32 %8, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %9 = phi i1 [ false, %for.cond ], [ %tobool2, %land.rhs ]
  br i1 %9, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %10 = load i32*, i32** %wpathname, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %10, i32 %11
  %12 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp eq i32 %12, 92
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %for.body
  %14 = load i32*, i32** %wpathname, align 4
  %15 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %15, 1
  store i32 %inc7, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %14, i32 %15
  %16 = load i32, i32* %arrayidx8, align 4
  %17 = load i32*, i32** %wpathname, align 4
  %18 = load i32, i32* %j, align 4
  %inc9 = add nsw i32 %18, 1
  store i32 %inc9, i32* %j, align 4
  %arrayidx10 = getelementptr inbounds i32, i32* %17, i32 %18
  store i32 %16, i32* %arrayidx10, align 4
  %19 = load i32*, i32** %wpathname, align 4
  %20 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %20, 1
  %arrayidx11 = getelementptr inbounds i32, i32* %19, i32 %sub
  %21 = load i32, i32* %arrayidx11, align 4
  %cmp12 = icmp eq i32 %21, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end6
  br label %for.end

if.end14:                                         ; preds = %if.end6
  br label %for.cond

for.end:                                          ; preds = %if.then13, %land.end
  %22 = load i32*, i32** %wpathname, align 4
  %tobool15 = icmp ne i32* %22, null
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %for.end
  %23 = load i32*, i32** %wpathname, align 4
  %24 = load i32, i32* %j, align 4
  %arrayidx17 = getelementptr inbounds i32, i32* %23, i32 %24
  store i32 0, i32* %arrayidx17, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %for.end
  %25 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %25, i8 0, i32 8, i32 4, i1 false)
  %26 = load i8*, i8** %pathname.addr, align 4
  %27 = load i32, i32* %len, align 4
  %call19 = call i32 @wcsrtombs(i8* %26, i32** %wpathname, i32 %27, %struct.__mbstate_t* %ps)
  store i32 %call19, i32* %n, align 4
  %28 = load i8*, i8** %pathname.addr, align 4
  %29 = load i32, i32* %len, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %28, i32 %29
  store i8 0, i8* %arrayidx20, align 1
  %30 = load i32*, i32** %orig_wpathname, align 4
  %31 = bitcast i32* %30 to i8*
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 432)
  br label %return

return:                                           ; preds = %if.end18, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @udequote_pathname(i8* %pathname) #0 {
entry:
  %pathname.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end14, %entry
  %0 = load i8*, i8** %pathname.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %1 = load i8*, i8** %pathname.addr, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %pathname.addr, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv3, 92
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %9 = load i8*, i8** %pathname.addr, align 4
  %10 = load i32, i32* %i, align 4
  %inc5 = add nsw i32 %10, 1
  store i32 %inc5, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx6, align 1
  %12 = load i8*, i8** %pathname.addr, align 4
  %13 = load i32, i32* %j, align 4
  %inc7 = add nsw i32 %13, 1
  store i32 %inc7, i32* %j, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 %11, i8* %arrayidx8, align 1
  %14 = load i8*, i8** %pathname.addr, align 4
  %15 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %15, 1
  %arrayidx9 = getelementptr inbounds i8, i8* %14, i32 %sub
  %16 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %16 to i32
  %cmp11 = icmp eq i32 %conv10, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  br label %for.end

if.end14:                                         ; preds = %if.end
  br label %for.cond

for.end:                                          ; preds = %if.then13, %land.end
  %17 = load i8*, i8** %pathname.addr, align 4
  %tobool15 = icmp ne i8* %17, null
  br i1 %tobool15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %for.end
  %18 = load i8*, i8** %pathname.addr, align 4
  %19 = load i32, i32* %j, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 0, i8* %arrayidx17, align 1
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %for.end
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @wcsrtombs(i8*, i32**, i32, %struct.__mbstate_t*) #1

declare i8* @mbsmbchar(i8*) #1

declare i32 @extglob_pattern_p(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @wextglob_skipname(i32* %pat, i32* %dname, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i32*, align 4
  %dname.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %pp = alloca i32*, align 4
  %pe = alloca i32*, align 4
  %t = alloca i32*, align 4
  %n = alloca i32, align 4
  %se = alloca i32*, align 4
  %r = alloca i32, align 4
  %negate = alloca i32, align 4
  store i32* %pat, i32** %pat.addr, align 4
  store i32* %dname, i32** %dname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %pat.addr, align 4
  %1 = load i32, i32* %0, align 4
  %cmp = icmp eq i32 %1, 33
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %negate, align 4
  %2 = load i32*, i32** %pat.addr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %2, i32 2
  store i32* %add.ptr, i32** %pp, align 4
  %3 = load i32*, i32** %pp, align 4
  %4 = load i32*, i32** %pp, align 4
  %call = call i32 @wcslen(i32* %4)
  %add.ptr1 = getelementptr inbounds i32, i32* %3, i32 %call
  %add.ptr2 = getelementptr inbounds i32, i32* %add.ptr1, i32 -1
  store i32* %add.ptr2, i32** %se, align 4
  %5 = load i32*, i32** %pp, align 4
  %6 = load i32*, i32** %se, align 4
  %call3 = call i32* @glob_patscan_wc(i32* %5, i32* %6, i32 0)
  store i32* %call3, i32** %pe, align 4
  %7 = load i32*, i32** %pe, align 4
  %8 = load i32*, i32** %se, align 4
  %cmp4 = icmp eq i32* %7, %8
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %9 = load i32*, i32** %pe, align 4
  %10 = load i32, i32* %9, align 4
  %cmp6 = icmp eq i32 %10, 41
  br i1 %cmp6, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true
  %11 = load i32*, i32** %pp, align 4
  %call9 = call i32* @wcschr(i32* %11, i32 124)
  store i32* %call9, i32** %t, align 4
  %cmp10 = icmp eq i32* %call9, null
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  %12 = load i32*, i32** %pe, align 4
  store i32 0, i32* %12, align 4
  %13 = load i32*, i32** %pp, align 4
  %14 = load i32*, i32** %dname.addr, align 4
  %call12 = call i32 @wchkname(i32* %13, i32* %14)
  store i32 %call12, i32* %r, align 4
  %15 = load i32*, i32** %pe, align 4
  store i32 41, i32* %15, align 4
  %16 = load i32, i32* %r, align 4
  store i32 %16, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end20, %if.end
  %17 = load i32*, i32** %pp, align 4
  %18 = load i32*, i32** %pe, align 4
  %call13 = call i32* @glob_patscan_wc(i32* %17, i32* %18, i32 124)
  store i32* %call13, i32** %t, align 4
  %tobool = icmp ne i32* %call13, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %19 = load i32*, i32** %t, align 4
  %arrayidx = getelementptr inbounds i32, i32* %19, i32 -1
  %20 = load i32, i32* %arrayidx, align 4
  store i32 %20, i32* %n, align 4
  %21 = load i32*, i32** %t, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %21, i32 -1
  store i32 0, i32* %arrayidx14, align 4
  %22 = load i32*, i32** %pp, align 4
  %23 = load i32*, i32** %dname.addr, align 4
  %call15 = call i32 @wchkname(i32* %22, i32* %23)
  store i32 %call15, i32* %r, align 4
  %24 = load i32, i32* %n, align 4
  %25 = load i32*, i32** %t, align 4
  %arrayidx16 = getelementptr inbounds i32, i32* %25, i32 -1
  store i32 %24, i32* %arrayidx16, align 4
  %26 = load i32, i32* %r, align 4
  %cmp17 = icmp eq i32 %26, 0
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %while.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %while.body
  %27 = load i32*, i32** %t, align 4
  store i32* %27, i32** %pp, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %28 = load i32*, i32** %pp, align 4
  %29 = load i32*, i32** %pe, align 4
  %cmp21 = icmp eq i32* %28, %29
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %while.end
  %30 = load i32, i32* %r, align 4
  store i32 %30, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %while.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end24, %if.then23, %if.then19, %if.then
  %31 = load i32, i32* %retval, align 4
  ret i32 %31
}

; Function Attrs: noinline nounwind
define internal i32 @wchkname(i32* %pat_wc, i32* %dn_wc) #0 {
entry:
  %retval = alloca i32, align 4
  %pat_wc.addr = alloca i32*, align 4
  %dn_wc.addr = alloca i32*, align 4
  store i32* %pat_wc, i32** %pat_wc.addr, align 4
  store i32* %dn_wc, i32** %dn_wc.addr, align 4
  %0 = load i32, i32* @noglob_dot_filenames, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %1, i32 0
  %2 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp ne i32 %2, 46
  br i1 %cmp1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %3, i32 0
  %4 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp ne i32 %4, 92
  br i1 %cmp4, label %land.lhs.true7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true2
  %5 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i32 1
  %6 = load i32, i32* %arrayidx5, align 4
  %cmp6 = icmp ne i32 %6, 46
  br i1 %cmp6, label %land.lhs.true7, label %if.else

land.lhs.true7:                                   ; preds = %lor.lhs.false, %land.lhs.true2
  %7 = load i32*, i32** %dn_wc.addr, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i32 0
  %8 = load i32, i32* %arrayidx8, align 4
  %cmp9 = icmp eq i32 %8, 46
  br i1 %cmp9, label %land.lhs.true10, label %if.else

land.lhs.true10:                                  ; preds = %land.lhs.true7
  %9 = load i32*, i32** %dn_wc.addr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %9, i32 1
  %10 = load i32, i32* %arrayidx11, align 4
  %cmp12 = icmp eq i32 %10, 0
  br i1 %cmp12, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %land.lhs.true10
  %11 = load i32*, i32** %dn_wc.addr, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %11, i32 1
  %12 = load i32, i32* %arrayidx14, align 4
  %cmp15 = icmp eq i32 %12, 46
  br i1 %cmp15, label %land.lhs.true16, label %if.else

land.lhs.true16:                                  ; preds = %lor.lhs.false13
  %13 = load i32*, i32** %dn_wc.addr, align 4
  %arrayidx17 = getelementptr inbounds i32, i32* %13, i32 2
  %14 = load i32, i32* %arrayidx17, align 4
  %cmp18 = icmp eq i32 %14, 0
  br i1 %cmp18, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true16, %land.lhs.true10
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true16, %lor.lhs.false13, %land.lhs.true7, %lor.lhs.false, %land.lhs.true, %entry
  %15 = load i32, i32* @noglob_dot_filenames, align 4
  %tobool = icmp ne i32 %15, 0
  br i1 %tobool, label %land.lhs.true19, label %if.end

land.lhs.true19:                                  ; preds = %if.else
  %16 = load i32*, i32** %dn_wc.addr, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %16, i32 0
  %17 = load i32, i32* %arrayidx20, align 4
  %cmp21 = icmp eq i32 %17, 46
  br i1 %cmp21, label %land.lhs.true22, label %if.end

land.lhs.true22:                                  ; preds = %land.lhs.true19
  %18 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %18, i32 0
  %19 = load i32, i32* %arrayidx23, align 4
  %cmp24 = icmp ne i32 %19, 46
  br i1 %cmp24, label %land.lhs.true25, label %if.end

land.lhs.true25:                                  ; preds = %land.lhs.true22
  %20 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx26 = getelementptr inbounds i32, i32* %20, i32 0
  %21 = load i32, i32* %arrayidx26, align 4
  %cmp27 = icmp ne i32 %21, 92
  br i1 %cmp27, label %if.then31, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %land.lhs.true25
  %22 = load i32*, i32** %pat_wc.addr, align 4
  %arrayidx29 = getelementptr inbounds i32, i32* %22, i32 1
  %23 = load i32, i32* %arrayidx29, align 4
  %cmp30 = icmp ne i32 %23, 46
  br i1 %cmp30, label %if.then31, label %if.end

if.then31:                                        ; preds = %lor.lhs.false28, %land.lhs.true25
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false28, %land.lhs.true22, %land.lhs.true19, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end32, %if.then31, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i32 @wcslen(i32*) #1

declare i32* @glob_patscan_wc(i32*, i32*, i32) #1

declare i32* @wcschr(i32*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @extglob_skipname(i8* %pat, i8* %dname, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  %dname.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %pp = alloca i8*, align 4
  %pe = alloca i8*, align 4
  %t = alloca i8*, align 4
  %se = alloca i8*, align 4
  %n = alloca i32, align 4
  %r = alloca i32, align 4
  %negate = alloca i32, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %dname, i8** %dname.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 33
  %conv1 = zext i1 %cmp to i32
  store i32 %conv1, i32* %negate, align 4
  %2 = load i8*, i8** %pat.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 2
  store i8* %add.ptr, i8** %pp, align 4
  %3 = load i8*, i8** %pp, align 4
  %4 = load i8*, i8** %pp, align 4
  %call = call i32 @strlen(i8* %4)
  %add.ptr2 = getelementptr inbounds i8, i8* %3, i32 %call
  %add.ptr3 = getelementptr inbounds i8, i8* %add.ptr2, i32 -1
  store i8* %add.ptr3, i8** %se, align 4
  %5 = load i8*, i8** %pp, align 4
  %6 = load i8*, i8** %se, align 4
  %call4 = call i8* @glob_patscan(i8* %5, i8* %6, i32 0)
  store i8* %call4, i8** %pe, align 4
  %7 = load i8*, i8** %pe, align 4
  %cmp5 = icmp eq i8* %7, null
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %8 = load i8*, i8** %pe, align 4
  %9 = load i8*, i8** %se, align 4
  %cmp7 = icmp eq i8* %8, %9
  br i1 %cmp7, label %land.lhs.true, label %if.end18

land.lhs.true:                                    ; preds = %if.end
  %10 = load i8*, i8** %pe, align 4
  %11 = load i8, i8* %10, align 1
  %conv9 = sext i8 %11 to i32
  %cmp10 = icmp eq i32 %conv9, 41
  br i1 %cmp10, label %land.lhs.true12, label %if.end18

land.lhs.true12:                                  ; preds = %land.lhs.true
  %12 = load i8*, i8** %pp, align 4
  %call13 = call i8* @strchr(i8* %12, i32 124)
  store i8* %call13, i8** %t, align 4
  %cmp14 = icmp eq i8* %call13, null
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %land.lhs.true12
  %13 = load i8*, i8** %pe, align 4
  store i8 0, i8* %13, align 1
  %14 = load i8*, i8** %pp, align 4
  %15 = load i8*, i8** %dname.addr, align 4
  %16 = load i32, i32* %flags.addr, align 4
  %call17 = call i32 @mbskipname(i8* %14, i8* %15, i32 %16)
  store i32 %call17, i32* %r, align 4
  %17 = load i8*, i8** %pe, align 4
  store i8 41, i8* %17, align 1
  %18 = load i32, i32* %r, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %land.lhs.true12, %land.lhs.true, %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end28, %if.end18
  %19 = load i8*, i8** %pp, align 4
  %20 = load i8*, i8** %pe, align 4
  %call19 = call i8* @glob_patscan(i8* %19, i8* %20, i32 124)
  store i8* %call19, i8** %t, align 4
  %tobool = icmp ne i8* %call19, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %21 = load i8*, i8** %t, align 4
  %arrayidx = getelementptr inbounds i8, i8* %21, i32 -1
  %22 = load i8, i8* %arrayidx, align 1
  %conv20 = sext i8 %22 to i32
  store i32 %conv20, i32* %n, align 4
  %23 = load i8*, i8** %t, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %23, i32 -1
  store i8 0, i8* %arrayidx21, align 1
  %24 = load i8*, i8** %pp, align 4
  %25 = load i8*, i8** %dname.addr, align 4
  %26 = load i32, i32* %flags.addr, align 4
  %call22 = call i32 @mbskipname(i8* %24, i8* %25, i32 %26)
  store i32 %call22, i32* %r, align 4
  %27 = load i32, i32* %n, align 4
  %conv23 = trunc i32 %27 to i8
  %28 = load i8*, i8** %t, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %28, i32 -1
  store i8 %conv23, i8* %arrayidx24, align 1
  %29 = load i32, i32* %r, align 4
  %cmp25 = icmp eq i32 %29, 0
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %while.body
  %30 = load i32, i32* %r, align 4
  store i32 %30, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %while.body
  %31 = load i8*, i8** %t, align 4
  store i8* %31, i8** %pp, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %32 = load i8*, i8** %pp, align 4
  %33 = load i8*, i8** %se, align 4
  %cmp29 = icmp eq i8* %32, %33
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %while.end
  %34 = load i32, i32* %r, align 4
  store i32 %34, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %while.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end32, %if.then31, %if.then27, %if.then16, %if.then
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

declare i8* @glob_patscan(i8*, i8*, i32) #1

declare i8* @strchr(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
