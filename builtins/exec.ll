; ModuleID = 'exec.c'
source_filename = "exec.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }

@exec_argv0 = external global i8*, align 4
@.str = private unnamed_addr constant [5 x i8] c"cla:\00", align 1
@list_optarg = external global i8*, align 4
@loptend = external global %struct.word_list*, align 4
@redirection_undo_list = external global %struct.redirect*, align 4
@restricted = external global i32, align 4
@.str.1 = private unnamed_addr constant [23 x i8] c"%s: cannot execute: %s\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"./exec.def\00", align 1
@export_env = external global i8**, align 4
@interactive_shell = external global i32, align 4
@subshell_environment = external global i32, align 4
@interactive = external global i32, align 4
@no_exit_on_failed_exec = common global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @exec_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %exit_value = alloca i32, align 4
  %cleanenv = alloca i32, align 4
  %login = alloca i32, align 4
  %opt = alloca i32, align 4
  %argv0 = alloca i8*, align 4
  %command = alloca i8*, align 4
  %args = alloca i8**, align 4
  %env = alloca i8**, align 4
  %newname = alloca i8*, align 4
  %com2 = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 1, i32* %exit_value, align 4
  store i32 0, i32* %login, align 4
  store i32 0, i32* %cleanenv, align 4
  store i8* null, i8** %argv0, align 4
  store i8* null, i8** @exec_argv0, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 99, label %sw.bb
    i32 108, label %sw.bb1
    i32 97, label %sw.bb2
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %cleanenv, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %login, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  %2 = load i8*, i8** @list_optarg, align 4
  store i8* %2, i8** %argv0, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb2, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %3, %struct.word_list** %list.addr, align 4
  %4 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %4)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp4 = icmp eq %struct.word_list* %5, null
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end
  %6 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @sh_restricted(i8* null)
  store i32 1, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call7 = call i8** @strvec_from_word_list(%struct.word_list* %7, i32 1, i32 0, i32* null)
  store i8** %call7, i8*** %args, align 4
  store i8** null, i8*** %env, align 4
  %8 = load i8**, i8*** %args, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %8, i32 0
  %9 = load i8*, i8** %arrayidx, align 4
  %call8 = call i32 @absolute_program(i8* %9)
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end6
  %10 = load i8**, i8*** %args, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %10, i32 0
  %11 = load i8*, i8** %arrayidx10, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end6
  %12 = load i8**, i8*** %args, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %12, i32 0
  %13 = load i8*, i8** %arrayidx11, align 4
  %call12 = call i8* @search_for_command(i8* %13, i32 1)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %11, %cond.true ], [ %call12, %cond.false ]
  store i8* %cond, i8** %command, align 4
  %14 = load i8*, i8** %command, align 4
  %cmp13 = icmp eq i8* %14, null
  br i1 %cmp13, label %if.then14, label %if.end24

if.then14:                                        ; preds = %cond.end
  %15 = load i8**, i8*** %args, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %15, i32 0
  %16 = load i8*, i8** %arrayidx15, align 4
  %call16 = call i32 @file_isdir(i8* %16)
  %tobool17 = icmp ne i32 %call16, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %if.then14
  %call19 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %17 = load i8**, i8*** %args, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %17, i32 0
  %18 = load i8*, i8** %arrayidx20, align 4
  %call21 = call i8* @strerror(i32 21)
  call void (i8*, ...) @builtin_error(i8* %call19, i8* %18, i8* %call21)
  store i32 126, i32* %exit_value, align 4
  br label %if.end23

if.else:                                          ; preds = %if.then14
  %19 = load i8**, i8*** %args, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %19, i32 0
  %20 = load i8*, i8** %arrayidx22, align 4
  call void @sh_notfound(i8* %20)
  store i32 127, i32* %exit_value, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.else, %if.then18
  br label %failed_exec

