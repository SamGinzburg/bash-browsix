; ModuleID = 'read.c'
source_filename = "read.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.ttsave = type { i32, %struct.termios* }
%struct.termios = type { i32, i32, i32, i32, i8, [32 x i8], i32, i32 }
%struct._IO_FILE = type opaque
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct._keymap_entry = type { i8, i32 (i32, i32)* }
%struct.__mbstate_t = type { i32, i32 }

@tty_modified = internal global i32 0, align 4
@reading = internal global i32 0, align 4
@sigalrm_seen = common global i32 0, align 4
@delim = internal global i8 0, align 1
@.str = private unnamed_addr constant [20 x i8] c"ersa:d:i:n:p:t:u:N:\00", align 1
@list_optarg = external global i8*, align 4
@.str.1 = private unnamed_addr constant [34 x i8] c"%s: invalid timeout specification\00", align 1
@.str.2 = private unnamed_addr constant [42 x i8] c"%s: invalid file descriptor specification\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"%d: invalid file descriptor: %s\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"./read.def\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"TMOUT\00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"read_builtin\00", align 1
@interactive = external global i32, align 4
@default_buffered_input = external global i32, align 4
@alrmbuf = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@interactive_shell = external global i32, align 4
@old_alrm = internal global void (i32)* null, align 4
@rl_num_chars_to_read = external global i32, align 4
@termsave = internal global %struct.ttsave zeroinitializer, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.8 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"PS2\00", align 1
@posixly_correct = external global i32, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@trapped_signal_received = external global i32, align 4
@.str.10 = private unnamed_addr constant [19 x i8] c"read error: %d: %s\00", align 1
@.str.11 = private unnamed_addr constant [48 x i8] c"%s: cannot convert associative to indexed array\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"REPLY\00", align 1
@ifs_cmap = external global [0 x i8], align 1
@is_basic_table = external constant [0 x i32], align 4
@rl_attempted_completion_function = external global i8** (i8*, i32, i32)*, align 4
@old_attempted_completion_function = internal global i8** (i8*, i32, i32)* null, align 4
@bash_readline_initialized = external global i32, align 4
@rl_startup_hook = external global i32 ()*, align 4
@old_startup_hook = internal global i32 ()* null, align 4
@deftext = internal global i8* null, align 4
@old_newline_ctype = internal global i32 0, align 4
@old_newline_func = internal global i32 (i32, i32)* null, align 4
@old_delim_ctype = internal global i32 0, align 4
@old_delim_func = internal global i32 (i32, i32)* null, align 4
@delim_char = internal global i8 0, align 1

; Function Attrs: noinline nounwind
define i32 @read_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %varname = alloca i8*, align 4
  %size = alloca i32, align 4
  %nr = alloca i32, align 4
  %pass_next = alloca i32, align 4
  %saw_escape = alloca i32, align 4
  %eof = alloca i32, align 4
  %opt = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %code = alloca i32, align 4
  %print_ps2 = alloca i32, align 4
  %i = alloca i32, align 4
  %input_is_tty = alloca i32, align 4
  %input_is_pipe = alloca i32, align 4
  %unbuffered_read = alloca i32, align 4
  %skip_ctlesc = alloca i32, align 4
  %skip_ctlnul = alloca i32, align 4
  %raw = alloca i32, align 4
  %edit = alloca i32, align 4
  %nchars = alloca i32, align 4
  %silent = alloca i32, align 4
  %have_timeout = alloca i32, align 4
  %ignore_delim = alloca i32, align 4
  %fd = alloca i32, align 4
  %lastsig = alloca i32, align 4
  %t_errno = alloca i32, align 4
  %tmsec = alloca i32, align 4
  %tmusec = alloca i32, align 4
  %ival = alloca i32, align 4
  %uval = alloca i32, align 4
  %intval = alloca i64, align 8
  %c = alloca i8, align 1
  %input_string = alloca i8*, align 4
  %orig_input_string = alloca i8*, align 4
  %ifs_chars = alloca i8*, align 4
  %prompt = alloca i8*, align 4
  %arrayname = alloca i8*, align 4
  %e = alloca i8*, align 4
  %t = alloca i8*, align 4
  %t1 = alloca i8*, align 4
  %ps2 = alloca i8*, align 4
  %tofree = alloca i8*, align 4
  %tsb = alloca %struct.stat, align 8
  %var = alloca %struct.variable*, align 4
  %ttattrs = alloca %struct.termios, align 4
  %ttset = alloca %struct.termios, align 4
  %alist = alloca %struct.word_list*, align 4
  %rlbuf = alloca i8*, align 4
  %itext = alloca i8*, align 4
  %rlind = alloca i32, align 4
  %t417 = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* @tty_modified, align 4
  store i32 0, i32* @reading, align 4
  store i32 0, i32* @sigalrm_seen, align 4
  store volatile i32 0, i32* %i, align 4
  store i32 0, i32* %edit, align 4
  store i32 0, i32* %raw, align 4
  store i32 0, i32* %silent, align 4
  store i8* null, i8** %prompt, align 4
  store i8* null, i8** %arrayname, align 4
  store i32 0, i32* %fd, align 4
  store i8* null, i8** %itext, align 4
  store i8* null, i8** %rlbuf, align 4
  store i32 0, i32* %rlind, align 4
  store i32 0, i32* %tmusec, align 4
  store i32 0, i32* %tmsec, align 4
  store i32 0, i32* %have_timeout, align 4
  store i32 0, i32* %unbuffered_read, align 4
  store i32 0, i32* %input_is_pipe, align 4
  store i32 0, i32* %input_is_tty, align 4
  store i32 0, i32* %nchars, align 4
  store i32 0, i32* %nr, align 4
  store i8 10, i8* @delim, align 1
  store i32 0, i32* %ignore_delim, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 114, label %sw.bb
    i32 112, label %sw.bb2
    i32 115, label %sw.bb3
    i32 101, label %sw.bb4
    i32 105, label %sw.bb5
    i32 97, label %sw.bb6
    i32 116, label %sw.bb7
    i32 78, label %sw.bb14
    i32 110, label %sw.bb15
    i32 117, label %sw.bb28
    i32 100, label %sw.bb53
    i32 -99, label %sw.bb54
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %raw, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  %2 = load i8*, i8** @list_optarg, align 4
  store i8* %2, i8** %prompt, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  store i32 1, i32* %silent, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %while.body
  store i32 1, i32* %edit, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  %3 = load i8*, i8** @list_optarg, align 4
  store i8* %3, i8** %itext, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %while.body
  %4 = load i8*, i8** @list_optarg, align 4
  store i8* %4, i8** %arrayname, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %5 = load i8*, i8** @list_optarg, align 4
  %call8 = call i32 @uconvert(i8* %5, i32* %ival, i32* %uval)
  store i32 %call8, i32* %code, align 4
  %6 = load i32, i32* %code, align 4
  %cmp9 = icmp eq i32 %6, 0
  br i1 %cmp9, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb7
  %7 = load i32, i32* %ival, align 4
  %cmp10 = icmp slt i32 %7, 0
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false
  %8 = load i32, i32* %uval, align 4
  %cmp12 = icmp slt i32 %8, 0
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false11, %lor.lhs.false, %sw.bb7
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0))
  %9 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call13, i8* %9)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false11
  store i32 1, i32* %have_timeout, align 4
  %10 = load i32, i32* %ival, align 4
  store i32 %10, i32* %tmsec, align 4
  %11 = load i32, i32* %uval, align 4
  store i32 %11, i32* %tmusec, align 4
  br label %if.end

if.end:                                           ; preds = %if.else
  br label %sw.epilog

sw.bb14:                                          ; preds = %while.body
  store i32 1, i32* %ignore_delim, align 4
  store i8 -1, i8* @delim, align 1
  br label %sw.bb15

sw.bb15:                                          ; preds = %while.body, %sw.bb14
  %12 = load i8*, i8** @list_optarg, align 4
  %call16 = call i32 @legal_number(i8* %12, i64* %intval)
  store i32 %call16, i32* %code, align 4
  %13 = load i32, i32* %code, align 4
  %cmp17 = icmp eq i32 %13, 0
  br i1 %cmp17, label %if.then24, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %sw.bb15
  %14 = load i64, i64* %intval, align 8
  %cmp19 = icmp slt i64 %14, 0
  br i1 %cmp19, label %if.then24, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false18
  %15 = load i64, i64* %intval, align 8
  %16 = load i64, i64* %intval, align 8
  %conv = trunc i64 %16 to i32
  %conv21 = sext i32 %conv to i64
  %cmp22 = icmp ne i64 %15, %conv21
  br i1 %cmp22, label %if.then24, label %if.else25

if.then24:                                        ; preds = %lor.lhs.false20, %lor.lhs.false18, %sw.bb15
  %17 = load i8*, i8** @list_optarg, align 4
  call void @sh_invalidnum(i8* %17)
  store i32 1, i32* %retval, align 4
  br label %return

if.else25:                                        ; preds = %lor.lhs.false20
  %18 = load i64, i64* %intval, align 8
  %conv26 = trunc i64 %18 to i32
  store i32 %conv26, i32* %nchars, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.else25
  br label %sw.epilog

sw.bb28:                                          ; preds = %while.body
  %19 = load i8*, i8** @list_optarg, align 4
  %call29 = call i32 @legal_number(i8* %19, i64* %intval)
  store i32 %call29, i32* %code, align 4
  %20 = load i32, i32* %code, align 4
  %cmp30 = icmp eq i32 %20, 0
  br i1 %cmp30, label %if.then40, label %lor.lhs.false32

lor.lhs.false32:                                  ; preds = %sw.bb28
  %21 = load i64, i64* %intval, align 8
  %cmp33 = icmp slt i64 %21, 0
  br i1 %cmp33, label %if.then40, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %lor.lhs.false32
  %22 = load i64, i64* %intval, align 8
  %23 = load i64, i64* %intval, align 8
  %conv36 = trunc i64 %23 to i32
  %conv37 = sext i32 %conv36 to i64
  %cmp38 = icmp ne i64 %22, %conv37
  br i1 %cmp38, label %if.then40, label %if.else42

if.then40:                                        ; preds = %lor.lhs.false35, %lor.lhs.false32, %sw.bb28
  %call41 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i32 0, i32 0))
  %24 = load i8*, i8** @list_optarg, align 4
  call void (i8*, ...) @builtin_error(i8* %call41, i8* %24)
  store i32 1, i32* %retval, align 4
  br label %return

if.else42:                                        ; preds = %lor.lhs.false35
  %25 = load i64, i64* %intval, align 8
  %conv43 = trunc i64 %25 to i32
  store i32 %conv43, i32* %fd, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.else42
  %26 = load i32, i32* %fd, align 4
  %call45 = call i32 @sh_validfd(i32 %26)
  %cmp46 = icmp eq i32 %call45, 0
  br i1 %cmp46, label %if.then48, label %if.end52

if.then48:                                        ; preds = %if.end44
  %call49 = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0))
  %27 = load i32, i32* %fd, align 4
  %call50 = call i32* @__errno_location()
  %28 = load i32, i32* %call50, align 4
  %call51 = call i8* @strerror(i32 %28)
  call void (i8*, ...) @builtin_error(i8* %call49, i32 %27, i8* %call51)
  store i32 1, i32* %retval, align 4
  br label %return

if.end52:                                         ; preds = %if.end44
  br label %sw.epilog

sw.bb53:                                          ; preds = %while.body
  %29 = load i8*, i8** @list_optarg, align 4
  %30 = load i8, i8* %29, align 1
  store i8 %30, i8* @delim, align 1
  br label %sw.epilog

sw.bb54:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb53, %if.end52, %if.end27, %if.end, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %31 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %31, %struct.word_list** %list.addr, align 4
  %32 = load i32, i32* %have_timeout, align 4
  %tobool = icmp ne i32 %32, 0
  br i1 %tobool, label %land.lhs.true, label %if.end63

land.lhs.true:                                    ; preds = %while.end
  %33 = load i32, i32* %tmsec, align 4
  %cmp55 = icmp eq i32 %33, 0
  br i1 %cmp55, label %land.lhs.true57, label %if.end63

land.lhs.true57:                                  ; preds = %land.lhs.true
  %34 = load i32, i32* %tmusec, align 4
  %cmp58 = icmp eq i32 %34, 0
  br i1 %cmp58, label %if.then60, label %if.end63

if.then60:                                        ; preds = %land.lhs.true57
  %35 = load i32, i32* %fd, align 4
  %call61 = call i32 @input_avail(i32 %35)
  %tobool62 = icmp ne i32 %call61, 0
  %cond = select i1 %tobool62, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end63:                                         ; preds = %land.lhs.true57, %land.lhs.true, %while.end
  %36 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool64 = icmp ne %struct.word_list* %36, null
  br i1 %tobool64, label %land.lhs.true65, label %if.end79

land.lhs.true65:                                  ; preds = %if.end63
  %37 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %37, i32 0, i32 1
  %38 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word66 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %38, i32 0, i32 0
  %39 = load i8*, i8** %word66, align 4
  %call67 = call i32 @legal_identifier(i8* %39)
  %cmp68 = icmp eq i32 %call67, 0
  br i1 %cmp68, label %land.lhs.true70, label %if.end79

land.lhs.true70:                                  ; preds = %land.lhs.true65
  %40 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word71 = getelementptr inbounds %struct.word_list, %struct.word_list* %40, i32 0, i32 1
  %41 = load %struct.word_desc*, %struct.word_desc** %word71, align 4
  %word72 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %41, i32 0, i32 0
  %42 = load i8*, i8** %word72, align 4
  %call73 = call i32 @valid_array_reference(i8* %42, i32 0)
  %cmp74 = icmp eq i32 %call73, 0
  br i1 %cmp74, label %if.then76, label %if.end79

if.then76:                                        ; preds = %land.lhs.true70
  %43 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word77 = getelementptr inbounds %struct.word_list, %struct.word_list* %43, i32 0, i32 1
  %44 = load %struct.word_desc*, %struct.word_desc** %word77, align 4
  %word78 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 0
  %45 = load i8*, i8** %word78, align 4
  call void @sh_invalidid(i8* %45)
  store i32 1, i32* %retval, align 4
  br label %return

