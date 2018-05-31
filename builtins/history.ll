; ModuleID = 'history.c'
source_filename = "history.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._IO_FILE = type opaque
%struct._hist_entry = type { i8*, i8*, i8* }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [10 x i8] c"acd:npsrw\00", align 1
@list_optarg = external global i8*, align 4
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [34 x i8] c"cannot use more than one of -anrw\00", align 1
@history_base = external global i32, align 4
@history_length = external global i32, align 4
@.str.2 = private unnamed_addr constant [17 x i8] c"history position\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"HISTFILE\00", align 1
@history_lines_read_from_file = external global i32, align 4
@history_lines_in_file = external global i32, align 4
@force_append_history = external global i32, align 4
@history_lines_this_session = external global i32, align 4
@.str.4 = private unnamed_addr constant [15 x i8] c"HISTTIMEFORMAT\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@.str.5 = private unnamed_addr constant [12 x i8] c"%5d%c %s%s\0A\00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@histtime.timestr = internal global [128 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"%s: invalid timestamp\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"??\00", align 1
@remember_on_history = external global i32, align 4
@hist_last_line_pushed = external global i32, align 4
@hist_last_line_added = external global i32, align 4
@current_command_line_count = external global i32, align 4
@current_command_first_line_saved = external global i32, align 4
@command_oriented_history = external global i32, align 4
@.str.9 = private unnamed_addr constant [14 x i8] c"./history.def\00", align 1
@.str.10 = private unnamed_addr constant [29 x i8] c"%s: history expansion failed\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define i32 @history_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %flags = alloca i32, align 4
  %opt = alloca i32, align 4
  %result = alloca i32, align 4
  %old_history_lines = alloca i32, align 4
  %obase = alloca i32, align 4
  %filename = alloca i8*, align 4
  %delete_arg = alloca i8*, align 4
  %delete_offset = alloca i64, align 8
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %flags, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 97, label %sw.bb
    i32 99, label %sw.bb1
    i32 110, label %sw.bb3
    i32 114, label %sw.bb5
    i32 119, label %sw.bb7
    i32 115, label %sw.bb9
    i32 100, label %sw.bb11
    i32 112, label %sw.bb13
    i32 -99, label %sw.bb15
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 1
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %3 = load i32, i32* %flags, align 4
  %or2 = or i32 %3, 64
  store i32 %or2, i32* %flags, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  %4 = load i32, i32* %flags, align 4
  %or4 = or i32 %4, 8
  store i32 %or4, i32* %flags, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  %5 = load i32, i32* %flags, align 4
  %or6 = or i32 %5, 2
  store i32 %or6, i32* %flags, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %6 = load i32, i32* %flags, align 4
  %or8 = or i32 %6, 4
  store i32 %or8, i32* %flags, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  %7 = load i32, i32* %flags, align 4
  %or10 = or i32 %7, 16
  store i32 %or10, i32* %flags, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  %8 = load i32, i32* %flags, align 4
  %or12 = or i32 %8, 128
  store i32 %or12, i32* %flags, align 4
  %9 = load i8*, i8** @list_optarg, align 4
  store i8* %9, i8** %delete_arg, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %while.body
  %10 = load i32, i32* %flags, align 4
  %or14 = or i32 %10, 32
  store i32 %or14, i32* %flags, align 4
  br label %sw.epilog

sw.bb15:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %11 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %11, %struct.word_list** %list.addr, align 4
  %12 = load i32, i32* %flags, align 4
  %and = and i32 %12, 15
  store i32 %and, i32* %opt, align 4
  %13 = load i32, i32* %opt, align 4
  %tobool = icmp ne i32 %13, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %14 = load i32, i32* %opt, align 4
  %cmp16 = icmp ne i32 %14, 1
  br i1 %cmp16, label %land.lhs.true17, label %if.end

land.lhs.true17:                                  ; preds = %land.lhs.true
  %15 = load i32, i32* %opt, align 4
  %cmp18 = icmp ne i32 %15, 2
  br i1 %cmp18, label %land.lhs.true19, label %if.end

land.lhs.true19:                                  ; preds = %land.lhs.true17
  %16 = load i32, i32* %opt, align 4
  %cmp20 = icmp ne i32 %16, 4
  br i1 %cmp20, label %land.lhs.true21, label %if.end

land.lhs.true21:                                  ; preds = %land.lhs.true19
  %17 = load i32, i32* %opt, align 4
  %cmp22 = icmp ne i32 %17, 8
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true21
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call23)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true21, %land.lhs.true19, %land.lhs.true17, %land.lhs.true, %while.end
  %18 = load i32, i32* %flags, align 4
  %and24 = and i32 %18, 64
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then26, label %if.end30

