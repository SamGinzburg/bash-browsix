; ModuleID = 'print_cmd.c'
source_filename = "print_cmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.arith_for_com = type { i32, i32, %struct.word_list*, %struct.word_list*, %struct.word_list*, %struct.command* }
%struct.select_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.case_com = type { i32, i32, %struct.word_desc*, %struct.pattern_list* }
%struct.pattern_list = type { %struct.pattern_list*, %struct.word_list*, %struct.command*, i32 }
%struct.while_com = type { i32, %struct.command*, %struct.command* }
%struct.if_com = type { i32, %struct.command*, %struct.command*, %struct.command* }
%struct.arith_com = type { i32, i32, %struct.word_list* }
%struct.cond_com = type { i32, i32, i32, %struct.word_desc*, %struct.cond_com*, %struct.cond_com* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.group_com = type { i32, %struct.command* }
%struct.subshell_com = type { i32, %struct.command* }
%struct.coproc_com = type { i32, i8*, %struct.command* }

@the_printed_command = global i8* null, align 4
@the_printed_command_size = global i32 0, align 4
@command_string_index = global i32 0, align 4
@xtrace_fd = global i32 -1, align 4
@xtrace_fp = global %struct._IO_FILE* null, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@was_heredoc = internal global i32 0, align 4
@deferred_heredocs = internal global %struct.redirect* null, align 4
@.str.1 = private unnamed_addr constant [40 x i8] c"xtrace_set: %d: invalid file descriptor\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"xtrace_set: NULL file pointer\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"xtrace fd (%d) != fileno xtrace fp (%d)\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.4 = private unnamed_addr constant [4 x i8] c"PS4\00", align 1
@indirection_string = internal global i8* null, align 4
@indirection_stringsiz = internal global i32 0, align 4
@.str.5 = private unnamed_addr constant [12 x i8] c"print_cmd.c\00", align 1
@indirection_level = external global i32, align 4
@.str.6 = private unnamed_addr constant [9 x i8] c"%s=(%s)\0A\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"%s=%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"''%s\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"for %s in \00", align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"select %s in \00", align 1
@.str.15 = private unnamed_addr constant [12 x i8] c"case %s in \00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"case %s in\0A\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"((\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"))\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"[[ \00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c" ]]\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"! \00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"''\00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c" %s \00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c" ]]\0A\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"(( \00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c" ))\0A\00", align 1
@indentation = internal global i32 0, align 4
@indentation_amount = internal global i32 4, align 4
@.str.28 = private unnamed_addr constant [10 x i8] c"function \00", align 1
@.str.29 = private unnamed_addr constant [4 x i8] c"() \00", align 1
@inside_function_def = internal global i32 0, align 4
@.str.30 = private unnamed_addr constant [4 x i8] c"{ \0A\00", align 1
@.str.31 = private unnamed_addr constant [3 x i8] c"{ \00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"} \00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"}\00", align 1
@skip_this_indent = internal global i32 0, align 4
@.str.34 = private unnamed_addr constant [6 x i8] c"time \00", align 1
@.str.35 = private unnamed_addr constant [4 x i8] c"-p \00", align 1
@printing_connection = internal global i32 0, align 4
@.str.36 = private unnamed_addr constant [5 x i8] c" && \00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c" || \00", align 1
@.str.38 = private unnamed_addr constant [2 x i8] c";\00", align 1
@.str.39 = private unnamed_addr constant [34 x i8] c"print_command: bad connector `%d'\00", align 1
@.str.40 = private unnamed_addr constant [3 x i8] c"( \00", align 1
@.str.41 = private unnamed_addr constant [3 x i8] c" )\00", align 1
@.str.42 = private unnamed_addr constant [11 x i8] c"coproc %s \00", align 1
@.str.43 = private unnamed_addr constant [14 x i8] c"print_command\00", align 1
@indentation_size = internal global i32 0, align 4
@indentation_string = internal global i8* null, align 4
@.str.44 = private unnamed_addr constant [4 x i8] c"do\0A\00", align 1
@.str.45 = private unnamed_addr constant [5 x i8] c"done\00", align 1
@.str.46 = private unnamed_addr constant [7 x i8] c"for ((\00", align 1
@.str.47 = private unnamed_addr constant [3 x i8] c"; \00", align 1
@.str.48 = private unnamed_addr constant [5 x i8] c"esac\00", align 1
@.str.49 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str.50 = private unnamed_addr constant [3 x i8] c")\0A\00", align 1
@.str.51 = private unnamed_addr constant [3 x i8] c";&\00", align 1
@.str.52 = private unnamed_addr constant [4 x i8] c";;&\00", align 1
@.str.53 = private unnamed_addr constant [3 x i8] c";;\00", align 1
@.str.54 = private unnamed_addr constant [6 x i8] c"while\00", align 1
@.str.55 = private unnamed_addr constant [5 x i8] c" do\0A\00", align 1
@.str.56 = private unnamed_addr constant [6 x i8] c"until\00", align 1
@.str.57 = private unnamed_addr constant [4 x i8] c"if \00", align 1
@.str.58 = private unnamed_addr constant [7 x i8] c" then\0A\00", align 1
@.str.59 = private unnamed_addr constant [6 x i8] c"else\0A\00", align 1
@.str.60 = private unnamed_addr constant [3 x i8] c"fi\00", align 1
@.str.61 = private unnamed_addr constant [5 x i8] c"{%s}\00", align 1
@.str.62 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.63 = private unnamed_addr constant [7 x i8] c"<<%s%s\00", align 1
@.str.64 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@posixly_correct = external global i32, align 4
@.str.65 = private unnamed_addr constant [17 x i8] c"function %s () \0A\00", align 1
@.str.66 = private unnamed_addr constant [8 x i8] c"%s () \0A\00", align 1
@group_command_nesting = internal global i32 0, align 4
@.str.67 = private unnamed_addr constant [5 x i8] c"< %s\00", align 1
@.str.68 = private unnamed_addr constant [5 x i8] c"> %s\00", align 1
@.str.69 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@.str.70 = private unnamed_addr constant [6 x i8] c">| %s\00", align 1
@.str.71 = private unnamed_addr constant [6 x i8] c">> %s\00", align 1
@.str.72 = private unnamed_addr constant [6 x i8] c"<> %s\00", align 1
@.str.73 = private unnamed_addr constant [7 x i8] c"<<< %s\00", align 1
@.str.74 = private unnamed_addr constant [9 x i8] c"{%s}<&%d\00", align 1
@.str.75 = private unnamed_addr constant [7 x i8] c"%d<&%d\00", align 1
@.str.76 = private unnamed_addr constant [9 x i8] c"{%s}>&%d\00", align 1
@.str.77 = private unnamed_addr constant [7 x i8] c"%d>&%d\00", align 1
@.str.78 = private unnamed_addr constant [9 x i8] c"{%s}<&%s\00", align 1
@.str.79 = private unnamed_addr constant [7 x i8] c"%d<&%s\00", align 1
@.str.80 = private unnamed_addr constant [9 x i8] c"{%s}>&%s\00", align 1
@.str.81 = private unnamed_addr constant [7 x i8] c"%d>&%s\00", align 1
@.str.82 = private unnamed_addr constant [10 x i8] c"{%s}<&%d-\00", align 1
@.str.83 = private unnamed_addr constant [8 x i8] c"%d<&%d-\00", align 1
@.str.84 = private unnamed_addr constant [10 x i8] c"{%s}>&%d-\00", align 1
@.str.85 = private unnamed_addr constant [8 x i8] c"%d>&%d-\00", align 1
@.str.86 = private unnamed_addr constant [10 x i8] c"{%s}<&%s-\00", align 1
@.str.87 = private unnamed_addr constant [8 x i8] c"%d<&%s-\00", align 1
@.str.88 = private unnamed_addr constant [10 x i8] c"{%s}>&%s-\00", align 1
@.str.89 = private unnamed_addr constant [8 x i8] c"%d>&%s-\00", align 1
@.str.90 = private unnamed_addr constant [8 x i8] c"{%s}>&-\00", align 1
@.str.91 = private unnamed_addr constant [6 x i8] c"%d>&-\00", align 1
@.str.92 = private unnamed_addr constant [6 x i8] c"&> %s\00", align 1
@.str.93 = private unnamed_addr constant [7 x i8] c"&>> %s\00", align 1
@.str.94 = private unnamed_addr constant [3 x i8] c"%u\00", align 1
@.str.95 = private unnamed_addr constant [40 x i8] c"cprintf: `%c': invalid format character\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define void @print_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 0, i32* @command_string_index, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %call = call i8* @make_command_string(%struct.command* %0)
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define i8* @make_command_string(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 0, i32* @was_heredoc, align 4
  store i32 0, i32* @command_string_index, align 4
  store %struct.redirect* null, %struct.redirect** @deferred_heredocs, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  call void @make_command_string_internal(%struct.command* %0)
  %1 = load i8*, i8** @the_printed_command, align 4
  ret i8* %1
}

; Function Attrs: noinline nounwind
define internal void @make_command_string_internal(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %s = alloca [3 x i8], align 1
  %c = alloca i8, align 1
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end130

if.else:                                          ; preds = %entry
  %1 = load i32, i32* @skip_this_indent, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.else2

if.then1:                                         ; preds = %if.else
  %2 = load i32, i32* @skip_this_indent, align 4
  %dec = add nsw i32 %2, -1
  store i32 %dec, i32* @skip_this_indent, align 4
  br label %if.end

if.else2:                                         ; preds = %if.else
  %3 = load i32, i32* @indentation, align 4
  call void @indent(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.else2, %if.then1
  %4 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %4, i32 0, i32 1
  %5 = load i32, i32* %flags, align 4
  %and = and i32 %5, 128
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.34, i32 0, i32 0))
  %6 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags5 = getelementptr inbounds %struct.command, %struct.command* %6, i32 0, i32 1
  %7 = load i32, i32* %flags5, align 4
  %and6 = and i32 %7, 256
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.35, i32 0, i32 0))
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.then4
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end
  %8 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags11 = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 1
  %9 = load i32, i32* %flags11, align 4
  %and12 = and i32 %9, 4
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end10
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end10
  %10 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %10, i32 0, i32 0
  %11 = load i32, i32* %type, align 4
  switch i32 %11, label %sw.default123 [
    i32 0, label %sw.bb
    i32 12, label %sw.bb16
    i32 5, label %sw.bb18
    i32 1, label %sw.bb20
    i32 2, label %sw.bb22
    i32 8, label %sw.bb24
    i32 3, label %sw.bb27
    i32 10, label %sw.bb29
    i32 11, label %sw.bb31
    i32 4, label %sw.bb33
    i32 6, label %sw.bb35
    i32 7, label %sw.bb104
    i32 9, label %sw.bb106
    i32 13, label %sw.bb108
    i32 14, label %sw.bb117
  ]

sw.bb:                                            ; preds = %if.end15
  %12 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 4
  %For = bitcast %union.anon* %value to %struct.for_com**
  %13 = load %struct.for_com*, %struct.for_com** %For, align 4
  call void @print_for_command(%struct.for_com* %13)
  br label %sw.epilog125

sw.bb16:                                          ; preds = %if.end15
  %14 = load %struct.command*, %struct.command** %command.addr, align 4
  %value17 = getelementptr inbounds %struct.command, %struct.command* %14, i32 0, i32 4
  %ArithFor = bitcast %union.anon* %value17 to %struct.arith_for_com**
  %15 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor, align 4
  call void @print_arith_for_command(%struct.arith_for_com* %15)
  br label %sw.epilog125

sw.bb18:                                          ; preds = %if.end15
  %16 = load %struct.command*, %struct.command** %command.addr, align 4
  %value19 = getelementptr inbounds %struct.command, %struct.command* %16, i32 0, i32 4
  %Select = bitcast %union.anon* %value19 to %struct.select_com**
  %17 = load %struct.select_com*, %struct.select_com** %Select, align 4
  call void @print_select_command(%struct.select_com* %17)
  br label %sw.epilog125

sw.bb20:                                          ; preds = %if.end15
  %18 = load %struct.command*, %struct.command** %command.addr, align 4
  %value21 = getelementptr inbounds %struct.command, %struct.command* %18, i32 0, i32 4
  %Case = bitcast %union.anon* %value21 to %struct.case_com**
  %19 = load %struct.case_com*, %struct.case_com** %Case, align 4
  call void @print_case_command(%struct.case_com* %19)
  br label %sw.epilog125

sw.bb22:                                          ; preds = %if.end15
  %20 = load %struct.command*, %struct.command** %command.addr, align 4
  %value23 = getelementptr inbounds %struct.command, %struct.command* %20, i32 0, i32 4
  %While = bitcast %union.anon* %value23 to %struct.while_com**
  %21 = load %struct.while_com*, %struct.while_com** %While, align 4
  call void @print_while_command(%struct.while_com* %21)
  br label %sw.epilog125

sw.bb24:                                          ; preds = %if.end15
  %22 = load %struct.command*, %struct.command** %command.addr, align 4
  %value25 = getelementptr inbounds %struct.command, %struct.command* %22, i32 0, i32 4
  %While26 = bitcast %union.anon* %value25 to %struct.while_com**
  %23 = load %struct.while_com*, %struct.while_com** %While26, align 4
  call void @print_until_command(%struct.while_com* %23)
  br label %sw.epilog125

sw.bb27:                                          ; preds = %if.end15
  %24 = load %struct.command*, %struct.command** %command.addr, align 4
  %value28 = getelementptr inbounds %struct.command, %struct.command* %24, i32 0, i32 4
  %If = bitcast %union.anon* %value28 to %struct.if_com**
  %25 = load %struct.if_com*, %struct.if_com** %If, align 4
  call void @print_if_command(%struct.if_com* %25)
  br label %sw.epilog125

sw.bb29:                                          ; preds = %if.end15
  %26 = load %struct.command*, %struct.command** %command.addr, align 4
  %value30 = getelementptr inbounds %struct.command, %struct.command* %26, i32 0, i32 4
  %Arith = bitcast %union.anon* %value30 to %struct.arith_com**
  %27 = load %struct.arith_com*, %struct.arith_com** %Arith, align 4
  %exp = getelementptr inbounds %struct.arith_com, %struct.arith_com* %27, i32 0, i32 2
  %28 = load %struct.word_list*, %struct.word_list** %exp, align 4
  call void @print_arith_command(%struct.word_list* %28)
  br label %sw.epilog125

sw.bb31:                                          ; preds = %if.end15
  %29 = load %struct.command*, %struct.command** %command.addr, align 4
  %value32 = getelementptr inbounds %struct.command, %struct.command* %29, i32 0, i32 4
  %Cond = bitcast %union.anon* %value32 to %struct.cond_com**
  %30 = load %struct.cond_com*, %struct.cond_com** %Cond, align 4
  call void @print_cond_command(%struct.cond_com* %30)
  br label %sw.epilog125

sw.bb33:                                          ; preds = %if.end15
  %31 = load %struct.command*, %struct.command** %command.addr, align 4
  %value34 = getelementptr inbounds %struct.command, %struct.command* %31, i32 0, i32 4
  %Simple = bitcast %union.anon* %value34 to %struct.simple_com**
  %32 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  call void @print_simple_command(%struct.simple_com* %32)
  br label %sw.epilog125

sw.bb35:                                          ; preds = %if.end15
  %33 = load i32, i32* @skip_this_indent, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* @skip_this_indent, align 4
  %34 = load i32, i32* @printing_connection, align 4
  %inc36 = add nsw i32 %34, 1
  store i32 %inc36, i32* @printing_connection, align 4
  %35 = load %struct.command*, %struct.command** %command.addr, align 4
  %value37 = getelementptr inbounds %struct.command, %struct.command* %35, i32 0, i32 4
  %Connection = bitcast %union.anon* %value37 to %struct.connection**
  %36 = load %struct.connection*, %struct.connection** %Connection, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %36, i32 0, i32 1
  %37 = load %struct.command*, %struct.command** %first, align 4
  call void @make_command_string_internal(%struct.command* %37)
  %38 = load %struct.command*, %struct.command** %command.addr, align 4
  %value38 = getelementptr inbounds %struct.command, %struct.command* %38, i32 0, i32 4
  %Connection39 = bitcast %union.anon* %value38 to %struct.connection**
  %39 = load %struct.connection*, %struct.connection** %Connection39, align 4
  %connector = getelementptr inbounds %struct.connection, %struct.connection* %39, i32 0, i32 3
  %40 = load i32, i32* %connector, align 4
  switch i32 %40, label %sw.default [
    i32 38, label %sw.bb40
    i32 124, label %sw.bb40
    i32 287, label %sw.bb55
    i32 288, label %sw.bb63
    i32 59, label %sw.bb71
  ]

