; ModuleID = 'fc.c'
source_filename = "fc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct.repl = type { %struct.repl*, i8*, i8* }
%struct._hist_entry = type { i8*, i8*, i8* }
%struct.g_list = type { %struct.g_list* }

@lcurrent = external global %struct.word_list*, align 4
@loptend = external global %struct.word_list*, align 4
@.str = private unnamed_addr constant [8 x i8] c":e:lnrs\00", align 1
@list_optarg = external global i8*, align 4
@.str.1 = private unnamed_addr constant [9 x i8] c"./fc.def\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"no command found\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"fc\00", align 1
@remember_on_history = external global i32, align 4
@subshell_environment = external global i32, align 4
@enable_history_list = external global i32, align 4
@hist_last_line_added = external global i32, align 4
@.str.5 = private unnamed_addr constant [22 x i8] c"history specification\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@.str.6 = private unnamed_addr constant [8 x i8] c"bash-fc\00", align 1
@.str.7 = private unnamed_addr constant [30 x i8] c"%s: cannot open temp file: %s\00", align 1
@.str.8 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@.str.9 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@history_base = external global i32, align 4
@posixly_correct = external global i32, align 4
@.str.10 = private unnamed_addr constant [2 x i8] c"\09\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"\09%c\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"%s %s\00", align 1
@.str.13 = private unnamed_addr constant [25 x i8] c"${FCEDIT:-${EDITOR:-ed}}\00", align 1
@.str.14 = private unnamed_addr constant [25 x i8] c"${FCEDIT:-${EDITOR:-vi}}\00", align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"fc builtin\00", align 1
@echo_input_at_read = external global i32, align 4
@verbose_flag = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @fc_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %sep = alloca i8*, align 4
  %numbering = alloca i32, align 4
  %reverse = alloca i32, align 4
  %listing = alloca i32, align 4
  %execute = alloca i32, align 4
  %histbeg = alloca i32, align 4
  %histend = alloca i32, align 4
  %last_hist = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %opt = alloca i32, align 4
  %rh = alloca i32, align 4
  %real_last = alloca i32, align 4
  %stream = alloca %struct._IO_FILE*, align 4
  %rlist = alloca %struct.repl*, align 4
  %rl = alloca %struct.repl*, align 4
  %ename = alloca i8*, align 4
  %command = alloca i8*, align 4
  %newcom = alloca i8*, align 4
  %fcedit = alloca i8*, align 4
  %hlist = alloca %struct._hist_entry**, align 4
  %fn = alloca i8*, align 4
  %r = alloca %struct.repl*, align 4
  %r86 = alloca %struct.repl*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 1, i32* %numbering, align 4
  store i32 0, i32* %execute, align 4
  store i32 0, i32* %listing, align 4
  store i32 0, i32* %reverse, align 4
  store i8* null, i8** %ename, align 4
  call void @reset_internal_getopt()
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** @lcurrent, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %1 = load %struct.word_list*, %struct.word_list** @lcurrent, align 4
  store %struct.word_list* %1, %struct.word_list** @loptend, align 4
  %call = call i32 @fc_number(%struct.word_list* %1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call2 = call i32 @internal_getopt(%struct.word_list* %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i32 %call2, i32* %opt, align 4
  %cmp3 = icmp ne i32 %call2, -1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %cmp3, %land.rhs ]
  br i1 %3, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %4 = load i32, i32* %opt, align 4
  switch i32 %4, label %sw.default [
    i32 110, label %sw.bb
    i32 108, label %sw.bb4
    i32 114, label %sw.bb5
    i32 115, label %sw.bb6
    i32 101, label %sw.bb7
    i32 -99, label %sw.bb8
  ]

sw.bb:                                            ; preds = %while.body
  store i32 0, i32* %numbering, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %while.body
  store i32 1, i32* %listing, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  store i32 1, i32* %reverse, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %while.body
  store i32 1, i32* %execute, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %5 = load i8*, i8** @list_optarg, align 4
  store i8* %5, i8** %ename, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %land.end
  %6 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %6, %struct.word_list** %list.addr, align 4
  %7 = load i8*, i8** %ename, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %8 = load i8*, i8** %ename, align 4
  %9 = load i8, i8* %8, align 1
  %conv = sext i8 %9 to i32
  %cmp9 = icmp eq i32 %conv, 45
  br i1 %cmp9, label %land.lhs.true11, label %if.end

land.lhs.true11:                                  ; preds = %land.lhs.true
  %10 = load i8*, i8** %ename, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx, align 1
  %conv12 = sext i8 %11 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true11
  store i32 1, i32* %execute, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true11, %land.lhs.true, %while.end
  %12 = load i32, i32* %execute, align 4
  %tobool15 = icmp ne i32 %12, 0
  br i1 %tobool15, label %if.then16, label %if.end103

if.then16:                                        ; preds = %if.end
  store %struct.repl* null, %struct.repl** %rlist, align 4
  br label %while.cond17

while.cond17:                                     ; preds = %if.end42, %if.then16
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool18 = icmp ne %struct.word_list* %13, null
  br i1 %tobool18, label %land.rhs19, label %land.end24

land.rhs19:                                       ; preds = %while.cond17
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word20, align 4
  %call21 = call i8* @strchr(i8* %16, i32 61)
  store i8* %call21, i8** %sep, align 4
  %cmp22 = icmp ne i8* %call21, null
  br label %land.end24

land.end24:                                       ; preds = %land.rhs19, %while.cond17
  %17 = phi i1 [ false, %while.cond17 ], [ %cmp22, %land.rhs19 ]
  br i1 %17, label %while.body25, label %while.end44

while.body25:                                     ; preds = %land.end24
  %18 = load i8*, i8** %sep, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr, i8** %sep, align 4
  store i8 0, i8* %18, align 1
  %call26 = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 241)
  %19 = bitcast i8* %call26 to %struct.repl*
  store %struct.repl* %19, %struct.repl** %rl, align 4
  %20 = load %struct.repl*, %struct.repl** %rl, align 4
  %next = getelementptr inbounds %struct.repl, %struct.repl* %20, i32 0, i32 0
  store %struct.repl* null, %struct.repl** %next, align 4
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word27 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word27, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word28, align 4
  %call29 = call i32 @strlen(i8* %23)
  %add = add i32 1, %call29
  %call30 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 243)
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word31 = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 1
  %25 = load %struct.word_desc*, %struct.word_desc** %word31, align 4
  %word32 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %25, i32 0, i32 0
  %26 = load i8*, i8** %word32, align 4
  %call33 = call i8* @strcpy(i8* %call30, i8* %26)
  %27 = load %struct.repl*, %struct.repl** %rl, align 4
  %pat = getelementptr inbounds %struct.repl, %struct.repl* %27, i32 0, i32 1
  store i8* %call33, i8** %pat, align 4
  %28 = load i8*, i8** %sep, align 4
  %call34 = call i32 @strlen(i8* %28)
  %add35 = add i32 1, %call34
  %call36 = call i8* @sh_xmalloc(i32 %add35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 244)
  %29 = load i8*, i8** %sep, align 4
  %call37 = call i8* @strcpy(i8* %call36, i8* %29)
  %30 = load %struct.repl*, %struct.repl** %rl, align 4
  %rep = getelementptr inbounds %struct.repl, %struct.repl* %30, i32 0, i32 2
  store i8* %call37, i8** %rep, align 4
  %31 = load %struct.repl*, %struct.repl** %rlist, align 4
  %cmp38 = icmp eq %struct.repl* %31, null
  br i1 %cmp38, label %if.then40, label %if.else

if.then40:                                        ; preds = %while.body25
  %32 = load %struct.repl*, %struct.repl** %rl, align 4
  store %struct.repl* %32, %struct.repl** %rlist, align 4
  br label %if.end42