if.end79:                                         ; preds = %land.lhs.true70, %land.lhs.true65, %if.end63
  %46 = load i32, i32* %ignore_delim, align 4
  %tobool80 = icmp ne i32 %46, 0
  br i1 %tobool80, label %if.then81, label %if.end82

if.then81:                                        ; preds = %if.end79
  store i8 -1, i8* @delim, align 1
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %if.end79
  %call83 = call i8* @getifs()
  store i8* %call83, i8** %ifs_chars, align 4
  %47 = load i8*, i8** %ifs_chars, align 4
  %cmp84 = icmp eq i8* %47, null
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %if.end82
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8** %ifs_chars, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.then86, %if.end82
  %48 = load i32, i32* %ignore_delim, align 4
  %tobool88 = icmp ne i32 %48, 0
  br i1 %tobool88, label %if.then89, label %if.end90

if.then89:                                        ; preds = %if.end87
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8** %ifs_chars, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %if.end87
  store i32 0, i32* %skip_ctlnul, align 4
  store i32 0, i32* %skip_ctlesc, align 4
  %49 = load i8*, i8** %ifs_chars, align 4
  store i8* %49, i8** %e, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end90
  %50 = load i8*, i8** %e, align 4
  %51 = load i8, i8* %50, align 1
  %tobool91 = icmp ne i8 %51, 0
  br i1 %tobool91, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %52 = load i8*, i8** %e, align 4
  %53 = load i8, i8* %52, align 1
  %conv92 = sext i8 %53 to i32
  %cmp93 = icmp eq i32 %conv92, 1
  %conv94 = zext i1 %cmp93 to i32
  %54 = load i32, i32* %skip_ctlesc, align 4
  %or = or i32 %54, %conv94
  store i32 %or, i32* %skip_ctlesc, align 4
  %55 = load i8*, i8** %e, align 4
  %56 = load i8, i8* %55, align 1
  %conv95 = sext i8 %56 to i32
  %cmp96 = icmp eq i32 %conv95, 127
  %conv97 = zext i1 %cmp96 to i32
  %57 = load i32, i32* %skip_ctlnul, align 4
  %or98 = or i32 %57, %conv97
  store i32 %or98, i32* %skip_ctlnul, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %58 = load i8*, i8** %e, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr, i8** %e, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 112, i32* %size, align 4
  %call99 = call i8* @sh_xmalloc(i32 112, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 364)
  store i8* %call99, i8** %input_string, align 4
  %59 = load i8*, i8** %input_string, align 4
  %arrayidx = getelementptr inbounds i8, i8* %59, i32 0
  store i8 0, i8* %arrayidx, align 1
  %60 = load i32, i32* %have_timeout, align 4
  %cmp100 = icmp eq i32 %60, 0
  br i1 %cmp100, label %land.lhs.true102, label %if.end118

land.lhs.true102:                                 ; preds = %for.end
  %call103 = call i8* @get_string_value(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call103, i8** %e, align 4
  %tobool104 = icmp ne i8* %call103, null
  br i1 %tobool104, label %if.then105, label %if.end118

if.then105:                                       ; preds = %land.lhs.true102
  %61 = load i8*, i8** %e, align 4
  %call106 = call i32 @uconvert(i8* %61, i32* %ival, i32* %uval)
  store i32 %call106, i32* %code, align 4
  %62 = load i32, i32* %code, align 4
  %cmp107 = icmp eq i32 %62, 0
  br i1 %cmp107, label %if.then115, label %lor.lhs.false109

lor.lhs.false109:                                 ; preds = %if.then105
  %63 = load i32, i32* %ival, align 4
  %cmp110 = icmp slt i32 %63, 0
  br i1 %cmp110, label %if.then115, label %lor.lhs.false112

lor.lhs.false112:                                 ; preds = %lor.lhs.false109
  %64 = load i32, i32* %uval, align 4
  %cmp113 = icmp slt i32 %64, 0
  br i1 %cmp113, label %if.then115, label %if.else116

if.then115:                                       ; preds = %lor.lhs.false112, %lor.lhs.false109, %if.then105
  store i32 0, i32* %tmusec, align 4
  store i32 0, i32* %tmsec, align 4
  br label %if.end117

if.else116:                                       ; preds = %lor.lhs.false112
  %65 = load i32, i32* %ival, align 4
  store i32 %65, i32* %tmsec, align 4
  %66 = load i32, i32* %uval, align 4
  store i32 %66, i32* %tmusec, align 4
  br label %if.end117

if.end117:                                        ; preds = %if.else116, %if.then115
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %land.lhs.true102, %for.end
  call void @begin_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0))
  %67 = load i32, i32* @interactive, align 4
  %cmp119 = icmp eq i32 %67, 0
  br i1 %cmp119, label %land.lhs.true121, label %if.end129

land.lhs.true121:                                 ; preds = %if.end118
  %68 = load i32, i32* @default_buffered_input, align 4
  %cmp122 = icmp sge i32 %68, 0
  br i1 %cmp122, label %land.lhs.true124, label %if.end129

land.lhs.true124:                                 ; preds = %land.lhs.true121
  %69 = load i32, i32* %fd, align 4
  %call125 = call i32 @fd_is_bash_input(i32 %69)
  %tobool126 = icmp ne i32 %call125, 0
  br i1 %tobool126, label %if.then127, label %if.end129

if.then127:                                       ; preds = %land.lhs.true124
  %70 = load i32, i32* @default_buffered_input, align 4
  %call128 = call i32 @sync_buffered_stream(i32 %70)
  br label %if.end129

if.end129:                                        ; preds = %if.then127, %land.lhs.true124, %land.lhs.true121, %if.end118
  %71 = load i32, i32* %fd, align 4
  %call130 = call i32 @isatty(i32 %71)
  store i32 %call130, i32* %input_is_tty, align 4
  %72 = load i32, i32* %input_is_tty, align 4
  %cmp131 = icmp eq i32 %72, 0
  br i1 %cmp131, label %if.then133, label %if.end140

if.then133:                                       ; preds = %if.end129
  %73 = load i32, i32* %fd, align 4
  %call134 = call i32 @lseek(i32 %73, i32 0, i32 1)
  %cmp135 = icmp slt i32 %call134, 0
  br i1 %cmp135, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then133
  %call137 = call i32* @__errno_location()
  %74 = load i32, i32* %call137, align 4
  %cmp138 = icmp eq i32 %74, 29
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then133
  %75 = phi i1 [ false, %if.then133 ], [ %cmp138, %land.rhs ]
  %land.ext = zext i1 %75 to i32
  store i32 %land.ext, i32* %input_is_pipe, align 4
  br label %if.end140

if.end140:                                        ; preds = %land.end, %if.end129
  %76 = load i8*, i8** %prompt, align 4
  %tobool141 = icmp ne i8* %76, null
  br i1 %tobool141, label %land.lhs.true146, label %lor.lhs.false142

lor.lhs.false142:                                 ; preds = %if.end140
  %77 = load i32, i32* %edit, align 4
  %tobool143 = icmp ne i32 %77, 0
  br i1 %tobool143, label %land.lhs.true146, label %lor.lhs.false144

lor.lhs.false144:                                 ; preds = %lor.lhs.false142
  %78 = load i32, i32* %silent, align 4
  %tobool145 = icmp ne i32 %78, 0
  br i1 %tobool145, label %land.lhs.true146, label %if.end150

land.lhs.true146:                                 ; preds = %lor.lhs.false144, %lor.lhs.false142, %if.end140
  %79 = load i32, i32* %input_is_tty, align 4
  %cmp147 = icmp eq i32 %79, 0
  br i1 %cmp147, label %if.then149, label %if.end150

if.then149:                                       ; preds = %land.lhs.true146
  store i8* null, i8** %prompt, align 4
  store i8* null, i8** %itext, align 4
  store i32 0, i32* %silent, align 4
  store i32 0, i32* %edit, align 4
  br label %if.end150

if.end150:                                        ; preds = %if.then149, %land.lhs.true146, %lor.lhs.false144
  %80 = load i32, i32* %edit, align 4
  %tobool151 = icmp ne i32 %80, 0
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %if.end150
  %81 = load i8*, i8** %rlbuf, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %81)
  br label %if.end153

if.end153:                                        ; preds = %if.then152, %if.end150
  store i32 0, i32* %pass_next, align 4
  store i32 0, i32* %saw_escape, align 4
  %82 = load i32, i32* %tmsec, align 4
  %cmp154 = icmp ugt i32 %82, 0
  br i1 %cmp154, label %if.then159, label %lor.lhs.false156

lor.lhs.false156:                                 ; preds = %if.end153
  %83 = load i32, i32* %tmusec, align 4
  %cmp157 = icmp ugt i32 %83, 0
  br i1 %cmp157, label %if.then159, label %if.end168

if.then159:                                       ; preds = %lor.lhs.false156, %if.end153
  %84 = load i32, i32* %fd, align 4
  %call160 = call i32 @fstat(i32 %84, %struct.stat* %tsb)
  %cmp161 = icmp slt i32 %call160, 0
  br i1 %cmp161, label %if.then166, label %lor.lhs.false163

lor.lhs.false163:                                 ; preds = %if.then159
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %tsb, i32 0, i32 6
  %85 = load i32, i32* %st_mode, align 8
  %and = and i32 %85, 61440
  %cmp164 = icmp eq i32 %and, 32768
  br i1 %cmp164, label %if.then166, label %if.end167

if.then166:                                       ; preds = %lor.lhs.false163, %if.then159
  store i32 0, i32* %tmusec, align 4
  store i32 0, i32* %tmsec, align 4
  br label %if.end167

if.end167:                                        ; preds = %if.then166, %lor.lhs.false163
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %lor.lhs.false156
  %86 = load i32, i32* %tmsec, align 4
  %cmp169 = icmp ugt i32 %86, 0
  br i1 %cmp169, label %if.then174, label %lor.lhs.false171

lor.lhs.false171:                                 ; preds = %if.end168
  %87 = load i32, i32* %tmusec, align 4
  %cmp172 = icmp ugt i32 %87, 0
  br i1 %cmp172, label %if.then174, label %if.end199

if.then174:                                       ; preds = %lor.lhs.false171, %if.end168
  %call175 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0)) #5
  store i32 %call175, i32* %code, align 4
  %88 = load i32, i32* %code, align 4
  %tobool176 = icmp ne i32 %88, 0
  br i1 %tobool176, label %if.then177, label %if.end189

if.then177:                                       ; preds = %if.then174
  store i32 0, i32* @sigalrm_seen, align 4
  store i8* null, i8** %orig_input_string, align 4
  %89 = load i8*, i8** %input_string, align 4
  %90 = load volatile i32, i32* %i, align 4
  %arrayidx178 = getelementptr inbounds i8, i8* %89, i32 %90
  store i8 0, i8* %arrayidx178, align 1
  %91 = load volatile i32, i32* %i, align 4
  %cmp179 = icmp eq i32 %91, 0
  br i1 %cmp179, label %if.then181, label %if.else184

if.then181:                                       ; preds = %if.then177
  %call182 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 436)
  store i8* %call182, i8** %t, align 4
  %92 = load i8*, i8** %t, align 4
  %arrayidx183 = getelementptr inbounds i8, i8* %92, i32 0
  store i8 0, i8* %arrayidx183, align 1
  br label %if.end188

if.else184:                                       ; preds = %if.then177
  %93 = load i8*, i8** %input_string, align 4
  %call185 = call i32 @strlen(i8* %93)
  %add = add i32 1, %call185
  %call186 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 440)
  %94 = load i8*, i8** %input_string, align 4
  %call187 = call i8* @strcpy(i8* %call186, i8* %94)
  store i8* %call187, i8** %t, align 4
  br label %if.end188

if.end188:                                        ; preds = %if.else184, %if.then181
  call void @run_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0))
  %95 = load i8*, i8** %t, align 4
  store i8* %95, i8** %input_string, align 4
  store i32 142, i32* %retval1, align 4
  br label %assign_vars

if.end189:                                        ; preds = %if.then174
  %96 = load i32, i32* @interactive_shell, align 4
  %cmp190 = icmp eq i32 %96, 0
  br i1 %cmp190, label %if.then192, label %if.end193

if.then192:                                       ; preds = %if.end189
  call void @initialize_terminating_signals()
  br label %if.end193

if.end193:                                        ; preds = %if.then192, %if.end189
  %call194 = call void (i32)* @signal(i32 14, void (i32)* @sigalrm)
  store void (i32)* %call194, void (i32)** @old_alrm, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @reset_alarm, i8* null)
  %97 = load i32, i32* %edit, align 4
  %tobool195 = icmp ne i32 %97, 0
  br i1 %tobool195, label %if.then196, label %if.end197

if.then196:                                       ; preds = %if.end193
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @reset_attempted_completion_function, i8* null)
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @bashline_reset_event_hook, i8* null)
  br label %if.end197

if.end197:                                        ; preds = %if.then196, %if.end193
  %98 = load i32, i32* %tmsec, align 4
  %99 = load i32, i32* %tmusec, align 4
  %call198 = call i32 @falarm(i32 %98, i32 %99)
  br label %if.end199

if.end199:                                        ; preds = %if.end197, %lor.lhs.false171
  %100 = load i32, i32* %nchars, align 4
  %cmp200 = icmp sgt i32 %100, 0
  br i1 %cmp200, label %if.then206, label %lor.lhs.false202

lor.lhs.false202:                                 ; preds = %if.end199
  %101 = load i8, i8* @delim, align 1
  %conv203 = zext i8 %101 to i32
  %cmp204 = icmp ne i32 %conv203, 10
  br i1 %cmp204, label %if.then206, label %if.else237

if.then206:                                       ; preds = %lor.lhs.false202, %if.end199
  %102 = load i32, i32* %edit, align 4
  %tobool207 = icmp ne i32 %102, 0
  br i1 %tobool207, label %if.then208, label %if.else219

if.then208:                                       ; preds = %if.then206
  %103 = load i32, i32* %nchars, align 4
  %cmp209 = icmp sgt i32 %103, 0
  br i1 %cmp209, label %if.then211, label %if.end212

if.then211:                                       ; preds = %if.then208
  call void @unwind_protect_mem(i8* bitcast (i32* @rl_num_chars_to_read to i8*), i32 4)
  %104 = load i32, i32* %nchars, align 4
  store i32 %104, i32* @rl_num_chars_to_read, align 4
  br label %if.end212