sw.bb40:                                          ; preds = %sw.bb35, %sw.bb35
  %41 = load %struct.command*, %struct.command** %command.addr, align 4
  %value41 = getelementptr inbounds %struct.command, %struct.command* %41, i32 0, i32 4
  %Connection42 = bitcast %union.anon* %value41 to %struct.connection**
  %42 = load %struct.connection*, %struct.connection** %Connection42, align 4
  %connector43 = getelementptr inbounds %struct.connection, %struct.connection* %42, i32 0, i32 3
  %43 = load i32, i32* %connector43, align 4
  %conv = trunc i32 %43 to i8
  store i8 %conv, i8* %c, align 1
  %arrayidx = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  store i8 32, i8* %arrayidx, align 1
  %44 = load i8, i8* %c, align 1
  %arrayidx44 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 1
  store i8 %44, i8* %arrayidx44, align 1
  %arrayidx45 = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 2
  store i8 0, i8* %arrayidx45, align 1
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %s, i32 0, i32 0
  call void @print_deferred_heredocs(i8* %arraydecay)
  %45 = load i8, i8* %c, align 1
  %conv46 = sext i8 %45 to i32
  %cmp47 = icmp ne i32 %conv46, 38
  br i1 %cmp47, label %if.then52, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %sw.bb40
  %46 = load %struct.command*, %struct.command** %command.addr, align 4
  %value49 = getelementptr inbounds %struct.command, %struct.command* %46, i32 0, i32 4
  %Connection50 = bitcast %union.anon* %value49 to %struct.connection**
  %47 = load %struct.connection*, %struct.connection** %Connection50, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %47, i32 0, i32 2
  %48 = load %struct.command*, %struct.command** %second, align 4
  %tobool51 = icmp ne %struct.command* %48, null
  br i1 %tobool51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %lor.lhs.false, %sw.bb40
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %49 = load i32, i32* @skip_this_indent, align 4
  %inc53 = add nsw i32 %49, 1
  store i32 %inc53, i32* @skip_this_indent, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %lor.lhs.false
  br label %sw.epilog

sw.bb55:                                          ; preds = %sw.bb35
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.36, i32 0, i32 0))
  %50 = load %struct.command*, %struct.command** %command.addr, align 4
  %value56 = getelementptr inbounds %struct.command, %struct.command* %50, i32 0, i32 4
  %Connection57 = bitcast %union.anon* %value56 to %struct.connection**
  %51 = load %struct.connection*, %struct.connection** %Connection57, align 4
  %second58 = getelementptr inbounds %struct.connection, %struct.connection* %51, i32 0, i32 2
  %52 = load %struct.command*, %struct.command** %second58, align 4
  %tobool59 = icmp ne %struct.command* %52, null
  br i1 %tobool59, label %if.then60, label %if.end62

if.then60:                                        ; preds = %sw.bb55
  %53 = load i32, i32* @skip_this_indent, align 4
  %inc61 = add nsw i32 %53, 1
  store i32 %inc61, i32* @skip_this_indent, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then60, %sw.bb55
  br label %sw.epilog

sw.bb63:                                          ; preds = %sw.bb35
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0))
  %54 = load %struct.command*, %struct.command** %command.addr, align 4
  %value64 = getelementptr inbounds %struct.command, %struct.command* %54, i32 0, i32 4
  %Connection65 = bitcast %union.anon* %value64 to %struct.connection**
  %55 = load %struct.connection*, %struct.connection** %Connection65, align 4
  %second66 = getelementptr inbounds %struct.connection, %struct.connection* %55, i32 0, i32 2
  %56 = load %struct.command*, %struct.command** %second66, align 4
  %tobool67 = icmp ne %struct.command* %56, null
  br i1 %tobool67, label %if.then68, label %if.end70

if.then68:                                        ; preds = %sw.bb63
  %57 = load i32, i32* @skip_this_indent, align 4
  %inc69 = add nsw i32 %57, 1
  store i32 %inc69, i32* @skip_this_indent, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %sw.bb63
  br label %sw.epilog

sw.bb71:                                          ; preds = %sw.bb35
  %58 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %cmp72 = icmp eq %struct.redirect* %58, null
  br i1 %cmp72, label %if.then74, label %if.else80

if.then74:                                        ; preds = %sw.bb71
  %59 = load i32, i32* @was_heredoc, align 4
  %cmp75 = icmp eq i32 %59, 0
  br i1 %cmp75, label %if.then77, label %if.else78

if.then77:                                        ; preds = %if.then74
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0))
  br label %if.end79

if.else78:                                        ; preds = %if.then74
  store i32 0, i32* @was_heredoc, align 4
  br label %if.end79

if.end79:                                         ; preds = %if.else78, %if.then77
  br label %if.end82

if.else80:                                        ; preds = %sw.bb71
  %60 = load i32, i32* @inside_function_def, align 4
  %tobool81 = icmp ne i32 %60, 0
  %cond = select i1 %tobool81, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0)
  call void @print_deferred_heredocs(i8* %cond)
  br label %if.end82

if.end82:                                         ; preds = %if.else80, %if.end79
  %61 = load i32, i32* @inside_function_def, align 4
  %tobool83 = icmp ne i32 %61, 0
  br i1 %tobool83, label %if.then84, label %if.else85

if.then84:                                        ; preds = %if.end82
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  br label %if.end93

if.else85:                                        ; preds = %if.end82
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %62 = load %struct.command*, %struct.command** %command.addr, align 4
  %value86 = getelementptr inbounds %struct.command, %struct.command* %62, i32 0, i32 4
  %Connection87 = bitcast %union.anon* %value86 to %struct.connection**
  %63 = load %struct.connection*, %struct.connection** %Connection87, align 4
  %second88 = getelementptr inbounds %struct.connection, %struct.connection* %63, i32 0, i32 2
  %64 = load %struct.command*, %struct.command** %second88, align 4
  %tobool89 = icmp ne %struct.command* %64, null
  br i1 %tobool89, label %if.then90, label %if.end92

if.then90:                                        ; preds = %if.else85
  %65 = load i32, i32* @skip_this_indent, align 4
  %inc91 = add nsw i32 %65, 1
  store i32 %inc91, i32* @skip_this_indent, align 4
  br label %if.end92

if.end92:                                         ; preds = %if.then90, %if.else85
  br label %if.end93

if.end93:                                         ; preds = %if.end92, %if.then84
  br label %sw.epilog

sw.default:                                       ; preds = %sw.bb35
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.39, i32 0, i32 0))
  %66 = load %struct.command*, %struct.command** %command.addr, align 4
  %value94 = getelementptr inbounds %struct.command, %struct.command* %66, i32 0, i32 4
  %Connection95 = bitcast %union.anon* %value94 to %struct.connection**
  %67 = load %struct.connection*, %struct.connection** %Connection95, align 4
  %connector96 = getelementptr inbounds %struct.connection, %struct.connection* %67, i32 0, i32 3
  %68 = load i32, i32* %connector96, align 4
  call void (i8*, ...) @cprintf(i8* %call, i32 %68)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end93, %if.end70, %if.end62, %if.end54
  %69 = load %struct.command*, %struct.command** %command.addr, align 4
  %value97 = getelementptr inbounds %struct.command, %struct.command* %69, i32 0, i32 4
  %Connection98 = bitcast %union.anon* %value97 to %struct.connection**
  %70 = load %struct.connection*, %struct.connection** %Connection98, align 4
  %second99 = getelementptr inbounds %struct.connection, %struct.connection* %70, i32 0, i32 2
  %71 = load %struct.command*, %struct.command** %second99, align 4
  call void @make_command_string_internal(%struct.command* %71)
  br label %do.body

do.body:                                          ; preds = %sw.epilog
  %72 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool100 = icmp ne %struct.redirect* %72, null
  br i1 %tobool100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end102

if.end102:                                        ; preds = %if.then101, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end102
  %73 = load i32, i32* @printing_connection, align 4
  %dec103 = add nsw i32 %73, -1
  store i32 %dec103, i32* @printing_connection, align 4
  br label %sw.epilog125

sw.bb104:                                         ; preds = %if.end15
  %74 = load %struct.command*, %struct.command** %command.addr, align 4
  %value105 = getelementptr inbounds %struct.command, %struct.command* %74, i32 0, i32 4
  %Function_def = bitcast %union.anon* %value105 to %struct.function_def**
  %75 = load %struct.function_def*, %struct.function_def** %Function_def, align 4
  call void @print_function_def(%struct.function_def* %75)
  br label %sw.epilog125

sw.bb106:                                         ; preds = %if.end15
  %76 = load %struct.command*, %struct.command** %command.addr, align 4
  %value107 = getelementptr inbounds %struct.command, %struct.command* %76, i32 0, i32 4
  %Group = bitcast %union.anon* %value107 to %struct.group_com**
  %77 = load %struct.group_com*, %struct.group_com** %Group, align 4
  call void @print_group_command(%struct.group_com* %77)
  br label %sw.epilog125

sw.bb108:                                         ; preds = %if.end15
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0))
  %78 = load i32, i32* @skip_this_indent, align 4
  %inc109 = add nsw i32 %78, 1
  store i32 %inc109, i32* @skip_this_indent, align 4
  %79 = load %struct.command*, %struct.command** %command.addr, align 4
  %value110 = getelementptr inbounds %struct.command, %struct.command* %79, i32 0, i32 4
  %Subshell = bitcast %union.anon* %value110 to %struct.subshell_com**
  %80 = load %struct.subshell_com*, %struct.subshell_com** %Subshell, align 4
  %command111 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %80, i32 0, i32 1
  %81 = load %struct.command*, %struct.command** %command111, align 4
  call void @make_command_string_internal(%struct.command* %81)
  br label %do.body112

do.body112:                                       ; preds = %sw.bb108
  %82 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool113 = icmp ne %struct.redirect* %82, null
  br i1 %tobool113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %do.body112
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %do.body112
  br label %do.end116

do.end116:                                        ; preds = %if.end115
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i32 0, i32 0))
  br label %sw.epilog125

sw.bb117:                                         ; preds = %if.end15
  %83 = load %struct.command*, %struct.command** %command.addr, align 4
  %value118 = getelementptr inbounds %struct.command, %struct.command* %83, i32 0, i32 4
  %Coproc = bitcast %union.anon* %value118 to %struct.coproc_com**
  %84 = load %struct.coproc_com*, %struct.coproc_com** %Coproc, align 4
  %name = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %84, i32 0, i32 1
  %85 = load i8*, i8** %name, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.42, i32 0, i32 0), i8* %85)
  %86 = load i32, i32* @skip_this_indent, align 4
  %inc119 = add nsw i32 %86, 1
  store i32 %inc119, i32* @skip_this_indent, align 4
  %87 = load %struct.command*, %struct.command** %command.addr, align 4
  %value120 = getelementptr inbounds %struct.command, %struct.command* %87, i32 0, i32 4
  %Coproc121 = bitcast %union.anon* %value120 to %struct.coproc_com**
  %88 = load %struct.coproc_com*, %struct.coproc_com** %Coproc121, align 4
  %command122 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %88, i32 0, i32 2
  %89 = load %struct.command*, %struct.command** %command122, align 4
  call void @make_command_string_internal(%struct.command* %89)
  br label %sw.epilog125

sw.default123:                                    ; preds = %if.end15
  %90 = load %struct.command*, %struct.command** %command.addr, align 4
  %type124 = getelementptr inbounds %struct.command, %struct.command* %90, i32 0, i32 0
  %91 = load i32, i32* %type124, align 4
  call void @command_error(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.43, i32 0, i32 0), i32 1, i32 %91, i32 0)
  br label %sw.epilog125

sw.epilog125:                                     ; preds = %sw.default123, %sw.bb117, %do.end116, %sw.bb106, %sw.bb104, %do.end, %sw.bb33, %sw.bb31, %sw.bb29, %sw.bb27, %sw.bb24, %sw.bb22, %sw.bb20, %sw.bb18, %sw.bb16, %sw.bb
  %92 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %92, i32 0, i32 3
  %93 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool126 = icmp ne %struct.redirect* %93, null
  br i1 %tobool126, label %if.then127, label %if.end129

if.then127:                                       ; preds = %sw.epilog125
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %94 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects128 = getelementptr inbounds %struct.command, %struct.command* %94, i32 0, i32 3
  %95 = load %struct.redirect*, %struct.redirect** %redirects128, align 4
  call void @print_redirection_list(%struct.redirect* %95)
  br label %if.end129

if.end129:                                        ; preds = %if.then127, %sw.epilog125
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @print_word_list(%struct.word_list* %list, i8* %separator) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %separator.addr = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i8* %separator, i8** %separator.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %1 = load i8*, i8** %separator.addr, align 4
  call void @_print_word_list(%struct.word_list* %0, i8* %1, void (i8*, ...)* @xprintf)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @_print_word_list(%struct.word_list* %list, i8* %separator, void (i8*, ...)* %pfunc) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %separator.addr = alloca i8*, align 4
  %pfunc.addr = alloca void (i8*, ...)*, align 4
  %w = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i8* %separator, i8** %separator.addr, align 4
  store void (i8*, ...)* %pfunc, void (i8*, ...)** %pfunc.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %0, %struct.word_list** %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.word_list*, %struct.word_list** %w, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load void (i8*, ...)*, void (i8*, ...)** %pfunc.addr, align 4
  %3 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word1, align 4
  %6 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 0
  %7 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool2 = icmp ne %struct.word_list* %7, null
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %8 = load i8*, i8** %separator.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %8, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0), %cond.false ]
  call void (i8*, ...) %2(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %5, i8* %cond)
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %9 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next3 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 0
  %10 = load %struct.word_list*, %struct.word_list** %next3, align 4
  store %struct.word_list* %10, %struct.word_list** %w, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define internal void @xprintf(i8* %format, ...) #0 {
entry:
  %format.addr = alloca i8*, align 4
  %args = alloca [4 x i32], align 4
  store i8* %format, i8** %format.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %1 = load i8*, i8** %format.addr, align 4
  %arraydecay2 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %call = call i32 @vfprintf(%struct._IO_FILE* %0, i8* %1, i32* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay34 = bitcast i32* %arraydecay3 to i8*
  call void @llvm.va_end(i8* %arraydecay34)
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_set(i32 %fd, %struct._IO_FILE* %fp) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %fp.addr = alloca %struct._IO_FILE*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %fd.addr, align 4
  %call = call i32 @sh_validfd(i32 %1)
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.1, i32 0, i32 0))
  %2 = load i32, i32* %fd.addr, align 4
  call void (i8*, ...) @internal_error(i8* %call2, i32 %2)
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %cmp3 = icmp eq %struct._IO_FILE* %3, null
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i32 0, i32 0))
  call void (i8*, ...) @internal_error(i8* %call5)
  br label %return

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %fd.addr, align 4
  %cmp7 = icmp sge i32 %4, 0
  br i1 %cmp7, label %land.lhs.true8, label %if.end14

land.lhs.true8:                                   ; preds = %if.end6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call9 = call i32 @fileno(%struct._IO_FILE* %5)
  %6 = load i32, i32* %fd.addr, align 4
  %cmp10 = icmp ne i32 %call9, %6
  br i1 %cmp10, label %if.then11, label %if.end14

if.then11:                                        ; preds = %land.lhs.true8
  %call12 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i32 0, i32 0))
  %7 = load i32, i32* %fd.addr, align 4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %call13 = call i32 @fileno(%struct._IO_FILE* %8)
  call void (i8*, ...) @internal_warning(i8* %call12, i32 %7, i32 %call13)
  br label %if.end14

if.end14:                                         ; preds = %if.then11, %land.lhs.true8, %if.end6
  %9 = load i32, i32* %fd.addr, align 4
  store i32 %9, i32* @xtrace_fd, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  store %struct._IO_FILE* %10, %struct._IO_FILE** @xtrace_fp, align 4
  br label %return

return:                                           ; preds = %if.end14, %if.then4, %if.then
  ret void
}

declare i32 @sh_validfd(i32) #1

declare void @internal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @fileno(%struct._IO_FILE*) #1

declare void @internal_warning(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @xtrace_init() #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  call void @xtrace_set(i32 -1, %struct._IO_FILE* %0)
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_reset() #0 {
entry:
  %0 = load i32, i32* @xtrace_fd, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i32 @fflush(%struct._IO_FILE* %2)
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call1 = call i32 @fclose(%struct._IO_FILE* %3)
  br label %if.end5

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* @xtrace_fd, align 4
  %cmp2 = icmp sge i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %5 = load i32, i32* @xtrace_fd, align 4
  %call4 = call i32 @close(i32 %5)
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  store i32 -1, i32* @xtrace_fd, align 4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  store %struct._IO_FILE* %6, %struct._IO_FILE** @xtrace_fp, align 4
  ret void
}

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @close(i32) #1