if.else:                                          ; preds = %while.body25
  %33 = load %struct.repl*, %struct.repl** %rlist, align 4
  %34 = load %struct.repl*, %struct.repl** %rl, align 4
  %next41 = getelementptr inbounds %struct.repl, %struct.repl* %34, i32 0, i32 0
  store %struct.repl* %33, %struct.repl** %next41, align 4
  %35 = load %struct.repl*, %struct.repl** %rl, align 4
  store %struct.repl* %35, %struct.repl** %rlist, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.else, %if.then40
  %36 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next43 = getelementptr inbounds %struct.word_list, %struct.word_list* %36, i32 0, i32 0
  %37 = load %struct.word_list*, %struct.word_list** %next43, align 4
  store %struct.word_list* %37, %struct.word_list** %list.addr, align 4
  br label %while.cond17

while.end44:                                      ; preds = %land.end24
  %38 = load %struct.repl*, %struct.repl** %rlist, align 4
  %tobool45 = icmp ne %struct.repl* %38, null
  br i1 %tobool45, label %land.lhs.true46, label %cond.false

land.lhs.true46:                                  ; preds = %while.end44
  %39 = load %struct.repl*, %struct.repl** %rlist, align 4
  %next47 = getelementptr inbounds %struct.repl, %struct.repl* %39, i32 0, i32 0
  %40 = load %struct.repl*, %struct.repl** %next47, align 4
  %tobool48 = icmp ne %struct.repl* %40, null
  br i1 %tobool48, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true46
  %41 = load %struct.repl*, %struct.repl** %rlist, align 4
  %42 = bitcast %struct.repl* %41 to %struct.g_list*
  %call49 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %42)
  %43 = bitcast %struct.g_list* %call49 to %struct.repl*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true46, %while.end44
  %44 = load %struct.repl*, %struct.repl** %rlist, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.repl* [ %43, %cond.true ], [ %44, %cond.false ]
  store %struct.repl* %cond, %struct.repl** %rlist, align 4
  %call50 = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call50, %struct._hist_entry*** %hlist, align 4
  %45 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool51 = icmp ne %struct.word_list* %45, null
  br i1 %tobool51, label %cond.true52, label %cond.false55

cond.true52:                                      ; preds = %cond.end
  %46 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 1
  %47 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %47, i32 0, i32 0
  %48 = load i8*, i8** %word54, align 4
  br label %cond.end56

cond.false55:                                     ; preds = %cond.end
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false55, %cond.true52
  %cond57 = phi i8* [ %48, %cond.true52 ], [ null, %cond.false55 ]
  %49 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %call58 = call i8* @fc_gethist(i8* %cond57, %struct._hist_entry** %49)
  store i8* %call58, i8** %command, align 4
  %50 = load i8*, i8** %command, align 4
  %cmp59 = icmp eq i8* %50, null
  br i1 %cmp59, label %if.then61, label %if.end78

if.then61:                                        ; preds = %cond.end56
  %call62 = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call62)
  %51 = load %struct.repl*, %struct.repl** %rlist, align 4
  %tobool63 = icmp ne %struct.repl* %51, null
  br i1 %tobool63, label %if.then64, label %if.end77

if.then64:                                        ; preds = %if.then61
  br label %do.body

do.body:                                          ; preds = %if.then64
  %52 = load %struct.repl*, %struct.repl** %rlist, align 4
  store %struct.repl* %52, %struct.repl** %rl, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end76, %do.body
  %53 = load %struct.repl*, %struct.repl** %rl, align 4
  %tobool65 = icmp ne %struct.repl* %53, null
  br i1 %tobool65, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %54 = load %struct.repl*, %struct.repl** %rl, align 4
  %next66 = getelementptr inbounds %struct.repl, %struct.repl* %54, i32 0, i32 0
  %55 = load %struct.repl*, %struct.repl** %next66, align 4
  store %struct.repl* %55, %struct.repl** %r, align 4
  %56 = load %struct.repl*, %struct.repl** %rl, align 4
  %pat67 = getelementptr inbounds %struct.repl, %struct.repl* %56, i32 0, i32 1
  %57 = load i8*, i8** %pat67, align 4
  %tobool68 = icmp ne i8* %57, null
  br i1 %tobool68, label %if.then69, label %if.end71

if.then69:                                        ; preds = %for.body
  %58 = load %struct.repl*, %struct.repl** %rl, align 4
  %pat70 = getelementptr inbounds %struct.repl, %struct.repl* %58, i32 0, i32 1
  %59 = load i8*, i8** %pat70, align 4
  call void @sh_xfree(i8* %59, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 271)
  br label %if.end71

if.end71:                                         ; preds = %if.then69, %for.body
  %60 = load %struct.repl*, %struct.repl** %rl, align 4
  %rep72 = getelementptr inbounds %struct.repl, %struct.repl* %60, i32 0, i32 2
  %61 = load i8*, i8** %rep72, align 4
  %tobool73 = icmp ne i8* %61, null
  br i1 %tobool73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %if.end71
  %62 = load %struct.repl*, %struct.repl** %rl, align 4
  %rep75 = getelementptr inbounds %struct.repl, %struct.repl* %62, i32 0, i32 2
  %63 = load i8*, i8** %rep75, align 4
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 271)
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %if.end71
  %64 = load %struct.repl*, %struct.repl** %rl, align 4
  %65 = bitcast %struct.repl* %64 to i8*
  call void @sh_xfree(i8* %65, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 271)
  %66 = load %struct.repl*, %struct.repl** %r, align 4
  store %struct.repl* %66, %struct.repl** %rl, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  br label %if.end77

if.end77:                                         ; preds = %do.end, %if.then61
  store i32 1, i32* %retval, align 4
  br label %return

if.end78:                                         ; preds = %cond.end56
  %67 = load %struct.repl*, %struct.repl** %rlist, align 4
  %tobool79 = icmp ne %struct.repl* %67, null
  br i1 %tobool79, label %if.then80, label %if.end100

if.then80:                                        ; preds = %if.end78
  %68 = load i8*, i8** %command, align 4
  %69 = load %struct.repl*, %struct.repl** %rlist, align 4
  %call81 = call i8* @fc_dosubs(i8* %68, %struct.repl* %69)
  store i8* %call81, i8** %newcom, align 4
  %70 = load i8*, i8** %command, align 4
  call void @sh_xfree(i8* %70, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 279)
  br label %do.body82

do.body82:                                        ; preds = %if.then80
  %71 = load %struct.repl*, %struct.repl** %rlist, align 4
  store %struct.repl* %71, %struct.repl** %rl, align 4
  br label %for.cond83

for.cond83:                                       ; preds = %if.end97, %do.body82
  %72 = load %struct.repl*, %struct.repl** %rl, align 4
  %tobool84 = icmp ne %struct.repl* %72, null
  br i1 %tobool84, label %for.body85, label %for.end98

for.body85:                                       ; preds = %for.cond83
  %73 = load %struct.repl*, %struct.repl** %rl, align 4
  %next87 = getelementptr inbounds %struct.repl, %struct.repl* %73, i32 0, i32 0
  %74 = load %struct.repl*, %struct.repl** %next87, align 4
  store %struct.repl* %74, %struct.repl** %r86, align 4
  %75 = load %struct.repl*, %struct.repl** %rl, align 4
  %pat88 = getelementptr inbounds %struct.repl, %struct.repl* %75, i32 0, i32 1
  %76 = load i8*, i8** %pat88, align 4
  %tobool89 = icmp ne i8* %76, null
  br i1 %tobool89, label %if.then90, label %if.end92

