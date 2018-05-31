; ModuleID = 'evalstring.c'
source_filename = "evalstring.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.BASH_INPUT = type { i32, i8*, %union.INPUT_STREAM, i32 ()*, i32 (i32)* }
%union.INPUT_STREAM = type { %struct._IO_FILE* }
%struct._IO_FILE = type opaque
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.__sigset_t = type { [32 x i32] }
%struct.fd_bitmap = type { i32, i8* }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }

@parse_and_execute_level = global i32 0, align 4
@startup_state = external global i32, align 4
@running_trap = external global i32, align 4
@bash_input = external global %struct.BASH_INPUT, align 4
@.str = private unnamed_addr constant [22 x i8] c"parse_and_execute top\00", align 1
@line_number = external global i32, align 4
@indirection_level = external global i32, align 4
@current_token = external global i32, align 4
@interrupt_state = external global i32, align 4
@top_level = external global [1 x %struct.__jmp_buf_tag], align 4
@exit_immediately_on_error = external global i32, align 4
@variable_context = external global i32, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"pe_dispose\00", align 1
@last_command_exit_value = external global i32, align 4
@subshell_environment = external global i32, align 4
@.str.2 = private unnamed_addr constant [18 x i8] c"parse_and_execute\00", align 1
@interactive_shell = external global i32, align 4
@read_but_dont_execute = external global i32, align 4
@global_command = external global %struct.command*, align 4
@.str.3 = private unnamed_addr constant [41 x i8] c"%s: ignoring function definition attempt\00", align 1
@comsub_ignore_return = external global i32, align 4
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@posixly_correct = external global i32, align 4
@interactive = external global i32, align 4
@.str.4 = private unnamed_addr constant [17 x i8] c"parse_string top\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"parse_string\00", align 1
@shell_eof_token = external global i32, align 4
@return_catch_flag = external global i32, align 4
@.str.6 = private unnamed_addr constant [11 x i8] c"evalstring\00", align 1
@return_catch = external global [1 x %struct.__jmp_buf_tag], align 4
@return_catch_value = external global i32, align 4
@line_number_for_err_trap = external global i32, align 4
@loop_level = external global i32, align 4
@executing_list = external global i32, align 4
@remember_on_history = external global i32, align 4
@history_expansion_inhibited = external global i32, align 4
@the_printed_command_except_trap = external global i8*, align 4
@.str.7 = private unnamed_addr constant [13 x i8] c"evalstring.c\00", align 1
@enable_history_list = external global i32, align 4
@disallow_filename_globbing = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @should_suppress_fork(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load i32, i32* @startup_state, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @parse_and_execute_level, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %land.lhs.true2, label %land.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @running_trap, align 4
  %cmp3 = icmp eq i32 %2, 0
  br i1 %cmp3, label %land.lhs.true4, label %land.end

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %3 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %land.lhs.true7, label %land.end

land.lhs.true7:                                   ; preds = %land.lhs.true4
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 0
  %6 = load i32, i32* %type, align 4
  %cmp8 = icmp eq i32 %6, 4
  br i1 %cmp8, label %land.lhs.true10, label %land.end

land.lhs.true10:                                  ; preds = %land.lhs.true7
  %call = call i32 @signal_is_trapped(i32 0)
  %cmp11 = icmp eq i32 %call, 0
  br i1 %cmp11, label %land.lhs.true13, label %land.end

land.lhs.true13:                                  ; preds = %land.lhs.true10
  %call14 = call i32 @signal_is_trapped(i32 66)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %land.lhs.true17, label %land.end

land.lhs.true17:                                  ; preds = %land.lhs.true13
  %call18 = call i32 @any_signals_trapped()
  %cmp19 = icmp slt i32 %call18, 0
  br i1 %cmp19, label %land.lhs.true21, label %land.end

land.lhs.true21:                                  ; preds = %land.lhs.true17
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 3
  %8 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %cmp22 = icmp eq %struct.redirect* %8, null
  br i1 %cmp22, label %land.lhs.true24, label %land.end

land.lhs.true24:                                  ; preds = %land.lhs.true21
  %9 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %10 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %redirects25 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %10, i32 0, i32 3
  %11 = load %struct.redirect*, %struct.redirect** %redirects25, align 4
  %cmp26 = icmp eq %struct.redirect* %11, null
  br i1 %cmp26, label %land.lhs.true28, label %land.end

land.lhs.true28:                                  ; preds = %land.lhs.true24
  %12 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 1
  %13 = load i32, i32* %flags, align 4
  %and = and i32 %13, 128
  %cmp29 = icmp eq i32 %and, 0
  br i1 %cmp29, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true28
  %14 = load %struct.command*, %struct.command** %command.addr, align 4
  %flags31 = getelementptr inbounds %struct.command, %struct.command* %14, i32 0, i32 1
  %15 = load i32, i32* %flags31, align 4
  %and32 = and i32 %15, 4
  %cmp33 = icmp eq i32 %and32, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true28, %land.lhs.true24, %land.lhs.true21, %land.lhs.true17, %land.lhs.true13, %land.lhs.true10, %land.lhs.true7, %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %entry
  %16 = phi i1 [ false, %land.lhs.true28 ], [ false, %land.lhs.true24 ], [ false, %land.lhs.true21 ], [ false, %land.lhs.true17 ], [ false, %land.lhs.true13 ], [ false, %land.lhs.true10 ], [ false, %land.lhs.true7 ], [ false, %land.lhs.true4 ], [ false, %land.lhs.true2 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp33, %land.rhs ]
  %land.ext = zext i1 %16 to i32
  ret i32 %land.ext
}

declare i32 @signal_is_trapped(i32) #1

declare i32 @any_signals_trapped() #1

