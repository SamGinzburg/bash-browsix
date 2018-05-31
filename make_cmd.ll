; ModuleID = 'make_cmd.c'
source_filename = "make_cmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.objcache = type { i8*, i32, i32 }
%struct._IO_FILE = type opaque
%struct.word_desc = type { i8*, i32 }
%struct.__mbstate_t = type { i32, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.arith_for_com = type { i32, i32, %struct.word_list*, %struct.word_list*, %struct.word_list*, %struct.command* }
%struct.group_com = type { i32, %struct.command* }
%struct.pattern_list = type { %struct.pattern_list*, %struct.word_list*, %struct.command*, i32 }
%struct.case_com = type { i32, i32, %struct.word_desc*, %struct.pattern_list* }
%struct.g_list = type { %struct.g_list* }
%struct.if_com = type { i32, %struct.command*, %struct.command*, %struct.command* }
%struct.while_com = type { i32, %struct.command*, %struct.command* }
%struct.arith_com = type { i32, i32, %struct.word_list* }
%struct.cond_com = type { i32, i32, i32, %struct.word_desc*, %struct.cond_com*, %struct.cond_com* }
%struct.element = type { %struct.word_desc*, %struct.redirect* }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.subshell_com = type { i32, %struct.command* }
%struct.coproc_com = type { i32, i8*, %struct.command* }

@here_doc_first_line = global i32 0, align 4
@wdcache = global %struct.objcache zeroinitializer, align 4
@wlcache = global %struct.objcache zeroinitializer, align 4
@.str = private unnamed_addr constant [11 x i8] c"make_cmd.c\00", align 1
@locale_mb_cur_max = external global i32, align 4
@.str.1 = private unnamed_addr constant [2 x i8] c";\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"syntax error: arithmetic expression required\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"syntax error: `;' unexpected\00", align 1
@.str.4 = private unnamed_addr constant [23 x i8] c"syntax error: `((%s))'\00", align 1
@last_command_exit_value = external global i32, align 4
@.str.5 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@line_number = external global i32, align 4
@parser_state = external global i32, align 4
@.str.6 = private unnamed_addr constant [44 x i8] c"make_here_document: bad instruction type %d\00", align 1
@echo_input_at_read = external global i32, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8 = private unnamed_addr constant [64 x i8] c"here-document at line %d delimited by end-of-file (wanted `%s')\00", align 1
@.str.9 = private unnamed_addr constant [60 x i8] c"make_redirection: redirection instruction `%d' out of range\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@shell_initialized = external global i32, align 4
@.str.11 = private unnamed_addr constant [5 x i8] c"main\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"environment\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"clean_simple_command\00", align 1
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define void @cmd_init() #0 {
entry:
  br label %do.body

do.body:                                          ; preds = %entry
  %call = call i8* @sh_xmalloc(i32 512, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 79)
  store i8* %call, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 0), align 4
  store i32 128, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %call2 = call i8* @sh_xmalloc(i32 512, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 80)
  store i8* %call2, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 0), align 4
  store i32 128, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  br label %do.end3

do.end3:                                          ; preds = %do.body1
  ret void
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define %struct.word_desc* @alloc_word_desc() #0 {
entry:
  %temp = alloca %struct.word_desc*, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 0), align 4
  %2 = bitcast i8* %1 to %struct.word_desc**
  %3 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %struct.word_desc*, %struct.word_desc** %2, i32 %dec
  %4 = load %struct.word_desc*, %struct.word_desc** %arrayidx, align 4
  store %struct.word_desc* %4, %struct.word_desc** %temp, align 4
  br label %if.end

if.else:                                          ; preds = %do.body
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 88)
  %5 = bitcast i8* %call to %struct.word_desc*
  store %struct.word_desc* %5, %struct.word_desc** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 1
  store i32 0, i32* %flags, align 4
  %7 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  store i8* null, i8** %word, align 4
  %8 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  ret %struct.word_desc* %8
}

; Function Attrs: noinline nounwind
define %struct.word_desc* @make_bare_word(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %temp = alloca %struct.word_desc*, align 4
  store i8* %string, i8** %string.addr, align 4
  %call = call %struct.word_desc* @alloc_word_desc()
  store %struct.word_desc* %call, %struct.word_desc** %temp, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8, i8* %0, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %call1 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 103)
  %3 = load i8*, i8** %string.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %3)
  %4 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  store i8* %call3, i8** %word, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %call4 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 106)
  %5 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  store i8* %call4, i8** %word5, align 4
  %6 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word6, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  ret %struct.word_desc* %8
}

declare i8* @strcpy(i8*, i8*) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define %struct.word_desc* @make_word_flags(%struct.word_desc* %w, i8* %string) #0 {
entry:
  %w.addr = alloca %struct.word_desc*, align 4
  %string.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %slen = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  store %struct.word_desc* %w, %struct.word_desc** %w.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %slen, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %slen, align 4
  %cmp = icmp ult i32 %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  switch i32 %conv, label %sw.epilog [
    i32 36, label %sw.bb
    i32 92, label %sw.bb1
    i32 39, label %sw.bb2
    i32 96, label %sw.bb2
    i32 34, label %sw.bb2
  ]

sw.bb:                                            ; preds = %while.body
  %7 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 1
  %8 = load i32, i32* %flags, align 4
  %or = or i32 %8, 1
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body, %while.body, %while.body
  %9 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %flags3 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 1
  %10 = load i32, i32* %flags3, align 4
  %or4 = or i32 %10, 2
  store i32 %or4, i32* %flags3, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %while.body, %sw.bb2, %sw.bb1, %sw.bb
  br label %do.body

do.body:                                          ; preds = %sw.epilog
  %11 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp5 = icmp sgt i32 %11, 1
  br i1 %cmp5, label %if.then, label %if.else24

if.then:                                          ; preds = %do.body
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i8, i8* %arrayidx7, align 1
  %call8 = call i32 @is_basic(i8 signext %14)
  store i32 %call8, i32* %_f, align 4
  %15 = load i32, i32* %_f, align 4
  %tobool = icmp ne i32 %15, 0
  br i1 %tobool, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.then
  store i32 1, i32* %mblength, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %16 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %17 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %16, i8* %17, i32 8, i32 4, i1 false)
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i32, i32* %slen, align 4
  %21 = load i32, i32* %i, align 4
  %sub = sub i32 %20, %21
  %call10 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call10, i32* %mblength, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then9
  %22 = load i32, i32* %mblength, align 4
  %cmp11 = icmp eq i32 %22, -2
  br i1 %cmp11, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %23 = load i32, i32* %mblength, align 4
  %cmp13 = icmp eq i32 %23, -1
  br i1 %cmp13, label %if.then15, label %if.else16

if.then15:                                        ; preds = %lor.lhs.false, %if.end
  %24 = bitcast %struct.__mbstate_t* %state to i8*
  %25 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %24, i8* %25, i32 8, i32 4, i1 false)
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end23

if.else16:                                        ; preds = %lor.lhs.false
  %27 = load i32, i32* %mblength, align 4
  %cmp17 = icmp eq i32 %27, 0
  br i1 %cmp17, label %if.then19, label %if.else21

if.then19:                                        ; preds = %if.else16
  %28 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %28, 1
  store i32 %inc20, i32* %i, align 4
  br label %if.end22

if.else21:                                        ; preds = %if.else16
  %29 = load i32, i32* %mblength, align 4
  %30 = load i32, i32* %i, align 4
  %add = add i32 %30, %29
  store i32 %add, i32* %i, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %if.then19
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then15
  br label %if.end26

if.else24:                                        ; preds = %do.body
  %31 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %31, 1
  store i32 %inc25, i32* %i, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.end23
  br label %do.end

do.end:                                           ; preds = %if.end26
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %32 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  ret %struct.word_desc* %32
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

; Function Attrs: noinline nounwind
define %struct.word_desc* @make_word(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %temp = alloca %struct.word_desc*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call %struct.word_desc* @make_bare_word(i8* %0)
  store %struct.word_desc* %call, %struct.word_desc** %temp, align 4
  %1 = load %struct.word_desc*, %struct.word_desc** %temp, align 4
  %2 = load i8*, i8** %string.addr, align 4
  %call1 = call %struct.word_desc* @make_word_flags(%struct.word_desc* %1, i8* %2)
  ret %struct.word_desc* %call1
}

; Function Attrs: noinline nounwind
define %struct.word_desc* @make_word_from_token(i32 %token) #0 {
entry:
  %token.addr = alloca i32, align 4
  %tokenizer = alloca [2 x i8], align 1
  store i32 %token, i32* %token.addr, align 4
  %0 = load i32, i32* %token.addr, align 4
  %conv = trunc i32 %0 to i8
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %tokenizer, i32 0, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [2 x i8], [2 x i8]* %tokenizer, i32 0, i32 1
  store i8 0, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [2 x i8], [2 x i8]* %tokenizer, i32 0, i32 0
  %call = call %struct.word_desc* @make_word(i8* %arraydecay)
  ret %struct.word_desc* %call
}

; Function Attrs: noinline nounwind
define %struct.word_list* @make_word_list(%struct.word_desc* %word, %struct.word_list* %wlink) #0 {
entry:
  %word.addr = alloca %struct.word_desc*, align 4
  %wlink.addr = alloca %struct.word_list*, align 4
  %temp = alloca %struct.word_list*, align 4
  store %struct.word_desc* %word, %struct.word_desc** %word.addr, align 4
  store %struct.word_list* %wlink, %struct.word_list** %wlink.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 0), align 4
  %2 = bitcast i8* %1 to %struct.word_list**
  %3 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %struct.word_list*, %struct.word_list** %2, i32 %dec
  %4 = load %struct.word_list*, %struct.word_list** %arrayidx, align 4
  store %struct.word_list* %4, %struct.word_list** %temp, align 4
  br label %if.end

if.else:                                          ; preds = %do.body
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 175)
  %5 = bitcast i8* %call to %struct.word_list*
  store %struct.word_list* %5, %struct.word_list** %temp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end

do.end:                                           ; preds = %if.end
  %6 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %7 = load %struct.word_list*, %struct.word_list** %temp, align 4
  %word1 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  store %struct.word_desc* %6, %struct.word_desc** %word1, align 4
  %8 = load %struct.word_list*, %struct.word_list** %wlink.addr, align 4
  %9 = load %struct.word_list*, %struct.word_list** %temp, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 0
  store %struct.word_list* %8, %struct.word_list** %next, align 4
  %10 = load %struct.word_list*, %struct.word_list** %temp, align 4
  ret %struct.word_list* %10
}

; Function Attrs: noinline nounwind
define %struct.command* @make_command(i32 %type, %struct.simple_com* %pointer) #0 {
entry:
  %type.addr = alloca i32, align 4
  %pointer.addr = alloca %struct.simple_com*, align 4
  %temp = alloca %struct.command*, align 4
  store i32 %type, i32* %type.addr, align 4
  store %struct.simple_com* %pointer, %struct.simple_com** %pointer.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 189)
  %0 = bitcast i8* %call to %struct.command*
  store %struct.command* %0, %struct.command** %temp, align 4
  %1 = load i32, i32* %type.addr, align 4
  %2 = load %struct.command*, %struct.command** %temp, align 4
  %type1 = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 0
  store i32 %1, i32* %type1, align 4
  %3 = load %struct.simple_com*, %struct.simple_com** %pointer.addr, align 4
  %4 = load %struct.command*, %struct.command** %temp, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %4, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  store %struct.simple_com* %3, %struct.simple_com** %Simple, align 4
  %5 = load %struct.command*, %struct.command** %temp, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 1
  store i32 0, i32* %flags, align 4
  %6 = load %struct.command*, %struct.command** %temp, align 4
  %value2 = getelementptr inbounds %struct.command, %struct.command* %6, i32 0, i32 4
  %Simple3 = bitcast %union.anon* %value2 to %struct.simple_com**
  %7 = load %struct.simple_com*, %struct.simple_com** %Simple3, align 4
  %flags4 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %7, i32 0, i32 0
  store i32 0, i32* %flags4, align 4
  %8 = load %struct.command*, %struct.command** %temp, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects, align 4
  %9 = load %struct.command*, %struct.command** %temp, align 4
  ret %struct.command* %9
}

