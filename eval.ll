; ModuleID = 'eval.c'
source_filename = "eval.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct._IO_FILE = type opaque
%struct.BASH_INPUT = type { i32, i8*, %union.INPUT_STREAM, i32 ()*, i32 (i32)* }
%union.INPUT_STREAM = type { %struct._IO_FILE* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@indirection_level = external global i32, align 4
@EOF_Reached = external global i32, align 4
@top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@interactive_shell = external global i32, align 4
@exit_immediately_on_error = external global i32, align 4
@variable_context = external global i32, align 4
@last_command_exit_value = external global i32, align 4
@subshell_environment = external global i32, align 4
@.str = private unnamed_addr constant [12 x i8] c"reader_loop\00", align 1
@executing = external global i32, align 4
@temporary_env = external global %struct.hash_table*, align 4
@read_but_dont_execute = external global i32, align 4
@global_command = external global %struct.command*, align 4
@current_command_number = external global i32, align 4
@stdin_redir = external global i32, align 4
@interactive = external global i32, align 4
@ps0_prompt = external global i8*, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"eval.c\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@just_one_command = external global i32, align 4
@need_here_doc = external global i32, align 4
@bash_input = external global %struct.BASH_INPUT, align 4
@.str.3 = private unnamed_addr constant [15 x i8] c"PROMPT_COMMAND\00", align 1
@running_under_emacs = external global i32, align 4
@current_command_line_count = external global i32, align 4
@.str.4 = private unnamed_addr constant [6 x i8] c"TMOUT\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"eterm\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"\1A/%s\0A\00", align 1
@.str.8 = private unnamed_addr constant [43 x i8] c"\07timed out waiting for input: auto-logout\0A\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define i32 @reader_loop() #0 {
entry:
  %our_indirection_level = alloca i32, align 4
  %current_command = alloca %struct.command*, align 4
  %code = alloca i32, align 4
  %ps0_string = alloca i8*, align 4
  store volatile %struct.command* null, %struct.command** %current_command, align 4
  %0 = load i32, i32* @indirection_level, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @indirection_level, align 4
  store i32 %inc, i32* %our_indirection_level, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end66, %entry
  %1 = load i32, i32* @EOF_Reached, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #4
  store i32 %call, i32* %code, align 4
  call void @unlink_fifo_list()
  %2 = load i32, i32* @interactive_shell, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %call1 = call i32 @signal_is_ignored(i32 2)
  %cmp2 = icmp eq i32 %call1, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call3 = call void (i32)* @signal(i32 2, void (i32)* @sigint_sighandler)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %while.body
  %3 = load i32, i32* %code, align 4
  %cmp4 = icmp ne i32 %3, 0
  br i1 %cmp4, label %if.then5, label %if.end19

if.then5:                                         ; preds = %if.end
  %4 = load i32, i32* %our_indirection_level, align 4
  store i32 %4, i32* @indirection_level, align 4
  %5 = load i32, i32* %code, align 4
  switch i32 %5, label %sw.default [
    i32 1, label %sw.bb
    i32 4, label %sw.bb
    i32 3, label %sw.bb
    i32 2, label %sw.bb9
  ]

sw.bb:                                            ; preds = %if.then5, %if.then5, %if.then5
  store volatile %struct.command* null, %struct.command** %current_command, align 4
  %6 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool6 = icmp ne i32 %6, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %sw.bb
  store i32 0, i32* @variable_context, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %sw.bb
  store i32 -1, i32* @EOF_Reached, align 4
  br label %exec_done

sw.bb9:                                           ; preds = %if.then5
  %7 = load i32, i32* @last_command_exit_value, align 4
  %cmp10 = icmp eq i32 %7, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %sw.bb9
  store i32 1, i32* @last_command_exit_value, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %sw.bb9
  %8 = load i32, i32* @subshell_environment, align 4
  %tobool13 = icmp ne i32 %8, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  store volatile %struct.command* null, %struct.command** %current_command, align 4
  store i32 -1, i32* @EOF_Reached, align 4
  br label %exec_done

if.end15:                                         ; preds = %if.end12
  %9 = load volatile %struct.command*, %struct.command** %current_command, align 4
  %tobool16 = icmp ne %struct.command* %9, null
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end15
  %10 = load volatile %struct.command*, %struct.command** %current_command, align 4
  call void @dispose_command(%struct.command* %10)
  store volatile %struct.command* null, %struct.command** %current_command, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end15
  br label %sw.epilog

sw.default:                                       ; preds = %if.then5
  %11 = load i32, i32* %code, align 4
  call void @command_error(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 3, i32 %11, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end18
  br label %if.end19

if.end19:                                         ; preds = %sw.epilog, %if.end
  store i32 0, i32* @executing, align 4
  %12 = load %struct.hash_table*, %struct.hash_table** @temporary_env, align 4
  %tobool20 = icmp ne %struct.hash_table* %12, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  call void @dispose_used_env_vars()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  %call23 = call i32 @read_command()
  %cmp24 = icmp eq i32 %call23, 0
  br i1 %cmp24, label %if.then25, label %if.else58

if.then25:                                        ; preds = %if.end22
  %13 = load i32, i32* @interactive_shell, align 4
  %cmp26 = icmp eq i32 %13, 0
  br i1 %cmp26, label %land.lhs.true27, label %if.else

land.lhs.true27:                                  ; preds = %if.then25
  %14 = load i32, i32* @read_but_dont_execute, align 4
  %tobool28 = icmp ne i32 %14, 0
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %land.lhs.true27
  store i32 0, i32* @last_command_exit_value, align 4
  %15 = load %struct.command*, %struct.command** @global_command, align 4
  call void @dispose_command(%struct.command* %15)
  store %struct.command* null, %struct.command** @global_command, align 4
  br label %if.end57

if.else:                                          ; preds = %land.lhs.true27, %if.then25
  %16 = load %struct.command*, %struct.command** @global_command, align 4
  store volatile %struct.command* %16, %struct.command** %current_command, align 4
  %tobool30 = icmp ne %struct.command* %16, null
  br i1 %tobool30, label %if.then31, label %if.end56

if.then31:                                        ; preds = %if.else
  store %struct.command* null, %struct.command** @global_command, align 4
  %17 = load i32, i32* @current_command_number, align 4
  %inc32 = add nsw i32 %17, 1
  store i32 %inc32, i32* @current_command_number, align 4
  store i32 1, i32* @executing, align 4
  store i32 0, i32* @stdin_redir, align 4
  %18 = load i32, i32* @interactive, align 4
  %tobool33 = icmp ne i32 %18, 0
  br i1 %tobool33, label %land.lhs.true34, label %if.end45

land.lhs.true34:                                  ; preds = %if.then31
  %19 = load i8*, i8** @ps0_prompt, align 4
  %tobool35 = icmp ne i8* %19, null
  br i1 %tobool35, label %if.then36, label %if.end45

if.then36:                                        ; preds = %land.lhs.true34
  %20 = load i8*, i8** @ps0_prompt, align 4
  %call37 = call i8* @decode_prompt_string(i8* %20)
  store i8* %call37, i8** %ps0_string, align 4
  %21 = load i8*, i8** %ps0_string, align 4
  %tobool38 = icmp ne i8* %21, null
  br i1 %tobool38, label %land.lhs.true39, label %if.end44

land.lhs.true39:                                  ; preds = %if.then36
  %22 = load i8*, i8** %ps0_string, align 4
  %23 = load i8, i8* %22, align 1
  %conv = sext i8 %23 to i32
  %tobool40 = icmp ne i32 %conv, 0
  br i1 %tobool40, label %if.then41, label %if.end44

if.then41:                                        ; preds = %land.lhs.true39
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %25 = load i8*, i8** %ps0_string, align 4
  %call42 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* %25)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call43 = call i32 @fflush(%struct._IO_FILE* %26)
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %land.lhs.true39, %if.then36
  %27 = load i8*, i8** %ps0_string, align 4
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i32 177)
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %land.lhs.true34, %if.then31
  %28 = load volatile %struct.command*, %struct.command** %current_command, align 4
  %call46 = call i32 @execute_command(%struct.command* %28)
  br label %exec_done