; Function Attrs: noinline nounwind
define void @optimize_fork(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %0, i32 0, i32 0
  %1 = load i32, i32* %type, align 4
  %cmp = icmp eq i32 %1, 6
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %2, i32 0, i32 4
  %Connection = bitcast %union.anon* %value to %struct.connection**
  %3 = load %struct.connection*, %struct.connection** %Connection, align 4
  %connector = getelementptr inbounds %struct.connection, %struct.connection* %3, i32 0, i32 3
  %4 = load i32, i32* %connector, align 4
  %cmp1 = icmp eq i32 %4, 287
  br i1 %cmp1, label %land.lhs.true6, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %value2 = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 4
  %Connection3 = bitcast %union.anon* %value2 to %struct.connection**
  %6 = load %struct.connection*, %struct.connection** %Connection3, align 4
  %connector4 = getelementptr inbounds %struct.connection, %struct.connection* %6, i32 0, i32 3
  %7 = load i32, i32* %connector4, align 4
  %cmp5 = icmp eq i32 %7, 288
  br i1 %cmp5, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %lor.lhs.false, %land.lhs.true
  %8 = load %struct.command*, %struct.command** %command.addr, align 4
  %value7 = getelementptr inbounds %struct.command, %struct.command* %8, i32 0, i32 4
  %Connection8 = bitcast %union.anon* %value7 to %struct.connection**
  %9 = load %struct.connection*, %struct.connection** %Connection8, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %9, i32 0, i32 2
  %10 = load %struct.command*, %struct.command** %second, align 4
  %call = call i32 @should_suppress_fork(%struct.command* %10)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true6
  %11 = load %struct.command*, %struct.command** %command.addr, align 4
  %value9 = getelementptr inbounds %struct.command, %struct.command* %11, i32 0, i32 4
  %Connection10 = bitcast %union.anon* %value9 to %struct.connection**
  %12 = load %struct.connection*, %struct.connection** %Connection10, align 4
  %second11 = getelementptr inbounds %struct.connection, %struct.connection* %12, i32 0, i32 2
  %13 = load %struct.command*, %struct.command** %second11, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %13, i32 0, i32 1
  %14 = load i32, i32* %flags, align 4
  %or = or i32 %14, 64
  store i32 %or, i32* %flags, align 4
  %15 = load %struct.command*, %struct.command** %command.addr, align 4
  %value12 = getelementptr inbounds %struct.command, %struct.command* %15, i32 0, i32 4
  %Connection13 = bitcast %union.anon* %value12 to %struct.connection**
  %16 = load %struct.connection*, %struct.connection** %Connection13, align 4
  %second14 = getelementptr inbounds %struct.connection, %struct.connection* %16, i32 0, i32 2
  %17 = load %struct.command*, %struct.command** %second14, align 4
  %value15 = getelementptr inbounds %struct.command, %struct.command* %17, i32 0, i32 4
  %Simple = bitcast %union.anon* %value15 to %struct.simple_com**
  %18 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %flags16 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %18, i32 0, i32 0
  %19 = load i32, i32* %flags16, align 4
  %or17 = or i32 %19, 64
  store i32 %or17, i32* %flags16, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true6, %lor.lhs.false, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @parse_and_execute_cleanup() #0 {
entry:
  %0 = load i32, i32* @running_trap, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @running_trap, align 4
  %sub = sub nsw i32 %1, 1
  call void @run_trap_cleanup(i32 %sub)
  call void @unfreeze_jobs_list()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i32 @have_unwind_protects()
  %tobool1 = icmp ne i32 %call, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  call void @run_unwind_frame(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0))
  br label %if.end3

if.else:                                          ; preds = %if.end
  store i32 0, i32* @parse_and_execute_level, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then2
  ret void
}

declare void @run_trap_cleanup(i32) #1

declare void @unfreeze_jobs_list() #1

declare i32 @have_unwind_protects() #1

declare void @run_unwind_frame(i8*) #1

; Function Attrs: noinline nounwind
define i32 @parse_and_execute(i8* %string, i8* %from_file, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %from_file.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %code = alloca i32, align 4
  %lreset = alloca i32, align 4
  %should_jump_to_top_level = alloca i32, align 4
  %last_result = alloca i32, align 4
  %command = alloca %struct.command*, align 4
  %pe_sigmask = alloca %struct.__sigset_t, align 4
  %bitmap = alloca %struct.fd_bitmap*, align 4
  %x = alloca i8*, align 4
  %r = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %from_file, i8** %from_file.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  call void @parse_prologue(i8* %0, i32 %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0))
  %2 = load i32, i32* @parse_and_execute_level, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @parse_and_execute_level, align 4
  %3 = load i32, i32* %flags.addr, align 4
  %and = and i32 %3, 16
  store i32 %and, i32* %lreset, align 4
  %4 = load i32, i32* %lreset, align 4
  call void @push_stream(i32 %4)
  %call = call i32 @parser_expanding_alias()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @parser_save_alias()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %lreset, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  %6 = load i32, i32* @line_number, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* @line_number, align 4
  br label %if.end2

if.end2:                                          ; preds = %if.then1, %if.end
  %7 = load i32, i32* @indirection_level, align 4
  %inc3 = add nsw i32 %7, 1
  store i32 %inc3, i32* @indirection_level, align 4
  store volatile i32 0, i32* %should_jump_to_top_level, align 4
  store i32 0, i32* %code, align 4
  store volatile i32 0, i32* %last_result, align 4
  %8 = load i32, i32* @current_token, align 4
  %cmp4 = icmp eq i32 %8, 303
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end2
  store i32 10, i32* @current_token, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end2
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i8*, i8** %from_file.addr, align 4
  call void @with_input_from_string(i8* %9, i8* %10)
  call void @clear_shell_input_line()
  br label %while.cond

while.cond:                                       ; preds = %if.end174, %if.else, %if.end6
  %11 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %12 = load i8, i8* %11, align 1
  %tobool7 = icmp ne i8 %12, 0
  br i1 %tobool7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store volatile %struct.command* null, %struct.command** %command, align 4
  %13 = load volatile i32, i32* @interrupt_state, align 4
  %tobool8 = icmp ne i32 %13, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %while.body
  store volatile i32 1, i32* %last_result, align 4
  br label %while.end

if.end10:                                         ; preds = %while.body
  %call11 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #4
  store i32 %call11, i32* %code, align 4
  %14 = load i32, i32* %code, align 4
  %tobool12 = icmp ne i32 %14, 0
  br i1 %tobool12, label %if.then13, label %if.end28

if.then13:                                        ; preds = %if.end10
  store volatile i32 0, i32* %should_jump_to_top_level, align 4
  %15 = load i32, i32* %code, align 4
  switch i32 %15, label %sw.default [
    i32 4, label %sw.bb
    i32 1, label %sw.bb18
    i32 3, label %sw.bb18
    i32 2, label %sw.bb22
  ]

sw.bb:                                            ; preds = %if.then13
  %16 = load i32, i32* @exit_immediately_on_error, align 4
  %tobool14 = icmp ne i32 %16, 0
  br i1 %tobool14, label %land.lhs.true, label %if.end17