; Function Attrs: noinline nounwind
define %struct.command* @command_connect(%struct.command* %com1, %struct.command* %com2, i32 %connector) #0 {
entry:
  %com1.addr = alloca %struct.command*, align 4
  %com2.addr = alloca %struct.command*, align 4
  %connector.addr = alloca i32, align 4
  %temp = alloca %struct.connection*, align 4
  store %struct.command* %com1, %struct.command** %com1.addr, align 4
  store %struct.command* %com2, %struct.command** %com2.addr, align 4
  store i32 %connector, i32* %connector.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 204)
  %0 = bitcast i8* %call to %struct.connection*
  store %struct.connection* %0, %struct.connection** %temp, align 4
  %1 = load i32, i32* %connector.addr, align 4
  %2 = load %struct.connection*, %struct.connection** %temp, align 4
  %connector1 = getelementptr inbounds %struct.connection, %struct.connection* %2, i32 0, i32 3
  store i32 %1, i32* %connector1, align 4
  %3 = load %struct.command*, %struct.command** %com1.addr, align 4
  %4 = load %struct.connection*, %struct.connection** %temp, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %4, i32 0, i32 1
  store %struct.command* %3, %struct.command** %first, align 4
  %5 = load %struct.command*, %struct.command** %com2.addr, align 4
  %6 = load %struct.connection*, %struct.connection** %temp, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %6, i32 0, i32 2
  store %struct.command* %5, %struct.command** %second, align 4
  %7 = load %struct.connection*, %struct.connection** %temp, align 4
  %8 = bitcast %struct.connection* %7 to %struct.simple_com*
  %call2 = call %struct.command* @make_command(i32 6, %struct.simple_com* %8)
  ret %struct.command* %call2
}

; Function Attrs: noinline nounwind
define %struct.command* @make_for_command(%struct.word_desc* %name, %struct.word_list* %map_list, %struct.command* %action, i32 %lineno) #0 {
entry:
  %name.addr = alloca %struct.word_desc*, align 4
  %map_list.addr = alloca %struct.word_list*, align 4
  %action.addr = alloca %struct.command*, align 4
  %lineno.addr = alloca i32, align 4
  store %struct.word_desc* %name, %struct.word_desc** %name.addr, align 4
  store %struct.word_list* %map_list, %struct.word_list** %map_list.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %1 = load %struct.word_list*, %struct.word_list** %map_list.addr, align 4
  %2 = load %struct.command*, %struct.command** %action.addr, align 4
  %3 = load i32, i32* %lineno.addr, align 4
  %call = call %struct.command* @make_for_or_select(i32 0, %struct.word_desc* %0, %struct.word_list* %1, %struct.command* %2, i32 %3)
  ret %struct.command* %call
}

; Function Attrs: noinline nounwind
define internal %struct.command* @make_for_or_select(i32 %type, %struct.word_desc* %name, %struct.word_list* %map_list, %struct.command* %action, i32 %lineno) #0 {
entry:
  %type.addr = alloca i32, align 4
  %name.addr = alloca %struct.word_desc*, align 4
  %map_list.addr = alloca %struct.word_list*, align 4
  %action.addr = alloca %struct.command*, align 4
  %lineno.addr = alloca i32, align 4
  %temp = alloca %struct.for_com*, align 4
  store i32 %type, i32* %type.addr, align 4
  store %struct.word_desc* %name, %struct.word_desc** %name.addr, align 4
  store %struct.word_list* %map_list, %struct.word_list** %map_list.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 221)
  %0 = bitcast i8* %call to %struct.for_com*
  store %struct.for_com* %0, %struct.for_com** %temp, align 4
  %1 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %flags = getelementptr inbounds %struct.for_com, %struct.for_com* %1, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %2 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %3 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %name1 = getelementptr inbounds %struct.for_com, %struct.for_com* %3, i32 0, i32 2
  store %struct.word_desc* %2, %struct.word_desc** %name1, align 4
  %4 = load i32, i32* %lineno.addr, align 4
  %5 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %line = getelementptr inbounds %struct.for_com, %struct.for_com* %5, i32 0, i32 1
  store i32 %4, i32* %line, align 4
  %6 = load %struct.word_list*, %struct.word_list** %map_list.addr, align 4
  %7 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %map_list2 = getelementptr inbounds %struct.for_com, %struct.for_com* %7, i32 0, i32 3
  store %struct.word_list* %6, %struct.word_list** %map_list2, align 4
  %8 = load %struct.command*, %struct.command** %action.addr, align 4
  %9 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %action3 = getelementptr inbounds %struct.for_com, %struct.for_com* %9, i32 0, i32 4
  store %struct.command* %8, %struct.command** %action3, align 4
  %10 = load i32, i32* %type.addr, align 4
  %11 = load %struct.for_com*, %struct.for_com** %temp, align 4
  %12 = bitcast %struct.for_com* %11 to %struct.simple_com*
  %call4 = call %struct.command* @make_command(i32 %10, %struct.simple_com* %12)
  ret %struct.command* %call4
}

; Function Attrs: noinline nounwind
define %struct.command* @make_select_command(%struct.word_desc* %name, %struct.word_list* %map_list, %struct.command* %action, i32 %lineno) #0 {
entry:
  %name.addr = alloca %struct.word_desc*, align 4
  %map_list.addr = alloca %struct.word_list*, align 4
  %action.addr = alloca %struct.command*, align 4
  %lineno.addr = alloca i32, align 4
  store %struct.word_desc* %name, %struct.word_desc** %name.addr, align 4
  store %struct.word_list* %map_list, %struct.word_list** %map_list.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %1 = load %struct.word_list*, %struct.word_list** %map_list.addr, align 4
  %2 = load %struct.command*, %struct.command** %action.addr, align 4
  %3 = load i32, i32* %lineno.addr, align 4
  %call = call %struct.command* @make_for_or_select(i32 5, %struct.word_desc* %0, %struct.word_list* %1, %struct.command* %2, i32 %3)
  ret %struct.command* %call
}

; Function Attrs: noinline nounwind
define %struct.command* @make_arith_for_command(%struct.word_list* %exprs, %struct.command* %action, i32 %lineno) #0 {
entry:
  %retval = alloca %struct.command*, align 4
  %exprs.addr = alloca %struct.word_list*, align 4
  %action.addr = alloca %struct.command*, align 4
  %lineno.addr = alloca i32, align 4
  %temp = alloca %struct.arith_for_com*, align 4
  %init = alloca %struct.word_list*, align 4
  %test = alloca %struct.word_list*, align 4
  %step = alloca %struct.word_list*, align 4
  %s = alloca i8*, align 4
  %t = alloca i8*, align 4
  %start = alloca i8*, align 4
  %nsemi = alloca i32, align 4
  %i = alloca i32, align 4
  store %struct.word_list* %exprs, %struct.word_list** %exprs.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  store %struct.word_list* null, %struct.word_list** %step, align 4
  store %struct.word_list* null, %struct.word_list** %test, align 4
  store %struct.word_list* null, %struct.word_list** %init, align 4
  %0 = load %struct.word_list*, %struct.word_list** %exprs.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %0, i32 0, i32 1
  %1 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word1, align 4
  store i8* %2, i8** %s, align 4
  store i8* %2, i8** %t, align 4
  store i8* %2, i8** %start, align 4
  store i32 0, i32* %nsemi, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end18, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.cond
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %7 = phi i1 [ true, %while.cond ], [ %cmp4, %lor.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %8 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %9 = load i8*, i8** %s, align 4
  store i8* %9, i8** %start, align 4
  %10 = load i8*, i8** %start, align 4
  %call = call i32 @skip_to_delim(i8* %10, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0), i32 129)
  store i32 %call, i32* %i, align 4
  %11 = load i8*, i8** %start, align 4
  %12 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  store i8* %add.ptr, i8** %s, align 4
  %13 = load i32, i32* %i, align 4
  %cmp6 = icmp sgt i32 %13, 0
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.end
  %14 = load i8*, i8** %start, align 4
  %15 = load i32, i32* %i, align 4
  %call8 = call i8* @substring(i8* %14, i32 0, i32 %15)
  br label %cond.end

cond.false:                                       ; preds = %while.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call8, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %t, align 4
  %16 = load i32, i32* %nsemi, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %nsemi, align 4
  %17 = load i32, i32* %nsemi, align 4
  switch i32 %17, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb10
    i32 3, label %sw.bb12
  ]

sw.bb:                                            ; preds = %cond.end
  %18 = load i8*, i8** %t, align 4
  %call9 = call %struct.word_list* @make_arith_for_expr(i8* %18)
  store %struct.word_list* %call9, %struct.word_list** %init, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %cond.end
  %19 = load i8*, i8** %t, align 4
  %call11 = call %struct.word_list* @make_arith_for_expr(i8* %19)
  store %struct.word_list* %call11, %struct.word_list** %test, align 4
  br label %sw.epilog

sw.bb12:                                          ; preds = %cond.end
  %20 = load i8*, i8** %t, align 4
  %call13 = call %struct.word_list* @make_arith_for_expr(i8* %20)
  store %struct.word_list* %call13, %struct.word_list** %step, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %cond.end, %sw.bb12, %sw.bb10, %sw.bb
  br label %do.body

do.body:                                          ; preds = %sw.epilog
  %21 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %21, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %22 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %22, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 320)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %23 = load i8*, i8** %s, align 4
  %24 = load i8, i8* %23, align 1
  %conv14 = sext i8 %24 to i32
  %cmp15 = icmp eq i32 %conv14, 0
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.end
  br label %for.end

if.end18:                                         ; preds = %do.end
  %25 = load i8*, i8** %s, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr19, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then17
  %26 = load i32, i32* %nsemi, align 4
  %cmp20 = icmp ne i32 %26, 3
  br i1 %cmp20, label %if.then22, label %if.end32

if.then22:                                        ; preds = %for.end
  %27 = load i32, i32* %nsemi, align 4
  %cmp23 = icmp slt i32 %27, 3
  br i1 %cmp23, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.then22
  %28 = load i32, i32* %lineno.addr, align 4
  %call26 = call i8* @libintl_gettext(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0))
  call void (i32, i8*, ...) @parser_error(i32 %28, i8* %call26)
  br label %if.end28