if.end212:                                        ; preds = %if.then211, %if.then208
  %105 = load i8, i8* @delim, align 1
  %conv213 = zext i8 %105 to i32
  %cmp214 = icmp ne i32 %conv213, 10
  br i1 %cmp214, label %if.then216, label %if.end218

if.then216:                                       ; preds = %if.end212
  %106 = load i8, i8* @delim, align 1
  %conv217 = zext i8 %106 to i32
  call void @set_eol_delim(i32 %conv217)
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @reset_eol_delim, i8* null)
  br label %if.end218

if.end218:                                        ; preds = %if.then216, %if.end212
  br label %if.end236

if.else219:                                       ; preds = %if.then206
  %107 = load i32, i32* %input_is_tty, align 4
  %tobool220 = icmp ne i32 %107, 0
  br i1 %tobool220, label %if.then221, label %if.end235

if.then221:                                       ; preds = %if.else219
  %108 = load i32, i32* %fd, align 4
  store i32 %108, i32* getelementptr inbounds (%struct.ttsave, %struct.ttsave* @termsave, i32 0, i32 0), align 4
  %109 = load i32, i32* %fd, align 4
  %call222 = call i32 @ttgetattr(i32 %109, %struct.termios* %ttattrs)
  store %struct.termios* %ttattrs, %struct.termios** getelementptr inbounds (%struct.ttsave, %struct.ttsave* @termsave, i32 0, i32 1), align 4
  %110 = bitcast %struct.termios* %ttset to i8*
  %111 = bitcast %struct.termios* %ttattrs to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %110, i8* %111, i32 60, i32 4, i1 false)
  %112 = load i32, i32* %silent, align 4
  %tobool223 = icmp ne i32 %112, 0
  br i1 %tobool223, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then221
  %113 = load i32, i32* %fd, align 4
  %call224 = call i32 @ttfd_cbreak(i32 %113, %struct.termios* %ttset)
  br label %cond.end

cond.false:                                       ; preds = %if.then221
  %114 = load i32, i32* %fd, align 4
  %call225 = call i32 @ttfd_onechar(i32 %114, %struct.termios* %ttset)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond226 = phi i32 [ %call224, %cond.true ], [ %call225, %cond.false ]
  store volatile i32 %cond226, i32* %i, align 4
  %115 = load volatile i32, i32* %i, align 4
  %cmp227 = icmp slt i32 %115, 0
  br i1 %cmp227, label %if.then229, label %if.end230

if.then229:                                       ; preds = %cond.end
  call void @sh_ttyerror(i32 1)
  br label %if.end230

if.end230:                                        ; preds = %if.then229, %cond.end
  store i32 1, i32* @tty_modified, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, i8*)*)(i32 (...)* bitcast (void (%struct.ttsave*)* @ttyrestore to i32 (...)*), i8* bitcast (%struct.ttsave* @termsave to i8*))
  %116 = load i32, i32* @interactive_shell, align 4
  %cmp231 = icmp eq i32 %116, 0
  br i1 %cmp231, label %if.then233, label %if.end234

if.then233:                                       ; preds = %if.end230
  call void @initialize_terminating_signals()
  br label %if.end234

if.end234:                                        ; preds = %if.then233, %if.end230
  br label %if.end235

if.end235:                                        ; preds = %if.end234, %if.else219
  br label %if.end236

if.end236:                                        ; preds = %if.end235, %if.end218
  br label %if.end251

if.else237:                                       ; preds = %lor.lhs.false202
  %117 = load i32, i32* %silent, align 4
  %tobool238 = icmp ne i32 %117, 0
  br i1 %tobool238, label %if.then239, label %if.end250

if.then239:                                       ; preds = %if.else237
  %118 = load i32, i32* %fd, align 4
  store i32 %118, i32* getelementptr inbounds (%struct.ttsave, %struct.ttsave* @termsave, i32 0, i32 0), align 4
  %119 = load i32, i32* %fd, align 4
  %call240 = call i32 @ttgetattr(i32 %119, %struct.termios* %ttattrs)
  store %struct.termios* %ttattrs, %struct.termios** getelementptr inbounds (%struct.ttsave, %struct.ttsave* @termsave, i32 0, i32 1), align 4
  %120 = bitcast %struct.termios* %ttset to i8*
  %121 = bitcast %struct.termios* %ttattrs to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %120, i8* %121, i32 60, i32 4, i1 false)
  %122 = load i32, i32* %fd, align 4
  %call241 = call i32 @ttfd_noecho(i32 %122, %struct.termios* %ttset)
  store volatile i32 %call241, i32* %i, align 4
  %123 = load volatile i32, i32* %i, align 4
  %cmp242 = icmp slt i32 %123, 0
  br i1 %cmp242, label %if.then244, label %if.end245

if.then244:                                       ; preds = %if.then239
  call void @sh_ttyerror(i32 1)
  br label %if.end245

if.end245:                                        ; preds = %if.then244, %if.then239
  store i32 1, i32* @tty_modified, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i32 (...)*, i8*)*)(i32 (...)* bitcast (void (%struct.ttsave*)* @ttyrestore to i32 (...)*), i8* bitcast (%struct.ttsave* @termsave to i8*))
  %124 = load i32, i32* @interactive_shell, align 4
  %cmp246 = icmp eq i32 %124, 0
  br i1 %cmp246, label %if.then248, label %if.end249

if.then248:                                       ; preds = %if.end245
  call void @initialize_terminating_signals()
  br label %if.end249

if.end249:                                        ; preds = %if.then248, %if.end245
  br label %if.end250

if.end250:                                        ; preds = %if.end249, %if.else237
  br label %if.end251

if.end251:                                        ; preds = %if.end250, %if.end236
  %125 = load i8*, i8** %input_string, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %125)
  br label %do.body

do.body:                                          ; preds = %if.end251
  %126 = load i32, i32* @sigalrm_seen, align 4
  %tobool252 = icmp ne i32 %126, 0
  br i1 %tobool252, label %if.then253, label %if.end254

if.then253:                                       ; preds = %do.body
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end254:                                        ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end254
  %127 = load i32, i32* %nchars, align 4
  %cmp255 = icmp sgt i32 %127, 0
  br i1 %cmp255, label %land.lhs.true257, label %if.else263

land.lhs.true257:                                 ; preds = %do.end
  %128 = load i32, i32* %input_is_tty, align 4
  %cmp258 = icmp eq i32 %128, 0
  br i1 %cmp258, label %land.lhs.true260, label %if.else263

land.lhs.true260:                                 ; preds = %land.lhs.true257
  %129 = load i32, i32* %ignore_delim, align 4
  %tobool261 = icmp ne i32 %129, 0
  br i1 %tobool261, label %if.then262, label %if.else263

if.then262:                                       ; preds = %land.lhs.true260
  store i32 2, i32* %unbuffered_read, align 4
  br label %if.end274

if.else263:                                       ; preds = %land.lhs.true260, %land.lhs.true257, %do.end
  %130 = load i32, i32* %nchars, align 4
  %cmp264 = icmp sgt i32 %130, 0
  br i1 %cmp264, label %if.then272, label %lor.lhs.false266

lor.lhs.false266:                                 ; preds = %if.else263
  %131 = load i8, i8* @delim, align 1
  %conv267 = zext i8 %131 to i32
  %cmp268 = icmp ne i32 %conv267, 10
  br i1 %cmp268, label %if.then272, label %lor.lhs.false270

lor.lhs.false270:                                 ; preds = %lor.lhs.false266
  %132 = load i32, i32* %input_is_pipe, align 4
  %tobool271 = icmp ne i32 %132, 0
  br i1 %tobool271, label %if.then272, label %if.end273

if.then272:                                       ; preds = %lor.lhs.false270, %lor.lhs.false266, %if.else263
  store i32 1, i32* %unbuffered_read, align 4
  br label %if.end273

if.end273:                                        ; preds = %if.then272, %lor.lhs.false270
  br label %if.end274

if.end274:                                        ; preds = %if.end273, %if.then262
  %133 = load i8*, i8** %prompt, align 4
  %tobool275 = icmp ne i8* %133, null
  br i1 %tobool275, label %land.lhs.true276, label %if.end282

land.lhs.true276:                                 ; preds = %if.end274
  %134 = load i32, i32* %edit, align 4
  %cmp277 = icmp eq i32 %134, 0
  br i1 %cmp277, label %if.then279, label %if.end282

if.then279:                                       ; preds = %land.lhs.true276
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %136 = load i8*, i8** %prompt, align 4
  %call280 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %135, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* %136)
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call281 = call i32 @fflush(%struct._IO_FILE* %137)
  br label %if.end282

if.end282:                                        ; preds = %if.then279, %land.lhs.true276, %if.end274
  store i8* null, i8** %ps2, align 4
  store i32 0, i32* %retval1, align 4
  store i32 0, i32* %eof, align 4
  store i32 0, i32* %print_ps2, align 4
  br label %for.cond283

for.cond283:                                      ; preds = %if.end524, %if.then474, %if.end456, %if.end440, %if.end282
  br label %do.body284

do.body284:                                       ; preds = %for.cond283
  %138 = load i32, i32* @sigalrm_seen, align 4
  %tobool285 = icmp ne i32 %138, 0
  br i1 %tobool285, label %if.then286, label %if.end287

if.then286:                                       ; preds = %do.body284
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end287:                                        ; preds = %do.body284
  br label %do.end288

do.end288:                                        ; preds = %if.end287
  %139 = load i32, i32* %edit, align 4
  %tobool289 = icmp ne i32 %139, 0
  br i1 %tobool289, label %if.then290, label %if.else314

if.then290:                                       ; preds = %do.end288
  %140 = load i8*, i8** %rlbuf, align 4
  %tobool291 = icmp ne i8* %140, null
  br i1 %tobool291, label %land.lhs.true292, label %if.end298

land.lhs.true292:                                 ; preds = %if.then290
  %141 = load i8*, i8** %rlbuf, align 4
  %142 = load i32, i32* %rlind, align 4
  %arrayidx293 = getelementptr inbounds i8, i8* %141, i32 %142
  %143 = load i8, i8* %arrayidx293, align 1
  %conv294 = sext i8 %143 to i32
  %cmp295 = icmp eq i32 %conv294, 0
  br i1 %cmp295, label %if.then297, label %if.end298

if.then297:                                       ; preds = %land.lhs.true292
  %144 = load i8*, i8** %rlbuf, align 4
  call void @sh_xfree(i8* %144, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 547)
  store i8* null, i8** %rlbuf, align 4
  br label %if.end298

if.end298:                                        ; preds = %if.then297, %land.lhs.true292, %if.then290
  %145 = load i8*, i8** %rlbuf, align 4
  %cmp299 = icmp eq i8* %145, null
  br i1 %cmp299, label %if.then301, label %if.end308

if.then301:                                       ; preds = %if.end298
  store i32 1, i32* @reading, align 4
  %146 = load i8*, i8** %prompt, align 4
  %tobool302 = icmp ne i8* %146, null
  br i1 %tobool302, label %cond.true303, label %cond.false304

cond.true303:                                     ; preds = %if.then301
  %147 = load i8*, i8** %prompt, align 4
  br label %cond.end305

cond.false304:                                    ; preds = %if.then301
  br label %cond.end305

cond.end305:                                      ; preds = %cond.false304, %cond.true303
  %cond306 = phi i8* [ %147, %cond.true303 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), %cond.false304 ]
  %148 = load i8*, i8** %itext, align 4
  %call307 = call i8* @edit_line(i8* %cond306, i8* %148)
  store i8* %call307, i8** %rlbuf, align 4
  store i32 0, i32* @reading, align 4
  store i32 0, i32* %rlind, align 4
  br label %if.end308

if.end308:                                        ; preds = %cond.end305, %if.end298
  %149 = load i8*, i8** %rlbuf, align 4
  %cmp309 = icmp eq i8* %149, null
  br i1 %cmp309, label %if.then311, label %if.end312

if.then311:                                       ; preds = %if.end308
  store i32 1, i32* %eof, align 4
  br label %for.end525

if.end312:                                        ; preds = %if.end308
  %150 = load i8*, i8** %rlbuf, align 4
  %151 = load i32, i32* %rlind, align 4
  %inc = add nsw i32 %151, 1
  store i32 %inc, i32* %rlind, align 4
  %arrayidx313 = getelementptr inbounds i8, i8* %150, i32 %151
  %152 = load i8, i8* %arrayidx313, align 1
  store i8 %152, i8* %c, align 1
  br label %if.end407

if.else314:                                       ; preds = %do.end288
  %153 = load i32, i32* %print_ps2, align 4
  %tobool315 = icmp ne i32 %153, 0
  br i1 %tobool315, label %if.then316, label %if.end329

if.then316:                                       ; preds = %if.else314
  %154 = load i8*, i8** %ps2, align 4
  %cmp317 = icmp eq i8* %154, null
  br i1 %cmp317, label %if.then319, label %if.end321

if.then319:                                       ; preds = %if.then316
  %call320 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0))
  store i8* %call320, i8** %ps2, align 4
  br label %if.end321

if.end321:                                        ; preds = %if.then319, %if.then316
  %155 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %156 = load i8*, i8** %ps2, align 4
  %tobool322 = icmp ne i8* %156, null
  br i1 %tobool322, label %cond.true323, label %cond.false324

cond.true323:                                     ; preds = %if.end321
  %157 = load i8*, i8** %ps2, align 4
  br label %cond.end325

cond.false324:                                    ; preds = %if.end321
  br label %cond.end325

cond.end325:                                      ; preds = %cond.false324, %cond.true323
  %cond326 = phi i8* [ %157, %cond.true323 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), %cond.false324 ]
  %call327 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %155, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* %cond326)
  %158 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call328 = call i32 @fflush(%struct._IO_FILE* %158)
  store i32 0, i32* %print_ps2, align 4
  br label %if.end329

if.end329:                                        ; preds = %cond.end325, %if.else314
  store i32 1, i32* @reading, align 4
  %159 = load i32, i32* %unbuffered_read, align 4
  %cmp330 = icmp eq i32 %159, 2
  br i1 %cmp330, label %if.then332, label %if.else340