land.lhs.true:                                    ; preds = %sw.bb
  %17 = load i32, i32* @variable_context, align 4
  %tobool15 = icmp ne i32 %17, 0
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %land.lhs.true
  call void @discard_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* @variable_context, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %land.lhs.true, %sw.bb
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  br label %out

sw.bb18:                                          ; preds = %if.then13, %if.then13
  %18 = load volatile %struct.command*, %struct.command** %command, align 4
  %tobool19 = icmp ne %struct.command* %18, null
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %sw.bb18
  call void @run_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %sw.bb18
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  br label %out

sw.bb22:                                          ; preds = %if.then13
  %19 = load volatile %struct.command*, %struct.command** %command, align 4
  %tobool23 = icmp ne %struct.command* %19, null
  br i1 %tobool23, label %if.then24, label %if.end25

if.then24:                                        ; preds = %sw.bb22
  call void @run_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end25

if.end25:                                         ; preds = %if.then24, %sw.bb22
  store i32 1, i32* @last_command_exit_value, align 4
  store volatile i32 1, i32* %last_result, align 4
  %20 = load i32, i32* @subshell_environment, align 4
  %tobool26 = icmp ne i32 %20, 0
  br i1 %tobool26, label %if.then27, label %if.else

if.then27:                                        ; preds = %if.end25
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  br label %out

if.else:                                          ; preds = %if.end25
  br label %while.cond

sw.default:                                       ; preds = %if.then13
  %21 = load i32, i32* %code, align 4
  call void @command_error(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0), i32 3, i32 %21, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %if.end28

if.end28:                                         ; preds = %sw.epilog, %if.end10
  %call29 = call i32 @parse_command()
  %cmp30 = icmp eq i32 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.else156

if.then31:                                        ; preds = %if.end28
  %22 = load i32, i32* %flags.addr, align 4
  %and32 = and i32 %22, 32
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then31
  %23 = load i32, i32* @interactive_shell, align 4
  %cmp34 = icmp eq i32 %23, 0
  br i1 %cmp34, label %land.lhs.true35, label %if.else38

land.lhs.true35:                                  ; preds = %lor.lhs.false
  %24 = load i32, i32* @read_but_dont_execute, align 4
  %tobool36 = icmp ne i32 %24, 0
  br i1 %tobool36, label %if.then37, label %if.else38

if.then37:                                        ; preds = %land.lhs.true35, %if.then31
  store volatile i32 0, i32* %last_result, align 4
  %25 = load %struct.command*, %struct.command** @global_command, align 4
  call void @dispose_command(%struct.command* %25)
  store %struct.command* null, %struct.command** @global_command, align 4
  br label %if.end155

if.else38:                                        ; preds = %land.lhs.true35, %lor.lhs.false
  %26 = load %struct.command*, %struct.command** @global_command, align 4
  store volatile %struct.command* %26, %struct.command** %command, align 4
  %tobool39 = icmp ne %struct.command* %26, null
  br i1 %tobool39, label %if.then40, label %if.end154

if.then40:                                        ; preds = %if.else38
  %27 = load i32, i32* %flags.addr, align 4
  %and41 = and i32 %27, 128
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %if.then43, label %if.end68

if.then43:                                        ; preds = %if.then40
  %28 = load volatile %struct.command*, %struct.command** %command, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %28, i32 0, i32 0
  %29 = load i32, i32* %type, align 4
  %cmp44 = icmp ne i32 %29, 7
  br i1 %cmp44, label %if.then65, label %lor.lhs.false45

lor.lhs.false45:                                  ; preds = %if.then43
  %call46 = call i8* @parser_remaining_input()
  store i8* %call46, i8** %x, align 4
  %tobool47 = icmp ne i8* %call46, null
  br i1 %tobool47, label %land.lhs.true48, label %lor.lhs.false50

land.lhs.true48:                                  ; preds = %lor.lhs.false45
  %30 = load i8*, i8** %x, align 4
  %31 = load i8, i8* %30, align 1
  %conv = sext i8 %31 to i32
  %tobool49 = icmp ne i32 %conv, 0
  br i1 %tobool49, label %if.then65, label %lor.lhs.false50

lor.lhs.false50:                                  ; preds = %land.lhs.true48, %lor.lhs.false45
  %32 = load i8*, i8** %from_file.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %32, i32 0
  %33 = load i8, i8* %arrayidx, align 1
  %conv51 = sext i8 %33 to i32
  %34 = load volatile %struct.command*, %struct.command** %command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %34, i32 0, i32 4
  %Function_def = bitcast %union.anon* %value to %struct.function_def**
  %35 = load %struct.function_def*, %struct.function_def** %Function_def, align 4
  %name = getelementptr inbounds %struct.function_def, %struct.function_def* %35, i32 0, i32 2
  %36 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %36, i32 0, i32 0
  %37 = load i8*, i8** %word, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %37, i32 0
  %38 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %38 to i32
  %cmp54 = icmp eq i32 %conv51, %conv53
  br i1 %cmp54, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.lhs.false50
  %39 = load i8*, i8** %from_file.addr, align 4
  %40 = load volatile %struct.command*, %struct.command** %command, align 4
  %value56 = getelementptr inbounds %struct.command, %struct.command* %40, i32 0, i32 4
  %Function_def57 = bitcast %union.anon* %value56 to %struct.function_def**
  %41 = load %struct.function_def*, %struct.function_def** %Function_def57, align 4
  %name58 = getelementptr inbounds %struct.function_def, %struct.function_def* %41, i32 0, i32 2
  %42 = load %struct.word_desc*, %struct.word_desc** %name58, align 4
  %word59 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %42, i32 0, i32 0
  %43 = load i8*, i8** %word59, align 4
  %call60 = call i32 @strcmp(i8* %39, i8* %43)
  %cmp61 = icmp eq i32 %call60, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.lhs.false50
  %44 = phi i1 [ false, %lor.lhs.false50 ], [ %cmp61, %land.rhs ]
  %land.ext = zext i1 %44 to i32
  %cmp63 = icmp eq i32 %land.ext, 0
  br i1 %cmp63, label %if.then65, label %if.end67