if.else:                                          ; preds = %if.then22
  %29 = load i32, i32* %lineno.addr, align 4
  %call27 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  call void (i32, i8*, ...) @parser_error(i32 %29, i8* %call27)
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  %30 = load i32, i32* %lineno.addr, align 4
  %call29 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.4, i32 0, i32 0))
  %31 = load %struct.word_list*, %struct.word_list** %exprs.addr, align 4
  %word30 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word30, align 4
  %word31 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word31, align 4
  call void (i32, i8*, ...) @parser_error(i32 %30, i8* %call29, i8* %33)
  %34 = load %struct.word_list*, %struct.word_list** %init, align 4
  %35 = bitcast %struct.word_list* %34 to i8*
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 333)
  %36 = load %struct.word_list*, %struct.word_list** %test, align 4
  %37 = bitcast %struct.word_list* %36 to i8*
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 334)
  %38 = load %struct.word_list*, %struct.word_list** %step, align 4
  %39 = bitcast %struct.word_list* %38 to i8*
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 335)
  store i32 2, i32* @last_command_exit_value, align 4
  store %struct.command* null, %struct.command** %retval, align 4
  br label %return

if.end32:                                         ; preds = %for.end
  %call33 = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 340)
  %40 = bitcast i8* %call33 to %struct.arith_for_com*
  store %struct.arith_for_com* %40, %struct.arith_for_com** %temp, align 4
  %41 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %flags = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %41, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %42 = load i32, i32* %lineno.addr, align 4
  %43 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %line = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %43, i32 0, i32 1
  store i32 %42, i32* %line, align 4
  %44 = load %struct.word_list*, %struct.word_list** %init, align 4
  %tobool34 = icmp ne %struct.word_list* %44, null
  br i1 %tobool34, label %cond.true35, label %cond.false36

cond.true35:                                      ; preds = %if.end32
  %45 = load %struct.word_list*, %struct.word_list** %init, align 4
  br label %cond.end38

cond.false36:                                     ; preds = %if.end32
  %call37 = call %struct.word_list* @make_arith_for_expr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %cond.end38

cond.end38:                                       ; preds = %cond.false36, %cond.true35
  %cond39 = phi %struct.word_list* [ %45, %cond.true35 ], [ %call37, %cond.false36 ]
  %46 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %init40 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %46, i32 0, i32 2
  store %struct.word_list* %cond39, %struct.word_list** %init40, align 4
  %47 = load %struct.word_list*, %struct.word_list** %test, align 4
  %tobool41 = icmp ne %struct.word_list* %47, null
  br i1 %tobool41, label %cond.true42, label %cond.false43

cond.true42:                                      ; preds = %cond.end38
  %48 = load %struct.word_list*, %struct.word_list** %test, align 4
  br label %cond.end45

cond.false43:                                     ; preds = %cond.end38
  %call44 = call %struct.word_list* @make_arith_for_expr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %cond.end45

cond.end45:                                       ; preds = %cond.false43, %cond.true42
  %cond46 = phi %struct.word_list* [ %48, %cond.true42 ], [ %call44, %cond.false43 ]
  %49 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %test47 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %49, i32 0, i32 3
  store %struct.word_list* %cond46, %struct.word_list** %test47, align 4
  %50 = load %struct.word_list*, %struct.word_list** %step, align 4
  %tobool48 = icmp ne %struct.word_list* %50, null
  br i1 %tobool48, label %cond.true49, label %cond.false50

cond.true49:                                      ; preds = %cond.end45
  %51 = load %struct.word_list*, %struct.word_list** %step, align 4
  br label %cond.end52

cond.false50:                                     ; preds = %cond.end45
  %call51 = call %struct.word_list* @make_arith_for_expr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  br label %cond.end52

cond.end52:                                       ; preds = %cond.false50, %cond.true49
  %cond53 = phi %struct.word_list* [ %51, %cond.true49 ], [ %call51, %cond.false50 ]
  %52 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %step54 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %52, i32 0, i32 4
  store %struct.word_list* %cond53, %struct.word_list** %step54, align 4
  %53 = load %struct.command*, %struct.command** %action.addr, align 4
  %54 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %action55 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %54, i32 0, i32 5
  store %struct.command* %53, %struct.command** %action55, align 4
  %55 = load %struct.word_list*, %struct.word_list** %exprs.addr, align 4
  call void @dispose_words(%struct.word_list* %55)
  %56 = load %struct.arith_for_com*, %struct.arith_for_com** %temp, align 4
  %57 = bitcast %struct.arith_for_com* %56 to %struct.simple_com*
  %call56 = call %struct.command* @make_command(i32 12, %struct.simple_com* %57)
  store %struct.command* %call56, %struct.command** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end52, %if.end28
  %58 = load %struct.command*, %struct.command** %retval, align 4
  ret %struct.command* %58
}

declare i32 @skip_to_delim(i8*, i32, i8*, i32) #1

declare i8* @substring(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define internal %struct.word_list* @make_arith_for_expr(i8* %s) #0 {
entry:
  %retval = alloca %struct.word_list*, align 4
  %s.addr = alloca i8*, align 4
  %result = alloca %struct.word_list*, align 4
  %wd = alloca %struct.word_desc*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store %struct.word_list* null, %struct.word_list** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %s.addr, align 4
  %call = call %struct.word_desc* @make_word(i8* %3)
  store %struct.word_desc* %call, %struct.word_desc** %wd, align 4
  %4 = load %struct.word_desc*, %struct.word_desc** %wd, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 1
  %5 = load i32, i32* %flags, align 4
  %or = or i32 %5, 524338
  store i32 %or, i32* %flags, align 4
  %6 = load %struct.word_desc*, %struct.word_desc** %wd, align 4
  %flags3 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 1
  %7 = load i32, i32* %flags3, align 4
  %or4 = or i32 %7, 1048576
  store i32 %or4, i32* %flags3, align 4
  %8 = load %struct.word_desc*, %struct.word_desc** %wd, align 4
  %call5 = call %struct.word_list* @make_word_list(%struct.word_desc* %8, %struct.word_list* null)
  store %struct.word_list* %call5, %struct.word_list** %result, align 4
  %9 = load %struct.word_list*, %struct.word_list** %result, align 4
  store %struct.word_list* %9, %struct.word_list** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %10 = load %struct.word_list*, %struct.word_list** %retval, align 4
  ret %struct.word_list* %10
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare void @parser_error(i32, i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @dispose_words(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define %struct.command* @make_group_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.group_com*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 363)
  %0 = bitcast i8* %call to %struct.group_com*
  store %struct.group_com* %0, %struct.group_com** %temp, align 4
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %2 = load %struct.group_com*, %struct.group_com** %temp, align 4
  %command1 = getelementptr inbounds %struct.group_com, %struct.group_com* %2, i32 0, i32 1
  store %struct.command* %1, %struct.command** %command1, align 4
  %3 = load %struct.group_com*, %struct.group_com** %temp, align 4
  %4 = bitcast %struct.group_com* %3 to %struct.simple_com*
  %call2 = call %struct.command* @make_command(i32 9, %struct.simple_com* %4)
  ret %struct.command* %call2
}

; Function Attrs: noinline nounwind
define %struct.command* @make_case_command(%struct.word_desc* %word, %struct.pattern_list* %clauses, i32 %lineno) #0 {
entry:
  %word.addr = alloca %struct.word_desc*, align 4
  %clauses.addr = alloca %struct.pattern_list*, align 4
  %lineno.addr = alloca i32, align 4
  %temp = alloca %struct.case_com*, align 4
  store %struct.word_desc* %word, %struct.word_desc** %word.addr, align 4
  store %struct.pattern_list* %clauses, %struct.pattern_list** %clauses.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 376)
  %0 = bitcast i8* %call to %struct.case_com*
  store %struct.case_com* %0, %struct.case_com** %temp, align 4
  %1 = load %struct.case_com*, %struct.case_com** %temp, align 4
  %flags = getelementptr inbounds %struct.case_com, %struct.case_com* %1, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %2 = load i32, i32* %lineno.addr, align 4
  %3 = load %struct.case_com*, %struct.case_com** %temp, align 4
  %line = getelementptr inbounds %struct.case_com, %struct.case_com* %3, i32 0, i32 1
  store i32 %2, i32* %line, align 4
  %4 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %5 = load %struct.case_com*, %struct.case_com** %temp, align 4
  %word1 = getelementptr inbounds %struct.case_com, %struct.case_com* %5, i32 0, i32 2
  store %struct.word_desc* %4, %struct.word_desc** %word1, align 4
  %6 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %tobool = icmp ne %struct.pattern_list* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %7 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %next = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %7, i32 0, i32 0
  %8 = load %struct.pattern_list*, %struct.pattern_list** %next, align 4
  %tobool2 = icmp ne %struct.pattern_list* %8, null
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %9 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %10 = bitcast %struct.pattern_list* %9 to %struct.g_list*
  %call3 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %10)
  %11 = bitcast %struct.g_list* %call3 to %struct.pattern_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %12 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.pattern_list* [ %11, %cond.true ], [ %12, %cond.false ]
  %13 = load %struct.case_com*, %struct.case_com** %temp, align 4
  %clauses4 = getelementptr inbounds %struct.case_com, %struct.case_com* %13, i32 0, i32 3
  store %struct.pattern_list* %cond, %struct.pattern_list** %clauses4, align 4
  %14 = load %struct.case_com*, %struct.case_com** %temp, align 4
  %15 = bitcast %struct.case_com* %14 to %struct.simple_com*
  %call5 = call %struct.command* @make_command(i32 1, %struct.simple_com* %15)
  ret %struct.command* %call5
}

declare %struct.g_list* @list_reverse(...) #1

; Function Attrs: noinline nounwind
define %struct.pattern_list* @make_pattern_list(%struct.word_list* %patterns, %struct.command* %action) #0 {
entry:
  %patterns.addr = alloca %struct.word_list*, align 4
  %action.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.pattern_list*, align 4
  store %struct.word_list* %patterns, %struct.word_list** %patterns.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 391)
  %0 = bitcast i8* %call to %struct.pattern_list*
  store %struct.pattern_list* %0, %struct.pattern_list** %temp, align 4
  %1 = load %struct.word_list*, %struct.word_list** %patterns.addr, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.word_list*, %struct.word_list** %patterns.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 0
  %3 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool1 = icmp ne %struct.word_list* %3, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %4 = load %struct.word_list*, %struct.word_list** %patterns.addr, align 4
  %5 = bitcast %struct.word_list* %4 to %struct.g_list*
  %call2 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %5)
  %6 = bitcast %struct.g_list* %call2 to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %7 = load %struct.word_list*, %struct.word_list** %patterns.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %6, %cond.true ], [ %7, %cond.false ]
  %8 = load %struct.pattern_list*, %struct.pattern_list** %temp, align 4
  %patterns3 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %8, i32 0, i32 1
  store %struct.word_list* %cond, %struct.word_list** %patterns3, align 4
  %9 = load %struct.command*, %struct.command** %action.addr, align 4
  %10 = load %struct.pattern_list*, %struct.pattern_list** %temp, align 4
  %action4 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %10, i32 0, i32 2
  store %struct.command* %9, %struct.command** %action4, align 4
  %11 = load %struct.pattern_list*, %struct.pattern_list** %temp, align 4
  %next5 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %11, i32 0, i32 0
  store %struct.pattern_list* null, %struct.pattern_list** %next5, align 4
  %12 = load %struct.pattern_list*, %struct.pattern_list** %temp, align 4
  %flags = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %12, i32 0, i32 3
  store i32 0, i32* %flags, align 4
  %13 = load %struct.pattern_list*, %struct.pattern_list** %temp, align 4
  ret %struct.pattern_list* %13
}