exec_done:                                        ; preds = %if.end45, %if.then14, %if.end8
  br label %do.body

do.body:                                          ; preds = %exec_done
  %29 = load volatile i32, i32* @terminating_signal, align 4
  %tobool47 = icmp ne i32 %29, 0
  br i1 %tobool47, label %if.then48, label %if.end49

if.then48:                                        ; preds = %do.body
  %30 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %30)
  br label %if.end49

if.end49:                                         ; preds = %if.then48, %do.body
  %31 = load volatile i32, i32* @interrupt_state, align 4
  %tobool50 = icmp ne i32 %31, 0
  br i1 %tobool50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end49
  call void @throw_to_top_level()
  br label %if.end52

if.end52:                                         ; preds = %if.then51, %if.end49
  br label %do.end

do.end:                                           ; preds = %if.end52
  %32 = load volatile %struct.command*, %struct.command** %current_command, align 4
  %tobool53 = icmp ne %struct.command* %32, null
  br i1 %tobool53, label %if.then54, label %if.end55

if.then54:                                        ; preds = %do.end
  %33 = load volatile %struct.command*, %struct.command** %current_command, align 4
  call void @dispose_command(%struct.command* %33)
  store volatile %struct.command* null, %struct.command** %current_command, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %do.end
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.else
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.then29
  br label %if.end63