if.then65:                                        ; preds = %land.end, %land.lhs.true48, %if.then43
  %call66 = call i8* @libintl_gettext(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3, i32 0, i32 0))
  %45 = load i8*, i8** %from_file.addr, align 4
  call void (i8*, ...) @internal_warning(i8* %call66, i8* %45)
  store volatile i32 0, i32* %should_jump_to_top_level, align 4
  store i32 2, i32* @last_command_exit_value, align 4
  store volatile i32 2, i32* %last_result, align 4
  call void @reset_parser()
  br label %while.end

if.end67:                                         ; preds = %land.end
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then40
  %call69 = call %struct.fd_bitmap* @new_fd_bitmap(i32 32)
  store %struct.fd_bitmap* %call69, %struct.fd_bitmap** %bitmap, align 4
  call void @begin_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %46 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.fd_bitmap*)*, %struct.fd_bitmap*)*)(void (%struct.fd_bitmap*)* @dispose_fd_bitmap, %struct.fd_bitmap* %46)
  %47 = load volatile %struct.command*, %struct.command** %command, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (%struct.command*)*, %struct.command*)*)(void (%struct.command*)* @dispose_command, %struct.command* %47)
  store %struct.command* null, %struct.command** @global_command, align 4
  %48 = load i32, i32* @subshell_environment, align 4
  %and70 = and i32 %48, 4
  %tobool71 = icmp ne i32 %and70, 0
  br i1 %tobool71, label %land.lhs.true72, label %if.end76

land.lhs.true72:                                  ; preds = %if.end68
  %49 = load i32, i32* @comsub_ignore_return, align 4
  %tobool73 = icmp ne i32 %49, 0
  br i1 %tobool73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %land.lhs.true72
  %50 = load volatile %struct.command*, %struct.command** %command, align 4
  %flags75 = getelementptr inbounds %struct.command, %struct.command* %50, i32 0, i32 1
  %51 = load i32, i32* %flags75, align 4
  %or = or i32 %51, 8
  store i32 %or, i32* %flags75, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %land.lhs.true72, %if.end68
  %52 = load volatile %struct.command*, %struct.command** %command, align 4
  %call77 = call i32 @should_suppress_fork(%struct.command* %52)
  %tobool78 = icmp ne i32 %call77, 0
  br i1 %tobool78, label %if.then79, label %if.else85

if.then79:                                        ; preds = %if.end76
  %53 = load volatile %struct.command*, %struct.command** %command, align 4
  %flags80 = getelementptr inbounds %struct.command, %struct.command* %53, i32 0, i32 1
  %54 = load i32, i32* %flags80, align 4
  %or81 = or i32 %54, 64
  store i32 %or81, i32* %flags80, align 4
  %55 = load volatile %struct.command*, %struct.command** %command, align 4
  %value82 = getelementptr inbounds %struct.command, %struct.command* %55, i32 0, i32 4
  %Simple = bitcast %union.anon* %value82 to %struct.simple_com**
  %56 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %flags83 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %56, i32 0, i32 0
  %57 = load i32, i32* %flags83, align 4
  %or84 = or i32 %57, 64
  store i32 %or84, i32* %flags83, align 4
  br label %if.end91

if.else85:                                        ; preds = %if.end76
  %58 = load volatile %struct.command*, %struct.command** %command, align 4
  %type86 = getelementptr inbounds %struct.command, %struct.command* %58, i32 0, i32 0
  %59 = load i32, i32* %type86, align 4
  %cmp87 = icmp eq i32 %59, 6
  br i1 %cmp87, label %if.then89, label %if.end90

if.then89:                                        ; preds = %if.else85
  %60 = load volatile %struct.command*, %struct.command** %command, align 4
  call void @optimize_fork(%struct.command* %60)
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %if.else85
  br label %if.end91

if.end91:                                         ; preds = %if.end90, %if.then79
  %61 = load i32, i32* @startup_state, align 4
  %cmp92 = icmp eq i32 %61, 2
  br i1 %cmp92, label %land.lhs.true94, label %if.else147

land.lhs.true94:                                  ; preds = %if.end91
  %62 = load i32, i32* @subshell_environment, align 4
  %and95 = and i32 %62, 4
  %tobool96 = icmp ne i32 %and95, 0
  br i1 %tobool96, label %land.lhs.true97, label %if.else147

land.lhs.true97:                                  ; preds = %land.lhs.true94
  %63 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %64 = load i8, i8* %63, align 1
  %conv98 = sext i8 %64 to i32
  %cmp99 = icmp eq i32 %conv98, 0
  br i1 %cmp99, label %land.lhs.true101, label %if.else147

land.lhs.true101:                                 ; preds = %land.lhs.true97
  %65 = load volatile %struct.command*, %struct.command** %command, align 4
  %type102 = getelementptr inbounds %struct.command, %struct.command* %65, i32 0, i32 0
  %66 = load i32, i32* %type102, align 4
  %cmp103 = icmp eq i32 %66, 4
  br i1 %cmp103, label %land.lhs.true105, label %if.else147

land.lhs.true105:                                 ; preds = %land.lhs.true101
  %67 = load volatile %struct.command*, %struct.command** %command, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %67, i32 0, i32 3
  %68 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool106 = icmp ne %struct.redirect* %68, null
  br i1 %tobool106, label %if.else147, label %land.lhs.true107

land.lhs.true107:                                 ; preds = %land.lhs.true105
  %69 = load volatile %struct.command*, %struct.command** %command, align 4
  %flags108 = getelementptr inbounds %struct.command, %struct.command* %69, i32 0, i32 1
  %70 = load i32, i32* %flags108, align 4
  %and109 = and i32 %70, 128
  %cmp110 = icmp eq i32 %and109, 0
  br i1 %cmp110, label %land.lhs.true112, label %if.else147

land.lhs.true112:                                 ; preds = %land.lhs.true107
  %71 = load volatile %struct.command*, %struct.command** %command, align 4
  %value113 = getelementptr inbounds %struct.command, %struct.command* %71, i32 0, i32 4
  %Simple114 = bitcast %union.anon* %value113 to %struct.simple_com**
  %72 = load %struct.simple_com*, %struct.simple_com** %Simple114, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %72, i32 0, i32 2
  %73 = load %struct.word_list*, %struct.word_list** %words, align 4
  %cmp115 = icmp eq %struct.word_list* %73, null
  br i1 %cmp115, label %land.lhs.true117, label %if.else147

