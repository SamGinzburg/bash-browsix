; ModuleID = 'ulimit.c'
source_filename = "ulimit.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.RESOURCE_LIMITS = type { i32, i32, i32, i8*, i8* }
%struct._cmd = type { i32, i8* }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.rlimit = type { i64, i64 }

@optstring = internal global [38 x i8] zeroinitializer, align 1
@limits = internal global [17 x %struct.RESOURCE_LIMITS] [%struct.RESOURCE_LIMITS { i32 99, i32 4, i32 -2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 100, i32 2, i32 1024, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 101, i32 13, i32 1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 102, i32 1, i32 -2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 105, i32 11, i32 1, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 108, i32 8, i32 1024, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 109, i32 5, i32 1024, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 110, i32 7, i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 112, i32 257, i32 512, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 113, i32 12, i32 1, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 114, i32 14, i32 1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 115, i32 3, i32 1024, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 116, i32 0, i32 1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 117, i32 6, i32 1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.20, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 118, i32 9, i32 1024, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0) }, %struct.RESOURCE_LIMITS { i32 120, i32 10, i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.22, i32 0, i32 0), i8* null }, %struct.RESOURCE_LIMITS { i32 -1, i32 -1, i32 -1, i8* null, i8* null }], align 4
@cmdlistsz = internal global i32 0, align 4
@.str = private unnamed_addr constant [13 x i8] c"./ulimit.def\00", align 1
@cmdlist = internal global %struct._cmd* null, align 4
@ncmd = internal global i32 0, align 4
@list_optarg = external global i8*, align 4
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"`%c': bad command\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"core file size\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"blocks\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"data seg size\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"kbytes\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"scheduling priority\00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"file size\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"pending signals\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"max locked memory\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"max memory size\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"open files\00", align 1
@.str.12 = private unnamed_addr constant [10 x i8] c"pipe size\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"512 bytes\00", align 1
@.str.14 = private unnamed_addr constant [21 x i8] c"POSIX message queues\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"bytes\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"real-time priority\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"stack size\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"cpu time\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"seconds\00", align 1
@.str.20 = private unnamed_addr constant [19 x i8] c"max user processes\00", align 1
@.str.21 = private unnamed_addr constant [15 x i8] c"virtual memory\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c"file locks\00", align 1
@.str.23 = private unnamed_addr constant [25 x i8] c"%s: cannot get limit: %s\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"hard\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"soft\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"unlimited\00", align 1
@posixly_correct = external global i32, align 4
@.str.27 = private unnamed_addr constant [6 x i8] c"limit\00", align 1
@.str.28 = private unnamed_addr constant [28 x i8] c"%s: cannot modify limit: %s\00", align 1
@.str.29 = private unnamed_addr constant [11 x i8] c"(%s, -%c) \00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"(-%c) \00", align 1
@.str.31 = private unnamed_addr constant [11 x i8] c"%-20s %16s\00", align 1
@current_user = external global %struct.user_info, align 4

; Function Attrs: noinline nounwind
define i32 @ulimit_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %s = alloca i8*, align 4
  %c = alloca i32, align 4
  %limind = alloca i32, align 4
  %mode = alloca i32, align 4
  %opt = alloca i32, align 4
  %all_limits = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %mode, align 4
  store i32 0, i32* %all_limits, align 4
  %0 = load i8, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @optstring, i32 0, i32 0), align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([38 x i8], [38 x i8]* @optstring, i32 0, i32 0), i8** %s, align 4
  %1 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  store i8 97, i8* %1, align 1
  %2 = load i8*, i8** %s, align 4
  %incdec.ptr2 = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr2, i8** %s, align 4
  store i8 83, i8* %2, align 1
  %3 = load i8*, i8** %s, align 4
  %incdec.ptr3 = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr3, i8** %s, align 4
  store i8 72, i8* %3, align 1
  store i32 0, i32* %c, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %c, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %4
  %option = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 0
  %5 = load i32, i32* %option, align 4
  %cmp4 = icmp sgt i32 %5, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %c, align 4
  %arrayidx6 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %6
  %option7 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx6, i32 0, i32 0
  %7 = load i32, i32* %option7, align 4
  %conv8 = trunc i32 %7 to i8
  %8 = load i8*, i8** %s, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr9, i8** %s, align 4
  store i8 %conv8, i8* %8, align 1
  %9 = load i8*, i8** %s, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr10, i8** %s, align 4
  store i8 59, i8* %9, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %c, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %c, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** %s, align 4
  store i8 0, i8* %11, align 1
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %12 = load i32, i32* @cmdlistsz, align 4
  %cmp11 = icmp eq i32 %12, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  store i32 16, i32* @cmdlistsz, align 4
  %call = call i8* @sh_xmalloc(i32 128, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 355)
  %13 = bitcast i8* %call to %struct._cmd*
  store %struct._cmd* %13, %struct._cmd** @cmdlist, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %if.end
  store i32 0, i32* @ncmd, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end14
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call15 = call i32 @internal_getopt(%struct.word_list* %14, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @optstring, i32 0, i32 0))
  store i32 %call15, i32* %opt, align 4
  %cmp16 = icmp ne i32 %call15, -1
  br i1 %cmp16, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %15 = load i32, i32* %opt, align 4
  switch i32 %15, label %sw.default [
    i32 97, label %sw.bb
    i32 83, label %sw.bb19
    i32 72, label %sw.bb20
    i32 -99, label %sw.bb22
    i32 63, label %sw.bb23
  ]