if.else58:                                        ; preds = %if.end22
  %34 = load i32, i32* @interactive, align 4
  %cmp59 = icmp eq i32 %34, 0
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.else58
  store i32 -1, i32* @EOF_Reached, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then61, %if.else58
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.end57
  %35 = load i32, i32* @just_one_command, align 4
  %tobool64 = icmp ne i32 %35, 0
  br i1 %tobool64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end63
  store i32 -1, i32* @EOF_Reached, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.end63
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %36 = load i32, i32* @indirection_level, align 4
  %dec = add nsw i32 %36, -1
  store i32 %dec, i32* @indirection_level, align 4
  %37 = load i32, i32* @last_command_exit_value, align 4
  ret i32 %37
}

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #1

declare void @unlink_fifo_list() #2

declare i32 @signal_is_ignored(i32) #2

declare void (i32)* @signal(i32, void (i32)*) #2

declare void @sigint_sighandler(i32) #2

declare void @dispose_command(%struct.command*) #2

declare void @command_error(i8*, i32, i32, i32) #2

declare void @dispose_used_env_vars() #2

; Function Attrs: noinline nounwind
define i32 @read_command() #0 {
entry:
  %tmout_var = alloca %struct.variable*, align 4
  %tmout_len = alloca i32, align 4
  %result = alloca i32, align 4
  %old_alrm = alloca void (i32)*, align 4
  call void @set_current_prompt_level(i32 1)
  store %struct.command* null, %struct.command** @global_command, align 4
  store %struct.variable* null, %struct.variable** %tmout_var, align 4
  store i32 0, i32* %tmout_len, align 4
  store void (i32)* null, void (i32)** %old_alrm, align 4
  %0 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %call = call %struct.variable* @find_variable(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i32 0, i32 0))
  store %struct.variable* %call, %struct.variable** %tmout_var, align 4
  %1 = load %struct.variable*, %struct.variable** %tmout_var, align 4
  %tobool1 = icmp ne %struct.variable* %1, null
  br i1 %tobool1, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %if.then
  %2 = load %struct.variable*, %struct.variable** %tmout_var, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 1
  %3 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %3, null
  br i1 %cmp, label %if.then2, label %if.end9

if.then2:                                         ; preds = %land.lhs.true
  %4 = load %struct.variable*, %struct.variable** %tmout_var, align 4
  %value3 = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 1
  %5 = load i8*, i8** %value3, align 4
  %call4 = call i32 @atoi(i8* %5)
  store i32 %call4, i32* %tmout_len, align 4
  %6 = load i32, i32* %tmout_len, align 4
  %cmp5 = icmp sgt i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.then2
  %call7 = call void (i32)* @signal(i32 14, void (i32)* @alrm_catcher)
  store void (i32)* %call7, void (i32)** %old_alrm, align 4
  %7 = load i32, i32* %tmout_len, align 4
  %call8 = call i32 @alarm(i32 %7)
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.then2
  br label %if.end9

if.end9:                                          ; preds = %if.end, %land.lhs.true, %if.then
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %entry
  br label %do.body

do.body:                                          ; preds = %if.end10
  %8 = load volatile i32, i32* @terminating_signal, align 4
  %tobool11 = icmp ne i32 %8, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %do.body
  %9 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %9)
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %do.body
  %10 = load volatile i32, i32* @interrupt_state, align 4
  %tobool14 = icmp ne i32 %10, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end13
  call void @throw_to_top_level()
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %if.end13
  br label %do.end

do.end:                                           ; preds = %if.end16
  store i32 0, i32* @current_command_line_count, align 4
  %call17 = call i32 @parse_command()
  store i32 %call17, i32* %result, align 4
  %11 = load i32, i32* @interactive, align 4
  %tobool18 = icmp ne i32 %11, 0
  br i1 %tobool18, label %land.lhs.true19, label %if.end26