land.lhs.true117:                                 ; preds = %land.lhs.true112
  %74 = load volatile %struct.command*, %struct.command** %command, align 4
  %value118 = getelementptr inbounds %struct.command, %struct.command* %74, i32 0, i32 4
  %Simple119 = bitcast %union.anon* %value118 to %struct.simple_com**
  %75 = load %struct.simple_com*, %struct.simple_com** %Simple119, align 4
  %redirects120 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %75, i32 0, i32 3
  %76 = load %struct.redirect*, %struct.redirect** %redirects120, align 4
  %tobool121 = icmp ne %struct.redirect* %76, null
  br i1 %tobool121, label %land.lhs.true122, label %if.else147

land.lhs.true122:                                 ; preds = %land.lhs.true117
  %77 = load volatile %struct.command*, %struct.command** %command, align 4
  %value123 = getelementptr inbounds %struct.command, %struct.command* %77, i32 0, i32 4
  %Simple124 = bitcast %union.anon* %value123 to %struct.simple_com**
  %78 = load %struct.simple_com*, %struct.simple_com** %Simple124, align 4
  %redirects125 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %78, i32 0, i32 3
  %79 = load %struct.redirect*, %struct.redirect** %redirects125, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %79, i32 0, i32 0
  %80 = load %struct.redirect*, %struct.redirect** %next, align 4
  %cmp126 = icmp eq %struct.redirect* %80, null
  br i1 %cmp126, label %land.lhs.true128, label %if.else147

land.lhs.true128:                                 ; preds = %land.lhs.true122
  %81 = load volatile %struct.command*, %struct.command** %command, align 4
  %value129 = getelementptr inbounds %struct.command, %struct.command* %81, i32 0, i32 4
  %Simple130 = bitcast %union.anon* %value129 to %struct.simple_com**
  %82 = load %struct.simple_com*, %struct.simple_com** %Simple130, align 4
  %redirects131 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %82, i32 0, i32 3
  %83 = load %struct.redirect*, %struct.redirect** %redirects131, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %83, i32 0, i32 4
  %84 = load i32, i32* %instruction, align 4
  %cmp132 = icmp eq i32 %84, 1
  br i1 %cmp132, label %land.lhs.true134, label %if.else147

land.lhs.true134:                                 ; preds = %land.lhs.true128
  %85 = load volatile %struct.command*, %struct.command** %command, align 4
  %value135 = getelementptr inbounds %struct.command, %struct.command* %85, i32 0, i32 4
  %Simple136 = bitcast %union.anon* %value135 to %struct.simple_com**
  %86 = load %struct.simple_com*, %struct.simple_com** %Simple136, align 4
  %redirects137 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %86, i32 0, i32 3
  %87 = load %struct.redirect*, %struct.redirect** %redirects137, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %87, i32 0, i32 1
  %dest = bitcast %union.REDIRECTEE* %redirector to i32*
  %88 = load i32, i32* %dest, align 4
  %cmp138 = icmp eq i32 %88, 0
  br i1 %cmp138, label %if.then140, label %if.else147

if.then140:                                       ; preds = %land.lhs.true134
  %89 = load volatile %struct.command*, %struct.command** %command, align 4
  %value141 = getelementptr inbounds %struct.command, %struct.command* %89, i32 0, i32 4
  %Simple142 = bitcast %union.anon* %value141 to %struct.simple_com**
  %90 = load %struct.simple_com*, %struct.simple_com** %Simple142, align 4
  %redirects143 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %90, i32 0, i32 3
  %91 = load %struct.redirect*, %struct.redirect** %redirects143, align 4
  %call144 = call i32 @cat_file(%struct.redirect* %91)
  store i32 %call144, i32* %r, align 4
  %92 = load i32, i32* %r, align 4
  %cmp145 = icmp slt i32 %92, 0
  %cond = select i1 %cmp145, i32 1, i32 0
  store volatile i32 %cond, i32* %last_result, align 4
  br label %if.end149

if.else147:                                       ; preds = %land.lhs.true134, %land.lhs.true128, %land.lhs.true122, %land.lhs.true117, %land.lhs.true112, %land.lhs.true107, %land.lhs.true105, %land.lhs.true101, %land.lhs.true97, %land.lhs.true94, %if.end91
  %93 = load volatile %struct.command*, %struct.command** %command, align 4
  %94 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  %call148 = call i32 @execute_command_internal(%struct.command* %93, i32 0, i32 -1, i32 -1, %struct.fd_bitmap* %94)
  store volatile i32 %call148, i32* %last_result, align 4
  br label %if.end149

if.end149:                                        ; preds = %if.else147, %if.then140
  %95 = load volatile %struct.command*, %struct.command** %command, align 4
  call void @dispose_command(%struct.command* %95)
  %96 = load %struct.fd_bitmap*, %struct.fd_bitmap** %bitmap, align 4
  call void @dispose_fd_bitmap(%struct.fd_bitmap* %96)
  call void @discard_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %97 = load i32, i32* %flags.addr, align 4
  %and150 = and i32 %97, 256
  %tobool151 = icmp ne i32 %and150, 0
  br i1 %tobool151, label %if.then152, label %if.end153

if.then152:                                       ; preds = %if.end149
  call void @reset_parser()
  br label %while.end

if.end153:                                        ; preds = %if.end149
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %if.else38
  br label %if.end155

if.end155:                                        ; preds = %if.end154, %if.then37
  br label %if.end174

if.else156:                                       ; preds = %if.end28
  store volatile i32 1, i32* %last_result, align 4
  %98 = load i32, i32* @interactive_shell, align 4
  %cmp157 = icmp eq i32 %98, 0
  br i1 %cmp157, label %land.lhs.true159, label %if.end173

land.lhs.true159:                                 ; preds = %if.else156
  %99 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %tobool160 = icmp ne i32 (%struct.word_list*)* %99, null
  br i1 %tobool160, label %land.lhs.true161, label %if.end173

land.lhs.true161:                                 ; preds = %land.lhs.true159
  %100 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp162 = icmp eq i32 (%struct.word_list*)* %100, @source_builtin
  br i1 %cmp162, label %land.lhs.true167, label %lor.lhs.false164

lor.lhs.false164:                                 ; preds = %land.lhs.true161
  %101 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp165 = icmp eq i32 (%struct.word_list*)* %101, @eval_builtin
  br i1 %cmp165, label %land.lhs.true167, label %if.end173

land.lhs.true167:                                 ; preds = %lor.lhs.false164, %land.lhs.true161
  %102 = load i32, i32* @last_command_exit_value, align 4
  %cmp168 = icmp eq i32 %102, 257
  br i1 %cmp168, label %land.lhs.true170, label %if.end173