if.then90:                                        ; preds = %for.body85
  %77 = load %struct.repl*, %struct.repl** %rl, align 4
  %pat91 = getelementptr inbounds %struct.repl, %struct.repl* %77, i32 0, i32 1
  %78 = load i8*, i8** %pat91, align 4
  call void @sh_xfree(i8* %78, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 280)
  br label %if.end92

if.end92:                                         ; preds = %if.then90, %for.body85
  %79 = load %struct.repl*, %struct.repl** %rl, align 4
  %rep93 = getelementptr inbounds %struct.repl, %struct.repl* %79, i32 0, i32 2
  %80 = load i8*, i8** %rep93, align 4
  %tobool94 = icmp ne i8* %80, null
  br i1 %tobool94, label %if.then95, label %if.end97

if.then95:                                        ; preds = %if.end92
  %81 = load %struct.repl*, %struct.repl** %rl, align 4
  %rep96 = getelementptr inbounds %struct.repl, %struct.repl* %81, i32 0, i32 2
  %82 = load i8*, i8** %rep96, align 4
  call void @sh_xfree(i8* %82, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 280)
  br label %if.end97

if.end97:                                         ; preds = %if.then95, %if.end92
  %83 = load %struct.repl*, %struct.repl** %rl, align 4
  %84 = bitcast %struct.repl* %83 to i8*
  call void @sh_xfree(i8* %84, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 280)
  %85 = load %struct.repl*, %struct.repl** %r86, align 4
  store %struct.repl* %85, %struct.repl** %rl, align 4
  br label %for.cond83

for.end98:                                        ; preds = %for.cond83
  br label %do.end99

do.end99:                                         ; preds = %for.end98
  %86 = load i8*, i8** %newcom, align 4
  store i8* %86, i8** %command, align 4
  br label %if.end100

if.end100:                                        ; preds = %do.end99, %if.end78
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %88 = load i8*, i8** %command, align 4
  %call101 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %87, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %88)
  %89 = load i8*, i8** %command, align 4
  call void @fc_replhist(i8* %89)
  %90 = load i8*, i8** %command, align 4
  %call102 = call i32 @parse_and_execute(i8* %90, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 4)
  store i32 %call102, i32* %retval, align 4
  br label %return

if.end103:                                        ; preds = %if.end
  %call104 = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call104, %struct._hist_entry*** %hlist, align 4
  %91 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %cmp105 = icmp eq %struct._hist_entry** %91, null
  br i1 %cmp105, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end103
  store i32 0, i32* %retval, align 4
  br label %return

if.end108:                                        ; preds = %if.end103
  store i32 0, i32* %i, align 4
  br label %for.cond109

for.cond109:                                      ; preds = %for.inc, %if.end108
  %92 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %93 = load i32, i32* %i, align 4
  %arrayidx110 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %92, i32 %93
  %94 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx110, align 4
  %tobool111 = icmp ne %struct._hist_entry* %94, null
  br i1 %tobool111, label %for.body112, label %for.end113

for.body112:                                      ; preds = %for.cond109
  br label %for.inc

for.inc:                                          ; preds = %for.body112
  %95 = load i32, i32* %i, align 4
  %inc = add nsw i32 %95, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond109

for.end113:                                       ; preds = %for.cond109
  %96 = load i32, i32* @remember_on_history, align 4
  %tobool114 = icmp ne i32 %96, 0
  br i1 %tobool114, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end113
  %97 = load i32, i32* @subshell_environment, align 4
  %and = and i32 %97, 4
  %tobool115 = icmp ne i32 %and, 0
  br i1 %tobool115, label %land.rhs116, label %land.end118

land.rhs116:                                      ; preds = %lor.rhs
  %98 = load i32, i32* @enable_history_list, align 4
  %tobool117 = icmp ne i32 %98, 0
  br label %land.end118

land.end118:                                      ; preds = %land.rhs116, %lor.rhs
  %99 = phi i1 [ false, %lor.rhs ], [ %tobool117, %land.rhs116 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end118, %for.end113
  %100 = phi i1 [ true, %for.end113 ], [ %99, %land.end118 ]
  %lor.ext = zext i1 %100 to i32
  store i32 %lor.ext, i32* %rh, align 4
  %101 = load i32, i32* %i, align 4
  %102 = load i32, i32* %rh, align 4
  %sub = sub nsw i32 %101, %102
  %103 = load i32, i32* @hist_last_line_added, align 4
  %sub119 = sub nsw i32 %sub, %103
  store i32 %sub119, i32* %last_hist, align 4
  %104 = load i32, i32* %i, align 4
  store i32 %104, i32* %real_last, align 4
  br label %while.cond120

while.cond120:                                    ; preds = %while.body128, %lor.end
  %105 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %106 = load i32, i32* %real_last, align 4
  %arrayidx121 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %105, i32 %106
  %107 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx121, align 4
  %cmp122 = icmp eq %struct._hist_entry* %107, null
  br i1 %cmp122, label %land.rhs124, label %land.end127

land.rhs124:                                      ; preds = %while.cond120
  %108 = load i32, i32* %real_last, align 4
  %cmp125 = icmp sgt i32 %108, 0
  br label %land.end127

land.end127:                                      ; preds = %land.rhs124, %while.cond120
  %109 = phi i1 [ false, %while.cond120 ], [ %cmp125, %land.rhs124 ]
  br i1 %109, label %while.body128, label %while.end129

while.body128:                                    ; preds = %land.end127
  %110 = load i32, i32* %real_last, align 4
  %dec = add nsw i32 %110, -1
  store i32 %dec, i32* %real_last, align 4
  br label %while.cond120

while.end129:                                     ; preds = %land.end127
  %111 = load i32, i32* %i, align 4
  %112 = load i32, i32* %last_hist, align 4
  %cmp130 = icmp eq i32 %111, %112
  br i1 %cmp130, label %land.lhs.true132, label %if.end148

land.lhs.true132:                                 ; preds = %while.end129
  %113 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %114 = load i32, i32* %last_hist, align 4
  %arrayidx133 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %113, i32 %114
  %115 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx133, align 4
  %cmp134 = icmp eq %struct._hist_entry* %115, null
  br i1 %cmp134, label %if.then136, label %if.end148

if.then136:                                       ; preds = %land.lhs.true132
  br label %while.cond137

while.cond137:                                    ; preds = %while.body145, %if.then136
  %116 = load i32, i32* %last_hist, align 4
  %cmp138 = icmp sge i32 %116, 0
  br i1 %cmp138, label %land.rhs140, label %land.end144

land.rhs140:                                      ; preds = %while.cond137
  %117 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %118 = load i32, i32* %last_hist, align 4
  %arrayidx141 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %117, i32 %118
  %119 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx141, align 4
  %cmp142 = icmp eq %struct._hist_entry* %119, null
  br label %land.end144

land.end144:                                      ; preds = %land.rhs140, %while.cond137
  %120 = phi i1 [ false, %while.cond137 ], [ %cmp142, %land.rhs140 ]
  br i1 %120, label %while.body145, label %while.end147

while.body145:                                    ; preds = %land.end144
  %121 = load i32, i32* %last_hist, align 4
  %dec146 = add nsw i32 %121, -1
  store i32 %dec146, i32* %last_hist, align 4
  br label %while.cond137

while.end147:                                     ; preds = %land.end144
  br label %if.end148

if.end148:                                        ; preds = %while.end147, %land.lhs.true132, %while.end129
  %122 = load i32, i32* %last_hist, align 4
  %cmp149 = icmp slt i32 %122, 0
  br i1 %cmp149, label %if.then151, label %if.end153

if.then151:                                       ; preds = %if.end148
  %call152 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0))
  call void @sh_erange(i8* null, i8* %call152)
  store i32 1, i32* %retval, align 4
  br label %return