if.then26:                                        ; preds = %if.end
  call void @bash_clear_history()
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp27 = icmp eq %struct.word_list* %19, null
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.then26
  store i32 0, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %if.then26
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.end
  %20 = load i32, i32* %flags, align 4
  %and31 = and i32 %20, 16
  %tobool32 = icmp ne i32 %and31, 0
  br i1 %tobool32, label %if.then33, label %if.else

if.then33:                                        ; preds = %if.end30
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool34 = icmp ne %struct.word_list* %21, null
  br i1 %tobool34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.then33
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  call void @push_history(%struct.word_list* %22)
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.then33
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end30
  %23 = load i32, i32* %flags, align 4
  %and37 = and i32 %23, 32
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.else45

if.then39:                                        ; preds = %if.else
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool40 = icmp ne %struct.word_list* %24, null
  br i1 %tobool40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then39
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call42 = call i32 @expand_and_print_history(%struct.word_list* %25)
  store i32 %call42, i32* %retval, align 4
  br label %return

if.end43:                                         ; preds = %if.then39
  %call44 = call i32 @sh_chkwrite(i32 0)
  store i32 %call44, i32* %retval, align 4
  br label %return

if.else45:                                        ; preds = %if.else
  %26 = load i32, i32* %flags, align 4
  %and46 = and i32 %26, 128
  %tobool47 = icmp ne i32 %and46, 0
  br i1 %tobool47, label %if.then48, label %if.else69

if.then48:                                        ; preds = %if.else45
  %27 = load i8*, i8** %delete_arg, align 4
  %call49 = call i32 @legal_number(i8* %27, i64* %delete_offset)
  %cmp50 = icmp eq i32 %call49, 0
  br i1 %cmp50, label %if.then57, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then48
  %28 = load i64, i64* %delete_offset, align 8
  %29 = load i32, i32* @history_base, align 4
  %conv = sext i32 %29 to i64
  %cmp51 = icmp slt i64 %28, %conv
  br i1 %cmp51, label %if.then57, label %lor.lhs.false53

lor.lhs.false53:                                  ; preds = %lor.lhs.false
  %30 = load i64, i64* %delete_offset, align 8
  %31 = load i32, i32* @history_base, align 4
  %32 = load i32, i32* @history_length, align 4
  %add = add nsw i32 %31, %32
  %conv54 = sext i32 %add to i64
  %cmp55 = icmp sgt i64 %30, %conv54
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %lor.lhs.false53, %lor.lhs.false, %if.then48
  %33 = load i8*, i8** %delete_arg, align 4
  %call58 = call i8* @libintl_gettext(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0))
  call void @sh_erange(i8* %33, i8* %call58)
  store i32 1, i32* %retval, align 4
  br label %return

if.end59:                                         ; preds = %lor.lhs.false53
  %34 = load i64, i64* %delete_offset, align 8
  %conv60 = trunc i64 %34 to i32
  store i32 %conv60, i32* %opt, align 4
  %35 = load i32, i32* %opt, align 4
  %36 = load i32, i32* @history_base, align 4
  %sub = sub nsw i32 %35, %36
  %call61 = call i32 @bash_delete_histent(i32 %sub)
  store i32 %call61, i32* %result, align 4
  %call62 = call i32 @where_history()
  %37 = load i32, i32* @history_length, align 4
  %cmp63 = icmp sgt i32 %call62, %37
  br i1 %cmp63, label %if.then65, label %if.end67

if.then65:                                        ; preds = %if.end59
  %38 = load i32, i32* @history_length, align 4
  %call66 = call i32 @history_set_pos(i32 %38)
  br label %if.end67

if.end67:                                         ; preds = %if.then65, %if.end59
  %39 = load i32, i32* %result, align 4
  %tobool68 = icmp ne i32 %39, 0
  %cond = select i1 %tobool68, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else69:                                        ; preds = %if.else45
  %40 = load i32, i32* %flags, align 4
  %and70 = and i32 %40, 79
  %cmp71 = icmp eq i32 %and70, 0
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %if.else69
  %41 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call74 = call i32 @display_history(%struct.word_list* %41)
  store i32 %call74, i32* %result, align 4
  %42 = load i32, i32* %result, align 4
  %call75 = call i32 @sh_chkwrite(i32 %42)
  store i32 %call75, i32* %retval, align 4
  br label %return