; Function Attrs: noinline nounwind
define void @xtrace_fdchk(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i32, i32* @xtrace_fd, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @xtrace_reset()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define i8* @indirection_level_string() #0 {
entry:
  %retval = alloca i8*, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %ps4 = alloca i8*, align 4
  %ps4_firstc = alloca [17 x i8], align 1
  %ps4_firstc_len = alloca i32, align 4
  %ps4_len = alloca i32, align 4
  %ineed = alloca i32, align 4
  %old = alloca i32, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call, i8** %ps4, align 4
  %0 = load i8*, i8** @indirection_string, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 100, i32* @indirection_stringsiz, align 4
  %call1 = call i8* @sh_xmalloc(i32 100, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 431)
  store i8* %call1, i8** @indirection_string, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8*, i8** @indirection_string, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  store i8 0, i8* %arrayidx, align 1
  %2 = load i8*, i8** %ps4, align 4
  %cmp2 = icmp eq i8* %2, null
  br i1 %cmp2, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %3 = load i8*, i8** %ps4, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %5 = load i8*, i8** @indirection_string, align 4
  store i8* %5, i8** %retval, align 4
  br label %return

if.end6:                                          ; preds = %lor.lhs.false
  %call7 = call i32 @change_flag(i32 120, i32 43)
  store i32 %call7, i32* %old, align 4
  %6 = load i8*, i8** %ps4, align 4
  %call8 = call i8* @decode_prompt_string(i8* %6)
  store i8* %call8, i8** %ps4, align 4
  %7 = load i32, i32* %old, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %call10 = call i32 @change_flag(i32 120, i32 45)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  %8 = load i8*, i8** %ps4, align 4
  %cmp12 = icmp eq i8* %8, null
  br i1 %cmp12, label %if.then18, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %if.end11
  %9 = load i8*, i8** %ps4, align 4
  %10 = load i8, i8* %9, align 1
  %conv15 = sext i8 %10 to i32
  %cmp16 = icmp eq i32 %conv15, 0
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false14, %if.end11
  %11 = load i8*, i8** @indirection_string, align 4
  store i8* %11, i8** %retval, align 4
  br label %return

if.end19:                                         ; preds = %lor.lhs.false14
  %12 = load i8*, i8** %ps4, align 4
  %call20 = call i32 @__ctype_get_mb_cur_max()
  %call21 = call i32 @strnlen(i8* %12, i32 %call20)
  store i32 %call21, i32* %ps4_len, align 4
  %call22 = call i32 @__ctype_get_mb_cur_max()
  %cmp23 = icmp ugt i32 %call22, 1
  br i1 %cmp23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end19
  %13 = load i8*, i8** %ps4, align 4
  %14 = load i32, i32* %ps4_len, align 4
  %call25 = call i32 @mblen(i8* %13, i32 %14)
  br label %cond.end

cond.false:                                       ; preds = %if.end19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call25, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %ps4_firstc_len, align 4
  %15 = load i32, i32* %ps4_firstc_len, align 4
  %cmp26 = icmp eq i32 %15, 1
  br i1 %cmp26, label %if.then34, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %cond.end
  %16 = load i32, i32* %ps4_firstc_len, align 4
  %cmp29 = icmp eq i32 %16, 0
  br i1 %cmp29, label %if.then34, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.lhs.false28
  %17 = load i32, i32* %ps4_firstc_len, align 4
  %cmp32 = icmp slt i32 %17, 0
  br i1 %cmp32, label %if.then34, label %if.else

if.then34:                                        ; preds = %lor.lhs.false31, %lor.lhs.false28, %cond.end
  %18 = load i8*, i8** %ps4, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %18, i32 0
  %19 = load i8, i8* %arrayidx35, align 1
  %arrayidx36 = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 0
  store i8 %19, i8* %arrayidx36, align 1
  store i32 1, i32* %ps4_firstc_len, align 4
  %arrayidx37 = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 1
  store i8 0, i8* %arrayidx37, align 1
  br label %if.end38

if.else:                                          ; preds = %lor.lhs.false31
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 0
  %20 = load i8*, i8** %ps4, align 4
  %21 = load i32, i32* %ps4_firstc_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %arraydecay, i8* %20, i32 %21, i32 1, i1 false)
  br label %if.end38

if.end38:                                         ; preds = %if.else, %if.then34
  %22 = load i32, i32* %ps4_firstc_len, align 4
  %23 = load i32, i32* @indirection_level, align 4
  %mul = mul nsw i32 %22, %23
  %24 = load i8*, i8** %ps4, align 4
  %call39 = call i32 @strlen(i8* %24)
  %add = add i32 %mul, %call39
  store i32 %add, i32* %ineed, align 4
  %25 = load i32, i32* %ineed, align 4
  %26 = load i32, i32* @indirection_stringsiz, align 4
  %sub = sub nsw i32 %26, 1
  %cmp40 = icmp sgt i32 %25, %sub
  br i1 %cmp40, label %if.then42, label %if.end45

if.then42:                                        ; preds = %if.end38
  %27 = load i32, i32* %ineed, align 4
  %add43 = add nsw i32 %27, 1
  store i32 %add43, i32* @indirection_stringsiz, align 4
  %28 = load i8*, i8** @indirection_string, align 4
  %29 = load i32, i32* @indirection_stringsiz, align 4
  %call44 = call i8* @sh_xrealloc(i8* %28, i32 %29, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 466)
  store i8* %call44, i8** @indirection_string, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.then42, %if.end38
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end45
  %arrayidx46 = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 0
  %30 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %30 to i32
  %tobool48 = icmp ne i32 %conv47, 0
  br i1 %tobool48, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.cond
  %31 = load i32, i32* %j, align 4
  %32 = load i32, i32* @indirection_level, align 4
  %cmp49 = icmp slt i32 %31, %32
  br i1 %cmp49, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* @indirection_stringsiz, align 4
  %sub51 = sub nsw i32 %34, 1
  %cmp52 = icmp slt i32 %33, %sub51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.cond
  %35 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %cmp52, %land.rhs ]
  br i1 %35, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %36 = load i32, i32* %ps4_firstc_len, align 4
  %cmp54 = icmp eq i32 %36, 1
  br i1 %cmp54, label %if.then56, label %if.else59

if.then56:                                        ; preds = %for.body
  %arrayidx57 = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 0
  %37 = load i8, i8* %arrayidx57, align 1
  %38 = load i8*, i8** @indirection_string, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %38, i32 %39
  store i8 %37, i8* %arrayidx58, align 1
  br label %if.end61

if.else59:                                        ; preds = %for.body
  %40 = load i8*, i8** @indirection_string, align 4
  %41 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %40, i32 %41
  %arraydecay60 = getelementptr inbounds [17 x i8], [17 x i8]* %ps4_firstc, i32 0, i32 0
  %42 = load i32, i32* %ps4_firstc_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr, i8* %arraydecay60, i32 %42, i32 1, i1 false)
  br label %if.end61

if.end61:                                         ; preds = %if.else59, %if.then56
  br label %for.inc

for.inc:                                          ; preds = %if.end61
  %43 = load i32, i32* %ps4_firstc_len, align 4
  %44 = load i32, i32* %i, align 4
  %add62 = add nsw i32 %44, %43
  store i32 %add62, i32* %i, align 4
  %45 = load i32, i32* %j, align 4
  %inc = add nsw i32 %45, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %46 = load i32, i32* %ps4_firstc_len, align 4
  store i32 %46, i32* %j, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc78, %for.end
  %47 = load i8*, i8** %ps4, align 4
  %48 = load i8, i8* %47, align 1
  %conv64 = sext i8 %48 to i32
  %tobool65 = icmp ne i32 %conv64, 0
  br i1 %tobool65, label %land.lhs.true66, label %land.end74

land.lhs.true66:                                  ; preds = %for.cond63
  %49 = load i8*, i8** %ps4, align 4
  %50 = load i32, i32* %j, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %49, i32 %50
  %51 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %51 to i32
  %tobool69 = icmp ne i32 %conv68, 0
  br i1 %tobool69, label %land.rhs70, label %land.end74

land.rhs70:                                       ; preds = %land.lhs.true66
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* @indirection_stringsiz, align 4
  %sub71 = sub nsw i32 %53, 1
  %cmp72 = icmp slt i32 %52, %sub71
  br label %land.end74

land.end74:                                       ; preds = %land.rhs70, %land.lhs.true66, %for.cond63
  %54 = phi i1 [ false, %land.lhs.true66 ], [ false, %for.cond63 ], [ %cmp72, %land.rhs70 ]
  br i1 %54, label %for.body75, label %for.end81

for.body75:                                       ; preds = %land.end74
  %55 = load i8*, i8** %ps4, align 4
  %56 = load i32, i32* %j, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %55, i32 %56
  %57 = load i8, i8* %arrayidx76, align 1
  %58 = load i8*, i8** @indirection_string, align 4
  %59 = load i32, i32* %i, align 4
  %arrayidx77 = getelementptr inbounds i8, i8* %58, i32 %59
  store i8 %57, i8* %arrayidx77, align 1
  br label %for.inc78

for.inc78:                                        ; preds = %for.body75
  %60 = load i32, i32* %i, align 4
  %inc79 = add nsw i32 %60, 1
  store i32 %inc79, i32* %i, align 4
  %61 = load i32, i32* %j, align 4
  %inc80 = add nsw i32 %61, 1
  store i32 %inc80, i32* %j, align 4
  br label %for.cond63

for.end81:                                        ; preds = %land.end74
  %62 = load i8*, i8** @indirection_string, align 4
  %63 = load i32, i32* %i, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %62, i32 %63
  store i8 0, i8* %arrayidx82, align 1
  %64 = load i8*, i8** %ps4, align 4
  call void @sh_xfree(i8* %64, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 481)
  %65 = load i8*, i8** @indirection_string, align 4
  store i8* %65, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end81, %if.then18, %if.then5
  %66 = load i8*, i8** %retval, align 4
  ret i8* %66
}

declare i8* @get_string_value(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @change_flag(i32, i32) #1

declare i8* @decode_prompt_string(i8*) #1

declare i32 @strnlen(i8*, i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @mblen(i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @strlen(i8*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @xtrace_print_assignment(i8* %name, i8* %value, i32 %assign_list, i32 %xflags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %assign_list.addr = alloca i32, align 4
  %xflags.addr = alloca i32, align 4
  %nval = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %assign_list, i32* %assign_list.addr, align 4
  store i32 %xflags, i32* %xflags.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load i32, i32* %xflags.addr, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load i8*, i8** %value.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %7 = load i32, i32* %assign_list.addr, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %if.then5, label %if.else

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  %8 = load i8*, i8** %value.addr, align 4
  store i8* %8, i8** %nval, align 4
  br label %if.end18

if.else:                                          ; preds = %lor.lhs.false
  %9 = load i8*, i8** %value.addr, align 4
  %call6 = call i32 @sh_contains_shell_metas(i8* %9)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else
  %10 = load i8*, i8** %value.addr, align 4
  %call9 = call i8* @sh_single_quote(i8* %10)
  store i8* %call9, i8** %nval, align 4
  br label %if.end17

if.else10:                                        ; preds = %if.else
  %11 = load i8*, i8** %value.addr, align 4
  %call11 = call i32 @ansic_shouldquote(i8* %11)
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %if.then13, label %if.else15

if.then13:                                        ; preds = %if.else10
  %12 = load i8*, i8** %value.addr, align 4
  %call14 = call i8* @ansic_quote(i8* %12, i32 0, i32* null)
  store i8* %call14, i8** %nval, align 4
  br label %if.end16

if.else15:                                        ; preds = %if.else10
  %13 = load i8*, i8** %value.addr, align 4
  store i8* %13, i8** %nval, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.then13
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then8
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then5
  %14 = load i32, i32* %assign_list.addr, align 4
  %tobool19 = icmp ne i32 %14, 0
  br i1 %tobool19, label %if.then20, label %if.else22

if.then20:                                        ; preds = %if.end18
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %16 = load i8*, i8** %name.addr, align 4
  %17 = load i8*, i8** %nval, align 4
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), i8* %16, i8* %17)
  br label %if.end24

if.else22:                                        ; preds = %if.end18
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %19 = load i8*, i8** %name.addr, align 4
  %20 = load i8*, i8** %nval, align 4
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* %19, i8* %20)
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.then20
  %21 = load i8*, i8** %nval, align 4
  %22 = load i8*, i8** %value.addr, align 4
  %cmp25 = icmp ne i8* %21, %22
  br i1 %cmp25, label %if.then27, label %if.end31

if.then27:                                        ; preds = %if.end24
  br label %do.body

do.body:                                          ; preds = %if.then27
  %23 = load i8*, i8** %nval, align 4
  %tobool28 = icmp ne i8* %23, null
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %do.body
  %24 = load i8*, i8** %nval, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 513)
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end30
  br label %if.end31

if.end31:                                         ; preds = %do.end, %if.end24
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call32 = call i32 @fflush(%struct._IO_FILE* %25)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @sh_contains_shell_metas(i8*) #1

declare i8* @sh_single_quote(i8*) #1

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

; Function Attrs: noinline nounwind
define void @xtrace_print_word_list(%struct.word_list* %list, i32 %xtflags) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %xtflags.addr = alloca i32, align 4
  %w = alloca %struct.word_list*, align 4
  %t = alloca i8*, align 4
  %x = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %xtflags, i32* %xtflags.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load i32, i32* %xtflags.addr, align 4
  %and = and i32 %3, 1
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %5, %struct.word_list** %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load %struct.word_list*, %struct.word_list** %w, align 4
  %tobool3 = icmp ne %struct.word_list* %6, null
  br i1 %tobool3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word4, align 4
  store i8* %9, i8** %t, align 4
  %10 = load i8*, i8** %t, align 4
  %cmp = icmp eq i8* %10, null
  br i1 %cmp, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %11 = load i8*, i8** %t, align 4
  %12 = load i8, i8* %11, align 1
  %conv = sext i8 %12 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %lor.lhs.false, %for.body
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %14 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 0
  %15 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool8 = icmp ne %struct.word_list* %15, null
  %cond9 = select i1 %tobool8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* %cond9)
  br label %if.end44

if.else:                                          ; preds = %lor.lhs.false
  %16 = load i32, i32* %xtflags.addr, align 4
  %and11 = and i32 %16, 2
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.else18

if.then13:                                        ; preds = %if.else
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %18 = load i8*, i8** %t, align 4
  %19 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next14 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 0
  %20 = load %struct.word_list*, %struct.word_list** %next14, align 4
  %tobool15 = icmp ne %struct.word_list* %20, null
  %cond16 = select i1 %tobool15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %18, i8* %cond16)
  br label %if.end43

if.else18:                                        ; preds = %if.else
  %21 = load i8*, i8** %t, align 4
  %call19 = call i32 @sh_contains_shell_metas(i8* %21)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %if.then21, label %if.else27

if.then21:                                        ; preds = %if.else18
  %22 = load i8*, i8** %t, align 4
  %call22 = call i8* @sh_single_quote(i8* %22)
  store i8* %call22, i8** %x, align 4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %24 = load i8*, i8** %x, align 4
  %25 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next23 = getelementptr inbounds %struct.word_list, %struct.word_list* %25, i32 0, i32 0
  %26 = load %struct.word_list*, %struct.word_list** %next23, align 4
  %tobool24 = icmp ne %struct.word_list* %26, null
  %cond25 = select i1 %tobool24, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %24, i8* %cond25)
  %27 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 547)
  br label %if.end42

if.else27:                                        ; preds = %if.else18
  %28 = load i8*, i8** %t, align 4
  %call28 = call i32 @ansic_shouldquote(i8* %28)
  %tobool29 = icmp ne i32 %call28, 0
  br i1 %tobool29, label %if.then30, label %if.else36

if.then30:                                        ; preds = %if.else27
  %29 = load i8*, i8** %t, align 4
  %call31 = call i8* @ansic_quote(i8* %29, i32 0, i32* null)
  store i8* %call31, i8** %x, align 4
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %31 = load i8*, i8** %x, align 4
  %32 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next32 = getelementptr inbounds %struct.word_list, %struct.word_list* %32, i32 0, i32 0
  %33 = load %struct.word_list*, %struct.word_list** %next32, align 4
  %tobool33 = icmp ne %struct.word_list* %33, null
  %cond34 = select i1 %tobool33, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %31, i8* %cond34)
  %34 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %34, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 553)
  br label %if.end41

if.else36:                                        ; preds = %if.else27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %36 = load i8*, i8** %t, align 4
  %37 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next37 = getelementptr inbounds %struct.word_list, %struct.word_list* %37, i32 0, i32 0
  %38 = load %struct.word_list*, %struct.word_list** %next37, align 4
  %tobool38 = icmp ne %struct.word_list* %38, null
  %cond39 = select i1 %tobool38, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call40 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %36, i8* %cond39)
  br label %if.end41

if.end41:                                         ; preds = %if.else36, %if.then30
  br label %if.end42

if.end42:                                         ; preds = %if.end41, %if.then21
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.then13
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then7
  br label %for.inc

for.inc:                                          ; preds = %if.end44
  %39 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next45 = getelementptr inbounds %struct.word_list, %struct.word_list* %39, i32 0, i32 0
  %40 = load %struct.word_list*, %struct.word_list** %next45, align 4
  store %struct.word_list* %40, %struct.word_list** %w, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call47 = call i32 @fflush(%struct._IO_FILE* %42)
  ret void
}

