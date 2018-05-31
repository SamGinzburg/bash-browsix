; ModuleID = 'parse-colors.c'
source_filename = "parse-colors.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.bin_str = type { i32, i8* }
%struct._color_ext_type = type { %struct.bin_str, %struct.bin_str, %struct._color_ext_type* }

@.str = private unnamed_addr constant [3 x i8] c"\1B[\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"01;34\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"01;36\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"33\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"01;35\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"01;33\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"01;32\00", align 1
@.str.9 = private unnamed_addr constant [6 x i8] c"37;41\00", align 1
@.str.10 = private unnamed_addr constant [6 x i8] c"30;43\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"37;44\00", align 1
@.str.12 = private unnamed_addr constant [6 x i8] c"34;42\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"30;42\00", align 1
@.str.14 = private unnamed_addr constant [6 x i8] c"30;41\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"\1B[K\00", align 1
@_rl_color_indicator = global [24 x %struct.bin_str] [%struct.bin_str { i32 2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0) }, %struct.bin_str { i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0) }, %struct.bin_str zeroinitializer, %struct.bin_str { i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0) }, %struct.bin_str zeroinitializer, %struct.bin_str zeroinitializer, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0) }, %struct.bin_str { i32 2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0) }, %struct.bin_str zeroinitializer, %struct.bin_str zeroinitializer, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.9, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.12, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0) }, %struct.bin_str { i32 5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.14, i32 0, i32 0) }, %struct.bin_str zeroinitializer, %struct.bin_str { i32 3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i32 0, i32 0) }], align 4
@.str.16 = private unnamed_addr constant [10 x i8] c"LS_COLORS\00", align 1
@_rl_color_ext_list = external global %struct._color_ext_type*, align 4
@.str.17 = private unnamed_addr constant [3 x i8] c"??\00", align 1
@color_buf = internal global i8* null, align 4
@indicator_name = internal constant [25 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i32 0, i32 0), i8* null], align 4
@.str.18 = private unnamed_addr constant [35 x i8] c"LS_COLORS: unrecognized prefix: %s\00", align 1
@.str.19 = private unnamed_addr constant [28 x i8] c"LS_COLORS: syntax error: %s\00", align 1
@.str.20 = private unnamed_addr constant [52 x i8] c"unparsable value for LS_COLORS environment variable\00", align 1
@_rl_colored_stats = external global i32, align 4
@.str.21 = private unnamed_addr constant [3 x i8] c"lc\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"rc\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"ec\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"rs\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"no\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"fi\00", align 1
@.str.27 = private unnamed_addr constant [3 x i8] c"di\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"ln\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"pi\00", align 1
@.str.30 = private unnamed_addr constant [3 x i8] c"so\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"bd\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@.str.33 = private unnamed_addr constant [3 x i8] c"mi\00", align 1
@.str.34 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"do\00", align 1
@.str.37 = private unnamed_addr constant [3 x i8] c"su\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"sg\00", align 1
@.str.39 = private unnamed_addr constant [3 x i8] c"st\00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c"ow\00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c"tw\00", align 1
@.str.42 = private unnamed_addr constant [3 x i8] c"ca\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"mh\00", align 1
@.str.44 = private unnamed_addr constant [3 x i8] c"cl\00", align 1

; Function Attrs: noinline nounwind
define void @_rl_parse_colors() #0 {
entry:
  %p = alloca i8*, align 4
  %buf = alloca i8*, align 4
  %state = alloca i32, align 4
  %ind_no = alloca i32, align 4
  %label = alloca [3 x i8], align 1
  %ext = alloca %struct._color_ext_type*, align 4
  %e = alloca %struct._color_ext_type*, align 4
  %e2 = alloca %struct._color_ext_type*, align 4
  %call = call i8* @sh_get_env_value(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0))
  store i8* %call, i8** %p, align 4
  %0 = load i8*, i8** %p, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %p, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct._color_ext_type* null, %struct._color_ext_type** @_rl_color_ext_list, align 4
  br label %if.end121