sw.bb:                                            ; preds = %while.body
  %16 = load i32, i32* %all_limits, align 4
  %inc18 = add nsw i32 %16, 1
  store i32 %inc18, i32* %all_limits, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %while.body
  %17 = load i32, i32* %mode, align 4
  %or = or i32 %17, 2
  store i32 %or, i32* %mode, align 4
  br label %sw.epilog

sw.bb20:                                          ; preds = %while.body
  %18 = load i32, i32* %mode, align 4
  %or21 = or i32 %18, 1
  store i32 %or21, i32* %mode, align 4
  br label %sw.epilog

sw.bb22:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb23:                                          ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  %19 = load i32, i32* @ncmd, align 4
  %20 = load i32, i32* @cmdlistsz, align 4
  %cmp24 = icmp sge i32 %19, %20
  br i1 %cmp24, label %if.then26, label %if.end29

if.then26:                                        ; preds = %sw.default
  %21 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %22 = bitcast %struct._cmd* %21 to i8*
  %23 = load i32, i32* @cmdlistsz, align 4
  %mul = mul nsw i32 %23, 2
  store i32 %mul, i32* @cmdlistsz, align 4
  %mul27 = mul i32 %mul, 8
  %call28 = call i8* @sh_xrealloc(i8* %22, i32 %mul27, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 383)
  %24 = bitcast i8* %call28 to %struct._cmd*
  store %struct._cmd* %24, %struct._cmd** @cmdlist, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then26, %sw.default
  %25 = load i32, i32* %opt, align 4
  %26 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %27 = load i32, i32* @ncmd, align 4
  %arrayidx30 = getelementptr inbounds %struct._cmd, %struct._cmd* %26, i32 %27
  %cmd = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx30, i32 0, i32 0
  store i32 %25, i32* %cmd, align 4
  %28 = load i8*, i8** @list_optarg, align 4
  %29 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %30 = load i32, i32* @ncmd, align 4
  %inc31 = add nsw i32 %30, 1
  store i32 %inc31, i32* @ncmd, align 4
  %arrayidx32 = getelementptr inbounds %struct._cmd, %struct._cmd* %29, i32 %30
  %arg = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx32, i32 0, i32 1
  store i8* %28, i8** %arg, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end29, %sw.bb20, %sw.bb19, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %31 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %31, %struct.word_list** %list.addr, align 4
  %32 = load i32, i32* %all_limits, align 4
  %tobool = icmp ne i32 %32, 0
  br i1 %tobool, label %if.then33, label %if.end37

if.then33:                                        ; preds = %while.end
  %33 = load i32, i32* %mode, align 4
  %cmp34 = icmp eq i32 %33, 0
  br i1 %cmp34, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then33
  br label %cond.end

cond.false:                                       ; preds = %if.then33
  %34 = load i32, i32* %mode, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 2, %cond.true ], [ %34, %cond.false ]
  call void @print_all_limits(i32 %cond)
  %call36 = call i32 @sh_chkwrite(i32 0)
  store i32 %call36, i32* %retval, align 4
  br label %return

if.end37:                                         ; preds = %while.end
  %35 = load i32, i32* @ncmd, align 4
  %cmp38 = icmp eq i32 %35, 0
  br i1 %cmp38, label %if.then40, label %if.end55

if.then40:                                        ; preds = %if.end37
  %36 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %37 = load i32, i32* @ncmd, align 4
  %arrayidx41 = getelementptr inbounds %struct._cmd, %struct._cmd* %36, i32 %37
  %cmd42 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx41, i32 0, i32 0
  store i32 102, i32* %cmd42, align 4
  %38 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool43 = icmp ne %struct.word_list* %38, null
  br i1 %tobool43, label %cond.true44, label %cond.false46

cond.true44:                                      ; preds = %if.then40
  %39 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 1
  %40 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word45 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %40, i32 0, i32 0
  %41 = load i8*, i8** %word45, align 4
  br label %cond.end47

cond.false46:                                     ; preds = %if.then40
  br label %cond.end47

cond.end47:                                       ; preds = %cond.false46, %cond.true44
  %cond48 = phi i8* [ %41, %cond.true44 ], [ null, %cond.false46 ]
  %42 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %43 = load i32, i32* @ncmd, align 4
  %inc49 = add nsw i32 %43, 1
  store i32 %inc49, i32* @ncmd, align 4
  %arrayidx50 = getelementptr inbounds %struct._cmd, %struct._cmd* %42, i32 %43
  %arg51 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx50, i32 0, i32 1
  store i8* %cond48, i8** %arg51, align 4
  %44 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool52 = icmp ne %struct.word_list* %44, null
  br i1 %tobool52, label %if.then53, label %if.end54