if.end153:                                        ; preds = %if.end148
  %123 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool154 = icmp ne %struct.word_list* %123, null
  br i1 %tobool154, label %if.then155, label %if.else182

if.then155:                                       ; preds = %if.end153
  %124 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word156 = getelementptr inbounds %struct.word_list, %struct.word_list* %124, i32 0, i32 1
  %125 = load %struct.word_desc*, %struct.word_desc** %word156, align 4
  %word157 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %125, i32 0, i32 0
  %126 = load i8*, i8** %word157, align 4
  %127 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %call158 = call i32 @fc_gethnum(i8* %126, %struct._hist_entry** %127)
  store i32 %call158, i32* %histbeg, align 4
  %128 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next159 = getelementptr inbounds %struct.word_list, %struct.word_list* %128, i32 0, i32 0
  %129 = load %struct.word_list*, %struct.word_list** %next159, align 4
  store %struct.word_list* %129, %struct.word_list** %list.addr, align 4
  %130 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool160 = icmp ne %struct.word_list* %130, null
  br i1 %tobool160, label %if.then161, label %if.else165

if.then161:                                       ; preds = %if.then155
  %131 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word162 = getelementptr inbounds %struct.word_list, %struct.word_list* %131, i32 0, i32 1
  %132 = load %struct.word_desc*, %struct.word_desc** %word162, align 4
  %word163 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %132, i32 0, i32 0
  %133 = load i8*, i8** %word163, align 4
  %134 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %call164 = call i32 @fc_gethnum(i8* %133, %struct._hist_entry** %134)
  store i32 %call164, i32* %histend, align 4
  br label %if.end181

if.else165:                                       ; preds = %if.then155
  %135 = load i32, i32* %histbeg, align 4
  %136 = load i32, i32* %real_last, align 4
  %cmp166 = icmp eq i32 %135, %136
  br i1 %cmp166, label %if.then168, label %if.else174

if.then168:                                       ; preds = %if.else165
  %137 = load i32, i32* %listing, align 4
  %tobool169 = icmp ne i32 %137, 0
  br i1 %tobool169, label %cond.true170, label %cond.false171

cond.true170:                                     ; preds = %if.then168
  %138 = load i32, i32* %real_last, align 4
  br label %cond.end172

cond.false171:                                    ; preds = %if.then168
  %139 = load i32, i32* %histbeg, align 4
  br label %cond.end172

cond.end172:                                      ; preds = %cond.false171, %cond.true170
  %cond173 = phi i32 [ %138, %cond.true170 ], [ %139, %cond.false171 ]
  store i32 %cond173, i32* %histend, align 4
  br label %if.end180

if.else174:                                       ; preds = %if.else165
  %140 = load i32, i32* %listing, align 4
  %tobool175 = icmp ne i32 %140, 0
  br i1 %tobool175, label %cond.true176, label %cond.false177

cond.true176:                                     ; preds = %if.else174
  %141 = load i32, i32* %last_hist, align 4
  br label %cond.end178

cond.false177:                                    ; preds = %if.else174
  %142 = load i32, i32* %histbeg, align 4
  br label %cond.end178

cond.end178:                                      ; preds = %cond.false177, %cond.true176
  %cond179 = phi i32 [ %141, %cond.true176 ], [ %142, %cond.false177 ]
  store i32 %cond179, i32* %histend, align 4
  br label %if.end180

if.end180:                                        ; preds = %cond.end178, %cond.end172
  br label %if.end181

if.end181:                                        ; preds = %if.end180, %if.then161
  br label %if.end193

if.else182:                                       ; preds = %if.end153
  %143 = load i32, i32* %listing, align 4
  %tobool183 = icmp ne i32 %143, 0
  br i1 %tobool183, label %if.then184, label %if.else191

if.then184:                                       ; preds = %if.else182
  %144 = load i32, i32* %last_hist, align 4
  store i32 %144, i32* %histend, align 4
  %145 = load i32, i32* %histend, align 4
  %sub185 = sub nsw i32 %145, 16
  %add186 = add nsw i32 %sub185, 1
  store i32 %add186, i32* %histbeg, align 4
  %146 = load i32, i32* %histbeg, align 4
  %cmp187 = icmp slt i32 %146, 0
  br i1 %cmp187, label %if.then189, label %if.end190

if.then189:                                       ; preds = %if.then184
  store i32 0, i32* %histbeg, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.then189, %if.then184
  br label %if.end192

if.else191:                                       ; preds = %if.else182
  %147 = load i32, i32* %last_hist, align 4
  store i32 %147, i32* %histend, align 4
  store i32 %147, i32* %histbeg, align 4
  br label %if.end192

if.end192:                                        ; preds = %if.else191, %if.end190
  br label %if.end193

if.end193:                                        ; preds = %if.end192, %if.end181
  %148 = load i32, i32* %listing, align 4
  %cmp194 = icmp eq i32 %148, 0
  br i1 %cmp194, label %land.lhs.true196, label %if.end212

land.lhs.true196:                                 ; preds = %if.end193
  %149 = load i32, i32* @hist_last_line_added, align 4
  %tobool197 = icmp ne i32 %149, 0
  br i1 %tobool197, label %if.then198, label %if.end212

if.then198:                                       ; preds = %land.lhs.true196
  %call199 = call i32 @bash_delete_last_history()
  %150 = load i32, i32* %histbeg, align 4
  %151 = load i32, i32* %histend, align 4
  %cmp200 = icmp eq i32 %150, %151
  br i1 %cmp200, label %land.lhs.true202, label %if.end211

land.lhs.true202:                                 ; preds = %if.then198
  %152 = load i32, i32* %histend, align 4
  %153 = load i32, i32* %last_hist, align 4
  %cmp203 = icmp eq i32 %152, %153
  br i1 %cmp203, label %land.lhs.true205, label %if.end211

land.lhs.true205:                                 ; preds = %land.lhs.true202
  %154 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %155 = load i32, i32* %last_hist, align 4
  %arrayidx206 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %154, i32 %155
  %156 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx206, align 4
  %cmp207 = icmp eq %struct._hist_entry* %156, null
  br i1 %cmp207, label %if.then209, label %if.end211

if.then209:                                       ; preds = %land.lhs.true205
  %157 = load i32, i32* %histend, align 4
  %dec210 = add nsw i32 %157, -1
  store i32 %dec210, i32* %histend, align 4
  store i32 %dec210, i32* %histbeg, align 4
  store i32 %dec210, i32* %last_hist, align 4
  br label %if.end211

if.end211:                                        ; preds = %if.then209, %land.lhs.true205, %land.lhs.true202, %if.then198
  br label %if.end212

if.end212:                                        ; preds = %if.end211, %land.lhs.true196, %if.end193
  %158 = load i32, i32* %histbeg, align 4
  %cmp213 = icmp slt i32 %158, 0
  br i1 %cmp213, label %if.then217, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end212
  %159 = load i32, i32* %histend, align 4
  %cmp215 = icmp slt i32 %159, 0
  br i1 %cmp215, label %if.then217, label %if.end219

if.then217:                                       ; preds = %lor.lhs.false, %if.end212
  %call218 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i32 0, i32 0))
  call void @sh_erange(i8* null, i8* %call218)
  store i32 1, i32* %retval, align 4
  br label %return

if.end219:                                        ; preds = %lor.lhs.false
  %160 = load i32, i32* %histend, align 4
  %161 = load i32, i32* %histbeg, align 4
  %cmp220 = icmp slt i32 %160, %161
  br i1 %cmp220, label %if.then222, label %if.end223