; Function Attrs: noinline nounwind
define void @print_for_command_head(%struct.for_com* %for_command) #0 {
entry:
  %for_command.addr = alloca %struct.for_com*, align 4
  store %struct.for_com* %for_command, %struct.for_com** %for_command.addr, align 4
  %0 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %name = getelementptr inbounds %struct.for_com, %struct.for_com* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i32 0, i32 0), i8* %2)
  %3 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %map_list = getelementptr inbounds %struct.for_com, %struct.for_com* %3, i32 0, i32 3
  %4 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  call void @command_print_word_list(%struct.word_list* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @cprintf(i8* %control, ...) #0 {
entry:
  %control.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  %char_arg = alloca [2 x i8], align 1
  %argp = alloca i8*, align 4
  %intbuf = alloca [12 x i8], align 1
  %digit_arg = alloca i32, align 4
  %arg_len = alloca i32, align 4
  %c = alloca i32, align 4
  %args = alloca [4 x i32], align 4
  %varet = alloca i8*, align 4
  %varet19 = alloca i32, align 4
  %varet33 = alloca i32, align 4
  store i8* %control, i8** %control.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay1 = bitcast i32* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = load i8*, i8** %control.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %arg_len, align 4
  %1 = load i32, i32* %arg_len, align 4
  %add = add nsw i32 %1, 1
  call void @the_printed_command_resize(i32 %add)
  %arrayidx = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 1
  store i8 0, i8* %arrayidx, align 1
  %2 = load i8*, i8** %control.addr, align 4
  store i8* %2, i8** %s, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end44, %entry
  %3 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %3, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %conv = sext i8 %5 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %tobool2, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %8 = load i8, i8* %7, align 1
  %conv3 = sext i8 %8 to i32
  store i32 %conv3, i32* %c, align 4
  store i8* null, i8** %argp, align 4
  %9 = load i32, i32* %c, align 4
  %cmp = icmp ne i32 %9, 37
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %10 = load i8*, i8** %s, align 4
  %11 = load i8, i8* %10, align 1
  %tobool5 = icmp ne i8 %11, 0
  br i1 %tobool5, label %if.else, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %12 = load i32, i32* %c, align 4
  %conv6 = trunc i32 %12 to i8
  %arrayidx7 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8 %conv6, i8* %arrayidx7, align 1
  %arraydecay8 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8* %arraydecay8, i8** %argp, align 4
  store i32 1, i32* %arg_len, align 4
  br label %if.end38

if.else:                                          ; preds = %lor.lhs.false
  %13 = load i8*, i8** %s, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr9, i8** %s, align 4
  %14 = load i8, i8* %13, align 1
  %conv10 = sext i8 %14 to i32
  store i32 %conv10, i32* %c, align 4
  %15 = load i32, i32* %c, align 4
  switch i32 %15, label %sw.default [
    i32 37, label %sw.bb
    i32 115, label %sw.bb14
    i32 100, label %sw.bb17
    i32 99, label %sw.bb31
  ]

sw.bb:                                            ; preds = %if.else
  %16 = load i32, i32* %c, align 4
  %conv11 = trunc i32 %16 to i8
  %arrayidx12 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8 %conv11, i8* %arrayidx12, align 1
  %arraydecay13 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8* %arraydecay13, i8** %argp, align 4
  store i32 1, i32* %arg_len, align 4
  br label %sw.epilog

sw.bb14:                                          ; preds = %if.else
  %arraydecay15 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %17 = va_arg i32* %arraydecay15, i8*
  store i8* %17, i8** %varet, align 4
  %18 = load i8*, i8** %varet, align 4
  store i8* %18, i8** %argp, align 4
  %19 = load i8*, i8** %argp, align 4
  %call16 = call i32 @strlen(i8* %19)
  store i32 %call16, i32* %arg_len, align 4
  br label %sw.epilog

sw.bb17:                                          ; preds = %if.else
  %arraydecay18 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %20 = va_arg i32* %arraydecay18, i32
  store i32 %20, i32* %varet19, align 4
  %21 = load i32, i32* %varet19, align 4
  store i32 %21, i32* %digit_arg, align 4
  %22 = load i32, i32* %digit_arg, align 4
  %cmp20 = icmp slt i32 %22, 0
  br i1 %cmp20, label %if.then22, label %if.else26

if.then22:                                        ; preds = %sw.bb17
  %arraydecay23 = getelementptr inbounds [12 x i8], [12 x i8]* %intbuf, i32 0, i32 0
  %call24 = call i32 (i8*, i8*, ...) @sprintf(i8* %arraydecay23, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.94, i32 0, i32 0), i32 -1)
  %arraydecay25 = getelementptr inbounds [12 x i8], [12 x i8]* %intbuf, i32 0, i32 0
  store i8* %arraydecay25, i8** %argp, align 4
  br label %if.end

if.else26:                                        ; preds = %sw.bb17
  %23 = load i32, i32* %digit_arg, align 4
  %conv27 = sext i32 %23 to i64
  %arraydecay28 = getelementptr inbounds [12 x i8], [12 x i8]* %intbuf, i32 0, i32 0
  %call29 = call i8* @inttostr(i64 %conv27, i8* %arraydecay28, i32 12)
  store i8* %call29, i8** %argp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else26, %if.then22
  %24 = load i8*, i8** %argp, align 4
  %call30 = call i32 @strlen(i8* %24)
  store i32 %call30, i32* %arg_len, align 4
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.else
  %arraydecay32 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %25 = va_arg i32* %arraydecay32, i32
  store i32 %25, i32* %varet33, align 4
  %26 = load i32, i32* %varet33, align 4
  %conv34 = trunc i32 %26 to i8
  %arrayidx35 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8 %conv34, i8* %arrayidx35, align 1
  %arraydecay36 = getelementptr inbounds [2 x i8], [2 x i8]* %char_arg, i32 0, i32 0
  store i8* %arraydecay36, i8** %argp, align 4
  store i32 1, i32* %arg_len, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.else
  %call37 = call i8* @libintl_gettext(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.95, i32 0, i32 0))
  %27 = load i32, i32* %c, align 4
  call void (i8*, ...) @programming_error(i8* %call37, i32 %27)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb31, %if.end, %sw.bb14, %sw.bb
  br label %if.end38

if.end38:                                         ; preds = %sw.epilog, %if.then
  %28 = load i8*, i8** %argp, align 4
  %tobool39 = icmp ne i8* %28, null
  br i1 %tobool39, label %land.lhs.true, label %if.end44

land.lhs.true:                                    ; preds = %if.end38
  %29 = load i32, i32* %arg_len, align 4
  %tobool40 = icmp ne i32 %29, 0
  br i1 %tobool40, label %if.then41, label %if.end44

if.then41:                                        ; preds = %land.lhs.true
  %30 = load i32, i32* %arg_len, align 4
  %add42 = add nsw i32 %30, 1
  call void @the_printed_command_resize(i32 %add42)
  %31 = load i8*, i8** @the_printed_command, align 4
  %32 = load i32, i32* @command_string_index, align 4
  %add.ptr = getelementptr inbounds i8, i8* %31, i32 %32
  %33 = load i8*, i8** %argp, align 4
  %34 = load i32, i32* %arg_len, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr, i8* %33, i32 %34, i32 1, i1 false)
  %35 = load i32, i32* %arg_len, align 4
  %36 = load i32, i32* @command_string_index, align 4
  %add43 = add nsw i32 %36, %35
  store i32 %add43, i32* @command_string_index, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %land.lhs.true, %if.end38
  br label %while.cond

while.end:                                        ; preds = %land.end
  %arraydecay45 = getelementptr inbounds [4 x i32], [4 x i32]* %args, i32 0, i32 0
  %arraydecay4546 = bitcast i32* %arraydecay45 to i8*
  call void @llvm.va_end(i8* %arraydecay4546)
  %37 = load i8*, i8** @the_printed_command, align 4
  %38 = load i32, i32* @command_string_index, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %37, i32 %38
  store i8 0, i8* %arrayidx47, align 1
  ret void
}

; Function Attrs: noinline nounwind
define internal void @command_print_word_list(%struct.word_list* %list, i8* %separator) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %separator.addr = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i8* %separator, i8** %separator.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %1 = load i8*, i8** %separator.addr, align 4
  call void @_print_word_list(%struct.word_list* %0, i8* %1, void (i8*, ...)* @cprintf)
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_print_for_command_head(%struct.for_com* %for_command) #0 {
entry:
  %for_command.addr = alloca %struct.for_com*, align 4
  store %struct.for_com* %for_command, %struct.for_com** %for_command.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %5 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %name = getelementptr inbounds %struct.for_com, %struct.for_com* %5, i32 0, i32 2
  %6 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.13, i32 0, i32 0), i8* %7)
  %8 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %map_list = getelementptr inbounds %struct.for_com, %struct.for_com* %8, i32 0, i32 3
  %9 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  call void @xtrace_print_word_list(%struct.word_list* %9, i32 2)
  ret void
}

; Function Attrs: noinline nounwind
define void @print_select_command_head(%struct.select_com* %select_command) #0 {
entry:
  %select_command.addr = alloca %struct.select_com*, align 4
  store %struct.select_com* %select_command, %struct.select_com** %select_command.addr, align 4
  %0 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %name = getelementptr inbounds %struct.select_com, %struct.select_com* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i32 0, i32 0), i8* %2)
  %3 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %map_list = getelementptr inbounds %struct.select_com, %struct.select_com* %3, i32 0, i32 3
  %4 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  call void @command_print_word_list(%struct.word_list* %4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_print_select_command_head(%struct.select_com* %select_command) #0 {
entry:
  %select_command.addr = alloca %struct.select_com*, align 4
  store %struct.select_com* %select_command, %struct.select_com** %select_command.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %5 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %name = getelementptr inbounds %struct.select_com, %struct.select_com* %5, i32 0, i32 2
  %6 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i32 0, i32 0), i8* %7)
  %8 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %map_list = getelementptr inbounds %struct.select_com, %struct.select_com* %8, i32 0, i32 3
  %9 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  call void @xtrace_print_word_list(%struct.word_list* %9, i32 2)
  ret void
}

; Function Attrs: noinline nounwind
define void @print_case_command_head(%struct.case_com* %case_command) #0 {
entry:
  %case_command.addr = alloca %struct.case_com*, align 4
  store %struct.case_com* %case_command, %struct.case_com** %case_command.addr, align 4
  %0 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %word = getelementptr inbounds %struct.case_com, %struct.case_com* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word1, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.15, i32 0, i32 0), i8* %2)
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_print_case_command_head(%struct.case_com* %case_command) #0 {
entry:
  %case_command.addr = alloca %struct.case_com*, align 4
  store %struct.case_com* %case_command, %struct.case_com** %case_command.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %5 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %word = getelementptr inbounds %struct.case_com, %struct.case_com* %5, i32 0, i32 2
  %6 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %6, i32 0, i32 0
  %7 = load i8*, i8** %word2, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.16, i32 0, i32 0), i8* %7)
  ret void
}

; Function Attrs: noinline nounwind
define void @print_arith_command(%struct.word_list* %arith_cmd_list) #0 {
entry:
  %arith_cmd_list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %arith_cmd_list, %struct.word_list** %arith_cmd_list.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0))
  %0 = load %struct.word_list*, %struct.word_list** %arith_cmd_list.addr, align 4
  call void @command_print_word_list(%struct.word_list* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define void @print_cond_command(%struct.cond_com* %cond) #0 {
entry:
  %cond.addr = alloca %struct.cond_com*, align 4
  store %struct.cond_com* %cond, %struct.cond_com** %cond.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0))
  %0 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  call void @print_cond_node(%struct.cond_com* %0)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_cond_node(%struct.cond_com* %cond) #0 {
entry:
  %cond.addr = alloca %struct.cond_com*, align 4
  store %struct.cond_com* %cond, %struct.cond_com** %cond.addr, align 4
  %0 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %flags = getelementptr inbounds %struct.cond_com, %struct.cond_com* %0, i32 0, i32 0
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type = getelementptr inbounds %struct.cond_com, %struct.cond_com* %2, i32 0, i32 2
  %3 = load i32, i32* %type, align 4
  %cmp = icmp eq i32 %3, 6
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.40, i32 0, i32 0))
  %4 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left = getelementptr inbounds %struct.cond_com, %struct.cond_com* %4, i32 0, i32 4
  %5 = load %struct.cond_com*, %struct.cond_com** %left, align 4
  call void @print_cond_node(%struct.cond_com* %5)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.41, i32 0, i32 0))
  br label %if.end36

if.else:                                          ; preds = %if.end
  %6 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type2 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %6, i32 0, i32 2
  %7 = load i32, i32* %type2, align 4
  %cmp3 = icmp eq i32 %7, 1
  br i1 %cmp3, label %if.then4, label %if.else6

if.then4:                                         ; preds = %if.else
  %8 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left5 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %8, i32 0, i32 4
  %9 = load %struct.cond_com*, %struct.cond_com** %left5, align 4
  call void @print_cond_node(%struct.cond_com* %9)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.36, i32 0, i32 0))
  %10 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right = getelementptr inbounds %struct.cond_com, %struct.cond_com* %10, i32 0, i32 5
  %11 = load %struct.cond_com*, %struct.cond_com** %right, align 4
  call void @print_cond_node(%struct.cond_com* %11)
  br label %if.end35

if.else6:                                         ; preds = %if.else
  %12 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type7 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %12, i32 0, i32 2
  %13 = load i32, i32* %type7, align 4
  %cmp8 = icmp eq i32 %13, 2
  br i1 %cmp8, label %if.then9, label %if.else12

if.then9:                                         ; preds = %if.else6
  %14 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left10 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %14, i32 0, i32 4
  %15 = load %struct.cond_com*, %struct.cond_com** %left10, align 4
  call void @print_cond_node(%struct.cond_com* %15)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0))
  %16 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right11 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %16, i32 0, i32 5
  %17 = load %struct.cond_com*, %struct.cond_com** %right11, align 4
  call void @print_cond_node(%struct.cond_com* %17)
  br label %if.end34

if.else12:                                        ; preds = %if.else6
  %18 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type13 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %18, i32 0, i32 2
  %19 = load i32, i32* %type13, align 4
  %cmp14 = icmp eq i32 %19, 3
  br i1 %cmp14, label %if.then15, label %if.else17

if.then15:                                        ; preds = %if.else12
  %20 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op = getelementptr inbounds %struct.cond_com, %struct.cond_com* %20, i32 0, i32 3
  %21 = load %struct.word_desc*, %struct.word_desc** %op, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %21, i32 0, i32 0
  %22 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %22)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %23 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left16 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %23, i32 0, i32 4
  %24 = load %struct.cond_com*, %struct.cond_com** %left16, align 4
  call void @print_cond_node(%struct.cond_com* %24)
  br label %if.end33

if.else17:                                        ; preds = %if.else12
  %25 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type18 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %25, i32 0, i32 2
  %26 = load i32, i32* %type18, align 4
  %cmp19 = icmp eq i32 %26, 4
  br i1 %cmp19, label %if.then20, label %if.else25

if.then20:                                        ; preds = %if.else17
  %27 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left21 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %27, i32 0, i32 4
  %28 = load %struct.cond_com*, %struct.cond_com** %left21, align 4
  call void @print_cond_node(%struct.cond_com* %28)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %29 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op22 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %29, i32 0, i32 3
  %30 = load %struct.word_desc*, %struct.word_desc** %op22, align 4
  %word23 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %30, i32 0, i32 0
  %31 = load i8*, i8** %word23, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %31)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %32 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right24 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %32, i32 0, i32 5
  %33 = load %struct.cond_com*, %struct.cond_com** %right24, align 4
  call void @print_cond_node(%struct.cond_com* %33)
  br label %if.end32

if.else25:                                        ; preds = %if.else17
  %34 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %type26 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %34, i32 0, i32 2
  %35 = load i32, i32* %type26, align 4
  %cmp27 = icmp eq i32 %35, 5
  br i1 %cmp27, label %if.then28, label %if.end31

if.then28:                                        ; preds = %if.else25
  %36 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op29 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %36, i32 0, i32 3
  %37 = load %struct.word_desc*, %struct.word_desc** %op29, align 4
  %word30 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %37, i32 0, i32 0
  %38 = load i8*, i8** %word30, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %38)
  br label %if.end31