if.then332:                                       ; preds = %if.end329
  %160 = load i32, i32* @posixly_correct, align 4
  %tobool333 = icmp ne i32 %160, 0
  br i1 %tobool333, label %cond.true334, label %cond.false336

cond.true334:                                     ; preds = %if.then332
  %161 = load i32, i32* %fd, align 4
  %call335 = call i32 @zreadintr(i32 %161, i8* %c, i32 1)
  br label %cond.end338

cond.false336:                                    ; preds = %if.then332
  %162 = load i32, i32* %fd, align 4
  %163 = load i32, i32* %nchars, align 4
  %164 = load i32, i32* %nr, align 4
  %sub = sub nsw i32 %163, %164
  %call337 = call i32 @zreadn(i32 %162, i8* %c, i32 %sub)
  br label %cond.end338

cond.end338:                                      ; preds = %cond.false336, %cond.true334
  %cond339 = phi i32 [ %call335, %cond.true334 ], [ %call337, %cond.false336 ]
  store i32 %cond339, i32* %retval1, align 4
  br label %if.end359

if.else340:                                       ; preds = %if.end329
  %165 = load i32, i32* %unbuffered_read, align 4
  %tobool341 = icmp ne i32 %165, 0
  br i1 %tobool341, label %if.then342, label %if.else350

if.then342:                                       ; preds = %if.else340
  %166 = load i32, i32* @posixly_correct, align 4
  %tobool343 = icmp ne i32 %166, 0
  br i1 %tobool343, label %cond.true344, label %cond.false346

cond.true344:                                     ; preds = %if.then342
  %167 = load i32, i32* %fd, align 4
  %call345 = call i32 @zreadintr(i32 %167, i8* %c, i32 1)
  br label %cond.end348

cond.false346:                                    ; preds = %if.then342
  %168 = load i32, i32* %fd, align 4
  %call347 = call i32 @zread(i32 %168, i8* %c, i32 1)
  br label %cond.end348

cond.end348:                                      ; preds = %cond.false346, %cond.true344
  %cond349 = phi i32 [ %call345, %cond.true344 ], [ %call347, %cond.false346 ]
  store i32 %cond349, i32* %retval1, align 4
  br label %if.end358

if.else350:                                       ; preds = %if.else340
  %169 = load i32, i32* @posixly_correct, align 4
  %tobool351 = icmp ne i32 %169, 0
  br i1 %tobool351, label %cond.true352, label %cond.false354

cond.true352:                                     ; preds = %if.else350
  %170 = load i32, i32* %fd, align 4
  %call353 = call i32 @zreadcintr(i32 %170, i8* %c)
  br label %cond.end356

cond.false354:                                    ; preds = %if.else350
  %171 = load i32, i32* %fd, align 4
  %call355 = call i32 @zreadc(i32 %171, i8* %c)
  br label %cond.end356

cond.end356:                                      ; preds = %cond.false354, %cond.true352
  %cond357 = phi i32 [ %call353, %cond.true352 ], [ %call355, %cond.false354 ]
  store i32 %cond357, i32* %retval1, align 4
  br label %if.end358

if.end358:                                        ; preds = %cond.end356, %cond.end348
  br label %if.end359

if.end359:                                        ; preds = %if.end358, %cond.end338
  store i32 0, i32* @reading, align 4
  %172 = load i32, i32* %retval1, align 4
  %cmp360 = icmp sle i32 %172, 0
  br i1 %cmp360, label %if.then362, label %if.end393

if.then362:                                       ; preds = %if.end359
  %173 = load i32, i32* %retval1, align 4
  %cmp363 = icmp slt i32 %173, 0
  br i1 %cmp363, label %land.lhs.true365, label %if.else381

land.lhs.true365:                                 ; preds = %if.then362
  %call366 = call i32* @__errno_location()
  %174 = load i32, i32* %call366, align 4
  %cmp367 = icmp eq i32 %174, 4
  br i1 %cmp367, label %if.then369, label %if.else381

if.then369:                                       ; preds = %land.lhs.true365
  %175 = load volatile i32, i32* @terminating_signal, align 4
  %tobool370 = icmp ne i32 %175, 0
  br i1 %tobool370, label %cond.true371, label %cond.false372

cond.true371:                                     ; preds = %if.then369
  %176 = load volatile i32, i32* @terminating_signal, align 4
  br label %cond.end375

cond.false372:                                    ; preds = %if.then369
  %177 = load volatile i32, i32* @interrupt_state, align 4
  %tobool373 = icmp ne i32 %177, 0
  %cond374 = select i1 %tobool373, i32 2, i32 0
  br label %cond.end375

cond.end375:                                      ; preds = %cond.false372, %cond.true371
  %cond376 = phi i32 [ %176, %cond.true371 ], [ %cond374, %cond.false372 ]
  store i32 %cond376, i32* %lastsig, align 4
  %178 = load i32, i32* %lastsig, align 4
  %cmp377 = icmp eq i32 %178, 0
  br i1 %cmp377, label %if.then379, label %if.end380

if.then379:                                       ; preds = %cond.end375
  %179 = load i32, i32* @trapped_signal_received, align 4
  store i32 %179, i32* %lastsig, align 4
  br label %if.end380

if.end380:                                        ; preds = %if.then379, %cond.end375
  call void @run_pending_traps()
  br label %if.end382

if.else381:                                       ; preds = %land.lhs.true365, %if.then362
  store i32 0, i32* %lastsig, align 4
  br label %if.end382

if.end382:                                        ; preds = %if.else381, %if.end380
  %180 = load volatile i32, i32* @terminating_signal, align 4
  %tobool383 = icmp ne i32 %180, 0
  br i1 %tobool383, label %land.lhs.true384, label %if.end387

land.lhs.true384:                                 ; preds = %if.end382
  %181 = load i32, i32* @tty_modified, align 4
  %tobool385 = icmp ne i32 %181, 0
  br i1 %tobool385, label %if.then386, label %if.end387

if.then386:                                       ; preds = %land.lhs.true384
  call void @ttyrestore(%struct.ttsave* @termsave)
  br label %if.end387

if.end387:                                        ; preds = %if.then386, %land.lhs.true384, %if.end382
  br label %do.body388

do.body388:                                       ; preds = %if.end387
  %182 = load volatile i32, i32* @terminating_signal, align 4
  %tobool389 = icmp ne i32 %182, 0
  br i1 %tobool389, label %if.then390, label %if.end391

if.then390:                                       ; preds = %do.body388
  %183 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %183)
  br label %if.end391

if.end391:                                        ; preds = %if.then390, %do.body388
  br label %do.end392

do.end392:                                        ; preds = %if.end391
  store i32 1, i32* %eof, align 4
  br label %for.end525

if.end393:                                        ; preds = %if.end359
  br label %do.body394

do.body394:                                       ; preds = %if.end393
  %184 = load i32, i32* @sigalrm_seen, align 4
  %tobool395 = icmp ne i32 %184, 0
  br i1 %tobool395, label %if.then396, label %if.end397

if.then396:                                       ; preds = %do.body394
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end397:                                        ; preds = %do.body394
  br label %do.end398

do.end398:                                        ; preds = %if.end397
  br label %do.body399

do.body399:                                       ; preds = %do.end398
  %185 = load volatile i32, i32* @terminating_signal, align 4
  %tobool400 = icmp ne i32 %185, 0
  br i1 %tobool400, label %if.then401, label %if.end402

if.then401:                                       ; preds = %do.body399
  %186 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %186)
  br label %if.end402

if.end402:                                        ; preds = %if.then401, %do.body399
  %187 = load volatile i32, i32* @interrupt_state, align 4
  %tobool403 = icmp ne i32 %187, 0
  br i1 %tobool403, label %if.then404, label %if.end405

if.then404:                                       ; preds = %if.end402
  call void @throw_to_top_level()
  br label %if.end405

if.end405:                                        ; preds = %if.then404, %if.end402
  br label %do.end406

do.end406:                                        ; preds = %if.end405
  br label %if.end407

if.end407:                                        ; preds = %do.end406, %if.end312
  br label %do.body408

do.body408:                                       ; preds = %if.end407
  %188 = load i32, i32* @sigalrm_seen, align 4
  %tobool409 = icmp ne i32 %188, 0
  br i1 %tobool409, label %if.then410, label %if.end411

if.then410:                                       ; preds = %do.body408
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end411:                                        ; preds = %do.body408
  br label %do.end412

do.end412:                                        ; preds = %if.end411
  %189 = load volatile i32, i32* %i, align 4
  %add413 = add nsw i32 %189, 4
  %190 = load i32, i32* %size, align 4
  %cmp414 = icmp sge i32 %add413, %190
  br i1 %cmp414, label %if.then416, label %if.end424

if.then416:                                       ; preds = %do.end412
  %191 = load i8*, i8** %input_string, align 4
  %192 = load i32, i32* %size, align 4
  %add418 = add nsw i32 %192, 128
  store i32 %add418, i32* %size, align 4
  %call419 = call i8* @sh_xrealloc(i8* %191, i32 %add418, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 622)
  store i8* %call419, i8** %t417, align 4
  %193 = load i8*, i8** %t417, align 4
  %194 = load i8*, i8** %input_string, align 4
  %cmp420 = icmp ne i8* %193, %194
  br i1 %cmp420, label %if.then422, label %if.end423

if.then422:                                       ; preds = %if.then416
  %195 = load i8*, i8** %t417, align 4
  store i8* %195, i8** %input_string, align 4
  call void @remove_unwind_protect()
  %196 = load i8*, i8** %input_string, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %196)
  br label %if.end423

if.end423:                                        ; preds = %if.then422, %if.then416
  br label %if.end424

if.end424:                                        ; preds = %if.end423, %do.end412
  %197 = load i32, i32* %pass_next, align 4
  %tobool425 = icmp ne i32 %197, 0
  br i1 %tobool425, label %if.then426, label %if.end441

if.then426:                                       ; preds = %if.end424
  store i32 0, i32* %pass_next, align 4
  %198 = load i8, i8* %c, align 1
  %conv427 = sext i8 %198 to i32
  %cmp428 = icmp eq i32 %conv427, 10
  br i1 %cmp428, label %if.then430, label %if.else439

if.then430:                                       ; preds = %if.then426
  %199 = load volatile i32, i32* %i, align 4
  %dec = add nsw i32 %199, -1
  store volatile i32 %dec, i32* %i, align 4
  %200 = load i32, i32* @interactive, align 4
  %tobool431 = icmp ne i32 %200, 0
  br i1 %tobool431, label %land.lhs.true432, label %if.end438

land.lhs.true432:                                 ; preds = %if.then430
  %201 = load i32, i32* %input_is_tty, align 4
  %tobool433 = icmp ne i32 %201, 0
  br i1 %tobool433, label %land.lhs.true434, label %if.end438

land.lhs.true434:                                 ; preds = %land.lhs.true432
  %202 = load i32, i32* %raw, align 4
  %cmp435 = icmp eq i32 %202, 0
  br i1 %cmp435, label %if.then437, label %if.end438

if.then437:                                       ; preds = %land.lhs.true434
  store i32 1, i32* %print_ps2, align 4
  br label %if.end438

if.end438:                                        ; preds = %if.then437, %land.lhs.true434, %land.lhs.true432, %if.then430
  br label %if.end440

if.else439:                                       ; preds = %if.then426
  br label %add_char

if.end440:                                        ; preds = %if.end438
  br label %for.cond283

if.end441:                                        ; preds = %if.end424
  %203 = load i8, i8* %c, align 1
  %conv442 = sext i8 %203 to i32
  %cmp443 = icmp eq i32 %conv442, 92
  br i1 %cmp443, label %land.lhs.true445, label %if.end457

land.lhs.true445:                                 ; preds = %if.end441
  %204 = load i32, i32* %raw, align 4
  %cmp446 = icmp eq i32 %204, 0
  br i1 %cmp446, label %if.then448, label %if.end457

if.then448:                                       ; preds = %land.lhs.true445
  %205 = load i32, i32* %pass_next, align 4
  %inc449 = add nsw i32 %205, 1
  store i32 %inc449, i32* %pass_next, align 4
  %206 = load i32, i32* %skip_ctlesc, align 4
  %cmp450 = icmp eq i32 %206, 0
  br i1 %cmp450, label %if.then452, label %if.end456

if.then452:                                       ; preds = %if.then448
  %207 = load i32, i32* %saw_escape, align 4
  %inc453 = add nsw i32 %207, 1
  store i32 %inc453, i32* %saw_escape, align 4
  %208 = load i8*, i8** %input_string, align 4
  %209 = load volatile i32, i32* %i, align 4
  %inc454 = add nsw i32 %209, 1
  store volatile i32 %inc454, i32* %i, align 4
  %arrayidx455 = getelementptr inbounds i8, i8* %208, i32 %209
  store i8 1, i8* %arrayidx455, align 1
  br label %if.end456

if.end456:                                        ; preds = %if.then452, %if.then448
  br label %for.cond283

if.end457:                                        ; preds = %land.lhs.true445, %if.end441
  %210 = load i32, i32* %ignore_delim, align 4
  %cmp458 = icmp eq i32 %210, 0
  br i1 %cmp458, label %land.lhs.true460, label %if.end466

land.lhs.true460:                                 ; preds = %if.end457
  %211 = load i8, i8* %c, align 1
  %conv461 = zext i8 %211 to i32
  %212 = load i8, i8* @delim, align 1
  %conv462 = zext i8 %212 to i32
  %cmp463 = icmp eq i32 %conv461, %conv462
  br i1 %cmp463, label %if.then465, label %if.end466

if.then465:                                       ; preds = %land.lhs.true460
  br label %for.end525

if.end466:                                        ; preds = %land.lhs.true460, %if.end457
  %213 = load i8, i8* %c, align 1
  %conv467 = sext i8 %213 to i32
  %cmp468 = icmp eq i32 %conv467, 0
  br i1 %cmp468, label %land.lhs.true470, label %if.end475

land.lhs.true470:                                 ; preds = %if.end466
  %214 = load i8, i8* @delim, align 1
  %conv471 = zext i8 %214 to i32
  %cmp472 = icmp ne i32 %conv471, 0
  br i1 %cmp472, label %if.then474, label %if.end475

if.then474:                                       ; preds = %land.lhs.true470
  br label %for.cond283