if.then53:                                        ; preds = %cond.end47
  %45 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 0
  %46 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %46, %struct.word_list** %list.addr, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %cond.end47
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end37
  store i32 0, i32* %c, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc70, %if.end55
  %47 = load i32, i32* %c, align 4
  %48 = load i32, i32* @ncmd, align 4
  %cmp57 = icmp slt i32 %47, %48
  br i1 %cmp57, label %for.body59, label %for.end72

for.body59:                                       ; preds = %for.cond56
  %49 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %50 = load i32, i32* %c, align 4
  %arrayidx60 = getelementptr inbounds %struct._cmd, %struct._cmd* %49, i32 %50
  %cmd61 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx60, i32 0, i32 0
  %51 = load i32, i32* %cmd61, align 4
  %call62 = call i32 @_findlim(i32 %51)
  store i32 %call62, i32* %limind, align 4
  %52 = load i32, i32* %limind, align 4
  %cmp63 = icmp eq i32 %52, -1
  br i1 %cmp63, label %if.then65, label %if.end69

if.then65:                                        ; preds = %for.body59
  %call66 = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0))
  %53 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %54 = load i32, i32* %c, align 4
  %arrayidx67 = getelementptr inbounds %struct._cmd, %struct._cmd* %53, i32 %54
  %cmd68 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx67, i32 0, i32 0
  %55 = load i32, i32* %cmd68, align 4
  call void (i8*, ...) @builtin_error(i8* %call66, i32 %55)
  store i32 258, i32* %retval, align 4
  br label %return

if.end69:                                         ; preds = %for.body59
  br label %for.inc70

for.inc70:                                        ; preds = %if.end69
  %56 = load i32, i32* %c, align 4
  %inc71 = add nsw i32 %56, 1
  store i32 %inc71, i32* %c, align 4
  br label %for.cond56

for.end72:                                        ; preds = %for.cond56
  store i32 0, i32* %c, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc88, %for.end72
  %57 = load i32, i32* %c, align 4
  %58 = load i32, i32* @ncmd, align 4
  %cmp74 = icmp slt i32 %57, %58
  br i1 %cmp74, label %for.body76, label %for.end90

for.body76:                                       ; preds = %for.cond73
  %59 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %60 = load i32, i32* %c, align 4
  %arrayidx77 = getelementptr inbounds %struct._cmd, %struct._cmd* %59, i32 %60
  %cmd78 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx77, i32 0, i32 0
  %61 = load i32, i32* %cmd78, align 4
  %62 = load %struct._cmd*, %struct._cmd** @cmdlist, align 4
  %63 = load i32, i32* %c, align 4
  %arrayidx79 = getelementptr inbounds %struct._cmd, %struct._cmd* %62, i32 %63
  %arg80 = getelementptr inbounds %struct._cmd, %struct._cmd* %arrayidx79, i32 0, i32 1
  %64 = load i8*, i8** %arg80, align 4
  %65 = load i32, i32* %mode, align 4
  %66 = load i32, i32* @ncmd, align 4
  %cmp81 = icmp sgt i32 %66, 1
  %conv82 = zext i1 %cmp81 to i32
  %call83 = call i32 @ulimit_internal(i32 %61, i8* %64, i32 %65, i32 %conv82)
  %cmp84 = icmp eq i32 %call83, 1
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %for.body76
  store i32 1, i32* %retval, align 4
  br label %return

if.end87:                                         ; preds = %for.body76
  br label %for.inc88

for.inc88:                                        ; preds = %if.end87
  %67 = load i32, i32* %c, align 4
  %inc89 = add nsw i32 %67, 1
  store i32 %inc89, i32* %c, align 4
  br label %for.cond73

for.end90:                                        ; preds = %for.cond73
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end90, %if.then86, %if.then65, %cond.end, %sw.bb23, %sw.bb22
  %68 = load i32, i32* %retval, align 4
  ret i32 %68
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @print_all_limits(i32 %mode) #0 {
entry:
  %mode.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %softlim = alloca i64, align 8
  %hardlim = alloca i64, align 8
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* %mode.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %mode.addr, align 4
  %or = or i32 %1, 2
  store i32 %or, i32* %mode.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %2
  %option = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 0
  %3 = load i32, i32* %option, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %call = call i32 @get_limit(i32 %4, i64* %softlim, i64* %hardlim)
  %cmp2 = icmp eq i32 %call, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %mode.addr, align 4
  %and = and i32 %6, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then3
  %7 = load i64, i64* %softlim, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then3
  %8 = load i64, i64* %hardlim, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %7, %cond.true ], [ %8, %cond.false ]
  call void @printone(i32 %5, i64 %cond, i32 1)
  br label %if.end11

if.else:                                          ; preds = %for.body
  %call4 = call i32* @__errno_location()
  %9 = load i32, i32* %call4, align 4
  %cmp5 = icmp ne i32 %9, 22
  br i1 %cmp5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.else
  %10 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %10
  %description = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx7, i32 0, i32 3
  %11 = load i8*, i8** %description, align 4
  %call8 = call i32* @__errno_location()
  %12 = load i32, i32* %call8, align 4
  %call9 = call i8* @strerror(i32 %12)
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.23, i32 0, i32 0), i8* %11, i8* %call9)
  br label %if.end10