; Function Attrs: noinline nounwind
define %struct.command* @make_if_command(%struct.command* %test, %struct.command* %true_case, %struct.command* %false_case) #0 {
entry:
  %test.addr = alloca %struct.command*, align 4
  %true_case.addr = alloca %struct.command*, align 4
  %false_case.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.if_com*, align 4
  store %struct.command* %test, %struct.command** %test.addr, align 4
  store %struct.command* %true_case, %struct.command** %true_case.addr, align 4
  store %struct.command* %false_case, %struct.command** %false_case.addr, align 4
  %call = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 405)
  %0 = bitcast i8* %call to %struct.if_com*
  store %struct.if_com* %0, %struct.if_com** %temp, align 4
  %1 = load %struct.if_com*, %struct.if_com** %temp, align 4
  %flags = getelementptr inbounds %struct.if_com, %struct.if_com* %1, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %2 = load %struct.command*, %struct.command** %test.addr, align 4
  %3 = load %struct.if_com*, %struct.if_com** %temp, align 4
  %test1 = getelementptr inbounds %struct.if_com, %struct.if_com* %3, i32 0, i32 1
  store %struct.command* %2, %struct.command** %test1, align 4
  %4 = load %struct.command*, %struct.command** %true_case.addr, align 4
  %5 = load %struct.if_com*, %struct.if_com** %temp, align 4
  %true_case2 = getelementptr inbounds %struct.if_com, %struct.if_com* %5, i32 0, i32 2
  store %struct.command* %4, %struct.command** %true_case2, align 4
  %6 = load %struct.command*, %struct.command** %false_case.addr, align 4
  %7 = load %struct.if_com*, %struct.if_com** %temp, align 4
  %false_case3 = getelementptr inbounds %struct.if_com, %struct.if_com* %7, i32 0, i32 3
  store %struct.command* %6, %struct.command** %false_case3, align 4
  %8 = load %struct.if_com*, %struct.if_com** %temp, align 4
  %9 = bitcast %struct.if_com* %8 to %struct.simple_com*
  %call4 = call %struct.command* @make_command(i32 3, %struct.simple_com* %9)
  ret %struct.command* %call4
}

; Function Attrs: noinline nounwind
define %struct.command* @make_while_command(%struct.command* %test, %struct.command* %action) #0 {
entry:
  %test.addr = alloca %struct.command*, align 4
  %action.addr = alloca %struct.command*, align 4
  store %struct.command* %test, %struct.command** %test.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  %0 = load %struct.command*, %struct.command** %test.addr, align 4
  %1 = load %struct.command*, %struct.command** %action.addr, align 4
  %call = call %struct.command* @make_until_or_while(i32 2, %struct.command* %0, %struct.command* %1)
  ret %struct.command* %call
}

; Function Attrs: noinline nounwind
define internal %struct.command* @make_until_or_while(i32 %which, %struct.command* %test, %struct.command* %action) #0 {
entry:
  %which.addr = alloca i32, align 4
  %test.addr = alloca %struct.command*, align 4
  %action.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.while_com*, align 4
  store i32 %which, i32* %which.addr, align 4
  store %struct.command* %test, %struct.command** %test.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 420)
  %0 = bitcast i8* %call to %struct.while_com*
  store %struct.while_com* %0, %struct.while_com** %temp, align 4
  %1 = load %struct.while_com*, %struct.while_com** %temp, align 4
  %flags = getelementptr inbounds %struct.while_com, %struct.while_com* %1, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %2 = load %struct.command*, %struct.command** %test.addr, align 4
  %3 = load %struct.while_com*, %struct.while_com** %temp, align 4
  %test1 = getelementptr inbounds %struct.while_com, %struct.while_com* %3, i32 0, i32 1
  store %struct.command* %2, %struct.command** %test1, align 4
  %4 = load %struct.command*, %struct.command** %action.addr, align 4
  %5 = load %struct.while_com*, %struct.while_com** %temp, align 4
  %action2 = getelementptr inbounds %struct.while_com, %struct.while_com* %5, i32 0, i32 2
  store %struct.command* %4, %struct.command** %action2, align 4
  %6 = load i32, i32* %which.addr, align 4
  %7 = load %struct.while_com*, %struct.while_com** %temp, align 4
  %8 = bitcast %struct.while_com* %7 to %struct.simple_com*
  %call3 = call %struct.command* @make_command(i32 %6, %struct.simple_com* %8)
  ret %struct.command* %call3
}

; Function Attrs: noinline nounwind
define %struct.command* @make_until_command(%struct.command* %test, %struct.command* %action) #0 {
entry:
  %test.addr = alloca %struct.command*, align 4
  %action.addr = alloca %struct.command*, align 4
  store %struct.command* %test, %struct.command** %test.addr, align 4
  store %struct.command* %action, %struct.command** %action.addr, align 4
  %0 = load %struct.command*, %struct.command** %test.addr, align 4
  %1 = load %struct.command*, %struct.command** %action.addr, align 4
  %call = call %struct.command* @make_until_or_while(i32 8, %struct.command* %0, %struct.command* %1)
  ret %struct.command* %call
}

; Function Attrs: noinline nounwind
define %struct.command* @make_arith_command(%struct.word_list* %exp) #0 {
entry:
  %exp.addr = alloca %struct.word_list*, align 4
  %command = alloca %struct.command*, align 4
  %temp = alloca %struct.arith_com*, align 4
  store %struct.word_list* %exp, %struct.word_list** %exp.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 449)
  %0 = bitcast i8* %call to %struct.command*
  store %struct.command* %0, %struct.command** %command, align 4
  %call1 = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 450)
  %1 = bitcast i8* %call1 to %struct.arith_com*
  store %struct.arith_com* %1, %struct.arith_com** %temp, align 4
  %2 = load %struct.command*, %struct.command** %command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 4
  %Arith = bitcast %union.anon* %value to %struct.arith_com**
  store %struct.arith_com* %1, %struct.arith_com** %Arith, align 4
  %3 = load %struct.arith_com*, %struct.arith_com** %temp, align 4
  %flags = getelementptr inbounds %struct.arith_com, %struct.arith_com* %3, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %4 = load i32, i32* @line_number, align 4
  %5 = load %struct.arith_com*, %struct.arith_com** %temp, align 4
  %line = getelementptr inbounds %struct.arith_com, %struct.arith_com* %5, i32 0, i32 1
  store i32 %4, i32* %line, align 4
  %6 = load %struct.word_list*, %struct.word_list** %exp.addr, align 4
  %7 = load %struct.arith_com*, %struct.arith_com** %temp, align 4
  %exp2 = getelementptr inbounds %struct.arith_com, %struct.arith_com* %7, i32 0, i32 2
  store %struct.word_list* %6, %struct.word_list** %exp2, align 4
  %8 = load %struct.command*, %struct.command** %command, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 0
  store i32 10, i32* %type, align 4
  %9 = load %struct.command*, %struct.command** %command, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects, align 4
  %10 = load %struct.command*, %struct.command** %command, align 4
  %flags3 = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 1
  store i32 0, i32* %flags3, align 4
  %11 = load %struct.command*, %struct.command** %command, align 4
  ret %struct.command* %11
}

; Function Attrs: noinline nounwind
define %struct.cond_com* @make_cond_node(i32 %type, %struct.word_desc* %op, %struct.cond_com* %left, %struct.cond_com* %right) #0 {
entry:
  %type.addr = alloca i32, align 4
  %op.addr = alloca %struct.word_desc*, align 4
  %left.addr = alloca %struct.cond_com*, align 4
  %right.addr = alloca %struct.cond_com*, align 4
  %temp = alloca %struct.cond_com*, align 4
  store i32 %type, i32* %type.addr, align 4
  store %struct.word_desc* %op, %struct.word_desc** %op.addr, align 4
  store %struct.cond_com* %left, %struct.cond_com** %left.addr, align 4
  store %struct.cond_com* %right, %struct.cond_com** %right.addr, align 4
  %call = call i8* @sh_xmalloc(i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 476)
  %0 = bitcast i8* %call to %struct.cond_com*
  store %struct.cond_com* %0, %struct.cond_com** %temp, align 4
  %1 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %flags = getelementptr inbounds %struct.cond_com, %struct.cond_com* %1, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %2 = load i32, i32* @line_number, align 4
  %3 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %line = getelementptr inbounds %struct.cond_com, %struct.cond_com* %3, i32 0, i32 1
  store i32 %2, i32* %line, align 4
  %4 = load i32, i32* %type.addr, align 4
  %5 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %type1 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %5, i32 0, i32 2
  store i32 %4, i32* %type1, align 4
  %6 = load %struct.word_desc*, %struct.word_desc** %op.addr, align 4
  %7 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %op2 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %7, i32 0, i32 3
  store %struct.word_desc* %6, %struct.word_desc** %op2, align 4
  %8 = load %struct.cond_com*, %struct.cond_com** %left.addr, align 4
  %9 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %left3 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %9, i32 0, i32 4
  store %struct.cond_com* %8, %struct.cond_com** %left3, align 4
  %10 = load %struct.cond_com*, %struct.cond_com** %right.addr, align 4
  %11 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  %right4 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %11, i32 0, i32 5
  store %struct.cond_com* %10, %struct.cond_com** %right4, align 4
  %12 = load %struct.cond_com*, %struct.cond_com** %temp, align 4
  ret %struct.cond_com* %12
}

; Function Attrs: noinline nounwind
define %struct.command* @make_cond_command(%struct.cond_com* %cond_node) #0 {
entry:
  %cond_node.addr = alloca %struct.cond_com*, align 4
  %command = alloca %struct.command*, align 4
  store %struct.cond_com* %cond_node, %struct.cond_com** %cond_node.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 495)
  %0 = bitcast i8* %call to %struct.command*
  store %struct.command* %0, %struct.command** %command, align 4
  %1 = load %struct.cond_com*, %struct.cond_com** %cond_node.addr, align 4
  %2 = load %struct.command*, %struct.command** %command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 4
  %Cond = bitcast %union.anon* %value to %struct.cond_com**
  store %struct.cond_com* %1, %struct.cond_com** %Cond, align 4
  %3 = load %struct.command*, %struct.command** %command, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %3, i32 0, i32 0
  store i32 11, i32* %type, align 4
  %4 = load %struct.command*, %struct.command** %command, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %4, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects, align 4
  %5 = load %struct.command*, %struct.command** %command, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 1
  store i32 0, i32* %flags, align 4
  %6 = load %struct.cond_com*, %struct.cond_com** %cond_node.addr, align 4
  %tobool = icmp ne %struct.cond_com* %6, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load %struct.cond_com*, %struct.cond_com** %cond_node.addr, align 4
  %line = getelementptr inbounds %struct.cond_com, %struct.cond_com* %7, i32 0, i32 1
  %8 = load i32, i32* %line, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ 0, %cond.false ]
  %9 = load %struct.command*, %struct.command** %command, align 4
  %line1 = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 2
  store i32 %cond, i32* %line1, align 4
  %10 = load %struct.command*, %struct.command** %command, align 4
  ret %struct.command* %10
}