if.then222:                                       ; preds = %if.end219
  %162 = load i32, i32* %histend, align 4
  store i32 %162, i32* %i, align 4
  %163 = load i32, i32* %histbeg, align 4
  store i32 %163, i32* %histend, align 4
  %164 = load i32, i32* %i, align 4
  store i32 %164, i32* %histbeg, align 4
  store i32 1, i32* %reverse, align 4
  br label %if.end223

if.end223:                                        ; preds = %if.then222, %if.end219
  %165 = load i32, i32* %listing, align 4
  %tobool224 = icmp ne i32 %165, 0
  br i1 %tobool224, label %if.then225, label %if.else226

if.then225:                                       ; preds = %if.end223
  %166 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  store %struct._IO_FILE* %166, %struct._IO_FILE** %stream, align 4
  br label %if.end245

if.else226:                                       ; preds = %if.end223
  store i32 0, i32* %numbering, align 4
  %call227 = call %struct._IO_FILE* @sh_mktmpfp(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i32 5, i8** %fn)
  store %struct._IO_FILE* %call227, %struct._IO_FILE** %stream, align 4
  %167 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %cmp228 = icmp eq %struct._IO_FILE* %167, null
  br i1 %cmp228, label %if.then230, label %if.end244

if.then230:                                       ; preds = %if.else226
  %call231 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i32 0, i32 0))
  %168 = load i8*, i8** %fn, align 4
  %tobool232 = icmp ne i8* %168, null
  br i1 %tobool232, label %cond.true233, label %cond.false234

cond.true233:                                     ; preds = %if.then230
  %169 = load i8*, i8** %fn, align 4
  br label %cond.end235

cond.false234:                                    ; preds = %if.then230
  br label %cond.end235

cond.end235:                                      ; preds = %cond.false234, %cond.true233
  %cond236 = phi i8* [ %169, %cond.true233 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.8, i32 0, i32 0), %cond.false234 ]
  %call237 = call i32* @__errno_location()
  %170 = load i32, i32* %call237, align 4
  %call238 = call i8* @strerror(i32 %170)
  call void (i8*, ...) @builtin_error(i8* %call231, i8* %cond236, i8* %call238)
  br label %do.body239

do.body239:                                       ; preds = %cond.end235
  %171 = load i8*, i8** %fn, align 4
  %tobool240 = icmp ne i8* %171, null
  br i1 %tobool240, label %if.then241, label %if.end242

if.then241:                                       ; preds = %do.body239
  %172 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %172, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 398)
  br label %if.end242

if.end242:                                        ; preds = %if.then241, %do.body239
  br label %do.end243

do.end243:                                        ; preds = %if.end242
  store i32 1, i32* %retval, align 4
  br label %return

if.end244:                                        ; preds = %if.else226
  br label %if.end245

if.end245:                                        ; preds = %if.end244, %if.then225
  %173 = load i32, i32* %reverse, align 4
  %tobool246 = icmp ne i32 %173, 0
  br i1 %tobool246, label %cond.true247, label %cond.false248

cond.true247:                                     ; preds = %if.end245
  %174 = load i32, i32* %histend, align 4
  br label %cond.end249

cond.false248:                                    ; preds = %if.end245
  %175 = load i32, i32* %histbeg, align 4
  br label %cond.end249

cond.end249:                                      ; preds = %cond.false248, %cond.true247
  %cond250 = phi i32 [ %174, %cond.true247 ], [ %175, %cond.false248 ]
  store i32 %cond250, i32* %i, align 4
  br label %for.cond251

for.cond251:                                      ; preds = %cond.end296, %cond.end249
  %176 = load i32, i32* %reverse, align 4
  %tobool252 = icmp ne i32 %176, 0
  br i1 %tobool252, label %cond.true253, label %cond.false256

cond.true253:                                     ; preds = %for.cond251
  %177 = load i32, i32* %i, align 4
  %178 = load i32, i32* %histbeg, align 4
  %cmp254 = icmp sge i32 %177, %178
  %conv255 = zext i1 %cmp254 to i32
  br label %cond.end259

cond.false256:                                    ; preds = %for.cond251
  %179 = load i32, i32* %i, align 4
  %180 = load i32, i32* %histend, align 4
  %cmp257 = icmp sle i32 %179, %180
  %conv258 = zext i1 %cmp257 to i32
  br label %cond.end259

cond.end259:                                      ; preds = %cond.false256, %cond.true253
  %cond260 = phi i32 [ %conv255, %cond.true253 ], [ %conv258, %cond.false256 ]
  %tobool261 = icmp ne i32 %cond260, 0
  br i1 %tobool261, label %for.body262, label %for.end298

for.body262:                                      ; preds = %cond.end259
  br label %do.body263

do.body263:                                       ; preds = %for.body262
  %181 = load volatile i32, i32* @terminating_signal, align 4
  %tobool264 = icmp ne i32 %181, 0
  br i1 %tobool264, label %if.then265, label %if.end266

if.then265:                                       ; preds = %do.body263
  %182 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %182)
  br label %if.end266

if.end266:                                        ; preds = %if.then265, %do.body263
  %183 = load volatile i32, i32* @interrupt_state, align 4
  %tobool267 = icmp ne i32 %183, 0
  br i1 %tobool267, label %if.then268, label %if.end269

if.then268:                                       ; preds = %if.end266
  call void @throw_to_top_level()
  br label %if.end269

if.end269:                                        ; preds = %if.then268, %if.end266
  br label %do.end270

do.end270:                                        ; preds = %if.end269
  %184 = load i32, i32* %numbering, align 4
  %tobool271 = icmp ne i32 %184, 0
  br i1 %tobool271, label %if.then272, label %if.end275

if.then272:                                       ; preds = %do.end270
  %185 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %186 = load i32, i32* %i, align 4
  %187 = load i32, i32* @history_base, align 4
  %add273 = add nsw i32 %186, %187
  %call274 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i32 %add273)
  br label %if.end275

if.end275:                                        ; preds = %if.then272, %do.end270
  %188 = load i32, i32* %listing, align 4
  %tobool276 = icmp ne i32 %188, 0
  br i1 %tobool276, label %if.then277, label %if.end287

if.then277:                                       ; preds = %if.end275
  %189 = load i32, i32* @posixly_correct, align 4
  %tobool278 = icmp ne i32 %189, 0
  br i1 %tobool278, label %if.then279, label %if.else281

if.then279:                                       ; preds = %if.then277
  %190 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %call280 = call i32 @fputs(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), %struct._IO_FILE* %190)
  br label %if.end286

if.else281:                                       ; preds = %if.then277
  %191 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %192 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %193 = load i32, i32* %i, align 4
  %arrayidx282 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %192, i32 %193
  %194 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx282, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %194, i32 0, i32 2
  %195 = load i8*, i8** %data, align 4
  %tobool283 = icmp ne i8* %195, null
  %cond284 = select i1 %tobool283, i32 42, i32 32
  %call285 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %191, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0), i32 %cond284)
  br label %if.end286

if.end286:                                        ; preds = %if.else281, %if.then279
  br label %if.end287

if.end287:                                        ; preds = %if.end286, %if.end275
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %197 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %198 = load i32, i32* %i, align 4
  %arrayidx288 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %197, i32 %198
  %199 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx288, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %199, i32 0, i32 0
  %200 = load i8*, i8** %line, align 4
  %call289 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %196, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* %200)
  br label %for.inc290

for.inc290:                                       ; preds = %if.end287
  %201 = load i32, i32* %reverse, align 4
  %tobool291 = icmp ne i32 %201, 0
  br i1 %tobool291, label %cond.true292, label %cond.false294

cond.true292:                                     ; preds = %for.inc290
  %202 = load i32, i32* %i, align 4
  %dec293 = add nsw i32 %202, -1
  store i32 %dec293, i32* %i, align 4
  br label %cond.end296