if.end24:                                         ; preds = %cond.end
  %21 = load i8*, i8** %command, align 4
  %call25 = call i8* @full_pathname(i8* %21)
  store i8* %call25, i8** %com2, align 4
  %22 = load i8*, i8** %com2, align 4
  %tobool26 = icmp ne i8* %22, null
  br i1 %tobool26, label %if.then27, label %if.end32

if.then27:                                        ; preds = %if.end24
  %23 = load i8*, i8** %command, align 4
  %24 = load i8**, i8*** %args, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %24, i32 0
  %25 = load i8*, i8** %arrayidx28, align 4
  %cmp29 = icmp ne i8* %23, %25
  br i1 %cmp29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.then27
  %26 = load i8*, i8** %command, align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 174)
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.then27
  %27 = load i8*, i8** %com2, align 4
  store i8* %27, i8** %command, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end24
  %28 = load i8*, i8** %argv0, align 4
  %tobool33 = icmp ne i8* %28, null
  br i1 %tobool33, label %if.then34, label %if.else52

if.then34:                                        ; preds = %if.end32
  %29 = load i8**, i8*** %args, align 4
  %arrayidx35 = getelementptr inbounds i8*, i8** %29, i32 0
  %30 = load i8*, i8** %arrayidx35, align 4
  call void @sh_xfree(i8* %30, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 180)
  %31 = load i32, i32* %login, align 4
  %tobool36 = icmp ne i32 %31, 0
  br i1 %tobool36, label %cond.true37, label %cond.false39

cond.true37:                                      ; preds = %if.then34
  %32 = load i8*, i8** %argv0, align 4
  %call38 = call i8* @mkdashname(i8* %32)
  br label %cond.end43

cond.false39:                                     ; preds = %if.then34
  %33 = load i8*, i8** %argv0, align 4
  %call40 = call i32 @strlen(i8* %33)
  %add = add i32 1, %call40
  %call41 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 181)
  %34 = load i8*, i8** %argv0, align 4
  %call42 = call i8* @strcpy(i8* %call41, i8* %34)
  br label %cond.end43

cond.end43:                                       ; preds = %cond.false39, %cond.true37
  %cond44 = phi i8* [ %call38, %cond.true37 ], [ %call42, %cond.false39 ]
  %35 = load i8**, i8*** %args, align 4
  %arrayidx45 = getelementptr inbounds i8*, i8** %35, i32 0
  store i8* %cond44, i8** %arrayidx45, align 4
  %36 = load i8**, i8*** %args, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %36, i32 0
  %37 = load i8*, i8** %arrayidx46, align 4
  %call47 = call i32 @strlen(i8* %37)
  %add48 = add i32 1, %call47
  %call49 = call i8* @sh_xmalloc(i32 %add48, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 182)
  %38 = load i8**, i8*** %args, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %38, i32 0
  %39 = load i8*, i8** %arrayidx50, align 4
  %call51 = call i8* @strcpy(i8* %call49, i8* %39)
  store i8* %call51, i8** @exec_argv0, align 4
  br label %if.end60

if.else52:                                        ; preds = %if.end32
  %40 = load i32, i32* %login, align 4
  %tobool53 = icmp ne i32 %40, 0
  br i1 %tobool53, label %if.then54, label %if.end59

if.then54:                                        ; preds = %if.else52
  %41 = load i8**, i8*** %args, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %41, i32 0
  %42 = load i8*, i8** %arrayidx55, align 4
  %call56 = call i8* @mkdashname(i8* %42)
  store i8* %call56, i8** %newname, align 4
  %43 = load i8**, i8*** %args, align 4
  %arrayidx57 = getelementptr inbounds i8*, i8** %43, i32 0
  %44 = load i8*, i8** %arrayidx57, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 187)
  %45 = load i8*, i8** %newname, align 4
  %46 = load i8**, i8*** %args, align 4
  %arrayidx58 = getelementptr inbounds i8*, i8** %46, i32 0
  store i8* %45, i8** %arrayidx58, align 4
  br label %if.end59