if.end76:                                         ; preds = %if.else69
  br label %if.end77

if.end77:                                         ; preds = %if.end76
  br label %if.end78

if.end78:                                         ; preds = %if.end77
  br label %if.end79

if.end79:                                         ; preds = %if.end78
  %43 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool80 = icmp ne %struct.word_list* %43, null
  br i1 %tobool80, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end79
  %44 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %44, i32 0, i32 1
  %45 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word81 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %45, i32 0, i32 0
  %46 = load i8*, i8** %word81, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end79
  %call82 = call i8* @get_string_value(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond83 = phi i8* [ %46, %cond.true ], [ %call82, %cond.false ]
  store i8* %cond83, i8** %filename, align 4
  store i32 0, i32* %result, align 4
  %47 = load i32, i32* %flags, align 4
  %and84 = and i32 %47, 1
  %tobool85 = icmp ne i32 %and84, 0
  br i1 %tobool85, label %if.then86, label %if.else88

if.then86:                                        ; preds = %cond.end
  %48 = load i8*, i8** %filename, align 4
  %call87 = call i32 @maybe_append_history(i8* %48)
  store i32 %call87, i32* %result, align 4
  br label %if.end114

if.else88:                                        ; preds = %cond.end
  %49 = load i32, i32* %flags, align 4
  %and89 = and i32 %49, 4
  %tobool90 = icmp ne i32 %and89, 0
  br i1 %tobool90, label %if.then91, label %if.else93

if.then91:                                        ; preds = %if.else88
  %50 = load i8*, i8** %filename, align 4
  %call92 = call i32 @write_history(i8* %50)
  store i32 %call92, i32* %result, align 4
  br label %if.end113

if.else93:                                        ; preds = %if.else88
  %51 = load i32, i32* %flags, align 4
  %and94 = and i32 %51, 2
  %tobool95 = icmp ne i32 %and94, 0
  br i1 %tobool95, label %if.then96, label %if.else98

if.then96:                                        ; preds = %if.else93
  %52 = load i8*, i8** %filename, align 4
  %call97 = call i32 @read_history(i8* %52)
  store i32 %call97, i32* %result, align 4
  %53 = load i32, i32* @history_lines_read_from_file, align 4
  store i32 %53, i32* @history_lines_in_file, align 4
  br label %if.end112

if.else98:                                        ; preds = %if.else93
  %54 = load i32, i32* %flags, align 4
  %and99 = and i32 %54, 8
  %tobool100 = icmp ne i32 %and99, 0
  br i1 %tobool100, label %if.then101, label %if.end111

if.then101:                                       ; preds = %if.else98
  %55 = load i32, i32* @history_lines_in_file, align 4
  store i32 %55, i32* %old_history_lines, align 4
  %56 = load i32, i32* @history_base, align 4
  store i32 %56, i32* %obase, align 4
  call void @using_history()
  %57 = load i8*, i8** %filename, align 4
  %58 = load i32, i32* @history_lines_in_file, align 4
  %call102 = call i32 @read_history_range(i8* %57, i32 %58, i32 -1)
  store i32 %call102, i32* %result, align 4
  call void @using_history()
  %59 = load i32, i32* @history_lines_read_from_file, align 4
  store i32 %59, i32* @history_lines_in_file, align 4
  %60 = load i32, i32* @force_append_history, align 4
  %cmp103 = icmp eq i32 %60, 0
  br i1 %cmp103, label %if.then105, label %if.end110

if.then105:                                       ; preds = %if.then101
  %61 = load i32, i32* @history_lines_in_file, align 4
  %62 = load i32, i32* %old_history_lines, align 4
  %sub106 = sub nsw i32 %61, %62
  %63 = load i32, i32* @history_base, align 4
  %add107 = add nsw i32 %sub106, %63
  %64 = load i32, i32* %obase, align 4
  %sub108 = sub nsw i32 %add107, %64
  %65 = load i32, i32* @history_lines_this_session, align 4
  %add109 = add nsw i32 %65, %sub108
  store i32 %add109, i32* @history_lines_this_session, align 4
  br label %if.end110

if.end110:                                        ; preds = %if.then105, %if.then101
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %if.else98
  br label %if.end112

if.end112:                                        ; preds = %if.end111, %if.then96
  br label %if.end113

if.end113:                                        ; preds = %if.end112, %if.then91
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %if.then86
  %66 = load i32, i32* %result, align 4
  %tobool115 = icmp ne i32 %66, 0
  %cond116 = select i1 %tobool115, i32 1, i32 0
  store i32 %cond116, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end114, %if.then73, %if.end67, %if.then57, %if.end43, %if.then41, %if.end36, %if.then28, %if.then, %sw.default, %sw.bb15
  %67 = load i32, i32* %retval, align 4
  ret i32 %67
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @bash_clear_history() #1

; Function Attrs: noinline nounwind
define internal void @push_history(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %s = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @remember_on_history, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @hist_last_line_pushed, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @hist_last_line_added, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %land.lhs.true8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true1
  %3 = load i32, i32* @current_command_line_count, align 4
  %cmp3 = icmp sgt i32 %3, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %lor.lhs.false
  %4 = load i32, i32* @current_command_first_line_saved, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %land.lhs.true6, label %if.end

land.lhs.true6:                                   ; preds = %land.lhs.true4
  %5 = load i32, i32* @command_oriented_history, align 4
  %tobool7 = icmp ne i32 %5, 0
  br i1 %tobool7, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true6, %land.lhs.true1
  %call = call i32 @bash_delete_last_history()
  %cmp9 = icmp eq i32 %call, 0
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  br label %return

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true6, %land.lhs.true4, %lor.lhs.false, %land.lhs.true, %entry
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call10 = call i8* @string_list(%struct.word_list* %6)
  store i8* %call10, i8** %s, align 4
  %7 = load i8*, i8** %s, align 4
  %call11 = call i32 @check_add_history(i8* %7, i32 1)
  store i32 1, i32* @hist_last_line_pushed, align 4
  %8 = load i8*, i8** %s, align 4
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i32 356)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @expand_and_print_history(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %s = alloca i8*, align 4
  %r = alloca i32, align 4
  %result = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @hist_last_line_pushed, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @hist_last_line_added, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %call = call i32 @bash_delete_last_history()
  %cmp2 = icmp eq i32 %call, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true1, %land.lhs.true, %entry
  store i32 0, i32* %result, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %if.end
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool3 = icmp ne %struct.word_list* %2, null
  br i1 %tobool3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %call5 = call i32 @history_expand(i8* %5, i8** %s)
  store i32 %call5, i32* %r, align 4
  %6 = load i32, i32* %r, align 4
  %cmp6 = icmp slt i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %while.body
  %call8 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.10, i32 0, i32 0))
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word9 = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 1
  %8 = load %struct.word_desc*, %struct.word_desc** %word9, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %8, i32 0, i32 0
  %9 = load i8*, i8** %word10, align 4
  call void (i8*, ...) @builtin_error(i8* %call8, i8* %9)
  store i32 1, i32* %result, align 4
  br label %if.end13