cond.false294:                                    ; preds = %for.inc290
  %203 = load i32, i32* %i, align 4
  %inc295 = add nsw i32 %203, 1
  store i32 %inc295, i32* %i, align 4
  br label %cond.end296

cond.end296:                                      ; preds = %cond.false294, %cond.true292
  %cond297 = phi i32 [ %202, %cond.true292 ], [ %203, %cond.false294 ]
  br label %for.cond251

for.end298:                                       ; preds = %cond.end259
  %204 = load i32, i32* %listing, align 4
  %tobool299 = icmp ne i32 %204, 0
  br i1 %tobool299, label %if.then300, label %if.end302

if.then300:                                       ; preds = %for.end298
  %call301 = call i32 @sh_chkwrite(i32 0)
  store i32 %call301, i32* %retval, align 4
  br label %return

if.end302:                                        ; preds = %for.end298
  %205 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %call303 = call i32 @fflush(%struct._IO_FILE* %205)
  %206 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %call304 = call i32 @ferror(%struct._IO_FILE* %206)
  %tobool305 = icmp ne i32 %call304, 0
  br i1 %tobool305, label %if.then306, label %if.end308

if.then306:                                       ; preds = %if.end302
  call void @sh_wrerror()
  %207 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %call307 = call i32 @fclose(%struct._IO_FILE* %207)
  store i32 1, i32* %retval, align 4
  br label %return

if.end308:                                        ; preds = %if.end302
  %208 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %call309 = call i32 @fclose(%struct._IO_FILE* %208)
  %209 = load i8*, i8** %ename, align 4
  %tobool310 = icmp ne i8* %209, null
  br i1 %tobool310, label %if.then311, label %if.else318

if.then311:                                       ; preds = %if.end308
  %210 = load i8*, i8** %ename, align 4
  %call312 = call i32 @strlen(i8* %210)
  %211 = load i8*, i8** %fn, align 4
  %call313 = call i32 @strlen(i8* %211)
  %add314 = add i32 %call312, %call313
  %add315 = add i32 %add314, 2
  %call316 = call i8* @sh_xmalloc(i32 %add315, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 433)
  store i8* %call316, i8** %command, align 4
  %212 = load i8*, i8** %command, align 4
  %213 = load i8*, i8** %ename, align 4
  %214 = load i8*, i8** %fn, align 4
  %call317 = call i32 (i8*, i8*, ...) @sprintf(i8* %212, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* %213, i8* %214)
  br label %if.end327

if.else318:                                       ; preds = %if.end308
  %215 = load i32, i32* @posixly_correct, align 4
  %tobool319 = icmp ne i32 %215, 0
  %cond320 = select i1 %tobool319, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.14, i32 0, i32 0)
  store i8* %cond320, i8** %fcedit, align 4
  %216 = load i8*, i8** %fcedit, align 4
  %call321 = call i32 @strlen(i8* %216)
  %add322 = add i32 3, %call321
  %217 = load i8*, i8** %fn, align 4
  %call323 = call i32 @strlen(i8* %217)
  %add324 = add i32 %add322, %call323
  %call325 = call i8* @sh_xmalloc(i32 %add324, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 439)
  store i8* %call325, i8** %command, align 4
  %218 = load i8*, i8** %command, align 4
  %219 = load i8*, i8** %fcedit, align 4
  %220 = load i8*, i8** %fn, align 4
  %call326 = call i32 (i8*, i8*, ...) @sprintf(i8* %218, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* %219, i8* %220)
  br label %if.end327

if.end327:                                        ; preds = %if.else318, %if.then311
  %221 = load i8*, i8** %command, align 4
  %call328 = call i32 @parse_and_execute(i8* %221, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 4)
  store i32 %call328, i32* %retval1, align 4
  %222 = load i32, i32* %retval1, align 4
  %cmp329 = icmp ne i32 %222, 0
  br i1 %cmp329, label %if.then331, label %if.end333

if.then331:                                       ; preds = %if.end327
  %223 = load i8*, i8** %fn, align 4
  %call332 = call i32 @unlink(i8* %223)
  %224 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %224, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 446)
  store i32 1, i32* %retval, align 4
  br label %return

if.end333:                                        ; preds = %if.end327
  store i32 1, i32* @remember_on_history, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i32 0, i32 0))
  %225 = load i8*, i8** %fn, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, i8*)*)(i32 (...)* bitcast (void (i8*)* @xfree to i32 (...)*), i8* %225)
  %226 = load i8*, i8** %fn, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (i8*)*, i8*)*)(i32 (i8*)* @unlink, i8* %226)
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void ()* @set_verbose_flag to void (...)*), i8* null)
  store i32 1, i32* @echo_input_at_read, align 4
  %227 = load i8*, i8** %fn, align 4
  %call334 = call i32 @fc_execute_file(i8* %227)
  store i32 %call334, i32* %retval1, align 4
  call void @run_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i32 0, i32 0))
  %228 = load i32, i32* %retval1, align 4
  store i32 %228, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end333, %if.then331, %if.then306, %if.then300, %do.end243, %if.then217, %if.then151, %if.then107, %if.end100, %if.end77, %sw.default, %sw.bb8
  %229 = load i32, i32* %retval, align 4
  ret i32 %229
}

declare void @reset_internal_getopt() #1