; Function Attrs: noinline nounwind
define %struct.command* @make_bare_simple_command() #0 {
entry:
  %command = alloca %struct.command*, align 4
  %temp = alloca %struct.simple_com*, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 516)
  %0 = bitcast i8* %call to %struct.command*
  store %struct.command* %0, %struct.command** %command, align 4
  %call1 = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 517)
  %1 = bitcast i8* %call1 to %struct.simple_com*
  store %struct.simple_com* %1, %struct.simple_com** %temp, align 4
  %2 = load %struct.command*, %struct.command** %command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  store %struct.simple_com* %1, %struct.simple_com** %Simple, align 4
  %3 = load %struct.simple_com*, %struct.simple_com** %temp, align 4
  %flags = getelementptr inbounds %struct.simple_com, %struct.simple_com* %3, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %4 = load i32, i32* @line_number, align 4
  %5 = load %struct.simple_com*, %struct.simple_com** %temp, align 4
  %line = getelementptr inbounds %struct.simple_com, %struct.simple_com* %5, i32 0, i32 1
  store i32 %4, i32* %line, align 4
  %6 = load %struct.simple_com*, %struct.simple_com** %temp, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %6, i32 0, i32 2
  store %struct.word_list* null, %struct.word_list** %words, align 4
  %7 = load %struct.simple_com*, %struct.simple_com** %temp, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %7, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects, align 4
  %8 = load %struct.command*, %struct.command** %command, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 0
  store i32 4, i32* %type, align 4
  %9 = load %struct.command*, %struct.command** %command, align 4
  %redirects2 = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects2, align 4
  %10 = load %struct.command*, %struct.command** %command, align 4
  %flags3 = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 1
  store i32 0, i32* %flags3, align 4
  %11 = load %struct.command*, %struct.command** %command, align 4
  ret %struct.command* %11
}

; Function Attrs: noinline nounwind
define %struct.command* @make_simple_command(%struct.element* byval align 4 %element, %struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %r = alloca %struct.redirect*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call %struct.command* @make_bare_simple_command()
  store %struct.command* %call, %struct.command** %command.addr, align 4
  %1 = load i32, i32* @parser_state, align 4
  %or = or i32 %1, 524288
  store i32 %or, i32* @parser_state, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %word = getelementptr inbounds %struct.element, %struct.element* %element, i32 0, i32 0
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool = icmp ne %struct.word_desc* %2, null
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %word2 = getelementptr inbounds %struct.element, %struct.element* %element, i32 0, i32 0
  %3 = load %struct.word_desc*, %struct.word_desc** %word2, align 4
  %4 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %4, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %5 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %5, i32 0, i32 2
  %6 = load %struct.word_list*, %struct.word_list** %words, align 4
  %call3 = call %struct.word_list* @make_word_list(%struct.word_desc* %3, %struct.word_list* %6)
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %value4 = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 4
  %Simple5 = bitcast %union.anon* %value4 to %struct.simple_com**
  %8 = load %struct.simple_com*, %struct.simple_com** %Simple5, align 4
  %words6 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %8, i32 0, i32 2
  store %struct.word_list* %call3, %struct.word_list** %words6, align 4
  %9 = load i32, i32* @parser_state, align 4
  %and = and i32 %9, -524289
  store i32 %and, i32* @parser_state, align 4
  br label %if.end20

if.else:                                          ; preds = %if.end
  %redirect = getelementptr inbounds %struct.element, %struct.element* %element, i32 0, i32 1
  %10 = load %struct.redirect*, %struct.redirect** %redirect, align 4
  %tobool7 = icmp ne %struct.redirect* %10, null
  br i1 %tobool7, label %if.then8, label %if.end19

if.then8:                                         ; preds = %if.else
  %redirect9 = getelementptr inbounds %struct.element, %struct.element* %element, i32 0, i32 1
  %11 = load %struct.redirect*, %struct.redirect** %redirect9, align 4
  store %struct.redirect* %11, %struct.redirect** %r, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then8
  %12 = load %struct.redirect*, %struct.redirect** %r, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %12, i32 0, i32 0
  %13 = load %struct.redirect*, %struct.redirect** %next, align 4
  %tobool10 = icmp ne %struct.redirect* %13, null
  br i1 %tobool10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load %struct.redirect*, %struct.redirect** %r, align 4
  %next11 = getelementptr inbounds %struct.redirect, %struct.redirect* %14, i32 0, i32 0
  %15 = load %struct.redirect*, %struct.redirect** %next11, align 4
  store %struct.redirect* %15, %struct.redirect** %r, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load %struct.command*, %struct.command** %command.addr, align 4
  %value12 = getelementptr inbounds %struct.command, %struct.command* %16, i32 0, i32 4
  %Simple13 = bitcast %union.anon* %value12 to %struct.simple_com**
  %17 = load %struct.simple_com*, %struct.simple_com** %Simple13, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %17, i32 0, i32 3
  %18 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %19 = load %struct.redirect*, %struct.redirect** %r, align 4
  %next14 = getelementptr inbounds %struct.redirect, %struct.redirect* %19, i32 0, i32 0
  store %struct.redirect* %18, %struct.redirect** %next14, align 4
  %redirect15 = getelementptr inbounds %struct.element, %struct.element* %element, i32 0, i32 1
  %20 = load %struct.redirect*, %struct.redirect** %redirect15, align 4
  %21 = load %struct.command*, %struct.command** %command.addr, align 4
  %value16 = getelementptr inbounds %struct.command, %struct.command* %21, i32 0, i32 4
  %Simple17 = bitcast %union.anon* %value16 to %struct.simple_com**
  %22 = load %struct.simple_com*, %struct.simple_com** %Simple17, align 4
  %redirects18 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %22, i32 0, i32 3
  store %struct.redirect* %20, %struct.redirect** %redirects18, align 4
  br label %if.end19

if.end19:                                         ; preds = %while.end, %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then1
  %23 = load %struct.command*, %struct.command** %command.addr, align 4
  ret %struct.command* %23
}

; Function Attrs: noinline nounwind
define void @make_here_document(%struct.redirect* %temp, i32 %lineno) #0 {
entry:
  %temp.addr = alloca %struct.redirect*, align 4
  %lineno.addr = alloca i32, align 4
  %kill_leading = alloca i32, align 4
  %redir_len = alloca i32, align 4
  %redir_word = alloca i8*, align 4
  %document = alloca i8*, align 4
  %full_line = alloca i8*, align 4
  %document_index = alloca i32, align 4
  %document_size = alloca i32, align 4
  %delim_unquoted = alloca i32, align 4
  %line = alloca i8*, align 4
  %len = alloca i32, align 4
  store %struct.redirect* %temp, %struct.redirect** %temp.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 4
  %1 = load i32, i32* %instruction, align 4
  %cmp = icmp ne i32 %1, 8
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %instruction1 = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 4
  %3 = load i32, i32* %instruction1, align 4
  %cmp2 = icmp ne i32 %3, 4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i32 0, i32 0))
  %4 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %instruction3 = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 4
  %5 = load i32, i32* %instruction3, align 4
  call void (i8*, ...) @internal_error(i8* %call, i32 %5)
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %instruction4 = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 4
  %7 = load i32, i32* %instruction4, align 4
  %cmp5 = icmp eq i32 %7, 8
  %conv = zext i1 %cmp5 to i32
  store i32 %conv, i32* %kill_leading, align 4
  store i8* null, i8** %document, align 4
  store i32 0, i32* %document_size, align 4
  store i32 0, i32* %document_index, align 4
  %8 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %8, i32 0, i32 5
  %filename = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %9 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word, align 4
  %call6 = call i8* @string_quote_removal(i8* %10, i32 0)
  store i8* %call6, i8** %redir_word, align 4
  %11 = load i8*, i8** %redir_word, align 4
  %tobool = icmp ne i8* %11, null
  br i1 %tobool, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  %12 = load i8*, i8** %redir_word, align 4
  %call8 = call i32 @strlen(i8* %12)
  store i32 %call8, i32* %redir_len, align 4
  br label %if.end11

if.else:                                          ; preds = %if.end
  %call9 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 604)
  %13 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %13, i32 0, i32 6
  store i8* %call9, i8** %here_doc_eof, align 4
  %14 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %here_doc_eof10 = getelementptr inbounds %struct.redirect, %struct.redirect* %14, i32 0, i32 6
  %15 = load i8*, i8** %here_doc_eof10, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 0
  store i8 0, i8* %arrayidx, align 1
  br label %document_done

if.end11:                                         ; preds = %if.then7
  %16 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee12 = getelementptr inbounds %struct.redirect, %struct.redirect* %16, i32 0, i32 5
  %filename13 = bitcast %union.REDIRECTEE* %redirectee12 to %struct.word_desc**
  %17 = load %struct.word_desc*, %struct.word_desc** %filename13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %17, i32 0, i32 0
  %18 = load i8*, i8** %word14, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 609)
  %19 = load i8*, i8** %redir_word, align 4
  %20 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %here_doc_eof15 = getelementptr inbounds %struct.redirect, %struct.redirect* %20, i32 0, i32 6
  store i8* %19, i8** %here_doc_eof15, align 4
  %21 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee16 = getelementptr inbounds %struct.redirect, %struct.redirect* %21, i32 0, i32 5
  %filename17 = bitcast %union.REDIRECTEE* %redirectee16 to %struct.word_desc**
  %22 = load %struct.word_desc*, %struct.word_desc** %filename17, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 1
  %23 = load i32, i32* %flags, align 4
  %and = and i32 %23, 2
  %cmp18 = icmp eq i32 %and, 0
  %conv19 = zext i1 %cmp18 to i32
  store i32 %conv19, i32* %delim_unquoted, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end92, %if.then59, %if.end11
  %24 = load i32, i32* %delim_unquoted, align 4
  %call20 = call i8* @read_secondary_line(i32 %24)
  store i8* %call20, i8** %full_line, align 4
  %tobool21 = icmp ne i8* %call20, null
  br i1 %tobool21, label %while.body, label %while.end94

while.body:                                       ; preds = %while.cond
  store i32 0, i32* @here_doc_first_line, align 4
  %25 = load i8*, i8** %full_line, align 4
  store i8* %25, i8** %line, align 4
  %26 = load i32, i32* @line_number, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* @line_number, align 4
  %27 = load i32, i32* @echo_input_at_read, align 4
  %tobool22 = icmp ne i32 %27, 0
  br i1 %tobool22, label %if.then23, label %if.end25

if.then23:                                        ; preds = %while.body
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %29 = load i8*, i8** %line, align 4
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* %29)
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %while.body
  %30 = load i32, i32* %kill_leading, align 4
  %tobool26 = icmp ne i32 %30, 0
  br i1 %tobool26, label %land.lhs.true27, label %if.end55

land.lhs.true27:                                  ; preds = %if.end25
  %31 = load i8*, i8** %line, align 4
  %32 = load i8, i8* %31, align 1
  %conv28 = sext i8 %32 to i32
  %tobool29 = icmp ne i32 %conv28, 0
  br i1 %tobool29, label %if.then30, label %if.end55

if.then30:                                        ; preds = %land.lhs.true27
  %33 = load i32, i32* %redir_len, align 4
  %cmp31 = icmp eq i32 %33, 0
  br i1 %cmp31, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then30
  br i1 true, label %land.lhs.true43, label %if.end49

cond.false:                                       ; preds = %if.then30
  %34 = load i8*, i8** %line, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %34, i32 0
  %35 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %35 to i32
  %36 = load i8*, i8** %redir_word, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx35, align 1
  %conv36 = sext i8 %37 to i32
  %cmp37 = icmp eq i32 %conv34, %conv36
  br i1 %cmp37, label %land.lhs.true39, label %if.end49