if.end10:                                         ; preds = %if.then6, %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %cond.end
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @sh_chkwrite(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @_findlim(i32 %opt) #0 {
entry:
  %retval = alloca i32, align 4
  %opt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %opt, i32* %opt.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %0
  %option = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 0
  %1 = load i32, i32* %option, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %2
  %option2 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx1, i32 0, i32 0
  %3 = load i32, i32* %option2, align 4
  %4 = load i32, i32* %opt.addr, align 4
  %cmp3 = icmp eq i32 %3, %4
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @ulimit_internal(i32 %cmd, i8* %cmdarg, i32 %mode, i32 %multiple) #0 {
entry:
  %retval = alloca i32, align 4
  %cmd.addr = alloca i32, align 4
  %cmdarg.addr = alloca i8*, align 4
  %mode.addr = alloca i32, align 4
  %multiple.addr = alloca i32, align 4
  %opt = alloca i32, align 4
  %limind = alloca i32, align 4
  %setting = alloca i32, align 4
  %block_factor = alloca i32, align 4
  %soft_limit = alloca i64, align 8
  %hard_limit = alloca i64, align 8
  %real_limit = alloca i64, align 8
  %limit = alloca i64, align 8
  store i32 %cmd, i32* %cmd.addr, align 4
  store i8* %cmdarg, i8** %cmdarg.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %multiple, i32* %multiple.addr, align 4
  %0 = load i8*, i8** %cmdarg.addr, align 4
  %cmp = icmp ne i8* %0, null
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %setting, align 4
  %1 = load i32, i32* %cmd.addr, align 4
  %call = call i32 @_findlim(i32 %1)
  store i32 %call, i32* %limind, align 4
  %2 = load i32, i32* %mode.addr, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %setting, align 4
  %tobool = icmp ne i32 %3, 0
  %cond = select i1 %tobool, i32 3, i32 2
  store i32 %cond, i32* %mode.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %limind, align 4
  %call3 = call i32 @get_limit(i32 %4, i64* %soft_limit, i64* %hard_limit)
  store i32 %call3, i32* %opt, align 4
  %5 = load i32, i32* %opt, align 4
  %cmp4 = icmp slt i32 %5, 0
  br i1 %cmp4, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.end
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.23, i32 0, i32 0))
  %6 = load i32, i32* %limind, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %6
  %description = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 3
  %7 = load i8*, i8** %description, align 4
  %call8 = call i32* @__errno_location()
  %8 = load i32, i32* %call8, align 4
  %call9 = call i8* @strerror(i32 %8)
  call void (i8*, ...) @builtin_error(i8* %call7, i8* %7, i8* %call9)
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  %9 = load i32, i32* %setting, align 4
  %cmp11 = icmp eq i32 %9, 0
  br i1 %cmp11, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end10
  %10 = load i32, i32* %limind, align 4
  %11 = load i32, i32* %mode.addr, align 4
  %and = and i32 %11, 2
  %tobool14 = icmp ne i32 %and, 0
  br i1 %tobool14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then13
  %12 = load i64, i64* %soft_limit, align 8
  br label %cond.end

cond.false:                                       ; preds = %if.then13
  %13 = load i64, i64* %hard_limit, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond15 = phi i64 [ %12, %cond.true ], [ %13, %cond.false ]
  %14 = load i32, i32* %multiple.addr, align 4
  call void @printone(i32 %10, i64 %cond15, i32 %14)
  store i32 0, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end10
  %15 = load i8*, i8** %cmdarg.addr, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %16 to i32
  %17 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), align 1
  %conv19 = sext i8 %17 to i32
  %cmp20 = icmp eq i32 %conv18, %conv19
  br i1 %cmp20, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end16
  %18 = load i8*, i8** %cmdarg.addr, align 4
  %call22 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0))
  %cmp23 = icmp eq i32 %call22, 0
  br i1 %cmp23, label %if.then25, label %if.else

if.then25:                                        ; preds = %land.lhs.true
  %19 = load i64, i64* %hard_limit, align 8
  store i64 %19, i64* %real_limit, align 8
  br label %if.end75

if.else:                                          ; preds = %land.lhs.true, %if.end16
  %20 = load i8*, i8** %cmdarg.addr, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %21 to i32
  %22 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), align 1
  %conv28 = sext i8 %22 to i32
  %cmp29 = icmp eq i32 %conv27, %conv28
  br i1 %cmp29, label %land.lhs.true31, label %if.else36

land.lhs.true31:                                  ; preds = %if.else
  %23 = load i8*, i8** %cmdarg.addr, align 4
  %call32 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0))
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %if.then35, label %if.else36

if.then35:                                        ; preds = %land.lhs.true31
  %24 = load i64, i64* %soft_limit, align 8
  store i64 %24, i64* %real_limit, align 8
  br label %if.end74

if.else36:                                        ; preds = %land.lhs.true31, %if.else
  %25 = load i8*, i8** %cmdarg.addr, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %26 to i32
  %27 = load i8, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0), align 1
  %conv39 = sext i8 %27 to i32
  %cmp40 = icmp eq i32 %conv38, %conv39
  br i1 %cmp40, label %land.lhs.true42, label %if.else47