; Function Attrs: noinline nounwind
define internal i32 @fc_number(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %s = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  store i8* %3, i8** %s, align 4
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %6 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i8*, i8** %s, align 4
  %call = call i32 @legal_number(i8* %7, i64* null)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i8* @strchr(i8*, i32) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare %struct.g_list* @list_reverse(...) #1

declare %struct._hist_entry** @history_list() #1

; Function Attrs: noinline nounwind
define internal i8* @fc_gethist(i8* %command, %struct._hist_entry** %hlist) #0 {
entry:
  %retval = alloca i8*, align 4
  %command.addr = alloca i8*, align 4
  %hlist.addr = alloca %struct._hist_entry**, align 4
  %i = alloca i32, align 4
  store i8* %command, i8** %command.addr, align 4
  store %struct._hist_entry** %hlist, %struct._hist_entry*** %hlist.addr, align 4
  %0 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %cmp = icmp eq %struct._hist_entry** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %command.addr, align 4
  %2 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %call = call i32 @fc_gethnum(i8* %1, %struct._hist_entry** %2)
  store i32 %call, i32* %i, align 4
  %3 = load i32, i32* %i, align 4
  %cmp1 = icmp sge i32 %3, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %4 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %4, i32 %5
  %6 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %6, i32 0, i32 0
  %7 = load i8*, i8** %line, align 4
  %call3 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call3
  %call4 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 596)
  %8 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %8, i32 %9
  %10 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx5, align 4
  %line6 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %10, i32 0, i32 0
  %11 = load i8*, i8** %line6, align 4
  %call7 = call i8* @strcpy(i8* %call4, i8* %11)
  store i8* %call7, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then2, %if.then
  %12 = load i8*, i8** %retval, align 4
  ret i8* %12
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @fc_dosubs(i8* %command, %struct.repl* %subs) #0 {
entry:
  %command.addr = alloca i8*, align 4
  %subs.addr = alloca %struct.repl*, align 4
  %new = alloca i8*, align 4
  %t = alloca i8*, align 4
  %r = alloca %struct.repl*, align 4
  store i8* %command, i8** %command.addr, align 4
  store %struct.repl* %subs, %struct.repl** %subs.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 657)
  %1 = load i8*, i8** %command.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %1)
  store i8* %call2, i8** %new, align 4
  %2 = load %struct.repl*, %struct.repl** %subs.addr, align 4
  store %struct.repl* %2, %struct.repl** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load %struct.repl*, %struct.repl** %r, align 4
  %tobool = icmp ne %struct.repl* %3, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %new, align 4
  %5 = load %struct.repl*, %struct.repl** %r, align 4
  %pat = getelementptr inbounds %struct.repl, %struct.repl* %5, i32 0, i32 1
  %6 = load i8*, i8** %pat, align 4
  %7 = load %struct.repl*, %struct.repl** %r, align 4
  %rep = getelementptr inbounds %struct.repl, %struct.repl* %7, i32 0, i32 2
  %8 = load i8*, i8** %rep, align 4
  %call3 = call i8* @strsub(i8* %4, i8* %6, i8* %8, i32 1)
  store i8* %call3, i8** %t, align 4
  %9 = load i8*, i8** %new, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 660)
  %10 = load i8*, i8** %t, align 4
  store i8* %10, i8** %new, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load %struct.repl*, %struct.repl** %r, align 4
  %next = getelementptr inbounds %struct.repl, %struct.repl* %11, i32 0, i32 0
  %12 = load %struct.repl*, %struct.repl** %next, align 4
  store %struct.repl* %12, %struct.repl** %r, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %new, align 4
  ret i8* %13
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define internal void @fc_replhist(i8* %command) #0 {
entry:
  %command.addr = alloca i8*, align 4
  %n = alloca i32, align 4
  store i8* %command, i8** %command.addr, align 4
  %0 = load i8*, i8** %command.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %command.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %if.end14

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %command.addr, align 4
  %call = call i32 @strlen(i8* %3)
  store i32 %call, i32* %n, align 4
  %4 = load i8*, i8** %command.addr, align 4
  %5 = load i32, i32* %n, align 4
  %sub = sub nsw i32 %5, 1
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %sub
  %6 = load i8, i8* %arrayidx, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 10
  br i1 %cmp4, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %7 = load i8*, i8** %command.addr, align 4
  %8 = load i32, i32* %n, align 4
  %sub7 = sub nsw i32 %8, 1
  %arrayidx8 = getelementptr inbounds i8, i8* %7, i32 %sub7
  store i8 0, i8* %arrayidx8, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end
  %9 = load i8*, i8** %command.addr, align 4
  %tobool = icmp ne i8* %9, null
  br i1 %tobool, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.end9
  %10 = load i8*, i8** %command.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv10 = sext i8 %11 to i32
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %land.lhs.true
  %call13 = call i32 @bash_delete_last_history()
  %12 = load i8*, i8** %command.addr, align 4
  call void @maybe_add_history(i8* %12)
  br label %if.end14

if.end14:                                         ; preds = %if.then, %if.then12, %land.lhs.true, %if.end9
  ret void
}

declare i32 @parse_and_execute(i8*, i8*, i32) #1