if.end:                                           ; preds = %lor.lhs.false
  store %struct._color_ext_type* null, %struct._color_ext_type** %ext, align 4
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 0
  %call3 = call i8* @strcpy(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0))
  %3 = load i8*, i8** %p, align 4
  %call4 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call4
  %call5 = call i8* @xmalloc(i32 %add)
  %4 = load i8*, i8** %p, align 4
  %call6 = call i8* @strcpy(i8* %call5, i8* %4)
  store i8* %call6, i8** @color_buf, align 4
  store i8* %call6, i8** %buf, align 4
  store i32 1, i32* %state, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog110, %if.end
  %5 = load i32, i32* %state, align 4
  %cmp7 = icmp sgt i32 %5, 0
  br i1 %cmp7, label %while.body, label %while.end111

while.body:                                       ; preds = %while.cond
  %6 = load i32, i32* %state, align 4
  switch i32 %6, label %sw.epilog110 [
    i32 1, label %sw.bb
    i32 2, label %sw.bb20
    i32 3, label %sw.bb25
    i32 4, label %sw.bb86
  ]

sw.bb:                                            ; preds = %while.body
  %7 = load i8*, i8** %p, align 4
  %8 = load i8, i8* %7, align 1
  %conv9 = sext i8 %8 to i32
  switch i32 %conv9, label %sw.default [
    i32 58, label %sw.bb10
    i32 42, label %sw.bb11
    i32 0, label %sw.bb18
  ]

sw.bb10:                                          ; preds = %sw.bb
  %9 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %sw.bb
  %call12 = call i8* @xmalloc(i32 20)
  %10 = bitcast i8* %call12 to %struct._color_ext_type*
  store %struct._color_ext_type* %10, %struct._color_ext_type** %ext, align 4
  %11 = load %struct._color_ext_type*, %struct._color_ext_type** @_rl_color_ext_list, align 4
  %12 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %next = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %12, i32 0, i32 2
  store %struct._color_ext_type* %11, %struct._color_ext_type** %next, align 4
  %13 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  store %struct._color_ext_type* %13, %struct._color_ext_type** @_rl_color_ext_list, align 4
  %14 = load i8*, i8** %p, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr13, i8** %p, align 4
  %15 = load i8*, i8** %buf, align 4
  %16 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext14 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %16, i32 0, i32 0
  %string = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext14, i32 0, i32 1
  store i8* %15, i8** %string, align 4
  %17 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext15 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %17, i32 0, i32 0
  %len = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext15, i32 0, i32 0
  %call16 = call zeroext i1 @get_funky_string(i8** %buf, i8** %p, i1 zeroext true, i32* %len)
  %cond = select i1 %call16, i32 4, i32 -1
  store i32 %cond, i32* %state, align 4
  br label %sw.epilog

sw.bb18:                                          ; preds = %sw.bb
  store i32 0, i32* %state, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %sw.bb
  %18 = load i8*, i8** %p, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr19, i8** %p, align 4
  %19 = load i8, i8* %18, align 1
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 0
  store i8 %19, i8* %arrayidx, align 1
  store i32 2, i32* %state, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb18, %sw.bb11, %sw.bb10
  br label %sw.epilog110

sw.bb20:                                          ; preds = %while.body
  %20 = load i8*, i8** %p, align 4
  %21 = load i8, i8* %20, align 1
  %tobool = icmp ne i8 %21, 0
  br i1 %tobool, label %if.then21, label %if.else

if.then21:                                        ; preds = %sw.bb20
  %22 = load i8*, i8** %p, align 4
  %incdec.ptr22 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr22, i8** %p, align 4
  %23 = load i8, i8* %22, align 1
  %arrayidx23 = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 1
  store i8 %23, i8* %arrayidx23, align 1
  store i32 3, i32* %state, align 4
  br label %if.end24

if.else:                                          ; preds = %sw.bb20
  store i32 -1, i32* %state, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then21
  br label %sw.epilog110

sw.bb25:                                          ; preds = %while.body
  store i32 -1, i32* %state, align 4
  %24 = load i8*, i8** %p, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr26, i8** %p, align 4
  %25 = load i8, i8* %24, align 1
  %conv27 = sext i8 %25 to i32
  %cmp28 = icmp eq i32 %conv27, 61
  br i1 %cmp28, label %if.then30, label %if.end85