if.end31:                                         ; preds = %if.then28, %if.else25
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then20
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then15
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then9
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then4
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.then1
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_print_cond_term(i32 %type, i32 %invert, %struct.word_desc* %op, i8* %arg1, i8* %arg2) #0 {
entry:
  %type.addr = alloca i32, align 4
  %invert.addr = alloca i32, align 4
  %op.addr = alloca %struct.word_desc*, align 4
  %arg1.addr = alloca i8*, align 4
  %arg2.addr = alloca i8*, align 4
  store i32 %type, i32* %type.addr, align 4
  store i32 %invert, i32* %invert.addr, align 4
  store %struct.word_desc* %op, %struct.word_desc** %op.addr, align 4
  store i8* %arg1, i8** %arg1.addr, align 4
  store i8* %arg2, i8** %arg2.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  store i32 0, i32* @command_string_index, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0))
  %5 = load i32, i32* %invert.addr, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %7 = load i32, i32* %type.addr, align 4
  %cmp = icmp eq i32 %7, 3
  br i1 %cmp, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.end
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %9 = load %struct.word_desc*, %struct.word_desc** %op.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %12 = load i8*, i8** %arg1.addr, align 4
  %tobool7 = icmp ne i8* %12, null
  br i1 %tobool7, label %land.lhs.true, label %cond.false10

land.lhs.true:                                    ; preds = %if.then5
  %13 = load i8*, i8** %arg1.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv = sext i8 %14 to i32
  %tobool8 = icmp ne i32 %conv, 0
  br i1 %tobool8, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %land.lhs.true
  %15 = load i8*, i8** %arg1.addr, align 4
  br label %cond.end11

cond.false10:                                     ; preds = %land.lhs.true, %if.then5
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %cond12 = phi i8* [ %15, %cond.true9 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), %cond.false10 ]
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %cond12)
  br label %if.end38

if.else:                                          ; preds = %if.end
  %16 = load i32, i32* %type.addr, align 4
  %cmp14 = icmp eq i32 %16, 4
  br i1 %cmp14, label %if.then16, label %if.end37

if.then16:                                        ; preds = %if.else
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %18 = load i8*, i8** %arg1.addr, align 4
  %tobool17 = icmp ne i8* %18, null
  br i1 %tobool17, label %land.lhs.true18, label %cond.false22

land.lhs.true18:                                  ; preds = %if.then16
  %19 = load i8*, i8** %arg1.addr, align 4
  %20 = load i8, i8* %19, align 1
  %conv19 = sext i8 %20 to i32
  %tobool20 = icmp ne i32 %conv19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false22

cond.true21:                                      ; preds = %land.lhs.true18
  %21 = load i8*, i8** %arg1.addr, align 4
  br label %cond.end23

cond.false22:                                     ; preds = %land.lhs.true18, %if.then16
  br label %cond.end23

cond.end23:                                       ; preds = %cond.false22, %cond.true21
  %cond24 = phi i8* [ %21, %cond.true21 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), %cond.false22 ]
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %cond24)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %23 = load %struct.word_desc*, %struct.word_desc** %op.addr, align 4
  %word26 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %23, i32 0, i32 0
  %24 = load i8*, i8** %word26, align 4
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.24, i32 0, i32 0), i8* %24)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %26 = load i8*, i8** %arg2.addr, align 4
  %tobool28 = icmp ne i8* %26, null
  br i1 %tobool28, label %land.lhs.true29, label %cond.false33

land.lhs.true29:                                  ; preds = %cond.end23
  %27 = load i8*, i8** %arg2.addr, align 4
  %28 = load i8, i8* %27, align 1
  %conv30 = sext i8 %28 to i32
  %tobool31 = icmp ne i32 %conv30, 0
  br i1 %tobool31, label %cond.true32, label %cond.false33

cond.true32:                                      ; preds = %land.lhs.true29
  %29 = load i8*, i8** %arg2.addr, align 4
  br label %cond.end34

cond.false33:                                     ; preds = %land.lhs.true29, %cond.end23
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.true32
  %cond35 = phi i8* [ %29, %cond.true32 ], [ getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), %cond.false33 ]
  %call36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %cond35)
  br label %if.end37

if.end37:                                         ; preds = %cond.end34, %if.else
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %cond.end11
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call39 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0))
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call40 = call i32 @fflush(%struct._IO_FILE* %31)
  ret void
}

; Function Attrs: noinline nounwind
define void @xtrace_print_arith_cmd(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct._IO_FILE* [ %1, %cond.true ], [ %2, %cond.false ]
  store %struct._IO_FILE* %cond, %struct._IO_FILE** @xtrace_fp, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call = call i8* @indirection_level_string()
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %call)
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.26, i32 0, i32 0))
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %5, %struct.word_list** %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %6 = load %struct.word_list*, %struct.word_list** %w, align 4
  %tobool3 = icmp ne %struct.word_list* %6, null
  br i1 %tobool3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %8 = load %struct.word_list*, %struct.word_list** %w, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word4, align 4
  %11 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 0
  %12 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool5 = icmp ne %struct.word_list* %12, null
  %cond6 = select i1 %tobool5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %10, i8* %cond6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load %struct.word_list*, %struct.word_list** %w, align 4
  %next8 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 0
  %14 = load %struct.word_list*, %struct.word_list** %next8, align 4
  store %struct.word_list* %14, %struct.word_list** %w, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0))
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @xtrace_fp, align 4
  %call10 = call i32 @fflush(%struct._IO_FILE* %16)
  ret void
}

; Function Attrs: noinline nounwind
define void @print_simple_command(%struct.simple_com* %simple_command) #0 {
entry:
  %simple_command.addr = alloca %struct.simple_com*, align 4
  store %struct.simple_com* %simple_command, %struct.simple_com** %simple_command.addr, align 4
  %0 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %0, i32 0, i32 2
  %1 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void @command_print_word_list(%struct.word_list* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %2 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %2, i32 0, i32 3
  %3 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool = icmp ne %struct.redirect* %3, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %4 = load %struct.simple_com*, %struct.simple_com** %simple_command.addr, align 4
  %redirects1 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %4, i32 0, i32 3
  %5 = load %struct.redirect*, %struct.redirect** %redirects1, align 4
  call void @print_redirection_list(%struct.redirect* %5)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_redirection_list(%struct.redirect* %redirects) #0 {
entry:
  %redirects.addr = alloca %struct.redirect*, align 4
  %heredocs = alloca %struct.redirect*, align 4
  %hdtail = alloca %struct.redirect*, align 4
  %newredir = alloca %struct.redirect*, align 4
  %rw = alloca i8*, align 4
  store %struct.redirect* %redirects, %struct.redirect** %redirects.addr, align 4
  store %struct.redirect* null, %struct.redirect** %heredocs, align 4
  %0 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  store %struct.redirect* %0, %struct.redirect** %hdtail, align 4
  store i32 0, i32* @was_heredoc, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end53, %entry
  %1 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %tobool = icmp ne %struct.redirect* %1, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 4
  %3 = load i32, i32* %instruction, align 4
  %cmp = icmp eq i32 %3, 4
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %4 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %instruction1 = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 4
  %5 = load i32, i32* %instruction1, align 4
  %cmp2 = icmp eq i32 %5, 8
  br i1 %cmp2, label %if.then, label %if.else6

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %6 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %call = call %struct.redirect* @copy_redirect(%struct.redirect* %6)
  store %struct.redirect* %call, %struct.redirect** %newredir, align 4
  %7 = load %struct.redirect*, %struct.redirect** %newredir, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %7, i32 0, i32 0
  store %struct.redirect* null, %struct.redirect** %next, align 4
  %8 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  %tobool3 = icmp ne %struct.redirect* %8, null
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %9 = load %struct.redirect*, %struct.redirect** %newredir, align 4
  %10 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %next5 = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 0
  store %struct.redirect* %9, %struct.redirect** %next5, align 4
  %11 = load %struct.redirect*, %struct.redirect** %newredir, align 4
  store %struct.redirect* %11, %struct.redirect** %hdtail, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %12 = load %struct.redirect*, %struct.redirect** %newredir, align 4
  store %struct.redirect* %12, %struct.redirect** %heredocs, align 4
  store %struct.redirect* %12, %struct.redirect** %hdtail, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end49

if.else6:                                         ; preds = %lor.lhs.false
  %13 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %instruction7 = getelementptr inbounds %struct.redirect, %struct.redirect* %13, i32 0, i32 4
  %14 = load i32, i32* %instruction7, align 4
  %cmp8 = icmp eq i32 %14, 14
  br i1 %cmp8, label %land.lhs.true, label %if.else47

land.lhs.true:                                    ; preds = %if.else6
  %15 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %flags = getelementptr inbounds %struct.redirect, %struct.redirect* %15, i32 0, i32 3
  %16 = load i32, i32* %flags, align 4
  %and = and i32 %16, 1
  %cmp9 = icmp eq i32 %and, 0
  br i1 %cmp9, label %land.lhs.true10, label %if.else47

land.lhs.true10:                                  ; preds = %land.lhs.true
  %17 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %17, i32 0, i32 1
  %dest = bitcast %union.REDIRECTEE* %redirector to i32*
  %18 = load i32, i32* %dest, align 4
  %cmp11 = icmp eq i32 %18, 1
  br i1 %cmp11, label %if.then12, label %if.else47

if.then12:                                        ; preds = %land.lhs.true10
  %19 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %19, i32 0, i32 5
  %filename = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %20 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word, align 4
  store i8* %21, i8** %rw, align 4
  %22 = load i8*, i8** %rw, align 4
  %tobool13 = icmp ne i8* %22, null
  br i1 %tobool13, label %land.lhs.true14, label %if.end45

land.lhs.true14:                                  ; preds = %if.then12
  %23 = load i8*, i8** %rw, align 4
  %24 = load i8, i8* %23, align 1
  %conv = sext i8 %24 to i32
  %cmp15 = icmp ne i32 %conv, 45
  br i1 %cmp15, label %land.lhs.true17, label %if.end45

land.lhs.true17:                                  ; preds = %land.lhs.true14
  %25 = load i8*, i8** %rw, align 4
  %26 = load i8, i8* %25, align 1
  %conv18 = sext i8 %26 to i32
  %cmp19 = icmp sge i32 %conv18, 48
  br i1 %cmp19, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true17
  %27 = load i8*, i8** %rw, align 4
  %28 = load i8, i8* %27, align 1
  %conv21 = sext i8 %28 to i32
  %cmp22 = icmp sle i32 %conv21, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true17
  %29 = phi i1 [ false, %land.lhs.true17 ], [ %cmp22, %land.rhs ]
  %land.ext = zext i1 %29 to i32
  %cmp24 = icmp eq i32 %land.ext, 0
  br i1 %cmp24, label %land.lhs.true26, label %if.end45

land.lhs.true26:                                  ; preds = %land.end
  %30 = load i8*, i8** %rw, align 4
  %31 = load i8, i8* %30, align 1
  %conv27 = sext i8 %31 to i32
  %cmp28 = icmp eq i32 %conv27, 123
  br i1 %cmp28, label %lor.end, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %land.lhs.true26
  %32 = load i8*, i8** %rw, align 4
  %33 = load i8, i8* %32, align 1
  %conv31 = sext i8 %33 to i32
  %cmp32 = icmp eq i32 %conv31, 126
  br i1 %cmp32, label %lor.end, label %lor.lhs.false34

lor.lhs.false34:                                  ; preds = %lor.lhs.false30
  %34 = load i8*, i8** %rw, align 4
  %35 = load i8, i8* %34, align 1
  %conv35 = sext i8 %35 to i32
  %cmp36 = icmp eq i32 %conv35, 36
  br i1 %cmp36, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false34
  %36 = load i8*, i8** %rw, align 4
  %37 = load i8, i8* %36, align 1
  %conv38 = sext i8 %37 to i32
  %cmp39 = icmp eq i32 %conv38, 96
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false34, %lor.lhs.false30, %land.lhs.true26
  %38 = phi i1 [ true, %lor.lhs.false34 ], [ true, %lor.lhs.false30 ], [ true, %land.lhs.true26 ], [ %cmp39, %lor.rhs ]
  %lor.ext = zext i1 %38 to i32
  %cmp41 = icmp eq i32 %lor.ext, 0
  br i1 %cmp41, label %if.then43, label %if.end45

if.then43:                                        ; preds = %lor.end
  %39 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %instruction44 = getelementptr inbounds %struct.redirect, %struct.redirect* %39, i32 0, i32 4
  store i32 10, i32* %instruction44, align 4
  br label %if.end45

if.end45:                                         ; preds = %if.then43, %lor.end, %land.end, %land.lhs.true14, %if.then12
  %40 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  call void @print_redirection(%struct.redirect* %40)
  %41 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %instruction46 = getelementptr inbounds %struct.redirect, %struct.redirect* %41, i32 0, i32 4
  store i32 14, i32* %instruction46, align 4
  br label %if.end48

if.else47:                                        ; preds = %land.lhs.true10, %land.lhs.true, %if.else6
  %42 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  call void @print_redirection(%struct.redirect* %42)
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %if.end45
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.end
  %43 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %next50 = getelementptr inbounds %struct.redirect, %struct.redirect* %43, i32 0, i32 0
  %44 = load %struct.redirect*, %struct.redirect** %next50, align 4
  store %struct.redirect* %44, %struct.redirect** %redirects.addr, align 4
  %45 = load %struct.redirect*, %struct.redirect** %redirects.addr, align 4
  %tobool51 = icmp ne %struct.redirect* %45, null
  br i1 %tobool51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %if.end49
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %46 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  %tobool54 = icmp ne %struct.redirect* %46, null
  br i1 %tobool54, label %land.lhs.true55, label %if.else58

land.lhs.true55:                                  ; preds = %while.end
  %47 = load i32, i32* @printing_connection, align 4
  %tobool56 = icmp ne i32 %47, 0
  br i1 %tobool56, label %if.then57, label %if.else58

if.then57:                                        ; preds = %land.lhs.true55
  %48 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  store %struct.redirect* %48, %struct.redirect** @deferred_heredocs, align 4
  br label %if.end62

if.else58:                                        ; preds = %land.lhs.true55, %while.end
  %49 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  %tobool59 = icmp ne %struct.redirect* %49, null
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.else58
  %50 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  call void @print_heredocs(%struct.redirect* %50)
  %51 = load %struct.redirect*, %struct.redirect** %heredocs, align 4
  call void @dispose_redirects(%struct.redirect* %51)
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %if.else58
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.then57
  ret void
}

; Function Attrs: noinline nounwind
define i8* @named_function_string(i8* %name, %struct.command* %command, i32 %flags) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %command.addr = alloca %struct.command*, align 4
  %flags.addr = alloca i32, align 4
  %result = alloca i8*, align 4
  %old_indent = alloca i32, align 4
  %old_amount = alloca i32, align 4
  %cmdcopy = alloca %struct.command*, align 4
  %func_redirects = alloca %struct.redirect*, align 4
  store i8* %name, i8** %name.addr, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* @indentation, align 4
  store i32 %0, i32* %old_indent, align 4
  %1 = load i32, i32* @indentation_amount, align 4
  store i32 %1, i32* %old_amount, align 4
  store i32 0, i32* @was_heredoc, align 4
  store i32 0, i32* @command_string_index, align 4
  store %struct.redirect* null, %struct.redirect** @deferred_heredocs, align 4
  %2 = load i8*, i8** %name.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end4

if.then:                                          ; preds = %land.lhs.true
  %5 = load i8*, i8** %name.addr, align 4
  %call = call i32 @find_reserved_word(i8* %5)
  %cmp = icmp sge i32 %call, 0
  br i1 %cmp, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.28, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %6 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* %6)
  br label %if.end4

if.end4:                                          ; preds = %if.end, %land.lhs.true, %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.29, i32 0, i32 0))
  %7 = load i32, i32* %flags.addr, align 4
  %and = and i32 %7, 1
  %cmp5 = icmp eq i32 %and, 0
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end4
  store i32 1, i32* @indentation, align 4
  store i32 0, i32* @indentation_amount, align 4
  br label %if.end8

if.else:                                          ; preds = %if.end4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %8 = load i32, i32* @indentation_amount, align 4
  %9 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %9, %8
  store i32 %add, i32* @indentation, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.else, %if.then7
  %10 = load i32, i32* @inside_function_def, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* @inside_function_def, align 4
  %11 = load i32, i32* %flags.addr, align 4
  %and9 = and i32 %11, 1
  %tobool10 = icmp ne i32 %and9, 0
  %cond = select i1 %tobool10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0)
  call void (i8*, ...) @cprintf(i8* %cond)
  %12 = load %struct.command*, %struct.command** %command.addr, align 4
  %call11 = call %struct.command* @copy_command(%struct.command* %12)
  store %struct.command* %call11, %struct.command** %cmdcopy, align 4
  store %struct.redirect* null, %struct.redirect** %func_redirects, align 4
  %13 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %13, i32 0, i32 0
  %14 = load i32, i32* %type, align 4
  %cmp12 = icmp eq i32 %14, 9
  br i1 %cmp12, label %if.then14, label %if.end16