if.end475:                                        ; preds = %land.lhs.true470, %if.end466
  %215 = load i32, i32* %skip_ctlesc, align 4
  %cmp476 = icmp eq i32 %215, 0
  br i1 %cmp476, label %land.lhs.true478, label %lor.lhs.false482

land.lhs.true478:                                 ; preds = %if.end475
  %216 = load i8, i8* %c, align 1
  %conv479 = sext i8 %216 to i32
  %cmp480 = icmp eq i32 %conv479, 1
  br i1 %cmp480, label %if.then489, label %lor.lhs.false482

lor.lhs.false482:                                 ; preds = %land.lhs.true478, %if.end475
  %217 = load i32, i32* %skip_ctlnul, align 4
  %cmp483 = icmp eq i32 %217, 0
  br i1 %cmp483, label %land.lhs.true485, label %if.end493

land.lhs.true485:                                 ; preds = %lor.lhs.false482
  %218 = load i8, i8* %c, align 1
  %conv486 = sext i8 %218 to i32
  %cmp487 = icmp eq i32 %conv486, 127
  br i1 %cmp487, label %if.then489, label %if.end493

if.then489:                                       ; preds = %land.lhs.true485, %land.lhs.true478
  %219 = load i32, i32* %saw_escape, align 4
  %inc490 = add nsw i32 %219, 1
  store i32 %inc490, i32* %saw_escape, align 4
  %220 = load i8*, i8** %input_string, align 4
  %221 = load volatile i32, i32* %i, align 4
  %inc491 = add nsw i32 %221, 1
  store volatile i32 %inc491, i32* %i, align 4
  %arrayidx492 = getelementptr inbounds i8, i8* %220, i32 %221
  store i8 1, i8* %arrayidx492, align 1
  br label %if.end493

if.end493:                                        ; preds = %if.then489, %land.lhs.true485, %lor.lhs.false482
  br label %add_char

add_char:                                         ; preds = %if.end493, %if.else439
  %222 = load i8, i8* %c, align 1
  %223 = load i8*, i8** %input_string, align 4
  %224 = load volatile i32, i32* %i, align 4
  %inc494 = add nsw i32 %224, 1
  store volatile i32 %inc494, i32* %i, align 4
  %arrayidx495 = getelementptr inbounds i8, i8* %223, i32 %224
  store i8 %222, i8* %arrayidx495, align 1
  br label %do.body496

do.body496:                                       ; preds = %add_char
  %225 = load i32, i32* @sigalrm_seen, align 4
  %tobool497 = icmp ne i32 %225, 0
  br i1 %tobool497, label %if.then498, label %if.end499

if.then498:                                       ; preds = %do.body496
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end499:                                        ; preds = %do.body496
  br label %do.end500

do.end500:                                        ; preds = %if.end499
  %226 = load i32, i32* %nchars, align 4
  %cmp501 = icmp sgt i32 %226, 0
  br i1 %cmp501, label %land.lhs.true503, label %if.end516

land.lhs.true503:                                 ; preds = %do.end500
  %call504 = call i32 @__ctype_get_mb_cur_max()
  %cmp505 = icmp ugt i32 %call504, 1
  br i1 %cmp505, label %land.lhs.true507, label %if.end516

land.lhs.true507:                                 ; preds = %land.lhs.true503
  %227 = load i8, i8* %c, align 1
  %call508 = call i32 @is_basic(i8 signext %227)
  %cmp509 = icmp eq i32 %call508, 0
  br i1 %cmp509, label %if.then511, label %if.end516

if.then511:                                       ; preds = %land.lhs.true507
  %228 = load i8*, i8** %input_string, align 4
  %229 = load volatile i32, i32* %i, align 4
  %arrayidx512 = getelementptr inbounds i8, i8* %228, i32 %229
  store i8 0, i8* %arrayidx512, align 1
  %230 = load i32, i32* %fd, align 4
  %231 = load i8*, i8** %input_string, align 4
  %232 = load volatile i32, i32* %i, align 4
  %233 = load i8, i8* %c, align 1
  %conv513 = sext i8 %233 to i32
  %234 = load i32, i32* %unbuffered_read, align 4
  %call514 = call i32 @read_mbchar(i32 %230, i8* %231, i32 %232, i32 %conv513, i32 %234)
  %235 = load volatile i32, i32* %i, align 4
  %add515 = add nsw i32 %235, %call514
  store volatile i32 %add515, i32* %i, align 4
  br label %if.end516

if.end516:                                        ; preds = %if.then511, %land.lhs.true507, %land.lhs.true503, %do.end500
  %236 = load i32, i32* %nr, align 4
  %inc517 = add nsw i32 %236, 1
  store i32 %inc517, i32* %nr, align 4
  %237 = load i32, i32* %nchars, align 4
  %cmp518 = icmp sgt i32 %237, 0
  br i1 %cmp518, label %land.lhs.true520, label %if.end524

land.lhs.true520:                                 ; preds = %if.end516
  %238 = load i32, i32* %nr, align 4
  %239 = load i32, i32* %nchars, align 4
  %cmp521 = icmp sge i32 %238, %239
  br i1 %cmp521, label %if.then523, label %if.end524

if.then523:                                       ; preds = %land.lhs.true520
  br label %for.end525

if.end524:                                        ; preds = %land.lhs.true520, %if.end516
  br label %for.cond283

for.end525:                                       ; preds = %if.then523, %if.then465, %do.end392, %if.then311
  %240 = load i8*, i8** %input_string, align 4
  %241 = load volatile i32, i32* %i, align 4
  %arrayidx526 = getelementptr inbounds i8, i8* %240, i32 %241
  store i8 0, i8* %arrayidx526, align 1
  br label %do.body527

do.body527:                                       ; preds = %for.end525
  %242 = load i32, i32* @sigalrm_seen, align 4
  %tobool528 = icmp ne i32 %242, 0
  br i1 %tobool528, label %if.then529, label %if.end530

if.then529:                                       ; preds = %do.body527
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @alrmbuf, i32 0, i32 0), i32 1) #6
  unreachable

if.end530:                                        ; preds = %do.body527
  br label %do.end531

do.end531:                                        ; preds = %if.end530
  %243 = load i32, i32* %edit, align 4
  %tobool532 = icmp ne i32 %243, 0
  br i1 %tobool532, label %if.then533, label %if.end534

if.then533:                                       ; preds = %do.end531
  %244 = load i8*, i8** %rlbuf, align 4
  call void @sh_xfree(i8* %244, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 695)
  br label %if.end534

if.end534:                                        ; preds = %if.then533, %do.end531
  %245 = load i32, i32* %retval1, align 4
  %cmp535 = icmp slt i32 %245, 0
  br i1 %cmp535, label %if.then537, label %if.end554

if.then537:                                       ; preds = %if.end534
  %call538 = call i32* @__errno_location()
  %246 = load i32, i32* %call538, align 4
  store i32 %246, i32* %t_errno, align 4
  %call539 = call i32* @__errno_location()
  %247 = load i32, i32* %call539, align 4
  %cmp540 = icmp ne i32 %247, 4
  br i1 %cmp540, label %if.then542, label %if.end546

if.then542:                                       ; preds = %if.then537
  %call543 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.10, i32 0, i32 0))
  %248 = load i32, i32* %fd, align 4
  %call544 = call i32* @__errno_location()
  %249 = load i32, i32* %call544, align 4
  %call545 = call i8* @strerror(i32 %249)
  call void (i8*, ...) @builtin_error(i8* %call543, i32 %248, i8* %call545)
  br label %if.end546

if.end546:                                        ; preds = %if.then542, %if.then537
  call void @run_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0))
  %250 = load i32, i32* %t_errno, align 4
  %cmp547 = icmp ne i32 %250, 4
  br i1 %cmp547, label %cond.true549, label %cond.false550

cond.true549:                                     ; preds = %if.end546
  br label %cond.end552

cond.false550:                                    ; preds = %if.end546
  %251 = load i32, i32* %lastsig, align 4
  %add551 = add nsw i32 128, %251
  br label %cond.end552

cond.end552:                                      ; preds = %cond.false550, %cond.true549
  %cond553 = phi i32 [ 1, %cond.true549 ], [ %add551, %cond.false550 ]
  store i32 %cond553, i32* %retval, align 4
  br label %return

if.end554:                                        ; preds = %if.end534
  %252 = load i32, i32* %tmsec, align 4
  %cmp555 = icmp ugt i32 %252, 0
  br i1 %cmp555, label %if.then560, label %lor.lhs.false557

lor.lhs.false557:                                 ; preds = %if.end554
  %253 = load i32, i32* %tmusec, align 4
  %cmp558 = icmp ugt i32 %253, 0
  br i1 %cmp558, label %if.then560, label %if.end561

if.then560:                                       ; preds = %lor.lhs.false557, %if.end554
  call void @reset_alarm()
  br label %if.end561

if.end561:                                        ; preds = %if.then560, %lor.lhs.false557
  %254 = load i32, i32* %nchars, align 4
  %cmp562 = icmp sgt i32 %254, 0
  br i1 %cmp562, label %if.then568, label %lor.lhs.false564

lor.lhs.false564:                                 ; preds = %if.end561
  %255 = load i8, i8* @delim, align 1
  %conv565 = zext i8 %255 to i32
  %cmp566 = icmp ne i32 %conv565, 10
  br i1 %cmp566, label %if.then568, label %if.else585

if.then568:                                       ; preds = %lor.lhs.false564, %if.end561
  %256 = load i32, i32* %edit, align 4
  %tobool569 = icmp ne i32 %256, 0
  br i1 %tobool569, label %if.then570, label %if.else580

if.then570:                                       ; preds = %if.then568
  %257 = load i32, i32* %nchars, align 4
  %cmp571 = icmp sgt i32 %257, 0
  br i1 %cmp571, label %if.then573, label %if.end574

if.then573:                                       ; preds = %if.then570
  store i32 0, i32* @rl_num_chars_to_read, align 4
  br label %if.end574

if.end574:                                        ; preds = %if.then573, %if.then570
  %258 = load i8, i8* @delim, align 1
  %conv575 = zext i8 %258 to i32
  %cmp576 = icmp ne i32 %conv575, 10
  br i1 %cmp576, label %if.then578, label %if.end579

if.then578:                                       ; preds = %if.end574
  call void @reset_eol_delim(i8* null)
  br label %if.end579

if.end579:                                        ; preds = %if.then578, %if.end574
  br label %if.end584

if.else580:                                       ; preds = %if.then568
  %259 = load i32, i32* %input_is_tty, align 4
  %tobool581 = icmp ne i32 %259, 0
  br i1 %tobool581, label %if.then582, label %if.end583

if.then582:                                       ; preds = %if.else580
  call void @ttyrestore(%struct.ttsave* @termsave)
  br label %if.end583

if.end583:                                        ; preds = %if.then582, %if.else580
  br label %if.end584

if.end584:                                        ; preds = %if.end583, %if.end579
  br label %if.end589

if.else585:                                       ; preds = %lor.lhs.false564
  %260 = load i32, i32* %silent, align 4
  %tobool586 = icmp ne i32 %260, 0
  br i1 %tobool586, label %if.then587, label %if.end588

if.then587:                                       ; preds = %if.else585
  call void @ttyrestore(%struct.ttsave* @termsave)
  br label %if.end588

if.end588:                                        ; preds = %if.then587, %if.else585
  br label %if.end589

if.end589:                                        ; preds = %if.end588, %if.end584
  %261 = load i32, i32* %unbuffered_read, align 4
  %cmp590 = icmp eq i32 %261, 0
  br i1 %cmp590, label %if.then592, label %if.end593

if.then592:                                       ; preds = %if.end589
  %262 = load i32, i32* %fd, align 4
  call void @zsyncfd(i32 %262)
  br label %if.end593

if.end593:                                        ; preds = %if.then592, %if.end589
  call void @discard_unwind_frame(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0))
  %263 = load i32, i32* %eof, align 4
  %tobool594 = icmp ne i32 %263, 0
  %cond595 = select i1 %tobool594, i32 1, i32 0
  store i32 %cond595, i32* %retval1, align 4
  br label %assign_vars

assign_vars:                                      ; preds = %if.end593, %if.end188
  %264 = load i8*, i8** %arrayname, align 4
  %tobool596 = icmp ne i8* %264, null
  br i1 %tobool596, label %if.then597, label %if.end631

if.then597:                                       ; preds = %assign_vars
  %265 = load i8*, i8** %arrayname, align 4
  %call598 = call i32 @legal_identifier(i8* %265)
  %cmp599 = icmp eq i32 %call598, 0
  br i1 %cmp599, label %if.then601, label %if.end602

if.then601:                                       ; preds = %if.then597
  %266 = load i8*, i8** %arrayname, align 4
  call void @sh_invalidid(i8* %266)
  %267 = load i8*, i8** %input_string, align 4
  call void @sh_xfree(i8* %267, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 745)
  store i32 1, i32* %retval, align 4
  br label %return

if.end602:                                        ; preds = %if.then597
  %268 = load i8*, i8** %arrayname, align 4
  %call603 = call %struct.variable* @find_or_make_array_variable(i8* %268, i32 1)
  store %struct.variable* %call603, %struct.variable** %var, align 4
  %269 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp604 = icmp eq %struct.variable* %269, null
  br i1 %cmp604, label %if.then606, label %if.end607

if.then606:                                       ; preds = %if.end602
  %270 = load i8*, i8** %input_string, align 4
  call void @sh_xfree(i8* %270, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 752)
  store i32 1, i32* %retval, align 4
  br label %return

if.end607:                                        ; preds = %if.end602
  %271 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %271, i32 0, i32 5
  %272 = load i32, i32* %attributes, align 4
  %and608 = and i32 %272, 64
  %tobool609 = icmp ne i32 %and608, 0
  br i1 %tobool609, label %if.then610, label %if.else612

if.then610:                                       ; preds = %if.end607
  %call611 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.11, i32 0, i32 0))
  %273 = load i8*, i8** %arrayname, align 4
  call void (i8*, ...) @builtin_error(i8* %call611, i8* %273)
  %274 = load i8*, i8** %input_string, align 4
  call void @sh_xfree(i8* %274, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 758)
  store i32 1, i32* %retval, align 4
  br label %return