if.else:                                          ; preds = %while.body
  %10 = load i8*, i8** %s, align 4
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call11 = call i32 @fputs(i8* %10, %struct._IO_FILE* %11)
  %call12 = call i32 @putchar(i32 10)
  br label %if.end13

if.end13:                                         ; preds = %if.else, %if.then7
  br label %do.body

do.body:                                          ; preds = %if.end13
  %12 = load i8*, i8** %s, align 4
  %tobool14 = icmp ne i8* %12, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.body
  %13 = load i8*, i8** %s, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0), i32 383)
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end16
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 0
  %15 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %15, %struct.word_list** %list.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call17 = call i32 @fflush(%struct._IO_FILE* %16)
  %17 = load i32, i32* %result, align 4
  store i32 %17, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

declare i32 @sh_chkwrite(i32) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @sh_erange(i8*, i8*) #1

declare i32 @bash_delete_histent(i32) #1

declare i32 @where_history() #1

declare i32 @history_set_pos(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @display_history(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %limit = alloca i64, align 8
  %hlist = alloca %struct._hist_entry**, align 4
  %histtimefmt = alloca i8*, align 4
  %timestr = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @get_numeric_arg(%struct.word_list* %1, i32 0, i64* %limit)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %2 = load i64, i64* %limit, align 8
  %cmp2 = icmp slt i64 %2, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %3 = load i64, i64* %limit, align 8
  %sub = sub nsw i64 0, %3
  store i64 %sub, i64* %limit, align 8
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  br label %if.end5

if.else:                                          ; preds = %entry
  store i64 -1, i64* %limit, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.end4
  %call6 = call %struct._hist_entry** @history_list()
  store %struct._hist_entry** %call6, %struct._hist_entry*** %hlist, align 4
  %4 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %tobool7 = icmp ne %struct._hist_entry** %4, null
  br i1 %tobool7, label %if.then8, label %if.end48

if.then8:                                         ; preds = %if.end5
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then8
  %5 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %5, i32 %6
  %7 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx, align 4
  %tobool9 = icmp ne %struct._hist_entry* %7, null
  br i1 %tobool9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load i64, i64* %limit, align 8
  %cmp10 = icmp sle i64 0, %9
  br i1 %cmp10, label %land.lhs.true, label %if.else17

land.lhs.true:                                    ; preds = %for.end
  %10 = load i64, i64* %limit, align 8
  %11 = load i32, i32* %i, align 4
  %conv = sext i32 %11 to i64
  %cmp11 = icmp slt i64 %10, %conv
  br i1 %cmp11, label %if.then13, label %if.else17

if.then13:                                        ; preds = %land.lhs.true
  %12 = load i64, i64* %limit, align 8
  %13 = load i32, i32* %i, align 4
  %conv14 = sext i32 %13 to i64
  %sub15 = sub nsw i64 %conv14, %12
  %conv16 = trunc i64 %sub15 to i32
  store i32 %conv16, i32* %i, align 4
  br label %if.end18

if.else17:                                        ; preds = %land.lhs.true, %for.end
  store i32 0, i32* %i, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else17, %if.then13
  %call19 = call i8* @get_string_value(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call19, i8** %histtimefmt, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end43, %if.end18
  %14 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx20 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %14, i32 %15
  %16 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx20, align 4
  %tobool21 = icmp ne %struct._hist_entry* %16, null
  br i1 %tobool21, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %do.body

do.body:                                          ; preds = %while.body
  %17 = load volatile i32, i32* @terminating_signal, align 4
  %tobool22 = icmp ne i32 %17, 0
  br i1 %tobool22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %do.body
  %18 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %18)
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %do.body
  %19 = load volatile i32, i32* @interrupt_state, align 4
  %tobool25 = icmp ne i32 %19, 0
  br i1 %tobool25, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end24
  call void @throw_to_top_level()
  br label %if.end27

if.end27:                                         ; preds = %if.then26, %if.end24
  br label %do.end

do.end:                                           ; preds = %if.end27
  %20 = load i8*, i8** %histtimefmt, align 4
  %tobool28 = icmp ne i8* %20, null
  br i1 %tobool28, label %land.lhs.true29, label %cond.false

land.lhs.true29:                                  ; preds = %do.end
  %21 = load i8*, i8** %histtimefmt, align 4
  %22 = load i8, i8* %21, align 1
  %conv30 = sext i8 %22 to i32
  %tobool31 = icmp ne i32 %conv30, 0
  br i1 %tobool31, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true29
  %23 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %23, i32 %24
  %25 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx32, align 4
  %26 = load i8*, i8** %histtimefmt, align 4
  %call33 = call i8* @histtime(%struct._hist_entry* %25, i8* %26)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true29, %do.end
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call33, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %timestr, align 4
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* @history_base, align 4
  %add = add nsw i32 %27, %28
  %29 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %30 = load i32, i32* %i, align 4
  %arrayidx34 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %29, i32 %30
  %31 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx34, align 4
  %data = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %31, i32 0, i32 2
  %32 = load i8*, i8** %data, align 4
  %tobool35 = icmp ne i8* %32, null
  %cond36 = select i1 %tobool35, i32 42, i32 32
  %33 = load i8*, i8** %timestr, align 4
  %tobool37 = icmp ne i8* %33, null
  br i1 %tobool37, label %land.lhs.true38, label %cond.false42

land.lhs.true38:                                  ; preds = %cond.end
  %34 = load i8*, i8** %timestr, align 4
  %35 = load i8, i8* %34, align 1
  %conv39 = sext i8 %35 to i32
  %tobool40 = icmp ne i32 %conv39, 0
  br i1 %tobool40, label %cond.true41, label %cond.false42

cond.true41:                                      ; preds = %land.lhs.true38
  %36 = load i8*, i8** %timestr, align 4
  br label %cond.end43

cond.false42:                                     ; preds = %land.lhs.true38, %cond.end
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false42, %cond.true41
  %cond44 = phi i8* [ %36, %cond.true41 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0), %cond.false42 ]
  %37 = load %struct._hist_entry**, %struct._hist_entry*** %hlist, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx45 = getelementptr inbounds %struct._hist_entry*, %struct._hist_entry** %37, i32 %38
  %39 = load %struct._hist_entry*, %struct._hist_entry** %arrayidx45, align 4
  %line = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %39, i32 0, i32 0
  %40 = load i8*, i8** %line, align 4
  %call46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 %add, i32 %cond36, i8* %cond44, i8* %40)
  %41 = load i32, i32* %i, align 4
  %inc47 = add nsw i32 %41, 1
  store i32 %inc47, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end48