land.lhs.true19:                                  ; preds = %do.end
  %12 = load %struct.variable*, %struct.variable** %tmout_var, align 4
  %tobool20 = icmp ne %struct.variable* %12, null
  br i1 %tobool20, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %13 = load i32, i32* %tmout_len, align 4
  %cmp22 = icmp sgt i32 %13, 0
  br i1 %cmp22, label %if.then23, label %if.end26

if.then23:                                        ; preds = %land.lhs.true21
  %call24 = call i32 @alarm(i32 0)
  %14 = load void (i32)*, void (i32)** %old_alrm, align 4
  %call25 = call void (i32)* @signal(i32 14, void (i32)* %14)
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %land.lhs.true21, %land.lhs.true19, %do.end
  %15 = load i32, i32* %result, align 4
  ret i32 %15
}

declare i8* @decode_prompt_string(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fflush(%struct._IO_FILE*) #2

declare void @sh_xfree(i8*, i8*, i32) #2

declare i32 @execute_command(%struct.command*) #2

declare void @termsig_handler(i32) #2

declare void @throw_to_top_level() #2

; Function Attrs: noinline nounwind
define i32 @parse_command() #0 {
entry:
  %r = alloca i32, align 4
  %command_to_execute = alloca i8*, align 4
  store i32 0, i32* @need_here_doc, align 4
  call void @run_pending_traps()
  %0 = load i32, i32* @interactive, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 0), align 4
  %cmp = icmp ne i32 %1, 3
  br i1 %cmp, label %land.lhs.true1, label %if.end9

land.lhs.true1:                                   ; preds = %land.lhs.true
  %call = call i32 @parser_expanding_alias()
  %cmp2 = icmp eq i32 %call, 0
  br i1 %cmp2, label %if.then, label %if.end9

if.then:                                          ; preds = %land.lhs.true1
  %call3 = call i8* @get_string_value(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  store i8* %call3, i8** %command_to_execute, align 4
  %2 = load i8*, i8** %command_to_execute, align 4
  %tobool4 = icmp ne i8* %2, null
  br i1 %tobool4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  %3 = load i8*, i8** %command_to_execute, align 4
  call void @execute_variable_command(i8* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then
  %4 = load i32, i32* @running_under_emacs, align 4
  %cmp6 = icmp eq i32 %4, 2
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @send_pwd_to_eterm()
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %land.lhs.true1, %land.lhs.true, %entry
  store i32 0, i32* @current_command_line_count, align 4
  %call10 = call i32 @yyparse()
  store i32 %call10, i32* %r, align 4
  %5 = load i32, i32* @need_here_doc, align 4
  %tobool11 = icmp ne i32 %5, 0
  br i1 %tobool11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  call void @gather_here_documents()
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end9
  %6 = load i32, i32* %r, align 4
  ret i32 %6
}

declare void @run_pending_traps() #2

declare i32 @parser_expanding_alias() #2

declare i8* @get_string_value(i8*) #2

declare void @execute_variable_command(i8*, i8*) #2

; Function Attrs: noinline nounwind
define internal void @send_pwd_to_eterm() #0 {
entry:
  %pwd = alloca i8*, align 4
  %f = alloca i8*, align 4
  store i8* null, i8** %f, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
  store i8* %call, i8** %pwd, align 4
  %0 = load i8*, i8** %pwd, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @get_working_directory(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call1, i8** %pwd, align 4
  store i8* %call1, i8** %f, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %2 = load i8*, i8** %pwd, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0), i8* %2)
  %3 = load i8*, i8** %f, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i32 228)
  ret void
}

declare i32 @yyparse() #2

declare void @gather_here_documents() #2

declare void @set_current_prompt_level(i32) #2

declare %struct.variable* @find_variable(i8*) #2

declare i32 @atoi(i8*) #2

; Function Attrs: noinline nounwind
define internal void @alrm_catcher(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.8, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @printf(i8* %call)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call2 = call i32 @fflush(%struct._IO_FILE* %0)
  call void @bash_logout()
  call void @jump_to_top_level(i32 3) #5
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @alarm(i32) #2

declare i8* @get_working_directory(i8*) #2

declare i32 @printf(i8*, ...) #2

declare i8* @libintl_gettext(i8*) #2

declare void @bash_logout() #2

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #3

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { returns_twice }
attributes #5 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