if.else612:                                       ; preds = %if.end607
  %275 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes613 = getelementptr inbounds %struct.variable, %struct.variable* %275, i32 0, i32 5
  %276 = load i32, i32* %attributes613, align 4
  %and614 = and i32 %276, 4096
  %tobool615 = icmp ne i32 %and614, 0
  br i1 %tobool615, label %if.then616, label %if.end619

if.then616:                                       ; preds = %if.else612
  %277 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes617 = getelementptr inbounds %struct.variable, %struct.variable* %277, i32 0, i32 5
  %278 = load i32, i32* %attributes617, align 4
  %and618 = and i32 %278, -4097
  store i32 %and618, i32* %attributes617, align 4
  br label %if.end619

if.end619:                                        ; preds = %if.then616, %if.else612
  br label %if.end620

if.end620:                                        ; preds = %if.end619
  %279 = load %struct.variable*, %struct.variable** %var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %279, i32 0, i32 1
  %280 = load i8*, i8** %value, align 4
  %281 = bitcast i8* %280 to %struct.array*
  call void @array_flush(%struct.array* %281)
  %282 = load i8*, i8** %input_string, align 4
  %283 = load i8*, i8** %ifs_chars, align 4
  %call621 = call %struct.word_list* @list_string(i8* %282, i8* %283, i32 0)
  store %struct.word_list* %call621, %struct.word_list** %alist, align 4
  %284 = load %struct.word_list*, %struct.word_list** %alist, align 4
  %tobool622 = icmp ne %struct.word_list* %284, null
  br i1 %tobool622, label %if.then623, label %if.end630

if.then623:                                       ; preds = %if.end620
  %285 = load i32, i32* %saw_escape, align 4
  %tobool624 = icmp ne i32 %285, 0
  br i1 %tobool624, label %if.then625, label %if.else627

if.then625:                                       ; preds = %if.then623
  %286 = load %struct.word_list*, %struct.word_list** %alist, align 4
  %call626 = call %struct.word_list* @dequote_list(%struct.word_list* %286)
  br label %if.end628

if.else627:                                       ; preds = %if.then623
  %287 = load %struct.word_list*, %struct.word_list** %alist, align 4
  call void @word_list_remove_quoted_nulls(%struct.word_list* %287)
  br label %if.end628

if.end628:                                        ; preds = %if.else627, %if.then625
  %288 = load %struct.variable*, %struct.variable** %var, align 4
  %289 = load %struct.word_list*, %struct.word_list** %alist, align 4
  %call629 = call %struct.variable* @assign_array_var_from_word_list(%struct.variable* %288, %struct.word_list* %289, i32 0)
  %290 = load %struct.word_list*, %struct.word_list** %alist, align 4
  call void @dispose_words(%struct.word_list* %290)
  br label %if.end630

if.end630:                                        ; preds = %if.end628, %if.end620
  %291 = load i8*, i8** %input_string, align 4
  call void @sh_xfree(i8* %291, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 775)
  %292 = load i32, i32* %retval1, align 4
  store i32 %292, i32* %retval, align 4
  br label %return

if.end631:                                        ; preds = %assign_vars
  %293 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp632 = icmp eq %struct.word_list* %293, null
  br i1 %cmp632, label %if.then634, label %if.end657

if.then634:                                       ; preds = %if.end631
  %294 = load i32, i32* %saw_escape, align 4
  %tobool635 = icmp ne i32 %294, 0
  br i1 %tobool635, label %if.then636, label %if.else639

if.then636:                                       ; preds = %if.then634
  %295 = load i8*, i8** %input_string, align 4
  %call637 = call i8* @dequote_string(i8* %295)
  store i8* %call637, i8** %t, align 4
  %296 = load i8*, i8** %t, align 4
  %call638 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* %296, i32 0)
  store %struct.variable* %call638, %struct.variable** %var, align 4
  %297 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %297, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 802)
  br label %if.end641

if.else639:                                       ; preds = %if.then634
  %298 = load i8*, i8** %input_string, align 4
  %call640 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0), i8* %298, i32 0)
  store %struct.variable* %call640, %struct.variable** %var, align 4
  br label %if.end641

if.end641:                                        ; preds = %if.else639, %if.then636
  %299 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp642 = icmp eq %struct.variable* %299, null
  br i1 %cmp642, label %if.then652, label %lor.lhs.false644

lor.lhs.false644:                                 ; preds = %if.end641
  %300 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes645 = getelementptr inbounds %struct.variable, %struct.variable* %300, i32 0, i32 5
  %301 = load i32, i32* %attributes645, align 4
  %and646 = and i32 %301, 2
  %tobool647 = icmp ne i32 %and646, 0
  br i1 %tobool647, label %if.then652, label %lor.lhs.false648

lor.lhs.false648:                                 ; preds = %lor.lhs.false644
  %302 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes649 = getelementptr inbounds %struct.variable, %struct.variable* %302, i32 0, i32 5
  %303 = load i32, i32* %attributes649, align 4
  %and650 = and i32 %303, 16384
  %tobool651 = icmp ne i32 %and650, 0
  br i1 %tobool651, label %if.then652, label %if.else653

if.then652:                                       ; preds = %lor.lhs.false648, %lor.lhs.false644, %if.end641
  store i32 1, i32* %retval1, align 4
  br label %if.end656

if.else653:                                       ; preds = %lor.lhs.false648
  %304 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes654 = getelementptr inbounds %struct.variable, %struct.variable* %304, i32 0, i32 5
  %305 = load i32, i32* %attributes654, align 4
  %and655 = and i32 %305, -4097
  store i32 %and655, i32* %attributes654, align 4
  br label %if.end656

if.end656:                                        ; preds = %if.else653, %if.then652
  %306 = load i8*, i8** %input_string, align 4
  call void @sh_xfree(i8* %306, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 811)
  %307 = load i32, i32* %retval1, align 4
  store i32 %307, i32* %retval, align 4
  br label %return

if.end657:                                        ; preds = %if.end631
  %308 = load i8*, i8** %input_string, align 4
  store i8* %308, i8** %orig_input_string, align 4
  %309 = load i8*, i8** %input_string, align 4
  store i8* %309, i8** %t, align 4
  br label %for.cond658

for.cond658:                                      ; preds = %for.inc683, %if.end657
  %310 = load i8*, i8** %ifs_chars, align 4
  %tobool659 = icmp ne i8* %310, null
  br i1 %tobool659, label %land.lhs.true660, label %land.end680

land.lhs.true660:                                 ; preds = %for.cond658
  %311 = load i8*, i8** %ifs_chars, align 4
  %312 = load i8, i8* %311, align 1
  %conv661 = sext i8 %312 to i32
  %tobool662 = icmp ne i32 %conv661, 0
  br i1 %tobool662, label %land.lhs.true663, label %land.end680

land.lhs.true663:                                 ; preds = %land.lhs.true660
  %313 = load i8*, i8** %t, align 4
  %314 = load i8, i8* %313, align 1
  %conv664 = sext i8 %314 to i32
  %cmp665 = icmp eq i32 %conv664, 32
  br i1 %cmp665, label %land.rhs675, label %lor.lhs.false667

lor.lhs.false667:                                 ; preds = %land.lhs.true663
  %315 = load i8*, i8** %t, align 4
  %316 = load i8, i8* %315, align 1
  %conv668 = sext i8 %316 to i32
  %cmp669 = icmp eq i32 %conv668, 9
  br i1 %cmp669, label %land.rhs675, label %lor.lhs.false671

lor.lhs.false671:                                 ; preds = %lor.lhs.false667
  %317 = load i8*, i8** %t, align 4
  %318 = load i8, i8* %317, align 1
  %conv672 = sext i8 %318 to i32
  %cmp673 = icmp eq i32 %conv672, 10
  br i1 %cmp673, label %land.rhs675, label %land.end680

land.rhs675:                                      ; preds = %lor.lhs.false671, %lor.lhs.false667, %land.lhs.true663
  %319 = load i8*, i8** %t, align 4
  %320 = load i8, i8* %319, align 1
  %idxprom = zext i8 %320 to i32
  %arrayidx676 = getelementptr inbounds [0 x i8], [0 x i8]* @ifs_cmap, i32 0, i32 %idxprom
  %321 = load i8, i8* %arrayidx676, align 1
  %conv677 = zext i8 %321 to i32
  %cmp678 = icmp ne i32 %conv677, 0
  br label %land.end680

land.end680:                                      ; preds = %land.rhs675, %lor.lhs.false671, %land.lhs.true660, %for.cond658
  %322 = phi i1 [ false, %lor.lhs.false671 ], [ false, %land.lhs.true660 ], [ false, %for.cond658 ], [ %cmp678, %land.rhs675 ]
  br i1 %322, label %for.body682, label %for.end685

for.body682:                                      ; preds = %land.end680
  br label %for.inc683

for.inc683:                                       ; preds = %for.body682
  %323 = load i8*, i8** %t, align 4
  %incdec.ptr684 = getelementptr inbounds i8, i8* %323, i32 1
  store i8* %incdec.ptr684, i8** %t, align 4
  br label %for.cond658

for.end685:                                       ; preds = %land.end680
  %324 = load i8*, i8** %t, align 4
  store i8* %324, i8** %input_string, align 4
  br label %for.cond686

for.cond686:                                      ; preds = %for.inc734, %for.end685
  %325 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %325, i32 0, i32 0
  %326 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool687 = icmp ne %struct.word_list* %326, null
  br i1 %tobool687, label %for.body688, label %for.end736

for.body688:                                      ; preds = %for.cond686
  %327 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word689 = getelementptr inbounds %struct.word_list, %struct.word_list* %327, i32 0, i32 1
  %328 = load %struct.word_desc*, %struct.word_desc** %word689, align 4
  %word690 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %328, i32 0, i32 0
  %329 = load i8*, i8** %word690, align 4
  store i8* %329, i8** %varname, align 4
  %330 = load i8*, i8** %varname, align 4
  %call691 = call i32 @legal_identifier(i8* %330)
  %cmp692 = icmp eq i32 %call691, 0
  br i1 %cmp692, label %land.lhs.true694, label %if.end699

land.lhs.true694:                                 ; preds = %for.body688
  %331 = load i8*, i8** %varname, align 4
  %call695 = call i32 @valid_array_reference(i8* %331, i32 0)
  %cmp696 = icmp eq i32 %call695, 0
  br i1 %cmp696, label %if.then698, label %if.end699

if.then698:                                       ; preds = %land.lhs.true694
  %332 = load i8*, i8** %varname, align 4
  call void @sh_invalidid(i8* %332)
  %333 = load i8*, i8** %orig_input_string, align 4
  call void @sh_xfree(i8* %333, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 834)
  store i32 1, i32* %retval, align 4
  br label %return

if.end699:                                        ; preds = %land.lhs.true694, %for.body688
  %334 = load i8*, i8** %input_string, align 4
  %335 = load i8, i8* %334, align 1
  %tobool700 = icmp ne i8 %335, 0
  br i1 %tobool700, label %if.then701, label %if.else720

if.then701:                                       ; preds = %if.end699
  %336 = load i8*, i8** %ifs_chars, align 4
  %call702 = call i8* @get_word_from_string(i8** %input_string, i8* %336, i8** %e)
  store i8* %call702, i8** %t, align 4
  %337 = load i8*, i8** %t, align 4
  %tobool703 = icmp ne i8* %337, null
  br i1 %tobool703, label %if.then704, label %if.end705

if.then704:                                       ; preds = %if.then701
  %338 = load i8*, i8** %e, align 4
  store i8 0, i8* %338, align 1
  br label %if.end705

if.end705:                                        ; preds = %if.then704, %if.then701
  %339 = load i8*, i8** %t, align 4
  %tobool706 = icmp ne i8* %339, null
  br i1 %tobool706, label %land.lhs.true707, label %if.else712

land.lhs.true707:                                 ; preds = %if.end705
  %340 = load i32, i32* %saw_escape, align 4
  %tobool708 = icmp ne i32 %340, 0
  br i1 %tobool708, label %if.then709, label %if.else712

if.then709:                                       ; preds = %land.lhs.true707
  %341 = load i8*, i8** %t, align 4
  %call710 = call i8* @dequote_string(i8* %341)
  store i8* %call710, i8** %t1, align 4
  %342 = load i8*, i8** %varname, align 4
  %343 = load i8*, i8** %t1, align 4
  %call711 = call %struct.variable* @bind_read_variable(i8* %342, i8* %343)
  store %struct.variable* %call711, %struct.variable** %var, align 4
  %344 = load i8*, i8** %t1, align 4
  call void @sh_xfree(i8* %344, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 852)
  br label %if.end719

if.else712:                                       ; preds = %land.lhs.true707, %if.end705
  %345 = load i8*, i8** %varname, align 4
  %346 = load i8*, i8** %t, align 4
  %tobool713 = icmp ne i8* %346, null
  br i1 %tobool713, label %cond.true714, label %cond.false715

cond.true714:                                     ; preds = %if.else712
  %347 = load i8*, i8** %t, align 4
  br label %cond.end716

cond.false715:                                    ; preds = %if.else712
  br label %cond.end716

cond.end716:                                      ; preds = %cond.false715, %cond.true714
  %cond717 = phi i8* [ %347, %cond.true714 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), %cond.false715 ]
  %call718 = call %struct.variable* @bind_read_variable(i8* %345, i8* %cond717)
  store %struct.variable* %call718, %struct.variable** %var, align 4
  br label %if.end719

if.end719:                                        ; preds = %cond.end716, %if.then709
  br label %if.end722

if.else720:                                       ; preds = %if.end699
  store i8* null, i8** %t, align 4
  %348 = load i8*, i8** %varname, align 4
  %call721 = call %struct.variable* @bind_read_variable(i8* %348, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0))
  store %struct.variable* %call721, %struct.variable** %var, align 4
  br label %if.end722

if.end722:                                        ; preds = %if.else720, %if.end719
  br label %do.body723

do.body723:                                       ; preds = %if.end722
  %349 = load i8*, i8** %t, align 4
  %tobool724 = icmp ne i8* %349, null
  br i1 %tobool724, label %if.then725, label %if.end726

if.then725:                                       ; preds = %do.body723
  %350 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %350, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 863)
  br label %if.end726