land.lhs.true170:                                 ; preds = %land.lhs.true167
  %103 = load i32, i32* @posixly_correct, align 4
  %tobool171 = icmp ne i32 %103, 0
  br i1 %tobool171, label %if.then172, label %if.end173

if.then172:                                       ; preds = %land.lhs.true170
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  store i32 4, i32* %code, align 4
  store i32 2, i32* @last_command_exit_value, align 4
  br label %if.end173

if.end173:                                        ; preds = %if.then172, %land.lhs.true170, %land.lhs.true167, %lor.lhs.false164, %land.lhs.true159, %if.else156
  br label %while.end

if.end174:                                        ; preds = %if.end155
  br label %while.cond

while.end:                                        ; preds = %if.end173, %if.then152, %if.then65, %if.then9, %while.cond
  br label %out

out:                                              ; preds = %while.end, %if.then27, %if.end21, %if.end17
  call void @run_unwind_frame(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0))
  %104 = load volatile i32, i32* @interrupt_state, align 4
  %tobool175 = icmp ne i32 %104, 0
  br i1 %tobool175, label %land.lhs.true176, label %if.end180

land.lhs.true176:                                 ; preds = %out
  %105 = load i32, i32* @parse_and_execute_level, align 4
  %cmp177 = icmp eq i32 %105, 0
  br i1 %cmp177, label %if.then179, label %if.end180

if.then179:                                       ; preds = %land.lhs.true176
  %106 = load i32, i32* @interactive_shell, align 4
  store i32 %106, i32* @interactive, align 4
  call void @throw_to_top_level()
  br label %if.end180

if.end180:                                        ; preds = %if.then179, %land.lhs.true176, %out
  %107 = load volatile i32, i32* %should_jump_to_top_level, align 4
  %tobool181 = icmp ne i32 %107, 0
  br i1 %tobool181, label %if.then182, label %if.end183

if.then182:                                       ; preds = %if.end180
  %108 = load i32, i32* %code, align 4
  call void @jump_to_top_level(i32 %108) #5
  unreachable

if.end183:                                        ; preds = %if.end180
  %109 = load volatile i32, i32* %last_result, align 4
  ret i32 %109
}

; Function Attrs: noinline nounwind
define internal void @parse_prologue(i8* %string, i32 %flags, i8* %tag) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %tag.addr = alloca i8*, align 4
  %orig_string = alloca i8*, align 4
  %lastcom = alloca i8*, align 4
  %x = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8* %tag, i8** %tag.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %orig_string, align 4
  %1 = load i8*, i8** %tag.addr, align 4
  call void @begin_unwind_frame(i8* %1)
  call void @unwind_protect_mem(i8* bitcast (i32* @parse_and_execute_level to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @top_level to i8*), i32 156)
  call void @unwind_protect_mem(i8* bitcast (i32* @indirection_level to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @line_number to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @line_number_for_err_trap to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @loop_level to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @executing_list to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast (i32* @comsub_ignore_return to i8*), i32 4)
  %2 = load i32, i32* %flags.addr, align 4
  %and = and i32 %2, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @unwind_protect_mem(i8* bitcast (i32* @interactive to i8*), i32 4)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* @parse_and_execute_level, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void ()* @set_history_remembering to void (...)*), i8* null)
  br label %if.end2

if.else:                                          ; preds = %if.end
  call void @unwind_protect_mem(i8* bitcast (i32* @remember_on_history to i8*), i32 4)
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @unwind_protect_mem(i8* bitcast (i32* @history_expansion_inhibited to i8*), i32 4)
  %4 = load i32, i32* @interactive_shell, align 4
  %tobool3 = icmp ne i32 %4, 0
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  %call = call i32 @get_current_prompt_level()
  store i32 %call, i32* %x, align 4
  %5 = load i32, i32* %x, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i32)*, i32)*)(void (i32)* @set_current_prompt_level, i32 %5)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end2
  %6 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool6 = icmp ne i8* %6, null
  br i1 %tobool6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.end5
  %7 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call8 = call i32 @strlen(i8* %7)
  %add = add i32 1, %call8
  %call9 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 185)
  %8 = load i8*, i8** @the_printed_command_except_trap, align 4
  %call10 = call i8* @strcpy(i8* %call9, i8* %8)
  store i8* %call10, i8** %lastcom, align 4
  %9 = load i8*, i8** %lastcom, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (...)*, i8*)*)(void (...)* bitcast (void (i8*)* @restore_lastcom to void (...)*), i8* %9)
  br label %if.end11

if.end11:                                         ; preds = %if.then7, %if.end5
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @pop_stream, i8* null)
  %call12 = call i32 @parser_expanding_alias()
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  call void bitcast (void (...)* @add_unwind_protect to void (void ()*, i8*)*)(void ()* @parser_restore_alias, i8* null)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end11
  %10 = load i8*, i8** %orig_string, align 4
  %tobool16 = icmp ne i8* %10, null
  br i1 %tobool16, label %land.lhs.true, label %if.end20

land.lhs.true:                                    ; preds = %if.end15
  %11 = load i32, i32* %flags.addr, align 4
  %and17 = and i32 %11, 8
  %cmp18 = icmp eq i32 %and17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %land.lhs.true
  %12 = load i8*, i8** %orig_string, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (void (i8*)*, i8*)*)(void (i8*)* @xfree, i8* %12)
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %land.lhs.true, %if.end15
  %13 = load i32, i32* %flags.addr, align 4
  %and21 = and i32 %13, 3
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.end20
  %14 = load i32, i32* %flags.addr, align 4
  %and24 = and i32 %14, 1
  %tobool25 = icmp ne i32 %and24, 0
  %cond = select i1 %tobool25, i32 0, i32 1
  store i32 %cond, i32* @interactive, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.end20
  %15 = load i32, i32* %flags.addr, align 4
  %and27 = and i32 %15, 4
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  call void @bash_history_disable()
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.end26
  %16 = load i32, i32* %flags.addr, align 4
  %and31 = and i32 %16, 512
  %tobool32 = icmp ne i32 %and31, 0
  br i1 %tobool32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  store i32 1, i32* @history_expansion_inhibited, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then33, %if.end30
  ret void
}

declare void @push_stream(i32) #1

declare i32 @parser_expanding_alias() #1