declare void @sh_erange(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @fc_gethnum(i8* %command, %struct._hist_entry** %hlist) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  %hlist.addr = alloca %struct._hist_entry**, align 4
  %sign = alloca i32, align 4
  %n = alloca i32, align 4
  %clen = alloca i32, align 4
  %rh = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %last_hist = alloca i32, align 4
  %real_last = alloca i32, align 4
  %s = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  store %struct._hist_entry** %hlist, %struct._hist_entry*** %hlist.addr, align 4
  store i32 1, i32* %sign, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %0, i32 %1
  %2 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool = icmp ne %struct._hist_entry* %2, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* @remember_on_history, align 4
  %tobool1 = icmp ne i32 %4, 0
  br i1 %tobool1, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end
  %5 = load i32, i32* @subshell_environment, align 4
  %and = and i32 %5, 4
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %6 = load i32, i32* @enable_history_list, align 4
  %tobool3 = icmp ne i32 %6, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %7 = phi i1 [ false, %lor.rhs ], [ %tobool3, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %for.end
  %8 = phi i1 [ true, %for.end ], [ %7, %land.end ]
  %lor.ext = zext i1 %8 to i32
  store i32 %lor.ext, i32* %rh, align 4
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %rh, align 4
  %sub = sub nsw i32 %9, %10
  %11 = load i32, i32* @hist_last_line_added, align 4
  %sub4 = sub nsw i32 %sub, %11
  store i32 %sub4, i32* %last_hist, align 4
  %12 = load i32, i32* %i, align 4
  %13 = load i32, i32* %last_hist, align 4
  %cmp = icmp eq i32 %12, %13
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.end
  %14 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %15 = load i32, i32* %last_hist, align 4
  %arrayidx5 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %14, i32 %15
  %16 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx5, align 4
  %cmp6 = icmp eq %struct._hist_entry* %16, null
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %17 = load i32, i32* %last_hist, align 4
  %cmp7 = icmp sge i32 %17, 0
  br i1 %cmp7, label %land.rhs8, label %land.end11

land.rhs8:                                        ; preds = %while.cond
  %18 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %19 = load i32, i32* %last_hist, align 4
  %arrayidx9 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %18, i32 %19
  %20 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx9, align 4
  %cmp10 = icmp eq %struct._hist_entry* %20, null
  br label %land.end11

land.end11:                                       ; preds = %land.rhs8, %while.cond
  %21 = phi i1 [ false, %while.cond ], [ %cmp10, %land.rhs8 ]
  br i1 %21, label %while.body, label %while.end

while.body:                                       ; preds = %land.end11
  %22 = load i32, i32* %last_hist, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, i32* %last_hist, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end11
  br label %if.end

if.end:                                           ; preds = %while.end, %land.lhs.true, %lor.end
  %23 = load i32, i32* %last_hist, align 4
  %cmp12 = icmp slt i32 %23, 0
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.end
  store i32 -1, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %if.end
  %24 = load i32, i32* %i, align 4
  store i32 %24, i32* %real_last, align 4
  %25 = load i32, i32* %last_hist, align 4
  store i32 %25, i32* %i, align 4
  %26 = load i8*, i8** %command.addr, align 4
  %cmp15 = icmp eq i8* %26, null
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  %27 = load i32, i32* %i, align 4
  store i32 %27, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end14
  br label %while.cond18

while.cond18:                                     ; preds = %while.body24, %if.end17
  %28 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %29 = load i32, i32* %real_last, align 4
  %arrayidx19 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %28, i32 %29
  %30 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx19, align 4
  %cmp20 = icmp eq %struct._hist_entry* %30, null
  br i1 %cmp20, label %land.rhs21, label %land.end23

land.rhs21:                                       ; preds = %while.cond18
  %31 = load i32, i32* %real_last, align 4
  %cmp22 = icmp sgt i32 %31, 0
  br label %land.end23

land.end23:                                       ; preds = %land.rhs21, %while.cond18
  %32 = phi i1 [ false, %while.cond18 ], [ %cmp22, %land.rhs21 ]
  br i1 %32, label %while.body24, label %while.end26

while.body24:                                     ; preds = %land.end23
  %33 = load i32, i32* %real_last, align 4
  %dec25 = add nsw i32 %33, -1
  store i32 %dec25, i32* %real_last, align 4
  br label %while.cond18

while.end26:                                      ; preds = %land.end23
  %34 = load i8*, i8** %command.addr, align 4
  store i8* %34, i8** %s, align 4
  %35 = load i8*, i8** %s, align 4
  %tobool27 = icmp ne i8* %35, null
  br i1 %tobool27, label %land.lhs.true28, label %if.end32

land.lhs.true28:                                  ; preds = %while.end26
  %36 = load i8*, i8** %s, align 4
  %37 = load i8, i8* %36, align 1
  %conv = sext i8 %37 to i32
  %cmp29 = icmp eq i32 %conv, 45
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %land.lhs.true28
  store i32 -1, i32* %sign, align 4
  %38 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %land.lhs.true28, %while.end26
  %39 = load i8*, i8** %s, align 4
  %tobool33 = icmp ne i8* %39, null
  br i1 %tobool33, label %land.lhs.true34, label %if.end66

land.lhs.true34:                                  ; preds = %if.end32
  %40 = load i8*, i8** %s, align 4
  %41 = load i8, i8* %40, align 1
  %conv35 = sext i8 %41 to i32
  %cmp36 = icmp sge i32 %conv35, 48
  br i1 %cmp36, label %land.lhs.true38, label %if.end66

land.lhs.true38:                                  ; preds = %land.lhs.true34
  %42 = load i8*, i8** %s, align 4
  %43 = load i8, i8* %42, align 1
  %conv39 = sext i8 %43 to i32
  %cmp40 = icmp sle i32 %conv39, 57
  br i1 %cmp40, label %if.then42, label %if.end66

if.then42:                                        ; preds = %land.lhs.true38
  %44 = load i8*, i8** %s, align 4
  %call = call i32 @atoi(i8* %44)
  store i32 %call, i32* %n, align 4
  %45 = load i32, i32* %sign, align 4
  %46 = load i32, i32* %n, align 4
  %mul = mul nsw i32 %46, %45
  store i32 %mul, i32* %n, align 4
  %47 = load i32, i32* %n, align 4
  %cmp43 = icmp slt i32 %47, 0
  br i1 %cmp43, label %if.then45, label %if.else

if.then45:                                        ; preds = %if.then42
  %48 = load i32, i32* %i, align 4
  %add = add nsw i32 %48, 1
  %49 = load i32, i32* %n, align 4
  %add46 = add nsw i32 %49, %add
  store i32 %add46, i32* %n, align 4
  %50 = load i32, i32* %n, align 4
  %cmp47 = icmp slt i32 %50, 0
  br i1 %cmp47, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then45
  br label %cond.end

cond.false:                                       ; preds = %if.then45
  %51 = load i32, i32* %n, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %51, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then42
  %52 = load i32, i32* %n, align 4
  %cmp49 = icmp eq i32 %52, 0
  br i1 %cmp49, label %if.then51, label %if.else58

if.then51:                                        ; preds = %if.else
  %53 = load i32, i32* %sign, align 4
  %cmp52 = icmp eq i32 %53, -1
  br i1 %cmp52, label %cond.true54, label %cond.false55

cond.true54:                                      ; preds = %if.then51
  %54 = load i32, i32* %real_last, align 4
  br label %cond.end56

cond.false55:                                     ; preds = %if.then51
  %55 = load i32, i32* %i, align 4
  br label %cond.end56

cond.end56:                                       ; preds = %cond.false55, %cond.true54
  %cond57 = phi i32 [ %54, %cond.true54 ], [ %55, %cond.false55 ]
  store i32 %cond57, i32* %retval, align 4
  br label %return

if.else58:                                        ; preds = %if.else
  %56 = load i32, i32* @history_base, align 4
  %57 = load i32, i32* %n, align 4
  %sub59 = sub nsw i32 %57, %56
  store i32 %sub59, i32* %n, align 4
  %58 = load i32, i32* %i, align 4
  %59 = load i32, i32* %n, align 4
  %cmp60 = icmp slt i32 %58, %59
  br i1 %cmp60, label %cond.true62, label %cond.false63

cond.true62:                                      ; preds = %if.else58
  %60 = load i32, i32* %i, align 4
  br label %cond.end64

cond.false63:                                     ; preds = %if.else58
  %61 = load i32, i32* %n, align 4
  br label %cond.end64

cond.end64:                                       ; preds = %cond.false63, %cond.true62
  %cond65 = phi i32 [ %60, %cond.true62 ], [ %61, %cond.false63 ]
  store i32 %cond65, i32* %retval, align 4
  br label %return

if.end66:                                         ; preds = %land.lhs.true38, %land.lhs.true34, %if.end32
  %62 = load i8*, i8** %command.addr, align 4
  %call67 = call i32 @strlen(i8* %62)
  store i32 %call67, i32* %clen, align 4
  %63 = load i32, i32* %i, align 4
  store i32 %63, i32* %j, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc91, %if.end66
  %64 = load i32, i32* %j, align 4
  %cmp69 = icmp sge i32 %64, 0
  br i1 %cmp69, label %for.body71, label %for.end93

for.body71:                                       ; preds = %for.cond68
  %65 = load i32, i32* %clen, align 4
  %cmp72 = icmp eq i32 %65, 0
  br i1 %cmp72, label %cond.true74, label %cond.false75

cond.true74:                                      ; preds = %for.body71
  br i1 true, label %if.then89, label %if.end90

cond.false75:                                     ; preds = %for.body71
  %66 = load i8*, i8** %command.addr, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %66, i32 0
  %67 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %67 to i32
  %68 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %69 = load i32, i32* %j, align 4
  %arrayidx78 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %68, i32 %69
  %70 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx78, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %70, i32 0, i32 0
  %71 = load i8*, i8** %line, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %71, i32 0
  %72 = load i8, i8* %arrayidx79, align 1
  %conv80 = sext i8 %72 to i32
  %cmp81 = icmp eq i32 %conv77, %conv80
  br i1 %cmp81, label %land.lhs.true83, label %if.end90

land.lhs.true83:                                  ; preds = %cond.false75
  %73 = load i8*, i8** %command.addr, align 4
  %74 = load %struct._hist_entry**, %struct._hist_entry*** %hlist.addr, align 4
  %75 = load i32, i32* %j, align 4
  %arrayidx84 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %74, i32 %75
  %76 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx84, align 4
  %line85 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %76, i32 0, i32 0
  %77 = load i8*, i8** %line85, align 4
  %78 = load i32, i32* %clen, align 4
  %call86 = call i32 @strncmp(i8* %73, i8* %77, i32 %78)
  %cmp87 = icmp eq i32 %call86, 0
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %land.lhs.true83, %cond.true74
  %79 = load i32, i32* %j, align 4
  store i32 %79, i32* %retval, align 4
  br label %return

if.end90:                                         ; preds = %land.lhs.true83, %cond.false75, %cond.true74
  br label %for.inc91

for.inc91:                                        ; preds = %if.end90
  %80 = load i32, i32* %j, align 4
  %dec92 = add nsw i32 %80, -1
  store i32 %dec92, i32* %j, align 4
  br label %for.cond68

for.end93:                                        ; preds = %for.cond68
  store i32 -1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end93, %if.then89, %cond.end64, %cond.end56, %cond.end, %if.then16, %if.then13
  %81 = load i32, i32* %retval, align 4
  ret i32 %81
}

declare i32 @bash_delete_last_history() #1

declare %struct._IO_FILE* @sh_mktmpfp(i8*, i32, i8**) #1

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i32 @sh_chkwrite(i32) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @ferror(%struct._IO_FILE*) #1

declare void @sh_wrerror() #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @sprintf(i8*, i8*, ...) #1

declare i32 @unlink(i8*) #1

declare void @begin_unwind_frame(i8*) #1

declare void @add_unwind_protect(...) #1

declare void @xfree(i8*) #1

declare i32 @fc_execute_file(i8*) #1

declare void @run_unwind_frame(i8*) #1

; Function Attrs: noinline nounwind
define internal void @set_verbose_flag() #0 {
entry:
  %0 = load i32, i32* @verbose_flag, align 4
  store i32 %0, i32* @echo_input_at_read, align 4
  ret void
}

declare i32 @legal_number(i8*, i64*) #1

declare i32 @atoi(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @strsub(i8*, i8*, i8*, i32) #1

declare void @maybe_add_history(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