if.then30:                                        ; preds = %sw.bb25
  store i32 0, i32* %ind_no, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then30
  %26 = load i32, i32* %ind_no, align 4
  %arrayidx31 = getelementptr inbounds [25 x i8*], [25 x i8*]* @indicator_name, i32 0, i32 %26
  %27 = load i8*, i8** %arrayidx31, align 4
  %cmp32 = icmp ne i8* %27, null
  br i1 %cmp32, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx34 = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 0
  %28 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %28 to i32
  %29 = load i32, i32* %ind_no, align 4
  %arrayidx36 = getelementptr inbounds [25 x i8*], [25 x i8*]* @indicator_name, i32 0, i32 %29
  %30 = load i8*, i8** %arrayidx36, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %30, i32 0
  %31 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %31 to i32
  %cmp39 = icmp eq i32 %conv35, %conv38
  br i1 %cmp39, label %land.lhs.true, label %if.end54

land.lhs.true:                                    ; preds = %for.body
  %arraydecay41 = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 0
  %32 = load i32, i32* %ind_no, align 4
  %arrayidx42 = getelementptr inbounds [25 x i8*], [25 x i8*]* @indicator_name, i32 0, i32 %32
  %33 = load i8*, i8** %arrayidx42, align 4
  %call43 = call i32 @strcmp(i8* %arraydecay41, i8* %33)
  %cmp44 = icmp eq i32 %call43, 0
  br i1 %cmp44, label %if.then46, label %if.end54

if.then46:                                        ; preds = %land.lhs.true
  %34 = load i8*, i8** %buf, align 4
  %35 = load i32, i32* %ind_no, align 4
  %arrayidx47 = getelementptr inbounds [24 x %struct.bin_str], [24 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 %35
  %string48 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %arrayidx47, i32 0, i32 1
  store i8* %34, i8** %string48, align 4
  %36 = load i32, i32* %ind_no, align 4
  %arrayidx49 = getelementptr inbounds [24 x %struct.bin_str], [24 x %struct.bin_str]* @_rl_color_indicator, i32 0, i32 %36
  %len50 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %arrayidx49, i32 0, i32 0
  %call51 = call zeroext i1 @get_funky_string(i8** %buf, i8** %p, i1 zeroext false, i32* %len50)
  %cond53 = select i1 %call51, i32 1, i32 -1
  store i32 %cond53, i32* %state, align 4
  br label %for.end

if.end54:                                         ; preds = %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end54
  %37 = load i32, i32* %ind_no, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %ind_no, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then46, %for.cond
  %38 = load i32, i32* %state, align 4
  %cmp55 = icmp eq i32 %38, -1
  br i1 %cmp55, label %if.then57, label %if.end84

if.then57:                                        ; preds = %for.end
  %arraydecay58 = getelementptr inbounds [3 x i8], [3 x i8]* %label, i32 0, i32 0
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.18, i32 0, i32 0), i8* %arraydecay58)
  br label %while.cond59

while.cond59:                                     ; preds = %while.body67, %if.then57
  %39 = load i8*, i8** %p, align 4
  %tobool60 = icmp ne i8* %39, null
  br i1 %tobool60, label %land.lhs.true61, label %land.end

land.lhs.true61:                                  ; preds = %while.cond59
  %40 = load i8*, i8** %p, align 4
  %41 = load i8, i8* %40, align 1
  %conv62 = sext i8 %41 to i32
  %tobool63 = icmp ne i32 %conv62, 0
  br i1 %tobool63, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true61
  %42 = load i8*, i8** %p, align 4
  %43 = load i8, i8* %42, align 1
  %conv64 = sext i8 %43 to i32
  %cmp65 = icmp ne i32 %conv64, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true61, %while.cond59
  %44 = phi i1 [ false, %land.lhs.true61 ], [ false, %while.cond59 ], [ %cmp65, %land.rhs ]
  br i1 %44, label %while.body67, label %while.end

while.body67:                                     ; preds = %land.end
  %45 = load i8*, i8** %p, align 4
  %incdec.ptr68 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr68, i8** %p, align 4
  br label %while.cond59

while.end:                                        ; preds = %land.end
  %46 = load i8*, i8** %p, align 4
  %tobool69 = icmp ne i8* %46, null
  br i1 %tobool69, label %land.lhs.true70, label %if.else75

land.lhs.true70:                                  ; preds = %while.end
  %47 = load i8*, i8** %p, align 4
  %48 = load i8, i8* %47, align 1
  %conv71 = sext i8 %48 to i32
  %cmp72 = icmp eq i32 %conv71, 58
  br i1 %cmp72, label %if.then74, label %if.else75

if.then74:                                        ; preds = %land.lhs.true70
  store i32 1, i32* %state, align 4
  br label %if.end83