if.end726:                                        ; preds = %if.then725, %do.body723
  br label %do.end727

do.end727:                                        ; preds = %if.end726
  %351 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp728 = icmp eq %struct.variable* %351, null
  br i1 %cmp728, label %if.then730, label %if.end731

if.then730:                                       ; preds = %do.end727
  %352 = load i8*, i8** %orig_input_string, align 4
  call void @sh_xfree(i8* %352, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 866)
  store i32 1, i32* %retval, align 4
  br label %return

if.end731:                                        ; preds = %do.end727
  %353 = load i8*, i8** %varname, align 4
  call void @stupidly_hack_special_variables(i8* %353)
  %354 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes732 = getelementptr inbounds %struct.variable, %struct.variable* %354, i32 0, i32 5
  %355 = load i32, i32* %attributes732, align 4
  %and733 = and i32 %355, -4097
  store i32 %and733, i32* %attributes732, align 4
  br label %for.inc734

for.inc734:                                       ; preds = %if.end731
  %356 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next735 = getelementptr inbounds %struct.word_list, %struct.word_list* %356, i32 0, i32 0
  %357 = load %struct.word_list*, %struct.word_list** %next735, align 4
  store %struct.word_list* %357, %struct.word_list** %list.addr, align 4
  br label %for.cond686

for.end736:                                       ; preds = %for.cond686
  %358 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word737 = getelementptr inbounds %struct.word_list, %struct.word_list* %358, i32 0, i32 1
  %359 = load %struct.word_desc*, %struct.word_desc** %word737, align 4
  %word738 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %359, i32 0, i32 0
  %360 = load i8*, i8** %word738, align 4
  %call739 = call i32 @legal_identifier(i8* %360)
  %cmp740 = icmp eq i32 %call739, 0
  br i1 %cmp740, label %land.lhs.true742, label %if.end751

land.lhs.true742:                                 ; preds = %for.end736
  %361 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word743 = getelementptr inbounds %struct.word_list, %struct.word_list* %361, i32 0, i32 1
  %362 = load %struct.word_desc*, %struct.word_desc** %word743, align 4
  %word744 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %362, i32 0, i32 0
  %363 = load i8*, i8** %word744, align 4
  %call745 = call i32 @valid_array_reference(i8* %363, i32 0)
  %cmp746 = icmp eq i32 %call745, 0
  br i1 %cmp746, label %if.then748, label %if.end751

if.then748:                                       ; preds = %land.lhs.true742
  %364 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word749 = getelementptr inbounds %struct.word_list, %struct.word_list* %364, i32 0, i32 1
  %365 = load %struct.word_desc*, %struct.word_desc** %word749, align 4
  %word750 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %365, i32 0, i32 0
  %366 = load i8*, i8** %word750, align 4
  call void @sh_invalidid(i8* %366)
  %367 = load i8*, i8** %orig_input_string, align 4
  call void @sh_xfree(i8* %367, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 882)
  store i32 1, i32* %retval, align 4
  br label %return

if.end751:                                        ; preds = %land.lhs.true742, %for.end736
  store i8* null, i8** %tofree, align 4
  %368 = load i8*, i8** %input_string, align 4
  %369 = load i8, i8* %368, align 1
  %tobool752 = icmp ne i8 %369, 0
  br i1 %tobool752, label %if.then753, label %if.end762

if.then753:                                       ; preds = %if.end751
  %370 = load i8*, i8** %input_string, align 4
  store i8* %370, i8** %t1, align 4
  %371 = load i8*, i8** %ifs_chars, align 4
  %call754 = call i8* @get_word_from_string(i8** %input_string, i8* %371, i8** %e)
  store i8* %call754, i8** %t, align 4
  %372 = load i8*, i8** %input_string, align 4
  %373 = load i8, i8* %372, align 1
  %conv755 = sext i8 %373 to i32
  %cmp756 = icmp eq i32 %conv755, 0
  br i1 %cmp756, label %if.then758, label %if.else759

if.then758:                                       ; preds = %if.then753
  %374 = load i8*, i8** %t, align 4
  store i8* %374, i8** %input_string, align 4
  store i8* %374, i8** %tofree, align 4
  br label %if.end761

if.else759:                                       ; preds = %if.then753
  %375 = load i8*, i8** %t1, align 4
  %376 = load i8*, i8** %ifs_chars, align 4
  %377 = load i32, i32* %saw_escape, align 4
  %call760 = call i8* @strip_trailing_ifs_whitespace(i8* %375, i8* %376, i32 %377)
  store i8* %call760, i8** %input_string, align 4
  %378 = load i8*, i8** %t, align 4
  store i8* %378, i8** %tofree, align 4
  br label %if.end761

if.end761:                                        ; preds = %if.else759, %if.then758
  br label %if.end762

if.end762:                                        ; preds = %if.end761, %if.end751
  %379 = load i32, i32* %saw_escape, align 4
  %tobool763 = icmp ne i32 %379, 0
  br i1 %tobool763, label %land.lhs.true764, label %if.else774

land.lhs.true764:                                 ; preds = %if.end762
  %380 = load i8*, i8** %input_string, align 4
  %tobool765 = icmp ne i8* %380, null
  br i1 %tobool765, label %land.lhs.true766, label %if.else774

land.lhs.true766:                                 ; preds = %land.lhs.true764
  %381 = load i8*, i8** %input_string, align 4
  %382 = load i8, i8* %381, align 1
  %conv767 = sext i8 %382 to i32
  %tobool768 = icmp ne i32 %conv767, 0
  br i1 %tobool768, label %if.then769, label %if.else774

if.then769:                                       ; preds = %land.lhs.true766
  %383 = load i8*, i8** %input_string, align 4
  %call770 = call i8* @dequote_string(i8* %383)
  store i8* %call770, i8** %t, align 4
  %384 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word771 = getelementptr inbounds %struct.word_list, %struct.word_list* %384, i32 0, i32 1
  %385 = load %struct.word_desc*, %struct.word_desc** %word771, align 4
  %word772 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %385, i32 0, i32 0
  %386 = load i8*, i8** %word772, align 4
  %387 = load i8*, i8** %t, align 4
  %call773 = call %struct.variable* @bind_read_variable(i8* %386, i8* %387)
  store %struct.variable* %call773, %struct.variable** %var, align 4
  %388 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %388, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 913)
  br label %if.end783

if.else774:                                       ; preds = %land.lhs.true766, %land.lhs.true764, %if.end762
  %389 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word775 = getelementptr inbounds %struct.word_list, %struct.word_list* %389, i32 0, i32 1
  %390 = load %struct.word_desc*, %struct.word_desc** %word775, align 4
  %word776 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %390, i32 0, i32 0
  %391 = load i8*, i8** %word776, align 4
  %392 = load i8*, i8** %input_string, align 4
  %tobool777 = icmp ne i8* %392, null
  br i1 %tobool777, label %cond.true778, label %cond.false779

cond.true778:                                     ; preds = %if.else774
  %393 = load i8*, i8** %input_string, align 4
  br label %cond.end780

cond.false779:                                    ; preds = %if.else774
  br label %cond.end780

cond.end780:                                      ; preds = %cond.false779, %cond.true778
  %cond781 = phi i8* [ %393, %cond.true778 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), %cond.false779 ]
  %call782 = call %struct.variable* @bind_read_variable(i8* %391, i8* %cond781)
  store %struct.variable* %call782, %struct.variable** %var, align 4
  br label %if.end783

if.end783:                                        ; preds = %cond.end780, %if.then769
  %394 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool784 = icmp ne %struct.variable* %394, null
  br i1 %tobool784, label %if.then785, label %if.else790

if.then785:                                       ; preds = %if.end783
  %395 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word786 = getelementptr inbounds %struct.word_list, %struct.word_list* %395, i32 0, i32 1
  %396 = load %struct.word_desc*, %struct.word_desc** %word786, align 4
  %word787 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %396, i32 0, i32 0
  %397 = load i8*, i8** %word787, align 4
  call void @stupidly_hack_special_variables(i8* %397)
  %398 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes788 = getelementptr inbounds %struct.variable, %struct.variable* %398, i32 0, i32 5
  %399 = load i32, i32* %attributes788, align 4
  %and789 = and i32 %399, -4097
  store i32 %and789, i32* %attributes788, align 4
  br label %if.end791

if.else790:                                       ; preds = %if.end783
  store i32 1, i32* %retval1, align 4
  br label %if.end791

if.end791:                                        ; preds = %if.else790, %if.then785
  br label %do.body792

do.body792:                                       ; preds = %if.end791
  %400 = load i8*, i8** %tofree, align 4
  %tobool793 = icmp ne i8* %400, null
  br i1 %tobool793, label %if.then794, label %if.end795

if.then794:                                       ; preds = %do.body792
  %401 = load i8*, i8** %tofree, align 4
  call void @sh_xfree(i8* %401, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 926)
  br label %if.end795

if.end795:                                        ; preds = %if.then794, %do.body792
  br label %do.end796

do.end796:                                        ; preds = %if.end795
  %402 = load i8*, i8** %orig_input_string, align 4
  call void @sh_xfree(i8* %402, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 927)
  %403 = load i32, i32* %retval1, align 4
  store i32 %403, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end796, %if.then748, %if.then730, %if.then698, %if.end656, %if.end630, %if.then610, %if.then606, %if.then601, %cond.end552, %if.then76, %if.then60, %sw.default, %sw.bb54, %if.then48, %if.then40, %if.then24, %if.then
  %404 = load i32, i32* %retval, align 4
  ret i32 %404
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare i32 @uconvert(i8*, i32*, i32*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @sh_invalidnum(i8*) #1

declare i32 @sh_validfd(i32) #1

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i32 @input_avail(i32) #1

declare i32 @legal_identifier(i8*) #1

declare i32 @valid_array_reference(i8*, i32) #1

declare void @sh_invalidid(i8*) #1

declare i8* @getifs() #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i8* @get_string_value(i8*) #1

declare void @begin_unwind_frame(i8*) #1

declare i32 @fd_is_bash_input(i32) #1

declare i32 @sync_buffered_stream(i32) #1

declare i32 @isatty(i32) #1

declare i32 @lseek(i32, i32, i32) #1

declare void @add_unwind_protect(...) #1

declare void @xfree(i8*) #1

declare i32 @fstat(i32, %struct.stat*) #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

declare void @run_unwind_frame(i8*) #1

declare void @initialize_terminating_signals() #1

declare void (i32)* @signal(i32, void (i32)*) #1

; Function Attrs: noinline nounwind
define internal void @sigalrm(i32 %s) #0 {
entry:
  %s.addr = alloca i32, align 4
  store i32 %s, i32* %s.addr, align 4
  store i32 1, i32* @sigalrm_seen, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @reset_alarm() #0 {
entry:
  %call = call i32 @falarm(i32 0, i32 0)
  %0 = load void (i32)*, void (i32)** @old_alrm, align 4
  %call1 = call void (i32)* @signal(i32 14, void (i32)* %0)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @reset_attempted_completion_function(i8* %cp) #0 {
entry:
  %cp.addr = alloca i8*, align 4
  store i8* %cp, i8** %cp.addr, align 4
  %0 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %cmp = icmp eq i8** (i8*, i32, i32)* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @old_attempted_completion_function, align 4
  %tobool = icmp ne i8** (i8*, i32, i32)* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @old_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %2, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

declare void @bashline_reset_event_hook() #1

declare i32 @falarm(i32, i32) #1

declare void @unwind_protect_mem(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @set_eol_delim(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %cmap = alloca %struct._keymap_entry*, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* @bash_readline_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @initialize_readline()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call %struct._keymap_entry* @rl_get_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %cmap, align 4
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 13
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  %2 = load i8, i8* %type, align 4
  %conv = sext i8 %2 to i32
  store i32 %conv, i32* @old_newline_ctype, align 4
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %3, i32 13
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  %4 = load i32 (i32, i32)*, i32 (i32, i32)** %function, align 4
  store i32 (i32, i32)* %4, i32 (i32, i32)** @old_newline_func, align 4
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx2 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 13
  %type3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx2, i32 0, i32 0
  store i8 0, i8* %type3, align 4
  %6 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %6, i32 13
  %function5 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx4, i32 0, i32 1
  store i32 (i32, i32)* @rl_insert, i32 (i32, i32)** %function5, align 4
  %7 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %8 = load i32, i32* %c.addr, align 4
  %arrayidx6 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %7, i32 %8
  %type7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx6, i32 0, i32 0
  %9 = load i8, i8* %type7, align 4
  %conv8 = sext i8 %9 to i32
  store i32 %conv8, i32* @old_delim_ctype, align 4
  %10 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %11 = load i32, i32* %c.addr, align 4
  %arrayidx9 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %10, i32 %11
  %function10 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx9, i32 0, i32 1
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %function10, align 4
  store i32 (i32, i32)* %12, i32 (i32, i32)** @old_delim_func, align 4
  %13 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %14 = load i32, i32* %c.addr, align 4
  %arrayidx11 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %13, i32 %14
  %type12 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx11, i32 0, i32 0
  store i8 0, i8* %type12, align 4
  %15 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %16 = load i32, i32* %c.addr, align 4
  %arrayidx13 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %15, i32 %16
  %function14 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx13, i32 0, i32 1
  store i32 (i32, i32)* @rl_newline, i32 (i32, i32)** %function14, align 4
  %17 = load i32, i32* %c.addr, align 4
  %conv15 = trunc i32 %17 to i8
  store i8 %conv15, i8* @delim_char, align 1
  ret void
}

; Function Attrs: noinline nounwind
define internal void @reset_eol_delim(i8* %cp) #0 {
entry:
  %cp.addr = alloca i8*, align 4
  %cmap = alloca %struct._keymap_entry*, align 4
  store i8* %cp, i8** %cp.addr, align 4
  %call = call %struct._keymap_entry* @rl_get_keymap()
  store %struct._keymap_entry* %call, %struct._keymap_entry** %cmap, align 4
  %0 = load i32, i32* @old_newline_ctype, align 4
  %conv = trunc i32 %0 to i8
  %1 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %1, i32 13
  %type = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx, i32 0, i32 0
  store i8 %conv, i8* %type, align 4
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** @old_newline_func, align 4
  %3 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %arrayidx1 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %3, i32 13
  %function = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx1, i32 0, i32 1
  store i32 (i32, i32)* %2, i32 (i32, i32)** %function, align 4
  %4 = load i32, i32* @old_delim_ctype, align 4
  %conv2 = trunc i32 %4 to i8
  %5 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %6 = load i8, i8* @delim_char, align 1
  %idxprom = zext i8 %6 to i32
  %arrayidx3 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %5, i32 %idxprom
  %type4 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx3, i32 0, i32 0
  store i8 %conv2, i8* %type4, align 4
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** @old_delim_func, align 4
  %8 = load %struct._keymap_entry*, %struct._keymap_entry** %cmap, align 4
  %9 = load i8, i8* @delim_char, align 1
  %idxprom5 = zext i8 %9 to i32
  %arrayidx6 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %8, i32 %idxprom5
  %function7 = getelementptr inbounds %struct._keymap_entry, %struct._keymap_entry* %arrayidx6, i32 0, i32 1
  store i32 (i32, i32)* %7, i32 (i32, i32)** %function7, align 4
  ret void
}

declare i32 @ttgetattr(i32, %struct.termios*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #3

declare i32 @ttfd_cbreak(i32, %struct.termios*) #1

declare i32 @ttfd_onechar(i32, %struct.termios*) #1

declare void @sh_ttyerror(i32) #1

; Function Attrs: noinline nounwind
define internal void @ttyrestore(%struct.ttsave* %ttp) #0 {
entry:
  %ttp.addr = alloca %struct.ttsave*, align 4
  store %struct.ttsave* %ttp, %struct.ttsave** %ttp.addr, align 4
  %0 = load %struct.ttsave*, %struct.ttsave** %ttp.addr, align 4
  %fd = getelementptr inbounds %struct.ttsave, %struct.ttsave* %0, i32 0, i32 0
  %1 = load i32, i32* %fd, align 4
  %2 = load %struct.ttsave*, %struct.ttsave** %ttp.addr, align 4
  %attrs = getelementptr inbounds %struct.ttsave, %struct.ttsave* %2, i32 0, i32 1
  %3 = load %struct.termios*, %struct.termios** %attrs, align 4
  %call = call i32 @ttsetattr(i32 %1, %struct.termios* %3)
  store i32 0, i32* @tty_modified, align 4
  ret void
}

declare i32 @ttfd_noecho(i32, %struct.termios*) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #4

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @edit_line(i8* %p, i8* %itext) #0 {
entry:
  %retval = alloca i8*, align 4
  %p.addr = alloca i8*, align 4
  %itext.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %len = alloca i32, align 4
  store i8* %p, i8** %p.addr, align 4
  store i8* %itext, i8** %itext.addr, align 4
  %0 = load i32, i32* @bash_readline_initialized, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @initialize_readline()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** @old_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  call void @bashline_set_event_hook()
  %2 = load i8*, i8** %itext.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %3 = load i32 ()*, i32 ()** @rl_startup_hook, align 4
  store i32 ()* %3, i32 ()** @old_startup_hook, align 4
  store i32 ()* @set_itext, i32 ()** @rl_startup_hook, align 4
  %4 = load i8*, i8** %itext.addr, align 4
  store i8* %4, i8** @deftext, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %5 = load i8*, i8** %p.addr, align 4
  %call = call i8* @readline(i8* %5)
  store i8* %call, i8** %ret, align 4
  %6 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @old_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %6, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @old_attempted_completion_function, align 4
  call void @bashline_reset_event_hook()
  %7 = load i8*, i8** %ret, align 4
  %cmp3 = icmp eq i8* %7, null
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  %8 = load i8*, i8** %ret, align 4
  store i8* %8, i8** %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end2
  %9 = load i8*, i8** %ret, align 4
  %call6 = call i32 @strlen(i8* %9)
  store i32 %call6, i32* %len, align 4
  %10 = load i8*, i8** %ret, align 4
  %11 = load i32, i32* %len, align 4
  %add = add nsw i32 %11, 2
  %call7 = call i8* @sh_xrealloc(i8* %10, i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i32 1082)
  store i8* %call7, i8** %ret, align 4
  %12 = load i8, i8* @delim, align 1
  %13 = load i8*, i8** %ret, align 4
  %14 = load i32, i32* %len, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 %14
  store i8 %12, i8* %arrayidx, align 1
  %15 = load i8*, i8** %ret, align 4
  %16 = load i32, i32* %len, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %15, i32 %16
  store i8 0, i8* %arrayidx8, align 1
  %17 = load i8*, i8** %ret, align 4
  store i8* %17, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then4
  %18 = load i8*, i8** %retval, align 4
  ret i8* %18
}