land.lhs.true42:                                  ; preds = %if.else36
  %28 = load i8*, i8** %cmdarg.addr, align 4
  %call43 = call i32 @strcmp(i8* %28, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0))
  %cmp44 = icmp eq i32 %call43, 0
  br i1 %cmp44, label %if.then46, label %if.else47

if.then46:                                        ; preds = %land.lhs.true42
  store i64 -1, i64* %real_limit, align 8
  br label %if.end73

if.else47:                                        ; preds = %land.lhs.true42, %if.else36
  %29 = load i8*, i8** %cmdarg.addr, align 4
  %call48 = call i32 @all_digits(i8* %29)
  %tobool49 = icmp ne i32 %call48, 0
  br i1 %tobool49, label %if.then50, label %if.else71

if.then50:                                        ; preds = %if.else47
  %30 = load i8*, i8** %cmdarg.addr, align 4
  %call51 = call i64 @string_to_rlimtype(i8* %30)
  store i64 %call51, i64* %limit, align 8
  %31 = load i32, i32* %limind, align 4
  %arrayidx52 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %31
  %block_factor53 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx52, i32 0, i32 2
  %32 = load i32, i32* %block_factor53, align 4
  %cmp54 = icmp eq i32 %32, -2
  br i1 %cmp54, label %cond.true56, label %cond.false59

cond.true56:                                      ; preds = %if.then50
  %33 = load i32, i32* @posixly_correct, align 4
  %tobool57 = icmp ne i32 %33, 0
  %cond58 = select i1 %tobool57, i32 512, i32 1024
  br label %cond.end62

cond.false59:                                     ; preds = %if.then50
  %34 = load i32, i32* %limind, align 4
  %arrayidx60 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %34
  %block_factor61 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx60, i32 0, i32 2
  %35 = load i32, i32* %block_factor61, align 4
  br label %cond.end62

cond.end62:                                       ; preds = %cond.false59, %cond.true56
  %cond63 = phi i32 [ %cond58, %cond.true56 ], [ %35, %cond.false59 ]
  store i32 %cond63, i32* %block_factor, align 4
  %36 = load i64, i64* %limit, align 8
  %37 = load i32, i32* %block_factor, align 4
  %conv64 = sext i32 %37 to i64
  %mul = mul i64 %36, %conv64
  store i64 %mul, i64* %real_limit, align 8
  %38 = load i64, i64* %real_limit, align 8
  %39 = load i32, i32* %block_factor, align 4
  %conv65 = sext i32 %39 to i64
  %div = udiv i64 %38, %conv65
  %40 = load i64, i64* %limit, align 8
  %cmp66 = icmp ne i64 %div, %40
  br i1 %cmp66, label %if.then68, label %if.end70

if.then68:                                        ; preds = %cond.end62
  %41 = load i8*, i8** %cmdarg.addr, align 4
  %call69 = call i8* @libintl_gettext(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0))
  call void @sh_erange(i8* %41, i8* %call69)
  store i32 1, i32* %retval, align 4
  br label %return

if.end70:                                         ; preds = %cond.end62
  br label %if.end72

if.else71:                                        ; preds = %if.else47
  %42 = load i8*, i8** %cmdarg.addr, align 4
  call void @sh_invalidnum(i8* %42)
  store i32 1, i32* %retval, align 4
  br label %return

if.end72:                                         ; preds = %if.end70
  br label %if.end73

if.end73:                                         ; preds = %if.end72, %if.then46
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.then35
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.then25
  %43 = load i32, i32* %limind, align 4
  %44 = load i64, i64* %real_limit, align 8
  %45 = load i32, i32* %mode.addr, align 4
  %call76 = call i32 @set_limit(i32 %43, i64 %44, i32 %45)
  %cmp77 = icmp slt i32 %call76, 0
  br i1 %cmp77, label %if.then79, label %if.end85

if.then79:                                        ; preds = %if.end75
  %call80 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.28, i32 0, i32 0))
  %46 = load i32, i32* %limind, align 4
  %arrayidx81 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %46
  %description82 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx81, i32 0, i32 3
  %47 = load i8*, i8** %description82, align 4
  %call83 = call i32* @__errno_location()
  %48 = load i32, i32* %call83, align 4
  %call84 = call i8* @strerror(i32 %48)
  call void (i8*, ...) @builtin_error(i8* %call80, i8* %47, i8* %call84)
  store i32 1, i32* %retval, align 4
  br label %return

if.end85:                                         ; preds = %if.end75
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end85, %if.then79, %if.else71, %if.then68, %cond.end, %if.then6
  %49 = load i32, i32* %retval, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind
define internal i32 @get_limit(i32 %ind, i64* %softlim, i64* %hardlim) #0 {
entry:
  %retval = alloca i32, align 4
  %ind.addr = alloca i32, align 4
  %softlim.addr = alloca i64*, align 4
  %hardlim.addr = alloca i64*, align 4
  %value = alloca i64, align 8
  %limit = alloca %struct.rlimit, align 8
  store i32 %ind, i32* %ind.addr, align 4
  store i64* %softlim, i64** %softlim.addr, align 4
  store i64* %hardlim, i64** %hardlim.addr, align 4
  %0 = load i32, i32* %ind.addr, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %0
  %parameter = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 1
  %1 = load i32, i32* %parameter, align 4
  %cmp = icmp sge i32 %1, 256
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %ind.addr, align 4
  %arrayidx1 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %2
  %parameter2 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx1, i32 0, i32 1
  %3 = load i32, i32* %parameter2, align 4
  switch i32 %3, label %sw.default [
    i32 1, label %sw.bb
    i32 257, label %sw.bb5
    i32 7, label %sw.bb10
    i32 9, label %sw.bb12
    i32 6, label %sw.bb14
  ]