if.else75:                                        ; preds = %land.lhs.true70, %while.end
  %49 = load i8*, i8** %p, align 4
  %tobool76 = icmp ne i8* %49, null
  br i1 %tobool76, label %land.lhs.true77, label %if.end82

land.lhs.true77:                                  ; preds = %if.else75
  %50 = load i8*, i8** %p, align 4
  %51 = load i8, i8* %50, align 1
  %conv78 = sext i8 %51 to i32
  %cmp79 = icmp eq i32 %conv78, 0
  br i1 %cmp79, label %if.then81, label %if.end82

if.then81:                                        ; preds = %land.lhs.true77
  store i32 0, i32* %state, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then81, %land.lhs.true77, %if.else75
  br label %if.end83

if.end83:                                         ; preds = %if.end82, %if.then74
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %for.end
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %sw.bb25
  br label %sw.epilog110

sw.bb86:                                          ; preds = %while.body
  %52 = load i8*, i8** %p, align 4
  %incdec.ptr87 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr87, i8** %p, align 4
  %53 = load i8, i8* %52, align 1
  %conv88 = sext i8 %53 to i32
  %cmp89 = icmp eq i32 %conv88, 61
  br i1 %cmp89, label %if.then91, label %if.else98

if.then91:                                        ; preds = %sw.bb86
  %54 = load i8*, i8** %buf, align 4
  %55 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %seq = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %55, i32 0, i32 1
  %string92 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %seq, i32 0, i32 1
  store i8* %54, i8** %string92, align 4
  %56 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %seq93 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %56, i32 0, i32 1
  %len94 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %seq93, i32 0, i32 0
  %call95 = call zeroext i1 @get_funky_string(i8** %buf, i8** %p, i1 zeroext false, i32* %len94)
  %cond97 = select i1 %call95, i32 1, i32 -1
  store i32 %cond97, i32* %state, align 4
  br label %if.end99

if.else98:                                        ; preds = %sw.bb86
  store i32 -1, i32* %state, align 4
  br label %if.end99

if.end99:                                         ; preds = %if.else98, %if.then91
  %57 = load i32, i32* %state, align 4
  %cmp100 = icmp eq i32 %57, -1
  br i1 %cmp100, label %land.lhs.true102, label %if.end109

land.lhs.true102:                                 ; preds = %if.end99
  %58 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext103 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %58, i32 0, i32 0
  %string104 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext103, i32 0, i32 1
  %59 = load i8*, i8** %string104, align 4
  %tobool105 = icmp ne i8* %59, null
  br i1 %tobool105, label %if.then106, label %if.end109

if.then106:                                       ; preds = %land.lhs.true102
  %60 = load %struct._color_ext_type*, %struct._color_ext_type** %ext, align 4
  %ext107 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %60, i32 0, i32 0
  %string108 = getelementptr inbounds %struct.bin_str, %struct.bin_str* %ext107, i32 0, i32 1
  %61 = load i8*, i8** %string108, align 4
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.19, i32 0, i32 0), i8* %61)
  br label %if.end109

if.end109:                                        ; preds = %if.then106, %land.lhs.true102, %if.end99
  br label %sw.epilog110

sw.epilog110:                                     ; preds = %while.body, %if.end109, %if.end85, %if.end24, %sw.epilog
  br label %while.cond

while.end111:                                     ; preds = %while.cond
  %62 = load i32, i32* %state, align 4
  %cmp112 = icmp slt i32 %62, 0
  br i1 %cmp112, label %if.then114, label %if.end121

if.then114:                                       ; preds = %while.end111
  call void (i8*, ...) @_rl_errmsg(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.20, i32 0, i32 0))
  %63 = load i8*, i8** @color_buf, align 4
  call void @free(i8* %63)
  %64 = load %struct._color_ext_type*, %struct._color_ext_type** @_rl_color_ext_list, align 4
  store %struct._color_ext_type* %64, %struct._color_ext_type** %e, align 4
  br label %for.cond115

for.cond115:                                      ; preds = %for.body118, %if.then114
  %65 = load %struct._color_ext_type*, %struct._color_ext_type** %e, align 4
  %cmp116 = icmp ne %struct._color_ext_type* %65, null
  br i1 %cmp116, label %for.body118, label %for.end120