land.lhs.true39:                                  ; preds = %cond.false
  %38 = load i8*, i8** %line, align 4
  %39 = load i8*, i8** %redir_word, align 4
  %40 = load i32, i32* %redir_len, align 4
  %call40 = call i32 @strncmp(i8* %38, i8* %39, i32 %40)
  %cmp41 = icmp eq i32 %call40, 0
  br i1 %cmp41, label %land.lhs.true43, label %if.end49

land.lhs.true43:                                  ; preds = %land.lhs.true39, %cond.true
  %41 = load i8*, i8** %line, align 4
  %42 = load i32, i32* %redir_len, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %41, i32 %42
  %43 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %43 to i32
  %cmp46 = icmp eq i32 %conv45, 10
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %land.lhs.true43
  br label %document_done

if.end49:                                         ; preds = %land.lhs.true43, %land.lhs.true39, %cond.false, %cond.true
  br label %while.cond50

while.cond50:                                     ; preds = %while.body54, %if.end49
  %44 = load i8*, i8** %line, align 4
  %45 = load i8, i8* %44, align 1
  %conv51 = sext i8 %45 to i32
  %cmp52 = icmp eq i32 %conv51, 9
  br i1 %cmp52, label %while.body54, label %while.end

while.body54:                                     ; preds = %while.cond50
  %46 = load i8*, i8** %line, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr, i8** %line, align 4
  br label %while.cond50

while.end:                                        ; preds = %while.cond50
  br label %if.end55

if.end55:                                         ; preds = %while.end, %land.lhs.true27, %if.end25
  %47 = load i8*, i8** %line, align 4
  %48 = load i8, i8* %47, align 1
  %conv56 = sext i8 %48 to i32
  %cmp57 = icmp eq i32 %conv56, 0
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end55
  br label %while.cond

if.end60:                                         ; preds = %if.end55
  %49 = load i32, i32* %redir_len, align 4
  %cmp61 = icmp eq i32 %49, 0
  br i1 %cmp61, label %cond.true63, label %cond.false64

cond.true63:                                      ; preds = %if.end60
  br i1 true, label %land.lhs.true75, label %if.end81

cond.false64:                                     ; preds = %if.end60
  %50 = load i8*, i8** %line, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %50, i32 0
  %51 = load i8, i8* %arrayidx65, align 1
  %conv66 = sext i8 %51 to i32
  %52 = load i8*, i8** %redir_word, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %52, i32 0
  %53 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %53 to i32
  %cmp69 = icmp eq i32 %conv66, %conv68
  br i1 %cmp69, label %land.lhs.true71, label %if.end81

land.lhs.true71:                                  ; preds = %cond.false64
  %54 = load i8*, i8** %line, align 4
  %55 = load i8*, i8** %redir_word, align 4
  %56 = load i32, i32* %redir_len, align 4
  %call72 = call i32 @strncmp(i8* %54, i8* %55, i32 %56)
  %cmp73 = icmp eq i32 %call72, 0
  br i1 %cmp73, label %land.lhs.true75, label %if.end81

land.lhs.true75:                                  ; preds = %land.lhs.true71, %cond.true63
  %57 = load i8*, i8** %line, align 4
  %58 = load i32, i32* %redir_len, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %59 to i32
  %cmp78 = icmp eq i32 %conv77, 10
  br i1 %cmp78, label %if.then80, label %if.end81

if.then80:                                        ; preds = %land.lhs.true75
  br label %document_done

if.end81:                                         ; preds = %land.lhs.true75, %land.lhs.true71, %cond.false64, %cond.true63
  %60 = load i8*, i8** %line, align 4
  %call82 = call i32 @strlen(i8* %60)
  store i32 %call82, i32* %len, align 4
  %61 = load i32, i32* %len, align 4
  %62 = load i32, i32* %document_index, align 4
  %add = add nsw i32 %61, %62
  %63 = load i32, i32* %document_size, align 4
  %cmp83 = icmp sge i32 %add, %63
  br i1 %cmp83, label %if.then85, label %if.end92

if.then85:                                        ; preds = %if.end81
  %64 = load i32, i32* %document_size, align 4
  %tobool86 = icmp ne i32 %64, 0
  br i1 %tobool86, label %cond.true87, label %cond.false89

cond.true87:                                      ; preds = %if.then85
  %65 = load i32, i32* %document_size, align 4
  %66 = load i32, i32* %len, align 4
  %add88 = add nsw i32 %65, %66
  %mul = mul nsw i32 2, %add88
  br label %cond.end

cond.false89:                                     ; preds = %if.then85
  %67 = load i32, i32* %len, align 4
  %add90 = add nsw i32 %67, 2
  br label %cond.end

cond.end:                                         ; preds = %cond.false89, %cond.true87
  %cond = phi i32 [ %mul, %cond.true87 ], [ %add90, %cond.false89 ]
  store i32 %cond, i32* %document_size, align 4
  %68 = load i8*, i8** %document, align 4
  %69 = load i32, i32* %document_size, align 4
  %call91 = call i8* @sh_xrealloc(i8* %68, i32 %69, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 659)
  store i8* %call91, i8** %document, align 4
  br label %if.end92

if.end92:                                         ; preds = %cond.end, %if.end81
  %70 = load i8*, i8** %document, align 4
  %71 = load i32, i32* %document_index, align 4
  %add.ptr = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i8*, i8** %line, align 4
  %73 = load i32, i32* %len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr, i8* %72, i32 %73, i32 1, i1 false)
  %74 = load i32, i32* %len, align 4
  %75 = load i32, i32* %document_index, align 4
  %add93 = add nsw i32 %75, %74
  store i32 %add93, i32* %document_index, align 4
  br label %while.cond

while.end94:                                      ; preds = %while.cond
  %76 = load i8*, i8** %full_line, align 4
  %cmp95 = icmp eq i8* %76, null
  br i1 %cmp95, label %if.then97, label %if.end99

if.then97:                                        ; preds = %while.end94
  %call98 = call i8* @libintl_gettext(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.8, i32 0, i32 0))
  %77 = load i32, i32* %lineno.addr, align 4
  %78 = load i8*, i8** %redir_word, align 4
  call void (i8*, ...) @internal_warning(i8* %call98, i32 %77, i8* %78)
  br label %if.end99

if.end99:                                         ; preds = %if.then97, %while.end94
  br label %document_done

document_done:                                    ; preds = %if.end99, %if.then80, %if.then48, %if.else
  %79 = load i8*, i8** %document, align 4
  %tobool100 = icmp ne i8* %79, null
  br i1 %tobool100, label %if.then101, label %if.else103

if.then101:                                       ; preds = %document_done
  %80 = load i8*, i8** %document, align 4
  %81 = load i32, i32* %document_index, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %80, i32 %81
  store i8 0, i8* %arrayidx102, align 1
  br label %if.end106

if.else103:                                       ; preds = %document_done
  %call104 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 676)
  store i8* %call104, i8** %document, align 4
  %82 = load i8*, i8** %document, align 4
  %arrayidx105 = getelementptr inbounds i8, i8* %82, i32 0
  store i8 0, i8* %arrayidx105, align 1
  br label %if.end106

if.end106:                                        ; preds = %if.else103, %if.then101
  %83 = load i8*, i8** %document, align 4
  %84 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee107 = getelementptr inbounds %struct.redirect, %struct.redirect* %84, i32 0, i32 5
  %filename108 = bitcast %union.REDIRECTEE* %redirectee107 to %struct.word_desc**
  %85 = load %struct.word_desc*, %struct.word_desc** %filename108, align 4
  %word109 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %85, i32 0, i32 0
  store i8* %83, i8** %word109, align 4
  store i32 0, i32* @here_doc_first_line, align 4
  br label %return

return:                                           ; preds = %if.end106, %if.then
  ret void
}

declare void @internal_error(i8*, ...) #1

declare i8* @string_quote_removal(i8*, i32) #1

declare i8* @read_secondary_line(i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @internal_warning(i8*, ...) #1

; Function Attrs: noinline nounwind
define %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %source, i32 %instruction, %union.REDIRECTEE* byval align 4 %dest_and_filename, i32 %flags) #0 {
entry:
  %instruction.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %temp = alloca %struct.redirect*, align 4
  %w = alloca %struct.word_desc*, align 4
  %wlen = alloca i32, align 4
  %lfd = alloca i64, align 8
  store i32 %instruction, i32* %instruction.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %call = call i8* @sh_xmalloc(i32 28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 698)
  %0 = bitcast i8* %call to %struct.redirect*
  store %struct.redirect* %0, %struct.redirect** %temp, align 4
  %1 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %1, i32 0, i32 1
  %2 = bitcast %union.REDIRECTEE* %redirector to i8*
  %3 = bitcast %union.REDIRECTEE* %source to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* %3, i32 4, i32 4, i1 false)
  %4 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 5
  %5 = bitcast %union.REDIRECTEE* %redirectee to i8*
  %6 = bitcast %union.REDIRECTEE* %dest_and_filename to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %5, i8* %6, i32 4, i32 4, i1 false)
  %7 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %7, i32 0, i32 6
  store i8* null, i8** %here_doc_eof, align 4
  %8 = load i32, i32* %instruction.addr, align 4
  %9 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %instruction1 = getelementptr inbounds %struct.redirect, %struct.redirect* %9, i32 0, i32 4
  store i32 %8, i32* %instruction1, align 4
  %10 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %flags2 = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 3
  store i32 0, i32* %flags2, align 4
  %11 = load i32, i32* %flags.addr, align 4
  %12 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %12, i32 0, i32 2
  store i32 %11, i32* %rflags, align 4
  %13 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %13, i32 0, i32 0
  store %struct.redirect* null, %struct.redirect** %next, align 4
  %14 = load i32, i32* %instruction.addr, align 4
  switch i32 %14, label %sw.default [
    i32 0, label %sw.bb
    i32 12, label %sw.bb
    i32 10, label %sw.bb
    i32 3, label %sw.bb4
    i32 19, label %sw.bb4
    i32 1, label %sw.bb6
    i32 2, label %sw.bb6
    i32 11, label %sw.bb8
    i32 8, label %sw.bb10
    i32 4, label %sw.bb10
    i32 5, label %sw.bb10
    i32 9, label %sw.bb10
    i32 6, label %sw.bb10
    i32 7, label %sw.bb10
    i32 15, label %sw.bb11
    i32 16, label %sw.bb11
    i32 17, label %sw.bb11
    i32 18, label %sw.bb11
    i32 13, label %sw.bb12
    i32 14, label %sw.bb12
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry
  %15 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %flags3 = getelementptr inbounds %struct.redirect, %struct.redirect* %15, i32 0, i32 3
  store i32 577, i32* %flags3, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry, %entry
  %16 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %flags5 = getelementptr inbounds %struct.redirect, %struct.redirect* %16, i32 0, i32 3
  store i32 1089, i32* %flags5, align 4
  br label %sw.epilog

sw.bb6:                                           ; preds = %entry, %entry
  %17 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %flags7 = getelementptr inbounds %struct.redirect, %struct.redirect* %17, i32 0, i32 3
  store i32 0, i32* %flags7, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %18 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %flags9 = getelementptr inbounds %struct.redirect, %struct.redirect* %18, i32 0, i32 3
  store i32 66, i32* %flags9, align 4
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry, %entry, %entry, %entry, %entry, %entry
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry, %entry, %entry, %entry
  br label %sw.epilog

sw.bb12:                                          ; preds = %entry, %entry
  %filename = bitcast %union.REDIRECTEE* %dest_and_filename to %struct.word_desc**
  %19 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  store %struct.word_desc* %19, %struct.word_desc** %w, align 4
  %20 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word, align 4
  %call13 = call i32 @strlen(i8* %21)
  %sub = sub i32 %call13, 1
  store i32 %sub, i32* %wlen, align 4
  %22 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word14, align 4
  %24 = load i32, i32* %wlen, align 4
  %arrayidx = getelementptr inbounds i8, i8* %23, i32 %24
  %25 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %25 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then, label %if.end38

if.then:                                          ; preds = %sw.bb12
  %26 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word16 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word16, align 4
  %28 = load i32, i32* %wlen, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %27, i32 %28
  store i8 0, i8* %arrayidx17, align 1
  %29 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %29, i32 0, i32 0
  %30 = load i8*, i8** %word18, align 4
  %call19 = call i32 @all_digits(i8* %30)
  %tobool = icmp ne i32 %call19, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %31 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 0
  %32 = load i8*, i8** %word20, align 4
  %call21 = call i32 @legal_number(i8* %32, i64* %lfd)
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %land.lhs.true23, label %if.else

land.lhs.true23:                                  ; preds = %land.lhs.true
  %33 = load i64, i64* %lfd, align 8
  %34 = load i64, i64* %lfd, align 8
  %conv24 = trunc i64 %34 to i32
  %conv25 = sext i32 %conv24 to i64
  %cmp26 = icmp eq i64 %33, %conv25
  br i1 %cmp26, label %if.then28, label %if.else

if.then28:                                        ; preds = %land.lhs.true23
  %35 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  call void @dispose_word(%struct.word_desc* %35)
  %36 = load i32, i32* %instruction.addr, align 4
  %cmp29 = icmp eq i32 %36, 13
  %cond = select i1 %cmp29, i32 15, i32 16
  %37 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %instruction31 = getelementptr inbounds %struct.redirect, %struct.redirect* %37, i32 0, i32 4
  store i32 %cond, i32* %instruction31, align 4
  %38 = load i64, i64* %lfd, align 8
  %conv32 = trunc i64 %38 to i32
  %39 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %redirectee33 = getelementptr inbounds %struct.redirect, %struct.redirect* %39, i32 0, i32 5
  %dest = bitcast %union.REDIRECTEE* %redirectee33 to i32*
  store i32 %conv32, i32* %dest, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true23, %land.lhs.true, %if.then
  %40 = load i32, i32* %instruction.addr, align 4
  %cmp34 = icmp eq i32 %40, 13
  %cond36 = select i1 %cmp34, i32 17, i32 18
  %41 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %instruction37 = getelementptr inbounds %struct.redirect, %struct.redirect* %41, i32 0, i32 4
  store i32 %cond36, i32* %instruction37, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then28
  br label %if.end38

if.end38:                                         ; preds = %if.end, %sw.bb12
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call39 = call i8* @libintl_gettext(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.9, i32 0, i32 0))
  %42 = load i32, i32* %instruction.addr, align 4
  call void (i8*, ...) @programming_error(i8* %call39, i32 %42)
  call void @abort() #4
  unreachable