if.end59:                                         ; preds = %if.then54, %if.else52
  br label %if.end60

if.end60:                                         ; preds = %if.end59, %cond.end43
  %47 = load i32, i32* %cleanenv, align 4
  %cmp61 = icmp eq i32 %47, 0
  br i1 %cmp61, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.end60
  call void @adjust_shell_level(i32 -1)
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.end60
  %48 = load i32, i32* %cleanenv, align 4
  %tobool64 = icmp ne i32 %48, 0
  br i1 %tobool64, label %if.then65, label %if.else68

if.then65:                                        ; preds = %if.end63
  %call66 = call i8** @strvec_create(i32 1)
  store i8** %call66, i8*** %env, align 4
  %49 = load i8**, i8*** %env, align 4
  %arrayidx67 = getelementptr inbounds i8*, i8** %49, i32 0
  store i8* null, i8** %arrayidx67, align 4
  br label %if.end69

if.else68:                                        ; preds = %if.end63
  call void @maybe_make_export_env()
  %50 = load i8**, i8*** @export_env, align 4
  store i8** %50, i8*** %env, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.else68, %if.then65
  %51 = load i32, i32* @interactive_shell, align 4
  %tobool70 = icmp ne i32 %51, 0
  br i1 %tobool70, label %land.lhs.true, label %if.end74

land.lhs.true:                                    ; preds = %if.end69
  %52 = load i32, i32* @subshell_environment, align 4
  %cmp71 = icmp eq i32 %52, 0
  br i1 %cmp71, label %if.then72, label %if.end74

if.then72:                                        ; preds = %land.lhs.true
  %call73 = call i32 @maybe_save_shell_history()
  br label %if.end74

if.end74:                                         ; preds = %if.then72, %land.lhs.true, %if.end69
  call void @restore_original_signals()
  %53 = load i8*, i8** %command, align 4
  %54 = load i8**, i8*** %args, align 4
  %55 = load i8**, i8*** %env, align 4
  %call75 = call i32 @shell_execve(i8* %53, i8** %54, i8** %55)
  store i32 %call75, i32* %exit_value, align 4
  store i8** null, i8*** %args, align 4
  %56 = load i32, i32* %cleanenv, align 4
  %cmp76 = icmp eq i32 %56, 0
  br i1 %cmp76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end74
  call void @adjust_shell_level(i32 1)
  br label %if.end78

if.end78:                                         ; preds = %if.then77, %if.end74
  %57 = load i32, i32* %exit_value, align 4
  %cmp79 = icmp eq i32 %57, 127
  br i1 %cmp79, label %if.then80, label %if.else81

if.then80:                                        ; preds = %if.end78
  br label %failed_exec

if.else81:                                        ; preds = %if.end78
  %58 = load i8*, i8** %command, align 4
  %call82 = call i32 @executable_file(i8* %58)
  %cmp83 = icmp eq i32 %call82, 0
  br i1 %cmp83, label %if.then84, label %if.else88

if.then84:                                        ; preds = %if.else81
  %call85 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %59 = load i8*, i8** %command, align 4
  %call86 = call i32* @__errno_location()
  %60 = load i32, i32* %call86, align 4
  %call87 = call i8* @strerror(i32 %60)
  call void (i8*, ...) @builtin_error(i8* %call85, i8* %59, i8* %call87)
  store i32 126, i32* %exit_value, align 4
  br label %if.end89

if.else88:                                        ; preds = %if.else81
  %61 = load i8*, i8** %command, align 4
  call void @file_error(i8* %61)
  br label %if.end89

if.end89:                                         ; preds = %if.else88, %if.then84
  br label %if.end90

if.end90:                                         ; preds = %if.end89
  br label %failed_exec

failed_exec:                                      ; preds = %if.end90, %if.then80, %if.end23
  br label %do.body

