; ModuleID = 'printf.c'
source_filename = "printf.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.__mbstate_t = type { i32, i32 }

@conversion_error = internal global i32 0, align 4
@retval = internal global i32 0, align 4
@vflag = internal global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"v:\00", align 1
@list_optarg = external global i8*, align 4
@vname = internal global i8* null, align 4
@vbsize = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c"./printf.def\00", align 1
@vbuf = internal global i8* null, align 4
@vblen = internal global i32 0, align 4
@loptend = external global %struct.word_list*, align 4
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@tw = internal global i64 0, align 8
@garglist = internal global %struct.word_list* null, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"#'-+ 0\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"hjlLtz\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"`%s': missing format character\00", align 1
@conv_bufsize = internal global i32 0, align 4
@conv_buf = internal global i8* null, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@.str.6 = private unnamed_addr constant [40 x i8] c"`%c': invalid time format specification\00", align 1
@shell_start_time = external global i32, align 4
@.str.7 = private unnamed_addr constant [3 x i8] c"TZ\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"''\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"lld\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str.11 = private unnamed_addr constant [31 x i8] c"`%c': invalid format character\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"missing hex digit for \5Cx\00", align 1
@.str.13 = private unnamed_addr constant [30 x i8] c"missing unicode digit for \5C%c\00", align 1
@.str.14 = private unnamed_addr constant [16 x i8] c"warning: %s: %s\00", align 1

; Function Attrs: noinline nounwind
define i32 @printf_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %ch = alloca i32, align 4
  %fieldwidth = alloca i32, align 4
  %precision = alloca i32, align 4
  %have_fieldwidth = alloca i32, align 4
  %have_precision = alloca i32, align 4
  %convch = alloca i8, align 1
  %thisch = alloca i8, align 1
  %nextch = alloca i8, align 1
  %format = alloca i8*, align 4
  %modstart = alloca i8*, align 4
  %fmt = alloca i8*, align 4
  %start = alloca i8*, align 4
  %mbch = alloca [25 x i8], align 1
  %mbind = alloca i32, align 4
  %mblen = alloca i32, align 4
  %b = alloca [2 x i8], align 1
  %b90 = alloca [2 x i8], align 1
  %b118 = alloca [2 x i8], align 1
  %p = alloca i8, align 1
  %nw = alloca i32, align 4
  %p341 = alloca i8*, align 4
  %nw344 = alloca i32, align 4
  %timefmt = alloca i8*, align 4
  %timebuf = alloca [128 x i8], align 1
  %t = alloca i8*, align 4
  %n = alloca i32, align 4
  %arg = alloca i64, align 8
  %secs = alloca i32, align 4
  %tm = alloca %struct.tm*, align 4
  %b438 = alloca [2 x i8], align 1
  %var = alloca i8*, align 4
  %p627 = alloca i8*, align 4
  %xp = alloca i8*, align 4
  %rlen = alloca i32, align 4
  %r = alloca i32, align 4
  %p696 = alloca i8*, align 4
  %xp697 = alloca i8*, align 4
  %r698 = alloca i32, align 4
  %f = alloca i8*, align 4
  %p776 = alloca i32, align 4
  %pp = alloca i64, align 8
  %nw785 = alloca i32, align 4
  %nw846 = alloca i32, align 4
  %f906 = alloca i8*, align 4
  %p907 = alloca i32, align 4
  %pp908 = alloca i64, align 8
  %nw917 = alloca i32, align 4
  %nw978 = alloca i32, align 4
  %f1038 = alloca i8*, align 4
  %p1039 = alloca double, align 8
  %nw1043 = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* @conversion_error, align 4
  store i32 0, i32* @retval, align 4
  store i32 0, i32* @vflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %ch, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %ch, align 4
  switch i32 %1, label %sw.default [
    i32 118, label %sw.bb
    i32 -99, label %sw.bb11
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i8*, i8** @list_optarg, align 4
  store i8* %2, i8** @vname, align 4
  %3 = load i8*, i8** @vname, align 4
  %call1 = call i32 @legal_identifier(i8* %3)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb
  %4 = load i8*, i8** @vname, align 4
  %call2 = call i32 @valid_array_reference(i8* %4, i32 0)
  %tobool3 = icmp ne i32 %call2, 0
  br i1 %tobool3, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %sw.bb
  store i32 1, i32* @vflag, align 4
  %5 = load i32, i32* @vbsize, align 4
  %cmp4 = icmp eq i32 %5, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i32 16, i32* @vbsize, align 4
  %call6 = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 268)
  store i8* %call6, i8** @vbuf, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  store i32 0, i32* @vblen, align 4
  %6 = load i8*, i8** @vbuf, align 4
  %tobool7 = icmp ne i8* %6, null
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  %7 = load i8*, i8** @vbuf, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  br label %if.end10

if.else:                                          ; preds = %lor.lhs.false
  %8 = load i8*, i8** @vname, align 4
  call void @sh_invalidid(i8* %8)
  store i32 258, i32* %retval, align 4
  br label %do.end1261

if.end10:                                         ; preds = %if.end9
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %do.end1261

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %do.end1261

sw.epilog:                                        ; preds = %if.end10
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %9, %struct.word_list** %list.addr, align 4
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp12 = icmp eq %struct.word_list* %10, null
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.end
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %do.end1261

if.end14:                                         ; preds = %while.end
  %11 = load i32, i32* @vflag, align 4
  %tobool15 = icmp ne i32 %11, 0
  br i1 %tobool15, label %land.lhs.true, label %if.end26

land.lhs.true:                                    ; preds = %if.end14
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word16 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word16, align 4
  %tobool17 = icmp ne i8* %14, null
  br i1 %tobool17, label %land.lhs.true18, label %if.end26

land.lhs.true18:                                  ; preds = %land.lhs.true
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word19 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word19, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word20, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx21, align 1
  %conv = sext i8 %18 to i32
  %cmp22 = icmp eq i32 %conv, 0
  br i1 %cmp22, label %if.then24, label %if.end26

if.then24:                                        ; preds = %land.lhs.true18
  %19 = load i8*, i8** @vname, align 4
  %call25 = call %struct.variable* @bind_printf_variable(i8* %19, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0), i32 0)
  %20 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %20)
  store i32 0, i32* %retval, align 4
  br label %do.end1261

if.end26:                                         ; preds = %land.lhs.true18, %land.lhs.true, %if.end14
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word27 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word27, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word28, align 4
  %cmp29 = icmp eq i8* %23, null
  br i1 %cmp29, label %if.then38, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %if.end26
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word32 = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 1
  %25 = load %struct.word_desc*, %struct.word_desc** %word32, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %25, i32 0, i32 0
  %26 = load i8*, i8** %word33, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %26, i32 0
  %27 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %27 to i32
  %cmp36 = icmp eq i32 %conv35, 0
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false31, %if.end26
  store i32 0, i32* %retval, align 4
  br label %do.end1261

if.end39:                                         ; preds = %lor.lhs.false31
  %28 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word40 = getelementptr inbounds %struct.word_list, %struct.word_list* %28, i32 0, i32 1
  %29 = load %struct.word_desc*, %struct.word_desc** %word40, align 4
  %word41 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  %30 = load i8*, i8** %word41, align 4
  store i8* %30, i8** %format, align 4
  store i64 0, i64* @tw, align 8
  %31 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 0
  %32 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %32, %struct.word_list** @garglist, align 4
  %33 = load i8*, i8** %format, align 4
  %cmp42 = icmp eq i8* %33, null
  br i1 %cmp42, label %if.then48, label %lor.lhs.false44

lor.lhs.false44:                                  ; preds = %if.end39
  %34 = load i8*, i8** %format, align 4
  %35 = load i8, i8* %34, align 1
  %conv45 = sext i8 %35 to i32
  %cmp46 = icmp eq i32 %conv45, 0
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %lor.lhs.false44, %if.end39
  store i32 0, i32* %retval, align 4
  br label %do.end1261

if.end49:                                         ; preds = %lor.lhs.false44
  br label %do.body

do.body:                                          ; preds = %land.end1209, %if.end49
  store i64 0, i64* @tw, align 8
  %36 = load i8*, i8** %format, align 4
  store i8* %36, i8** %fmt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc1152, %do.body
  %37 = load i8*, i8** %fmt, align 4
  %38 = load i8, i8* %37, align 1
  %tobool50 = icmp ne i8 %38, 0
  br i1 %tobool50, label %for.body, label %for.end1154

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %fieldwidth, align 4
  store i32 0, i32* %precision, align 4
  store i32 0, i32* %have_precision, align 4
  store i32 0, i32* %have_fieldwidth, align 4
  %39 = load i8*, i8** %fmt, align 4
  %40 = load i8, i8* %39, align 1
  %conv51 = sext i8 %40 to i32
  %cmp52 = icmp eq i32 %conv51, 92
  br i1 %cmp52, label %if.then54, label %if.end84

if.then54:                                        ; preds = %for.body
  %41 = load i8*, i8** %fmt, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %incdec.ptr, i8** %fmt, align 4
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* %arraydecay, i8 0, i32 25, i32 1, i1 false)
  %42 = load i8*, i8** %fmt, align 4
  %arraydecay55 = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 0
  %call56 = call i32 @tescape(i8* %42, i8* %arraydecay55, i32* %mblen, i32* null)
  %43 = load i8*, i8** %fmt, align 4
  %add.ptr = getelementptr inbounds i8, i8* %43, i32 %call56
  store i8* %add.ptr, i8** %fmt, align 4
  store i32 0, i32* %mbind, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc, %if.then54
  %44 = load i32, i32* %mbind, align 4
  %45 = load i32, i32* %mblen, align 4
  %cmp58 = icmp slt i32 %44, %45
  br i1 %cmp58, label %for.body60, label %for.end

for.body60:                                       ; preds = %for.cond57
  br label %do.body61

do.body61:                                        ; preds = %for.body60
  %46 = load i64, i64* @tw, align 8
  %inc = add nsw i64 %46, 1
  store i64 %inc, i64* @tw, align 8
  %47 = load i32, i32* %mbind, align 4
  %arrayidx62 = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 %47
  %48 = load i8, i8* %arrayidx62, align 1
  %arrayidx63 = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 0
  store i8 %48, i8* %arrayidx63, align 1
  %arrayidx64 = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 1
  store i8 0, i8* %arrayidx64, align 1
  %49 = load i32, i32* @vflag, align 4
  %tobool65 = icmp ne i32 %49, 0
  br i1 %tobool65, label %if.then66, label %if.else69

if.then66:                                        ; preds = %do.body61
  %arraydecay67 = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 0
  %call68 = call i8* @vbadd(i8* %arraydecay67, i32 1)
  br label %if.end73

if.else69:                                        ; preds = %do.body61
  %50 = load i32, i32* %mbind, align 4
  %arrayidx70 = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 %50
  %51 = load i8, i8* %arrayidx70, align 1
  %conv71 = sext i8 %51 to i32
  %call72 = call i32 @putchar(i32 %conv71)
  br label %if.end73

if.end73:                                         ; preds = %if.else69, %if.then66
  br label %do.body74

do.body74:                                        ; preds = %if.end73
  %52 = load volatile i32, i32* @terminating_signal, align 4
  %tobool75 = icmp ne i32 %52, 0
  br i1 %tobool75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %do.body74
  %53 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %53)
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %do.body74
  %54 = load volatile i32, i32* @interrupt_state, align 4
  %tobool78 = icmp ne i32 %54, 0
  br i1 %tobool78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end77
  call void @throw_to_top_level()
  br label %if.end80

if.end80:                                         ; preds = %if.then79, %if.end77
  br label %do.end

do.end:                                           ; preds = %if.end80
  br label %do.end81

do.end81:                                         ; preds = %do.end
  br label %for.inc

for.inc:                                          ; preds = %do.end81
  %55 = load i32, i32* %mbind, align 4
  %inc82 = add nsw i32 %55, 1
  store i32 %inc82, i32* %mbind, align 4
  br label %for.cond57

for.end:                                          ; preds = %for.cond57
  %56 = load i8*, i8** %fmt, align 4
  %incdec.ptr83 = getelementptr inbounds i8, i8* %56, i32 -1
  store i8* %incdec.ptr83, i8** %fmt, align 4
  br label %for.inc1152

if.end84:                                         ; preds = %for.body
  %57 = load i8*, i8** %fmt, align 4
  %58 = load i8, i8* %57, align 1
  %conv85 = sext i8 %58 to i32
  %cmp86 = icmp ne i32 %conv85, 37
  br i1 %cmp86, label %if.then88, label %if.end111

if.then88:                                        ; preds = %if.end84
  br label %do.body89

do.body89:                                        ; preds = %if.then88
  %59 = load i64, i64* @tw, align 8
  %inc91 = add nsw i64 %59, 1
  store i64 %inc91, i64* @tw, align 8
  %60 = load i8*, i8** %fmt, align 4
  %61 = load i8, i8* %60, align 1
  %arrayidx92 = getelementptr inbounds [2 x i8], [2 x i8]* %b90, i32 0, i32 0
  store i8 %61, i8* %arrayidx92, align 1
  %arrayidx93 = getelementptr inbounds [2 x i8], [2 x i8]* %b90, i32 0, i32 1
  store i8 0, i8* %arrayidx93, align 1
  %62 = load i32, i32* @vflag, align 4
  %tobool94 = icmp ne i32 %62, 0
  br i1 %tobool94, label %if.then95, label %if.else98

if.then95:                                        ; preds = %do.body89
  %arraydecay96 = getelementptr inbounds [2 x i8], [2 x i8]* %b90, i32 0, i32 0
  %call97 = call i8* @vbadd(i8* %arraydecay96, i32 1)
  br label %if.end101

if.else98:                                        ; preds = %do.body89
  %63 = load i8*, i8** %fmt, align 4
  %64 = load i8, i8* %63, align 1
  %conv99 = sext i8 %64 to i32
  %call100 = call i32 @putchar(i32 %conv99)
  br label %if.end101

if.end101:                                        ; preds = %if.else98, %if.then95
  br label %do.body102

do.body102:                                       ; preds = %if.end101
  %65 = load volatile i32, i32* @terminating_signal, align 4
  %tobool103 = icmp ne i32 %65, 0
  br i1 %tobool103, label %if.then104, label %if.end105

if.then104:                                       ; preds = %do.body102
  %66 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %66)
  br label %if.end105

if.end105:                                        ; preds = %if.then104, %do.body102
  %67 = load volatile i32, i32* @interrupt_state, align 4
  %tobool106 = icmp ne i32 %67, 0
  br i1 %tobool106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end105
  call void @throw_to_top_level()
  br label %if.end108

if.end108:                                        ; preds = %if.then107, %if.end105
  br label %do.end109

do.end109:                                        ; preds = %if.end108
  br label %do.end110

do.end110:                                        ; preds = %do.end109
  br label %for.inc1152

if.end111:                                        ; preds = %if.end84
  %68 = load i8*, i8** %fmt, align 4
  %incdec.ptr112 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %incdec.ptr112, i8** %fmt, align 4
  store i8* %68, i8** %start, align 4
  %69 = load i8*, i8** %fmt, align 4
  %70 = load i8, i8* %69, align 1
  %conv113 = sext i8 %70 to i32
  %cmp114 = icmp eq i32 %conv113, 37
  br i1 %cmp114, label %if.then116, label %if.end138

if.then116:                                       ; preds = %if.end111
  br label %do.body117

do.body117:                                       ; preds = %if.then116
  %71 = load i64, i64* @tw, align 8
  %inc119 = add nsw i64 %71, 1
  store i64 %inc119, i64* @tw, align 8
  %arrayidx120 = getelementptr inbounds [2 x i8], [2 x i8]* %b118, i32 0, i32 0
  store i8 37, i8* %arrayidx120, align 1
  %arrayidx121 = getelementptr inbounds [2 x i8], [2 x i8]* %b118, i32 0, i32 1
  store i8 0, i8* %arrayidx121, align 1
  %72 = load i32, i32* @vflag, align 4
  %tobool122 = icmp ne i32 %72, 0
  br i1 %tobool122, label %if.then123, label %if.else126

if.then123:                                       ; preds = %do.body117
  %arraydecay124 = getelementptr inbounds [2 x i8], [2 x i8]* %b118, i32 0, i32 0
  %call125 = call i8* @vbadd(i8* %arraydecay124, i32 1)
  br label %if.end128

if.else126:                                       ; preds = %do.body117
  %call127 = call i32 @putchar(i32 37)
  br label %if.end128

if.end128:                                        ; preds = %if.else126, %if.then123
  br label %do.body129

do.body129:                                       ; preds = %if.end128
  %73 = load volatile i32, i32* @terminating_signal, align 4
  %tobool130 = icmp ne i32 %73, 0
  br i1 %tobool130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %do.body129
  %74 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %74)
  br label %if.end132

if.end132:                                        ; preds = %if.then131, %do.body129
  %75 = load volatile i32, i32* @interrupt_state, align 4
  %tobool133 = icmp ne i32 %75, 0
  br i1 %tobool133, label %if.then134, label %if.end135

if.then134:                                       ; preds = %if.end132
  call void @throw_to_top_level()
  br label %if.end135

if.end135:                                        ; preds = %if.then134, %if.end132
  br label %do.end136

do.end136:                                        ; preds = %if.end135
  br label %do.end137

do.end137:                                        ; preds = %do.end136
  br label %for.inc1152

if.end138:                                        ; preds = %if.end111
  br label %for.cond139

for.cond139:                                      ; preds = %for.inc146, %if.end138
  %76 = load i8*, i8** %fmt, align 4
  %77 = load i8, i8* %76, align 1
  %conv140 = sext i8 %77 to i32
  %tobool141 = icmp ne i32 %conv140, 0
  br i1 %tobool141, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond139
  %78 = load i8*, i8** %fmt, align 4
  %79 = load i8, i8* %78, align 1
  %conv142 = sext i8 %79 to i32
  %call143 = call i8* @strchr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 %conv142)
  %tobool144 = icmp ne i8* %call143, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond139
  %80 = phi i1 [ false, %for.cond139 ], [ %tobool144, %land.rhs ]
  br i1 %80, label %for.body145, label %for.end148

for.body145:                                      ; preds = %land.end
  br label %for.inc146

for.inc146:                                       ; preds = %for.body145
  %81 = load i8*, i8** %fmt, align 4
  %incdec.ptr147 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %incdec.ptr147, i8** %fmt, align 4
  br label %for.cond139

for.end148:                                       ; preds = %land.end
  %82 = load i8*, i8** %fmt, align 4
  %83 = load i8, i8* %82, align 1
  %conv149 = sext i8 %83 to i32
  %cmp150 = icmp eq i32 %conv149, 42
  br i1 %cmp150, label %if.then152, label %if.else155

if.then152:                                       ; preds = %for.end148
  %84 = load i8*, i8** %fmt, align 4
  %incdec.ptr153 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %incdec.ptr153, i8** %fmt, align 4
  store i32 1, i32* %have_fieldwidth, align 4
  %call154 = call i32 @getint()
  store i32 %call154, i32* %fieldwidth, align 4
  br label %if.end168

if.else155:                                       ; preds = %for.end148
  br label %while.cond156

while.cond156:                                    ; preds = %while.body165, %if.else155
  %85 = load i8*, i8** %fmt, align 4
  %86 = load i8, i8* %85, align 1
  %conv157 = sext i8 %86 to i32
  %cmp158 = icmp sge i32 %conv157, 48
  br i1 %cmp158, label %land.rhs160, label %land.end164

land.rhs160:                                      ; preds = %while.cond156
  %87 = load i8*, i8** %fmt, align 4
  %88 = load i8, i8* %87, align 1
  %conv161 = sext i8 %88 to i32
  %cmp162 = icmp sle i32 %conv161, 57
  br label %land.end164

land.end164:                                      ; preds = %land.rhs160, %while.cond156
  %89 = phi i1 [ false, %while.cond156 ], [ %cmp162, %land.rhs160 ]
  br i1 %89, label %while.body165, label %while.end167

while.body165:                                    ; preds = %land.end164
  %90 = load i8*, i8** %fmt, align 4
  %incdec.ptr166 = getelementptr inbounds i8, i8* %90, i32 1
  store i8* %incdec.ptr166, i8** %fmt, align 4
  br label %while.cond156

while.end167:                                     ; preds = %land.end164
  br label %if.end168

if.end168:                                        ; preds = %while.end167, %if.then152
  %91 = load i8*, i8** %fmt, align 4
  %92 = load i8, i8* %91, align 1
  %conv169 = sext i8 %92 to i32
  %cmp170 = icmp eq i32 %conv169, 46
  br i1 %cmp170, label %if.then172, label %if.end200

if.then172:                                       ; preds = %if.end168
  %93 = load i8*, i8** %fmt, align 4
  %incdec.ptr173 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %incdec.ptr173, i8** %fmt, align 4
  %94 = load i8*, i8** %fmt, align 4
  %95 = load i8, i8* %94, align 1
  %conv174 = sext i8 %95 to i32
  %cmp175 = icmp eq i32 %conv174, 42
  br i1 %cmp175, label %if.then177, label %if.else180

if.then177:                                       ; preds = %if.then172
  %96 = load i8*, i8** %fmt, align 4
  %incdec.ptr178 = getelementptr inbounds i8, i8* %96, i32 1
  store i8* %incdec.ptr178, i8** %fmt, align 4
  store i32 1, i32* %have_precision, align 4
  %call179 = call i32 @getint()
  store i32 %call179, i32* %precision, align 4
  br label %if.end199

if.else180:                                       ; preds = %if.then172
  %97 = load i8*, i8** %fmt, align 4
  %98 = load i8, i8* %97, align 1
  %conv181 = sext i8 %98 to i32
  %cmp182 = icmp eq i32 %conv181, 45
  br i1 %cmp182, label %if.then184, label %if.end186

if.then184:                                       ; preds = %if.else180
  %99 = load i8*, i8** %fmt, align 4
  %incdec.ptr185 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %incdec.ptr185, i8** %fmt, align 4
  br label %if.end186

if.end186:                                        ; preds = %if.then184, %if.else180
  br label %while.cond187

while.cond187:                                    ; preds = %while.body196, %if.end186
  %100 = load i8*, i8** %fmt, align 4
  %101 = load i8, i8* %100, align 1
  %conv188 = sext i8 %101 to i32
  %cmp189 = icmp sge i32 %conv188, 48
  br i1 %cmp189, label %land.rhs191, label %land.end195

land.rhs191:                                      ; preds = %while.cond187
  %102 = load i8*, i8** %fmt, align 4
  %103 = load i8, i8* %102, align 1
  %conv192 = sext i8 %103 to i32
  %cmp193 = icmp sle i32 %conv192, 57
  br label %land.end195

land.end195:                                      ; preds = %land.rhs191, %while.cond187
  %104 = phi i1 [ false, %while.cond187 ], [ %cmp193, %land.rhs191 ]
  br i1 %104, label %while.body196, label %while.end198

while.body196:                                    ; preds = %land.end195
  %105 = load i8*, i8** %fmt, align 4
  %incdec.ptr197 = getelementptr inbounds i8, i8* %105, i32 1
  store i8* %incdec.ptr197, i8** %fmt, align 4
  br label %while.cond187

while.end198:                                     ; preds = %land.end195
  br label %if.end199

if.end199:                                        ; preds = %while.end198, %if.then177
  br label %if.end200

if.end200:                                        ; preds = %if.end199, %if.end168
  %106 = load i8*, i8** %fmt, align 4
  store i8* %106, i8** %modstart, align 4
  br label %while.cond201

while.cond201:                                    ; preds = %while.body209, %if.end200
  %107 = load i8*, i8** %fmt, align 4
  %108 = load i8, i8* %107, align 1
  %conv202 = sext i8 %108 to i32
  %tobool203 = icmp ne i32 %conv202, 0
  br i1 %tobool203, label %land.rhs204, label %land.end208

land.rhs204:                                      ; preds = %while.cond201
  %109 = load i8*, i8** %fmt, align 4
  %110 = load i8, i8* %109, align 1
  %conv205 = sext i8 %110 to i32
  %call206 = call i8* @strchr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i32 %conv205)
  %tobool207 = icmp ne i8* %call206, null
  br label %land.end208

land.end208:                                      ; preds = %land.rhs204, %while.cond201
  %111 = phi i1 [ false, %while.cond201 ], [ %tobool207, %land.rhs204 ]
  br i1 %111, label %while.body209, label %while.end211

while.body209:                                    ; preds = %land.end208
  %112 = load i8*, i8** %fmt, align 4
  %incdec.ptr210 = getelementptr inbounds i8, i8* %112, i32 1
  store i8* %incdec.ptr210, i8** %fmt, align 4
  br label %while.cond201

while.end211:                                     ; preds = %land.end208
  %113 = load i8*, i8** %fmt, align 4
  %114 = load i8, i8* %113, align 1
  %conv212 = sext i8 %114 to i32
  %cmp213 = icmp eq i32 %conv212, 0
  br i1 %cmp213, label %if.then215, label %if.end262

if.then215:                                       ; preds = %while.end211
  %call216 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i32 0, i32 0))
  %115 = load i8*, i8** %start, align 4
  call void (i8*, ...) @builtin_error(i8* %call216, i8* %115)
  br label %do.body217

do.body217:                                       ; preds = %if.then215
  br label %do.body218

do.body218:                                       ; preds = %do.body217
  %116 = load volatile i32, i32* @terminating_signal, align 4
  %tobool219 = icmp ne i32 %116, 0
  br i1 %tobool219, label %if.then220, label %if.end221

if.then220:                                       ; preds = %do.body218
  %117 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %117)
  br label %if.end221

if.end221:                                        ; preds = %if.then220, %do.body218
  %118 = load volatile i32, i32* @interrupt_state, align 4
  %tobool222 = icmp ne i32 %118, 0
  br i1 %tobool222, label %if.then223, label %if.end224

if.then223:                                       ; preds = %if.end221
  call void @throw_to_top_level()
  br label %if.end224

if.end224:                                        ; preds = %if.then223, %if.end221
  br label %do.end225

do.end225:                                        ; preds = %if.end224
  %119 = load i32, i32* @vflag, align 4
  %tobool226 = icmp ne i32 %119, 0
  br i1 %tobool226, label %if.then227, label %if.end229

if.then227:                                       ; preds = %do.end225
  %120 = load i8*, i8** @vname, align 4
  %121 = load i8*, i8** @vbuf, align 4
  %call228 = call %struct.variable* @bind_printf_variable(i8* %120, i8* %121, i32 0)
  %122 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %122)
  br label %if.end229

if.end229:                                        ; preds = %if.then227, %do.end225
  %123 = load i32, i32* @conv_bufsize, align 4
  %cmp230 = icmp ugt i32 %123, 4096
  br i1 %cmp230, label %if.then232, label %if.end233

if.then232:                                       ; preds = %if.end229
  %124 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %124, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 413)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end233

if.end233:                                        ; preds = %if.then232, %if.end229
  %125 = load i32, i32* @vbsize, align 4
  %cmp234 = icmp ugt i32 %125, 4096
  br i1 %cmp234, label %if.then236, label %if.else237

if.then236:                                       ; preds = %if.end233
  %126 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %126, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 413)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end242

if.else237:                                       ; preds = %if.end233
  %127 = load i8*, i8** @vbuf, align 4
  %tobool238 = icmp ne i8* %127, null
  br i1 %tobool238, label %if.then239, label %if.end241

if.then239:                                       ; preds = %if.else237
  %128 = load i8*, i8** @vbuf, align 4
  %arrayidx240 = getelementptr inbounds i8, i8* %128, i32 0
  store i8 0, i8* %arrayidx240, align 1
  br label %if.end241

if.end241:                                        ; preds = %if.then239, %if.else237
  br label %if.end242

if.end242:                                        ; preds = %if.end241, %if.then236
  %129 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call243 = call i32 @ferror(%struct._IO_FILE* %129)
  %cmp244 = icmp eq i32 %call243, 0
  br i1 %cmp244, label %if.then246, label %if.end248

if.then246:                                       ; preds = %if.end242
  %130 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call247 = call i32 @fflush(%struct._IO_FILE* %130)
  br label %if.end248

if.end248:                                        ; preds = %if.then246, %if.end242
  br label %do.body249

do.body249:                                       ; preds = %if.end248
  %131 = load volatile i32, i32* @terminating_signal, align 4
  %tobool250 = icmp ne i32 %131, 0
  br i1 %tobool250, label %if.then251, label %if.end252

if.then251:                                       ; preds = %do.body249
  %132 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %132)
  br label %if.end252

if.end252:                                        ; preds = %if.then251, %do.body249
  %133 = load volatile i32, i32* @interrupt_state, align 4
  %tobool253 = icmp ne i32 %133, 0
  br i1 %tobool253, label %if.then254, label %if.end255

if.then254:                                       ; preds = %if.end252
  call void @throw_to_top_level()
  br label %if.end255

if.end255:                                        ; preds = %if.then254, %if.end252
  br label %do.end256

do.end256:                                        ; preds = %if.end255
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call257 = call i32 @ferror(%struct._IO_FILE* %134)
  %tobool258 = icmp ne i32 %call257, 0
  br i1 %tobool258, label %if.then259, label %if.end260

if.then259:                                       ; preds = %do.end256
  call void @sh_wrerror()
  %135 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %135)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end260:                                        ; preds = %do.end256
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end261:                                        ; No predecessors!
  br label %if.end262

if.end262:                                        ; preds = %do.end261, %while.end211
  %136 = load i8*, i8** %fmt, align 4
  %137 = load i8, i8* %136, align 1
  store i8 %137, i8* %convch, align 1
  %138 = load i8*, i8** %modstart, align 4
  %arrayidx263 = getelementptr inbounds i8, i8* %138, i32 0
  %139 = load i8, i8* %arrayidx263, align 1
  store i8 %139, i8* %thisch, align 1
  %140 = load i8*, i8** %modstart, align 4
  %arrayidx264 = getelementptr inbounds i8, i8* %140, i32 1
  %141 = load i8, i8* %arrayidx264, align 1
  store i8 %141, i8* %nextch, align 1
  %142 = load i8, i8* %convch, align 1
  %143 = load i8*, i8** %modstart, align 4
  %arrayidx265 = getelementptr inbounds i8, i8* %143, i32 0
  store i8 %142, i8* %arrayidx265, align 1
  %144 = load i8*, i8** %modstart, align 4
  %arrayidx266 = getelementptr inbounds i8, i8* %144, i32 1
  store i8 0, i8* %arrayidx266, align 1
  br label %do.body267

do.body267:                                       ; preds = %if.end262
  %145 = load volatile i32, i32* @terminating_signal, align 4
  %tobool268 = icmp ne i32 %145, 0
  br i1 %tobool268, label %if.then269, label %if.end270

if.then269:                                       ; preds = %do.body267
  %146 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %146)
  br label %if.end270

if.end270:                                        ; preds = %if.then269, %do.body267
  %147 = load volatile i32, i32* @interrupt_state, align 4
  %tobool271 = icmp ne i32 %147, 0
  br i1 %tobool271, label %if.then272, label %if.end273

if.then272:                                       ; preds = %if.end270
  call void @throw_to_top_level()
  br label %if.end273

if.end273:                                        ; preds = %if.then272, %if.end270
  br label %do.end274

do.end274:                                        ; preds = %if.end273
  %148 = load i8, i8* %convch, align 1
  %conv275 = sext i8 %148 to i32
  switch i32 %conv275, label %sw.default1101 [
    i32 99, label %sw.bb276
    i32 115, label %sw.bb340
    i32 40, label %sw.bb402
    i32 110, label %sw.bb567
    i32 98, label %sw.bb626
    i32 113, label %sw.bb695
    i32 100, label %sw.bb775
    i32 105, label %sw.bb775
    i32 111, label %sw.bb905
    i32 117, label %sw.bb905
    i32 120, label %sw.bb905
    i32 88, label %sw.bb905
    i32 101, label %sw.bb1037
    i32 69, label %sw.bb1037
    i32 102, label %sw.bb1037
    i32 70, label %sw.bb1037
    i32 103, label %sw.bb1037
    i32 71, label %sw.bb1037
  ]

sw.bb276:                                         ; preds = %do.end274
  %call277 = call i32 @getchr()
  %conv278 = trunc i32 %call277 to i8
  store i8 %conv278, i8* %p, align 1
  br label %do.body279

do.body279:                                       ; preds = %sw.bb276
  %149 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %149)
  %150 = load i32, i32* %have_fieldwidth, align 4
  %tobool280 = icmp ne i32 %150, 0
  br i1 %tobool280, label %land.lhs.true281, label %if.else289

land.lhs.true281:                                 ; preds = %do.body279
  %151 = load i32, i32* %have_precision, align 4
  %tobool282 = icmp ne i32 %151, 0
  br i1 %tobool282, label %if.then283, label %if.else289

if.then283:                                       ; preds = %land.lhs.true281
  %152 = load i32, i32* @vflag, align 4
  %tobool284 = icmp ne i32 %152, 0
  br i1 %tobool284, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then283
  %153 = load i8*, i8** %start, align 4
  %154 = load i32, i32* %fieldwidth, align 4
  %155 = load i32, i32* %precision, align 4
  %156 = load i8, i8* %p, align 1
  %conv285 = sext i8 %156 to i32
  %call286 = call i32 (i8*, ...) @vbprintf(i8* %153, i32 %154, i32 %155, i32 %conv285)
  br label %cond.end

cond.false:                                       ; preds = %if.then283
  %157 = load i8*, i8** %start, align 4
  %158 = load i32, i32* %fieldwidth, align 4
  %159 = load i32, i32* %precision, align 4
  %160 = load i8, i8* %p, align 1
  %conv287 = sext i8 %160 to i32
  %call288 = call i32 (i8*, ...) @printf(i8* %157, i32 %158, i32 %159, i32 %conv287)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call286, %cond.true ], [ %call288, %cond.false ]
  store i32 %cond, i32* %nw, align 4
  br label %if.end325

if.else289:                                       ; preds = %land.lhs.true281, %do.body279
  %161 = load i32, i32* %have_fieldwidth, align 4
  %tobool290 = icmp ne i32 %161, 0
  br i1 %tobool290, label %if.then291, label %if.else301

if.then291:                                       ; preds = %if.else289
  %162 = load i32, i32* @vflag, align 4
  %tobool292 = icmp ne i32 %162, 0
  br i1 %tobool292, label %cond.true293, label %cond.false296

cond.true293:                                     ; preds = %if.then291
  %163 = load i8*, i8** %start, align 4
  %164 = load i32, i32* %fieldwidth, align 4
  %165 = load i8, i8* %p, align 1
  %conv294 = sext i8 %165 to i32
  %call295 = call i32 (i8*, ...) @vbprintf(i8* %163, i32 %164, i32 %conv294)
  br label %cond.end299

cond.false296:                                    ; preds = %if.then291
  %166 = load i8*, i8** %start, align 4
  %167 = load i32, i32* %fieldwidth, align 4
  %168 = load i8, i8* %p, align 1
  %conv297 = sext i8 %168 to i32
  %call298 = call i32 (i8*, ...) @printf(i8* %166, i32 %167, i32 %conv297)
  br label %cond.end299

cond.end299:                                      ; preds = %cond.false296, %cond.true293
  %cond300 = phi i32 [ %call295, %cond.true293 ], [ %call298, %cond.false296 ]
  store i32 %cond300, i32* %nw, align 4
  br label %if.end324

if.else301:                                       ; preds = %if.else289
  %169 = load i32, i32* %have_precision, align 4
  %tobool302 = icmp ne i32 %169, 0
  br i1 %tobool302, label %if.then303, label %if.else313

if.then303:                                       ; preds = %if.else301
  %170 = load i32, i32* @vflag, align 4
  %tobool304 = icmp ne i32 %170, 0
  br i1 %tobool304, label %cond.true305, label %cond.false308

cond.true305:                                     ; preds = %if.then303
  %171 = load i8*, i8** %start, align 4
  %172 = load i32, i32* %precision, align 4
  %173 = load i8, i8* %p, align 1
  %conv306 = sext i8 %173 to i32
  %call307 = call i32 (i8*, ...) @vbprintf(i8* %171, i32 %172, i32 %conv306)
  br label %cond.end311

cond.false308:                                    ; preds = %if.then303
  %174 = load i8*, i8** %start, align 4
  %175 = load i32, i32* %precision, align 4
  %176 = load i8, i8* %p, align 1
  %conv309 = sext i8 %176 to i32
  %call310 = call i32 (i8*, ...) @printf(i8* %174, i32 %175, i32 %conv309)
  br label %cond.end311

cond.end311:                                      ; preds = %cond.false308, %cond.true305
  %cond312 = phi i32 [ %call307, %cond.true305 ], [ %call310, %cond.false308 ]
  store i32 %cond312, i32* %nw, align 4
  br label %if.end323

if.else313:                                       ; preds = %if.else301
  %177 = load i32, i32* @vflag, align 4
  %tobool314 = icmp ne i32 %177, 0
  br i1 %tobool314, label %cond.true315, label %cond.false318

cond.true315:                                     ; preds = %if.else313
  %178 = load i8*, i8** %start, align 4
  %179 = load i8, i8* %p, align 1
  %conv316 = sext i8 %179 to i32
  %call317 = call i32 (i8*, ...) @vbprintf(i8* %178, i32 %conv316)
  br label %cond.end321

cond.false318:                                    ; preds = %if.else313
  %180 = load i8*, i8** %start, align 4
  %181 = load i8, i8* %p, align 1
  %conv319 = sext i8 %181 to i32
  %call320 = call i32 (i8*, ...) @printf(i8* %180, i32 %conv319)
  br label %cond.end321

cond.end321:                                      ; preds = %cond.false318, %cond.true315
  %cond322 = phi i32 [ %call317, %cond.true315 ], [ %call320, %cond.false318 ]
  store i32 %cond322, i32* %nw, align 4
  br label %if.end323

if.end323:                                        ; preds = %cond.end321, %cond.end311
  br label %if.end324

if.end324:                                        ; preds = %if.end323, %cond.end299
  br label %if.end325

if.end325:                                        ; preds = %if.end324, %cond.end
  %182 = load i32, i32* %nw, align 4
  %conv326 = sext i32 %182 to i64
  %183 = load i64, i64* @tw, align 8
  %add = add nsw i64 %183, %conv326
  store i64 %add, i64* @tw, align 8
  br label %do.body327

do.body327:                                       ; preds = %if.end325
  %184 = load volatile i32, i32* @terminating_signal, align 4
  %tobool328 = icmp ne i32 %184, 0
  br i1 %tobool328, label %if.then329, label %if.end330

if.then329:                                       ; preds = %do.body327
  %185 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %185)
  br label %if.end330

if.end330:                                        ; preds = %if.then329, %do.body327
  %186 = load volatile i32, i32* @interrupt_state, align 4
  %tobool331 = icmp ne i32 %186, 0
  br i1 %tobool331, label %if.then332, label %if.end333

if.then332:                                       ; preds = %if.end330
  call void @throw_to_top_level()
  br label %if.end333

if.end333:                                        ; preds = %if.then332, %if.end330
  br label %do.end334

do.end334:                                        ; preds = %if.end333
  %187 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call335 = call i32 @ferror(%struct._IO_FILE* %187)
  %tobool336 = icmp ne i32 %call335, 0
  br i1 %tobool336, label %if.then337, label %if.end338

if.then337:                                       ; preds = %do.end334
  call void @sh_wrerror()
  %188 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %188)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end338:                                        ; preds = %do.end334
  br label %do.end339

do.end339:                                        ; preds = %if.end338
  br label %sw.epilog1149

sw.bb340:                                         ; preds = %do.end274
  %call342 = call i8* @getstr()
  store i8* %call342, i8** %p341, align 4
  br label %do.body343

do.body343:                                       ; preds = %sw.bb340
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %189)
  %190 = load i32, i32* %have_fieldwidth, align 4
  %tobool345 = icmp ne i32 %190, 0
  br i1 %tobool345, label %land.lhs.true346, label %if.else356

land.lhs.true346:                                 ; preds = %do.body343
  %191 = load i32, i32* %have_precision, align 4
  %tobool347 = icmp ne i32 %191, 0
  br i1 %tobool347, label %if.then348, label %if.else356

if.then348:                                       ; preds = %land.lhs.true346
  %192 = load i32, i32* @vflag, align 4
  %tobool349 = icmp ne i32 %192, 0
  br i1 %tobool349, label %cond.true350, label %cond.false352

cond.true350:                                     ; preds = %if.then348
  %193 = load i8*, i8** %start, align 4
  %194 = load i32, i32* %fieldwidth, align 4
  %195 = load i32, i32* %precision, align 4
  %196 = load i8*, i8** %p341, align 4
  %call351 = call i32 (i8*, ...) @vbprintf(i8* %193, i32 %194, i32 %195, i8* %196)
  br label %cond.end354

cond.false352:                                    ; preds = %if.then348
  %197 = load i8*, i8** %start, align 4
  %198 = load i32, i32* %fieldwidth, align 4
  %199 = load i32, i32* %precision, align 4
  %200 = load i8*, i8** %p341, align 4
  %call353 = call i32 (i8*, ...) @printf(i8* %197, i32 %198, i32 %199, i8* %200)
  br label %cond.end354

cond.end354:                                      ; preds = %cond.false352, %cond.true350
  %cond355 = phi i32 [ %call351, %cond.true350 ], [ %call353, %cond.false352 ]
  store i32 %cond355, i32* %nw344, align 4
  br label %if.end386

if.else356:                                       ; preds = %land.lhs.true346, %do.body343
  %201 = load i32, i32* %have_fieldwidth, align 4
  %tobool357 = icmp ne i32 %201, 0
  br i1 %tobool357, label %if.then358, label %if.else366

if.then358:                                       ; preds = %if.else356
  %202 = load i32, i32* @vflag, align 4
  %tobool359 = icmp ne i32 %202, 0
  br i1 %tobool359, label %cond.true360, label %cond.false362

cond.true360:                                     ; preds = %if.then358
  %203 = load i8*, i8** %start, align 4
  %204 = load i32, i32* %fieldwidth, align 4
  %205 = load i8*, i8** %p341, align 4
  %call361 = call i32 (i8*, ...) @vbprintf(i8* %203, i32 %204, i8* %205)
  br label %cond.end364

cond.false362:                                    ; preds = %if.then358
  %206 = load i8*, i8** %start, align 4
  %207 = load i32, i32* %fieldwidth, align 4
  %208 = load i8*, i8** %p341, align 4
  %call363 = call i32 (i8*, ...) @printf(i8* %206, i32 %207, i8* %208)
  br label %cond.end364

cond.end364:                                      ; preds = %cond.false362, %cond.true360
  %cond365 = phi i32 [ %call361, %cond.true360 ], [ %call363, %cond.false362 ]
  store i32 %cond365, i32* %nw344, align 4
  br label %if.end385

if.else366:                                       ; preds = %if.else356
  %209 = load i32, i32* %have_precision, align 4
  %tobool367 = icmp ne i32 %209, 0
  br i1 %tobool367, label %if.then368, label %if.else376

if.then368:                                       ; preds = %if.else366
  %210 = load i32, i32* @vflag, align 4
  %tobool369 = icmp ne i32 %210, 0
  br i1 %tobool369, label %cond.true370, label %cond.false372

cond.true370:                                     ; preds = %if.then368
  %211 = load i8*, i8** %start, align 4
  %212 = load i32, i32* %precision, align 4
  %213 = load i8*, i8** %p341, align 4
  %call371 = call i32 (i8*, ...) @vbprintf(i8* %211, i32 %212, i8* %213)
  br label %cond.end374

cond.false372:                                    ; preds = %if.then368
  %214 = load i8*, i8** %start, align 4
  %215 = load i32, i32* %precision, align 4
  %216 = load i8*, i8** %p341, align 4
  %call373 = call i32 (i8*, ...) @printf(i8* %214, i32 %215, i8* %216)
  br label %cond.end374

cond.end374:                                      ; preds = %cond.false372, %cond.true370
  %cond375 = phi i32 [ %call371, %cond.true370 ], [ %call373, %cond.false372 ]
  store i32 %cond375, i32* %nw344, align 4
  br label %if.end384

if.else376:                                       ; preds = %if.else366
  %217 = load i32, i32* @vflag, align 4
  %tobool377 = icmp ne i32 %217, 0
  br i1 %tobool377, label %cond.true378, label %cond.false380

cond.true378:                                     ; preds = %if.else376
  %218 = load i8*, i8** %start, align 4
  %219 = load i8*, i8** %p341, align 4
  %call379 = call i32 (i8*, ...) @vbprintf(i8* %218, i8* %219)
  br label %cond.end382

cond.false380:                                    ; preds = %if.else376
  %220 = load i8*, i8** %start, align 4
  %221 = load i8*, i8** %p341, align 4
  %call381 = call i32 (i8*, ...) @printf(i8* %220, i8* %221)
  br label %cond.end382

cond.end382:                                      ; preds = %cond.false380, %cond.true378
  %cond383 = phi i32 [ %call379, %cond.true378 ], [ %call381, %cond.false380 ]
  store i32 %cond383, i32* %nw344, align 4
  br label %if.end384

if.end384:                                        ; preds = %cond.end382, %cond.end374
  br label %if.end385

if.end385:                                        ; preds = %if.end384, %cond.end364
  br label %if.end386

if.end386:                                        ; preds = %if.end385, %cond.end354
  %222 = load i32, i32* %nw344, align 4
  %conv387 = sext i32 %222 to i64
  %223 = load i64, i64* @tw, align 8
  %add388 = add nsw i64 %223, %conv387
  store i64 %add388, i64* @tw, align 8
  br label %do.body389

do.body389:                                       ; preds = %if.end386
  %224 = load volatile i32, i32* @terminating_signal, align 4
  %tobool390 = icmp ne i32 %224, 0
  br i1 %tobool390, label %if.then391, label %if.end392

if.then391:                                       ; preds = %do.body389
  %225 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %225)
  br label %if.end392

if.end392:                                        ; preds = %if.then391, %do.body389
  %226 = load volatile i32, i32* @interrupt_state, align 4
  %tobool393 = icmp ne i32 %226, 0
  br i1 %tobool393, label %if.then394, label %if.end395

if.then394:                                       ; preds = %if.end392
  call void @throw_to_top_level()
  br label %if.end395

if.end395:                                        ; preds = %if.then394, %if.end392
  br label %do.end396

do.end396:                                        ; preds = %if.end395
  %227 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call397 = call i32 @ferror(%struct._IO_FILE* %227)
  %tobool398 = icmp ne i32 %call397, 0
  br i1 %tobool398, label %if.then399, label %if.end400

if.then399:                                       ; preds = %do.end396
  call void @sh_wrerror()
  %228 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %228)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end400:                                        ; preds = %do.end396
  br label %do.end401

do.end401:                                        ; preds = %if.end400
  br label %sw.epilog1149

sw.bb402:                                         ; preds = %do.end274
  %229 = load i8, i8* %nextch, align 1
  %230 = load i8*, i8** %modstart, align 4
  %arrayidx403 = getelementptr inbounds i8, i8* %230, i32 1
  store i8 %229, i8* %arrayidx403, align 1
  %231 = load i8*, i8** %fmt, align 4
  %call404 = call i32 @strlen(i8* %231)
  %add405 = add i32 %call404, 3
  %call406 = call i8* @sh_xmalloc(i32 %add405, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 452)
  store i8* %call406, i8** %timefmt, align 4
  %232 = load i8*, i8** %fmt, align 4
  %incdec.ptr407 = getelementptr inbounds i8, i8* %232, i32 1
  store i8* %incdec.ptr407, i8** %fmt, align 4
  %233 = load i8*, i8** %timefmt, align 4
  store i8* %233, i8** %t, align 4
  store i32 1, i32* %n, align 4
  br label %for.cond408

for.cond408:                                      ; preds = %if.end426, %sw.bb402
  %234 = load i8*, i8** %fmt, align 4
  %235 = load i8, i8* %234, align 1
  %tobool409 = icmp ne i8 %235, 0
  br i1 %tobool409, label %for.body410, label %for.end429

for.body410:                                      ; preds = %for.cond408
  %236 = load i8*, i8** %fmt, align 4
  %237 = load i8, i8* %236, align 1
  %conv411 = sext i8 %237 to i32
  %cmp412 = icmp eq i32 %conv411, 40
  br i1 %cmp412, label %if.then414, label %if.else416

if.then414:                                       ; preds = %for.body410
  %238 = load i32, i32* %n, align 4
  %inc415 = add nsw i32 %238, 1
  store i32 %inc415, i32* %n, align 4
  br label %if.end422

if.else416:                                       ; preds = %for.body410
  %239 = load i8*, i8** %fmt, align 4
  %240 = load i8, i8* %239, align 1
  %conv417 = sext i8 %240 to i32
  %cmp418 = icmp eq i32 %conv417, 41
  br i1 %cmp418, label %if.then420, label %if.end421

if.then420:                                       ; preds = %if.else416
  %241 = load i32, i32* %n, align 4
  %dec = add nsw i32 %241, -1
  store i32 %dec, i32* %n, align 4
  br label %if.end421

if.end421:                                        ; preds = %if.then420, %if.else416
  br label %if.end422

if.end422:                                        ; preds = %if.end421, %if.then414
  %242 = load i32, i32* %n, align 4
  %cmp423 = icmp eq i32 %242, 0
  br i1 %cmp423, label %if.then425, label %if.end426

if.then425:                                       ; preds = %if.end422
  br label %for.end429

if.end426:                                        ; preds = %if.end422
  %243 = load i8*, i8** %fmt, align 4
  %incdec.ptr427 = getelementptr inbounds i8, i8* %243, i32 1
  store i8* %incdec.ptr427, i8** %fmt, align 4
  %244 = load i8, i8* %243, align 1
  %245 = load i8*, i8** %t, align 4
  %incdec.ptr428 = getelementptr inbounds i8, i8* %245, i32 1
  store i8* %incdec.ptr428, i8** %t, align 4
  store i8 %244, i8* %245, align 1
  br label %for.cond408

for.end429:                                       ; preds = %if.then425, %for.cond408
  %246 = load i8*, i8** %t, align 4
  store i8 0, i8* %246, align 1
  %247 = load i8*, i8** %fmt, align 4
  %incdec.ptr430 = getelementptr inbounds i8, i8* %247, i32 1
  store i8* %incdec.ptr430, i8** %fmt, align 4
  %248 = load i8, i8* %incdec.ptr430, align 1
  %conv431 = sext i8 %248 to i32
  %cmp432 = icmp ne i32 %conv431, 84
  br i1 %cmp432, label %if.then434, label %if.end459

if.then434:                                       ; preds = %for.end429
  %call435 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0))
  %249 = load i8*, i8** %fmt, align 4
  %250 = load i8, i8* %249, align 1
  %conv436 = sext i8 %250 to i32
  call void (i8*, ...) @builtin_warning(i8* %call435, i32 %conv436)
  %251 = load i8*, i8** %start, align 4
  store i8* %251, i8** %fmt, align 4
  %252 = load i8*, i8** %timefmt, align 4
  call void @sh_xfree(i8* %252, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 469)
  br label %do.body437

do.body437:                                       ; preds = %if.then434
  %253 = load i64, i64* @tw, align 8
  %inc439 = add nsw i64 %253, 1
  store i64 %inc439, i64* @tw, align 8
  %254 = load i8*, i8** %fmt, align 4
  %255 = load i8, i8* %254, align 1
  %arrayidx440 = getelementptr inbounds [2 x i8], [2 x i8]* %b438, i32 0, i32 0
  store i8 %255, i8* %arrayidx440, align 1
  %arrayidx441 = getelementptr inbounds [2 x i8], [2 x i8]* %b438, i32 0, i32 1
  store i8 0, i8* %arrayidx441, align 1
  %256 = load i32, i32* @vflag, align 4
  %tobool442 = icmp ne i32 %256, 0
  br i1 %tobool442, label %if.then443, label %if.else446

if.then443:                                       ; preds = %do.body437
  %arraydecay444 = getelementptr inbounds [2 x i8], [2 x i8]* %b438, i32 0, i32 0
  %call445 = call i8* @vbadd(i8* %arraydecay444, i32 1)
  br label %if.end449

if.else446:                                       ; preds = %do.body437
  %257 = load i8*, i8** %fmt, align 4
  %258 = load i8, i8* %257, align 1
  %conv447 = sext i8 %258 to i32
  %call448 = call i32 @putchar(i32 %conv447)
  br label %if.end449

if.end449:                                        ; preds = %if.else446, %if.then443
  br label %do.body450

do.body450:                                       ; preds = %if.end449
  %259 = load volatile i32, i32* @terminating_signal, align 4
  %tobool451 = icmp ne i32 %259, 0
  br i1 %tobool451, label %if.then452, label %if.end453

if.then452:                                       ; preds = %do.body450
  %260 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %260)
  br label %if.end453

if.end453:                                        ; preds = %if.then452, %do.body450
  %261 = load volatile i32, i32* @interrupt_state, align 4
  %tobool454 = icmp ne i32 %261, 0
  br i1 %tobool454, label %if.then455, label %if.end456

if.then455:                                       ; preds = %if.end453
  call void @throw_to_top_level()
  br label %if.end456

if.end456:                                        ; preds = %if.then455, %if.end453
  br label %do.end457

do.end457:                                        ; preds = %if.end456
  br label %do.end458

do.end458:                                        ; preds = %do.end457
  br label %for.inc1152

if.end459:                                        ; preds = %for.end429
  %262 = load i8*, i8** %timefmt, align 4
  %arrayidx460 = getelementptr inbounds i8, i8* %262, i32 0
  %263 = load i8, i8* %arrayidx460, align 1
  %conv461 = sext i8 %263 to i32
  %cmp462 = icmp eq i32 %conv461, 0
  br i1 %cmp462, label %if.then464, label %if.end468

if.then464:                                       ; preds = %if.end459
  %264 = load i8*, i8** %timefmt, align 4
  %arrayidx465 = getelementptr inbounds i8, i8* %264, i32 0
  store i8 37, i8* %arrayidx465, align 1
  %265 = load i8*, i8** %timefmt, align 4
  %arrayidx466 = getelementptr inbounds i8, i8* %265, i32 1
  store i8 88, i8* %arrayidx466, align 1
  %266 = load i8*, i8** %timefmt, align 4
  %arrayidx467 = getelementptr inbounds i8, i8* %266, i32 2
  store i8 0, i8* %arrayidx467, align 1
  br label %if.end468

if.end468:                                        ; preds = %if.then464, %if.end459
  %267 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %tobool469 = icmp ne %struct.word_list* %267, null
  br i1 %tobool469, label %cond.true470, label %cond.false472

cond.true470:                                     ; preds = %if.end468
  %call471 = call i64 @getintmax()
  br label %cond.end473

cond.false472:                                    ; preds = %if.end468
  br label %cond.end473

cond.end473:                                      ; preds = %cond.false472, %cond.true470
  %cond474 = phi i64 [ %call471, %cond.true470 ], [ -1, %cond.false472 ]
  store i64 %cond474, i64* %arg, align 8
  %268 = load i64, i64* %arg, align 8
  %cmp475 = icmp eq i64 %268, -1
  br i1 %cmp475, label %if.then477, label %if.else479

if.then477:                                       ; preds = %cond.end473
  %call478 = call i32 @time(i32* null)
  store i32 %call478, i32* %secs, align 4
  br label %if.end486

if.else479:                                       ; preds = %cond.end473
  %269 = load i64, i64* %arg, align 8
  %cmp480 = icmp eq i64 %269, -2
  br i1 %cmp480, label %if.then482, label %if.else483

if.then482:                                       ; preds = %if.else479
  %270 = load i32, i32* @shell_start_time, align 4
  store i32 %270, i32* %secs, align 4
  br label %if.end485

if.else483:                                       ; preds = %if.else479
  %271 = load i64, i64* %arg, align 8
  %conv484 = trunc i64 %271 to i32
  store i32 %conv484, i32* %secs, align 4
  br label %if.end485

if.end485:                                        ; preds = %if.else483, %if.then482
  br label %if.end486

if.end486:                                        ; preds = %if.end485, %if.then477
  call void @sv_tz(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0))
  %call487 = call %struct.tm* @localtime(i32* %secs)
  store %struct.tm* %call487, %struct.tm** %tm, align 4
  %272 = load %struct.tm*, %struct.tm** %tm, align 4
  %cmp488 = icmp eq %struct.tm* %272, null
  br i1 %cmp488, label %if.then490, label %if.end492

if.then490:                                       ; preds = %if.end486
  store i32 0, i32* %secs, align 4
  %call491 = call %struct.tm* @localtime(i32* %secs)
  store %struct.tm* %call491, %struct.tm** %tm, align 4
  br label %if.end492

if.end492:                                        ; preds = %if.then490, %if.end486
  %273 = load %struct.tm*, %struct.tm** %tm, align 4
  %tobool493 = icmp ne %struct.tm* %273, null
  br i1 %tobool493, label %cond.true494, label %cond.false497

cond.true494:                                     ; preds = %if.end492
  %arraydecay495 = getelementptr inbounds [128 x i8], [128 x i8]* %timebuf, i32 0, i32 0
  %274 = load i8*, i8** %timefmt, align 4
  %275 = load %struct.tm*, %struct.tm** %tm, align 4
  %call496 = call i32 @strftime(i8* %arraydecay495, i32 128, i8* %274, %struct.tm* %275)
  br label %cond.end498

cond.false497:                                    ; preds = %if.end492
  br label %cond.end498

cond.end498:                                      ; preds = %cond.false497, %cond.true494
  %cond499 = phi i32 [ %call496, %cond.true494 ], [ 0, %cond.false497 ]
  store i32 %cond499, i32* %n, align 4
  %276 = load i8*, i8** %timefmt, align 4
  call void @sh_xfree(i8* %276, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 498)
  %277 = load i32, i32* %n, align 4
  %cmp500 = icmp eq i32 %277, 0
  br i1 %cmp500, label %if.then502, label %if.else504

if.then502:                                       ; preds = %cond.end498
  %arrayidx503 = getelementptr inbounds [128 x i8], [128 x i8]* %timebuf, i32 0, i32 0
  store i8 0, i8* %arrayidx503, align 1
  br label %if.end506

if.else504:                                       ; preds = %cond.end498
  %arrayidx505 = getelementptr inbounds [128 x i8], [128 x i8]* %timebuf, i32 0, i32 127
  store i8 0, i8* %arrayidx505, align 1
  br label %if.end506

if.end506:                                        ; preds = %if.else504, %if.then502
  %278 = load i8*, i8** %modstart, align 4
  %arrayidx507 = getelementptr inbounds i8, i8* %278, i32 0
  store i8 115, i8* %arrayidx507, align 1
  %279 = load i8*, i8** %modstart, align 4
  %arrayidx508 = getelementptr inbounds i8, i8* %279, i32 1
  store i8 0, i8* %arrayidx508, align 1
  %280 = load i8*, i8** %start, align 4
  %arraydecay509 = getelementptr inbounds [128 x i8], [128 x i8]* %timebuf, i32 0, i32 0
  %arraydecay510 = getelementptr inbounds [128 x i8], [128 x i8]* %timebuf, i32 0, i32 0
  %call511 = call i32 @strlen(i8* %arraydecay510)
  %281 = load i32, i32* %fieldwidth, align 4
  %282 = load i32, i32* %precision, align 4
  %call512 = call i32 @printstr(i8* %280, i8* %arraydecay509, i32 %call511, i32 %281, i32 %282)
  store i32 %call512, i32* %n, align 4
  %283 = load i32, i32* %n, align 4
  %cmp513 = icmp slt i32 %283, 0
  br i1 %cmp513, label %if.then515, label %if.end566

if.then515:                                       ; preds = %if.end506
  %284 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call516 = call i32 @ferror(%struct._IO_FILE* %284)
  %cmp517 = icmp eq i32 %call516, 0
  br i1 %cmp517, label %if.then519, label %if.end520

if.then519:                                       ; preds = %if.then515
  call void @sh_wrerror()
  %285 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %285)
  br label %if.end520

if.end520:                                        ; preds = %if.then519, %if.then515
  br label %do.body521

do.body521:                                       ; preds = %if.end520
  br label %do.body522

do.body522:                                       ; preds = %do.body521
  %286 = load volatile i32, i32* @terminating_signal, align 4
  %tobool523 = icmp ne i32 %286, 0
  br i1 %tobool523, label %if.then524, label %if.end525

if.then524:                                       ; preds = %do.body522
  %287 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %287)
  br label %if.end525

if.end525:                                        ; preds = %if.then524, %do.body522
  %288 = load volatile i32, i32* @interrupt_state, align 4
  %tobool526 = icmp ne i32 %288, 0
  br i1 %tobool526, label %if.then527, label %if.end528

if.then527:                                       ; preds = %if.end525
  call void @throw_to_top_level()
  br label %if.end528

if.end528:                                        ; preds = %if.then527, %if.end525
  br label %do.end529

do.end529:                                        ; preds = %if.end528
  %289 = load i32, i32* @vflag, align 4
  %tobool530 = icmp ne i32 %289, 0
  br i1 %tobool530, label %if.then531, label %if.end533

if.then531:                                       ; preds = %do.end529
  %290 = load i8*, i8** @vname, align 4
  %291 = load i8*, i8** @vbuf, align 4
  %call532 = call %struct.variable* @bind_printf_variable(i8* %290, i8* %291, i32 0)
  %292 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %292)
  br label %if.end533

if.end533:                                        ; preds = %if.then531, %do.end529
  %293 = load i32, i32* @conv_bufsize, align 4
  %cmp534 = icmp ugt i32 %293, 4096
  br i1 %cmp534, label %if.then536, label %if.end537

if.then536:                                       ; preds = %if.end533
  %294 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %294, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 514)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end537

if.end537:                                        ; preds = %if.then536, %if.end533
  %295 = load i32, i32* @vbsize, align 4
  %cmp538 = icmp ugt i32 %295, 4096
  br i1 %cmp538, label %if.then540, label %if.else541

if.then540:                                       ; preds = %if.end537
  %296 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %296, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 514)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end546

if.else541:                                       ; preds = %if.end537
  %297 = load i8*, i8** @vbuf, align 4
  %tobool542 = icmp ne i8* %297, null
  br i1 %tobool542, label %if.then543, label %if.end545

if.then543:                                       ; preds = %if.else541
  %298 = load i8*, i8** @vbuf, align 4
  %arrayidx544 = getelementptr inbounds i8, i8* %298, i32 0
  store i8 0, i8* %arrayidx544, align 1
  br label %if.end545

if.end545:                                        ; preds = %if.then543, %if.else541
  br label %if.end546

if.end546:                                        ; preds = %if.end545, %if.then540
  %299 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call547 = call i32 @ferror(%struct._IO_FILE* %299)
  %cmp548 = icmp eq i32 %call547, 0
  br i1 %cmp548, label %if.then550, label %if.end552

if.then550:                                       ; preds = %if.end546
  %300 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call551 = call i32 @fflush(%struct._IO_FILE* %300)
  br label %if.end552

if.end552:                                        ; preds = %if.then550, %if.end546
  br label %do.body553

do.body553:                                       ; preds = %if.end552
  %301 = load volatile i32, i32* @terminating_signal, align 4
  %tobool554 = icmp ne i32 %301, 0
  br i1 %tobool554, label %if.then555, label %if.end556

if.then555:                                       ; preds = %do.body553
  %302 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %302)
  br label %if.end556

if.end556:                                        ; preds = %if.then555, %do.body553
  %303 = load volatile i32, i32* @interrupt_state, align 4
  %tobool557 = icmp ne i32 %303, 0
  br i1 %tobool557, label %if.then558, label %if.end559

if.then558:                                       ; preds = %if.end556
  call void @throw_to_top_level()
  br label %if.end559

if.end559:                                        ; preds = %if.then558, %if.end556
  br label %do.end560

do.end560:                                        ; preds = %if.end559
  %304 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call561 = call i32 @ferror(%struct._IO_FILE* %304)
  %tobool562 = icmp ne i32 %call561, 0
  br i1 %tobool562, label %if.then563, label %if.end564

if.then563:                                       ; preds = %do.end560
  call void @sh_wrerror()
  %305 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %305)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end564:                                        ; preds = %do.end560
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end565:                                        ; No predecessors!
  br label %if.end566

if.end566:                                        ; preds = %do.end565, %if.end506
  br label %sw.epilog1149

sw.bb567:                                         ; preds = %do.end274
  %call568 = call i8* @getstr()
  store i8* %call568, i8** %var, align 4
  %306 = load i8*, i8** %var, align 4
  %tobool569 = icmp ne i8* %306, null
  br i1 %tobool569, label %land.lhs.true570, label %if.end625

land.lhs.true570:                                 ; preds = %sw.bb567
  %307 = load i8*, i8** %var, align 4
  %308 = load i8, i8* %307, align 1
  %conv571 = sext i8 %308 to i32
  %tobool572 = icmp ne i32 %conv571, 0
  br i1 %tobool572, label %if.then573, label %if.end625

if.then573:                                       ; preds = %land.lhs.true570
  %309 = load i8*, i8** %var, align 4
  %call574 = call i32 @legal_identifier(i8* %309)
  %tobool575 = icmp ne i32 %call574, 0
  br i1 %tobool575, label %if.then576, label %if.else578

if.then576:                                       ; preds = %if.then573
  %310 = load i8*, i8** %var, align 4
  %311 = load i64, i64* @tw, align 8
  %call577 = call %struct.variable* @bind_var_to_int(i8* %310, i64 %311)
  br label %if.end624

if.else578:                                       ; preds = %if.then573
  %312 = load i8*, i8** %var, align 4
  call void @sh_invalidid(i8* %312)
  br label %do.body579

do.body579:                                       ; preds = %if.else578
  br label %do.body580

do.body580:                                       ; preds = %do.body579
  %313 = load volatile i32, i32* @terminating_signal, align 4
  %tobool581 = icmp ne i32 %313, 0
  br i1 %tobool581, label %if.then582, label %if.end583

if.then582:                                       ; preds = %do.body580
  %314 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %314)
  br label %if.end583

if.end583:                                        ; preds = %if.then582, %do.body580
  %315 = load volatile i32, i32* @interrupt_state, align 4
  %tobool584 = icmp ne i32 %315, 0
  br i1 %tobool584, label %if.then585, label %if.end586

if.then585:                                       ; preds = %if.end583
  call void @throw_to_top_level()
  br label %if.end586

if.end586:                                        ; preds = %if.then585, %if.end583
  br label %do.end587

do.end587:                                        ; preds = %if.end586
  %316 = load i32, i32* @vflag, align 4
  %tobool588 = icmp ne i32 %316, 0
  br i1 %tobool588, label %if.then589, label %if.end591

if.then589:                                       ; preds = %do.end587
  %317 = load i8*, i8** @vname, align 4
  %318 = load i8*, i8** @vbuf, align 4
  %call590 = call %struct.variable* @bind_printf_variable(i8* %317, i8* %318, i32 0)
  %319 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %319)
  br label %if.end591

if.end591:                                        ; preds = %if.then589, %do.end587
  %320 = load i32, i32* @conv_bufsize, align 4
  %cmp592 = icmp ugt i32 %320, 4096
  br i1 %cmp592, label %if.then594, label %if.end595

if.then594:                                       ; preds = %if.end591
  %321 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %321, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 531)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end595

if.end595:                                        ; preds = %if.then594, %if.end591
  %322 = load i32, i32* @vbsize, align 4
  %cmp596 = icmp ugt i32 %322, 4096
  br i1 %cmp596, label %if.then598, label %if.else599

if.then598:                                       ; preds = %if.end595
  %323 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %323, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 531)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end604

if.else599:                                       ; preds = %if.end595
  %324 = load i8*, i8** @vbuf, align 4
  %tobool600 = icmp ne i8* %324, null
  br i1 %tobool600, label %if.then601, label %if.end603

if.then601:                                       ; preds = %if.else599
  %325 = load i8*, i8** @vbuf, align 4
  %arrayidx602 = getelementptr inbounds i8, i8* %325, i32 0
  store i8 0, i8* %arrayidx602, align 1
  br label %if.end603

if.end603:                                        ; preds = %if.then601, %if.else599
  br label %if.end604

if.end604:                                        ; preds = %if.end603, %if.then598
  %326 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call605 = call i32 @ferror(%struct._IO_FILE* %326)
  %cmp606 = icmp eq i32 %call605, 0
  br i1 %cmp606, label %if.then608, label %if.end610

if.then608:                                       ; preds = %if.end604
  %327 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call609 = call i32 @fflush(%struct._IO_FILE* %327)
  br label %if.end610

if.end610:                                        ; preds = %if.then608, %if.end604
  br label %do.body611

do.body611:                                       ; preds = %if.end610
  %328 = load volatile i32, i32* @terminating_signal, align 4
  %tobool612 = icmp ne i32 %328, 0
  br i1 %tobool612, label %if.then613, label %if.end614

if.then613:                                       ; preds = %do.body611
  %329 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %329)
  br label %if.end614

if.end614:                                        ; preds = %if.then613, %do.body611
  %330 = load volatile i32, i32* @interrupt_state, align 4
  %tobool615 = icmp ne i32 %330, 0
  br i1 %tobool615, label %if.then616, label %if.end617

if.then616:                                       ; preds = %if.end614
  call void @throw_to_top_level()
  br label %if.end617

if.end617:                                        ; preds = %if.then616, %if.end614
  br label %do.end618

do.end618:                                        ; preds = %if.end617
  %331 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call619 = call i32 @ferror(%struct._IO_FILE* %331)
  %tobool620 = icmp ne i32 %call619, 0
  br i1 %tobool620, label %if.then621, label %if.end622

if.then621:                                       ; preds = %do.end618
  call void @sh_wrerror()
  %332 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %332)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end622:                                        ; preds = %do.end618
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end623:                                        ; No predecessors!
  br label %if.end624

if.end624:                                        ; preds = %do.end623, %if.then576
  br label %if.end625

if.end625:                                        ; preds = %if.end624, %land.lhs.true570, %sw.bb567
  br label %sw.epilog1149

sw.bb626:                                         ; preds = %do.end274
  %call628 = call i8* @getstr()
  store i8* %call628, i8** %p627, align 4
  store i32 0, i32* %r, align 4
  store i32 0, i32* %rlen, align 4
  store i32 0, i32* %ch, align 4
  %333 = load i8*, i8** %p627, align 4
  %334 = load i8*, i8** %p627, align 4
  %call629 = call i32 @strlen(i8* %334)
  %call630 = call i8* @bexpand(i8* %333, i32 %call629, i32* %ch, i32* %rlen)
  store i8* %call630, i8** %xp, align 4
  %335 = load i8*, i8** %xp, align 4
  %tobool631 = icmp ne i8* %335, null
  br i1 %tobool631, label %if.then632, label %if.end643

if.then632:                                       ; preds = %sw.bb626
  %336 = load i8*, i8** %start, align 4
  %337 = load i8*, i8** %xp, align 4
  %338 = load i32, i32* %rlen, align 4
  %339 = load i32, i32* %fieldwidth, align 4
  %340 = load i32, i32* %precision, align 4
  %call633 = call i32 @printstr(i8* %336, i8* %337, i32 %338, i32 %339, i32 %340)
  store i32 %call633, i32* %r, align 4
  %341 = load i32, i32* %r, align 4
  %cmp634 = icmp slt i32 %341, 0
  br i1 %cmp634, label %if.then636, label %if.end642

if.then636:                                       ; preds = %if.then632
  %342 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call637 = call i32 @ferror(%struct._IO_FILE* %342)
  %cmp638 = icmp eq i32 %call637, 0
  br i1 %cmp638, label %if.then640, label %if.end641

if.then640:                                       ; preds = %if.then636
  call void @sh_wrerror()
  %343 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %343)
  br label %if.end641

if.end641:                                        ; preds = %if.then640, %if.then636
  store i32 1, i32* @retval, align 4
  br label %if.end642

if.end642:                                        ; preds = %if.end641, %if.then632
  %344 = load i8*, i8** %xp, align 4
  call void @sh_xfree(i8* %344, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 560)
  br label %if.end643

if.end643:                                        ; preds = %if.end642, %sw.bb626
  %345 = load i32, i32* %ch, align 4
  %tobool644 = icmp ne i32 %345, 0
  br i1 %tobool644, label %if.then648, label %lor.lhs.false645

lor.lhs.false645:                                 ; preds = %if.end643
  %346 = load i32, i32* %r, align 4
  %cmp646 = icmp slt i32 %346, 0
  br i1 %cmp646, label %if.then648, label %if.end694

if.then648:                                       ; preds = %lor.lhs.false645, %if.end643
  br label %do.body649

do.body649:                                       ; preds = %if.then648
  br label %do.body650

do.body650:                                       ; preds = %do.body649
  %347 = load volatile i32, i32* @terminating_signal, align 4
  %tobool651 = icmp ne i32 %347, 0
  br i1 %tobool651, label %if.then652, label %if.end653

if.then652:                                       ; preds = %do.body650
  %348 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %348)
  br label %if.end653

if.end653:                                        ; preds = %if.then652, %do.body650
  %349 = load volatile i32, i32* @interrupt_state, align 4
  %tobool654 = icmp ne i32 %349, 0
  br i1 %tobool654, label %if.then655, label %if.end656

if.then655:                                       ; preds = %if.end653
  call void @throw_to_top_level()
  br label %if.end656

if.end656:                                        ; preds = %if.then655, %if.end653
  br label %do.end657

do.end657:                                        ; preds = %if.end656
  %350 = load i32, i32* @vflag, align 4
  %tobool658 = icmp ne i32 %350, 0
  br i1 %tobool658, label %if.then659, label %if.end661

if.then659:                                       ; preds = %do.end657
  %351 = load i8*, i8** @vname, align 4
  %352 = load i8*, i8** @vbuf, align 4
  %call660 = call %struct.variable* @bind_printf_variable(i8* %351, i8* %352, i32 0)
  %353 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %353)
  br label %if.end661

if.end661:                                        ; preds = %if.then659, %do.end657
  %354 = load i32, i32* @conv_bufsize, align 4
  %cmp662 = icmp ugt i32 %354, 4096
  br i1 %cmp662, label %if.then664, label %if.end665

if.then664:                                       ; preds = %if.end661
  %355 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %355, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 564)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end665

if.end665:                                        ; preds = %if.then664, %if.end661
  %356 = load i32, i32* @vbsize, align 4
  %cmp666 = icmp ugt i32 %356, 4096
  br i1 %cmp666, label %if.then668, label %if.else669

if.then668:                                       ; preds = %if.end665
  %357 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %357, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 564)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end674

if.else669:                                       ; preds = %if.end665
  %358 = load i8*, i8** @vbuf, align 4
  %tobool670 = icmp ne i8* %358, null
  br i1 %tobool670, label %if.then671, label %if.end673

if.then671:                                       ; preds = %if.else669
  %359 = load i8*, i8** @vbuf, align 4
  %arrayidx672 = getelementptr inbounds i8, i8* %359, i32 0
  store i8 0, i8* %arrayidx672, align 1
  br label %if.end673

if.end673:                                        ; preds = %if.then671, %if.else669
  br label %if.end674

if.end674:                                        ; preds = %if.end673, %if.then668
  %360 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call675 = call i32 @ferror(%struct._IO_FILE* %360)
  %cmp676 = icmp eq i32 %call675, 0
  br i1 %cmp676, label %if.then678, label %if.end680

if.then678:                                       ; preds = %if.end674
  %361 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call679 = call i32 @fflush(%struct._IO_FILE* %361)
  br label %if.end680

if.end680:                                        ; preds = %if.then678, %if.end674
  br label %do.body681

do.body681:                                       ; preds = %if.end680
  %362 = load volatile i32, i32* @terminating_signal, align 4
  %tobool682 = icmp ne i32 %362, 0
  br i1 %tobool682, label %if.then683, label %if.end684

if.then683:                                       ; preds = %do.body681
  %363 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %363)
  br label %if.end684

if.end684:                                        ; preds = %if.then683, %do.body681
  %364 = load volatile i32, i32* @interrupt_state, align 4
  %tobool685 = icmp ne i32 %364, 0
  br i1 %tobool685, label %if.then686, label %if.end687

if.then686:                                       ; preds = %if.end684
  call void @throw_to_top_level()
  br label %if.end687

if.end687:                                        ; preds = %if.then686, %if.end684
  br label %do.end688

do.end688:                                        ; preds = %if.end687
  %365 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call689 = call i32 @ferror(%struct._IO_FILE* %365)
  %tobool690 = icmp ne i32 %call689, 0
  br i1 %tobool690, label %if.then691, label %if.end692

if.then691:                                       ; preds = %do.end688
  call void @sh_wrerror()
  %366 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %366)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end692:                                        ; preds = %do.end688
  %367 = load i32, i32* @retval, align 4
  store i32 %367, i32* %retval, align 4
  br label %do.end1261

do.end693:                                        ; No predecessors!
  br label %if.end694

if.end694:                                        ; preds = %do.end693, %lor.lhs.false645
  br label %sw.epilog1149

sw.bb695:                                         ; preds = %do.end274
  store i32 0, i32* %r698, align 4
  %call699 = call i8* @getstr()
  store i8* %call699, i8** %p696, align 4
  %368 = load i8*, i8** %p696, align 4
  %tobool700 = icmp ne i8* %368, null
  br i1 %tobool700, label %land.lhs.true701, label %if.else708

land.lhs.true701:                                 ; preds = %sw.bb695
  %369 = load i8*, i8** %p696, align 4
  %370 = load i8, i8* %369, align 1
  %conv702 = sext i8 %370 to i32
  %cmp703 = icmp eq i32 %conv702, 0
  br i1 %cmp703, label %if.then705, label %if.else708

if.then705:                                       ; preds = %land.lhs.true701
  %call706 = call i8* @sh_xmalloc(i32 3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 576)
  %call707 = call i8* @strcpy(i8* %call706, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  store i8* %call707, i8** %xp697, align 4
  br label %if.end716

if.else708:                                       ; preds = %land.lhs.true701, %sw.bb695
  %371 = load i8*, i8** %p696, align 4
  %call709 = call i32 @ansic_shouldquote(i8* %371)
  %tobool710 = icmp ne i32 %call709, 0
  br i1 %tobool710, label %if.then711, label %if.else713

if.then711:                                       ; preds = %if.else708
  %372 = load i8*, i8** %p696, align 4
  %call712 = call i8* @ansic_quote(i8* %372, i32 0, i32* null)
  store i8* %call712, i8** %xp697, align 4
  br label %if.end715

if.else713:                                       ; preds = %if.else708
  %373 = load i8*, i8** %p696, align 4
  %call714 = call i8* @sh_backslash_quote(i8* %373, i8* null, i32 1)
  store i8* %call714, i8** %xp697, align 4
  br label %if.end715

if.end715:                                        ; preds = %if.else713, %if.then711
  br label %if.end716

if.end716:                                        ; preds = %if.end715, %if.then705
  %374 = load i8*, i8** %xp697, align 4
  %tobool717 = icmp ne i8* %374, null
  br i1 %tobool717, label %if.then718, label %if.end725

if.then718:                                       ; preds = %if.end716
  %375 = load i8*, i8** %start, align 4
  %376 = load i8*, i8** %xp697, align 4
  %377 = load i8*, i8** %xp697, align 4
  %call719 = call i32 @strlen(i8* %377)
  %378 = load i32, i32* %fieldwidth, align 4
  %379 = load i32, i32* %precision, align 4
  %call720 = call i32 @printstr(i8* %375, i8* %376, i32 %call719, i32 %378, i32 %379)
  store i32 %call720, i32* %r698, align 4
  %380 = load i32, i32* %r698, align 4
  %cmp721 = icmp slt i32 %380, 0
  br i1 %cmp721, label %if.then723, label %if.end724

if.then723:                                       ; preds = %if.then718
  call void @sh_wrerror()
  %381 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %381)
  br label %if.end724

if.end724:                                        ; preds = %if.then723, %if.then718
  %382 = load i8*, i8** %xp697, align 4
  call void @sh_xfree(i8* %382, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 590)
  br label %if.end725

if.end725:                                        ; preds = %if.end724, %if.end716
  %383 = load i32, i32* %r698, align 4
  %cmp726 = icmp slt i32 %383, 0
  br i1 %cmp726, label %if.then728, label %if.end774

if.then728:                                       ; preds = %if.end725
  br label %do.body729

do.body729:                                       ; preds = %if.then728
  br label %do.body730

do.body730:                                       ; preds = %do.body729
  %384 = load volatile i32, i32* @terminating_signal, align 4
  %tobool731 = icmp ne i32 %384, 0
  br i1 %tobool731, label %if.then732, label %if.end733

if.then732:                                       ; preds = %do.body730
  %385 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %385)
  br label %if.end733

if.end733:                                        ; preds = %if.then732, %do.body730
  %386 = load volatile i32, i32* @interrupt_state, align 4
  %tobool734 = icmp ne i32 %386, 0
  br i1 %tobool734, label %if.then735, label %if.end736

if.then735:                                       ; preds = %if.end733
  call void @throw_to_top_level()
  br label %if.end736

if.end736:                                        ; preds = %if.then735, %if.end733
  br label %do.end737

do.end737:                                        ; preds = %if.end736
  %387 = load i32, i32* @vflag, align 4
  %tobool738 = icmp ne i32 %387, 0
  br i1 %tobool738, label %if.then739, label %if.end741

if.then739:                                       ; preds = %do.end737
  %388 = load i8*, i8** @vname, align 4
  %389 = load i8*, i8** @vbuf, align 4
  %call740 = call %struct.variable* @bind_printf_variable(i8* %388, i8* %389, i32 0)
  %390 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %390)
  br label %if.end741

if.end741:                                        ; preds = %if.then739, %do.end737
  %391 = load i32, i32* @conv_bufsize, align 4
  %cmp742 = icmp ugt i32 %391, 4096
  br i1 %cmp742, label %if.then744, label %if.end745

if.then744:                                       ; preds = %if.end741
  %392 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %392, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 594)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end745

if.end745:                                        ; preds = %if.then744, %if.end741
  %393 = load i32, i32* @vbsize, align 4
  %cmp746 = icmp ugt i32 %393, 4096
  br i1 %cmp746, label %if.then748, label %if.else749

if.then748:                                       ; preds = %if.end745
  %394 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %394, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 594)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end754

if.else749:                                       ; preds = %if.end745
  %395 = load i8*, i8** @vbuf, align 4
  %tobool750 = icmp ne i8* %395, null
  br i1 %tobool750, label %if.then751, label %if.end753

if.then751:                                       ; preds = %if.else749
  %396 = load i8*, i8** @vbuf, align 4
  %arrayidx752 = getelementptr inbounds i8, i8* %396, i32 0
  store i8 0, i8* %arrayidx752, align 1
  br label %if.end753

if.end753:                                        ; preds = %if.then751, %if.else749
  br label %if.end754

if.end754:                                        ; preds = %if.end753, %if.then748
  %397 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call755 = call i32 @ferror(%struct._IO_FILE* %397)
  %cmp756 = icmp eq i32 %call755, 0
  br i1 %cmp756, label %if.then758, label %if.end760

if.then758:                                       ; preds = %if.end754
  %398 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call759 = call i32 @fflush(%struct._IO_FILE* %398)
  br label %if.end760

if.end760:                                        ; preds = %if.then758, %if.end754
  br label %do.body761

do.body761:                                       ; preds = %if.end760
  %399 = load volatile i32, i32* @terminating_signal, align 4
  %tobool762 = icmp ne i32 %399, 0
  br i1 %tobool762, label %if.then763, label %if.end764

if.then763:                                       ; preds = %do.body761
  %400 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %400)
  br label %if.end764

if.end764:                                        ; preds = %if.then763, %do.body761
  %401 = load volatile i32, i32* @interrupt_state, align 4
  %tobool765 = icmp ne i32 %401, 0
  br i1 %tobool765, label %if.then766, label %if.end767

if.then766:                                       ; preds = %if.end764
  call void @throw_to_top_level()
  br label %if.end767

if.end767:                                        ; preds = %if.then766, %if.end764
  br label %do.end768

do.end768:                                        ; preds = %if.end767
  %402 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call769 = call i32 @ferror(%struct._IO_FILE* %402)
  %tobool770 = icmp ne i32 %call769, 0
  br i1 %tobool770, label %if.then771, label %if.end772

if.then771:                                       ; preds = %do.end768
  call void @sh_wrerror()
  %403 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %403)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end772:                                        ; preds = %do.end768
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end773:                                        ; No predecessors!
  br label %if.end774

if.end774:                                        ; preds = %do.end773, %if.end725
  br label %sw.epilog1149

sw.bb775:                                         ; preds = %do.end274, %do.end274
  %call777 = call i64 @getintmax()
  store i64 %call777, i64* %pp, align 8
  %conv778 = trunc i64 %call777 to i32
  store i32 %conv778, i32* %p776, align 4
  %404 = load i32, i32* %p776, align 4
  %conv779 = sext i32 %404 to i64
  %405 = load i64, i64* %pp, align 8
  %cmp780 = icmp ne i64 %conv779, %405
  br i1 %cmp780, label %if.then782, label %if.else843

if.then782:                                       ; preds = %sw.bb775
  %406 = load i8*, i8** %start, align 4
  %call783 = call i8* @mklong(i8* %406, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 2)
  store i8* %call783, i8** %f, align 4
  br label %do.body784

do.body784:                                       ; preds = %if.then782
  %407 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %407)
  %408 = load i32, i32* %have_fieldwidth, align 4
  %tobool786 = icmp ne i32 %408, 0
  br i1 %tobool786, label %land.lhs.true787, label %if.else797

land.lhs.true787:                                 ; preds = %do.body784
  %409 = load i32, i32* %have_precision, align 4
  %tobool788 = icmp ne i32 %409, 0
  br i1 %tobool788, label %if.then789, label %if.else797

if.then789:                                       ; preds = %land.lhs.true787
  %410 = load i32, i32* @vflag, align 4
  %tobool790 = icmp ne i32 %410, 0
  br i1 %tobool790, label %cond.true791, label %cond.false793

cond.true791:                                     ; preds = %if.then789
  %411 = load i8*, i8** %f, align 4
  %412 = load i32, i32* %fieldwidth, align 4
  %413 = load i32, i32* %precision, align 4
  %414 = load i64, i64* %pp, align 8
  %call792 = call i32 (i8*, ...) @vbprintf(i8* %411, i32 %412, i32 %413, i64 %414)
  br label %cond.end795

cond.false793:                                    ; preds = %if.then789
  %415 = load i8*, i8** %f, align 4
  %416 = load i32, i32* %fieldwidth, align 4
  %417 = load i32, i32* %precision, align 4
  %418 = load i64, i64* %pp, align 8
  %call794 = call i32 (i8*, ...) @printf(i8* %415, i32 %416, i32 %417, i64 %418)
  br label %cond.end795

cond.end795:                                      ; preds = %cond.false793, %cond.true791
  %cond796 = phi i32 [ %call792, %cond.true791 ], [ %call794, %cond.false793 ]
  store i32 %cond796, i32* %nw785, align 4
  br label %if.end827

if.else797:                                       ; preds = %land.lhs.true787, %do.body784
  %419 = load i32, i32* %have_fieldwidth, align 4
  %tobool798 = icmp ne i32 %419, 0
  br i1 %tobool798, label %if.then799, label %if.else807

if.then799:                                       ; preds = %if.else797
  %420 = load i32, i32* @vflag, align 4
  %tobool800 = icmp ne i32 %420, 0
  br i1 %tobool800, label %cond.true801, label %cond.false803

cond.true801:                                     ; preds = %if.then799
  %421 = load i8*, i8** %f, align 4
  %422 = load i32, i32* %fieldwidth, align 4
  %423 = load i64, i64* %pp, align 8
  %call802 = call i32 (i8*, ...) @vbprintf(i8* %421, i32 %422, i64 %423)
  br label %cond.end805

cond.false803:                                    ; preds = %if.then799
  %424 = load i8*, i8** %f, align 4
  %425 = load i32, i32* %fieldwidth, align 4
  %426 = load i64, i64* %pp, align 8
  %call804 = call i32 (i8*, ...) @printf(i8* %424, i32 %425, i64 %426)
  br label %cond.end805

cond.end805:                                      ; preds = %cond.false803, %cond.true801
  %cond806 = phi i32 [ %call802, %cond.true801 ], [ %call804, %cond.false803 ]
  store i32 %cond806, i32* %nw785, align 4
  br label %if.end826

if.else807:                                       ; preds = %if.else797
  %427 = load i32, i32* %have_precision, align 4
  %tobool808 = icmp ne i32 %427, 0
  br i1 %tobool808, label %if.then809, label %if.else817

if.then809:                                       ; preds = %if.else807
  %428 = load i32, i32* @vflag, align 4
  %tobool810 = icmp ne i32 %428, 0
  br i1 %tobool810, label %cond.true811, label %cond.false813

cond.true811:                                     ; preds = %if.then809
  %429 = load i8*, i8** %f, align 4
  %430 = load i32, i32* %precision, align 4
  %431 = load i64, i64* %pp, align 8
  %call812 = call i32 (i8*, ...) @vbprintf(i8* %429, i32 %430, i64 %431)
  br label %cond.end815

cond.false813:                                    ; preds = %if.then809
  %432 = load i8*, i8** %f, align 4
  %433 = load i32, i32* %precision, align 4
  %434 = load i64, i64* %pp, align 8
  %call814 = call i32 (i8*, ...) @printf(i8* %432, i32 %433, i64 %434)
  br label %cond.end815

cond.end815:                                      ; preds = %cond.false813, %cond.true811
  %cond816 = phi i32 [ %call812, %cond.true811 ], [ %call814, %cond.false813 ]
  store i32 %cond816, i32* %nw785, align 4
  br label %if.end825

if.else817:                                       ; preds = %if.else807
  %435 = load i32, i32* @vflag, align 4
  %tobool818 = icmp ne i32 %435, 0
  br i1 %tobool818, label %cond.true819, label %cond.false821

cond.true819:                                     ; preds = %if.else817
  %436 = load i8*, i8** %f, align 4
  %437 = load i64, i64* %pp, align 8
  %call820 = call i32 (i8*, ...) @vbprintf(i8* %436, i64 %437)
  br label %cond.end823

cond.false821:                                    ; preds = %if.else817
  %438 = load i8*, i8** %f, align 4
  %439 = load i64, i64* %pp, align 8
  %call822 = call i32 (i8*, ...) @printf(i8* %438, i64 %439)
  br label %cond.end823

cond.end823:                                      ; preds = %cond.false821, %cond.true819
  %cond824 = phi i32 [ %call820, %cond.true819 ], [ %call822, %cond.false821 ]
  store i32 %cond824, i32* %nw785, align 4
  br label %if.end825

if.end825:                                        ; preds = %cond.end823, %cond.end815
  br label %if.end826

if.end826:                                        ; preds = %if.end825, %cond.end805
  br label %if.end827

if.end827:                                        ; preds = %if.end826, %cond.end795
  %440 = load i32, i32* %nw785, align 4
  %conv828 = sext i32 %440 to i64
  %441 = load i64, i64* @tw, align 8
  %add829 = add nsw i64 %441, %conv828
  store i64 %add829, i64* @tw, align 8
  br label %do.body830

do.body830:                                       ; preds = %if.end827
  %442 = load volatile i32, i32* @terminating_signal, align 4
  %tobool831 = icmp ne i32 %442, 0
  br i1 %tobool831, label %if.then832, label %if.end833

if.then832:                                       ; preds = %do.body830
  %443 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %443)
  br label %if.end833

if.end833:                                        ; preds = %if.then832, %do.body830
  %444 = load volatile i32, i32* @interrupt_state, align 4
  %tobool834 = icmp ne i32 %444, 0
  br i1 %tobool834, label %if.then835, label %if.end836

if.then835:                                       ; preds = %if.end833
  call void @throw_to_top_level()
  br label %if.end836

if.end836:                                        ; preds = %if.then835, %if.end833
  br label %do.end837

do.end837:                                        ; preds = %if.end836
  %445 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call838 = call i32 @ferror(%struct._IO_FILE* %445)
  %tobool839 = icmp ne i32 %call838, 0
  br i1 %tobool839, label %if.then840, label %if.end841

if.then840:                                       ; preds = %do.end837
  call void @sh_wrerror()
  %446 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %446)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end841:                                        ; preds = %do.end837
  br label %do.end842

do.end842:                                        ; preds = %if.end841
  br label %if.end904

if.else843:                                       ; preds = %sw.bb775
  %447 = load i8*, i8** %start, align 4
  %call844 = call i8* @mklong(i8* %447, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i32 1)
  store i8* %call844, i8** %f, align 4
  br label %do.body845

do.body845:                                       ; preds = %if.else843
  %448 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %448)
  %449 = load i32, i32* %have_fieldwidth, align 4
  %tobool847 = icmp ne i32 %449, 0
  br i1 %tobool847, label %land.lhs.true848, label %if.else858

land.lhs.true848:                                 ; preds = %do.body845
  %450 = load i32, i32* %have_precision, align 4
  %tobool849 = icmp ne i32 %450, 0
  br i1 %tobool849, label %if.then850, label %if.else858

if.then850:                                       ; preds = %land.lhs.true848
  %451 = load i32, i32* @vflag, align 4
  %tobool851 = icmp ne i32 %451, 0
  br i1 %tobool851, label %cond.true852, label %cond.false854

cond.true852:                                     ; preds = %if.then850
  %452 = load i8*, i8** %f, align 4
  %453 = load i32, i32* %fieldwidth, align 4
  %454 = load i32, i32* %precision, align 4
  %455 = load i32, i32* %p776, align 4
  %call853 = call i32 (i8*, ...) @vbprintf(i8* %452, i32 %453, i32 %454, i32 %455)
  br label %cond.end856

cond.false854:                                    ; preds = %if.then850
  %456 = load i8*, i8** %f, align 4
  %457 = load i32, i32* %fieldwidth, align 4
  %458 = load i32, i32* %precision, align 4
  %459 = load i32, i32* %p776, align 4
  %call855 = call i32 (i8*, ...) @printf(i8* %456, i32 %457, i32 %458, i32 %459)
  br label %cond.end856

cond.end856:                                      ; preds = %cond.false854, %cond.true852
  %cond857 = phi i32 [ %call853, %cond.true852 ], [ %call855, %cond.false854 ]
  store i32 %cond857, i32* %nw846, align 4
  br label %if.end888

if.else858:                                       ; preds = %land.lhs.true848, %do.body845
  %460 = load i32, i32* %have_fieldwidth, align 4
  %tobool859 = icmp ne i32 %460, 0
  br i1 %tobool859, label %if.then860, label %if.else868

if.then860:                                       ; preds = %if.else858
  %461 = load i32, i32* @vflag, align 4
  %tobool861 = icmp ne i32 %461, 0
  br i1 %tobool861, label %cond.true862, label %cond.false864

cond.true862:                                     ; preds = %if.then860
  %462 = load i8*, i8** %f, align 4
  %463 = load i32, i32* %fieldwidth, align 4
  %464 = load i32, i32* %p776, align 4
  %call863 = call i32 (i8*, ...) @vbprintf(i8* %462, i32 %463, i32 %464)
  br label %cond.end866

cond.false864:                                    ; preds = %if.then860
  %465 = load i8*, i8** %f, align 4
  %466 = load i32, i32* %fieldwidth, align 4
  %467 = load i32, i32* %p776, align 4
  %call865 = call i32 (i8*, ...) @printf(i8* %465, i32 %466, i32 %467)
  br label %cond.end866

cond.end866:                                      ; preds = %cond.false864, %cond.true862
  %cond867 = phi i32 [ %call863, %cond.true862 ], [ %call865, %cond.false864 ]
  store i32 %cond867, i32* %nw846, align 4
  br label %if.end887

if.else868:                                       ; preds = %if.else858
  %468 = load i32, i32* %have_precision, align 4
  %tobool869 = icmp ne i32 %468, 0
  br i1 %tobool869, label %if.then870, label %if.else878

if.then870:                                       ; preds = %if.else868
  %469 = load i32, i32* @vflag, align 4
  %tobool871 = icmp ne i32 %469, 0
  br i1 %tobool871, label %cond.true872, label %cond.false874

cond.true872:                                     ; preds = %if.then870
  %470 = load i8*, i8** %f, align 4
  %471 = load i32, i32* %precision, align 4
  %472 = load i32, i32* %p776, align 4
  %call873 = call i32 (i8*, ...) @vbprintf(i8* %470, i32 %471, i32 %472)
  br label %cond.end876

cond.false874:                                    ; preds = %if.then870
  %473 = load i8*, i8** %f, align 4
  %474 = load i32, i32* %precision, align 4
  %475 = load i32, i32* %p776, align 4
  %call875 = call i32 (i8*, ...) @printf(i8* %473, i32 %474, i32 %475)
  br label %cond.end876

cond.end876:                                      ; preds = %cond.false874, %cond.true872
  %cond877 = phi i32 [ %call873, %cond.true872 ], [ %call875, %cond.false874 ]
  store i32 %cond877, i32* %nw846, align 4
  br label %if.end886

if.else878:                                       ; preds = %if.else868
  %476 = load i32, i32* @vflag, align 4
  %tobool879 = icmp ne i32 %476, 0
  br i1 %tobool879, label %cond.true880, label %cond.false882

cond.true880:                                     ; preds = %if.else878
  %477 = load i8*, i8** %f, align 4
  %478 = load i32, i32* %p776, align 4
  %call881 = call i32 (i8*, ...) @vbprintf(i8* %477, i32 %478)
  br label %cond.end884

cond.false882:                                    ; preds = %if.else878
  %479 = load i8*, i8** %f, align 4
  %480 = load i32, i32* %p776, align 4
  %call883 = call i32 (i8*, ...) @printf(i8* %479, i32 %480)
  br label %cond.end884

cond.end884:                                      ; preds = %cond.false882, %cond.true880
  %cond885 = phi i32 [ %call881, %cond.true880 ], [ %call883, %cond.false882 ]
  store i32 %cond885, i32* %nw846, align 4
  br label %if.end886

if.end886:                                        ; preds = %cond.end884, %cond.end876
  br label %if.end887

if.end887:                                        ; preds = %if.end886, %cond.end866
  br label %if.end888

if.end888:                                        ; preds = %if.end887, %cond.end856
  %481 = load i32, i32* %nw846, align 4
  %conv889 = sext i32 %481 to i64
  %482 = load i64, i64* @tw, align 8
  %add890 = add nsw i64 %482, %conv889
  store i64 %add890, i64* @tw, align 8
  br label %do.body891

do.body891:                                       ; preds = %if.end888
  %483 = load volatile i32, i32* @terminating_signal, align 4
  %tobool892 = icmp ne i32 %483, 0
  br i1 %tobool892, label %if.then893, label %if.end894

if.then893:                                       ; preds = %do.body891
  %484 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %484)
  br label %if.end894

if.end894:                                        ; preds = %if.then893, %do.body891
  %485 = load volatile i32, i32* @interrupt_state, align 4
  %tobool895 = icmp ne i32 %485, 0
  br i1 %tobool895, label %if.then896, label %if.end897

if.then896:                                       ; preds = %if.end894
  call void @throw_to_top_level()
  br label %if.end897

if.end897:                                        ; preds = %if.then896, %if.end894
  br label %do.end898

do.end898:                                        ; preds = %if.end897
  %486 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call899 = call i32 @ferror(%struct._IO_FILE* %486)
  %tobool900 = icmp ne i32 %call899, 0
  br i1 %tobool900, label %if.then901, label %if.end902

if.then901:                                       ; preds = %do.end898
  call void @sh_wrerror()
  %487 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %487)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end902:                                        ; preds = %do.end898
  br label %do.end903

do.end903:                                        ; preds = %if.end902
  br label %if.end904

if.end904:                                        ; preds = %do.end903, %do.end842
  br label %sw.epilog1149

sw.bb905:                                         ; preds = %do.end274, %do.end274, %do.end274, %do.end274
  %call909 = call i64 @getuintmax()
  store i64 %call909, i64* %pp908, align 8
  %conv910 = trunc i64 %call909 to i32
  store i32 %conv910, i32* %p907, align 4
  %488 = load i32, i32* %p907, align 4
  %conv911 = zext i32 %488 to i64
  %489 = load i64, i64* %pp908, align 8
  %cmp912 = icmp ne i64 %conv911, %489
  br i1 %cmp912, label %if.then914, label %if.else975

if.then914:                                       ; preds = %sw.bb905
  %490 = load i8*, i8** %start, align 4
  %call915 = call i8* @mklong(i8* %490, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i32 2)
  store i8* %call915, i8** %f906, align 4
  br label %do.body916

do.body916:                                       ; preds = %if.then914
  %491 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %491)
  %492 = load i32, i32* %have_fieldwidth, align 4
  %tobool918 = icmp ne i32 %492, 0
  br i1 %tobool918, label %land.lhs.true919, label %if.else929

land.lhs.true919:                                 ; preds = %do.body916
  %493 = load i32, i32* %have_precision, align 4
  %tobool920 = icmp ne i32 %493, 0
  br i1 %tobool920, label %if.then921, label %if.else929

if.then921:                                       ; preds = %land.lhs.true919
  %494 = load i32, i32* @vflag, align 4
  %tobool922 = icmp ne i32 %494, 0
  br i1 %tobool922, label %cond.true923, label %cond.false925

cond.true923:                                     ; preds = %if.then921
  %495 = load i8*, i8** %f906, align 4
  %496 = load i32, i32* %fieldwidth, align 4
  %497 = load i32, i32* %precision, align 4
  %498 = load i64, i64* %pp908, align 8
  %call924 = call i32 (i8*, ...) @vbprintf(i8* %495, i32 %496, i32 %497, i64 %498)
  br label %cond.end927

cond.false925:                                    ; preds = %if.then921
  %499 = load i8*, i8** %f906, align 4
  %500 = load i32, i32* %fieldwidth, align 4
  %501 = load i32, i32* %precision, align 4
  %502 = load i64, i64* %pp908, align 8
  %call926 = call i32 (i8*, ...) @printf(i8* %499, i32 %500, i32 %501, i64 %502)
  br label %cond.end927

cond.end927:                                      ; preds = %cond.false925, %cond.true923
  %cond928 = phi i32 [ %call924, %cond.true923 ], [ %call926, %cond.false925 ]
  store i32 %cond928, i32* %nw917, align 4
  br label %if.end959

if.else929:                                       ; preds = %land.lhs.true919, %do.body916
  %503 = load i32, i32* %have_fieldwidth, align 4
  %tobool930 = icmp ne i32 %503, 0
  br i1 %tobool930, label %if.then931, label %if.else939

if.then931:                                       ; preds = %if.else929
  %504 = load i32, i32* @vflag, align 4
  %tobool932 = icmp ne i32 %504, 0
  br i1 %tobool932, label %cond.true933, label %cond.false935

cond.true933:                                     ; preds = %if.then931
  %505 = load i8*, i8** %f906, align 4
  %506 = load i32, i32* %fieldwidth, align 4
  %507 = load i64, i64* %pp908, align 8
  %call934 = call i32 (i8*, ...) @vbprintf(i8* %505, i32 %506, i64 %507)
  br label %cond.end937

cond.false935:                                    ; preds = %if.then931
  %508 = load i8*, i8** %f906, align 4
  %509 = load i32, i32* %fieldwidth, align 4
  %510 = load i64, i64* %pp908, align 8
  %call936 = call i32 (i8*, ...) @printf(i8* %508, i32 %509, i64 %510)
  br label %cond.end937

cond.end937:                                      ; preds = %cond.false935, %cond.true933
  %cond938 = phi i32 [ %call934, %cond.true933 ], [ %call936, %cond.false935 ]
  store i32 %cond938, i32* %nw917, align 4
  br label %if.end958

if.else939:                                       ; preds = %if.else929
  %511 = load i32, i32* %have_precision, align 4
  %tobool940 = icmp ne i32 %511, 0
  br i1 %tobool940, label %if.then941, label %if.else949

if.then941:                                       ; preds = %if.else939
  %512 = load i32, i32* @vflag, align 4
  %tobool942 = icmp ne i32 %512, 0
  br i1 %tobool942, label %cond.true943, label %cond.false945

cond.true943:                                     ; preds = %if.then941
  %513 = load i8*, i8** %f906, align 4
  %514 = load i32, i32* %precision, align 4
  %515 = load i64, i64* %pp908, align 8
  %call944 = call i32 (i8*, ...) @vbprintf(i8* %513, i32 %514, i64 %515)
  br label %cond.end947

cond.false945:                                    ; preds = %if.then941
  %516 = load i8*, i8** %f906, align 4
  %517 = load i32, i32* %precision, align 4
  %518 = load i64, i64* %pp908, align 8
  %call946 = call i32 (i8*, ...) @printf(i8* %516, i32 %517, i64 %518)
  br label %cond.end947

cond.end947:                                      ; preds = %cond.false945, %cond.true943
  %cond948 = phi i32 [ %call944, %cond.true943 ], [ %call946, %cond.false945 ]
  store i32 %cond948, i32* %nw917, align 4
  br label %if.end957

if.else949:                                       ; preds = %if.else939
  %519 = load i32, i32* @vflag, align 4
  %tobool950 = icmp ne i32 %519, 0
  br i1 %tobool950, label %cond.true951, label %cond.false953

cond.true951:                                     ; preds = %if.else949
  %520 = load i8*, i8** %f906, align 4
  %521 = load i64, i64* %pp908, align 8
  %call952 = call i32 (i8*, ...) @vbprintf(i8* %520, i64 %521)
  br label %cond.end955

cond.false953:                                    ; preds = %if.else949
  %522 = load i8*, i8** %f906, align 4
  %523 = load i64, i64* %pp908, align 8
  %call954 = call i32 (i8*, ...) @printf(i8* %522, i64 %523)
  br label %cond.end955

cond.end955:                                      ; preds = %cond.false953, %cond.true951
  %cond956 = phi i32 [ %call952, %cond.true951 ], [ %call954, %cond.false953 ]
  store i32 %cond956, i32* %nw917, align 4
  br label %if.end957

if.end957:                                        ; preds = %cond.end955, %cond.end947
  br label %if.end958

if.end958:                                        ; preds = %if.end957, %cond.end937
  br label %if.end959

if.end959:                                        ; preds = %if.end958, %cond.end927
  %524 = load i32, i32* %nw917, align 4
  %conv960 = sext i32 %524 to i64
  %525 = load i64, i64* @tw, align 8
  %add961 = add nsw i64 %525, %conv960
  store i64 %add961, i64* @tw, align 8
  br label %do.body962

do.body962:                                       ; preds = %if.end959
  %526 = load volatile i32, i32* @terminating_signal, align 4
  %tobool963 = icmp ne i32 %526, 0
  br i1 %tobool963, label %if.then964, label %if.end965

if.then964:                                       ; preds = %do.body962
  %527 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %527)
  br label %if.end965

if.end965:                                        ; preds = %if.then964, %do.body962
  %528 = load volatile i32, i32* @interrupt_state, align 4
  %tobool966 = icmp ne i32 %528, 0
  br i1 %tobool966, label %if.then967, label %if.end968

if.then967:                                       ; preds = %if.end965
  call void @throw_to_top_level()
  br label %if.end968

if.end968:                                        ; preds = %if.then967, %if.end965
  br label %do.end969

do.end969:                                        ; preds = %if.end968
  %529 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call970 = call i32 @ferror(%struct._IO_FILE* %529)
  %tobool971 = icmp ne i32 %call970, 0
  br i1 %tobool971, label %if.then972, label %if.end973

if.then972:                                       ; preds = %do.end969
  call void @sh_wrerror()
  %530 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %530)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end973:                                        ; preds = %do.end969
  br label %do.end974

do.end974:                                        ; preds = %if.end973
  br label %if.end1036

if.else975:                                       ; preds = %sw.bb905
  %531 = load i8*, i8** %start, align 4
  %call976 = call i8* @mklong(i8* %531, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0), i32 1)
  store i8* %call976, i8** %f906, align 4
  br label %do.body977

do.body977:                                       ; preds = %if.else975
  %532 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %532)
  %533 = load i32, i32* %have_fieldwidth, align 4
  %tobool979 = icmp ne i32 %533, 0
  br i1 %tobool979, label %land.lhs.true980, label %if.else990

land.lhs.true980:                                 ; preds = %do.body977
  %534 = load i32, i32* %have_precision, align 4
  %tobool981 = icmp ne i32 %534, 0
  br i1 %tobool981, label %if.then982, label %if.else990

if.then982:                                       ; preds = %land.lhs.true980
  %535 = load i32, i32* @vflag, align 4
  %tobool983 = icmp ne i32 %535, 0
  br i1 %tobool983, label %cond.true984, label %cond.false986

cond.true984:                                     ; preds = %if.then982
  %536 = load i8*, i8** %f906, align 4
  %537 = load i32, i32* %fieldwidth, align 4
  %538 = load i32, i32* %precision, align 4
  %539 = load i32, i32* %p907, align 4
  %call985 = call i32 (i8*, ...) @vbprintf(i8* %536, i32 %537, i32 %538, i32 %539)
  br label %cond.end988

cond.false986:                                    ; preds = %if.then982
  %540 = load i8*, i8** %f906, align 4
  %541 = load i32, i32* %fieldwidth, align 4
  %542 = load i32, i32* %precision, align 4
  %543 = load i32, i32* %p907, align 4
  %call987 = call i32 (i8*, ...) @printf(i8* %540, i32 %541, i32 %542, i32 %543)
  br label %cond.end988

cond.end988:                                      ; preds = %cond.false986, %cond.true984
  %cond989 = phi i32 [ %call985, %cond.true984 ], [ %call987, %cond.false986 ]
  store i32 %cond989, i32* %nw978, align 4
  br label %if.end1020

if.else990:                                       ; preds = %land.lhs.true980, %do.body977
  %544 = load i32, i32* %have_fieldwidth, align 4
  %tobool991 = icmp ne i32 %544, 0
  br i1 %tobool991, label %if.then992, label %if.else1000

if.then992:                                       ; preds = %if.else990
  %545 = load i32, i32* @vflag, align 4
  %tobool993 = icmp ne i32 %545, 0
  br i1 %tobool993, label %cond.true994, label %cond.false996

cond.true994:                                     ; preds = %if.then992
  %546 = load i8*, i8** %f906, align 4
  %547 = load i32, i32* %fieldwidth, align 4
  %548 = load i32, i32* %p907, align 4
  %call995 = call i32 (i8*, ...) @vbprintf(i8* %546, i32 %547, i32 %548)
  br label %cond.end998

cond.false996:                                    ; preds = %if.then992
  %549 = load i8*, i8** %f906, align 4
  %550 = load i32, i32* %fieldwidth, align 4
  %551 = load i32, i32* %p907, align 4
  %call997 = call i32 (i8*, ...) @printf(i8* %549, i32 %550, i32 %551)
  br label %cond.end998

cond.end998:                                      ; preds = %cond.false996, %cond.true994
  %cond999 = phi i32 [ %call995, %cond.true994 ], [ %call997, %cond.false996 ]
  store i32 %cond999, i32* %nw978, align 4
  br label %if.end1019

if.else1000:                                      ; preds = %if.else990
  %552 = load i32, i32* %have_precision, align 4
  %tobool1001 = icmp ne i32 %552, 0
  br i1 %tobool1001, label %if.then1002, label %if.else1010

if.then1002:                                      ; preds = %if.else1000
  %553 = load i32, i32* @vflag, align 4
  %tobool1003 = icmp ne i32 %553, 0
  br i1 %tobool1003, label %cond.true1004, label %cond.false1006

cond.true1004:                                    ; preds = %if.then1002
  %554 = load i8*, i8** %f906, align 4
  %555 = load i32, i32* %precision, align 4
  %556 = load i32, i32* %p907, align 4
  %call1005 = call i32 (i8*, ...) @vbprintf(i8* %554, i32 %555, i32 %556)
  br label %cond.end1008

cond.false1006:                                   ; preds = %if.then1002
  %557 = load i8*, i8** %f906, align 4
  %558 = load i32, i32* %precision, align 4
  %559 = load i32, i32* %p907, align 4
  %call1007 = call i32 (i8*, ...) @printf(i8* %557, i32 %558, i32 %559)
  br label %cond.end1008

cond.end1008:                                     ; preds = %cond.false1006, %cond.true1004
  %cond1009 = phi i32 [ %call1005, %cond.true1004 ], [ %call1007, %cond.false1006 ]
  store i32 %cond1009, i32* %nw978, align 4
  br label %if.end1018

if.else1010:                                      ; preds = %if.else1000
  %560 = load i32, i32* @vflag, align 4
  %tobool1011 = icmp ne i32 %560, 0
  br i1 %tobool1011, label %cond.true1012, label %cond.false1014

cond.true1012:                                    ; preds = %if.else1010
  %561 = load i8*, i8** %f906, align 4
  %562 = load i32, i32* %p907, align 4
  %call1013 = call i32 (i8*, ...) @vbprintf(i8* %561, i32 %562)
  br label %cond.end1016

cond.false1014:                                   ; preds = %if.else1010
  %563 = load i8*, i8** %f906, align 4
  %564 = load i32, i32* %p907, align 4
  %call1015 = call i32 (i8*, ...) @printf(i8* %563, i32 %564)
  br label %cond.end1016

cond.end1016:                                     ; preds = %cond.false1014, %cond.true1012
  %cond1017 = phi i32 [ %call1013, %cond.true1012 ], [ %call1015, %cond.false1014 ]
  store i32 %cond1017, i32* %nw978, align 4
  br label %if.end1018

if.end1018:                                       ; preds = %cond.end1016, %cond.end1008
  br label %if.end1019

if.end1019:                                       ; preds = %if.end1018, %cond.end998
  br label %if.end1020

if.end1020:                                       ; preds = %if.end1019, %cond.end988
  %565 = load i32, i32* %nw978, align 4
  %conv1021 = sext i32 %565 to i64
  %566 = load i64, i64* @tw, align 8
  %add1022 = add nsw i64 %566, %conv1021
  store i64 %add1022, i64* @tw, align 8
  br label %do.body1023

do.body1023:                                      ; preds = %if.end1020
  %567 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1024 = icmp ne i32 %567, 0
  br i1 %tobool1024, label %if.then1025, label %if.end1026

if.then1025:                                      ; preds = %do.body1023
  %568 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %568)
  br label %if.end1026

if.end1026:                                       ; preds = %if.then1025, %do.body1023
  %569 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1027 = icmp ne i32 %569, 0
  br i1 %tobool1027, label %if.then1028, label %if.end1029

if.then1028:                                      ; preds = %if.end1026
  call void @throw_to_top_level()
  br label %if.end1029

if.end1029:                                       ; preds = %if.then1028, %if.end1026
  br label %do.end1030

do.end1030:                                       ; preds = %if.end1029
  %570 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1031 = call i32 @ferror(%struct._IO_FILE* %570)
  %tobool1032 = icmp ne i32 %call1031, 0
  br i1 %tobool1032, label %if.then1033, label %if.end1034

if.then1033:                                      ; preds = %do.end1030
  call void @sh_wrerror()
  %571 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %571)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end1034:                                       ; preds = %do.end1030
  br label %do.end1035

do.end1035:                                       ; preds = %if.end1034
  br label %if.end1036

if.end1036:                                       ; preds = %do.end1035, %do.end974
  br label %sw.epilog1149

sw.bb1037:                                        ; preds = %do.end274, %do.end274, %do.end274, %do.end274, %do.end274, %do.end274
  %call1040 = call double @getfloatmax()
  store double %call1040, double* %p1039, align 8
  %572 = load i8*, i8** %start, align 4
  %call1041 = call i8* @mklong(i8* %572, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0), i32 0)
  store i8* %call1041, i8** %f1038, align 4
  br label %do.body1042

do.body1042:                                      ; preds = %sw.bb1037
  %573 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %573)
  %574 = load i32, i32* %have_fieldwidth, align 4
  %tobool1044 = icmp ne i32 %574, 0
  br i1 %tobool1044, label %land.lhs.true1045, label %if.else1055

land.lhs.true1045:                                ; preds = %do.body1042
  %575 = load i32, i32* %have_precision, align 4
  %tobool1046 = icmp ne i32 %575, 0
  br i1 %tobool1046, label %if.then1047, label %if.else1055

if.then1047:                                      ; preds = %land.lhs.true1045
  %576 = load i32, i32* @vflag, align 4
  %tobool1048 = icmp ne i32 %576, 0
  br i1 %tobool1048, label %cond.true1049, label %cond.false1051

cond.true1049:                                    ; preds = %if.then1047
  %577 = load i8*, i8** %f1038, align 4
  %578 = load i32, i32* %fieldwidth, align 4
  %579 = load i32, i32* %precision, align 4
  %580 = load double, double* %p1039, align 8
  %call1050 = call i32 (i8*, ...) @vbprintf(i8* %577, i32 %578, i32 %579, double %580)
  br label %cond.end1053

cond.false1051:                                   ; preds = %if.then1047
  %581 = load i8*, i8** %f1038, align 4
  %582 = load i32, i32* %fieldwidth, align 4
  %583 = load i32, i32* %precision, align 4
  %584 = load double, double* %p1039, align 8
  %call1052 = call i32 (i8*, ...) @printf(i8* %581, i32 %582, i32 %583, double %584)
  br label %cond.end1053

cond.end1053:                                     ; preds = %cond.false1051, %cond.true1049
  %cond1054 = phi i32 [ %call1050, %cond.true1049 ], [ %call1052, %cond.false1051 ]
  store i32 %cond1054, i32* %nw1043, align 4
  br label %if.end1085

if.else1055:                                      ; preds = %land.lhs.true1045, %do.body1042
  %585 = load i32, i32* %have_fieldwidth, align 4
  %tobool1056 = icmp ne i32 %585, 0
  br i1 %tobool1056, label %if.then1057, label %if.else1065

if.then1057:                                      ; preds = %if.else1055
  %586 = load i32, i32* @vflag, align 4
  %tobool1058 = icmp ne i32 %586, 0
  br i1 %tobool1058, label %cond.true1059, label %cond.false1061

cond.true1059:                                    ; preds = %if.then1057
  %587 = load i8*, i8** %f1038, align 4
  %588 = load i32, i32* %fieldwidth, align 4
  %589 = load double, double* %p1039, align 8
  %call1060 = call i32 (i8*, ...) @vbprintf(i8* %587, i32 %588, double %589)
  br label %cond.end1063

cond.false1061:                                   ; preds = %if.then1057
  %590 = load i8*, i8** %f1038, align 4
  %591 = load i32, i32* %fieldwidth, align 4
  %592 = load double, double* %p1039, align 8
  %call1062 = call i32 (i8*, ...) @printf(i8* %590, i32 %591, double %592)
  br label %cond.end1063

cond.end1063:                                     ; preds = %cond.false1061, %cond.true1059
  %cond1064 = phi i32 [ %call1060, %cond.true1059 ], [ %call1062, %cond.false1061 ]
  store i32 %cond1064, i32* %nw1043, align 4
  br label %if.end1084

if.else1065:                                      ; preds = %if.else1055
  %593 = load i32, i32* %have_precision, align 4
  %tobool1066 = icmp ne i32 %593, 0
  br i1 %tobool1066, label %if.then1067, label %if.else1075

if.then1067:                                      ; preds = %if.else1065
  %594 = load i32, i32* @vflag, align 4
  %tobool1068 = icmp ne i32 %594, 0
  br i1 %tobool1068, label %cond.true1069, label %cond.false1071

cond.true1069:                                    ; preds = %if.then1067
  %595 = load i8*, i8** %f1038, align 4
  %596 = load i32, i32* %precision, align 4
  %597 = load double, double* %p1039, align 8
  %call1070 = call i32 (i8*, ...) @vbprintf(i8* %595, i32 %596, double %597)
  br label %cond.end1073

cond.false1071:                                   ; preds = %if.then1067
  %598 = load i8*, i8** %f1038, align 4
  %599 = load i32, i32* %precision, align 4
  %600 = load double, double* %p1039, align 8
  %call1072 = call i32 (i8*, ...) @printf(i8* %598, i32 %599, double %600)
  br label %cond.end1073

cond.end1073:                                     ; preds = %cond.false1071, %cond.true1069
  %cond1074 = phi i32 [ %call1070, %cond.true1069 ], [ %call1072, %cond.false1071 ]
  store i32 %cond1074, i32* %nw1043, align 4
  br label %if.end1083

if.else1075:                                      ; preds = %if.else1065
  %601 = load i32, i32* @vflag, align 4
  %tobool1076 = icmp ne i32 %601, 0
  br i1 %tobool1076, label %cond.true1077, label %cond.false1079

cond.true1077:                                    ; preds = %if.else1075
  %602 = load i8*, i8** %f1038, align 4
  %603 = load double, double* %p1039, align 8
  %call1078 = call i32 (i8*, ...) @vbprintf(i8* %602, double %603)
  br label %cond.end1081

cond.false1079:                                   ; preds = %if.else1075
  %604 = load i8*, i8** %f1038, align 4
  %605 = load double, double* %p1039, align 8
  %call1080 = call i32 (i8*, ...) @printf(i8* %604, double %605)
  br label %cond.end1081

cond.end1081:                                     ; preds = %cond.false1079, %cond.true1077
  %cond1082 = phi i32 [ %call1078, %cond.true1077 ], [ %call1080, %cond.false1079 ]
  store i32 %cond1082, i32* %nw1043, align 4
  br label %if.end1083

if.end1083:                                       ; preds = %cond.end1081, %cond.end1073
  br label %if.end1084

if.end1084:                                       ; preds = %if.end1083, %cond.end1063
  br label %if.end1085

if.end1085:                                       ; preds = %if.end1084, %cond.end1053
  %606 = load i32, i32* %nw1043, align 4
  %conv1086 = sext i32 %606 to i64
  %607 = load i64, i64* @tw, align 8
  %add1087 = add nsw i64 %607, %conv1086
  store i64 %add1087, i64* @tw, align 8
  br label %do.body1088

do.body1088:                                      ; preds = %if.end1085
  %608 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1089 = icmp ne i32 %608, 0
  br i1 %tobool1089, label %if.then1090, label %if.end1091

if.then1090:                                      ; preds = %do.body1088
  %609 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %609)
  br label %if.end1091

if.end1091:                                       ; preds = %if.then1090, %do.body1088
  %610 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1092 = icmp ne i32 %610, 0
  br i1 %tobool1092, label %if.then1093, label %if.end1094

if.then1093:                                      ; preds = %if.end1091
  call void @throw_to_top_level()
  br label %if.end1094

if.end1094:                                       ; preds = %if.then1093, %if.end1091
  br label %do.end1095

do.end1095:                                       ; preds = %if.end1094
  %611 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1096 = call i32 @ferror(%struct._IO_FILE* %611)
  %tobool1097 = icmp ne i32 %call1096, 0
  br i1 %tobool1097, label %if.then1098, label %if.end1099

if.then1098:                                      ; preds = %do.end1095
  call void @sh_wrerror()
  %612 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %612)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end1099:                                       ; preds = %do.end1095
  br label %do.end1100

do.end1100:                                       ; preds = %if.end1099
  br label %sw.epilog1149

sw.default1101:                                   ; preds = %do.end274
  %call1102 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.11, i32 0, i32 0))
  %613 = load i8, i8* %convch, align 1
  %conv1103 = sext i8 %613 to i32
  call void (i8*, ...) @builtin_error(i8* %call1102, i32 %conv1103)
  br label %do.body1104

do.body1104:                                      ; preds = %sw.default1101
  br label %do.body1105

do.body1105:                                      ; preds = %do.body1104
  %614 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1106 = icmp ne i32 %614, 0
  br i1 %tobool1106, label %if.then1107, label %if.end1108

if.then1107:                                      ; preds = %do.body1105
  %615 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %615)
  br label %if.end1108

if.end1108:                                       ; preds = %if.then1107, %do.body1105
  %616 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1109 = icmp ne i32 %616, 0
  br i1 %tobool1109, label %if.then1110, label %if.end1111

if.then1110:                                      ; preds = %if.end1108
  call void @throw_to_top_level()
  br label %if.end1111

if.end1111:                                       ; preds = %if.then1110, %if.end1108
  br label %do.end1112

do.end1112:                                       ; preds = %if.end1111
  %617 = load i32, i32* @vflag, align 4
  %tobool1113 = icmp ne i32 %617, 0
  br i1 %tobool1113, label %if.then1114, label %if.end1116

if.then1114:                                      ; preds = %do.end1112
  %618 = load i8*, i8** @vname, align 4
  %619 = load i8*, i8** @vbuf, align 4
  %call1115 = call %struct.variable* @bind_printf_variable(i8* %618, i8* %619, i32 0)
  %620 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %620)
  br label %if.end1116

if.end1116:                                       ; preds = %if.then1114, %do.end1112
  %621 = load i32, i32* @conv_bufsize, align 4
  %cmp1117 = icmp ugt i32 %621, 4096
  br i1 %cmp1117, label %if.then1119, label %if.end1120

if.then1119:                                      ; preds = %if.end1116
  %622 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %622, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 670)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end1120

if.end1120:                                       ; preds = %if.then1119, %if.end1116
  %623 = load i32, i32* @vbsize, align 4
  %cmp1121 = icmp ugt i32 %623, 4096
  br i1 %cmp1121, label %if.then1123, label %if.else1124

if.then1123:                                      ; preds = %if.end1120
  %624 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %624, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 670)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end1129

if.else1124:                                      ; preds = %if.end1120
  %625 = load i8*, i8** @vbuf, align 4
  %tobool1125 = icmp ne i8* %625, null
  br i1 %tobool1125, label %if.then1126, label %if.end1128

if.then1126:                                      ; preds = %if.else1124
  %626 = load i8*, i8** @vbuf, align 4
  %arrayidx1127 = getelementptr inbounds i8, i8* %626, i32 0
  store i8 0, i8* %arrayidx1127, align 1
  br label %if.end1128

if.end1128:                                       ; preds = %if.then1126, %if.else1124
  br label %if.end1129

if.end1129:                                       ; preds = %if.end1128, %if.then1123
  %627 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1130 = call i32 @ferror(%struct._IO_FILE* %627)
  %cmp1131 = icmp eq i32 %call1130, 0
  br i1 %cmp1131, label %if.then1133, label %if.end1135

if.then1133:                                      ; preds = %if.end1129
  %628 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1134 = call i32 @fflush(%struct._IO_FILE* %628)
  br label %if.end1135

if.end1135:                                       ; preds = %if.then1133, %if.end1129
  br label %do.body1136

do.body1136:                                      ; preds = %if.end1135
  %629 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1137 = icmp ne i32 %629, 0
  br i1 %tobool1137, label %if.then1138, label %if.end1139

if.then1138:                                      ; preds = %do.body1136
  %630 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %630)
  br label %if.end1139

if.end1139:                                       ; preds = %if.then1138, %do.body1136
  %631 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1140 = icmp ne i32 %631, 0
  br i1 %tobool1140, label %if.then1141, label %if.end1142

if.then1141:                                      ; preds = %if.end1139
  call void @throw_to_top_level()
  br label %if.end1142

if.end1142:                                       ; preds = %if.then1141, %if.end1139
  br label %do.end1143

do.end1143:                                       ; preds = %if.end1142
  %632 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1144 = call i32 @ferror(%struct._IO_FILE* %632)
  %tobool1145 = icmp ne i32 %call1144, 0
  br i1 %tobool1145, label %if.then1146, label %if.end1147

if.then1146:                                      ; preds = %do.end1143
  call void @sh_wrerror()
  %633 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %633)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end1147:                                       ; preds = %do.end1143
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end1148:                                       ; No predecessors!
  br label %sw.epilog1149

sw.epilog1149:                                    ; preds = %do.end1148, %do.end1100, %if.end1036, %if.end904, %if.end774, %if.end694, %if.end625, %if.end566, %do.end401, %do.end339
  %634 = load i8, i8* %thisch, align 1
  %635 = load i8*, i8** %modstart, align 4
  %arrayidx1150 = getelementptr inbounds i8, i8* %635, i32 0
  store i8 %634, i8* %arrayidx1150, align 1
  %636 = load i8, i8* %nextch, align 1
  %637 = load i8*, i8** %modstart, align 4
  %arrayidx1151 = getelementptr inbounds i8, i8* %637, i32 1
  store i8 %636, i8* %arrayidx1151, align 1
  br label %for.inc1152

for.inc1152:                                      ; preds = %sw.epilog1149, %do.end458, %do.end137, %do.end110, %for.end
  %638 = load i8*, i8** %fmt, align 4
  %incdec.ptr1153 = getelementptr inbounds i8, i8* %638, i32 1
  store i8* %incdec.ptr1153, i8** %fmt, align 4
  br label %for.cond

for.end1154:                                      ; preds = %for.cond
  %639 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1155 = call i32 @ferror(%struct._IO_FILE* %639)
  %tobool1156 = icmp ne i32 %call1155, 0
  br i1 %tobool1156, label %if.then1157, label %if.end1203

if.then1157:                                      ; preds = %for.end1154
  br label %do.body1158

do.body1158:                                      ; preds = %if.then1157
  br label %do.body1159

do.body1159:                                      ; preds = %do.body1158
  %640 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1160 = icmp ne i32 %640, 0
  br i1 %tobool1160, label %if.then1161, label %if.end1162

if.then1161:                                      ; preds = %do.body1159
  %641 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %641)
  br label %if.end1162

if.end1162:                                       ; preds = %if.then1161, %do.body1159
  %642 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1163 = icmp ne i32 %642, 0
  br i1 %tobool1163, label %if.then1164, label %if.end1165

if.then1164:                                      ; preds = %if.end1162
  call void @throw_to_top_level()
  br label %if.end1165

if.end1165:                                       ; preds = %if.then1164, %if.end1162
  br label %do.end1166

do.end1166:                                       ; preds = %if.end1165
  %643 = load i32, i32* @vflag, align 4
  %tobool1167 = icmp ne i32 %643, 0
  br i1 %tobool1167, label %if.then1168, label %if.end1170

if.then1168:                                      ; preds = %do.end1166
  %644 = load i8*, i8** @vname, align 4
  %645 = load i8*, i8** @vbuf, align 4
  %call1169 = call %struct.variable* @bind_printf_variable(i8* %644, i8* %645, i32 0)
  %646 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %646)
  br label %if.end1170

if.end1170:                                       ; preds = %if.then1168, %do.end1166
  %647 = load i32, i32* @conv_bufsize, align 4
  %cmp1171 = icmp ugt i32 %647, 4096
  br i1 %cmp1171, label %if.then1173, label %if.end1174

if.then1173:                                      ; preds = %if.end1170
  %648 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %648, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 680)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end1174

if.end1174:                                       ; preds = %if.then1173, %if.end1170
  %649 = load i32, i32* @vbsize, align 4
  %cmp1175 = icmp ugt i32 %649, 4096
  br i1 %cmp1175, label %if.then1177, label %if.else1178

if.then1177:                                      ; preds = %if.end1174
  %650 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %650, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 680)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end1183

if.else1178:                                      ; preds = %if.end1174
  %651 = load i8*, i8** @vbuf, align 4
  %tobool1179 = icmp ne i8* %651, null
  br i1 %tobool1179, label %if.then1180, label %if.end1182

if.then1180:                                      ; preds = %if.else1178
  %652 = load i8*, i8** @vbuf, align 4
  %arrayidx1181 = getelementptr inbounds i8, i8* %652, i32 0
  store i8 0, i8* %arrayidx1181, align 1
  br label %if.end1182

if.end1182:                                       ; preds = %if.then1180, %if.else1178
  br label %if.end1183

if.end1183:                                       ; preds = %if.end1182, %if.then1177
  %653 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1184 = call i32 @ferror(%struct._IO_FILE* %653)
  %cmp1185 = icmp eq i32 %call1184, 0
  br i1 %cmp1185, label %if.then1187, label %if.end1189

if.then1187:                                      ; preds = %if.end1183
  %654 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1188 = call i32 @fflush(%struct._IO_FILE* %654)
  br label %if.end1189

if.end1189:                                       ; preds = %if.then1187, %if.end1183
  br label %do.body1190

do.body1190:                                      ; preds = %if.end1189
  %655 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1191 = icmp ne i32 %655, 0
  br i1 %tobool1191, label %if.then1192, label %if.end1193

if.then1192:                                      ; preds = %do.body1190
  %656 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %656)
  br label %if.end1193

if.end1193:                                       ; preds = %if.then1192, %do.body1190
  %657 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1194 = icmp ne i32 %657, 0
  br i1 %tobool1194, label %if.then1195, label %if.end1196

if.then1195:                                      ; preds = %if.end1193
  call void @throw_to_top_level()
  br label %if.end1196

if.end1196:                                       ; preds = %if.then1195, %if.end1193
  br label %do.end1197

do.end1197:                                       ; preds = %if.end1196
  %658 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1198 = call i32 @ferror(%struct._IO_FILE* %658)
  %tobool1199 = icmp ne i32 %call1198, 0
  br i1 %tobool1199, label %if.then1200, label %if.end1201

if.then1200:                                      ; preds = %do.end1197
  call void @sh_wrerror()
  %659 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %659)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end1201:                                       ; preds = %do.end1197
  store i32 1, i32* %retval, align 4
  br label %do.end1261

do.end1202:                                       ; No predecessors!
  br label %if.end1203

if.end1203:                                       ; preds = %do.end1202, %for.end1154
  br label %do.cond

do.cond:                                          ; preds = %if.end1203
  %660 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %tobool1204 = icmp ne %struct.word_list* %660, null
  br i1 %tobool1204, label %land.rhs1205, label %land.end1209

land.rhs1205:                                     ; preds = %do.cond
  %661 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %662 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next1206 = getelementptr inbounds %struct.word_list, %struct.word_list* %662, i32 0, i32 0
  %663 = load %struct.word_list*, %struct.word_list** %next1206, align 4
  %cmp1207 = icmp ne %struct.word_list* %661, %663
  br label %land.end1209

land.end1209:                                     ; preds = %land.rhs1205, %do.cond
  %664 = phi i1 [ false, %do.cond ], [ %cmp1207, %land.rhs1205 ]
  br i1 %664, label %do.body, label %do.end1210

do.end1210:                                       ; preds = %land.end1209
  %665 = load i32, i32* @conversion_error, align 4
  %tobool1211 = icmp ne i32 %665, 0
  br i1 %tobool1211, label %if.then1212, label %if.end1213

if.then1212:                                      ; preds = %do.end1210
  store i32 1, i32* @retval, align 4
  br label %if.end1213

if.end1213:                                       ; preds = %if.then1212, %do.end1210
  br label %do.body1214

do.body1214:                                      ; preds = %if.end1213
  br label %do.body1215

do.body1215:                                      ; preds = %do.body1214
  %666 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1216 = icmp ne i32 %666, 0
  br i1 %tobool1216, label %if.then1217, label %if.end1218

if.then1217:                                      ; preds = %do.body1215
  %667 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %667)
  br label %if.end1218

if.end1218:                                       ; preds = %if.then1217, %do.body1215
  %668 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1219 = icmp ne i32 %668, 0
  br i1 %tobool1219, label %if.then1220, label %if.end1221

if.then1220:                                      ; preds = %if.end1218
  call void @throw_to_top_level()
  br label %if.end1221

if.end1221:                                       ; preds = %if.then1220, %if.end1218
  br label %do.end1223

do.end1223:                                       ; preds = %if.end1221
  %669 = load i32, i32* @vflag, align 4
  %tobool1224 = icmp ne i32 %669, 0
  br i1 %tobool1224, label %if.then1225, label %if.end1227

if.then1225:                                      ; preds = %do.end1223
  %670 = load i8*, i8** @vname, align 4
  %671 = load i8*, i8** @vbuf, align 4
  %call1226 = call %struct.variable* @bind_printf_variable(i8* %670, i8* %671, i32 0)
  %672 = load i8*, i8** @vname, align 4
  call void @stupidly_hack_special_variables(i8* %672)
  br label %if.end1227

if.end1227:                                       ; preds = %if.then1225, %do.end1223
  %673 = load i32, i32* @conv_bufsize, align 4
  %cmp1228 = icmp ugt i32 %673, 4096
  br i1 %cmp1228, label %if.then1230, label %if.end1231

if.then1230:                                      ; preds = %if.end1227
  %674 = load i8*, i8** @conv_buf, align 4
  call void @sh_xfree(i8* %674, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 688)
  store i32 0, i32* @conv_bufsize, align 4
  store i8* null, i8** @conv_buf, align 4
  br label %if.end1231

if.end1231:                                       ; preds = %if.then1230, %if.end1227
  %675 = load i32, i32* @vbsize, align 4
  %cmp1232 = icmp ugt i32 %675, 4096
  br i1 %cmp1232, label %if.then1234, label %if.else1235

if.then1234:                                      ; preds = %if.end1231
  %676 = load i8*, i8** @vbuf, align 4
  call void @sh_xfree(i8* %676, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 688)
  store i32 0, i32* @vbsize, align 4
  store i8* null, i8** @vbuf, align 4
  br label %if.end1240

if.else1235:                                      ; preds = %if.end1231
  %677 = load i8*, i8** @vbuf, align 4
  %tobool1236 = icmp ne i8* %677, null
  br i1 %tobool1236, label %if.then1237, label %if.end1239

if.then1237:                                      ; preds = %if.else1235
  %678 = load i8*, i8** @vbuf, align 4
  %arrayidx1238 = getelementptr inbounds i8, i8* %678, i32 0
  store i8 0, i8* %arrayidx1238, align 1
  br label %if.end1239

if.end1239:                                       ; preds = %if.then1237, %if.else1235
  br label %if.end1240

if.end1240:                                       ; preds = %if.end1239, %if.then1234
  %679 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1241 = call i32 @ferror(%struct._IO_FILE* %679)
  %cmp1242 = icmp eq i32 %call1241, 0
  br i1 %cmp1242, label %if.then1244, label %if.end1246

if.then1244:                                      ; preds = %if.end1240
  %680 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1245 = call i32 @fflush(%struct._IO_FILE* %680)
  br label %if.end1246

if.end1246:                                       ; preds = %if.then1244, %if.end1240
  br label %do.body1247

do.body1247:                                      ; preds = %if.end1246
  %681 = load volatile i32, i32* @terminating_signal, align 4
  %tobool1248 = icmp ne i32 %681, 0
  br i1 %tobool1248, label %if.then1249, label %if.end1250

if.then1249:                                      ; preds = %do.body1247
  %682 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %682)
  br label %if.end1250

if.end1250:                                       ; preds = %if.then1249, %do.body1247
  %683 = load volatile i32, i32* @interrupt_state, align 4
  %tobool1251 = icmp ne i32 %683, 0
  br i1 %tobool1251, label %if.then1252, label %if.end1253

if.then1252:                                      ; preds = %if.end1250
  call void @throw_to_top_level()
  br label %if.end1253

if.end1253:                                       ; preds = %if.then1252, %if.end1250
  br label %do.end1255

do.end1255:                                       ; preds = %if.end1253
  %684 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call1256 = call i32 @ferror(%struct._IO_FILE* %684)
  %tobool1257 = icmp ne i32 %call1256, 0
  br i1 %tobool1257, label %if.then1258, label %if.end1259

if.then1258:                                      ; preds = %do.end1255
  call void @sh_wrerror()
  %685 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %685)
  store i32 1, i32* %retval, align 4
  br label %do.end1261

if.end1259:                                       ; preds = %do.end1255
  %686 = load i32, i32* @retval, align 4
  store i32 %686, i32* %retval, align 4
  br label %do.end1261

do.end1261:                                       ; preds = %if.else, %sw.bb11, %sw.default, %if.then13, %if.then24, %if.then38, %if.then48, %if.then259, %if.end260, %if.then337, %if.then399, %if.then563, %if.end564, %if.then621, %if.end622, %if.then691, %if.end692, %if.then771, %if.end772, %if.then840, %if.then901, %if.then972, %if.then1033, %if.then1098, %if.then1146, %if.end1147, %if.then1200, %if.end1201, %if.then1258, %if.end1259
  %687 = load i32, i32* %retval, align 4
  ret i32 %687
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare i32 @legal_identifier(i8*) #1

declare i32 @valid_array_reference(i8*, i32) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare void @sh_invalidid(i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

; Function Attrs: noinline nounwind
define internal %struct.variable* @bind_printf_variable(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @valid_array_reference(i8* %0, i32 0)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8*, i8** %value.addr, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %call1 = call %struct.variable* @bind_variable(i8* %1, i8* %2, i32 %3)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i8*, i8** %value.addr, align 4
  %6 = load i32, i32* %flags.addr, align 4
  %call2 = call %struct.variable* @assign_array_element(i8* %4, i8* %5, i32 %6)
  store %struct.variable* %call2, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool = icmp ne %struct.variable* %7, null
  br i1 %tobool, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %if.end
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  %9 = load i32, i32* %attributes, align 4
  %and = and i32 %9, 2
  %cmp3 = icmp eq i32 %and, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.end11

land.lhs.true4:                                   ; preds = %land.lhs.true
  %10 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes5 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes5, align 4
  %and6 = and i32 %11, 16384
  %cmp7 = icmp eq i32 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %land.lhs.true4
  %12 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes9 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes9, align 4
  %and10 = and i32 %13, -4097
  store i32 %and10, i32* %attributes9, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %land.lhs.true4, %land.lhs.true, %if.end
  %14 = load %struct.variable*, %struct.variable** %v, align 4
  ret %struct.variable* %14
}

declare void @stupidly_hack_special_variables(i8*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

; Function Attrs: noinline nounwind
define internal i32 @tescape(i8* %estart, i8* %cp, i32* %lenp, i32* %sawc) #0 {
entry:
  %retval = alloca i32, align 4
  %estart.addr = alloca i8*, align 4
  %cp.addr = alloca i8*, align 4
  %lenp.addr = alloca i32*, align 4
  %sawc.addr = alloca i32*, align 4
  %p = alloca i8*, align 4
  %temp = alloca i32, align 4
  %c = alloca i32, align 4
  %evalue = alloca i32, align 4
  %uvalue = alloca i32, align 4
  store i8* %estart, i8** %estart.addr, align 4
  store i8* %cp, i8** %cp.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  store i32* %sawc, i32** %sawc.addr, align 4
  %0 = load i8*, i8** %estart.addr, align 4
  store i8* %0, i8** %p, align 4
  %1 = load i32*, i32** %lenp.addr, align 4
  %tobool = icmp ne i32* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %lenp.addr, align 4
  store i32 1, i32* %2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %c, align 4
  switch i32 %conv, label %sw.default [
    i32 97, label %sw.bb
    i32 98, label %sw.bb1
    i32 101, label %sw.bb2
    i32 69, label %sw.bb2
    i32 102, label %sw.bb3
    i32 110, label %sw.bb4
    i32 114, label %sw.bb5
    i32 116, label %sw.bb6
    i32 118, label %sw.bb7
    i32 48, label %sw.bb8
    i32 49, label %sw.bb8
    i32 50, label %sw.bb8
    i32 51, label %sw.bb8
    i32 52, label %sw.bb8
    i32 53, label %sw.bb8
    i32 54, label %sw.bb8
    i32 55, label %sw.bb8
    i32 120, label %sw.bb26
    i32 117, label %sw.bb74
    i32 85, label %sw.bb74
    i32 92, label %sw.bb138
    i32 39, label %sw.bb140
    i32 34, label %sw.bb140
    i32 63, label %sw.bb140
    i32 99, label %sw.bb146
  ]

sw.bb:                                            ; preds = %if.end
  %5 = load i8*, i8** %cp.addr, align 4
  store i8 7, i8* %5, align 1
  br label %sw.epilog

sw.bb1:                                           ; preds = %if.end
  %6 = load i8*, i8** %cp.addr, align 4
  store i8 8, i8* %6, align 1
  br label %sw.epilog

sw.bb2:                                           ; preds = %if.end, %if.end
  %7 = load i8*, i8** %cp.addr, align 4
  store i8 27, i8* %7, align 1
  br label %sw.epilog

sw.bb3:                                           ; preds = %if.end
  %8 = load i8*, i8** %cp.addr, align 4
  store i8 12, i8* %8, align 1
  br label %sw.epilog

sw.bb4:                                           ; preds = %if.end
  %9 = load i8*, i8** %cp.addr, align 4
  store i8 10, i8* %9, align 1
  br label %sw.epilog

sw.bb5:                                           ; preds = %if.end
  %10 = load i8*, i8** %cp.addr, align 4
  store i8 13, i8* %10, align 1
  br label %sw.epilog

sw.bb6:                                           ; preds = %if.end
  %11 = load i8*, i8** %cp.addr, align 4
  store i8 9, i8* %11, align 1
  br label %sw.epilog

sw.bb7:                                           ; preds = %if.end
  %12 = load i8*, i8** %cp.addr, align 4
  store i8 11, i8* %12, align 1
  br label %sw.epilog

sw.bb8:                                           ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end
  %13 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %13, 48
  store i32 %sub, i32* %evalue, align 4
  %14 = load i32, i32* %evalue, align 4
  %tobool9 = icmp ne i32 %14, 0
  br i1 %tobool9, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %sw.bb8
  %15 = load i32*, i32** %sawc.addr, align 4
  %tobool10 = icmp ne i32* %15, null
  %lnot = xor i1 %tobool10, true
  %lnot11 = xor i1 %lnot, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %sw.bb8
  %16 = phi i1 [ false, %sw.bb8 ], [ %lnot11, %land.rhs ]
  %land.ext = zext i1 %16 to i32
  %add = add nsw i32 2, %land.ext
  store i32 %add, i32* %temp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %land.end
  %17 = load i8*, i8** %p, align 4
  %18 = load i8, i8* %17, align 1
  %conv12 = sext i8 %18 to i32
  %cmp = icmp sge i32 %conv12, 48
  br i1 %cmp, label %land.lhs.true, label %land.end19

land.lhs.true:                                    ; preds = %for.cond
  %19 = load i8*, i8** %p, align 4
  %20 = load i8, i8* %19, align 1
  %conv14 = sext i8 %20 to i32
  %cmp15 = icmp sle i32 %conv14, 55
  br i1 %cmp15, label %land.rhs17, label %land.end19

land.rhs17:                                       ; preds = %land.lhs.true
  %21 = load i32, i32* %temp, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, i32* %temp, align 4
  %tobool18 = icmp ne i32 %21, 0
  br label %land.end19

land.end19:                                       ; preds = %land.rhs17, %land.lhs.true, %for.cond
  %22 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %tobool18, %land.rhs17 ]
  br i1 %22, label %for.body, label %for.end

for.body:                                         ; preds = %land.end19
  %23 = load i32, i32* %evalue, align 4
  %mul = mul nsw i32 %23, 8
  %24 = load i8*, i8** %p, align 4
  %25 = load i8, i8* %24, align 1
  %conv21 = sext i8 %25 to i32
  %sub22 = sub nsw i32 %conv21, 48
  %add23 = add nsw i32 %mul, %sub22
  store i32 %add23, i32* %evalue, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i8*, i8** %p, align 4
  %incdec.ptr24 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %incdec.ptr24, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end19
  %27 = load i32, i32* %evalue, align 4
  %and = and i32 %27, 255
  %conv25 = trunc i32 %and to i8
  %28 = load i8*, i8** %cp.addr, align 4
  store i8 %conv25, i8* %28, align 1
  br label %sw.epilog

sw.bb26:                                          ; preds = %if.end
  store i32 2, i32* %temp, align 4
  store i32 0, i32* %evalue, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc64, %sw.bb26
  %29 = load i8*, i8** %p, align 4
  %30 = load i8, i8* %29, align 1
  %conv28 = zext i8 %30 to i32
  %call = call i32 @isxdigit(i32 %conv28) #5
  %tobool29 = icmp ne i32 %call, 0
  br i1 %tobool29, label %land.rhs30, label %land.end33

land.rhs30:                                       ; preds = %for.cond27
  %31 = load i32, i32* %temp, align 4
  %dec31 = add nsw i32 %31, -1
  store i32 %dec31, i32* %temp, align 4
  %tobool32 = icmp ne i32 %31, 0
  br label %land.end33

land.end33:                                       ; preds = %land.rhs30, %for.cond27
  %32 = phi i1 [ false, %for.cond27 ], [ %tobool32, %land.rhs30 ]
  br i1 %32, label %for.body35, label %for.end66

for.body35:                                       ; preds = %land.end33
  %33 = load i32, i32* %evalue, align 4
  %mul36 = mul nsw i32 %33, 16
  %34 = load i8*, i8** %p, align 4
  %35 = load i8, i8* %34, align 1
  %conv37 = sext i8 %35 to i32
  %cmp38 = icmp sge i32 %conv37, 97
  br i1 %cmp38, label %land.lhs.true40, label %cond.false

land.lhs.true40:                                  ; preds = %for.body35
  %36 = load i8*, i8** %p, align 4
  %37 = load i8, i8* %36, align 1
  %conv41 = sext i8 %37 to i32
  %cmp42 = icmp sle i32 %conv41, 102
  br i1 %cmp42, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true40
  %38 = load i8*, i8** %p, align 4
  %39 = load i8, i8* %38, align 1
  %conv44 = sext i8 %39 to i32
  %sub45 = sub nsw i32 %conv44, 97
  %add46 = add nsw i32 %sub45, 10
  br label %cond.end61

cond.false:                                       ; preds = %land.lhs.true40, %for.body35
  %40 = load i8*, i8** %p, align 4
  %41 = load i8, i8* %40, align 1
  %conv47 = sext i8 %41 to i32
  %cmp48 = icmp sge i32 %conv47, 65
  br i1 %cmp48, label %land.lhs.true50, label %cond.false58

land.lhs.true50:                                  ; preds = %cond.false
  %42 = load i8*, i8** %p, align 4
  %43 = load i8, i8* %42, align 1
  %conv51 = sext i8 %43 to i32
  %cmp52 = icmp sle i32 %conv51, 70
  br i1 %cmp52, label %cond.true54, label %cond.false58

cond.true54:                                      ; preds = %land.lhs.true50
  %44 = load i8*, i8** %p, align 4
  %45 = load i8, i8* %44, align 1
  %conv55 = sext i8 %45 to i32
  %sub56 = sub nsw i32 %conv55, 65
  %add57 = add nsw i32 %sub56, 10
  br label %cond.end

cond.false58:                                     ; preds = %land.lhs.true50, %cond.false
  %46 = load i8*, i8** %p, align 4
  %47 = load i8, i8* %46, align 1
  %conv59 = sext i8 %47 to i32
  %sub60 = sub nsw i32 %conv59, 48
  br label %cond.end

cond.end:                                         ; preds = %cond.false58, %cond.true54
  %cond = phi i32 [ %add57, %cond.true54 ], [ %sub60, %cond.false58 ]
  br label %cond.end61

cond.end61:                                       ; preds = %cond.end, %cond.true
  %cond62 = phi i32 [ %add46, %cond.true ], [ %cond, %cond.end ]
  %add63 = add nsw i32 %mul36, %cond62
  store i32 %add63, i32* %evalue, align 4
  br label %for.inc64

for.inc64:                                        ; preds = %cond.end61
  %48 = load i8*, i8** %p, align 4
  %incdec.ptr65 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr65, i8** %p, align 4
  br label %for.cond27

for.end66:                                        ; preds = %land.end33
  %49 = load i8*, i8** %p, align 4
  %50 = load i8*, i8** %estart.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %50, i32 1
  %cmp67 = icmp eq i8* %49, %add.ptr
  br i1 %cmp67, label %if.then69, label %if.end71

if.then69:                                        ; preds = %for.end66
  %call70 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call70)
  %51 = load i8*, i8** %cp.addr, align 4
  store i8 92, i8* %51, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.end71:                                         ; preds = %for.end66
  %52 = load i32, i32* %evalue, align 4
  %and72 = and i32 %52, 255
  %conv73 = trunc i32 %and72 to i8
  %53 = load i8*, i8** %cp.addr, align 4
  store i8 %conv73, i8* %53, align 1
  br label %sw.epilog

sw.bb74:                                          ; preds = %if.end, %if.end
  %54 = load i32, i32* %c, align 4
  %cmp75 = icmp eq i32 %54, 117
  %cond77 = select i1 %cmp75, i32 4, i32 8
  store i32 %cond77, i32* %temp, align 4
  store i32 0, i32* %uvalue, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc120, %sw.bb74
  %55 = load i8*, i8** %p, align 4
  %56 = load i8, i8* %55, align 1
  %conv79 = zext i8 %56 to i32
  %call80 = call i32 @isxdigit(i32 %conv79) #5
  %tobool81 = icmp ne i32 %call80, 0
  br i1 %tobool81, label %land.rhs82, label %land.end85

land.rhs82:                                       ; preds = %for.cond78
  %57 = load i32, i32* %temp, align 4
  %dec83 = add nsw i32 %57, -1
  store i32 %dec83, i32* %temp, align 4
  %tobool84 = icmp ne i32 %57, 0
  br label %land.end85

land.end85:                                       ; preds = %land.rhs82, %for.cond78
  %58 = phi i1 [ false, %for.cond78 ], [ %tobool84, %land.rhs82 ]
  br i1 %58, label %for.body87, label %for.end122

for.body87:                                       ; preds = %land.end85
  %59 = load i32, i32* %uvalue, align 4
  %mul88 = mul i32 %59, 16
  %60 = load i8*, i8** %p, align 4
  %61 = load i8, i8* %60, align 1
  %conv89 = sext i8 %61 to i32
  %cmp90 = icmp sge i32 %conv89, 97
  br i1 %cmp90, label %land.lhs.true92, label %cond.false100

land.lhs.true92:                                  ; preds = %for.body87
  %62 = load i8*, i8** %p, align 4
  %63 = load i8, i8* %62, align 1
  %conv93 = sext i8 %63 to i32
  %cmp94 = icmp sle i32 %conv93, 102
  br i1 %cmp94, label %cond.true96, label %cond.false100

cond.true96:                                      ; preds = %land.lhs.true92
  %64 = load i8*, i8** %p, align 4
  %65 = load i8, i8* %64, align 1
  %conv97 = sext i8 %65 to i32
  %sub98 = sub nsw i32 %conv97, 97
  %add99 = add nsw i32 %sub98, 10
  br label %cond.end117

cond.false100:                                    ; preds = %land.lhs.true92, %for.body87
  %66 = load i8*, i8** %p, align 4
  %67 = load i8, i8* %66, align 1
  %conv101 = sext i8 %67 to i32
  %cmp102 = icmp sge i32 %conv101, 65
  br i1 %cmp102, label %land.lhs.true104, label %cond.false112

land.lhs.true104:                                 ; preds = %cond.false100
  %68 = load i8*, i8** %p, align 4
  %69 = load i8, i8* %68, align 1
  %conv105 = sext i8 %69 to i32
  %cmp106 = icmp sle i32 %conv105, 70
  br i1 %cmp106, label %cond.true108, label %cond.false112

cond.true108:                                     ; preds = %land.lhs.true104
  %70 = load i8*, i8** %p, align 4
  %71 = load i8, i8* %70, align 1
  %conv109 = sext i8 %71 to i32
  %sub110 = sub nsw i32 %conv109, 65
  %add111 = add nsw i32 %sub110, 10
  br label %cond.end115

cond.false112:                                    ; preds = %land.lhs.true104, %cond.false100
  %72 = load i8*, i8** %p, align 4
  %73 = load i8, i8* %72, align 1
  %conv113 = sext i8 %73 to i32
  %sub114 = sub nsw i32 %conv113, 48
  br label %cond.end115

cond.end115:                                      ; preds = %cond.false112, %cond.true108
  %cond116 = phi i32 [ %add111, %cond.true108 ], [ %sub114, %cond.false112 ]
  br label %cond.end117

cond.end117:                                      ; preds = %cond.end115, %cond.true96
  %cond118 = phi i32 [ %add99, %cond.true96 ], [ %cond116, %cond.end115 ]
  %add119 = add i32 %mul88, %cond118
  store i32 %add119, i32* %uvalue, align 4
  br label %for.inc120

for.inc120:                                       ; preds = %cond.end117
  %74 = load i8*, i8** %p, align 4
  %incdec.ptr121 = getelementptr inbounds i8, i8* %74, i32 1
  store i8* %incdec.ptr121, i8** %p, align 4
  br label %for.cond78

for.end122:                                       ; preds = %land.end85
  %75 = load i8*, i8** %p, align 4
  %76 = load i8*, i8** %estart.addr, align 4
  %add.ptr123 = getelementptr inbounds i8, i8* %76, i32 1
  %cmp124 = icmp eq i8* %75, %add.ptr123
  br i1 %cmp124, label %if.then126, label %if.end128

if.then126:                                       ; preds = %for.end122
  %call127 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.13, i32 0, i32 0))
  %77 = load i32, i32* %c, align 4
  call void (i8*, ...) @builtin_error(i8* %call127, i32 %77)
  %78 = load i8*, i8** %cp.addr, align 4
  store i8 92, i8* %78, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.end128:                                        ; preds = %for.end122
  %79 = load i32, i32* %uvalue, align 4
  %cmp129 = icmp ule i32 %79, 127
  br i1 %cmp129, label %if.then131, label %if.else

if.then131:                                       ; preds = %if.end128
  %80 = load i32, i32* %uvalue, align 4
  %conv132 = trunc i32 %80 to i8
  %81 = load i8*, i8** %cp.addr, align 4
  store i8 %conv132, i8* %81, align 1
  br label %if.end137

if.else:                                          ; preds = %if.end128
  %82 = load i32, i32* %uvalue, align 4
  %83 = load i8*, i8** %cp.addr, align 4
  %call133 = call i32 @u32cconv(i32 %82, i8* %83)
  store i32 %call133, i32* %temp, align 4
  %84 = load i8*, i8** %cp.addr, align 4
  %85 = load i32, i32* %temp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %84, i32 %85
  store i8 0, i8* %arrayidx, align 1
  %86 = load i32*, i32** %lenp.addr, align 4
  %tobool134 = icmp ne i32* %86, null
  br i1 %tobool134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.else
  %87 = load i32, i32* %temp, align 4
  %88 = load i32*, i32** %lenp.addr, align 4
  store i32 %87, i32* %88, align 4
  br label %if.end136

if.end136:                                        ; preds = %if.then135, %if.else
  br label %if.end137

if.end137:                                        ; preds = %if.end136, %if.then131
  br label %sw.epilog

sw.bb138:                                         ; preds = %if.end
  %89 = load i32, i32* %c, align 4
  %conv139 = trunc i32 %89 to i8
  %90 = load i8*, i8** %cp.addr, align 4
  store i8 %conv139, i8* %90, align 1
  br label %sw.epilog

sw.bb140:                                         ; preds = %if.end, %if.end, %if.end
  %91 = load i32*, i32** %sawc.addr, align 4
  %tobool141 = icmp ne i32* %91, null
  br i1 %tobool141, label %if.else144, label %if.then142

if.then142:                                       ; preds = %sw.bb140
  %92 = load i32, i32* %c, align 4
  %conv143 = trunc i32 %92 to i8
  %93 = load i8*, i8** %cp.addr, align 4
  store i8 %conv143, i8* %93, align 1
  br label %if.end145

if.else144:                                       ; preds = %sw.bb140
  %94 = load i8*, i8** %cp.addr, align 4
  store i8 92, i8* %94, align 1
  store i32 0, i32* %retval, align 4
  br label %return

if.end145:                                        ; preds = %if.then142
  br label %sw.epilog

sw.bb146:                                         ; preds = %if.end
  %95 = load i32*, i32** %sawc.addr, align 4
  %tobool147 = icmp ne i32* %95, null
  br i1 %tobool147, label %if.then148, label %if.end149

if.then148:                                       ; preds = %sw.bb146
  %96 = load i32*, i32** %sawc.addr, align 4
  store i32 1, i32* %96, align 4
  br label %sw.epilog

if.end149:                                        ; preds = %sw.bb146
  br label %sw.default

sw.default:                                       ; preds = %if.end, %if.end149
  %97 = load i8*, i8** %cp.addr, align 4
  store i8 92, i8* %97, align 1
  store i32 0, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.then148, %if.end145, %sw.bb138, %if.end137, %if.end71, %for.end, %sw.bb7, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  %98 = load i8*, i8** %p, align 4
  %99 = load i8*, i8** %estart.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %98 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %99 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.default, %if.else144, %if.then126, %if.then69
  %100 = load i32, i32* %retval, align 4
  ret i32 %100
}

; Function Attrs: noinline nounwind
define internal i8* @vbadd(i8* %buf, i32 %blen) #0 {
entry:
  %buf.addr = alloca i8*, align 4
  %blen.addr = alloca i32, align 4
  %nlen = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %blen, i32* %blen.addr, align 4
  %0 = load i32, i32* @vblen, align 4
  %1 = load i32, i32* %blen.addr, align 4
  %add = add nsw i32 %0, %1
  %add1 = add nsw i32 %add, 1
  store i32 %add1, i32* %nlen, align 4
  %2 = load i32, i32* %nlen, align 4
  %3 = load i32, i32* @vbsize, align 4
  %cmp = icmp uge i32 %2, %3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %nlen, align 4
  %add2 = add i32 %4, 63
  %shr = lshr i32 %add2, 6
  %shl = shl i32 %shr, 6
  store i32 %shl, i32* @vbsize, align 4
  %5 = load i8*, i8** @vbuf, align 4
  %6 = load i32, i32* @vbsize, align 4
  %call = call i8* @sh_xrealloc(i8* %5, i32 %6, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 1009)
  store i8* %call, i8** @vbuf, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %blen.addr, align 4
  %cmp3 = icmp eq i32 %7, 1
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %8 = load i8*, i8** %buf.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx, align 1
  %10 = load i8*, i8** @vbuf, align 4
  %11 = load i32, i32* @vblen, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* @vblen, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 %9, i8* %arrayidx5, align 1
  br label %if.end10

if.else:                                          ; preds = %if.end
  %12 = load i32, i32* %blen.addr, align 4
  %cmp6 = icmp sgt i32 %12, 1
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.else
  %13 = load i8*, i8** @vbuf, align 4
  %14 = load i32, i32* @vblen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i8*, i8** %buf.addr, align 4
  %16 = load i32, i32* %blen.addr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr, i8* %15, i32 %16, i32 1, i1 false)
  %17 = load i32, i32* %blen.addr, align 4
  %18 = load i32, i32* @vblen, align 4
  %add8 = add nsw i32 %18, %17
  store i32 %add8, i32* @vblen, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then4
  %19 = load i8*, i8** @vbuf, align 4
  %20 = load i32, i32* @vblen, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %19, i32 %20
  store i8 0, i8* %arrayidx11, align 1
  %21 = load i8*, i8** @vbuf, align 4
  ret i8* %21
}

declare i32 @putchar(i32) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare i8* @strchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @getint() #0 {
entry:
  %retval = alloca i32, align 4
  %ret = alloca i64, align 8
  %call = call i64 @getintmax()
  store i64 %call, i64* %ret, align 8
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64, i64* %ret, align 8
  %conv = trunc i64 %1 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i64, i64* %ret, align 8
  %cmp1 = icmp sgt i64 %2, 2147483647
  br i1 %cmp1, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %3 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  call void @printf_erange(i8* %5)
  store i64 2147483647, i64* %ret, align 8
  br label %if.end11

if.else:                                          ; preds = %if.end
  %6 = load i64, i64* %ret, align 8
  %cmp5 = icmp slt i64 %6, -2147483648
  br i1 %cmp5, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.else
  %7 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word9, align 4
  call void @printf_erange(i8* %9)
  store i64 -2147483648, i64* %ret, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.else
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then3
  %10 = load i64, i64* %ret, align 8
  %conv12 = trunc i64 %10 to i32
  store i32 %conv12, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end11, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @ferror(%struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare void @sh_wrerror() #1

declare void @clearerr(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @getchr() #0 {
entry:
  %retval = alloca i32, align 4
  %ret = alloca i32, align 4
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %ret, align 4
  %5 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 0
  %6 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %6, %struct.word_list** @garglist, align 4
  %7 = load i32, i32* %ret, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @vbprintf(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  %nlen = alloca i32, align 4
  %blen = alloca i32, align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i8*, i8** @vbuf, align 4
  %1 = load i32, i32* @vblen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i32, i32* @vbsize, align 4
  %3 = load i32, i32* @vblen, align 4
  %sub = sub i32 %2, %3
  %4 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vsnprintf(i8* %add.ptr, i32 %sub, i8* %4, i32* %arraydecay2)
  store i32 %call, i32* %blen, align 4
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay34 = bitcast i32* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  %5 = load i32, i32* @vblen, align 4
  %6 = load i32, i32* %blen, align 4
  %add = add nsw i32 %5, %6
  %add5 = add nsw i32 %add, 1
  store i32 %add5, i32* %nlen, align 4
  %7 = load i32, i32* %nlen, align 4
  %8 = load i32, i32* @vbsize, align 4
  %cmp = icmp uge i32 %7, %8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %nlen, align 4
  %add6 = add i32 %9, 63
  %shr = lshr i32 %add6, 6
  %shl = shl i32 %shr, 6
  store i32 %shl, i32* @vbsize, align 4
  %10 = load i8*, i8** @vbuf, align 4
  %11 = load i32, i32* @vbsize, align 4
  %call7 = call i8* @sh_xrealloc(i8* %10, i32 %11, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 1050)
  store i8* %call7, i8** @vbuf, align 4
  %arraydecay8 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay89 = bitcast i32* %arraydecay8 to i8*
  call void @llvm.va_start(i8* %arraydecay89)
  %12 = load i8*, i8** @vbuf, align 4
  %13 = load i32, i32* @vblen, align 4
  %add.ptr10 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i32, i32* @vbsize, align 4
  %15 = load i32, i32* @vblen, align 4
  %sub11 = sub i32 %14, %15
  %16 = load i8*, i8** %format.addr, align 4
  %arraydecay12 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call13 = call i32 @vsnprintf(i8* %add.ptr10, i32 %sub11, i8* %16, i32* %arraydecay12)
  store i32 %call13, i32* %blen, align 4
  %arraydecay14 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1415 = bitcast i32* %arraydecay14 to i8*
  call void @llvm.va_end(i8* %arraydecay1415)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %17 = load i32, i32* %blen, align 4
  %18 = load i32, i32* @vblen, align 4
  %add16 = add nsw i32 %18, %17
  store i32 %add16, i32* @vblen, align 4
  %19 = load i8*, i8** @vbuf, align 4
  %20 = load i32, i32* @vblen, align 4
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 %20
  store i8 0, i8* %arrayidx, align 1
  %21 = load i32, i32* %blen, align 4
  ret i32 %21
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal i8* @getstr() #0 {
entry:
  %retval = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  store i8* %3, i8** %ret, align 4
  %4 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 0
  %5 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %5, %struct.word_list** @garglist, align 4
  %6 = load i8*, i8** %ret, align 4
  store i8* %6, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %7 = load i8*, i8** %retval, align 4
  ret i8* %7
}

declare i32 @strlen(i8*) #1

declare void @builtin_warning(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal i64 @getintmax() #0 {
entry:
  %retval = alloca i64, align 8
  %ret = alloca i64, align 8
  %ep = alloca i8*, align 4
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp2 = icmp eq i32 %conv, 39
  br i1 %cmp2, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 34
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %if.end
  %call = call i64 @asciicode()
  store i64 %call, i64* %retval, align 8
  br label %return

if.end11:                                         ; preds = %lor.lhs.false
  %call12 = call i32* @__errno_location()
  store i32 0, i32* %call12, align 4
  %9 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word14, align 4
  %call15 = call i64 @strtoimax(i8* %11, i8** %ep, i32 0)
  store i64 %call15, i64* %ret, align 8
  %12 = load i8*, i8** %ep, align 4
  %13 = load i8, i8* %12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end11
  %14 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word17 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word18, align 4
  call void @sh_invalidnum(i8* %16)
  store i32 1, i32* @conversion_error, align 4
  br label %if.end26

if.else:                                          ; preds = %if.end11
  %call19 = call i32* @__errno_location()
  %17 = load i32, i32* %call19, align 4
  %cmp20 = icmp eq i32 %17, 34
  br i1 %cmp20, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.else
  %18 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word23 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word23, align 4
  %word24 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word24, align 4
  call void @printf_erange(i8* %20)
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.else
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then16
  %21 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 0
  %22 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %22, %struct.word_list** @garglist, align 4
  %23 = load i64, i64* %ret, align 8
  store i64 %23, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end26, %if.then10, %if.then
  %24 = load i64, i64* %retval, align 8
  ret i64 %24
}

declare i32 @time(i32*) #1

declare void @sv_tz(i8*) #1

declare %struct.tm* @localtime(i32*) #1

declare i32 @strftime(i8*, i32, i8*, %struct.tm*) #1

; Function Attrs: noinline nounwind
define internal i32 @printstr(i8* %fmt, i8* %string, i32 %len, i32 %fieldwidth, i32 %precision) #0 {
entry:
  %retval = alloca i32, align 4
  %fmt.addr = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %fieldwidth.addr = alloca i32, align 4
  %precision.addr = alloca i32, align 4
  %padlen = alloca i32, align 4
  %nc = alloca i32, align 4
  %ljust = alloca i32, align 4
  %i = alloca i32, align 4
  %fw = alloca i32, align 4
  %pr = alloca i32, align 4
  %mfw = alloca i64, align 8
  %mpr = alloca i64, align 8
  %b = alloca [2 x i8], align 1
  %b148 = alloca [2 x i8], align 1
  %b179 = alloca [2 x i8], align 1
  store i8* %fmt, i8** %fmt.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %fieldwidth, i32* %fieldwidth.addr, align 4
  store i32 %precision, i32* %precision.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %len.addr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %fmt.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, 37
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %4 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %fmt.addr, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i32 0, i32* %fw, align 4
  store i32 0, i32* %ljust, align 4
  store i32 -1, i32* %pr, align 4
  store i64 0, i64* %mfw, align 8
  store i64 -1, i64* %mpr, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end11, %if.end5
  %5 = load i8*, i8** %fmt.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv6 = sext i8 %6 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 %conv6)
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i8*, i8** %fmt.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv7 = sext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 45
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %while.body
  store i32 1, i32* %ljust, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %while.body
  %9 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr12, i8** %fmt.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load i8*, i8** %fmt.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv13 = sext i8 %11 to i32
  %cmp14 = icmp eq i32 %conv13, 42
  br i1 %cmp14, label %if.then16, label %if.else

if.then16:                                        ; preds = %while.end
  %12 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr17, i8** %fmt.addr, align 4
  %13 = load i32, i32* %fieldwidth.addr, align 4
  store i32 %13, i32* %fw, align 4
  %14 = load i32, i32* %fw, align 4
  %cmp18 = icmp slt i32 %14, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.then16
  %15 = load i32, i32* %fw, align 4
  %sub = sub nsw i32 0, %15
  store i32 %sub, i32* %fw, align 4
  store i32 1, i32* %ljust, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.then16
  br label %if.end53

if.else:                                          ; preds = %while.end
  %16 = load i8*, i8** %fmt.addr, align 4
  %17 = load i8, i8* %16, align 1
  %conv22 = sext i8 %17 to i32
  %cmp23 = icmp sge i32 %conv22, 48
  br i1 %cmp23, label %land.lhs.true, label %if.end52

land.lhs.true:                                    ; preds = %if.else
  %18 = load i8*, i8** %fmt.addr, align 4
  %19 = load i8, i8* %18, align 1
  %conv25 = sext i8 %19 to i32
  %cmp26 = icmp sle i32 %conv25, 57
  br i1 %cmp26, label %if.then28, label %if.end52

if.then28:                                        ; preds = %land.lhs.true
  %20 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr29, i8** %fmt.addr, align 4
  %21 = load i8, i8* %20, align 1
  %conv30 = sext i8 %21 to i32
  %sub31 = sub nsw i32 %conv30, 48
  %conv32 = sext i32 %sub31 to i64
  store i64 %conv32, i64* %mfw, align 8
  br label %while.cond33

while.cond33:                                     ; preds = %while.body40, %if.then28
  %22 = load i8*, i8** %fmt.addr, align 4
  %23 = load i8, i8* %22, align 1
  %conv34 = sext i8 %23 to i32
  %cmp35 = icmp sge i32 %conv34, 48
  br i1 %cmp35, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond33
  %24 = load i8*, i8** %fmt.addr, align 4
  %25 = load i8, i8* %24, align 1
  %conv37 = sext i8 %25 to i32
  %cmp38 = icmp sle i32 %conv37, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond33
  %26 = phi i1 [ false, %while.cond33 ], [ %cmp38, %land.rhs ]
  br i1 %26, label %while.body40, label %while.end45

while.body40:                                     ; preds = %land.end
  %27 = load i64, i64* %mfw, align 8
  %mul = mul nsw i64 %27, 10
  %28 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr41 = getelementptr inbounds i8, i8* %28, i32 1
  store i8* %incdec.ptr41, i8** %fmt.addr, align 4
  %29 = load i8, i8* %28, align 1
  %conv42 = sext i8 %29 to i32
  %sub43 = sub nsw i32 %conv42, 48
  %conv44 = sext i32 %sub43 to i64
  %add = add nsw i64 %mul, %conv44
  store i64 %add, i64* %mfw, align 8
  br label %while.cond33

while.end45:                                      ; preds = %land.end
  %30 = load i64, i64* %mfw, align 8
  %cmp46 = icmp slt i64 %30, 0
  br i1 %cmp46, label %cond.true, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %while.end45
  %31 = load i64, i64* %mfw, align 8
  %cmp49 = icmp sgt i64 %31, 2147483647
  br i1 %cmp49, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false48, %while.end45
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false48
  %32 = load i64, i64* %mfw, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ 2147483647, %cond.true ], [ %32, %cond.false ]
  %conv51 = trunc i64 %cond to i32
  store i32 %conv51, i32* %fw, align 4
  br label %if.end52

if.end52:                                         ; preds = %cond.end, %land.lhs.true, %if.else
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.end21
  %33 = load i8*, i8** %fmt.addr, align 4
  %34 = load i8, i8* %33, align 1
  %conv54 = sext i8 %34 to i32
  %cmp55 = icmp eq i32 %conv54, 46
  br i1 %cmp55, label %if.then57, label %if.end107

if.then57:                                        ; preds = %if.end53
  %35 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr58 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr58, i8** %fmt.addr, align 4
  %36 = load i8*, i8** %fmt.addr, align 4
  %37 = load i8, i8* %36, align 1
  %conv59 = sext i8 %37 to i32
  %cmp60 = icmp eq i32 %conv59, 42
  br i1 %cmp60, label %if.then62, label %if.else64

if.then62:                                        ; preds = %if.then57
  %38 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr63, i8** %fmt.addr, align 4
  %39 = load i32, i32* %precision.addr, align 4
  store i32 %39, i32* %pr, align 4
  br label %if.end106

if.else64:                                        ; preds = %if.then57
  %40 = load i8*, i8** %fmt.addr, align 4
  %41 = load i8, i8* %40, align 1
  %conv65 = sext i8 %41 to i32
  %cmp66 = icmp sge i32 %conv65, 48
  br i1 %cmp66, label %land.lhs.true68, label %if.else104

land.lhs.true68:                                  ; preds = %if.else64
  %42 = load i8*, i8** %fmt.addr, align 4
  %43 = load i8, i8* %42, align 1
  %conv69 = sext i8 %43 to i32
  %cmp70 = icmp sle i32 %conv69, 57
  br i1 %cmp70, label %if.then72, label %if.else104

if.then72:                                        ; preds = %land.lhs.true68
  %44 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr73 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr73, i8** %fmt.addr, align 4
  %45 = load i8, i8* %44, align 1
  %conv74 = sext i8 %45 to i32
  %sub75 = sub nsw i32 %conv74, 48
  %conv76 = sext i32 %sub75 to i64
  store i64 %conv76, i64* %mpr, align 8
  br label %while.cond77

while.cond77:                                     ; preds = %while.body86, %if.then72
  %46 = load i8*, i8** %fmt.addr, align 4
  %47 = load i8, i8* %46, align 1
  %conv78 = sext i8 %47 to i32
  %cmp79 = icmp sge i32 %conv78, 48
  br i1 %cmp79, label %land.rhs81, label %land.end85

land.rhs81:                                       ; preds = %while.cond77
  %48 = load i8*, i8** %fmt.addr, align 4
  %49 = load i8, i8* %48, align 1
  %conv82 = sext i8 %49 to i32
  %cmp83 = icmp sle i32 %conv82, 57
  br label %land.end85

land.end85:                                       ; preds = %land.rhs81, %while.cond77
  %50 = phi i1 [ false, %while.cond77 ], [ %cmp83, %land.rhs81 ]
  br i1 %50, label %while.body86, label %while.end93

while.body86:                                     ; preds = %land.end85
  %51 = load i64, i64* %mpr, align 8
  %mul87 = mul nsw i64 %51, 10
  %52 = load i8*, i8** %fmt.addr, align 4
  %incdec.ptr88 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr88, i8** %fmt.addr, align 4
  %53 = load i8, i8* %52, align 1
  %conv89 = sext i8 %53 to i32
  %sub90 = sub nsw i32 %conv89, 48
  %conv91 = sext i32 %sub90 to i64
  %add92 = add nsw i64 %mul87, %conv91
  store i64 %add92, i64* %mpr, align 8
  br label %while.cond77

while.end93:                                      ; preds = %land.end85
  %54 = load i64, i64* %mpr, align 8
  %cmp94 = icmp slt i64 %54, 0
  br i1 %cmp94, label %cond.true99, label %lor.lhs.false96

lor.lhs.false96:                                  ; preds = %while.end93
  %55 = load i64, i64* %mpr, align 8
  %cmp97 = icmp sgt i64 %55, 2147483647
  br i1 %cmp97, label %cond.true99, label %cond.false100

cond.true99:                                      ; preds = %lor.lhs.false96, %while.end93
  br label %cond.end101

cond.false100:                                    ; preds = %lor.lhs.false96
  %56 = load i64, i64* %mpr, align 8
  br label %cond.end101

cond.end101:                                      ; preds = %cond.false100, %cond.true99
  %cond102 = phi i64 [ 2147483647, %cond.true99 ], [ %56, %cond.false100 ]
  %conv103 = trunc i64 %cond102 to i32
  store i32 %conv103, i32* %pr, align 4
  br label %if.end105

if.else104:                                       ; preds = %land.lhs.true68, %if.else64
  store i32 0, i32* %pr, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.else104, %cond.end101
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.then62
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %if.end53
  %57 = load i32, i32* %pr, align 4
  %cmp108 = icmp sge i32 %57, 0
  br i1 %cmp108, label %land.lhs.true110, label %cond.false114

land.lhs.true110:                                 ; preds = %if.end107
  %58 = load i32, i32* %pr, align 4
  %59 = load i32, i32* %len.addr, align 4
  %cmp111 = icmp sle i32 %58, %59
  br i1 %cmp111, label %cond.true113, label %cond.false114

cond.true113:                                     ; preds = %land.lhs.true110
  %60 = load i32, i32* %pr, align 4
  br label %cond.end115

cond.false114:                                    ; preds = %land.lhs.true110, %if.end107
  %61 = load i32, i32* %len.addr, align 4
  br label %cond.end115

cond.end115:                                      ; preds = %cond.false114, %cond.true113
  %cond116 = phi i32 [ %60, %cond.true113 ], [ %61, %cond.false114 ]
  store i32 %cond116, i32* %nc, align 4
  %62 = load i32, i32* %fw, align 4
  %63 = load i32, i32* %nc, align 4
  %sub117 = sub nsw i32 %62, %63
  store i32 %sub117, i32* %padlen, align 4
  %64 = load i32, i32* %padlen, align 4
  %cmp118 = icmp slt i32 %64, 0
  br i1 %cmp118, label %if.then120, label %if.end121

if.then120:                                       ; preds = %cond.end115
  store i32 0, i32* %padlen, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.then120, %cond.end115
  %65 = load i32, i32* %ljust, align 4
  %tobool122 = icmp ne i32 %65, 0
  br i1 %tobool122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.end121
  %66 = load i32, i32* %padlen, align 4
  %sub124 = sub nsw i32 0, %66
  store i32 %sub124, i32* %padlen, align 4
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.end121
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end125
  %67 = load i32, i32* %padlen, align 4
  %cmp126 = icmp sgt i32 %67, 0
  br i1 %cmp126, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.body
  %68 = load i64, i64* @tw, align 8
  %inc = add nsw i64 %68, 1
  store i64 %inc, i64* @tw, align 8
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 0
  store i8 32, i8* %arrayidx, align 1
  %arrayidx128 = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 1
  store i8 0, i8* %arrayidx128, align 1
  %69 = load i32, i32* @vflag, align 4
  %tobool129 = icmp ne i32 %69, 0
  br i1 %tobool129, label %if.then130, label %if.else132

if.then130:                                       ; preds = %do.body
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %b, i32 0, i32 0
  %call131 = call i8* @vbadd(i8* %arraydecay, i32 1)
  br label %if.end134

if.else132:                                       ; preds = %do.body
  %call133 = call i32 @putchar(i32 32)
  br label %if.end134

if.end134:                                        ; preds = %if.else132, %if.then130
  br label %do.body135

do.body135:                                       ; preds = %if.end134
  %70 = load volatile i32, i32* @terminating_signal, align 4
  %tobool136 = icmp ne i32 %70, 0
  br i1 %tobool136, label %if.then137, label %if.end138

if.then137:                                       ; preds = %do.body135
  %71 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %71)
  br label %if.end138

if.end138:                                        ; preds = %if.then137, %do.body135
  %72 = load volatile i32, i32* @interrupt_state, align 4
  %tobool139 = icmp ne i32 %72, 0
  br i1 %tobool139, label %if.then140, label %if.end141

if.then140:                                       ; preds = %if.end138
  call void @throw_to_top_level()
  br label %if.end141

if.end141:                                        ; preds = %if.then140, %if.end138
  br label %do.end

do.end:                                           ; preds = %if.end141
  br label %do.end142

do.end142:                                        ; preds = %do.end
  br label %for.inc

for.inc:                                          ; preds = %do.end142
  %73 = load i32, i32* %padlen, align 4
  %dec = add nsw i32 %73, -1
  store i32 %dec, i32* %padlen, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond143

for.cond143:                                      ; preds = %for.inc171, %for.end
  %74 = load i32, i32* %i, align 4
  %75 = load i32, i32* %nc, align 4
  %cmp144 = icmp slt i32 %74, %75
  br i1 %cmp144, label %for.body146, label %for.end173

for.body146:                                      ; preds = %for.cond143
  br label %do.body147

do.body147:                                       ; preds = %for.body146
  %76 = load i64, i64* @tw, align 8
  %inc149 = add nsw i64 %76, 1
  store i64 %inc149, i64* @tw, align 8
  %77 = load i8*, i8** %string.addr, align 4
  %78 = load i32, i32* %i, align 4
  %arrayidx150 = getelementptr inbounds i8, i8* %77, i32 %78
  %79 = load i8, i8* %arrayidx150, align 1
  %arrayidx151 = getelementptr inbounds [2 x i8], [2 x i8]* %b148, i32 0, i32 0
  store i8 %79, i8* %arrayidx151, align 1
  %arrayidx152 = getelementptr inbounds [2 x i8], [2 x i8]* %b148, i32 0, i32 1
  store i8 0, i8* %arrayidx152, align 1
  %80 = load i32, i32* @vflag, align 4
  %tobool153 = icmp ne i32 %80, 0
  br i1 %tobool153, label %if.then154, label %if.else157

if.then154:                                       ; preds = %do.body147
  %arraydecay155 = getelementptr inbounds [2 x i8], [2 x i8]* %b148, i32 0, i32 0
  %call156 = call i8* @vbadd(i8* %arraydecay155, i32 1)
  br label %if.end161

if.else157:                                       ; preds = %do.body147
  %81 = load i8*, i8** %string.addr, align 4
  %82 = load i32, i32* %i, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %81, i32 %82
  %83 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %83 to i32
  %call160 = call i32 @putchar(i32 %conv159)
  br label %if.end161

if.end161:                                        ; preds = %if.else157, %if.then154
  br label %do.body162

do.body162:                                       ; preds = %if.end161
  %84 = load volatile i32, i32* @terminating_signal, align 4
  %tobool163 = icmp ne i32 %84, 0
  br i1 %tobool163, label %if.then164, label %if.end165

if.then164:                                       ; preds = %do.body162
  %85 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %85)
  br label %if.end165

if.end165:                                        ; preds = %if.then164, %do.body162
  %86 = load volatile i32, i32* @interrupt_state, align 4
  %tobool166 = icmp ne i32 %86, 0
  br i1 %tobool166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.end165
  call void @throw_to_top_level()
  br label %if.end168

if.end168:                                        ; preds = %if.then167, %if.end165
  br label %do.end169

do.end169:                                        ; preds = %if.end168
  br label %do.end170

do.end170:                                        ; preds = %do.end169
  br label %for.inc171

for.inc171:                                       ; preds = %do.end170
  %87 = load i32, i32* %i, align 4
  %inc172 = add nsw i32 %87, 1
  store i32 %inc172, i32* %i, align 4
  br label %for.cond143

for.end173:                                       ; preds = %for.cond143
  br label %for.cond174

for.cond174:                                      ; preds = %for.inc199, %for.end173
  %88 = load i32, i32* %padlen, align 4
  %cmp175 = icmp slt i32 %88, 0
  br i1 %cmp175, label %for.body177, label %for.end201

for.body177:                                      ; preds = %for.cond174
  br label %do.body178

do.body178:                                       ; preds = %for.body177
  %89 = load i64, i64* @tw, align 8
  %inc180 = add nsw i64 %89, 1
  store i64 %inc180, i64* @tw, align 8
  %arrayidx181 = getelementptr inbounds [2 x i8], [2 x i8]* %b179, i32 0, i32 0
  store i8 32, i8* %arrayidx181, align 1
  %arrayidx182 = getelementptr inbounds [2 x i8], [2 x i8]* %b179, i32 0, i32 1
  store i8 0, i8* %arrayidx182, align 1
  %90 = load i32, i32* @vflag, align 4
  %tobool183 = icmp ne i32 %90, 0
  br i1 %tobool183, label %if.then184, label %if.else187

if.then184:                                       ; preds = %do.body178
  %arraydecay185 = getelementptr inbounds [2 x i8], [2 x i8]* %b179, i32 0, i32 0
  %call186 = call i8* @vbadd(i8* %arraydecay185, i32 1)
  br label %if.end189

if.else187:                                       ; preds = %do.body178
  %call188 = call i32 @putchar(i32 32)
  br label %if.end189

if.end189:                                        ; preds = %if.else187, %if.then184
  br label %do.body190

do.body190:                                       ; preds = %if.end189
  %91 = load volatile i32, i32* @terminating_signal, align 4
  %tobool191 = icmp ne i32 %91, 0
  br i1 %tobool191, label %if.then192, label %if.end193

if.then192:                                       ; preds = %do.body190
  %92 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %92)
  br label %if.end193

if.end193:                                        ; preds = %if.then192, %do.body190
  %93 = load volatile i32, i32* @interrupt_state, align 4
  %tobool194 = icmp ne i32 %93, 0
  br i1 %tobool194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %if.end193
  call void @throw_to_top_level()
  br label %if.end196

if.end196:                                        ; preds = %if.then195, %if.end193
  br label %do.end197

do.end197:                                        ; preds = %if.end196
  br label %do.end198

do.end198:                                        ; preds = %do.end197
  br label %for.inc199

for.inc199:                                       ; preds = %do.end198
  %94 = load i32, i32* %padlen, align 4
  %inc200 = add nsw i32 %94, 1
  store i32 %inc200, i32* %padlen, align 4
  br label %for.cond174

for.end201:                                       ; preds = %for.cond174
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call202 = call i32 @ferror(%struct._IO_FILE* %95)
  %tobool203 = icmp ne i32 %call202, 0
  %cond204 = select i1 %tobool203, i32 -1, i32 0
  store i32 %cond204, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end201, %if.then
  %96 = load i32, i32* %retval, align 4
  ret i32 %96
}

declare %struct.variable* @bind_var_to_int(i8*, i64) #1

; Function Attrs: noinline nounwind
define internal i8* @bexpand(i8* %string, i32 %len, i32* %sawc, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %sawc.addr = alloca i32*, align 4
  %lenp.addr = alloca i32*, align 4
  %temp = alloca i32, align 4
  %ret = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  %mbch = alloca [25 x i8], align 1
  %mbind = alloca i32, align 4
  %mblen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32* %sawc, i32** %sawc.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* %len.addr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end6

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i32*, i32** %sawc.addr, align 4
  %tobool = icmp ne i32* %2, null
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load i32*, i32** %sawc.addr, align 4
  store i32 0, i32* %3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load i32*, i32** %lenp.addr, align 4
  %tobool3 = icmp ne i32* %4, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %5 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %5, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %6 = load i32, i32* %len.addr, align 4
  %add = add nsw i32 %6, 1
  %call = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 961)
  store i8* %call, i8** %ret, align 4
  %7 = load i8*, i8** %ret, align 4
  store i8* %7, i8** %r, align 4
  %8 = load i8*, i8** %string.addr, align 4
  store i8* %8, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.end, %if.then16, %if.end6
  %9 = load i8*, i8** %s, align 4
  %tobool7 = icmp ne i8* %9, null
  br i1 %tobool7, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %10 = load i8*, i8** %s, align 4
  %11 = load i8, i8* %10, align 1
  %conv = sext i8 %11 to i32
  %tobool8 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %12 = phi i1 [ false, %for.cond ], [ %tobool8, %land.rhs ]
  br i1 %12, label %for.body, label %for.end32

for.body:                                         ; preds = %land.end
  %13 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %14 = load i8, i8* %13, align 1
  store i8 %14, i8* %c, align 1
  %15 = load i8, i8* %c, align 1
  %conv9 = sext i8 %15 to i32
  %cmp10 = icmp ne i32 %conv9, 92
  br i1 %cmp10, label %if.then16, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %for.body
  %16 = load i8*, i8** %s, align 4
  %17 = load i8, i8* %16, align 1
  %conv13 = sext i8 %17 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %lor.lhs.false12, %for.body
  %18 = load i8, i8* %c, align 1
  %19 = load i8*, i8** %r, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr17, i8** %r, align 4
  store i8 %18, i8* %19, align 1
  br label %for.cond

if.end18:                                         ; preds = %lor.lhs.false12
  store i32 0, i32* %temp, align 4
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 0
  call void @llvm.memset.p0i8.i32(i8* %arraydecay, i8 0, i32 25, i32 1, i1 false)
  %20 = load i8*, i8** %s, align 4
  %arraydecay19 = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 0
  %call20 = call i32 @tescape(i8* %20, i8* %arraydecay19, i32* %mblen, i32* %temp)
  %21 = load i8*, i8** %s, align 4
  %add.ptr = getelementptr inbounds i8, i8* %21, i32 %call20
  store i8* %add.ptr, i8** %s, align 4
  %22 = load i32, i32* %temp, align 4
  %tobool21 = icmp ne i32 %22, 0
  br i1 %tobool21, label %if.then22, label %if.end26

if.then22:                                        ; preds = %if.end18
  %23 = load i32*, i32** %sawc.addr, align 4
  %tobool23 = icmp ne i32* %23, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.then22
  %24 = load i32*, i32** %sawc.addr, align 4
  store i32 1, i32* %24, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %if.then22
  br label %for.end32

if.end26:                                         ; preds = %if.end18
  store i32 0, i32* %mbind, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc, %if.end26
  %25 = load i32, i32* %mbind, align 4
  %26 = load i32, i32* %mblen, align 4
  %cmp28 = icmp slt i32 %25, %26
  br i1 %cmp28, label %for.body30, label %for.end

for.body30:                                       ; preds = %for.cond27
  %27 = load i32, i32* %mbind, align 4
  %arrayidx = getelementptr inbounds [25 x i8], [25 x i8]* %mbch, i32 0, i32 %27
  %28 = load i8, i8* %arrayidx, align 1
  %29 = load i8*, i8** %r, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %incdec.ptr31, i8** %r, align 4
  store i8 %28, i8* %29, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body30
  %30 = load i32, i32* %mbind, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %mbind, align 4
  br label %for.cond27

for.end:                                          ; preds = %for.cond27
  br label %for.cond

for.end32:                                        ; preds = %if.end25, %land.end
  %31 = load i8*, i8** %r, align 4
  store i8 0, i8* %31, align 1
  %32 = load i32*, i32** %lenp.addr, align 4
  %tobool33 = icmp ne i32* %32, null
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %for.end32
  %33 = load i8*, i8** %r, align 4
  %34 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %33 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %34 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %35 = load i32*, i32** %lenp.addr, align 4
  store i32 %sub.ptr.sub, i32* %35, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.then34, %for.end32
  %36 = load i8*, i8** %ret, align 4
  store i8* %36, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end35, %if.end5
  %37 = load i8*, i8** %retval, align 4
  ret i8* %37
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

declare i8* @sh_backslash_quote(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @mklong(i8* %str, i8* %modifiers, i32 %mlen) #0 {
entry:
  %str.addr = alloca i8*, align 4
  %modifiers.addr = alloca i8*, align 4
  %mlen.addr = alloca i32, align 4
  %len = alloca i32, align 4
  %slen = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  store i8* %modifiers, i8** %modifiers.addr, align 4
  store i32 %mlen, i32* %mlen.addr, align 4
  %0 = load i8*, i8** %str.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %slen, align 4
  %1 = load i32, i32* %slen, align 4
  %2 = load i32, i32* %mlen.addr, align 4
  %add = add i32 %1, %2
  %add1 = add i32 %add, 1
  store i32 %add1, i32* %len, align 4
  %3 = load i32, i32* %len, align 4
  %4 = load i32, i32* @conv_bufsize, align 4
  %cmp = icmp ugt i32 %3, %4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %len, align 4
  %add2 = add i32 %5, 1023
  %shr = lshr i32 %add2, 10
  %shl = shl i32 %shr, 10
  store i32 %shl, i32* @conv_bufsize, align 4
  %6 = load i8*, i8** @conv_buf, align 4
  %7 = load i32, i32* @conv_bufsize, align 4
  %call3 = call i8* @sh_xrealloc(i8* %6, i32 %7, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 1081)
  store i8* %call3, i8** @conv_buf, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load i8*, i8** @conv_buf, align 4
  %9 = load i8*, i8** %str.addr, align 4
  %10 = load i32, i32* %slen, align 4
  %sub = sub i32 %10, 1
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %8, i8* %9, i32 %sub, i32 1, i1 false)
  %11 = load i8*, i8** @conv_buf, align 4
  %12 = load i32, i32* %slen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %add.ptr4 = getelementptr inbounds i8, i8* %add.ptr, i32 -1
  %13 = load i8*, i8** %modifiers.addr, align 4
  %14 = load i32, i32* %mlen.addr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr4, i8* %13, i32 %14, i32 1, i1 false)
  %15 = load i8*, i8** %str.addr, align 4
  %16 = load i32, i32* %slen, align 4
  %sub5 = sub i32 %16, 1
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 %sub5
  %17 = load i8, i8* %arrayidx, align 1
  %18 = load i8*, i8** @conv_buf, align 4
  %19 = load i32, i32* %len, align 4
  %sub6 = sub i32 %19, 2
  %arrayidx7 = getelementptr inbounds i8, i8* %18, i32 %sub6
  store i8 %17, i8* %arrayidx7, align 1
  %20 = load i8*, i8** @conv_buf, align 4
  %21 = load i32, i32* %len, align 4
  %sub8 = sub i32 %21, 1
  %arrayidx9 = getelementptr inbounds i8, i8* %20, i32 %sub8
  store i8 0, i8* %arrayidx9, align 1
  %22 = load i8*, i8** @conv_buf, align 4
  ret i8* %22
}

; Function Attrs: noinline nounwind
define internal i64 @getuintmax() #0 {
entry:
  %retval = alloca i64, align 8
  %ret = alloca i64, align 8
  %ep = alloca i8*, align 4
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 0, i64* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp2 = icmp eq i32 %conv, 39
  br i1 %cmp2, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 34
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %if.end
  %call = call i64 @asciicode()
  store i64 %call, i64* %retval, align 8
  br label %return

if.end11:                                         ; preds = %lor.lhs.false
  %call12 = call i32* @__errno_location()
  store i32 0, i32* %call12, align 4
  %9 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word14, align 4
  %call15 = call i64 @strtoumax(i8* %11, i8** %ep, i32 0)
  store i64 %call15, i64* %ret, align 8
  %12 = load i8*, i8** %ep, align 4
  %13 = load i8, i8* %12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end11
  %14 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word17 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word18, align 4
  call void @sh_invalidnum(i8* %16)
  store i64 0, i64* %ret, align 8
  store i32 1, i32* @conversion_error, align 4
  br label %if.end26

if.else:                                          ; preds = %if.end11
  %call19 = call i32* @__errno_location()
  %17 = load i32, i32* %call19, align 4
  %cmp20 = icmp eq i32 %17, 34
  br i1 %cmp20, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.else
  %18 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word23 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word23, align 4
  %word24 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word24, align 4
  call void @printf_erange(i8* %20)
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.else
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then16
  %21 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 0
  %22 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %22, %struct.word_list** @garglist, align 4
  %23 = load i64, i64* %ret, align 8
  store i64 %23, i64* %retval, align 8
  br label %return

return:                                           ; preds = %if.end26, %if.then10, %if.then
  %24 = load i64, i64* %retval, align 8
  ret i64 %24
}

; Function Attrs: noinline nounwind
define internal double @getfloatmax() #0 {
entry:
  %retval = alloca double, align 8
  %ret = alloca double, align 8
  %ep = alloca i8*, align 4
  %0 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store double 0.000000e+00, double* %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp2 = icmp eq i32 %conv, 39
  br i1 %cmp2, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %5 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %5, i32 0, i32 1
  %6 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 34
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %lor.lhs.false, %if.end
  %call = call i64 @asciicode()
  %conv11 = sitofp i64 %call to double
  store double %conv11, double* %retval, align 8
  br label %return

if.end12:                                         ; preds = %lor.lhs.false
  %call13 = call i32* @__errno_location()
  store i32 0, i32* %call13, align 4
  %9 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word15, align 4
  %call16 = call double @strtod(i8* %11, i8** %ep)
  store double %call16, double* %ret, align 8
  %12 = load i8*, i8** %ep, align 4
  %13 = load i8, i8* %12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.end12
  %14 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word18 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word18, align 4
  %word19 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word19, align 4
  call void @sh_invalidnum(i8* %16)
  store double 0.000000e+00, double* %ret, align 8
  store i32 1, i32* @conversion_error, align 4
  br label %if.end27

if.else:                                          ; preds = %if.end12
  %call20 = call i32* @__errno_location()
  %17 = load i32, i32* %call20, align 4
  %cmp21 = icmp eq i32 %17, 34
  br i1 %cmp21, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.else
  %18 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word25, align 4
  call void @printf_erange(i8* %20)
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.then17
  %21 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 0
  %22 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %22, %struct.word_list** @garglist, align 4
  %23 = load double, double* %ret, align 8
  store double %23, double* %retval, align 8
  br label %return

return:                                           ; preds = %if.end27, %if.then10, %if.then
  %24 = load double, double* %retval, align 8
  ret double %24
}

; Function Attrs: nounwind readonly
declare i32 @isxdigit(i32) #3

declare i32 @u32cconv(i32, i8*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #4

declare i32 @vsnprintf(i8*, i32, i8*, i32*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #4

; Function Attrs: noinline nounwind
define internal void @printf_erange(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i32 0, i32 0))
  %0 = load i8*, i8** %s.addr, align 4
  %call1 = call i8* @strerror(i32 34)
  call void (i8*, ...) @builtin_error(i8* %call, i8* %0, i8* %call1)
  ret void
}

declare i8* @strerror(i32) #1

; Function Attrs: noinline nounwind
define internal i64 @asciicode() #0 {
entry:
  %ch = alloca i64, align 8
  %wc = alloca i32, align 4
  %mblength = alloca i32, align 4
  %slen = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 1
  %call = call i32 @strlen(i8* %add.ptr)
  store i32 %call, i32* %slen, align 4
  %call2 = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call2, 1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word4, align 4
  %add.ptr5 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i32, i32* %slen, align 4
  %call6 = call i32 @mblen(i8* %add.ptr5, i32 %7)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call6, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %mblength, align 4
  %8 = load i32, i32* %mblength, align 4
  %cmp7 = icmp ugt i32 %8, 1
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %9 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word9, align 4
  %add.ptr10 = getelementptr inbounds i8, i8* %11, i32 1
  %12 = load i32, i32* %slen, align 4
  %call11 = call i32 @mbtowc(i32* %wc, i8* %add.ptr10, i32 %12)
  store i32 %call11, i32* %mblength, align 4
  %13 = load i32, i32* %wc, align 4
  %conv = sext i32 %13 to i64
  store i64 %conv, i64* %ch, align 8
  br label %if.end

if.else:                                          ; preds = %cond.end
  %14 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %word12 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word12, align 4
  %word13 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word13, align 4
  %arrayidx = getelementptr inbounds i8, i8* %16, i32 1
  %17 = load i8, i8* %arrayidx, align 1
  %conv14 = zext i8 %17 to i64
  store i64 %conv14, i64* %ch, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %18 = load %struct.word_list*, %struct.word_list** @garglist, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 0
  %19 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %19, %struct.word_list** @garglist, align 4
  %20 = load i64, i64* %ch, align 8
  ret i64 %20
}

declare i32* @__errno_location() #1

declare i64 @strtoimax(i8*, i8**, i32) #1

declare void @sh_invalidnum(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @mblen(i8*, i32) #1

declare i32 @mbtowc(i32*, i8*, i32) #1

declare i64 @strtoumax(i8*, i8**, i32) #1

declare double @strtod(i8*, i8**) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare %struct.variable* @assign_array_element(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