sw.epilog:                                        ; preds = %if.end38, %sw.bb11, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb4, %sw.bb
  %43 = load %struct.redirect*, %struct.redirect** %temp, align 4
  ret %struct.redirect* %43
}

declare i32 @all_digits(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @dispose_word(%struct.word_desc*) #1

declare void @programming_error(i8*, ...) #1

; Function Attrs: noreturn
declare void @abort() #3

; Function Attrs: noinline nounwind
define %struct.command* @make_function_def(%struct.word_desc* %name, %struct.command* %command, i32 %lineno, i32 %lstart) #0 {
entry:
  %name.addr = alloca %struct.word_desc*, align 4
  %command.addr = alloca %struct.command*, align 4
  %lineno.addr = alloca i32, align 4
  %lstart.addr = alloca i32, align 4
  %temp = alloca %struct.function_def*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  store %struct.word_desc* %name, %struct.word_desc** %name.addr, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %lineno, i32* %lineno.addr, align 4
  store i32 %lstart, i32* %lstart.addr, align 4
  %call = call i8* @sh_xmalloc(i32 20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 787)
  %0 = bitcast i8* %call to %struct.function_def*
  store %struct.function_def* %0, %struct.function_def** %temp, align 4
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %2 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %command1 = getelementptr inbounds %struct.function_def, %struct.function_def* %2, i32 0, i32 3
  store %struct.command* %1, %struct.command** %command1, align 4
  %3 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %4 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %name2 = getelementptr inbounds %struct.function_def, %struct.function_def* %4, i32 0, i32 2
  store %struct.word_desc* %3, %struct.word_desc** %name2, align 4
  %5 = load i32, i32* %lineno.addr, align 4
  %6 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %line = getelementptr inbounds %struct.function_def, %struct.function_def* %6, i32 0, i32 1
  store i32 %5, i32* %line, align 4
  %7 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %flags = getelementptr inbounds %struct.function_def, %struct.function_def* %7, i32 0, i32 0
  store i32 0, i32* %flags, align 4
  %8 = load i32, i32* %lstart.addr, align 4
  %9 = load %struct.command*, %struct.command** %command.addr, align 4
  %line3 = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 2
  store i32 %8, i32* %line3, align 4
  %10 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file = getelementptr inbounds %struct.function_def, %struct.function_def* %10, i32 0, i32 4
  store i8* null, i8** %source_file, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %call4 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.10, i32 0, i32 0))
  store %struct.variable* %call4, %struct.variable** %bash_source_v, align 4
  %11 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool = icmp ne %struct.variable* %11, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %do.body
  %12 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes, align 4
  %and = and i32 %13, 4
  %tobool5 = icmp ne i32 %and, 0
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %14 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value, align 4
  %16 = bitcast i8* %15 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %do.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %16, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %bash_source_a, align 4
  br label %do.end

do.end:                                           ; preds = %cond.end
  %17 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %tobool6 = icmp ne %struct.array* %17, null
  br i1 %tobool6, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %do.end
  %18 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %18, i32 0, i32 2
  %19 = load i32, i32* %num_elements, align 8
  %cmp = icmp sgt i32 %19, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  %20 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %call8 = call i8* @array_reference(%struct.array* %20, i64 0)
  %21 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file9 = getelementptr inbounds %struct.function_def, %struct.function_def* %21, i32 0, i32 4
  store i8* %call8, i8** %source_file9, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true7, %do.end
  %22 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file10 = getelementptr inbounds %struct.function_def, %struct.function_def* %22, i32 0, i32 4
  %23 = load i8*, i8** %source_file10, align 4
  %cmp11 = icmp eq i8* %23, null
  br i1 %cmp11, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.end
  %24 = load i32, i32* @shell_initialized, align 4
  %tobool13 = icmp ne i32 %24, 0
  %cond14 = select i1 %tobool13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.12, i32 0, i32 0)
  %25 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file15 = getelementptr inbounds %struct.function_def, %struct.function_def* %25, i32 0, i32 4
  store i8* %cond14, i8** %source_file15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then12, %if.end
  %26 = load %struct.word_desc*, %struct.word_desc** %name.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %26, i32 0, i32 0
  %27 = load i8*, i8** %word, align 4
  %28 = load %struct.function_def*, %struct.function_def** %temp, align 4
  call void @bind_function_def(i8* %27, %struct.function_def* %28)
  %29 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file17 = getelementptr inbounds %struct.function_def, %struct.function_def* %29, i32 0, i32 4
  %30 = load i8*, i8** %source_file17, align 4
  %tobool18 = icmp ne i8* %30, null
  br i1 %tobool18, label %cond.true19, label %cond.false25

cond.true19:                                      ; preds = %if.end16
  %31 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file20 = getelementptr inbounds %struct.function_def, %struct.function_def* %31, i32 0, i32 4
  %32 = load i8*, i8** %source_file20, align 4
  %call21 = call i32 @strlen(i8* %32)
  %add = add i32 1, %call21
  %call22 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 811)
  %33 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file23 = getelementptr inbounds %struct.function_def, %struct.function_def* %33, i32 0, i32 4
  %34 = load i8*, i8** %source_file23, align 4
  %call24 = call i8* @strcpy(i8* %call22, i8* %34)
  br label %cond.end26

cond.false25:                                     ; preds = %if.end16
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false25, %cond.true19
  %cond27 = phi i8* [ %call24, %cond.true19 ], [ null, %cond.false25 ]
  %35 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %source_file28 = getelementptr inbounds %struct.function_def, %struct.function_def* %35, i32 0, i32 4
  store i8* %cond27, i8** %source_file28, align 4
  %36 = load %struct.function_def*, %struct.function_def** %temp, align 4
  %37 = bitcast %struct.function_def* %36 to %struct.simple_com*
  %call29 = call %struct.command* @make_command(i32 7, %struct.simple_com* %37)
  ret %struct.command* %call29
}

declare %struct.variable* @find_variable(i8*) #1

declare i8* @array_reference(%struct.array*, i64) #1

declare void @bind_function_def(i8*, %struct.function_def*) #1

; Function Attrs: noinline nounwind
define %struct.command* @make_subshell_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.subshell_com*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %call = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 822)
  %0 = bitcast i8* %call to %struct.subshell_com*
  store %struct.subshell_com* %0, %struct.subshell_com** %temp, align 4
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %2 = load %struct.subshell_com*, %struct.subshell_com** %temp, align 4
  %command1 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %2, i32 0, i32 1
  store %struct.command* %1, %struct.command** %command1, align 4
  %3 = load %struct.subshell_com*, %struct.subshell_com** %temp, align 4
  %flags = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %3, i32 0, i32 0
  store i32 1, i32* %flags, align 4
  %4 = load %struct.subshell_com*, %struct.subshell_com** %temp, align 4
  %5 = bitcast %struct.subshell_com* %4 to %struct.simple_com*
  %call2 = call %struct.command* @make_command(i32 13, %struct.simple_com* %5)
  ret %struct.command* %call2
}

; Function Attrs: noinline nounwind
define %struct.command* @make_coproc_command(i8* %name, %struct.command* %command) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %command.addr = alloca %struct.command*, align 4
  %temp = alloca %struct.coproc_com*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %call = call i8* @sh_xmalloc(i32 12, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 835)
  %0 = bitcast i8* %call to %struct.coproc_com*
  store %struct.coproc_com* %0, %struct.coproc_com** %temp, align 4
  %1 = load i8*, i8** %name.addr, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 836)
  %2 = load i8*, i8** %name.addr, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  %3 = load %struct.coproc_com*, %struct.coproc_com** %temp, align 4
  %name4 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %3, i32 0, i32 1
  store i8* %call3, i8** %name4, align 4
  %4 = load %struct.command*, %struct.command** %command.addr, align 4
  %5 = load %struct.coproc_com*, %struct.coproc_com** %temp, align 4
  %command5 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %5, i32 0, i32 2
  store %struct.command* %4, %struct.command** %command5, align 4
  %6 = load %struct.coproc_com*, %struct.coproc_com** %temp, align 4
  %flags = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %6, i32 0, i32 0
  store i32 4097, i32* %flags, align 4
  %7 = load %struct.coproc_com*, %struct.coproc_com** %temp, align 4
  %8 = bitcast %struct.coproc_com* %7 to %struct.simple_com*
  %call6 = call %struct.command* @make_command(i32 14, %struct.simple_com* %8)
  ret %struct.command* %call6
}