if.end48:                                         ; preds = %while.end, %if.end5
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end48, %if.then1
  %42 = load i32, i32* %retval, align 4
  ret i32 %42
}

declare i8* @get_string_value(i8*) #1

declare i32 @maybe_append_history(i8*) #1

declare i32 @write_history(i8*) #1

declare i32 @read_history(i8*) #1

declare void @using_history() #1

declare i32 @read_history_range(i8*, i32, i32) #1

declare i32 @get_numeric_arg(%struct.word_list*, i32, i64*) #1

declare %struct._hist_entry** @history_list() #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

; Function Attrs: noinline nounwind
define internal i8* @histtime(%struct._hist_entry* %hlist, i8* %histtimefmt) #0 {
entry:
  %hlist.addr = alloca %struct._hist_entry*, align 4
  %histtimefmt.addr = alloca i8*, align 4
  %t = alloca i32, align 4
  store %struct._hist_entry* %hlist, %struct._hist_entry** %hlist.addr, align 4
  store i8* %histtimefmt, i8** %histtimefmt.addr, align 4
  %0 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %call = call i32 @history_get_time(%struct._hist_entry* %0)
  store i32 %call, i32* %t, align 4
  %1 = load i32, i32* %t, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %histtimefmt.addr, align 4
  %call1 = call %struct.tm* @localtime(i32* %t)
  %call2 = call i32 @strftime(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @histtime.timestr, i32 0, i32 0), i32 128, i8* %2, %struct.tm* %call1)
  br label %if.end17