if.then14:                                        ; preds = %if.end8
  %15 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 3
  %16 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  store %struct.redirect* %16, %struct.redirect** %func_redirects, align 4
  %17 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects15 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then14, %if.end8
  %18 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %type17 = getelementptr inbounds %struct.command, %struct.command* %18, i32 0, i32 0
  %19 = load i32, i32* %type17, align 4
  %cmp18 = icmp eq i32 %19, 9
  br i1 %cmp18, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end16
  %20 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %20, i32 0, i32 4
  %Group = bitcast %union.anon* %value to %struct.group_com**
  %21 = load %struct.group_com*, %struct.group_com** %Group, align 4
  %command20 = getelementptr inbounds %struct.group_com, %struct.group_com* %21, i32 0, i32 1
  %22 = load %struct.command*, %struct.command** %command20, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end16
  %23 = load %struct.command*, %struct.command** %cmdcopy, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond21 = phi %struct.command* [ %22, %cond.true ], [ %23, %cond.false ]
  call void @make_command_string_internal(%struct.command* %cond21)
  %24 = load i32, i32* %old_indent, align 4
  store i32 %24, i32* @indentation, align 4
  %25 = load i32, i32* %old_amount, align 4
  store i32 %25, i32* @indentation_amount, align 4
  %26 = load i32, i32* @inside_function_def, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* @inside_function_def, align 4
  %27 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  %tobool22 = icmp ne %struct.redirect* %27, null
  br i1 %tobool22, label %if.then23, label %if.else25

if.then23:                                        ; preds = %cond.end
  call void @newline(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0))
  %28 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  call void @print_redirection_list(%struct.redirect* %28)
  %29 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  %30 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects24 = getelementptr inbounds %struct.command, %struct.command* %30, i32 0, i32 3
  store %struct.redirect* %29, %struct.redirect** %redirects24, align 4
  br label %if.end26

if.else25:                                        ; preds = %cond.end
  call void @newline(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.else25, %if.then23
  %31 = load i8*, i8** @the_printed_command, align 4
  store i8* %31, i8** %result, align 4
  %32 = load i32, i32* %flags.addr, align 4
  %and27 = and i32 %32, 1
  %cmp28 = icmp eq i32 %and27, 0
  br i1 %cmp28, label %if.then30, label %if.end38

if.then30:                                        ; preds = %if.end26
  %33 = load i8*, i8** %result, align 4
  %arrayidx = getelementptr inbounds i8, i8* %33, i32 2
  %34 = load i8, i8* %arrayidx, align 1
  %conv31 = sext i8 %34 to i32
  %cmp32 = icmp eq i32 %conv31, 10
  br i1 %cmp32, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.then30
  %35 = load i8*, i8** %result, align 4
  %add.ptr = getelementptr inbounds i8, i8* %35, i32 2
  %36 = load i8*, i8** %result, align 4
  %add.ptr35 = getelementptr inbounds i8, i8* %36, i32 3
  %37 = load i8*, i8** %result, align 4
  %call36 = call i32 @strlen(i8* %37)
  %sub = sub i32 %call36, 2
  call void @llvm.memmove.p0i8.p0i8.i32(i8* %add.ptr, i8* %add.ptr35, i32 %sub, i32 1, i1 false)
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.then30
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end26
  %38 = load %struct.command*, %struct.command** %cmdcopy, align 4
  call void @dispose_command(%struct.command* %38)
  %39 = load i32, i32* %flags.addr, align 4
  %and39 = and i32 %39, 2
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end38
  %40 = load i8*, i8** %result, align 4
  %call42 = call i8* @remove_quoted_escapes(i8* %40)
  store i8* %call42, i8** %result, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end38
  %41 = load i8*, i8** %result, align 4
  ret i8* %41
}

declare i32 @find_reserved_word(i8*) #1

declare %struct.command* @copy_command(%struct.command*) #1

; Function Attrs: noinline nounwind
define internal void @newline(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %0 = load i32, i32* @indentation, align 4
  call void @indent(i32 %0)
  %1 = load i8*, i8** %string.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8*, i8** %string.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare void @dispose_command(%struct.command*) #1

declare i8* @remove_quoted_escapes(i8*) #1

; Function Attrs: noinline nounwind
define internal void @indent(i32 %amount) #0 {
entry:
  %amount.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %amount, i32* %amount.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i32, i32* %amount.addr, align 4
  %add = add nsw i32 0, %0
  %1 = load i32, i32* @indentation_size, align 4
  %cmp = icmp sge i32 %add, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %2 = load i32, i32* %amount.addr, align 4
  %add1 = add nsw i32 0, %2
  %3 = load i32, i32* @indentation_size, align 4
  %cmp2 = icmp sge i32 %add1, %3
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* @indentation_size, align 4
  %add3 = add nsw i32 %4, 16
  store i32 %add3, i32* @indentation_size, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i8*, i8** @indentation_string, align 4
  %6 = load i32, i32* @indentation_size, align 4
  %call = call i8* @sh_xrealloc(i8* %5, i32 %6, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 1445)
  store i8* %call, i8** @indentation_string, align 4
  br label %if.end

if.end:                                           ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.end
  %7 = load i32, i32* %amount.addr, align 4
  %cmp4 = icmp sgt i32 %7, 0
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** @indentation_string, align 4
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 32, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %amount.addr, align 4
  %dec = add nsw i32 %10, -1
  store i32 %dec, i32* %amount.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i8*, i8** @indentation_string, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i32 %12
  store i8 0, i8* %arrayidx5, align 1
  %13 = load i8*, i8** @indentation_string, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %13)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_for_command(%struct.for_com* %for_command) #0 {
entry:
  %for_command.addr = alloca %struct.for_com*, align 4
  store %struct.for_com* %for_command, %struct.for_com** %for_command.addr, align 4
  %0 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  call void @print_for_command_head(%struct.for_com* %0)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0))
  call void @newline(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.44, i32 0, i32 0))
  %1 = load i32, i32* @indentation_amount, align 4
  %2 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* @indentation, align 4
  %3 = load %struct.for_com*, %struct.for_com** %for_command.addr, align 4
  %action = getelementptr inbounds %struct.for_com, %struct.for_com* %3, i32 0, i32 4
  %4 = load %struct.command*, %struct.command** %action, align 4
  call void @make_command_string_internal(%struct.command* %4)
  br label %do.body

do.body:                                          ; preds = %entry
  %5 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %5, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  call void @semicolon()
  %6 = load i32, i32* @indentation_amount, align 4
  %7 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %7, %6
  store i32 %sub, i32* @indentation, align 4
  call void @newline(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_arith_for_command(%struct.arith_for_com* %arith_for_command) #0 {
entry:
  %arith_for_command.addr = alloca %struct.arith_for_com*, align 4
  store %struct.arith_for_com* %arith_for_command, %struct.arith_for_com** %arith_for_command.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.46, i32 0, i32 0))
  %0 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %init = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %0, i32 0, i32 2
  %1 = load %struct.word_list*, %struct.word_list** %init, align 4
  call void @command_print_word_list(%struct.word_list* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.47, i32 0, i32 0))
  %2 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %test = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %2, i32 0, i32 3
  %3 = load %struct.word_list*, %struct.word_list** %test, align 4
  call void @command_print_word_list(%struct.word_list* %3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.47, i32 0, i32 0))
  %4 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %step = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %4, i32 0, i32 4
  %5 = load %struct.word_list*, %struct.word_list** %step, align 4
  call void @command_print_word_list(%struct.word_list* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0))
  call void @newline(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.44, i32 0, i32 0))
  %6 = load i32, i32* @indentation_amount, align 4
  %7 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %7, %6
  store i32 %add, i32* @indentation, align 4
  %8 = load %struct.arith_for_com*, %struct.arith_for_com** %arith_for_command.addr, align 4
  %action = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %8, i32 0, i32 5
  %9 = load %struct.command*, %struct.command** %action, align 4
  call void @make_command_string_internal(%struct.command* %9)
  br label %do.body

do.body:                                          ; preds = %entry
  %10 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %10, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  call void @semicolon()
  %11 = load i32, i32* @indentation_amount, align 4
  %12 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %12, %11
  store i32 %sub, i32* @indentation, align 4
  call void @newline(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_select_command(%struct.select_com* %select_command) #0 {
entry:
  %select_command.addr = alloca %struct.select_com*, align 4
  store %struct.select_com* %select_command, %struct.select_com** %select_command.addr, align 4
  %0 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  call void @print_select_command_head(%struct.select_com* %0)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0))
  call void @newline(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.44, i32 0, i32 0))
  %1 = load i32, i32* @indentation_amount, align 4
  %2 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %2, %1
  store i32 %add, i32* @indentation, align 4
  %3 = load %struct.select_com*, %struct.select_com** %select_command.addr, align 4
  %action = getelementptr inbounds %struct.select_com, %struct.select_com* %3, i32 0, i32 4
  %4 = load %struct.command*, %struct.command** %action, align 4
  call void @make_command_string_internal(%struct.command* %4)
  br label %do.body

do.body:                                          ; preds = %entry
  %5 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %5, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  call void @semicolon()
  %6 = load i32, i32* @indentation_amount, align 4
  %7 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %7, %6
  store i32 %sub, i32* @indentation, align 4
  call void @newline(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_case_command(%struct.case_com* %case_command) #0 {
entry:
  %case_command.addr = alloca %struct.case_com*, align 4
  store %struct.case_com* %case_command, %struct.case_com** %case_command.addr, align 4
  %0 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  call void @print_case_command_head(%struct.case_com* %0)
  %1 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %clauses = getelementptr inbounds %struct.case_com, %struct.case_com* %1, i32 0, i32 3
  %2 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  %tobool = icmp ne %struct.pattern_list* %2, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.case_com*, %struct.case_com** %case_command.addr, align 4
  %clauses1 = getelementptr inbounds %struct.case_com, %struct.case_com* %3, i32 0, i32 3
  %4 = load %struct.pattern_list*, %struct.pattern_list** %clauses1, align 4
  call void @print_case_clauses(%struct.pattern_list* %4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @newline(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.48, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_while_command(%struct.while_com* %while_command) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  %0 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  call void @print_until_or_while(%struct.while_com* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.54, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_until_command(%struct.while_com* %while_command) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  %0 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  call void @print_until_or_while(%struct.while_com* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.56, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_if_command(%struct.if_com* %if_command) #0 {
entry:
  %if_command.addr = alloca %struct.if_com*, align 4
  store %struct.if_com* %if_command, %struct.if_com** %if_command.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.57, i32 0, i32 0))
  %0 = load i32, i32* @skip_this_indent, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @skip_this_indent, align 4
  %1 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %test = getelementptr inbounds %struct.if_com, %struct.if_com* %1, i32 0, i32 1
  %2 = load %struct.command*, %struct.command** %test, align 4
  call void @make_command_string_internal(%struct.command* %2)
  call void @semicolon()
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.58, i32 0, i32 0))
  %3 = load i32, i32* @indentation_amount, align 4
  %4 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* @indentation, align 4
  %5 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %true_case = getelementptr inbounds %struct.if_com, %struct.if_com* %5, i32 0, i32 2
  %6 = load %struct.command*, %struct.command** %true_case, align 4
  call void @make_command_string_internal(%struct.command* %6)
  br label %do.body

do.body:                                          ; preds = %entry
  %7 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %7, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %8 = load i32, i32* @indentation_amount, align 4
  %9 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %9, %8
  store i32 %sub, i32* @indentation, align 4
  %10 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %false_case = getelementptr inbounds %struct.if_com, %struct.if_com* %10, i32 0, i32 3
  %11 = load %struct.command*, %struct.command** %false_case, align 4
  %tobool1 = icmp ne %struct.command* %11, null
  br i1 %tobool1, label %if.then2, label %if.end11

if.then2:                                         ; preds = %do.end
  call void @semicolon()
  call void @newline(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.59, i32 0, i32 0))
  %12 = load i32, i32* @indentation_amount, align 4
  %13 = load i32, i32* @indentation, align 4
  %add3 = add nsw i32 %13, %12
  store i32 %add3, i32* @indentation, align 4
  %14 = load %struct.if_com*, %struct.if_com** %if_command.addr, align 4
  %false_case4 = getelementptr inbounds %struct.if_com, %struct.if_com* %14, i32 0, i32 3
  %15 = load %struct.command*, %struct.command** %false_case4, align 4
  call void @make_command_string_internal(%struct.command* %15)
  br label %do.body5

do.body5:                                         ; preds = %if.then2
  %16 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool6 = icmp ne %struct.redirect* %16, null
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %do.body5
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %do.body5
  br label %do.end9

do.end9:                                          ; preds = %if.end8
  %17 = load i32, i32* @indentation_amount, align 4
  %18 = load i32, i32* @indentation, align 4
  %sub10 = sub nsw i32 %18, %17
  store i32 %sub10, i32* @indentation, align 4
  br label %if.end11

if.end11:                                         ; preds = %do.end9, %do.end
  call void @semicolon()
  call void @newline(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.60, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_deferred_heredocs(i8* %cstring) #0 {
entry:
  %cstring.addr = alloca i8*, align 4
  %hdtail = alloca %struct.redirect*, align 4
  store i8* %cstring, i8** %cstring.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  store %struct.redirect* %0, %struct.redirect** %hdtail, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %tobool = icmp ne %struct.redirect* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %2 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  call void @print_heredoc_header(%struct.redirect* %2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %3, i32 0, i32 0
  %4 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %4, %struct.redirect** %hdtail, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load i8*, i8** %cstring.addr, align 4
  %tobool1 = icmp ne i8* %5, null
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.end
  %6 = load i8*, i8** %cstring.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %land.lhs.true3, label %if.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %8 = load i8*, i8** %cstring.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %9 to i32
  %cmp = icmp ne i32 %conv5, 59
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true3
  %10 = load i8*, i8** %cstring.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %11 to i32
  %tobool9 = icmp ne i32 %conv8, 0
  br i1 %tobool9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true3
  %12 = load i8*, i8** %cstring.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %12)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %land.lhs.true, %for.end
  %13 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool10 = icmp ne %struct.redirect* %13, null
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end
  %14 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  store %struct.redirect* %14, %struct.redirect** %hdtail, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc16, %if.end12
  %15 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %tobool14 = icmp ne %struct.redirect* %15, null
  br i1 %tobool14, label %for.body15, label %for.end18

for.body15:                                       ; preds = %for.cond13
  %16 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  call void @print_heredoc_body(%struct.redirect* %16)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  br label %for.inc16

for.inc16:                                        ; preds = %for.body15
  %17 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %next17 = getelementptr inbounds %struct.redirect, %struct.redirect* %17, i32 0, i32 0
  %18 = load %struct.redirect*, %struct.redirect** %next17, align 4
  store %struct.redirect* %18, %struct.redirect** %hdtail, align 4
  br label %for.cond13

for.end18:                                        ; preds = %for.cond13
  %19 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool19 = icmp ne %struct.redirect* %19, null
  br i1 %tobool19, label %if.then20, label %if.end37

if.then20:                                        ; preds = %for.end18
  %20 = load i8*, i8** %cstring.addr, align 4
  %tobool21 = icmp ne i8* %20, null
  br i1 %tobool21, label %land.lhs.true22, label %if.end36

land.lhs.true22:                                  ; preds = %if.then20
  %21 = load i8*, i8** %cstring.addr, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %22 to i32
  %tobool25 = icmp ne i32 %conv24, 0
  br i1 %tobool25, label %land.lhs.true26, label %if.end36

land.lhs.true26:                                  ; preds = %land.lhs.true22
  %23 = load i8*, i8** %cstring.addr, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %24 to i32
  %cmp29 = icmp ne i32 %conv28, 59
  br i1 %cmp29, label %if.then35, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %land.lhs.true26
  %25 = load i8*, i8** %cstring.addr, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %26 to i32
  %tobool34 = icmp ne i32 %conv33, 0
  br i1 %tobool34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %lor.lhs.false31, %land.lhs.true26
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %lor.lhs.false31, %land.lhs.true22, %if.then20
  %27 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  call void @dispose_redirects(%struct.redirect* %27)
  store i32 1, i32* @was_heredoc, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %for.end18
  store %struct.redirect* null, %struct.redirect** @deferred_heredocs, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_function_def(%struct.function_def* %func) #0 {
entry:
  %func.addr = alloca %struct.function_def*, align 4
  %cmdcopy = alloca %struct.command*, align 4
  %func_redirects = alloca %struct.redirect*, align 4
  store %struct.function_def* %func, %struct.function_def** %func.addr, align 4
  store %struct.redirect* null, %struct.redirect** %func_redirects, align 4
  %0 = load i32, i32* @posixly_correct, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct.function_def*, %struct.function_def** %func.addr, align 4
  %name = getelementptr inbounds %struct.function_def, %struct.function_def* %1, i32 0, i32 2
  %2 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.65, i32 0, i32 0), i8* %3)
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load %struct.function_def*, %struct.function_def** %func.addr, align 4
  %name1 = getelementptr inbounds %struct.function_def, %struct.function_def* %4, i32 0, i32 2
  %5 = load %struct.word_desc*, %struct.word_desc** %name1, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word2, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.66, i32 0, i32 0), i8* %6)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i32)*)(void ()* @reset_locals, i32 0)
  %7 = load i32, i32* @indentation, align 4
  call void @indent(i32 %7)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0))
  %8 = load i32, i32* @inside_function_def, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* @inside_function_def, align 4
  %9 = load i32, i32* @indentation_amount, align 4
  %10 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %10, %9
  store i32 %add, i32* @indentation, align 4
  %11 = load %struct.function_def*, %struct.function_def** %func.addr, align 4
  %command = getelementptr inbounds %struct.function_def, %struct.function_def* %11, i32 0, i32 3
  %12 = load %struct.command*, %struct.command** %command, align 4
  %call = call %struct.command* @copy_command(%struct.command* %12)
  store %struct.command* %call, %struct.command** %cmdcopy, align 4
  %13 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %13, i32 0, i32 0
  %14 = load i32, i32* %type, align 4
  %cmp3 = icmp eq i32 %14, 9
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %15 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 3
  %16 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  store %struct.redirect* %16, %struct.redirect** %func_redirects, align 4
  %17 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects5 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects5, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %18 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %type7 = getelementptr inbounds %struct.command, %struct.command* %18, i32 0, i32 0
  %19 = load i32, i32* %type7, align 4
  %cmp8 = icmp eq i32 %19, 9
  br i1 %cmp8, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end6
  %20 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %20, i32 0, i32 4
  %Group = bitcast %union.anon* %value to %struct.group_com**
  %21 = load %struct.group_com*, %struct.group_com** %Group, align 4
  %command9 = getelementptr inbounds %struct.group_com, %struct.group_com* %21, i32 0, i32 1
  %22 = load %struct.command*, %struct.command** %command9, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end6
  %23 = load %struct.command*, %struct.command** %cmdcopy, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.command* [ %22, %cond.true ], [ %23, %cond.false ]
  call void @make_command_string_internal(%struct.command* %cond)
  call void @remove_unwind_protect()
  %24 = load i32, i32* @indentation_amount, align 4
  %25 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %25, %24
  store i32 %sub, i32* @indentation, align 4
  %26 = load i32, i32* @inside_function_def, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* @inside_function_def, align 4
  %27 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  %tobool = icmp ne %struct.redirect* %27, null
  br i1 %tobool, label %if.then10, label %if.else12