sw.bb:                                            ; preds = %if.then
  %call = call i32 @filesize(i64* %value)
  %cmp3 = icmp slt i32 %call, 0
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %sw.bb
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb
  br label %sw.epilog

sw.bb5:                                           ; preds = %if.then
  %call6 = call i32 @pipesize(i64* %value)
  %cmp7 = icmp slt i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %sw.bb5
  store i32 -1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %sw.bb5
  br label %sw.epilog

sw.bb10:                                          ; preds = %if.then
  %call11 = call i32 @getdtablesize()
  %conv = sext i32 %call11 to i64
  store i64 %conv, i64* %value, align 8
  br label %sw.epilog

sw.bb12:                                          ; preds = %if.then
  %4 = load i64*, i64** %softlim.addr, align 4
  %5 = load i64*, i64** %hardlim.addr, align 4
  %call13 = call i32 @getmaxvm(i64* %4, i64* %5)
  store i32 %call13, i32* %retval, align 4
  br label %return

sw.bb14:                                          ; preds = %if.then
  %call15 = call i32 @getmaxuprc(i64* %value)
  %cmp16 = icmp slt i32 %call15, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %sw.bb14
  store i32 -1, i32* %retval, align 4
  br label %return

if.end19:                                         ; preds = %sw.bb14
  br label %sw.epilog

sw.default:                                       ; preds = %if.then
  %call20 = call i32* @__errno_location()
  store i32 22, i32* %call20, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end19, %sw.bb10, %if.end9, %if.end
  %6 = load i64, i64* %value, align 8
  %7 = load i64*, i64** %hardlim.addr, align 4
  store i64 %6, i64* %7, align 8
  %8 = load i64*, i64** %softlim.addr, align 4
  store i64 %6, i64* %8, align 8
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %9 = load i32, i32* %ind.addr, align 4
  %arrayidx21 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %9
  %parameter22 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx21, i32 0, i32 1
  %10 = load i32, i32* %parameter22, align 4
  %call23 = call i32 @getrlimit(i32 %10, %struct.rlimit* %limit)
  %cmp24 = icmp slt i32 %call23, 0
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.else
  store i32 -1, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %if.else
  %rlim_cur = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 0
  %11 = load i64, i64* %rlim_cur, align 8
  %12 = load i64*, i64** %softlim.addr, align 4
  store i64 %11, i64* %12, align 8
  %rlim_max = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 1
  %13 = load i64, i64* %rlim_max, align 8
  %14 = load i64*, i64** %hardlim.addr, align 4
  store i64 %13, i64* %14, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.then26, %sw.epilog, %sw.default, %if.then18, %sw.bb12, %if.then8, %if.then4
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal void @printone(i32 %limind, i64 %curlim, i32 %pdesc) #0 {
entry:
  %limind.addr = alloca i32, align 4
  %curlim.addr = alloca i64, align 8
  %pdesc.addr = alloca i32, align 4
  %unitstr = alloca [64 x i8], align 1
  %factor = alloca i32, align 4
  store i32 %limind, i32* %limind.addr, align 4
  store i64 %curlim, i64* %curlim.addr, align 8
  store i32 %pdesc, i32* %pdesc.addr, align 4
  %0 = load i32, i32* %limind.addr, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %0
  %block_factor = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 2
  %1 = load i32, i32* %block_factor, align 4
  %cmp = icmp eq i32 %1, -2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %2, 0
  %cond = select i1 %tobool, i32 512, i32 1024
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %limind.addr, align 4
  %arrayidx1 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %3
  %block_factor2 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx1, i32 0, i32 2
  %4 = load i32, i32* %block_factor2, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond3 = phi i32 [ %cond, %cond.true ], [ %4, %cond.false ]
  store i32 %cond3, i32* %factor, align 4
  %5 = load i32, i32* %pdesc.addr, align 4
  %tobool4 = icmp ne i32 %5, 0
  br i1 %tobool4, label %if.then, label %if.end18

if.then:                                          ; preds = %cond.end
  %6 = load i32, i32* %limind.addr, align 4
  %arrayidx5 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %6
  %units = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx5, i32 0, i32 4
  %7 = load i8*, i8** %units, align 4
  %tobool6 = icmp ne i8* %7, null
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %arraydecay = getelementptr inbounds [64 x i8], [64 x i8]* %unitstr, i32 0, i32 0
  %8 = load i32, i32* %limind.addr, align 4
  %arrayidx8 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %8
  %units9 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx8, i32 0, i32 4
  %9 = load i8*, i8** %units9, align 4
  %10 = load i32, i32* %limind.addr, align 4
  %arrayidx10 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %10
  %option = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx10, i32 0, i32 0
  %11 = load i32, i32* %option, align 4
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.29, i32 0, i32 0), i8* %9, i32 %11)
  br label %if.end