if.else:                                          ; preds = %entry
  %3 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %timestamp = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %3, i32 0, i32 1
  %4 = load i8*, i8** %timestamp, align 4
  %tobool3 = icmp ne i8* %4, null
  br i1 %tobool3, label %land.lhs.true, label %if.else15

land.lhs.true:                                    ; preds = %if.else
  %5 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %timestamp4 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %5, i32 0, i32 1
  %6 = load i8*, i8** %timestamp4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %tobool5 = icmp ne i32 %conv, 0
  br i1 %tobool5, label %if.then6, label %if.else15

if.then6:                                         ; preds = %land.lhs.true
  %call7 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i32 0, i32 0))
  %8 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %timestamp8 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %8, i32 0, i32 1
  %9 = load i8*, i8** %timestamp8, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %10 to i32
  %cmp = icmp eq i32 %conv10, 35
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  %11 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %timestamp12 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %11, i32 0, i32 1
  %12 = load i8*, i8** %timestamp12, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 1
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  %13 = load %struct._hist_entry*, %struct._hist_entry** %hlist.addr, align 4
  %timestamp13 = getelementptr inbounds %struct._hist_entry, %struct._hist_entry* %13, i32 0, i32 1
  %14 = load i8*, i8** %timestamp13, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %add.ptr, %cond.true ], [ %14, %cond.false ]
  %call14 = call i32 (i8*, i32, i8*, ...) @snprintf(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @histtime.timestr, i32 0, i32 0), i32 128, i8* %call7, i8* %cond)
  br label %if.end

if.else15:                                        ; preds = %land.lhs.true, %if.else
  %call16 = call i8* @strcpy(i8* getelementptr inbounds ([128 x i8], [128 x i8]* @histtime.timestr, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else15, %cond.end
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  ret i8* getelementptr inbounds ([128 x i8], [128 x i8]* @histtime.timestr, i32 0, i32 0)
}

declare i32 @printf(i8*, ...) #1

declare i32 @history_get_time(%struct._hist_entry*) #1

declare i32 @strftime(i8*, i32, i8*, %struct.tm*) #1

declare %struct.tm* @localtime(i32*) #1

declare i32 @snprintf(i8*, i32, i8*, ...) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @bash_delete_last_history() #1

declare i8* @string_list(%struct.word_list*) #1

declare i32 @check_add_history(i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @history_expand(i8*, i8**) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i32 @putchar(i32) #1

declare i32 @fflush(%struct._IO_FILE*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