if.then10:                                        ; preds = %cond.end
  call void @newline(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0))
  %28 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  call void @print_redirection_list(%struct.redirect* %28)
  %29 = load %struct.redirect*, %struct.redirect** %func_redirects, align 4
  %30 = load %struct.command*, %struct.command** %cmdcopy, align 4
  %redirects11 = getelementptr inbounds %struct.command, %struct.command* %30, i32 0, i32 3
  store %struct.redirect* %29, %struct.redirect** %redirects11, align 4
  br label %if.end13

if.else12:                                        ; preds = %cond.end
  call void @newline(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0))
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %31 = load %struct.command*, %struct.command** %cmdcopy, align 4
  call void @dispose_command(%struct.command* %31)
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_group_command(%struct.group_com* %group_command) #0 {
entry:
  %group_command.addr = alloca %struct.group_com*, align 4
  store %struct.group_com* %group_command, %struct.group_com** %group_command.addr, align 4
  %0 = load i32, i32* @group_command_nesting, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @group_command_nesting, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.31, i32 0, i32 0))
  %1 = load i32, i32* @inside_function_def, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @skip_this_indent, align 4
  %inc1 = add nsw i32 %2, 1
  store i32 %inc1, i32* @skip_this_indent, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %3 = load i32, i32* @indentation_amount, align 4
  %4 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* @indentation, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load %struct.group_com*, %struct.group_com** %group_command.addr, align 4
  %command = getelementptr inbounds %struct.group_com, %struct.group_com* %5, i32 0, i32 1
  %6 = load %struct.command*, %struct.command** %command, align 4
  call void @make_command_string_internal(%struct.command* %6)
  br label %do.body

do.body:                                          ; preds = %if.end
  %7 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %7, null
  br i1 %tobool, label %if.then2, label %if.end3

if.then2:                                         ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end3
  %8 = load i32, i32* @inside_function_def, align 4
  %tobool4 = icmp ne i32 %8, 0
  br i1 %tobool4, label %if.then5, label %if.else6

if.then5:                                         ; preds = %do.end
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %9 = load i32, i32* @indentation_amount, align 4
  %10 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %10, %9
  store i32 %sub, i32* @indentation, align 4
  %11 = load i32, i32* @indentation, align 4
  call void @indent(i32 %11)
  br label %if.end7

if.else6:                                         ; preds = %do.end
  call void @semicolon()
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.then5
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0))
  %12 = load i32, i32* @group_command_nesting, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* @group_command_nesting, align 4
  ret void
}

declare void @command_error(i8*, i32, i32, i32) #1

; Function Attrs: noinline nounwind
define internal void @semicolon() #0 {
entry:
  %0 = load i32, i32* @command_string_index, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @the_printed_command, align 4
  %2 = load i32, i32* @command_string_index, align 4
  %sub = sub nsw i32 %2, 1
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %sub
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp1 = icmp eq i32 %conv, 38
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %4 = load i8*, i8** @the_printed_command, align 4
  %5 = load i32, i32* @command_string_index, align 4
  %sub3 = sub nsw i32 %5, 1
  %arrayidx4 = getelementptr inbounds i8, i8* %4, i32 %sub3
  %6 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 10
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  br label %return

if.end:                                           ; preds = %lor.lhs.false, %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_case_clauses(%struct.pattern_list* %clauses) #0 {
entry:
  %clauses.addr = alloca %struct.pattern_list*, align 4
  store %struct.pattern_list* %clauses, %struct.pattern_list** %clauses.addr, align 4
  %0 = load i32, i32* @indentation_amount, align 4
  %1 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %1, %0
  store i32 %add, i32* @indentation, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end11, %entry
  %2 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %tobool = icmp ne %struct.pattern_list* %2, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @newline(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  %3 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %patterns = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %3, i32 0, i32 1
  %4 = load %struct.word_list*, %struct.word_list** %patterns, align 4
  call void @command_print_word_list(%struct.word_list* %4, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.49, i32 0, i32 0))
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.50, i32 0, i32 0))
  %5 = load i32, i32* @indentation_amount, align 4
  %6 = load i32, i32* @indentation, align 4
  %add1 = add nsw i32 %6, %5
  store i32 %add1, i32* @indentation, align 4
  %7 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %action = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %7, i32 0, i32 2
  %8 = load %struct.command*, %struct.command** %action, align 4
  call void @make_command_string_internal(%struct.command* %8)
  %9 = load i32, i32* @indentation_amount, align 4
  %10 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %10, %9
  store i32 %sub, i32* @indentation, align 4
  br label %do.body

do.body:                                          ; preds = %while.body
  %11 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool2 = icmp ne %struct.redirect* %11, null
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %12 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %flags = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %12, i32 0, i32 3
  %13 = load i32, i32* %flags, align 4
  %and = and i32 %13, 1
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then4, label %if.else

if.then4:                                         ; preds = %do.end
  call void @newline(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i32 0, i32 0))
  br label %if.end11

if.else:                                          ; preds = %do.end
  %14 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %flags5 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %14, i32 0, i32 3
  %15 = load i32, i32* %flags5, align 4
  %and6 = and i32 %15, 2
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  call void @newline(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.52, i32 0, i32 0))
  br label %if.end10

if.else9:                                         ; preds = %if.else
  call void @newline(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.53, i32 0, i32 0))
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.then8
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.then4
  %16 = load %struct.pattern_list*, %struct.pattern_list** %clauses.addr, align 4
  %next = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %16, i32 0, i32 0
  %17 = load %struct.pattern_list*, %struct.pattern_list** %next, align 4
  store %struct.pattern_list* %17, %struct.pattern_list** %clauses.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load i32, i32* @indentation_amount, align 4
  %19 = load i32, i32* @indentation, align 4
  %sub12 = sub nsw i32 %19, %18
  store i32 %sub12, i32* @indentation, align 4
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_until_or_while(%struct.while_com* %while_command, i8* %which) #0 {
entry:
  %while_command.addr = alloca %struct.while_com*, align 4
  %which.addr = alloca i8*, align 4
  store %struct.while_com* %while_command, %struct.while_com** %while_command.addr, align 4
  store i8* %which, i8** %which.addr, align 4
  %0 = load i8*, i8** %which.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* %0)
  %1 = load i32, i32* @skip_this_indent, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @skip_this_indent, align 4
  %2 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %test = getelementptr inbounds %struct.while_com, %struct.while_com* %2, i32 0, i32 1
  %3 = load %struct.command*, %struct.command** %test, align 4
  call void @make_command_string_internal(%struct.command* %3)
  br label %do.body

do.body:                                          ; preds = %entry
  %4 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool = icmp ne %struct.redirect* %4, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  call void @semicolon()
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.55, i32 0, i32 0))
  %5 = load i32, i32* @indentation_amount, align 4
  %6 = load i32, i32* @indentation, align 4
  %add = add nsw i32 %6, %5
  store i32 %add, i32* @indentation, align 4
  %7 = load %struct.while_com*, %struct.while_com** %while_command.addr, align 4
  %action = getelementptr inbounds %struct.while_com, %struct.while_com* %7, i32 0, i32 2
  %8 = load %struct.command*, %struct.command** %action, align 4
  call void @make_command_string_internal(%struct.command* %8)
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %9 = load %struct.redirect*, %struct.redirect** @deferred_heredocs, align 4
  %tobool2 = icmp ne %struct.redirect* %9, null
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %do.body1
  call void @print_deferred_heredocs(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %do.body1
  br label %do.end5

do.end5:                                          ; preds = %if.end4
  %10 = load i32, i32* @indentation_amount, align 4
  %11 = load i32, i32* @indentation, align 4
  %sub = sub nsw i32 %11, %10
  store i32 %sub, i32* @indentation, align 4
  call void @semicolon()
  call void @newline(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i32 0, i32 0))
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_heredoc_header(%struct.redirect* %redirect) #0 {
entry:
  %redirect.addr = alloca %struct.redirect*, align 4
  %kill_leading = alloca i32, align 4
  %x = alloca i8*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 4
  %1 = load i32, i32* %instruction, align 4
  %cmp = icmp eq i32 %1, 8
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %kill_leading, align 4
  %2 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 2
  %3 = load i32, i32* %rflags, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 1
  %filename = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %5 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %6)
  br label %if.end7

if.else:                                          ; preds = %entry
  %7 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector1 = getelementptr inbounds %struct.redirect, %struct.redirect* %7, i32 0, i32 1
  %dest = bitcast %union.REDIRECTEE* %redirector1 to i32*
  %8 = load i32, i32* %dest, align 4
  %cmp2 = icmp ne i32 %8, 0
  br i1 %cmp2, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.else
  %9 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector5 = getelementptr inbounds %struct.redirect, %struct.redirect* %9, i32 0, i32 1
  %dest6 = bitcast %union.REDIRECTEE* %redirector5 to i32*
  %10 = load i32, i32* %dest6, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %10)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  %11 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %11, i32 0, i32 5
  %filename8 = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %12 = load %struct.word_desc*, %struct.word_desc** %filename8, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 1
  %13 = load i32, i32* %flags, align 4
  %and9 = and i32 %13, 2
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.end7
  %14 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %14, i32 0, i32 6
  %15 = load i8*, i8** %here_doc_eof, align 4
  %call = call i8* @sh_single_quote(i8* %15)
  store i8* %call, i8** %x, align 4
  %16 = load i32, i32* %kill_leading, align 4
  %tobool12 = icmp ne i32 %16, 0
  %cond = select i1 %tobool12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %17 = load i8*, i8** %x, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.63, i32 0, i32 0), i8* %cond, i8* %17)
  %18 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 1095)
  br label %if.end17

if.else13:                                        ; preds = %if.end7
  %19 = load i32, i32* %kill_leading, align 4
  %tobool14 = icmp ne i32 %19, 0
  %cond15 = select i1 %tobool14, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0)
  %20 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof16 = getelementptr inbounds %struct.redirect, %struct.redirect* %20, i32 0, i32 6
  %21 = load i8*, i8** %here_doc_eof16, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.63, i32 0, i32 0), i8* %cond15, i8* %21)
  br label %if.end17

if.end17:                                         ; preds = %if.else13, %if.then11
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_heredoc_body(%struct.redirect* %redirect) #0 {
entry:
  %redirect.addr = alloca %struct.redirect*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 5
  %filename = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %1 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  %3 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %3, i32 0, i32 6
  %4 = load i8*, i8** %here_doc_eof, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i8* %2, i8* %4)
  ret void
}

declare void @dispose_redirects(%struct.redirect*) #1

declare void @add_unwind_protect(...) #1

; Function Attrs: noinline nounwind
define internal void @reset_locals() #0 {
entry:
  store i32 0, i32* @inside_function_def, align 4
  store i32 0, i32* @indentation, align 4
  store i32 0, i32* @printing_connection, align 4
  store %struct.redirect* null, %struct.redirect** @deferred_heredocs, align 4
  ret void
}

declare void @remove_unwind_protect() #1

declare %struct.redirect* @copy_redirect(%struct.redirect*) #1

; Function Attrs: noinline nounwind
define internal void @print_redirection(%struct.redirect* %redirect) #0 {
entry:
  %redirect.addr = alloca %struct.redirect*, align 4
  %redirector = alloca i32, align 4
  %redir_fd = alloca i32, align 4
  %redirectee = alloca %struct.word_desc*, align 4
  %redir_word = alloca %struct.word_desc*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee1 = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 5
  %filename = bitcast %union.REDIRECTEE* %redirectee1 to %struct.word_desc**
  %1 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  store %struct.word_desc* %1, %struct.word_desc** %redirectee, align 4
  %2 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee2 = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 5
  %dest = bitcast %union.REDIRECTEE* %redirectee2 to i32*
  %3 = load i32, i32* %dest, align 4
  store i32 %3, i32* %redir_fd, align 4
  %4 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector3 = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 1
  %filename4 = bitcast %union.REDIRECTEE* %redirector3 to %struct.word_desc**
  %5 = load %struct.word_desc*, %struct.word_desc** %filename4, align 4
  store %struct.word_desc* %5, %struct.word_desc** %redir_word, align 4
  %6 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector5 = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 1
  %dest6 = bitcast %union.REDIRECTEE* %redirector5 to i32*
  %7 = load i32, i32* %dest6, align 4
  store i32 %7, i32* %redirector, align 4
  %8 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %8, i32 0, i32 4
  %9 = load i32, i32* %instruction, align 4
  switch i32 %9, label %sw.epilog [
    i32 1, label %sw.bb
    i32 0, label %sw.bb10
    i32 2, label %sw.bb22
    i32 12, label %sw.bb23
    i32 3, label %sw.bb35
    i32 11, label %sw.bb47
    i32 8, label %sw.bb59
    i32 4, label %sw.bb59
    i32 5, label %sw.bb60
    i32 6, label %sw.bb74
    i32 7, label %sw.bb82
    i32 13, label %sw.bb90
    i32 14, label %sw.bb100
    i32 15, label %sw.bb110
    i32 16, label %sw.bb118
    i32 17, label %sw.bb126
    i32 18, label %sw.bb136
    i32 9, label %sw.bb146
    i32 10, label %sw.bb154
    i32 19, label %sw.bb156
  ]

sw.bb:                                            ; preds = %entry
  %10 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 2
  %11 = load i32, i32* %rflags, align 4
  %and = and i32 %11, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %sw.bb
  %12 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %13)
  br label %if.end8

if.else:                                          ; preds = %sw.bb
  %14 = load i32, i32* %redirector, align 4
  %cmp = icmp ne i32 %14, 0
  br i1 %cmp, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else
  %15 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %15)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %16 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word9, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.67, i32 0, i32 0), i8* %17)
  br label %sw.epilog

sw.bb10:                                          ; preds = %entry
  %18 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags11 = getelementptr inbounds %struct.redirect, %struct.redirect* %18, i32 0, i32 2
  %19 = load i32, i32* %rflags11, align 4
  %and12 = and i32 %19, 1
  %tobool13 = icmp ne i32 %and12, 0
  br i1 %tobool13, label %if.then14, label %if.else16

if.then14:                                        ; preds = %sw.bb10
  %20 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word15, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %21)
  br label %if.end20

if.else16:                                        ; preds = %sw.bb10
  %22 = load i32, i32* %redirector, align 4
  %cmp17 = icmp ne i32 %22, 1
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.else16
  %23 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %23)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %if.else16
  br label %if.end20

if.end20:                                         ; preds = %if.end19, %if.then14
  %24 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word21 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word21, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.68, i32 0, i32 0), i8* %25)
  br label %sw.epilog

sw.bb22:                                          ; preds = %entry
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0))
  br label %sw.epilog