; Function Attrs: noinline nounwind
define %struct.command* @clean_simple_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %0, i32 0, i32 0
  %1 = load i32, i32* %type, align 4
  %cmp = icmp ne i32 %1, 4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %type1 = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 0
  %3 = load i32, i32* %type1, align 4
  call void @command_error(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.13, i32 0, i32 0), i32 1, i32 %3, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %4, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %5 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %5, i32 0, i32 2
  %6 = load %struct.word_list*, %struct.word_list** %words, align 4
  %tobool = icmp ne %struct.word_list* %6, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %if.else
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %value2 = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 4
  %Simple3 = bitcast %union.anon* %value2 to %struct.simple_com**
  %8 = load %struct.simple_com*, %struct.simple_com** %Simple3, align 4
  %words4 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %8, i32 0, i32 2
  %9 = load %struct.word_list*, %struct.word_list** %words4, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 0
  %10 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool5 = icmp ne %struct.word_list* %10, null
  br i1 %tobool5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %11 = load %struct.command*, %struct.command** %command.addr, align 4
  %value6 = getelementptr inbounds %struct.command, %struct.command* %11, i32 0, i32 4
  %Simple7 = bitcast %union.anon* %value6 to %struct.simple_com**
  %12 = load %struct.simple_com*, %struct.simple_com** %Simple7, align 4
  %words8 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %12, i32 0, i32 2
  %13 = load %struct.word_list*, %struct.word_list** %words8, align 4
  %14 = bitcast %struct.word_list* %13 to %struct.g_list*
  %call = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %14)
  %15 = bitcast %struct.g_list* %call to %struct.word_list*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %if.else
  %16 = load %struct.command*, %struct.command** %command.addr, align 4
  %value9 = getelementptr inbounds %struct.command, %struct.command* %16, i32 0, i32 4
  %Simple10 = bitcast %union.anon* %value9 to %struct.simple_com**
  %17 = load %struct.simple_com*, %struct.simple_com** %Simple10, align 4
  %words11 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %17, i32 0, i32 2
  %18 = load %struct.word_list*, %struct.word_list** %words11, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.word_list* [ %15, %cond.true ], [ %18, %cond.false ]
  %19 = load %struct.command*, %struct.command** %command.addr, align 4
  %value12 = getelementptr inbounds %struct.command, %struct.command* %19, i32 0, i32 4
  %Simple13 = bitcast %union.anon* %value12 to %struct.simple_com**
  %20 = load %struct.simple_com*, %struct.simple_com** %Simple13, align 4
  %words14 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %20, i32 0, i32 2
  store %struct.word_list* %cond, %struct.word_list** %words14, align 4
  %21 = load %struct.command*, %struct.command** %command.addr, align 4
  %value15 = getelementptr inbounds %struct.command, %struct.command* %21, i32 0, i32 4
  %Simple16 = bitcast %union.anon* %value15 to %struct.simple_com**
  %22 = load %struct.simple_com*, %struct.simple_com** %Simple16, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %22, i32 0, i32 3
  %23 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool17 = icmp ne %struct.redirect* %23, null
  br i1 %tobool17, label %land.lhs.true18, label %cond.false29

land.lhs.true18:                                  ; preds = %cond.end
  %24 = load %struct.command*, %struct.command** %command.addr, align 4
  %value19 = getelementptr inbounds %struct.command, %struct.command* %24, i32 0, i32 4
  %Simple20 = bitcast %union.anon* %value19 to %struct.simple_com**
  %25 = load %struct.simple_com*, %struct.simple_com** %Simple20, align 4
  %redirects21 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %25, i32 0, i32 3
  %26 = load %struct.redirect*, %struct.redirect** %redirects21, align 4
  %next22 = getelementptr inbounds %struct.redirect, %struct.redirect* %26, i32 0, i32 0
  %27 = load %struct.redirect*, %struct.redirect** %next22, align 4
  %tobool23 = icmp ne %struct.redirect* %27, null
  br i1 %tobool23, label %cond.true24, label %cond.false29

cond.true24:                                      ; preds = %land.lhs.true18
  %28 = load %struct.command*, %struct.command** %command.addr, align 4
  %value25 = getelementptr inbounds %struct.command, %struct.command* %28, i32 0, i32 4
  %Simple26 = bitcast %union.anon* %value25 to %struct.simple_com**
  %29 = load %struct.simple_com*, %struct.simple_com** %Simple26, align 4
  %redirects27 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %29, i32 0, i32 3
  %30 = load %struct.redirect*, %struct.redirect** %redirects27, align 4
  %31 = bitcast %struct.redirect* %30 to %struct.g_list*
  %call28 = call %struct.g_list* bitcast (%struct.g_list* (...)* @list_reverse to %struct.g_list* (%struct.g_list*)*)(%struct.g_list* %31)
  %32 = bitcast %struct.g_list* %call28 to %struct.redirect*
  br label %cond.end33

cond.false29:                                     ; preds = %land.lhs.true18, %cond.end
  %33 = load %struct.command*, %struct.command** %command.addr, align 4
  %value30 = getelementptr inbounds %struct.command, %struct.command* %33, i32 0, i32 4
  %Simple31 = bitcast %union.anon* %value30 to %struct.simple_com**
  %34 = load %struct.simple_com*, %struct.simple_com** %Simple31, align 4
  %redirects32 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %34, i32 0, i32 3
  %35 = load %struct.redirect*, %struct.redirect** %redirects32, align 4
  br label %cond.end33

cond.end33:                                       ; preds = %cond.false29, %cond.true24
  %cond34 = phi %struct.redirect* [ %32, %cond.true24 ], [ %35, %cond.false29 ]
  %36 = load %struct.command*, %struct.command** %command.addr, align 4
  %value35 = getelementptr inbounds %struct.command, %struct.command* %36, i32 0, i32 4
  %Simple36 = bitcast %union.anon* %value35 to %struct.simple_com**
  %37 = load %struct.simple_com*, %struct.simple_com** %Simple36, align 4
  %redirects37 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %37, i32 0, i32 3
  store %struct.redirect* %cond34, %struct.redirect** %redirects37, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end33, %if.then
  %38 = load i32, i32* @parser_state, align 4
  %and = and i32 %38, -524289
  store i32 %and, i32* @parser_state, align 4
  %39 = load %struct.command*, %struct.command** %command.addr, align 4
  ret %struct.command* %39
}

declare void @command_error(i8*, i32, i32, i32) #1

; Function Attrs: noinline nounwind
define %struct.command* @connect_async_list(%struct.command* %command, %struct.command* %command2, i32 %connector) #0 {
entry:
  %retval = alloca %struct.command*, align 4
  %command.addr = alloca %struct.command*, align 4
  %command2.addr = alloca %struct.command*, align 4
  %connector.addr = alloca i32, align 4
  %t = alloca %struct.command*, align 4
  %t1 = alloca %struct.command*, align 4
  %t2 = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store %struct.command* %command2, %struct.command** %command2.addr, align 4
  store i32 %connector, i32* %connector.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %0, %struct.command** %t1, align 4
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %1, i32 0, i32 4
  %Connection = bitcast %union.anon* %value to %struct.connection**
  %2 = load %struct.connection*, %struct.connection** %Connection, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %2, i32 0, i32 2
  %3 = load %struct.command*, %struct.command** %second, align 4
  store %struct.command* %3, %struct.command** %t, align 4
  %4 = load %struct.command*, %struct.command** %t, align 4
  %tobool = icmp ne %struct.command* %4, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 1
  %6 = load i32, i32* %flags, align 4
  %and = and i32 %6, 1
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %value3 = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 4
  %Connection4 = bitcast %union.anon* %value3 to %struct.connection**
  %8 = load %struct.connection*, %struct.connection** %Connection4, align 4
  %connector5 = getelementptr inbounds %struct.connection, %struct.connection* %8, i32 0, i32 3
  %9 = load i32, i32* %connector5, align 4
  %cmp = icmp ne i32 %9, 59
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %10 = load %struct.command*, %struct.command** %command.addr, align 4
  %11 = load %struct.command*, %struct.command** %command2.addr, align 4
  %12 = load i32, i32* %connector.addr, align 4
  %call = call %struct.command* @command_connect(%struct.command* %10, %struct.command* %11, i32 %12)
  store %struct.command* %call, %struct.command** %t, align 4
  %13 = load %struct.command*, %struct.command** %t, align 4
  store %struct.command* %13, %struct.command** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %14 = load %struct.command*, %struct.command** %t, align 4
  %flags6 = getelementptr inbounds %struct.command, %struct.command* %14, i32 0, i32 1
  %15 = load i32, i32* %flags6, align 4
  %and7 = and i32 %15, 1
  %cmp8 = icmp eq i32 %and7, 0
  br i1 %cmp8, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %16 = load %struct.command*, %struct.command** %t, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %16, i32 0, i32 0
  %17 = load i32, i32* %type, align 4
  %cmp9 = icmp eq i32 %17, 6
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %18 = load %struct.command*, %struct.command** %t, align 4
  %value10 = getelementptr inbounds %struct.command, %struct.command* %18, i32 0, i32 4
  %Connection11 = bitcast %union.anon* %value10 to %struct.connection**
  %19 = load %struct.connection*, %struct.connection** %Connection11, align 4
  %connector12 = getelementptr inbounds %struct.connection, %struct.connection* %19, i32 0, i32 3
  %20 = load i32, i32* %connector12, align 4
  %cmp13 = icmp eq i32 %20, 59
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %21 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp13, %land.rhs ]
  br i1 %21, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %22 = load %struct.command*, %struct.command** %t, align 4
  store %struct.command* %22, %struct.command** %t1, align 4
  %23 = load %struct.command*, %struct.command** %t, align 4
  %value14 = getelementptr inbounds %struct.command, %struct.command* %23, i32 0, i32 4
  %Connection15 = bitcast %union.anon* %value14 to %struct.connection**
  %24 = load %struct.connection*, %struct.connection** %Connection15, align 4
  %second16 = getelementptr inbounds %struct.connection, %struct.connection* %24, i32 0, i32 2
  %25 = load %struct.command*, %struct.command** %second16, align 4
  store %struct.command* %25, %struct.command** %t, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %26 = load %struct.command*, %struct.command** %t, align 4
  %27 = load %struct.command*, %struct.command** %command2.addr, align 4
  %28 = load i32, i32* %connector.addr, align 4
  %call17 = call %struct.command* @command_connect(%struct.command* %26, %struct.command* %27, i32 %28)
  store %struct.command* %call17, %struct.command** %t2, align 4
  %29 = load %struct.command*, %struct.command** %t2, align 4
  %30 = load %struct.command*, %struct.command** %t1, align 4
  %value18 = getelementptr inbounds %struct.command, %struct.command* %30, i32 0, i32 4
  %Connection19 = bitcast %union.anon* %value18 to %struct.connection**
  %31 = load %struct.connection*, %struct.connection** %Connection19, align 4
  %second20 = getelementptr inbounds %struct.connection, %struct.connection* %31, i32 0, i32 2
  store %struct.command* %29, %struct.command** %second20, align 4
  %32 = load %struct.command*, %struct.command** %command.addr, align 4
  store %struct.command* %32, %struct.command** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %33 = load %struct.command*, %struct.command** %retval, align 4
  ret %struct.command* %33
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