declare i32 @zreadintr(i32, i8*, i32) #1

declare i32 @zreadn(i32, i8*, i32) #1

declare i32 @zread(i32, i8*, i32) #1

declare i32 @zreadcintr(i32, i8*) #1

declare i32 @zreadc(i32, i8*) #1

declare void @run_pending_traps() #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @remove_unwind_protect() #1

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

; Function Attrs: noinline nounwind
define internal i32 @read_mbchar(i32 %fd, i8* %string, i32 %ind, i32 %ch, i32 %unbuffered) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %ind.addr = alloca i32, align 4
  %ch.addr = alloca i32, align 4
  %unbuffered.addr = alloca i32, align 4
  %mbchar = alloca [17 x i8], align 1
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i8, align 1
  %ret = alloca i32, align 4
  %ps = alloca %struct.__mbstate_t, align 4
  %ps_back = alloca %struct.__mbstate_t, align 4
  %wc = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %ind, i32* %ind.addr, align 4
  store i32 %ch, i32* %ch.addr, align 4
  store i32 %unbuffered, i32* %unbuffered.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 8, i32 4, i1 false)
  %2 = load i32, i32* %ch.addr, align 4
  %conv = trunc i32 %2 to i8
  %arrayidx = getelementptr inbounds [17 x i8], [17 x i8]* %mbchar, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  store i32 1, i32* %i, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %n, align 4
  %cmp = icmp sle i32 %3, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = bitcast %struct.__mbstate_t* %ps_back to i8*
  %5 = bitcast %struct.__mbstate_t* %ps to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %5, i32 8, i32 4, i1 false)
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %mbchar, i32 0, i32 0
  %6 = load i32, i32* %i, align 4
  %call = call i32 @mbrtowc(i32* %wc, i8* %arraydecay, i32 %6, %struct.__mbstate_t* %ps)
  store i32 %call, i32* %ret, align 4
  %7 = load i32, i32* %ret, align 4
  %cmp2 = icmp eq i32 %7, -2
  br i1 %cmp2, label %if.then, label %if.else12

if.then:                                          ; preds = %for.body
  %8 = bitcast %struct.__mbstate_t* %ps to i8*
  %9 = bitcast %struct.__mbstate_t* %ps_back to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %8, i8* %9, i32 8, i32 4, i1 false)
  %10 = load i32, i32* %unbuffered.addr, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %11 = load i32, i32* %fd.addr, align 4
  %call5 = call i32 @zread(i32 %11, i8* %c, i32 1)
  store i32 %call5, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %12 = load i32, i32* %fd.addr, align 4
  %call6 = call i32 @zreadc(i32 %12, i8* %c)
  store i32 %call6, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  %13 = load i32, i32* %r, align 4
  %cmp7 = icmp slt i32 %13, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  br label %mbchar_return

if.end10:                                         ; preds = %if.end
  %14 = load i8, i8* %c, align 1
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [17 x i8], [17 x i8]* %mbchar, i32 0, i32 %15
  store i8 %14, i8* %arrayidx11, align 1
  br label %for.inc

if.else12:                                        ; preds = %for.body
  %16 = load i32, i32* %ret, align 4
  %cmp13 = icmp eq i32 %16, -1
  br i1 %cmp13, label %if.then20, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else12
  %17 = load i32, i32* %ret, align 4
  %cmp15 = icmp eq i32 %17, 0
  br i1 %cmp15, label %if.then20, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %lor.lhs.false
  %18 = load i32, i32* %ret, align 4
  %cmp18 = icmp ugt i32 %18, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false17, %lor.lhs.false, %if.else12
  br label %for.end

if.end21:                                         ; preds = %lor.lhs.false17
  br label %if.end22

if.end22:                                         ; preds = %if.end21
  br label %for.inc

for.inc:                                          ; preds = %if.end22, %if.end10
  %19 = load i32, i32* %n, align 4
  %inc23 = add nsw i32 %19, 1
  store i32 %inc23, i32* %n, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then20, %for.cond
  br label %mbchar_return

mbchar_return:                                    ; preds = %for.end, %if.then9
  %20 = load i32, i32* %i, align 4
  %cmp24 = icmp sgt i32 %20, 1
  br i1 %cmp24, label %if.then26, label %if.end36

if.then26:                                        ; preds = %mbchar_return
  store i32 1, i32* %r, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc33, %if.then26
  %21 = load i32, i32* %r, align 4
  %22 = load i32, i32* %i, align 4
  %cmp28 = icmp slt i32 %21, %22
  br i1 %cmp28, label %for.body30, label %for.end35

for.body30:                                       ; preds = %for.cond27
  %23 = load i32, i32* %r, align 4
  %arrayidx31 = getelementptr inbounds [17 x i8], [17 x i8]* %mbchar, i32 0, i32 %23
  %24 = load i8, i8* %arrayidx31, align 1
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %ind.addr, align 4
  %27 = load i32, i32* %r, align 4
  %add = add nsw i32 %26, %27
  %sub = sub nsw i32 %add, 1
  %arrayidx32 = getelementptr inbounds i8, i8* %25, i32 %sub
  store i8 %24, i8* %arrayidx32, align 1
  br label %for.inc33

for.inc33:                                        ; preds = %for.body30
  %28 = load i32, i32* %r, align 4
  %inc34 = add nsw i32 %28, 1
  store i32 %inc34, i32* %r, align 4
  br label %for.cond27

for.end35:                                        ; preds = %for.cond27
  br label %if.end36

if.end36:                                         ; preds = %for.end35, %mbchar_return
  %29 = load i32, i32* %i, align 4
  %sub37 = sub nsw i32 %29, 1
  ret i32 %sub37
}

declare void @zsyncfd(i32) #1

declare void @discard_unwind_frame(i8*) #1

declare %struct.variable* @find_or_make_array_variable(i8*, i32) #1

declare void @array_flush(%struct.array*) #1

declare %struct.word_list* @list_string(i8*, i8*, i32) #1

declare %struct.word_list* @dequote_list(%struct.word_list*) #1

declare void @word_list_remove_quoted_nulls(%struct.word_list*) #1

declare %struct.variable* @assign_array_var_from_word_list(%struct.variable*, %struct.word_list*, i32) #1

declare void @dispose_words(%struct.word_list*) #1

declare i8* @dequote_string(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare i8* @get_word_from_string(i8**, i8*, i8**) #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_read_variable(i8* %name, i8* %value) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @valid_array_reference(i8* %0, i32 0)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8*, i8** %value.addr, align 4
  %call1 = call %struct.variable* @bind_variable(i8* %1, i8* %2, i32 0)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i8*, i8** %value.addr, align 4
  %call2 = call %struct.variable* @assign_array_element(i8* %3, i8* %4, i32 0)
  store %struct.variable* %call2, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp3 = icmp eq %struct.variable* %5, null
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  br label %cond.end9

cond.false:                                       ; preds = %if.end
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.false
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes4 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes4, align 4
  %and5 = and i32 %10, 16384
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %cond.true7, label %cond.false8

cond.true7:                                       ; preds = %lor.lhs.false, %cond.false
  br label %cond.end

cond.false8:                                      ; preds = %lor.lhs.false
  %11 = load %struct.variable*, %struct.variable** %v, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false8, %cond.true7
  %cond = phi %struct.variable* [ null, %cond.true7 ], [ %11, %cond.false8 ]
  br label %cond.end9

cond.end9:                                        ; preds = %cond.end, %cond.true
  %cond10 = phi %struct.variable* [ %6, %cond.true ], [ %cond, %cond.end ]
  ret %struct.variable* %cond10
}

declare void @stupidly_hack_special_variables(i8*) #1

declare i8* @strip_trailing_ifs_whitespace(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @read_tty_cleanup() #0 {
entry:
  %0 = load i32, i32* @tty_modified, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @ttyrestore(%struct.ttsave* @termsave)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define i32 @read_tty_modified() #0 {
entry:
  %0 = load i32, i32* @tty_modified, align 4
  ret i32 %0
}

declare %struct.variable* @assign_array_element(i8*, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #3

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

declare i32 @ttsetattr(i32, %struct.termios*) #1

declare void @initialize_readline() #1

declare void @bashline_set_event_hook() #1

; Function Attrs: noinline nounwind
define internal i32 @set_itext() #0 {
entry:
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  store i32 0, i32* %r2, align 4
  store i32 0, i32* %r1, align 4
  %0 = load i32 ()*, i32 ()** @old_startup_hook, align 4
  %tobool = icmp ne i32 ()* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32 ()*, i32 ()** @old_startup_hook, align 4
  %call = call i32 %1()
  store i32 %call, i32* %r1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** @deftext, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %if.end
  %3 = load i8*, i8** @deftext, align 4
  %call3 = call i32 @rl_insert_text(i8* %3)
  store i32 %call3, i32* %r2, align 4
  store i8* null, i8** @deftext, align 4
  %4 = load i32 ()*, i32 ()** @old_startup_hook, align 4
  store i32 ()* %4, i32 ()** @rl_startup_hook, align 4
  store i32 ()* null, i32 ()** @old_startup_hook, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.end
  %5 = load i32, i32* %r1, align 4
  %tobool5 = icmp ne i32 %5, 0
  br i1 %tobool5, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end4
  %6 = load i32, i32* %r2, align 4
  %tobool6 = icmp ne i32 %6, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end4
  %7 = phi i1 [ true, %if.end4 ], [ %tobool6, %lor.rhs ]
  %lor.ext = zext i1 %7 to i32
  ret i32 %lor.ext
}

declare i8* @readline(i8*) #1

declare i32 @rl_insert_text(i8*) #1

declare %struct._keymap_entry* @rl_get_keymap() #1

declare i32 @rl_insert(i32, i32) #1

declare i32 @rl_newline(i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { returns_twice }
attributes #6 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