if.else:                                          ; preds = %if.then
  %arraydecay11 = getelementptr inbounds [64 x i8], [64 x i8]* %unitstr, i32 0, i32 0
  %12 = load i32, i32* %limind.addr, align 4
  %arrayidx12 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %12
  %option13 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx12, i32 0, i32 0
  %13 = load i32, i32* %option13, align 4
  %call14 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i32 0, i32 0), i32 %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %14 = load i32, i32* %limind.addr, align 4
  %arrayidx15 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %14
  %description = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx15, i32 0, i32 3
  %15 = load i8*, i8** %description, align 4
  %arraydecay16 = getelementptr inbounds [64 x i8], [64 x i8]* %unitstr, i32 0, i32 0
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.31, i32 0, i32 0), i8* %15, i8* %arraydecay16)
  br label %if.end18

if.end18:                                         ; preds = %if.end, %cond.end
  %16 = load i64, i64* %curlim.addr, align 8
  %cmp19 = icmp eq i64 %16, -1
  br i1 %cmp19, label %if.then20, label %if.else22

if.then20:                                        ; preds = %if.end18
  %call21 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0))
  br label %if.end33

if.else22:                                        ; preds = %if.end18
  %17 = load i64, i64* %curlim.addr, align 8
  %cmp23 = icmp eq i64 %17, -1
  br i1 %cmp23, label %if.then24, label %if.else26

if.then24:                                        ; preds = %if.else22
  %call25 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0))
  br label %if.end32

if.else26:                                        ; preds = %if.else22
  %18 = load i64, i64* %curlim.addr, align 8
  %cmp27 = icmp eq i64 %18, -1
  br i1 %cmp27, label %if.then28, label %if.else30

if.then28:                                        ; preds = %if.else26
  %call29 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0))
  br label %if.end31

if.else30:                                        ; preds = %if.else26
  %19 = load i64, i64* %curlim.addr, align 8
  %20 = load i32, i32* %factor, align 4
  %conv = sext i32 %20 to i64
  %div = udiv i64 %19, %conv
  call void @print_rlimtype(i64 %div, i32 1)
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %if.then28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then24
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then20
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @all_digits(i8*) #1

declare i64 @string_to_rlimtype(i8*) #1

declare void @sh_erange(i8*, i8*) #1

declare void @sh_invalidnum(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @set_limit(i32 %ind, i64 %newlim, i32 %mode) #0 {
entry:
  %retval = alloca i32, align 4
  %ind.addr = alloca i32, align 4
  %newlim.addr = alloca i64, align 8
  %mode.addr = alloca i32, align 4
  %limit = alloca %struct.rlimit, align 8
  %val = alloca i64, align 8
  store i32 %ind, i32* %ind.addr, align 4
  store i64 %newlim, i64* %newlim.addr, align 8
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* %ind.addr, align 4
  %arrayidx = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %0
  %parameter = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx, i32 0, i32 1
  %1 = load i32, i32* %parameter, align 4
  %cmp = icmp sge i32 %1, 256
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %ind.addr, align 4
  %arrayidx1 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %2
  %parameter2 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx1, i32 0, i32 1
  %3 = load i32, i32* %parameter2, align 4
  switch i32 %3, label %sw.default [
    i32 1, label %sw.bb
    i32 7, label %sw.bb3
    i32 257, label %sw.bb3
    i32 9, label %sw.bb3
    i32 6, label %sw.bb3
  ]

sw.bb:                                            ; preds = %if.then
  %call = call i32* @__errno_location()
  store i32 22, i32* %call, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb3:                                           ; preds = %if.then, %if.then, %if.then, %if.then
  br label %sw.default

sw.default:                                       ; preds = %if.then, %sw.bb3
  %call4 = call i32* @__errno_location()
  store i32 22, i32* %call4, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %ind.addr, align 4
  %arrayidx5 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %4
  %parameter6 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx5, i32 0, i32 1
  %5 = load i32, i32* %parameter6, align 4
  %call7 = call i32 @getrlimit(i32 %5, %struct.rlimit* %limit)
  %cmp8 = icmp slt i32 %call7, 0
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else
  %6 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %cmp10 = icmp ne i32 %6, 0
  br i1 %cmp10, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.end
  %7 = load i64, i64* %newlim.addr, align 8
  %cmp11 = icmp eq i64 %7, -1
  br i1 %cmp11, label %land.lhs.true12, label %cond.false

land.lhs.true12:                                  ; preds = %land.lhs.true
  %8 = load i32, i32* %mode.addr, align 4
  %and = and i32 %8, 1
  %cmp13 = icmp eq i32 %and, 0
  br i1 %cmp13, label %land.lhs.true14, label %cond.false

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %rlim_cur = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 0
  %9 = load i64, i64* %rlim_cur, align 8
  %rlim_max = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 1
  %10 = load i64, i64* %rlim_max, align 8
  %cmp15 = icmp ule i64 %9, %10
  br i1 %cmp15, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true14
  %rlim_max16 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 1
  %11 = load i64, i64* %rlim_max16, align 8
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true14, %land.lhs.true12, %land.lhs.true, %if.end
  %12 = load i64, i64* %newlim.addr, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %11, %cond.true ], [ %12, %cond.false ]
  store i64 %cond, i64* %val, align 8
  %13 = load i32, i32* %mode.addr, align 4
  %and17 = and i32 %13, 2
  %tobool = icmp ne i32 %and17, 0
  br i1 %tobool, label %if.then18, label %if.end20