sw.bb23:                                          ; preds = %entry
  %26 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags24 = getelementptr inbounds %struct.redirect, %struct.redirect* %26, i32 0, i32 2
  %27 = load i32, i32* %rflags24, align 4
  %and25 = and i32 %27, 1
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.else29

if.then27:                                        ; preds = %sw.bb23
  %28 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %28, i32 0, i32 0
  %29 = load i8*, i8** %word28, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %29)
  br label %if.end33

if.else29:                                        ; preds = %sw.bb23
  %30 = load i32, i32* %redirector, align 4
  %cmp30 = icmp ne i32 %30, 1
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.else29
  %31 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %31)
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.else29
  br label %if.end33

if.end33:                                         ; preds = %if.end32, %if.then27
  %32 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word34 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word34, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.70, i32 0, i32 0), i8* %33)
  br label %sw.epilog

sw.bb35:                                          ; preds = %entry
  %34 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags36 = getelementptr inbounds %struct.redirect, %struct.redirect* %34, i32 0, i32 2
  %35 = load i32, i32* %rflags36, align 4
  %and37 = and i32 %35, 1
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.else41

if.then39:                                        ; preds = %sw.bb35
  %36 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word40 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %36, i32 0, i32 0
  %37 = load i8*, i8** %word40, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %37)
  br label %if.end45

if.else41:                                        ; preds = %sw.bb35
  %38 = load i32, i32* %redirector, align 4
  %cmp42 = icmp ne i32 %38, 1
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.else41
  %39 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %39)
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.else41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.then39
  %40 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word46 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %40, i32 0, i32 0
  %41 = load i8*, i8** %word46, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.71, i32 0, i32 0), i8* %41)
  br label %sw.epilog

sw.bb47:                                          ; preds = %entry
  %42 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags48 = getelementptr inbounds %struct.redirect, %struct.redirect* %42, i32 0, i32 2
  %43 = load i32, i32* %rflags48, align 4
  %and49 = and i32 %43, 1
  %tobool50 = icmp ne i32 %and49, 0
  br i1 %tobool50, label %if.then51, label %if.else53

if.then51:                                        ; preds = %sw.bb47
  %44 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word52 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 0
  %45 = load i8*, i8** %word52, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %45)
  br label %if.end57

if.else53:                                        ; preds = %sw.bb47
  %46 = load i32, i32* %redirector, align 4
  %cmp54 = icmp ne i32 %46, 1
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.else53
  %47 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %47)
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %if.else53
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then51
  %48 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word58 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word58, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.72, i32 0, i32 0), i8* %49)
  br label %sw.epilog

sw.bb59:                                          ; preds = %entry, %entry
  %50 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  call void @print_heredoc_header(%struct.redirect* %50)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  %51 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  call void @print_heredoc_body(%struct.redirect* %51)
  br label %sw.epilog

sw.bb60:                                          ; preds = %entry
  %52 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags61 = getelementptr inbounds %struct.redirect, %struct.redirect* %52, i32 0, i32 2
  %53 = load i32, i32* %rflags61, align 4
  %and62 = and i32 %53, 1
  %tobool63 = icmp ne i32 %and62, 0
  br i1 %tobool63, label %if.then64, label %if.else66

if.then64:                                        ; preds = %sw.bb60
  %54 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word65 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %54, i32 0, i32 0
  %55 = load i8*, i8** %word65, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i8* %55)
  br label %if.end70

if.else66:                                        ; preds = %sw.bb60
  %56 = load i32, i32* %redirector, align 4
  %cmp67 = icmp ne i32 %56, 0
  br i1 %cmp67, label %if.then68, label %if.end69

if.then68:                                        ; preds = %if.else66
  %57 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.62, i32 0, i32 0), i32 %57)
  br label %if.end69

if.end69:                                         ; preds = %if.then68, %if.else66
  br label %if.end70

if.end70:                                         ; preds = %if.end69, %if.then64
  %58 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirectee71 = getelementptr inbounds %struct.redirect, %struct.redirect* %58, i32 0, i32 5
  %filename72 = bitcast %union.REDIRECTEE* %redirectee71 to %struct.word_desc**
  %59 = load %struct.word_desc*, %struct.word_desc** %filename72, align 4
  %word73 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %59, i32 0, i32 0
  %60 = load i8*, i8** %word73, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.73, i32 0, i32 0), i8* %60)
  br label %sw.epilog

sw.bb74:                                          ; preds = %entry
  %61 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags75 = getelementptr inbounds %struct.redirect, %struct.redirect* %61, i32 0, i32 2
  %62 = load i32, i32* %rflags75, align 4
  %and76 = and i32 %62, 1
  %tobool77 = icmp ne i32 %and76, 0
  br i1 %tobool77, label %if.then78, label %if.else80

if.then78:                                        ; preds = %sw.bb74
  %63 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word79 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %63, i32 0, i32 0
  %64 = load i8*, i8** %word79, align 4
  %65 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.74, i32 0, i32 0), i8* %64, i32 %65)
  br label %if.end81

if.else80:                                        ; preds = %sw.bb74
  %66 = load i32, i32* %redirector, align 4
  %67 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.75, i32 0, i32 0), i32 %66, i32 %67)
  br label %if.end81

if.end81:                                         ; preds = %if.else80, %if.then78
  br label %sw.epilog

sw.bb82:                                          ; preds = %entry
  %68 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags83 = getelementptr inbounds %struct.redirect, %struct.redirect* %68, i32 0, i32 2
  %69 = load i32, i32* %rflags83, align 4
  %and84 = and i32 %69, 1
  %tobool85 = icmp ne i32 %and84, 0
  br i1 %tobool85, label %if.then86, label %if.else88

if.then86:                                        ; preds = %sw.bb82
  %70 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word87 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %70, i32 0, i32 0
  %71 = load i8*, i8** %word87, align 4
  %72 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.76, i32 0, i32 0), i8* %71, i32 %72)
  br label %if.end89

if.else88:                                        ; preds = %sw.bb82
  %73 = load i32, i32* %redirector, align 4
  %74 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.77, i32 0, i32 0), i32 %73, i32 %74)
  br label %if.end89

if.end89:                                         ; preds = %if.else88, %if.then86
  br label %sw.epilog

sw.bb90:                                          ; preds = %entry
  %75 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags91 = getelementptr inbounds %struct.redirect, %struct.redirect* %75, i32 0, i32 2
  %76 = load i32, i32* %rflags91, align 4
  %and92 = and i32 %76, 1
  %tobool93 = icmp ne i32 %and92, 0
  br i1 %tobool93, label %if.then94, label %if.else97

if.then94:                                        ; preds = %sw.bb90
  %77 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word95 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %77, i32 0, i32 0
  %78 = load i8*, i8** %word95, align 4
  %79 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word96 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %79, i32 0, i32 0
  %80 = load i8*, i8** %word96, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.78, i32 0, i32 0), i8* %78, i8* %80)
  br label %if.end99

if.else97:                                        ; preds = %sw.bb90
  %81 = load i32, i32* %redirector, align 4
  %82 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word98 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %82, i32 0, i32 0
  %83 = load i8*, i8** %word98, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.79, i32 0, i32 0), i32 %81, i8* %83)
  br label %if.end99

if.end99:                                         ; preds = %if.else97, %if.then94
  br label %sw.epilog

sw.bb100:                                         ; preds = %entry
  %84 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags101 = getelementptr inbounds %struct.redirect, %struct.redirect* %84, i32 0, i32 2
  %85 = load i32, i32* %rflags101, align 4
  %and102 = and i32 %85, 1
  %tobool103 = icmp ne i32 %and102, 0
  br i1 %tobool103, label %if.then104, label %if.else107

if.then104:                                       ; preds = %sw.bb100
  %86 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word105 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %86, i32 0, i32 0
  %87 = load i8*, i8** %word105, align 4
  %88 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word106 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %88, i32 0, i32 0
  %89 = load i8*, i8** %word106, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.80, i32 0, i32 0), i8* %87, i8* %89)
  br label %if.end109

if.else107:                                       ; preds = %sw.bb100
  %90 = load i32, i32* %redirector, align 4
  %91 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word108 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %91, i32 0, i32 0
  %92 = load i8*, i8** %word108, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.81, i32 0, i32 0), i32 %90, i8* %92)
  br label %if.end109

if.end109:                                        ; preds = %if.else107, %if.then104
  br label %sw.epilog

sw.bb110:                                         ; preds = %entry
  %93 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags111 = getelementptr inbounds %struct.redirect, %struct.redirect* %93, i32 0, i32 2
  %94 = load i32, i32* %rflags111, align 4
  %and112 = and i32 %94, 1
  %tobool113 = icmp ne i32 %and112, 0
  br i1 %tobool113, label %if.then114, label %if.else116

if.then114:                                       ; preds = %sw.bb110
  %95 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word115 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %95, i32 0, i32 0
  %96 = load i8*, i8** %word115, align 4
  %97 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.82, i32 0, i32 0), i8* %96, i32 %97)
  br label %if.end117

if.else116:                                       ; preds = %sw.bb110
  %98 = load i32, i32* %redirector, align 4
  %99 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.83, i32 0, i32 0), i32 %98, i32 %99)
  br label %if.end117

if.end117:                                        ; preds = %if.else116, %if.then114
  br label %sw.epilog

sw.bb118:                                         ; preds = %entry
  %100 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags119 = getelementptr inbounds %struct.redirect, %struct.redirect* %100, i32 0, i32 2
  %101 = load i32, i32* %rflags119, align 4
  %and120 = and i32 %101, 1
  %tobool121 = icmp ne i32 %and120, 0
  br i1 %tobool121, label %if.then122, label %if.else124

if.then122:                                       ; preds = %sw.bb118
  %102 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word123 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %102, i32 0, i32 0
  %103 = load i8*, i8** %word123, align 4
  %104 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.84, i32 0, i32 0), i8* %103, i32 %104)
  br label %if.end125

if.else124:                                       ; preds = %sw.bb118
  %105 = load i32, i32* %redirector, align 4
  %106 = load i32, i32* %redir_fd, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.85, i32 0, i32 0), i32 %105, i32 %106)
  br label %if.end125

if.end125:                                        ; preds = %if.else124, %if.then122
  br label %sw.epilog

sw.bb126:                                         ; preds = %entry
  %107 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags127 = getelementptr inbounds %struct.redirect, %struct.redirect* %107, i32 0, i32 2
  %108 = load i32, i32* %rflags127, align 4
  %and128 = and i32 %108, 1
  %tobool129 = icmp ne i32 %and128, 0
  br i1 %tobool129, label %if.then130, label %if.else133

if.then130:                                       ; preds = %sw.bb126
  %109 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word131 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %109, i32 0, i32 0
  %110 = load i8*, i8** %word131, align 4
  %111 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word132 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %111, i32 0, i32 0
  %112 = load i8*, i8** %word132, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.86, i32 0, i32 0), i8* %110, i8* %112)
  br label %if.end135

if.else133:                                       ; preds = %sw.bb126
  %113 = load i32, i32* %redirector, align 4
  %114 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word134 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %114, i32 0, i32 0
  %115 = load i8*, i8** %word134, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.87, i32 0, i32 0), i32 %113, i8* %115)
  br label %if.end135

if.end135:                                        ; preds = %if.else133, %if.then130
  br label %sw.epilog

sw.bb136:                                         ; preds = %entry
  %116 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags137 = getelementptr inbounds %struct.redirect, %struct.redirect* %116, i32 0, i32 2
  %117 = load i32, i32* %rflags137, align 4
  %and138 = and i32 %117, 1
  %tobool139 = icmp ne i32 %and138, 0
  br i1 %tobool139, label %if.then140, label %if.else143

if.then140:                                       ; preds = %sw.bb136
  %118 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word141 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %118, i32 0, i32 0
  %119 = load i8*, i8** %word141, align 4
  %120 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word142 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %120, i32 0, i32 0
  %121 = load i8*, i8** %word142, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.88, i32 0, i32 0), i8* %119, i8* %121)
  br label %if.end145

if.else143:                                       ; preds = %sw.bb136
  %122 = load i32, i32* %redirector, align 4
  %123 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word144 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %123, i32 0, i32 0
  %124 = load i8*, i8** %word144, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.89, i32 0, i32 0), i32 %122, i8* %124)
  br label %if.end145

if.end145:                                        ; preds = %if.else143, %if.then140
  br label %sw.epilog

sw.bb146:                                         ; preds = %entry
  %125 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags147 = getelementptr inbounds %struct.redirect, %struct.redirect* %125, i32 0, i32 2
  %126 = load i32, i32* %rflags147, align 4
  %and148 = and i32 %126, 1
  %tobool149 = icmp ne i32 %and148, 0
  br i1 %tobool149, label %if.then150, label %if.else152

if.then150:                                       ; preds = %sw.bb146
  %127 = load %struct.word_desc*, %struct.word_desc** %redir_word, align 4
  %word151 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %127, i32 0, i32 0
  %128 = load i8*, i8** %word151, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.90, i32 0, i32 0), i8* %128)
  br label %if.end153

if.else152:                                       ; preds = %sw.bb146
  %129 = load i32, i32* %redirector, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.91, i32 0, i32 0), i32 %129)
  br label %if.end153

if.end153:                                        ; preds = %if.else152, %if.then150
  br label %sw.epilog

sw.bb154:                                         ; preds = %entry
  %130 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word155 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %130, i32 0, i32 0
  %131 = load i8*, i8** %word155, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.92, i32 0, i32 0), i8* %131)
  br label %sw.epilog

sw.bb156:                                         ; preds = %entry
  %132 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word157 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %132, i32 0, i32 0
  %133 = load i8*, i8** %word157, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.93, i32 0, i32 0), i8* %133)
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb156, %sw.bb154, %if.end153, %if.end145, %if.end135, %if.end125, %if.end117, %if.end109, %if.end99, %if.end89, %if.end81, %if.end70, %sw.bb59, %if.end57, %if.end45, %if.end33, %sw.bb22, %if.end20, %if.end8
  ret void
}

; Function Attrs: noinline nounwind
define internal void @print_heredocs(%struct.redirect* %heredocs) #0 {
entry:
  %heredocs.addr = alloca %struct.redirect*, align 4
  %hdtail = alloca %struct.redirect*, align 4
  store %struct.redirect* %heredocs, %struct.redirect** %heredocs.addr, align 4
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %0 = load %struct.redirect*, %struct.redirect** %heredocs.addr, align 4
  store %struct.redirect* %0, %struct.redirect** %hdtail, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %tobool = icmp ne %struct.redirect* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  call void @print_redirection(%struct.redirect* %2)
  call void (i8*, ...) @cprintf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load %struct.redirect*, %struct.redirect** %hdtail, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %3, i32 0, i32 0
  %4 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %4, %struct.redirect** %hdtail, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* @was_heredoc, align 4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: noinline nounwind
define internal void @the_printed_command_resize(i32 %length) #0 {
entry:
  %length.addr = alloca i32, align 4
  %new = alloca i32, align 4
  store i32 %length, i32* %length.addr, align 4
  %0 = load i8*, i8** @the_printed_command, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %length.addr, align 4
  %add = add nsw i32 %1, 64
  %sub = sub nsw i32 %add, 1
  %and = and i32 %sub, -64
  store i32 %and, i32* @the_printed_command_size, align 4
  %2 = load i32, i32* @the_printed_command_size, align 4
  %call = call i8* @sh_xmalloc(i32 %2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 1561)
  store i8* %call, i8** @the_printed_command, align 4
  store i32 0, i32* @command_string_index, align 4
  br label %if.end10

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @command_string_index, align 4
  %4 = load i32, i32* %length.addr, align 4
  %add1 = add nsw i32 %3, %4
  %5 = load i32, i32* @the_printed_command_size, align 4
  %cmp2 = icmp sge i32 %add1, %5
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.else
  %6 = load i32, i32* @command_string_index, align 4
  %7 = load i32, i32* %length.addr, align 4
  %add4 = add nsw i32 %6, %7
  %add5 = add nsw i32 %add4, 1
  store i32 %add5, i32* %new, align 4
  %8 = load i32, i32* %new, align 4
  %add6 = add nsw i32 %8, 128
  %sub7 = sub nsw i32 %add6, 1
  %and8 = and i32 %sub7, -128
  store i32 %and8, i32* %new, align 4
  %9 = load i32, i32* %new, align 4
  store i32 %9, i32* @the_printed_command_size, align 4
  %10 = load i8*, i8** @the_printed_command, align 4
  %11 = load i32, i32* @the_printed_command_size, align 4
  %call9 = call i8* @sh_xrealloc(i8* %10, i32 %11, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 1573)
  store i8* %call9, i8** @the_printed_command, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.else
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  ret void
}

declare i32 @sprintf(i8*, i8*, ...) #1

declare i8* @inttostr(i64, i8*, i32) #1

declare void @programming_error(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

declare i32 @vfprintf(%struct._IO_FILE*, i8*, i32*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