declare void @parser_save_alias() #1

declare void @with_input_from_string(i8*, i8*) #1

declare void @clear_shell_input_line() #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

declare void @discard_unwind_frame(i8*) #1

declare void @command_error(i8*, i32, i32, i32) #1

declare i32 @parse_command() #1

declare void @dispose_command(%struct.command*) #1

declare i8* @parser_remaining_input() #1

declare i32 @strcmp(i8*, i8*) #1

declare void @internal_warning(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @reset_parser() #1

declare %struct.fd_bitmap* @new_fd_bitmap(i32) #1

declare void @begin_unwind_frame(i8*) #1

declare void @add_unwind_protect(...) #1

declare void @dispose_fd_bitmap(%struct.fd_bitmap*) #1

; Function Attrs: noinline nounwind
define internal i32 @cat_file(%struct.redirect* %r) #0 {
entry:
  %retval = alloca i32, align 4
  %r.addr = alloca %struct.redirect*, align 4
  %fn = alloca i8*, align 4
  %fd = alloca i32, align 4
  %rval = alloca i32, align 4
  store %struct.redirect* %r, %struct.redirect** %r.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %r.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 4
  %1 = load i32, i32* %instruction, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true, label %if.end3

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* @interactive_shell, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* @disallow_filename_globbing, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* @disallow_filename_globbing, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %land.lhs.true, %if.end
  %5 = load %struct.redirect*, %struct.redirect** %r.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %5, i32 0, i32 5
  %filename = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %6 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %call = call i8* @redirection_expand(%struct.word_desc* %6)
  store i8* %call, i8** %fn, align 4
  %7 = load i32, i32* @posixly_correct, align 4
  %tobool4 = icmp ne i32 %7, 0
  br i1 %tobool4, label %land.lhs.true5, label %if.end8

land.lhs.true5:                                   ; preds = %if.end3
  %8 = load i32, i32* @interactive_shell, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %land.lhs.true5
  %9 = load i32, i32* @disallow_filename_globbing, align 4
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* @disallow_filename_globbing, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %land.lhs.true5, %if.end3
  %10 = load i8*, i8** %fn, align 4
  %cmp9 = icmp eq i8* %10, null
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  %11 = load %struct.redirect*, %struct.redirect** %r.addr, align 4
  call void @redirection_error(%struct.redirect* %11, i32 -1)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end8
  %12 = load i8*, i8** %fn, align 4
  %call12 = call i32 (i8*, i32, ...) @open(i8* %12, i32 0)
  store i32 %call12, i32* %fd, align 4
  %13 = load i32, i32* %fd, align 4
  %cmp13 = icmp slt i32 %13, 0
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  %14 = load i8*, i8** %fn, align 4
  call void @file_error(i8* %14)
  %15 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 628)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.end11
  %16 = load i32, i32* %fd, align 4
  %17 = load i8*, i8** %fn, align 4
  %call16 = call i32 @zcatfd(i32 %16, i32 1, i8* %17)
  store i32 %call16, i32* %rval, align 4
  %18 = load i8*, i8** %fn, align 4
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 634)
  %19 = load i32, i32* %fd, align 4
  %call17 = call i32 @close(i32 %19)
  %20 = load i32, i32* %rval, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end15, %if.then14, %if.then10, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare i32 @execute_command_internal(%struct.command*, i32, i32, i32, %struct.fd_bitmap*) #1

declare i32 @source_builtin(%struct.word_list*) #1

declare i32 @eval_builtin(%struct.word_list*) #1

declare void @throw_to_top_level() #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #3

; Function Attrs: noinline nounwind
define i32 @parse_string(i8* %string, i8* %from_file, i32 %flags, i8** %endp) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %from_file.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %endp.addr = alloca i8**, align 4
  %code = alloca i32, align 4
  %nc = alloca i32, align 4
  %should_jump_to_top_level = alloca i32, align 4
  %command = alloca %struct.command*, align 4
  %oglobal = alloca %struct.command*, align 4
  %ostring = alloca i8*, align 4
  %ps_sigmask = alloca %struct.__sigset_t, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %from_file, i8** %from_file.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i8** %endp, i8*** %endp.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i32, i32* %flags.addr, align 4
  call void @parse_prologue(i8* %0, i32 %1, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i32 0, i32 0))
  call void @push_stream(i32 0)
  %call = call i32 @parser_expanding_alias()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @parser_save_alias()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store volatile i32 0, i32* %should_jump_to_top_level, align 4
  store i32 0, i32* %code, align 4
  %2 = load %struct.command*, %struct.command** @global_command, align 4
  store %struct.command* %2, %struct.command** %oglobal, align 4
  %3 = load i8*, i8** %string.addr, align 4
  store i8* %3, i8** %ostring, align 4
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i8*, i8** %from_file.addr, align 4
  call void @with_input_from_string(i8* %4, i8* %5)
  br label %while.cond