if.then18:                                        ; preds = %cond.end
  %14 = load i64, i64* %val, align 8
  %rlim_cur19 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 0
  store i64 %14, i64* %rlim_cur19, align 8
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %cond.end
  %15 = load i32, i32* %mode.addr, align 4
  %and21 = and i32 %15, 1
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.end20
  %16 = load i64, i64* %val, align 8
  %rlim_max24 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %limit, i32 0, i32 1
  store i64 %16, i64* %rlim_max24, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.end20
  %17 = load i32, i32* %ind.addr, align 4
  %arrayidx26 = getelementptr inbounds [17 x %struct.RESOURCE_LIMITS], [17 x %struct.RESOURCE_LIMITS]* @limits, i32 0, i32 %17
  %parameter27 = getelementptr inbounds %struct.RESOURCE_LIMITS, %struct.RESOURCE_LIMITS* %arrayidx26, i32 0, i32 1
  %18 = load i32, i32* %parameter27, align 4
  %call28 = call i32 @setrlimit(i32 %18, %struct.rlimit* %limit)
  store i32 %call28, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end25, %if.then9, %sw.default, %sw.bb
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define internal i32 @filesize(i64* %valuep) #0 {
entry:
  %valuep.addr = alloca i64*, align 4
  store i64* %valuep, i64** %valuep.addr, align 4
  %call = call i32* @__errno_location()
  store i32 22, i32* %call, align 4
  ret i32 -1
}

; Function Attrs: noinline nounwind
define internal i32 @pipesize(i64* %valuep) #0 {
entry:
  %valuep.addr = alloca i64*, align 4
  store i64* %valuep, i64** %valuep.addr, align 4
  %0 = load i64*, i64** %valuep.addr, align 4
  store i64 4096, i64* %0, align 8
  ret i32 0
}

declare i32 @getdtablesize() #1

; Function Attrs: noinline nounwind
define internal i32 @getmaxvm(i64* %softlim, i64* %hardlim) #0 {
entry:
  %retval = alloca i32, align 4
  %softlim.addr = alloca i64*, align 4
  %hardlim.addr = alloca i64*, align 4
  %datalim = alloca %struct.rlimit, align 8
  %stacklim = alloca %struct.rlimit, align 8
  store i64* %softlim, i64** %softlim.addr, align 4
  store i64* %hardlim, i64** %hardlim.addr, align 4
  %call = call i32 @getrlimit(i32 2, %struct.rlimit* %datalim)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %call1 = call i32 @getrlimit(i32 3, %struct.rlimit* %stacklim)
  %cmp2 = icmp slt i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %rlim_cur = getelementptr inbounds %struct.rlimit, %struct.rlimit* %datalim, i32 0, i32 0
  %0 = load i64, i64* %rlim_cur, align 8
  %div = udiv i64 %0, 1024
  %rlim_cur5 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %stacklim, i32 0, i32 0
  %1 = load i64, i64* %rlim_cur5, align 8
  %div6 = udiv i64 %1, 1024
  %add = add i64 %div, %div6
  %2 = load i64*, i64** %softlim.addr, align 4
  store i64 %add, i64* %2, align 8
  %rlim_max = getelementptr inbounds %struct.rlimit, %struct.rlimit* %datalim, i32 0, i32 1
  %3 = load i64, i64* %rlim_max, align 8
  %div7 = udiv i64 %3, 1024
  %rlim_max8 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %stacklim, i32 0, i32 1
  %4 = load i64, i64* %rlim_max8, align 8
  %div9 = udiv i64 %4, 1024
  %add10 = add i64 %div7, %div9
  %5 = load i64*, i64** %hardlim.addr, align 4
  store i64 %add10, i64* %5, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end4, %if.then3, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i32 @getmaxuprc(i64* %valuep) #0 {
entry:
  %retval = alloca i32, align 4
  %valuep.addr = alloca i64*, align 4
  %maxchild = alloca i32, align 4
  store i64* %valuep, i64** %valuep.addr, align 4
  %call = call i32 @getmaxchild()
  store i32 %call, i32* %maxchild, align 4
  %0 = load i32, i32* %maxchild, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32* @__errno_location()
  store i32 22, i32* %call1, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %maxchild, align 4
  %conv = sext i32 %1 to i64
  %2 = load i64*, i64** %valuep.addr, align 4
  store i64 %conv, i64* %2, align 8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4
  ret i32 %3
}

declare i32 @getrlimit(i32, %struct.rlimit*) #1

declare i32 @getmaxchild() #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @printf(i8*, ...) #1

declare i32 @puts(i8*) #1

declare void @print_rlimtype(i64, i32) #1

declare i32 @setrlimit(i32, %struct.rlimit*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