do.body:                                          ; preds = %failed_exec
  %62 = load i8*, i8** %command, align 4
  %tobool91 = icmp ne i8* %62, null
  br i1 %tobool91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %do.body
  %63 = load i8*, i8** %command, align 4
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 242)
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end93
  %64 = load i32, i32* @subshell_environment, align 4
  %tobool94 = icmp ne i32 %64, 0
  br i1 %tobool94, label %if.then98, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end
  %65 = load i32, i32* @interactive, align 4
  %cmp95 = icmp eq i32 %65, 0
  br i1 %cmp95, label %land.lhs.true96, label %if.end99

land.lhs.true96:                                  ; preds = %lor.lhs.false
  %66 = load i32, i32* @no_exit_on_failed_exec, align 4
  %cmp97 = icmp eq i32 %66, 0
  br i1 %cmp97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %land.lhs.true96, %do.end
  %67 = load i32, i32* %exit_value, align 4
  call void @exit_shell(i32 %67) #3
  unreachable

if.end99:                                         ; preds = %land.lhs.true96, %lor.lhs.false
  %68 = load i8**, i8*** %args, align 4
  %tobool100 = icmp ne i8** %68, null
  br i1 %tobool100, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end99
  %69 = load i8**, i8*** %args, align 4
  call void @strvec_dispose(i8** %69)
  br label %if.end102

if.end102:                                        ; preds = %if.then101, %if.end99
  %70 = load i8**, i8*** %env, align 4
  %tobool103 = icmp ne i8** %70, null
  br i1 %tobool103, label %land.lhs.true104, label %if.end107

land.lhs.true104:                                 ; preds = %if.end102
  %71 = load i8**, i8*** %env, align 4
  %72 = load i8**, i8*** @export_env, align 4
  %cmp105 = icmp ne i8** %71, %72
  br i1 %cmp105, label %if.then106, label %if.end107

if.then106:                                       ; preds = %land.lhs.true104
  %73 = load i8**, i8*** %env, align 4
  call void @strvec_dispose(i8** %73)
  br label %if.end107

if.end107:                                        ; preds = %if.then106, %land.lhs.true104, %if.end102
  call void @initialize_traps()
  call void @initialize_signals(i32 1)
  %74 = load i32, i32* %exit_value, align 4
  store i32 %74, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end107, %if.then5, %if.then, %sw.default, %sw.bb3
  %75 = load i32, i32* %retval, align 4
  ret i32 %75
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @dispose_redirects(%struct.redirect*) #1

declare void @sh_restricted(i8*) #1

declare i8** @strvec_from_word_list(%struct.word_list*, i32, i32, i32*) #1

declare i32 @absolute_program(i8*) #1

declare i8* @search_for_command(i8*, i32) #1

declare i32 @file_isdir(i8*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @strerror(i32) #1

declare void @sh_notfound(i8*) #1

declare i8* @full_pathname(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @mkdashname(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 2, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 91)
  store i8* %call1, i8** %ret, align 4
  %1 = load i8*, i8** %ret, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  store i8 45, i8* %arrayidx, align 1
  %2 = load i8*, i8** %ret, align 4
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8*, i8** %name.addr, align 4
  %call2 = call i8* @strcpy(i8* %add.ptr, i8* %3)
  %4 = load i8*, i8** %ret, align 4
  ret i8* %4
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare void @adjust_shell_level(i32) #1

declare i8** @strvec_create(i32) #1

declare void @maybe_make_export_env() #1

declare i32 @maybe_save_shell_history() #1

declare void @restore_original_signals() #1

declare i32 @shell_execve(i8*, i8**, i8**) #1

declare i32 @executable_file(i8*) #1

declare i32* @__errno_location() #1

declare void @file_error(i8*) #1

; Function Attrs: noreturn
declare void @exit_shell(i32) #2

declare void @strvec_dispose(i8**) #1

declare void @initialize_traps() #1

declare void @initialize_signals(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