for.body118:                                      ; preds = %for.cond115
  %66 = load %struct._color_ext_type*, %struct._color_ext_type** %e, align 4
  store %struct._color_ext_type* %66, %struct._color_ext_type** %e2, align 4
  %67 = load %struct._color_ext_type*, %struct._color_ext_type** %e, align 4
  %next119 = getelementptr inbounds %struct._color_ext_type, %struct._color_ext_type* %67, i32 0, i32 2
  %68 = load %struct._color_ext_type*, %struct._color_ext_type** %next119, align 4
  store %struct._color_ext_type* %68, %struct._color_ext_type** %e, align 4
  %69 = load %struct._color_ext_type*, %struct._color_ext_type** %e2, align 4
  %70 = bitcast %struct._color_ext_type* %69 to i8*
  call void @free(i8* %70)
  br label %for.cond115

for.end120:                                       ; preds = %for.cond115
  store %struct._color_ext_type* null, %struct._color_ext_type** @_rl_color_ext_list, align 4
  store i32 0, i32* @_rl_colored_stats, align 4
  br label %if.end121

if.end121:                                        ; preds = %if.then, %for.end120, %while.end111
  ret void
}

declare i8* @sh_get_env_value(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal zeroext i1 @get_funky_string(i8** %dest, i8** %src, i1 zeroext %equals_end, i32* %output_count) #0 {
entry:
  %dest.addr = alloca i8**, align 4
  %src.addr = alloca i8**, align 4
  %equals_end.addr = alloca i8, align 1
  %output_count.addr = alloca i32*, align 4
  %num = alloca i8, align 1
  %count = alloca i32, align 4
  %state = alloca i32, align 4
  %p = alloca i8*, align 4
  %q = alloca i8*, align 4
  store i8** %dest, i8*** %dest.addr, align 4
  store i8** %src, i8*** %src.addr, align 4
  %frombool = zext i1 %equals_end to i8
  store i8 %frombool, i8* %equals_end.addr, align 1
  store i32* %output_count, i32** %output_count.addr, align 4
  %0 = load i8**, i8*** %src.addr, align 4
  %1 = load i8*, i8** %0, align 4
  store i8* %1, i8** %p, align 4
  %2 = load i8**, i8*** %dest.addr, align 4
  %3 = load i8*, i8** %2, align 4
  store i8* %3, i8** %q, align 4
  store i32 0, i32* %count, align 4
  store i8 0, i8* %num, align 1
  store i32 0, i32* %state, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog106, %entry
  %4 = load i32, i32* %state, align 4
  %cmp = icmp ult i32 %4, 5
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32, i32* %state, align 4
  switch i32 %5, label %sw.default105 [
    i32 0, label %sw.bb
    i32 1, label %sw.bb8
    i32 2, label %sw.bb34
    i32 3, label %sw.bb50
    i32 4, label %sw.bb82
  ]

sw.bb:                                            ; preds = %while.body
  %6 = load i8*, i8** %p, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  switch i32 %conv, label %sw.default [
    i32 58, label %sw.bb1
    i32 0, label %sw.bb1
    i32 92, label %sw.bb2
    i32 94, label %sw.bb3
    i32 61, label %sw.bb5
  ]

sw.bb1:                                           ; preds = %sw.bb, %sw.bb
  store i32 5, i32* %state, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %sw.bb
  store i32 1, i32* %state, align 4
  %8 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %sw.bb
  store i32 4, i32* %state, align 4
  %9 = load i8*, i8** %p, align 4
  %incdec.ptr4 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr4, i8** %p, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %sw.bb
  %10 = load i8, i8* %equals_end.addr, align 1
  %tobool = trunc i8 %10 to i1
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb5
  store i32 5, i32* %state, align 4
  br label %sw.epilog

if.end:                                           ; preds = %sw.bb5
  br label %sw.default

sw.default:                                       ; preds = %sw.bb, %if.end
  %11 = load i8*, i8** %p, align 4
  %incdec.ptr6 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr6, i8** %p, align 4
  %12 = load i8, i8* %11, align 1
  %13 = load i8*, i8** %q, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr7, i8** %q, align 4
  store i8 %12, i8* %13, align 1
  %14 = load i32, i32* %count, align 4
  %inc = add i32 %14, 1
  store i32 %inc, i32* %count, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.then, %sw.bb3, %sw.bb2, %sw.bb1
  br label %sw.epilog106

sw.bb8:                                           ; preds = %while.body
  %15 = load i8*, i8** %p, align 4
  %16 = load i8, i8* %15, align 1
  %conv9 = sext i8 %16 to i32
  switch i32 %conv9, label %sw.default25 [
    i32 48, label %sw.bb10
    i32 49, label %sw.bb10
    i32 50, label %sw.bb10
    i32 51, label %sw.bb10
    i32 52, label %sw.bb10
    i32 53, label %sw.bb10
    i32 54, label %sw.bb10
    i32 55, label %sw.bb10
    i32 120, label %sw.bb13
    i32 88, label %sw.bb13
    i32 97, label %sw.bb14
    i32 98, label %sw.bb15
    i32 101, label %sw.bb16
    i32 102, label %sw.bb17
    i32 110, label %sw.bb18
    i32 114, label %sw.bb19
    i32 116, label %sw.bb20
    i32 118, label %sw.bb21
    i32 63, label %sw.bb22
    i32 95, label %sw.bb23
    i32 0, label %sw.bb24
  ]

sw.bb10:                                          ; preds = %sw.bb8, %sw.bb8, %sw.bb8, %sw.bb8, %sw.bb8, %sw.bb8, %sw.bb8, %sw.bb8
  store i32 2, i32* %state, align 4
  %17 = load i8*, i8** %p, align 4
  %18 = load i8, i8* %17, align 1
  %conv11 = sext i8 %18 to i32
  %sub = sub nsw i32 %conv11, 48
  %conv12 = trunc i32 %sub to i8
  store i8 %conv12, i8* %num, align 1
  br label %sw.epilog26

sw.bb13:                                          ; preds = %sw.bb8, %sw.bb8
  store i32 3, i32* %state, align 4
  store i8 0, i8* %num, align 1
  br label %sw.epilog26

sw.bb14:                                          ; preds = %sw.bb8
  store i8 7, i8* %num, align 1
  br label %sw.epilog26

sw.bb15:                                          ; preds = %sw.bb8
  store i8 8, i8* %num, align 1
  br label %sw.epilog26

sw.bb16:                                          ; preds = %sw.bb8
  store i8 27, i8* %num, align 1
  br label %sw.epilog26

sw.bb17:                                          ; preds = %sw.bb8
  store i8 12, i8* %num, align 1
  br label %sw.epilog26

sw.bb18:                                          ; preds = %sw.bb8
  store i8 10, i8* %num, align 1
  br label %sw.epilog26

sw.bb19:                                          ; preds = %sw.bb8
  store i8 13, i8* %num, align 1
  br label %sw.epilog26

sw.bb20:                                          ; preds = %sw.bb8
  store i8 9, i8* %num, align 1
  br label %sw.epilog26

sw.bb21:                                          ; preds = %sw.bb8
  store i8 11, i8* %num, align 1
  br label %sw.epilog26

sw.bb22:                                          ; preds = %sw.bb8
  store i8 127, i8* %num, align 1
  br label %sw.epilog26

sw.bb23:                                          ; preds = %sw.bb8
  store i8 32, i8* %num, align 1
  br label %sw.epilog26

sw.bb24:                                          ; preds = %sw.bb8
  store i32 6, i32* %state, align 4
  br label %sw.epilog26

sw.default25:                                     ; preds = %sw.bb8
  %19 = load i8*, i8** %p, align 4
  %20 = load i8, i8* %19, align 1
  store i8 %20, i8* %num, align 1
  br label %sw.epilog26

sw.epilog26:                                      ; preds = %sw.default25, %sw.bb24, %sw.bb23, %sw.bb22, %sw.bb21, %sw.bb20, %sw.bb19, %sw.bb18, %sw.bb17, %sw.bb16, %sw.bb15, %sw.bb14, %sw.bb13, %sw.bb10
  %21 = load i32, i32* %state, align 4
  %cmp27 = icmp eq i32 %21, 1
  br i1 %cmp27, label %if.then29, label %if.end32

if.then29:                                        ; preds = %sw.epilog26
  %22 = load i8, i8* %num, align 1
  %23 = load i8*, i8** %q, align 4
  %incdec.ptr30 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr30, i8** %q, align 4
  store i8 %22, i8* %23, align 1
  %24 = load i32, i32* %count, align 4
  %inc31 = add i32 %24, 1
  store i32 %inc31, i32* %count, align 4
  store i32 0, i32* %state, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then29, %sw.epilog26
  %25 = load i8*, i8** %p, align 4
  %incdec.ptr33 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr33, i8** %p, align 4
  br label %sw.epilog106

sw.bb34:                                          ; preds = %while.body
  %26 = load i8*, i8** %p, align 4
  %27 = load i8, i8* %26, align 1
  %conv35 = sext i8 %27 to i32
  %cmp36 = icmp slt i32 %conv35, 48
  br i1 %cmp36, label %if.then41, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb34
  %28 = load i8*, i8** %p, align 4
  %29 = load i8, i8* %28, align 1
  %conv38 = sext i8 %29 to i32
  %cmp39 = icmp sgt i32 %conv38, 55
  br i1 %cmp39, label %if.then41, label %if.else

if.then41:                                        ; preds = %lor.lhs.false, %sw.bb34
  %30 = load i8, i8* %num, align 1
  %31 = load i8*, i8** %q, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr42, i8** %q, align 4
  store i8 %30, i8* %31, align 1
  %32 = load i32, i32* %count, align 4
  %inc43 = add i32 %32, 1
  store i32 %inc43, i32* %count, align 4
  store i32 0, i32* %state, align 4
  br label %if.end49

if.else:                                          ; preds = %lor.lhs.false
  %33 = load i8, i8* %num, align 1
  %conv44 = sext i8 %33 to i32
  %shl = shl i32 %conv44, 3
  %34 = load i8*, i8** %p, align 4
  %incdec.ptr45 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr45, i8** %p, align 4
  %35 = load i8, i8* %34, align 1
  %conv46 = sext i8 %35 to i32
  %sub47 = sub nsw i32 %conv46, 48
  %add = add nsw i32 %shl, %sub47
  %conv48 = trunc i32 %add to i8
  store i8 %conv48, i8* %num, align 1
  br label %if.end49

if.end49:                                         ; preds = %if.else, %if.then41
  br label %sw.epilog106

sw.bb50:                                          ; preds = %while.body
  %36 = load i8*, i8** %p, align 4
  %37 = load i8, i8* %36, align 1
  %conv51 = sext i8 %37 to i32
  switch i32 %conv51, label %sw.default78 [
    i32 48, label %sw.bb52
    i32 49, label %sw.bb52
    i32 50, label %sw.bb52
    i32 51, label %sw.bb52
    i32 52, label %sw.bb52
    i32 53, label %sw.bb52
    i32 54, label %sw.bb52
    i32 55, label %sw.bb52
    i32 56, label %sw.bb52
    i32 57, label %sw.bb52
    i32 97, label %sw.bb60
    i32 98, label %sw.bb60
    i32 99, label %sw.bb60
    i32 100, label %sw.bb60
    i32 101, label %sw.bb60
    i32 102, label %sw.bb60
    i32 65, label %sw.bb69
    i32 66, label %sw.bb69
    i32 67, label %sw.bb69
    i32 68, label %sw.bb69
    i32 69, label %sw.bb69
    i32 70, label %sw.bb69
  ]

sw.bb52:                                          ; preds = %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50
  %38 = load i8, i8* %num, align 1
  %conv53 = sext i8 %38 to i32
  %shl54 = shl i32 %conv53, 4
  %39 = load i8*, i8** %p, align 4
  %incdec.ptr55 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %incdec.ptr55, i8** %p, align 4
  %40 = load i8, i8* %39, align 1
  %conv56 = sext i8 %40 to i32
  %sub57 = sub nsw i32 %conv56, 48
  %add58 = add nsw i32 %shl54, %sub57
  %conv59 = trunc i32 %add58 to i8
  store i8 %conv59, i8* %num, align 1
  br label %sw.epilog81

sw.bb60:                                          ; preds = %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50
  %41 = load i8, i8* %num, align 1
  %conv61 = sext i8 %41 to i32
  %shl62 = shl i32 %conv61, 4
  %42 = load i8*, i8** %p, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr63, i8** %p, align 4
  %43 = load i8, i8* %42, align 1
  %conv64 = sext i8 %43 to i32
  %sub65 = sub nsw i32 %conv64, 97
  %add66 = add nsw i32 %shl62, %sub65
  %add67 = add nsw i32 %add66, 10
  %conv68 = trunc i32 %add67 to i8
  store i8 %conv68, i8* %num, align 1
  br label %sw.epilog81

sw.bb69:                                          ; preds = %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50, %sw.bb50
  %44 = load i8, i8* %num, align 1
  %conv70 = sext i8 %44 to i32
  %shl71 = shl i32 %conv70, 4
  %45 = load i8*, i8** %p, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr72, i8** %p, align 4
  %46 = load i8, i8* %45, align 1
  %conv73 = sext i8 %46 to i32
  %sub74 = sub nsw i32 %conv73, 65
  %add75 = add nsw i32 %shl71, %sub74
  %add76 = add nsw i32 %add75, 10
  %conv77 = trunc i32 %add76 to i8
  store i8 %conv77, i8* %num, align 1
  br label %sw.epilog81

sw.default78:                                     ; preds = %sw.bb50
  %47 = load i8, i8* %num, align 1
  %48 = load i8*, i8** %q, align 4
  %incdec.ptr79 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr79, i8** %q, align 4
  store i8 %47, i8* %48, align 1
  %49 = load i32, i32* %count, align 4
  %inc80 = add i32 %49, 1
  store i32 %inc80, i32* %count, align 4
  store i32 0, i32* %state, align 4
  br label %sw.epilog81

sw.epilog81:                                      ; preds = %sw.default78, %sw.bb69, %sw.bb60, %sw.bb52
  br label %sw.epilog106

sw.bb82:                                          ; preds = %while.body
  store i32 0, i32* %state, align 4
  %50 = load i8*, i8** %p, align 4
  %51 = load i8, i8* %50, align 1
  %conv83 = sext i8 %51 to i32
  %cmp84 = icmp sge i32 %conv83, 64
  br i1 %cmp84, label %land.lhs.true, label %if.else95

land.lhs.true:                                    ; preds = %sw.bb82
  %52 = load i8*, i8** %p, align 4
  %53 = load i8, i8* %52, align 1
  %conv86 = sext i8 %53 to i32
  %cmp87 = icmp sle i32 %conv86, 126
  br i1 %cmp87, label %if.then89, label %if.else95

if.then89:                                        ; preds = %land.lhs.true
  %54 = load i8*, i8** %p, align 4
  %incdec.ptr90 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr90, i8** %p, align 4
  %55 = load i8, i8* %54, align 1
  %conv91 = sext i8 %55 to i32
  %and = and i32 %conv91, 31
  %conv92 = trunc i32 %and to i8
  %56 = load i8*, i8** %q, align 4
  %incdec.ptr93 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr93, i8** %q, align 4
  store i8 %conv92, i8* %56, align 1
  %57 = load i32, i32* %count, align 4
  %inc94 = add i32 %57, 1
  store i32 %inc94, i32* %count, align 4
  br label %if.end104

if.else95:                                        ; preds = %land.lhs.true, %sw.bb82
  %58 = load i8*, i8** %p, align 4
  %59 = load i8, i8* %58, align 1
  %conv96 = sext i8 %59 to i32
  %cmp97 = icmp eq i32 %conv96, 63
  br i1 %cmp97, label %if.then99, label %if.else102

if.then99:                                        ; preds = %if.else95
  %60 = load i8*, i8** %q, align 4
  %incdec.ptr100 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr100, i8** %q, align 4
  store i8 127, i8* %60, align 1
  %61 = load i32, i32* %count, align 4
  %inc101 = add i32 %61, 1
  store i32 %inc101, i32* %count, align 4
  br label %if.end103

if.else102:                                       ; preds = %if.else95
  store i32 6, i32* %state, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.else102, %if.then99
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.then89
  br label %sw.epilog106

sw.default105:                                    ; preds = %while.body
  store i32 6, i32* %state, align 4
  br label %sw.epilog106

sw.epilog106:                                     ; preds = %sw.default105, %if.end104, %sw.epilog81, %if.end49, %if.end32, %sw.epilog
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %62 = load i8*, i8** %q, align 4
  %63 = load i8**, i8*** %dest.addr, align 4
  store i8* %62, i8** %63, align 4
  %64 = load i8*, i8** %p, align 4
  %65 = load i8**, i8*** %src.addr, align 4
  store i8* %64, i8** %65, align 4
  %66 = load i32, i32* %count, align 4
  %67 = load i32*, i32** %output_count.addr, align 4
  store i32 %66, i32* %67, align 4
  %68 = load i32, i32* %state, align 4
  %cmp107 = icmp ne i32 %68, 6
  ret i1 %cmp107
}

declare i32 @strcmp(i8*, i8*) #1

declare void @_rl_errmsg(i8*, ...) #1

declare void @free(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