while.cond:                                       ; preds = %if.end19, %if.end
  %6 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %7 = load i8, i8* %6, align 1
  %tobool1 = icmp ne i8 %7, 0
  br i1 %tobool1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store volatile %struct.command* null, %struct.command** %command, align 4
  %call2 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @top_level, i32 0, i32 0)) #4
  store i32 %call2, i32* %code, align 4
  %8 = load i32, i32* %code, align 4
  %tobool3 = icmp ne i32 %8, 0
  br i1 %tobool3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %while.body
  store volatile i32 0, i32* %should_jump_to_top_level, align 4
  %9 = load i32, i32* %code, align 4
  switch i32 %9, label %sw.default [
    i32 1, label %sw.bb
    i32 4, label %sw.bb
    i32 3, label %sw.bb
    i32 2, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.then4, %if.then4, %if.then4, %if.then4
  %10 = load volatile %struct.command*, %struct.command** %command, align 4
  %tobool5 = icmp ne %struct.command* %10, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %sw.bb
  %11 = load volatile %struct.command*, %struct.command** %command, align 4
  call void @dispose_command(%struct.command* %11)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %sw.bb
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  br label %out

sw.default:                                       ; preds = %if.then4
  %12 = load i32, i32* %code, align 4
  call void @command_error(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 3, i32 %12, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %if.end8

if.end8:                                          ; preds = %sw.epilog, %while.body
  %call9 = call i32 @parse_command()
  %cmp = icmp eq i32 %call9, 0
  br i1 %cmp, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.end8
  %13 = load %struct.command*, %struct.command** @global_command, align 4
  call void @dispose_command(%struct.command* %13)
  store %struct.command* null, %struct.command** @global_command, align 4
  br label %if.end15

if.else:                                          ; preds = %if.end8
  %14 = load i32, i32* %flags.addr, align 4
  %and = and i32 %14, 64
  %cmp11 = icmp eq i32 %and, 0
  br i1 %cmp11, label %if.then12, label %if.else13

if.then12:                                        ; preds = %if.else
  store volatile i32 1, i32* %should_jump_to_top_level, align 4
  store i32 2, i32* %code, align 4
  br label %if.end14

if.else13:                                        ; preds = %if.else
  call void @reset_parser()
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then12
  br label %while.end

if.end15:                                         ; preds = %if.then10
  %15 = load i32, i32* @current_token, align 4
  %cmp16 = icmp eq i32 %15, 303
  br i1 %cmp16, label %if.then18, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end15
  %16 = load i32, i32* @current_token, align 4
  %17 = load i32, i32* @shell_eof_token, align 4
  %cmp17 = icmp eq i32 %16, %17
  br i1 %cmp17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %lor.lhs.false, %if.end15
  br label %while.end

if.end19:                                         ; preds = %lor.lhs.false
  br label %while.cond

while.end:                                        ; preds = %if.then18, %if.end14, %while.cond
  br label %out

out:                                              ; preds = %while.end, %if.end7
  %18 = load %struct.command*, %struct.command** %oglobal, align 4
  store %struct.command* %18, %struct.command** @global_command, align 4
  %19 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %20 = load i8*, i8** %ostring, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %19 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %20 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %nc, align 4
  %21 = load i8**, i8*** %endp.addr, align 4
  %tobool20 = icmp ne i8** %21, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %out
  %22 = load i8*, i8** bitcast (%union.INPUT_STREAM* getelementptr inbounds (%struct.BASH_INPUT, %struct.BASH_INPUT* @bash_input, i32 0, i32 2) to i8**), align 4
  %23 = load i8**, i8*** %endp.addr, align 4
  store i8* %22, i8** %23, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %out
  call void @run_unwind_frame(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i32 0, i32 0))
  %24 = load volatile i32, i32* %should_jump_to_top_level, align 4
  %tobool23 = icmp ne i32 %24, 0
  br i1 %tobool23, label %if.then24, label %if.end31

if.then24:                                        ; preds = %if.end22
  %25 = load i32, i32* @parse_and_execute_level, align 4
  %cmp25 = icmp eq i32 %25, 0
  br i1 %cmp25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.then24
  call void @top_level_cleanup()
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.then24
  %26 = load i32, i32* %code, align 4
  %cmp28 = icmp eq i32 %26, 2
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end27
  store i32 -2, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %if.end27
  %27 = load i32, i32* %code, align 4
  call void @jump_to_top_level(i32 %27) #5
  unreachable

if.end31:                                         ; preds = %if.end22
  %28 = load i32, i32* %nc, align 4
  store i32 %28, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end31, %if.then29
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

declare void @top_level_cleanup() #1

; Function Attrs: noinline nounwind
define i32 @evalstring(i8* %string, i8* %from_file, i32 %flags) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %from_file.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %rflag = alloca i32, align 4
  %rcatch = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %from_file, i8** %from_file.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store volatile i32 0, i32* %rcatch, align 4
  %0 = load i32, i32* @return_catch_flag, align 4
  store volatile i32 %0, i32* %rflag, align 4
  %1 = load volatile i32, i32* %rflag, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @begin_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
  call void @unwind_protect_mem(i8* bitcast (i32* @return_catch_flag to i8*), i32 4)
  call void @unwind_protect_mem(i8* bitcast ([1 x %struct.__jmp_buf_tag]* @return_catch to i8*), i32 156)
  %2 = load i32, i32* @return_catch_flag, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @return_catch_flag, align 4
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0)) #4
  store volatile i32 %call, i32* %rcatch, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load volatile i32, i32* %rcatch, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  call void @parse_and_execute_cleanup()
  %4 = load i32, i32* @return_catch_value, align 4
  store volatile i32 %4, i32* %r, align 4
  br label %if.end4

if.else:                                          ; preds = %if.end
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i8*, i8** %from_file.addr, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %call3 = call i32 @parse_and_execute(i8* %5, i8* %6, i32 %7)
  store volatile i32 %call3, i32* %r, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  %8 = load volatile i32, i32* %rflag, align 4
  %tobool5 = icmp ne i32 %8, 0
  br i1 %tobool5, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.end4
  call void @run_unwind_frame(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.6, i32 0, i32 0))
  %9 = load volatile i32, i32* %rcatch, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %if.then6
  %10 = load i32, i32* @return_catch_flag, align 4
  %tobool8 = icmp ne i32 %10, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  %11 = load volatile i32, i32* %r, align 4
  store i32 %11, i32* @return_catch_value, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0), i32 1) #5
  unreachable

if.end10:                                         ; preds = %land.lhs.true, %if.then6
  br label %if.end11

if.end11:                                         ; preds = %if.end10, %if.end4
  %12 = load volatile i32, i32* %r, align 4
  ret i32 %12
}

declare void @unwind_protect_mem(i8*, i32) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #3

declare i32 @get_current_prompt_level() #1

declare void @set_current_prompt_level(i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal void @restore_lastcom(i8* %x) #0 {
entry:
  %x.addr = alloca i8*, align 4
  store i8* %x, i8** %x.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** @the_printed_command_except_trap, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** @the_printed_command_except_trap, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 95)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %2 = load i8*, i8** %x.addr, align 4
  store i8* %2, i8** @the_printed_command_except_trap, align 4
  ret void
}

declare void @pop_stream() #1

declare void @parser_restore_alias() #1

declare void @xfree(i8*) #1

declare void @bash_history_disable() #1

; Function Attrs: noinline nounwind
define internal void @set_history_remembering() #0 {
entry:
  %0 = load i32, i32* @enable_history_list, align 4
  store i32 %0, i32* @remember_on_history, align 4
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @redirection_expand(%struct.word_desc*) #1

declare void @redirection_error(%struct.redirect*, i32) #1

declare i32 @open(i8*, i32, ...) #1

declare void @file_error(i8*) #1

declare i32 @zcatfd(i32, i32, i8*) #1

declare i32 @close(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { returns_twice }
attributes #5 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
