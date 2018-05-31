; ModuleID = 'redir.c'
source_filename = "redir.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%struct._IO_FILE = type opaque
%struct.STRING_INT_ALIST = type { i8*, i32 }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@.str = private unnamed_addr constant [8 x i8] c"redir.c\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"file descriptor out of range\00", align 1
@posixly_correct = external global i32, align 4
@interactive_shell = external global i32, align 4
@.str.2 = private unnamed_addr constant [23 x i8] c"%s: ambiguous redirect\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"%s: cannot overwrite existing file\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"%s: restricted: cannot redirect output\00", align 1
@.str.5 = private unnamed_addr constant [46 x i8] c"cannot create temp file for here-document: %s\00", align 1
@heredoc_errno = internal global i32 0, align 4
@.str.6 = private unnamed_addr constant [33 x i8] c"%s: cannot assign fd to variable\00", align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@redirection_undo_list = external global %struct.redirect*, align 4
@exec_redirection_undo_list = external global %struct.redirect*, align 4
@expanding_redir = common global i32 0, align 4
@.str.8 = private unnamed_addr constant [4 x i8] c"IFS\00", align 1
@executing_builtin = external global i32, align 4
@rd = internal global %union.REDIRECTEE zeroinitializer, align 4
@restricted = external global i32, align 4
@.str.9 = private unnamed_addr constant [39 x i8] c"redirection error: cannot duplicate fd\00", align 1
@last_command_exit_value = external global i32, align 4
@subshell_environment = external global i32, align 4
@stdout = external constant %struct._IO_FILE*, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@_redir_special_filenames = internal global [3 x %struct.STRING_INT_ALIST] [%struct.STRING_INT_ALIST { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.10, i32 0, i32 0), i32 5 }, %struct.STRING_INT_ALIST { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.11, i32 0, i32 0), i32 6 }, %struct.STRING_INT_ALIST { i8* null, i32 -1 }], align 4
@noclobber = external global i32, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@.str.10 = private unnamed_addr constant [13 x i8] c"/dev/tcp/*/*\00", align 1
@.str.11 = private unnamed_addr constant [13 x i8] c"/dev/udp/*/*\00", align 1
@.str.12 = private unnamed_addr constant [58 x i8] c"/dev/(tcp|udp)/host/port not supported without networking\00", align 1
@.str.13 = private unnamed_addr constant [7 x i8] c"sh-thd\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind
define void @redirection_error(%struct.redirect* %temp, i32 %error) #0 {
entry:
  %temp.addr = alloca %struct.redirect*, align 4
  %error.addr = alloca i32, align 4
  %filename = alloca i8*, align 4
  %allocname = alloca i8*, align 4
  %oflags = alloca i32, align 4
  store %struct.redirect* %temp, %struct.redirect** %temp.addr, align 4
  store i32 %error, i32* %error.addr, align 4
  store i8* null, i8** %allocname, align 4
  %0 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 2
  %1 = load i32, i32* %rflags, align 4
  %and = and i32 %1, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %error.addr, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %3 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %3, i32 0, i32 1
  %filename1 = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %4 = load %struct.word_desc*, %struct.word_desc** %filename1, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word, align 4
  %call = call i32 @strlen(i8* %5)
  %add = add i32 1, %call
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 120)
  %6 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector3 = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 1
  %filename4 = bitcast %union.REDIRECTEE* %redirector3 to %struct.word_desc**
  %7 = load %struct.word_desc*, %struct.word_desc** %filename4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word5, align 4
  %call6 = call i8* @strcpy(i8* %call2, i8* %8)
  store i8* %call6, i8** %allocname, align 4
  store i8* %call6, i8** %filename, align 4
  br label %if.end107

if.else:                                          ; preds = %land.lhs.true, %entry
  %9 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %rflags7 = getelementptr inbounds %struct.redirect, %struct.redirect* %9, i32 0, i32 2
  %10 = load i32, i32* %rflags7, align 4
  %and8 = and i32 %10, 1
  %cmp9 = icmp eq i32 %and8, 0
  br i1 %cmp9, label %land.lhs.true10, label %if.else15

land.lhs.true10:                                  ; preds = %if.else
  %11 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector11 = getelementptr inbounds %struct.redirect, %struct.redirect* %11, i32 0, i32 1
  %dest = bitcast %union.REDIRECTEE* %redirector11 to i32*
  %12 = load i32, i32* %dest, align 4
  %cmp12 = icmp slt i32 %12, 0
  br i1 %cmp12, label %if.then13, label %if.else15

if.then13:                                        ; preds = %land.lhs.true10
  %call14 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call14, i8** %filename, align 4
  br label %if.end106

if.else15:                                        ; preds = %land.lhs.true10, %if.else
  %13 = load i32, i32* %error.addr, align 4
  %cmp16 = icmp ne i32 %13, -2
  br i1 %cmp16, label %land.lhs.true17, label %if.else59

land.lhs.true17:                                  ; preds = %if.else15
  %14 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector18 = getelementptr inbounds %struct.redirect, %struct.redirect* %14, i32 0, i32 1
  %dest19 = bitcast %union.REDIRECTEE* %redirector18 to i32*
  %15 = load i32, i32* %dest19, align 4
  %cmp20 = icmp sge i32 %15, 0
  br i1 %cmp20, label %land.lhs.true21, label %if.else59

land.lhs.true21:                                  ; preds = %land.lhs.true17
  %16 = load i32, i32* %error.addr, align 4
  %cmp22 = icmp eq i32 %16, 9
  br i1 %cmp22, label %if.then23, label %if.else59

if.then23:                                        ; preds = %land.lhs.true21
  %17 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %17, i32 0, i32 4
  %18 = load i32, i32* %instruction, align 4
  switch i32 %18, label %sw.default [
    i32 6, label %sw.bb
    i32 7, label %sw.bb
    i32 15, label %sw.bb
    i32 16, label %sw.bb
    i32 13, label %sw.bb26
    i32 14, label %sw.bb40
  ]

sw.bb:                                            ; preds = %if.then23, %if.then23, %if.then23, %if.then23
  %19 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %19, i32 0, i32 5
  %dest24 = bitcast %union.REDIRECTEE* %redirectee to i32*
  %20 = load i32, i32* %dest24, align 4
  %conv = sext i32 %20 to i64
  %call25 = call i8* @itos(i64 %conv)
  store i8* %call25, i8** %allocname, align 4
  store i8* %call25, i8** %filename, align 4
  br label %sw.epilog

sw.bb26:                                          ; preds = %if.then23
  %21 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector27 = getelementptr inbounds %struct.redirect, %struct.redirect* %21, i32 0, i32 1
  %dest28 = bitcast %union.REDIRECTEE* %redirector27 to i32*
  %22 = load i32, i32* %dest28, align 4
  %cmp29 = icmp eq i32 %22, 0
  br i1 %cmp29, label %if.then31, label %if.else35

if.then31:                                        ; preds = %sw.bb26
  %23 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee32 = getelementptr inbounds %struct.redirect, %struct.redirect* %23, i32 0, i32 5
  %filename33 = bitcast %union.REDIRECTEE* %redirectee32 to %struct.word_desc**
  %24 = load %struct.word_desc*, %struct.word_desc** %filename33, align 4
  %word34 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %24, i32 0, i32 0
  %25 = load i8*, i8** %word34, align 4
  store i8* %25, i8** %filename, align 4
  br label %if.end

if.else35:                                        ; preds = %sw.bb26
  %26 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector36 = getelementptr inbounds %struct.redirect, %struct.redirect* %26, i32 0, i32 1
  %dest37 = bitcast %union.REDIRECTEE* %redirector36 to i32*
  %27 = load i32, i32* %dest37, align 4
  %conv38 = sext i32 %27 to i64
  %call39 = call i8* @itos(i64 %conv38)
  store i8* %call39, i8** %allocname, align 4
  store i8* %call39, i8** %filename, align 4
  br label %if.end

if.end:                                           ; preds = %if.else35, %if.then31
  br label %sw.epilog

sw.bb40:                                          ; preds = %if.then23
  %28 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector41 = getelementptr inbounds %struct.redirect, %struct.redirect* %28, i32 0, i32 1
  %dest42 = bitcast %union.REDIRECTEE* %redirector41 to i32*
  %29 = load i32, i32* %dest42, align 4
  %cmp43 = icmp eq i32 %29, 1
  br i1 %cmp43, label %if.then45, label %if.else49

if.then45:                                        ; preds = %sw.bb40
  %30 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee46 = getelementptr inbounds %struct.redirect, %struct.redirect* %30, i32 0, i32 5
  %filename47 = bitcast %union.REDIRECTEE* %redirectee46 to %struct.word_desc**
  %31 = load %struct.word_desc*, %struct.word_desc** %filename47, align 4
  %word48 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 0
  %32 = load i8*, i8** %word48, align 4
  store i8* %32, i8** %filename, align 4
  br label %if.end54

if.else49:                                        ; preds = %sw.bb40
  %33 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector50 = getelementptr inbounds %struct.redirect, %struct.redirect* %33, i32 0, i32 1
  %dest51 = bitcast %union.REDIRECTEE* %redirector50 to i32*
  %34 = load i32, i32* %dest51, align 4
  %conv52 = sext i32 %34 to i64
  %call53 = call i8* @itos(i64 %conv52)
  store i8* %call53, i8** %allocname, align 4
  store i8* %call53, i8** %filename, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.else49, %if.then45
  br label %sw.epilog

sw.default:                                       ; preds = %if.then23
  %35 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirector55 = getelementptr inbounds %struct.redirect, %struct.redirect* %35, i32 0, i32 1
  %dest56 = bitcast %union.REDIRECTEE* %redirector55 to i32*
  %36 = load i32, i32* %dest56, align 4
  %conv57 = sext i32 %36 to i64
  %call58 = call i8* @itos(i64 %conv57)
  store i8* %call58, i8** %allocname, align 4
  store i8* %call58, i8** %filename, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %if.end54, %if.end, %sw.bb
  br label %if.end105

if.else59:                                        ; preds = %land.lhs.true21, %land.lhs.true17, %if.else15
  %37 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %call60 = call i32 @expandable_redirection_filename(%struct.redirect* %37)
  %tobool61 = icmp ne i32 %call60, 0
  br i1 %tobool61, label %if.then62, label %if.else91

if.then62:                                        ; preds = %if.else59
  br label %expandable_filename

expandable_filename:                              ; preds = %if.then62
  %38 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee63 = getelementptr inbounds %struct.redirect, %struct.redirect* %38, i32 0, i32 5
  %filename64 = bitcast %union.REDIRECTEE* %redirectee63 to %struct.word_desc**
  %39 = load %struct.word_desc*, %struct.word_desc** %filename64, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %39, i32 0, i32 1
  %40 = load i32, i32* %flags, align 4
  store i32 %40, i32* %oflags, align 4
  %41 = load i32, i32* @posixly_correct, align 4
  %tobool65 = icmp ne i32 %41, 0
  br i1 %tobool65, label %land.lhs.true66, label %if.end73

land.lhs.true66:                                  ; preds = %expandable_filename
  %42 = load i32, i32* @interactive_shell, align 4
  %cmp67 = icmp eq i32 %42, 0
  br i1 %cmp67, label %if.then69, label %if.end73

if.then69:                                        ; preds = %land.lhs.true66
  %43 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee70 = getelementptr inbounds %struct.redirect, %struct.redirect* %43, i32 0, i32 5
  %filename71 = bitcast %union.REDIRECTEE* %redirectee70 to %struct.word_desc**
  %44 = load %struct.word_desc*, %struct.word_desc** %filename71, align 4
  %flags72 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %44, i32 0, i32 1
  %45 = load i32, i32* %flags72, align 4
  %or = or i32 %45, 32
  store i32 %or, i32* %flags72, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.then69, %land.lhs.true66, %expandable_filename
  %46 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee74 = getelementptr inbounds %struct.redirect, %struct.redirect* %46, i32 0, i32 5
  %filename75 = bitcast %union.REDIRECTEE* %redirectee74 to %struct.word_desc**
  %47 = load %struct.word_desc*, %struct.word_desc** %filename75, align 4
  %flags76 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %47, i32 0, i32 1
  %48 = load i32, i32* %flags76, align 4
  %or77 = or i32 %48, 1024
  store i32 %or77, i32* %flags76, align 4
  %49 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee78 = getelementptr inbounds %struct.redirect, %struct.redirect* %49, i32 0, i32 5
  %filename79 = bitcast %union.REDIRECTEE* %redirectee78 to %struct.word_desc**
  %50 = load %struct.word_desc*, %struct.word_desc** %filename79, align 4
  %call80 = call i8* @redirection_expand(%struct.word_desc* %50)
  store i8* %call80, i8** %allocname, align 4
  store i8* %call80, i8** %filename, align 4
  %51 = load i32, i32* %oflags, align 4
  %52 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee81 = getelementptr inbounds %struct.redirect, %struct.redirect* %52, i32 0, i32 5
  %filename82 = bitcast %union.REDIRECTEE* %redirectee81 to %struct.word_desc**
  %53 = load %struct.word_desc*, %struct.word_desc** %filename82, align 4
  %flags83 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %53, i32 0, i32 1
  store i32 %51, i32* %flags83, align 4
  %54 = load i8*, i8** %filename, align 4
  %cmp84 = icmp eq i8* %54, null
  br i1 %cmp84, label %if.then86, label %if.end90

if.then86:                                        ; preds = %if.end73
  %55 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee87 = getelementptr inbounds %struct.redirect, %struct.redirect* %55, i32 0, i32 5
  %filename88 = bitcast %union.REDIRECTEE* %redirectee87 to %struct.word_desc**
  %56 = load %struct.word_desc*, %struct.word_desc** %filename88, align 4
  %word89 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %56, i32 0, i32 0
  %57 = load i8*, i8** %word89, align 4
  store i8* %57, i8** %filename, align 4
  br label %if.end90

if.end90:                                         ; preds = %if.then86, %if.end73
  br label %if.end104

if.else91:                                        ; preds = %if.else59
  %58 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee92 = getelementptr inbounds %struct.redirect, %struct.redirect* %58, i32 0, i32 5
  %dest93 = bitcast %union.REDIRECTEE* %redirectee92 to i32*
  %59 = load i32, i32* %dest93, align 4
  %cmp94 = icmp slt i32 %59, 0
  br i1 %cmp94, label %if.then96, label %if.else98

if.then96:                                        ; preds = %if.else91
  %call97 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call97, i8** %filename, align 4
  br label %if.end103

if.else98:                                        ; preds = %if.else91
  %60 = load %struct.redirect*, %struct.redirect** %temp.addr, align 4
  %redirectee99 = getelementptr inbounds %struct.redirect, %struct.redirect* %60, i32 0, i32 5
  %dest100 = bitcast %union.REDIRECTEE* %redirectee99 to i32*
  %61 = load i32, i32* %dest100, align 4
  %conv101 = sext i32 %61 to i64
  %call102 = call i8* @itos(i64 %conv101)
  store i8* %call102, i8** %allocname, align 4
  store i8* %call102, i8** %filename, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.else98, %if.then96
  br label %if.end104

if.end104:                                        ; preds = %if.end103, %if.end90
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %sw.epilog
  br label %if.end106

if.end106:                                        ; preds = %if.end105, %if.then13
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %if.then
  %62 = load i32, i32* %error.addr, align 4
  switch i32 %62, label %sw.default119 [
    i32 -1, label %sw.bb108
    i32 -2, label %sw.bb110
    i32 -3, label %sw.bb112
    i32 -4, label %sw.bb114
    i32 -5, label %sw.bb117
  ]

sw.bb108:                                         ; preds = %if.end107
  %call109 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i32 0, i32 0))
  %63 = load i8*, i8** %filename, align 4
  call void (i8*, ...) @internal_error(i8* %call109, i8* %63)
  br label %sw.epilog121

sw.bb110:                                         ; preds = %if.end107
  %call111 = call i8* @libintl_gettext(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0))
  %64 = load i8*, i8** %filename, align 4
  call void (i8*, ...) @internal_error(i8* %call111, i8* %64)
  br label %sw.epilog121

sw.bb112:                                         ; preds = %if.end107
  %call113 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.4, i32 0, i32 0))
  %65 = load i8*, i8** %filename, align 4
  call void (i8*, ...) @internal_error(i8* %call113, i8* %65)
  br label %sw.epilog121

sw.bb114:                                         ; preds = %if.end107
  %call115 = call i8* @libintl_gettext(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.5, i32 0, i32 0))
  %66 = load i32, i32* @heredoc_errno, align 4
  %call116 = call i8* @strerror(i32 %66)
  call void (i8*, ...) @internal_error(i8* %call115, i8* %call116)
  br label %sw.epilog121

sw.bb117:                                         ; preds = %if.end107
  %call118 = call i8* @libintl_gettext(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.6, i32 0, i32 0))
  %67 = load i8*, i8** %filename, align 4
  call void (i8*, ...) @internal_error(i8* %call118, i8* %67)
  br label %sw.epilog121

sw.default119:                                    ; preds = %if.end107
  %68 = load i8*, i8** %filename, align 4
  %69 = load i32, i32* %error.addr, align 4
  %call120 = call i8* @strerror(i32 %69)
  call void (i8*, ...) @internal_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* %68, i8* %call120)
  br label %sw.epilog121

sw.epilog121:                                     ; preds = %sw.default119, %sw.bb117, %sw.bb114, %sw.bb112, %sw.bb110, %sw.bb108
  br label %do.body

do.body:                                          ; preds = %sw.epilog121
  %70 = load i8*, i8** %allocname, align 4
  %tobool122 = icmp ne i8* %70, null
  br i1 %tobool122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %do.body
  %71 = load i8*, i8** %allocname, align 4
  call void @sh_xfree(i8* %71, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 204)
  br label %if.end124

if.end124:                                        ; preds = %if.then123, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end124
  ret void
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @itos(i64) #1

; Function Attrs: noinline nounwind
define internal i32 @expandable_redirection_filename(%struct.redirect* %redirect) #0 {
entry:
  %retval = alloca i32, align 4
  %redirect.addr = alloca %struct.redirect*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 4
  %1 = load i32, i32* %instruction, align 4
  switch i32 %1, label %sw.default [
    i32 0, label %sw.bb
    i32 3, label %sw.bb
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 10, label %sw.bb
    i32 19, label %sw.bb
    i32 11, label %sw.bb
    i32 12, label %sw.bb
    i32 13, label %sw.bb
    i32 14, label %sw.bb
    i32 17, label %sw.bb
    i32 18, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind
define i8* @redirection_expand(%struct.word_desc* %word) #0 {
entry:
  %retval = alloca i8*, align 4
  %word.addr = alloca %struct.word_desc*, align 4
  %result = alloca i8*, align 4
  %tlist1 = alloca %struct.word_list*, align 4
  %tlist2 = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_desc*, align 4
  %old = alloca i32, align 4
  store %struct.word_desc* %word, %struct.word_desc** %word.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %call = call %struct.word_desc* @copy_word(%struct.word_desc* %0)
  store %struct.word_desc* %call, %struct.word_desc** %w, align 4
  %1 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 1
  %3 = load i32, i32* %flags, align 4
  %or = or i32 %3, 16
  store i32 %or, i32* %flags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %call1 = call %struct.word_list* @make_word_list(%struct.word_desc* %4, %struct.word_list* null)
  store %struct.word_list* %call1, %struct.word_list** %tlist1, align 4
  store i32 1, i32* @expanding_redir, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %5 = load %struct.word_list*, %struct.word_list** %tlist1, align 4
  %call2 = call %struct.word_list* @expand_words_no_vars(%struct.word_list* %5)
  store %struct.word_list* %call2, %struct.word_list** %tlist2, align 4
  store i32 0, i32* @expanding_redir, align 4
  %6 = load i32, i32* @executing_builtin, align 4
  store i32 %6, i32* %old, align 4
  store i32 1, i32* @executing_builtin, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %7 = load i32, i32* %old, align 4
  store i32 %7, i32* @executing_builtin, align 4
  %8 = load %struct.word_list*, %struct.word_list** %tlist1, align 4
  call void @dispose_words(%struct.word_list* %8)
  %9 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  %cmp = icmp eq %struct.word_list* %9, null
  br i1 %cmp, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %10 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 0
  %11 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool3 = icmp ne %struct.word_list* %11, null
  br i1 %tobool3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %lor.lhs.false, %if.end
  %12 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  %tobool5 = icmp ne %struct.word_list* %12, null
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.then4
  %13 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  call void @dispose_words(%struct.word_list* %13)
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.then4
  store i8* null, i8** %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  %14 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  %call9 = call i8* @string_list(%struct.word_list* %14)
  store i8* %call9, i8** %result, align 4
  %15 = load %struct.word_list*, %struct.word_list** %tlist2, align 4
  call void @dispose_words(%struct.word_list* %15)
  %16 = load i8*, i8** %result, align 4
  store i8* %16, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.end7
  %17 = load i8*, i8** %retval, align 4
  ret i8* %17
}

declare void @internal_error(i8*, ...) #1

declare i8* @strerror(i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @do_redirections(%struct.redirect* %list, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.redirect*, align 4
  %flags.addr = alloca i32, align 4
  %error = alloca i32, align 4
  %temp = alloca %struct.redirect*, align 4
  store %struct.redirect* %list, %struct.redirect** %list.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  %1 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %tobool1 = icmp ne %struct.redirect* %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  call void @dispose_redirects(%struct.redirect* %2)
  store %struct.redirect* null, %struct.redirect** @redirection_undo_list, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %3 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  %tobool3 = icmp ne %struct.redirect* %3, null
  br i1 %tobool3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @dispose_exec_redirects()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %entry
  %4 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  store %struct.redirect* %4, %struct.redirect** %temp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %tobool7 = icmp ne %struct.redirect* %5, null
  br i1 %tobool7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %7 = load i32, i32* %flags.addr, align 4
  %call = call i32 @do_redirection_internal(%struct.redirect* %6, i32 %7)
  store i32 %call, i32* %error, align 4
  %8 = load i32, i32* %error, align 4
  %tobool8 = icmp ne i32 %8, 0
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.body
  %9 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %10 = load i32, i32* %error, align 4
  call void @redirection_error(%struct.redirect* %9, i32 %10)
  %11 = load i32, i32* %error, align 4
  store i32 %11, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %12 = load %struct.redirect*, %struct.redirect** %temp, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %12, i32 0, i32 0
  %13 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %13, %struct.redirect** %temp, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then9
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare void @dispose_redirects(%struct.redirect*) #1

declare void @dispose_exec_redirects() #1

; Function Attrs: noinline nounwind
define internal i32 @do_redirection_internal(%struct.redirect* %redirect, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %redirect.addr = alloca %struct.redirect*, align 4
  %flags.addr = alloca i32, align 4
  %redirectee = alloca %struct.word_desc*, align 4
  %redir_fd = alloca i32, align 4
  %fd = alloca i32, align 4
  %redirector = alloca i32, align 4
  %r = alloca i32, align 4
  %oflags = alloca i32, align 4
  %lfd = alloca i64, align 8
  %redirectee_word = alloca i8*, align 4
  %ri = alloca i32, align 4
  %new_redirect = alloca %struct.redirect*, align 4
  %sd = alloca %union.REDIRECTEE, align 4
  %alloca_hack = alloca i8*, align 4
  store %struct.redirect* %redirect, %struct.redirect** %redirect.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
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
  %dest4 = bitcast %union.REDIRECTEE* %redirector3 to i32*
  %5 = load i32, i32* %dest4, align 4
  store i32 %5, i32* %redirector, align 4
  %6 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 4
  %7 = load i32, i32* %instruction, align 4
  store i32 %7, i32* %ri, align 4
  %8 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags5 = getelementptr inbounds %struct.redirect, %struct.redirect* %8, i32 0, i32 3
  %9 = load i32, i32* %flags5, align 4
  %and = and i32 %9, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %10 = load i32, i32* %flags.addr, align 4
  %or = or i32 %10, 8
  store i32 %or, i32* %flags.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %11 = load i32, i32* %ri, align 4
  %cmp = icmp eq i32 %11, 13
  br i1 %cmp, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %12 = load i32, i32* %ri, align 4
  %cmp6 = icmp eq i32 %12, 14
  br i1 %cmp6, label %if.then11, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %13 = load i32, i32* %ri, align 4
  %cmp8 = icmp eq i32 %13, 17
  br i1 %cmp8, label %if.then11, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false7
  %14 = load i32, i32* %ri, align 4
  %cmp10 = icmp eq i32 %14, 18
  br i1 %cmp10, label %if.then11, label %if.end91

if.then11:                                        ; preds = %lor.lhs.false9, %lor.lhs.false7, %lor.lhs.false, %if.end
  %15 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %call = call i8* @redirection_expand(%struct.word_desc* %15)
  store i8* %call, i8** %redirectee_word, align 4
  %16 = load i8*, i8** %redirectee_word, align 4
  %cmp12 = icmp eq i8* %16, null
  br i1 %cmp12, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.then11
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then11
  %17 = load i8*, i8** %redirectee_word, align 4
  %arrayidx = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %18 to i32
  %cmp14 = icmp eq i32 %conv, 45
  br i1 %cmp14, label %land.lhs.true, label %if.else23

land.lhs.true:                                    ; preds = %if.else
  %19 = load i8*, i8** %redirectee_word, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %19, i32 1
  %20 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %20 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br i1 %cmp18, label %if.then20, label %if.else23

if.then20:                                        ; preds = %land.lhs.true
  %21 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector21 = getelementptr inbounds %struct.redirect, %struct.redirect* %21, i32 0, i32 1
  %22 = bitcast %union.REDIRECTEE* %sd to i8*
  %23 = bitcast %union.REDIRECTEE* %redirector21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %22, i8* %23, i32 4, i32 4, i1 false)
  store i32 0, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  %call22 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 9, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call22, %struct.redirect** %new_redirect, align 4
  br label %if.end63

if.else23:                                        ; preds = %land.lhs.true, %if.else
  %24 = load i8*, i8** %redirectee_word, align 4
  %call24 = call i32 @all_digits(i8* %24)
  %tobool25 = icmp ne i32 %call24, 0
  br i1 %tobool25, label %if.then26, label %if.else46

if.then26:                                        ; preds = %if.else23
  %25 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector27 = getelementptr inbounds %struct.redirect, %struct.redirect* %25, i32 0, i32 1
  %26 = bitcast %union.REDIRECTEE* %sd to i8*
  %27 = bitcast %union.REDIRECTEE* %redirector27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %26, i8* %27, i32 4, i32 4, i1 false)
  %28 = load i8*, i8** %redirectee_word, align 4
  %call28 = call i32 @legal_number(i8* %28, i64* %lfd)
  %tobool29 = icmp ne i32 %call28, 0
  br i1 %tobool29, label %land.lhs.true30, label %if.else37

land.lhs.true30:                                  ; preds = %if.then26
  %29 = load i64, i64* %lfd, align 8
  %conv31 = trunc i64 %29 to i32
  %conv32 = sext i32 %conv31 to i64
  %30 = load i64, i64* %lfd, align 8
  %cmp33 = icmp eq i64 %conv32, %30
  br i1 %cmp33, label %if.then35, label %if.else37

if.then35:                                        ; preds = %land.lhs.true30
  %31 = load i64, i64* %lfd, align 8
  %conv36 = trunc i64 %31 to i32
  store i32 %conv36, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  br label %if.end38

if.else37:                                        ; preds = %land.lhs.true30, %if.then26
  store i32 -1, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %if.then35
  %32 = load i32, i32* %ri, align 4
  switch i32 %32, label %sw.epilog [
    i32 13, label %sw.bb
    i32 14, label %sw.bb40
    i32 17, label %sw.bb42
    i32 18, label %sw.bb44
  ]

sw.bb:                                            ; preds = %if.end38
  %call39 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 6, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call39, %struct.redirect** %new_redirect, align 4
  br label %sw.epilog

sw.bb40:                                          ; preds = %if.end38
  %call41 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 7, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call41, %struct.redirect** %new_redirect, align 4
  br label %sw.epilog

sw.bb42:                                          ; preds = %if.end38
  %call43 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 15, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call43, %struct.redirect** %new_redirect, align 4
  br label %sw.epilog

sw.bb44:                                          ; preds = %if.end38
  %call45 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 16, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call45, %struct.redirect** %new_redirect, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end38, %sw.bb44, %sw.bb42, %sw.bb40, %sw.bb
  br label %if.end62

if.else46:                                        ; preds = %if.else23
  %33 = load i32, i32* %ri, align 4
  %cmp47 = icmp eq i32 %33, 14
  br i1 %cmp47, label %land.lhs.true49, label %if.else60

land.lhs.true49:                                  ; preds = %if.else46
  %34 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %34, i32 0, i32 2
  %35 = load i32, i32* %rflags, align 4
  %and50 = and i32 %35, 1
  %cmp51 = icmp eq i32 %and50, 0
  br i1 %cmp51, label %land.lhs.true53, label %if.else60

land.lhs.true53:                                  ; preds = %land.lhs.true49
  %36 = load i32, i32* %redirector, align 4
  %cmp54 = icmp eq i32 %36, 1
  br i1 %cmp54, label %if.then56, label %if.else60

if.then56:                                        ; preds = %land.lhs.true53
  %37 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %redirector57 = getelementptr inbounds %struct.redirect, %struct.redirect* %37, i32 0, i32 1
  %38 = bitcast %union.REDIRECTEE* %sd to i8*
  %39 = bitcast %union.REDIRECTEE* %redirector57 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %38, i8* %39, i32 4, i32 4, i1 false)
  %40 = load i8*, i8** %redirectee_word, align 4
  %call58 = call %struct.word_desc* @make_bare_word(i8* %40)
  store %struct.word_desc* %call58, %struct.word_desc** bitcast (%union.REDIRECTEE* @rd to %struct.word_desc**), align 4
  %call59 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 10, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call59, %struct.redirect** %new_redirect, align 4
  br label %if.end61

if.else60:                                        ; preds = %land.lhs.true53, %land.lhs.true49, %if.else46
  %41 = load i8*, i8** %redirectee_word, align 4
  call void @sh_xfree(i8* %41, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 788)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end61:                                         ; preds = %if.then56
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %sw.epilog
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %if.then20
  br label %if.end64

if.end64:                                         ; preds = %if.end63
  %42 = load i8*, i8** %redirectee_word, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 792)
  %43 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %instruction65 = getelementptr inbounds %struct.redirect, %struct.redirect* %43, i32 0, i32 4
  %44 = load i32, i32* %instruction65, align 4
  %cmp66 = icmp eq i32 %44, 10
  br i1 %cmp66, label %if.then68, label %if.else80

if.then68:                                        ; preds = %if.end64
  %45 = alloca i8, i32 8, align 8
  %46 = bitcast i8* %45 to %struct.word_desc*
  store %struct.word_desc* %46, %struct.word_desc** %redirectee, align 4
  %47 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee69 = getelementptr inbounds %struct.redirect, %struct.redirect* %47, i32 0, i32 5
  %filename70 = bitcast %union.REDIRECTEE* %redirectee69 to %struct.word_desc**
  %48 = load %struct.word_desc*, %struct.word_desc** %filename70, align 4
  %49 = bitcast %struct.word_desc* %48 to i8*
  %50 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %51 = bitcast %struct.word_desc* %50 to i8*
  call void @xbcopy(i8* %49, i8* %51, i32 8)
  %52 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee71 = getelementptr inbounds %struct.redirect, %struct.redirect* %52, i32 0, i32 5
  %filename72 = bitcast %union.REDIRECTEE* %redirectee71 to %struct.word_desc**
  %53 = load %struct.word_desc*, %struct.word_desc** %filename72, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %53, i32 0, i32 0
  %54 = load i8*, i8** %word, align 4
  %call73 = call i32 @strlen(i8* %54)
  %add = add i32 1, %call73
  %55 = alloca i8, i32 %add, align 8
  store i8* %55, i8** %alloca_hack, align 4
  %56 = load i8*, i8** %alloca_hack, align 4
  %57 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word74 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %57, i32 0, i32 0
  store i8* %56, i8** %word74, align 4
  %58 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %word75 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %58, i32 0, i32 0
  %59 = load i8*, i8** %word75, align 4
  %60 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee76 = getelementptr inbounds %struct.redirect, %struct.redirect* %60, i32 0, i32 5
  %filename77 = bitcast %union.REDIRECTEE* %redirectee76 to %struct.word_desc**
  %61 = load %struct.word_desc*, %struct.word_desc** %filename77, align 4
  %word78 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %61, i32 0, i32 0
  %62 = load i8*, i8** %word78, align 4
  %call79 = call i8* @strcpy(i8* %59, i8* %62)
  br label %if.end83

if.else80:                                        ; preds = %if.end64
  %63 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee81 = getelementptr inbounds %struct.redirect, %struct.redirect* %63, i32 0, i32 5
  %filename82 = bitcast %union.REDIRECTEE* %redirectee81 to %struct.word_desc**
  %64 = load %struct.word_desc*, %struct.word_desc** %filename82, align 4
  store %struct.word_desc* %64, %struct.word_desc** %redirectee, align 4
  br label %if.end83

if.end83:                                         ; preds = %if.else80, %if.then68
  %65 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirectee84 = getelementptr inbounds %struct.redirect, %struct.redirect* %65, i32 0, i32 5
  %dest85 = bitcast %union.REDIRECTEE* %redirectee84 to i32*
  %66 = load i32, i32* %dest85, align 4
  store i32 %66, i32* %redir_fd, align 4
  %67 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %redirector86 = getelementptr inbounds %struct.redirect, %struct.redirect* %67, i32 0, i32 1
  %dest87 = bitcast %union.REDIRECTEE* %redirector86 to i32*
  %68 = load i32, i32* %dest87, align 4
  store i32 %68, i32* %redirector, align 4
  %69 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %instruction88 = getelementptr inbounds %struct.redirect, %struct.redirect* %69, i32 0, i32 4
  %70 = load i32, i32* %instruction88, align 4
  store i32 %70, i32* %ri, align 4
  %71 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %flags89 = getelementptr inbounds %struct.redirect, %struct.redirect* %71, i32 0, i32 3
  %72 = load i32, i32* %flags89, align 4
  %73 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags90 = getelementptr inbounds %struct.redirect, %struct.redirect* %73, i32 0, i32 3
  store i32 %72, i32* %flags90, align 4
  %74 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  call void @dispose_redirects(%struct.redirect* %74)
  br label %if.end91

if.end91:                                         ; preds = %if.end83, %lor.lhs.false9
  %75 = load i32, i32* %ri, align 4
  switch i32 %75, label %sw.epilog700 [
    i32 0, label %sw.bb92
    i32 3, label %sw.bb92
    i32 1, label %sw.bb92
    i32 2, label %sw.bb92
    i32 10, label %sw.bb92
    i32 19, label %sw.bb92
    i32 11, label %sw.bb92
    i32 12, label %sw.bb92
    i32 4, label %sw.bb320
    i32 8, label %sw.bb320
    i32 5, label %sw.bb320
    i32 6, label %sw.bb440
    i32 7, label %sw.bb440
    i32 15, label %sw.bb440
    i32 16, label %sw.bb440
    i32 9, label %sw.bb617
    i32 13, label %sw.bb699
    i32 14, label %sw.bb699
  ]

sw.bb92:                                          ; preds = %if.end91, %if.end91, %if.end91, %if.end91, %if.end91, %if.end91, %if.end91, %if.end91
  %76 = load i32, i32* @posixly_correct, align 4
  %tobool93 = icmp ne i32 %76, 0
  br i1 %tobool93, label %land.lhs.true94, label %if.end101

land.lhs.true94:                                  ; preds = %sw.bb92
  %77 = load i32, i32* @interactive_shell, align 4
  %cmp95 = icmp eq i32 %77, 0
  br i1 %cmp95, label %if.then97, label %if.end101

if.then97:                                        ; preds = %land.lhs.true94
  %78 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %flags98 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %78, i32 0, i32 1
  %79 = load i32, i32* %flags98, align 4
  store i32 %79, i32* %oflags, align 4
  %80 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %flags99 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %80, i32 0, i32 1
  %81 = load i32, i32* %flags99, align 4
  %or100 = or i32 %81, 32
  store i32 %or100, i32* %flags99, align 4
  br label %if.end101

if.end101:                                        ; preds = %if.then97, %land.lhs.true94, %sw.bb92
  %82 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %call102 = call i8* @redirection_expand(%struct.word_desc* %82)
  store i8* %call102, i8** %redirectee_word, align 4
  %83 = load i32, i32* @posixly_correct, align 4
  %tobool103 = icmp ne i32 %83, 0
  br i1 %tobool103, label %land.lhs.true104, label %if.end109

land.lhs.true104:                                 ; preds = %if.end101
  %84 = load i32, i32* @interactive_shell, align 4
  %cmp105 = icmp eq i32 %84, 0
  br i1 %cmp105, label %if.then107, label %if.end109

if.then107:                                       ; preds = %land.lhs.true104
  %85 = load i32, i32* %oflags, align 4
  %86 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %flags108 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %86, i32 0, i32 1
  store i32 %85, i32* %flags108, align 4
  br label %if.end109

if.end109:                                        ; preds = %if.then107, %land.lhs.true104, %if.end101
  %87 = load i8*, i8** %redirectee_word, align 4
  %cmp110 = icmp eq i8* %87, null
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.end109
  store i32 -1, i32* %retval, align 4
  br label %return

if.end113:                                        ; preds = %if.end109
  %88 = load i32, i32* @restricted, align 4
  %tobool114 = icmp ne i32 %88, 0
  br i1 %tobool114, label %land.lhs.true115, label %if.end134

land.lhs.true115:                                 ; preds = %if.end113
  %89 = load i32, i32* %ri, align 4
  %cmp116 = icmp eq i32 %89, 0
  br i1 %cmp116, label %if.then133, label %lor.lhs.false118

lor.lhs.false118:                                 ; preds = %land.lhs.true115
  %90 = load i32, i32* %ri, align 4
  %cmp119 = icmp eq i32 %90, 11
  br i1 %cmp119, label %if.then133, label %lor.lhs.false121

lor.lhs.false121:                                 ; preds = %lor.lhs.false118
  %91 = load i32, i32* %ri, align 4
  %cmp122 = icmp eq i32 %91, 10
  br i1 %cmp122, label %if.then133, label %lor.lhs.false124

lor.lhs.false124:                                 ; preds = %lor.lhs.false121
  %92 = load i32, i32* %ri, align 4
  %cmp125 = icmp eq i32 %92, 3
  br i1 %cmp125, label %if.then133, label %lor.lhs.false127

lor.lhs.false127:                                 ; preds = %lor.lhs.false124
  %93 = load i32, i32* %ri, align 4
  %cmp128 = icmp eq i32 %93, 19
  br i1 %cmp128, label %if.then133, label %lor.lhs.false130

lor.lhs.false130:                                 ; preds = %lor.lhs.false127
  %94 = load i32, i32* %ri, align 4
  %cmp131 = icmp eq i32 %94, 12
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %lor.lhs.false130, %lor.lhs.false127, %lor.lhs.false124, %lor.lhs.false121, %lor.lhs.false118, %land.lhs.true115
  %95 = load i8*, i8** %redirectee_word, align 4
  call void @sh_xfree(i8* %95, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 849)
  store i32 -3, i32* %retval, align 4
  br label %return

if.end134:                                        ; preds = %lor.lhs.false130, %if.end113
  %96 = load i8*, i8** %redirectee_word, align 4
  %97 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags135 = getelementptr inbounds %struct.redirect, %struct.redirect* %97, i32 0, i32 3
  %98 = load i32, i32* %flags135, align 4
  %99 = load i32, i32* %ri, align 4
  %call136 = call i32 @redir_open(i8* %96, i32 %98, i32 438, i32 %99)
  store i32 %call136, i32* %fd, align 4
  %100 = load i8*, i8** %redirectee_word, align 4
  call void @sh_xfree(i8* %100, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 855)
  %101 = load i32, i32* %fd, align 4
  %cmp137 = icmp eq i32 %101, -2
  br i1 %cmp137, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end134
  %102 = load i32, i32* %fd, align 4
  store i32 %102, i32* %retval, align 4
  br label %return

if.end140:                                        ; preds = %if.end134
  %103 = load i32, i32* %fd, align 4
  %cmp141 = icmp slt i32 %103, 0
  br i1 %cmp141, label %if.then143, label %if.end145

if.then143:                                       ; preds = %if.end140
  %call144 = call i32* @__errno_location()
  %104 = load i32, i32* %call144, align 4
  store i32 %104, i32* %retval, align 4
  br label %return

if.end145:                                        ; preds = %if.end140
  %105 = load i32, i32* %flags.addr, align 4
  %and146 = and i32 %105, 1
  %tobool147 = icmp ne i32 %and146, 0
  br i1 %tobool147, label %if.then148, label %if.end280

if.then148:                                       ; preds = %if.end145
  %106 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags149 = getelementptr inbounds %struct.redirect, %struct.redirect* %106, i32 0, i32 2
  %107 = load i32, i32* %rflags149, align 4
  %and150 = and i32 %107, 1
  %tobool151 = icmp ne i32 %and150, 0
  br i1 %tobool151, label %if.then152, label %if.end171

if.then152:                                       ; preds = %if.then148
  %108 = load i32, i32* %fd, align 4
  %call153 = call i32 (i32, i32, ...) @fcntl(i32 %108, i32 0, i32 10)
  store i32 %call153, i32* %redirector, align 4
  %call154 = call i32* @__errno_location()
  %109 = load i32, i32* %call154, align 4
  store i32 %109, i32* %r, align 4
  %110 = load i32, i32* %redirector, align 4
  %cmp155 = icmp slt i32 %110, 0
  br i1 %cmp155, label %if.then157, label %if.end159

if.then157:                                       ; preds = %if.then152
  %call158 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @sys_error(i8* %call158)
  br label %if.end159

if.end159:                                        ; preds = %if.then157, %if.then152
  br label %do.body

do.body:                                          ; preds = %if.end159
  %111 = load i32, i32* %redirector, align 4
  %cmp160 = icmp slt i32 %111, 0
  br i1 %cmp160, label %if.then162, label %if.end170

if.then162:                                       ; preds = %do.body
  %112 = load i32, i32* %fd, align 4
  %cmp163 = icmp sge i32 %112, 0
  br i1 %cmp163, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.then162
  %113 = load i32, i32* %fd, align 4
  %call166 = call i32 @close(i32 %113)
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.then162
  store i32 1, i32* @last_command_exit_value, align 4
  %114 = load i32, i32* %r, align 4
  %cmp168 = icmp eq i32 %114, 0
  br i1 %cmp168, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end167
  br label %cond.end

cond.false:                                       ; preds = %if.end167
  %115 = load i32, i32* %r, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 22, %cond.true ], [ %115, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end170:                                        ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end170
  br label %if.end171

if.end171:                                        ; preds = %do.end, %if.then148
  %116 = load i32, i32* %flags.addr, align 4
  %and172 = and i32 %116, 2
  %tobool173 = icmp ne i32 %and172, 0
  br i1 %tobool173, label %land.lhs.true174, label %if.end210

land.lhs.true174:                                 ; preds = %if.end171
  %117 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags175 = getelementptr inbounds %struct.redirect, %struct.redirect* %117, i32 0, i32 2
  %118 = load i32, i32* %rflags175, align 4
  %and176 = and i32 %118, 1
  %cmp177 = icmp eq i32 %and176, 0
  br i1 %cmp177, label %if.then179, label %if.end210

if.then179:                                       ; preds = %land.lhs.true174
  %119 = load i32, i32* %fd, align 4
  %120 = load i32, i32* %redirector, align 4
  %cmp180 = icmp ne i32 %119, %120
  br i1 %cmp180, label %land.lhs.true182, label %if.else188

land.lhs.true182:                                 ; preds = %if.then179
  %121 = load i32, i32* %redirector, align 4
  %call183 = call i32 (i32, i32, ...) @fcntl(i32 %121, i32 1, i32 0)
  %cmp184 = icmp ne i32 %call183, -1
  br i1 %cmp184, label %if.then186, label %if.else188

if.then186:                                       ; preds = %land.lhs.true182
  %122 = load i32, i32* %redirector, align 4
  %123 = load i32, i32* %ri, align 4
  %call187 = call i32 @add_undo_redirect(i32 %122, i32 %123, i32 -1)
  store i32 %call187, i32* %r, align 4
  br label %if.end190

if.else188:                                       ; preds = %land.lhs.true182, %if.then179
  %124 = load i32, i32* %redirector, align 4
  %call189 = call i32 @add_undo_close_redirect(i32 %124)
  store i32 %call189, i32* %r, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.else188, %if.then186
  br label %do.body191

do.body191:                                       ; preds = %if.end190
  %125 = load i32, i32* %r, align 4
  %cmp192 = icmp slt i32 %125, 0
  br i1 %cmp192, label %if.then194, label %if.end208

if.then194:                                       ; preds = %do.body191
  %126 = load i32, i32* %fd, align 4
  %cmp195 = icmp sge i32 %126, 0
  br i1 %cmp195, label %if.then197, label %if.end199

if.then197:                                       ; preds = %if.then194
  %127 = load i32, i32* %fd, align 4
  %call198 = call i32 @close(i32 %127)
  br label %if.end199

if.end199:                                        ; preds = %if.then197, %if.then194
  store i32 1, i32* @last_command_exit_value, align 4
  %call200 = call i32* @__errno_location()
  %128 = load i32, i32* %call200, align 4
  %cmp201 = icmp eq i32 %128, 0
  br i1 %cmp201, label %cond.true203, label %cond.false204

cond.true203:                                     ; preds = %if.end199
  br label %cond.end206

cond.false204:                                    ; preds = %if.end199
  %call205 = call i32* @__errno_location()
  %129 = load i32, i32* %call205, align 4
  br label %cond.end206

cond.end206:                                      ; preds = %cond.false204, %cond.true203
  %cond207 = phi i32 [ 22, %cond.true203 ], [ %129, %cond.false204 ]
  store i32 %cond207, i32* %retval, align 4
  br label %return

if.end208:                                        ; preds = %do.body191
  br label %do.end209

do.end209:                                        ; preds = %if.end208
  br label %if.end210

if.end210:                                        ; preds = %do.end209, %land.lhs.true174, %if.end171
  %130 = load i32, i32* %redirector, align 4
  %cmp211 = icmp ne i32 %130, 0
  br i1 %cmp211, label %if.then217, label %lor.lhs.false213

lor.lhs.false213:                                 ; preds = %if.end210
  %131 = load i32, i32* @subshell_environment, align 4
  %and214 = and i32 %131, 1
  %cmp215 = icmp eq i32 %and214, 0
  br i1 %cmp215, label %if.then217, label %if.end219

if.then217:                                       ; preds = %lor.lhs.false213, %if.end210
  %132 = load i32, i32* %redirector, align 4
  %call218 = call i32 @check_bash_input(i32 %132)
  br label %if.end219

if.end219:                                        ; preds = %if.then217, %lor.lhs.false213
  %133 = load i32, i32* %redirector, align 4
  %cmp220 = icmp eq i32 %133, 1
  br i1 %cmp220, label %land.lhs.true222, label %if.else229

land.lhs.true222:                                 ; preds = %if.end219
  %134 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call223 = call i32 @fileno(%struct._IO_FILE* %134)
  %135 = load i32, i32* %redirector, align 4
  %cmp224 = icmp eq i32 %call223, %135
  br i1 %cmp224, label %if.then226, label %if.else229

if.then226:                                       ; preds = %land.lhs.true222
  %136 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call227 = call i32 @fflush(%struct._IO_FILE* %136)
  %137 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call228 = call i32 @_bash_fpurge(%struct._IO_FILE* %137)
  br label %if.end240

if.else229:                                       ; preds = %land.lhs.true222, %if.end219
  %138 = load i32, i32* %redirector, align 4
  %cmp230 = icmp eq i32 %138, 2
  br i1 %cmp230, label %land.lhs.true232, label %if.end239

land.lhs.true232:                                 ; preds = %if.else229
  %139 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call233 = call i32 @fileno(%struct._IO_FILE* %139)
  %140 = load i32, i32* %redirector, align 4
  %cmp234 = icmp eq i32 %call233, %140
  br i1 %cmp234, label %if.then236, label %if.end239

if.then236:                                       ; preds = %land.lhs.true232
  %141 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call237 = call i32 @fflush(%struct._IO_FILE* %141)
  %142 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call238 = call i32 @_bash_fpurge(%struct._IO_FILE* %142)
  br label %if.end239

if.end239:                                        ; preds = %if.then236, %land.lhs.true232, %if.else229
  br label %if.end240

if.end240:                                        ; preds = %if.end239, %if.then226
  %143 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags241 = getelementptr inbounds %struct.redirect, %struct.redirect* %143, i32 0, i32 2
  %144 = load i32, i32* %rflags241, align 4
  %and242 = and i32 %144, 1
  %tobool243 = icmp ne i32 %and242, 0
  br i1 %tobool243, label %if.then244, label %if.else252

if.then244:                                       ; preds = %if.end240
  %145 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %146 = load i32, i32* %redirector, align 4
  %call245 = call i32 @redir_varassign(%struct.redirect* %145, i32 %146)
  store i32 %call245, i32* %r, align 4
  %cmp246 = icmp slt i32 %call245, 0
  br i1 %cmp246, label %if.then248, label %if.end251

if.then248:                                       ; preds = %if.then244
  %147 = load i32, i32* %redirector, align 4
  %call249 = call i32 @close(i32 %147)
  %148 = load i32, i32* %fd, align 4
  %call250 = call i32 @close(i32 %148)
  %149 = load i32, i32* %r, align 4
  store i32 %149, i32* %retval, align 4
  br label %return

if.end251:                                        ; preds = %if.then244
  br label %if.end263

if.else252:                                       ; preds = %if.end240
  %150 = load i32, i32* %fd, align 4
  %151 = load i32, i32* %redirector, align 4
  %cmp253 = icmp ne i32 %150, %151
  br i1 %cmp253, label %land.lhs.true255, label %if.end262

land.lhs.true255:                                 ; preds = %if.else252
  %152 = load i32, i32* %fd, align 4
  %153 = load i32, i32* %redirector, align 4
  %call256 = call i32 @dup2(i32 %152, i32 %153)
  %cmp257 = icmp slt i32 %call256, 0
  br i1 %cmp257, label %if.then259, label %if.end262

if.then259:                                       ; preds = %land.lhs.true255
  %154 = load i32, i32* %fd, align 4
  %call260 = call i32 @close(i32 %154)
  %call261 = call i32* @__errno_location()
  %155 = load i32, i32* %call261, align 4
  store i32 %155, i32* %retval, align 4
  br label %return

if.end262:                                        ; preds = %land.lhs.true255, %if.else252
  br label %if.end263

if.end263:                                        ; preds = %if.end262, %if.end251
  %156 = load i32, i32* %ri, align 4
  %cmp264 = icmp eq i32 %156, 1
  br i1 %cmp264, label %if.then269, label %lor.lhs.false266

lor.lhs.false266:                                 ; preds = %if.end263
  %157 = load i32, i32* %ri, align 4
  %cmp267 = icmp eq i32 %157, 11
  br i1 %cmp267, label %if.then269, label %if.end271

if.then269:                                       ; preds = %lor.lhs.false266, %if.end263
  %158 = load i32, i32* %fd, align 4
  %159 = load i32, i32* %redirector, align 4
  %call270 = call i32 @duplicate_buffered_stream(i32 %158, i32 %159)
  br label %if.end271

if.end271:                                        ; preds = %if.then269, %lor.lhs.false266
  %160 = load i32, i32* %flags.addr, align 4
  %and272 = and i32 %160, 4
  %tobool273 = icmp ne i32 %and272, 0
  br i1 %tobool273, label %land.lhs.true274, label %if.end279

land.lhs.true274:                                 ; preds = %if.end271
  %161 = load i32, i32* %redirector, align 4
  %cmp275 = icmp sgt i32 %161, 2
  br i1 %cmp275, label %if.then277, label %if.end279

if.then277:                                       ; preds = %land.lhs.true274
  %162 = load i32, i32* %redirector, align 4
  %call278 = call i32 (i32, i32, ...) @fcntl(i32 %162, i32 2, i32 1)
  br label %if.end279

if.end279:                                        ; preds = %if.then277, %land.lhs.true274, %if.end271
  br label %if.end280

if.end280:                                        ; preds = %if.end279, %if.end145
  %163 = load i32, i32* %fd, align 4
  %164 = load i32, i32* %redirector, align 4
  %cmp281 = icmp ne i32 %163, %164
  br i1 %cmp281, label %if.then283, label %if.end297

if.then283:                                       ; preds = %if.end280
  %165 = load i32, i32* %ri, align 4
  %cmp284 = icmp eq i32 %165, 1
  br i1 %cmp284, label %if.then292, label %lor.lhs.false286

lor.lhs.false286:                                 ; preds = %if.then283
  %166 = load i32, i32* %ri, align 4
  %cmp287 = icmp eq i32 %166, 2
  br i1 %cmp287, label %if.then292, label %lor.lhs.false289

lor.lhs.false289:                                 ; preds = %lor.lhs.false286
  %167 = load i32, i32* %ri, align 4
  %cmp290 = icmp eq i32 %167, 11
  br i1 %cmp290, label %if.then292, label %if.else294

if.then292:                                       ; preds = %lor.lhs.false289, %lor.lhs.false286, %if.then283
  %168 = load i32, i32* %fd, align 4
  %call293 = call i32 @close_buffered_fd(i32 %168)
  br label %if.end296

if.else294:                                       ; preds = %lor.lhs.false289
  %169 = load i32, i32* %fd, align 4
  %call295 = call i32 @close(i32 %169)
  br label %if.end296

if.end296:                                        ; preds = %if.else294, %if.then292
  br label %if.end297

if.end297:                                        ; preds = %if.end296, %if.end280
  %170 = load i32, i32* %ri, align 4
  %cmp298 = icmp eq i32 %170, 10
  br i1 %cmp298, label %if.then303, label %lor.lhs.false300

lor.lhs.false300:                                 ; preds = %if.end297
  %171 = load i32, i32* %ri, align 4
  %cmp301 = icmp eq i32 %171, 19
  br i1 %cmp301, label %if.then303, label %if.end319

if.then303:                                       ; preds = %lor.lhs.false300, %if.end297
  %172 = load i32, i32* %flags.addr, align 4
  %and304 = and i32 %172, 1
  %tobool305 = icmp ne i32 %and304, 0
  br i1 %tobool305, label %if.then306, label %if.end318

if.then306:                                       ; preds = %if.then303
  %173 = load i32, i32* %flags.addr, align 4
  %and307 = and i32 %173, 2
  %tobool308 = icmp ne i32 %and307, 0
  br i1 %tobool308, label %if.then309, label %if.end311

if.then309:                                       ; preds = %if.then306
  %174 = load i32, i32* %ri, align 4
  %call310 = call i32 @add_undo_redirect(i32 2, i32 %174, i32 -1)
  br label %if.end311

if.end311:                                        ; preds = %if.then309, %if.then306
  %call312 = call i32 @dup2(i32 1, i32 2)
  %cmp313 = icmp slt i32 %call312, 0
  br i1 %cmp313, label %if.then315, label %if.end317

if.then315:                                       ; preds = %if.end311
  %call316 = call i32* @__errno_location()
  %175 = load i32, i32* %call316, align 4
  store i32 %175, i32* %retval, align 4
  br label %return

if.end317:                                        ; preds = %if.end311
  br label %if.end318

if.end318:                                        ; preds = %if.end317, %if.then303
  br label %if.end319

if.end319:                                        ; preds = %if.end318, %lor.lhs.false300
  br label %sw.epilog700

sw.bb320:                                         ; preds = %if.end91, %if.end91, %if.end91
  %176 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %tobool321 = icmp ne %struct.word_desc* %176, null
  br i1 %tobool321, label %if.then322, label %if.end439

if.then322:                                       ; preds = %sw.bb320
  %177 = load %struct.word_desc*, %struct.word_desc** %redirectee, align 4
  %178 = load i32, i32* %ri, align 4
  %call323 = call i32 @here_document_to_fd(%struct.word_desc* %177, i32 %178)
  store i32 %call323, i32* %fd, align 4
  %179 = load i32, i32* %fd, align 4
  %cmp324 = icmp slt i32 %179, 0
  br i1 %cmp324, label %if.then326, label %if.end328

if.then326:                                       ; preds = %if.then322
  %call327 = call i32* @__errno_location()
  %180 = load i32, i32* %call327, align 4
  store i32 %180, i32* @heredoc_errno, align 4
  store i32 -4, i32* %retval, align 4
  br label %return

if.end328:                                        ; preds = %if.then322
  %181 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags329 = getelementptr inbounds %struct.redirect, %struct.redirect* %181, i32 0, i32 2
  %182 = load i32, i32* %rflags329, align 4
  %and330 = and i32 %182, 1
  %tobool331 = icmp ne i32 %and330, 0
  br i1 %tobool331, label %if.then332, label %if.end357

if.then332:                                       ; preds = %if.end328
  %183 = load i32, i32* %fd, align 4
  %call333 = call i32 (i32, i32, ...) @fcntl(i32 %183, i32 0, i32 10)
  store i32 %call333, i32* %redirector, align 4
  %call334 = call i32* @__errno_location()
  %184 = load i32, i32* %call334, align 4
  store i32 %184, i32* %r, align 4
  %185 = load i32, i32* %redirector, align 4
  %cmp335 = icmp slt i32 %185, 0
  br i1 %cmp335, label %if.then337, label %if.end339

if.then337:                                       ; preds = %if.then332
  %call338 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @sys_error(i8* %call338)
  br label %if.end339

if.end339:                                        ; preds = %if.then337, %if.then332
  br label %do.body340

do.body340:                                       ; preds = %if.end339
  %186 = load i32, i32* %redirector, align 4
  %cmp341 = icmp slt i32 %186, 0
  br i1 %cmp341, label %if.then343, label %if.end355

if.then343:                                       ; preds = %do.body340
  %187 = load i32, i32* %fd, align 4
  %cmp344 = icmp sge i32 %187, 0
  br i1 %cmp344, label %if.then346, label %if.end348

if.then346:                                       ; preds = %if.then343
  %188 = load i32, i32* %fd, align 4
  %call347 = call i32 @close(i32 %188)
  br label %if.end348

if.end348:                                        ; preds = %if.then346, %if.then343
  store i32 1, i32* @last_command_exit_value, align 4
  %189 = load i32, i32* %r, align 4
  %cmp349 = icmp eq i32 %189, 0
  br i1 %cmp349, label %cond.true351, label %cond.false352

cond.true351:                                     ; preds = %if.end348
  br label %cond.end353

cond.false352:                                    ; preds = %if.end348
  %190 = load i32, i32* %r, align 4
  br label %cond.end353

cond.end353:                                      ; preds = %cond.false352, %cond.true351
  %cond354 = phi i32 [ 22, %cond.true351 ], [ %190, %cond.false352 ]
  store i32 %cond354, i32* %retval, align 4
  br label %return

if.end355:                                        ; preds = %do.body340
  br label %do.end356

do.end356:                                        ; preds = %if.end355
  br label %if.end357

if.end357:                                        ; preds = %do.end356, %if.end328
  %191 = load i32, i32* %flags.addr, align 4
  %and358 = and i32 %191, 1
  %tobool359 = icmp ne i32 %and358, 0
  br i1 %tobool359, label %if.then360, label %if.end433

if.then360:                                       ; preds = %if.end357
  %192 = load i32, i32* %flags.addr, align 4
  %and361 = and i32 %192, 2
  %tobool362 = icmp ne i32 %and361, 0
  br i1 %tobool362, label %land.lhs.true363, label %if.end399

land.lhs.true363:                                 ; preds = %if.then360
  %193 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags364 = getelementptr inbounds %struct.redirect, %struct.redirect* %193, i32 0, i32 2
  %194 = load i32, i32* %rflags364, align 4
  %and365 = and i32 %194, 1
  %cmp366 = icmp eq i32 %and365, 0
  br i1 %cmp366, label %if.then368, label %if.end399

if.then368:                                       ; preds = %land.lhs.true363
  %195 = load i32, i32* %fd, align 4
  %196 = load i32, i32* %redirector, align 4
  %cmp369 = icmp ne i32 %195, %196
  br i1 %cmp369, label %land.lhs.true371, label %if.else377

land.lhs.true371:                                 ; preds = %if.then368
  %197 = load i32, i32* %redirector, align 4
  %call372 = call i32 (i32, i32, ...) @fcntl(i32 %197, i32 1, i32 0)
  %cmp373 = icmp ne i32 %call372, -1
  br i1 %cmp373, label %if.then375, label %if.else377

if.then375:                                       ; preds = %land.lhs.true371
  %198 = load i32, i32* %redirector, align 4
  %199 = load i32, i32* %ri, align 4
  %call376 = call i32 @add_undo_redirect(i32 %198, i32 %199, i32 -1)
  store i32 %call376, i32* %r, align 4
  br label %if.end379

if.else377:                                       ; preds = %land.lhs.true371, %if.then368
  %200 = load i32, i32* %redirector, align 4
  %call378 = call i32 @add_undo_close_redirect(i32 %200)
  store i32 %call378, i32* %r, align 4
  br label %if.end379

if.end379:                                        ; preds = %if.else377, %if.then375
  br label %do.body380

do.body380:                                       ; preds = %if.end379
  %201 = load i32, i32* %r, align 4
  %cmp381 = icmp slt i32 %201, 0
  br i1 %cmp381, label %if.then383, label %if.end397

if.then383:                                       ; preds = %do.body380
  %202 = load i32, i32* %fd, align 4
  %cmp384 = icmp sge i32 %202, 0
  br i1 %cmp384, label %if.then386, label %if.end388

if.then386:                                       ; preds = %if.then383
  %203 = load i32, i32* %fd, align 4
  %call387 = call i32 @close(i32 %203)
  br label %if.end388

if.end388:                                        ; preds = %if.then386, %if.then383
  store i32 1, i32* @last_command_exit_value, align 4
  %call389 = call i32* @__errno_location()
  %204 = load i32, i32* %call389, align 4
  %cmp390 = icmp eq i32 %204, 0
  br i1 %cmp390, label %cond.true392, label %cond.false393

cond.true392:                                     ; preds = %if.end388
  br label %cond.end395

cond.false393:                                    ; preds = %if.end388
  %call394 = call i32* @__errno_location()
  %205 = load i32, i32* %call394, align 4
  br label %cond.end395

cond.end395:                                      ; preds = %cond.false393, %cond.true392
  %cond396 = phi i32 [ 22, %cond.true392 ], [ %205, %cond.false393 ]
  store i32 %cond396, i32* %retval, align 4
  br label %return

if.end397:                                        ; preds = %do.body380
  br label %do.end398

do.end398:                                        ; preds = %if.end397
  br label %if.end399

if.end399:                                        ; preds = %do.end398, %land.lhs.true363, %if.then360
  %206 = load i32, i32* %redirector, align 4
  %call400 = call i32 @check_bash_input(i32 %206)
  %207 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags401 = getelementptr inbounds %struct.redirect, %struct.redirect* %207, i32 0, i32 2
  %208 = load i32, i32* %rflags401, align 4
  %and402 = and i32 %208, 1
  %tobool403 = icmp ne i32 %and402, 0
  br i1 %tobool403, label %if.then404, label %if.else412

if.then404:                                       ; preds = %if.end399
  %209 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %210 = load i32, i32* %redirector, align 4
  %call405 = call i32 @redir_varassign(%struct.redirect* %209, i32 %210)
  store i32 %call405, i32* %r, align 4
  %cmp406 = icmp slt i32 %call405, 0
  br i1 %cmp406, label %if.then408, label %if.end411

if.then408:                                       ; preds = %if.then404
  %211 = load i32, i32* %redirector, align 4
  %call409 = call i32 @close(i32 %211)
  %212 = load i32, i32* %fd, align 4
  %call410 = call i32 @close(i32 %212)
  %213 = load i32, i32* %r, align 4
  store i32 %213, i32* %retval, align 4
  br label %return

if.end411:                                        ; preds = %if.then404
  br label %if.end423

if.else412:                                       ; preds = %if.end399
  %214 = load i32, i32* %fd, align 4
  %215 = load i32, i32* %redirector, align 4
  %cmp413 = icmp ne i32 %214, %215
  br i1 %cmp413, label %land.lhs.true415, label %if.end422

land.lhs.true415:                                 ; preds = %if.else412
  %216 = load i32, i32* %fd, align 4
  %217 = load i32, i32* %redirector, align 4
  %call416 = call i32 @dup2(i32 %216, i32 %217)
  %cmp417 = icmp slt i32 %call416, 0
  br i1 %cmp417, label %if.then419, label %if.end422

if.then419:                                       ; preds = %land.lhs.true415
  %call420 = call i32* @__errno_location()
  %218 = load i32, i32* %call420, align 4
  store i32 %218, i32* %r, align 4
  %219 = load i32, i32* %fd, align 4
  %call421 = call i32 @close(i32 %219)
  %220 = load i32, i32* %r, align 4
  store i32 %220, i32* %retval, align 4
  br label %return

if.end422:                                        ; preds = %land.lhs.true415, %if.else412
  br label %if.end423

if.end423:                                        ; preds = %if.end422, %if.end411
  %221 = load i32, i32* %fd, align 4
  %222 = load i32, i32* %redirector, align 4
  %call424 = call i32 @duplicate_buffered_stream(i32 %221, i32 %222)
  %223 = load i32, i32* %flags.addr, align 4
  %and425 = and i32 %223, 4
  %tobool426 = icmp ne i32 %and425, 0
  br i1 %tobool426, label %land.lhs.true427, label %if.end432

land.lhs.true427:                                 ; preds = %if.end423
  %224 = load i32, i32* %redirector, align 4
  %cmp428 = icmp sgt i32 %224, 2
  br i1 %cmp428, label %if.then430, label %if.end432

if.then430:                                       ; preds = %land.lhs.true427
  %225 = load i32, i32* %redirector, align 4
  %call431 = call i32 (i32, i32, ...) @fcntl(i32 %225, i32 2, i32 1)
  br label %if.end432

if.end432:                                        ; preds = %if.then430, %land.lhs.true427, %if.end423
  br label %if.end433

if.end433:                                        ; preds = %if.end432, %if.end357
  %226 = load i32, i32* %fd, align 4
  %227 = load i32, i32* %redirector, align 4
  %cmp434 = icmp ne i32 %226, %227
  br i1 %cmp434, label %if.then436, label %if.end438

if.then436:                                       ; preds = %if.end433
  %228 = load i32, i32* %fd, align 4
  %call437 = call i32 @close_buffered_fd(i32 %228)
  br label %if.end438

if.end438:                                        ; preds = %if.then436, %if.end433
  br label %if.end439

if.end439:                                        ; preds = %if.end438, %sw.bb320
  br label %sw.epilog700

sw.bb440:                                         ; preds = %if.end91, %if.end91, %if.end91, %if.end91
  %229 = load i32, i32* %flags.addr, align 4
  %and441 = and i32 %229, 1
  %tobool442 = icmp ne i32 %and441, 0
  br i1 %tobool442, label %land.lhs.true443, label %if.end467

land.lhs.true443:                                 ; preds = %sw.bb440
  %230 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags444 = getelementptr inbounds %struct.redirect, %struct.redirect* %230, i32 0, i32 2
  %231 = load i32, i32* %rflags444, align 4
  %and445 = and i32 %231, 1
  %tobool446 = icmp ne i32 %and445, 0
  br i1 %tobool446, label %if.then447, label %if.end467

if.then447:                                       ; preds = %land.lhs.true443
  %232 = load i32, i32* %redir_fd, align 4
  %call448 = call i32 (i32, i32, ...) @fcntl(i32 %232, i32 0, i32 10)
  store i32 %call448, i32* %redirector, align 4
  %call449 = call i32* @__errno_location()
  %233 = load i32, i32* %call449, align 4
  store i32 %233, i32* %r, align 4
  %234 = load i32, i32* %redirector, align 4
  %cmp450 = icmp slt i32 %234, 0
  br i1 %cmp450, label %if.then452, label %if.end454

if.then452:                                       ; preds = %if.then447
  %call453 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @sys_error(i8* %call453)
  br label %if.end454

if.end454:                                        ; preds = %if.then452, %if.then447
  br label %do.body455

do.body455:                                       ; preds = %if.end454
  %235 = load i32, i32* %redirector, align 4
  %cmp456 = icmp slt i32 %235, 0
  br i1 %cmp456, label %if.then458, label %if.end465

if.then458:                                       ; preds = %do.body455
  store i32 1, i32* @last_command_exit_value, align 4
  %236 = load i32, i32* %r, align 4
  %cmp459 = icmp eq i32 %236, 0
  br i1 %cmp459, label %cond.true461, label %cond.false462

cond.true461:                                     ; preds = %if.then458
  br label %cond.end463

cond.false462:                                    ; preds = %if.then458
  %237 = load i32, i32* %r, align 4
  br label %cond.end463

cond.end463:                                      ; preds = %cond.false462, %cond.true461
  %cond464 = phi i32 [ 22, %cond.true461 ], [ %237, %cond.false462 ]
  store i32 %cond464, i32* %retval, align 4
  br label %return

if.end465:                                        ; preds = %do.body455
  br label %do.end466

do.end466:                                        ; preds = %if.end465
  br label %if.end467

if.end467:                                        ; preds = %do.end466, %land.lhs.true443, %sw.bb440
  %238 = load i32, i32* %flags.addr, align 4
  %and468 = and i32 %238, 1
  %tobool469 = icmp ne i32 %and468, 0
  br i1 %tobool469, label %land.lhs.true470, label %if.end616

land.lhs.true470:                                 ; preds = %if.end467
  %239 = load i32, i32* %redir_fd, align 4
  %240 = load i32, i32* %redirector, align 4
  %cmp471 = icmp ne i32 %239, %240
  br i1 %cmp471, label %if.then473, label %if.end616

if.then473:                                       ; preds = %land.lhs.true470
  %241 = load i32, i32* %flags.addr, align 4
  %and474 = and i32 %241, 2
  %tobool475 = icmp ne i32 %and474, 0
  br i1 %tobool475, label %land.lhs.true476, label %if.end504

land.lhs.true476:                                 ; preds = %if.then473
  %242 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags477 = getelementptr inbounds %struct.redirect, %struct.redirect* %242, i32 0, i32 2
  %243 = load i32, i32* %rflags477, align 4
  %and478 = and i32 %243, 1
  %cmp479 = icmp eq i32 %and478, 0
  br i1 %cmp479, label %if.then481, label %if.end504

if.then481:                                       ; preds = %land.lhs.true476
  %244 = load i32, i32* %redirector, align 4
  %call482 = call i32 (i32, i32, ...) @fcntl(i32 %244, i32 1, i32 0)
  %cmp483 = icmp ne i32 %call482, -1
  br i1 %cmp483, label %if.then485, label %if.else487

if.then485:                                       ; preds = %if.then481
  %245 = load i32, i32* %redirector, align 4
  %246 = load i32, i32* %ri, align 4
  %247 = load i32, i32* %redir_fd, align 4
  %call486 = call i32 @add_undo_redirect(i32 %245, i32 %246, i32 %247)
  store i32 %call486, i32* %r, align 4
  br label %if.end489

if.else487:                                       ; preds = %if.then481
  %248 = load i32, i32* %redirector, align 4
  %call488 = call i32 @add_undo_close_redirect(i32 %248)
  store i32 %call488, i32* %r, align 4
  br label %if.end489

if.end489:                                        ; preds = %if.else487, %if.then485
  br label %do.body490

do.body490:                                       ; preds = %if.end489
  %249 = load i32, i32* %r, align 4
  %cmp491 = icmp slt i32 %249, 0
  br i1 %cmp491, label %if.then493, label %if.end502

if.then493:                                       ; preds = %do.body490
  store i32 1, i32* @last_command_exit_value, align 4
  %call494 = call i32* @__errno_location()
  %250 = load i32, i32* %call494, align 4
  %cmp495 = icmp eq i32 %250, 0
  br i1 %cmp495, label %cond.true497, label %cond.false498

cond.true497:                                     ; preds = %if.then493
  br label %cond.end500

cond.false498:                                    ; preds = %if.then493
  %call499 = call i32* @__errno_location()
  %251 = load i32, i32* %call499, align 4
  br label %cond.end500

cond.end500:                                      ; preds = %cond.false498, %cond.true497
  %cond501 = phi i32 [ 22, %cond.true497 ], [ %251, %cond.false498 ]
  store i32 %cond501, i32* %retval, align 4
  br label %return

if.end502:                                        ; preds = %do.body490
  br label %do.end503

do.end503:                                        ; preds = %if.end502
  br label %if.end504

if.end504:                                        ; preds = %do.end503, %land.lhs.true476, %if.then473
  %252 = load i32, i32* %flags.addr, align 4
  %and505 = and i32 %252, 2
  %tobool506 = icmp ne i32 %and505, 0
  br i1 %tobool506, label %land.lhs.true507, label %if.end534

land.lhs.true507:                                 ; preds = %if.end504
  %253 = load i32, i32* %ri, align 4
  %cmp508 = icmp eq i32 %253, 15
  br i1 %cmp508, label %if.then513, label %lor.lhs.false510

lor.lhs.false510:                                 ; preds = %land.lhs.true507
  %254 = load i32, i32* %ri, align 4
  %cmp511 = icmp eq i32 %254, 16
  br i1 %cmp511, label %if.then513, label %if.end534

if.then513:                                       ; preds = %lor.lhs.false510, %land.lhs.true507
  %255 = load i32, i32* %redirector, align 4
  %call514 = call i32 (i32, i32, ...) @fcntl(i32 %255, i32 1, i32 0)
  %cmp515 = icmp ne i32 %call514, -1
  br i1 %cmp515, label %if.then517, label %if.end533

if.then517:                                       ; preds = %if.then513
  %256 = load i32, i32* %redir_fd, align 4
  %call518 = call i32 @add_undo_redirect(i32 %256, i32 9, i32 -1)
  store i32 %call518, i32* %r, align 4
  br label %do.body519

do.body519:                                       ; preds = %if.then517
  %257 = load i32, i32* %r, align 4
  %cmp520 = icmp slt i32 %257, 0
  br i1 %cmp520, label %if.then522, label %if.end531

if.then522:                                       ; preds = %do.body519
  store i32 1, i32* @last_command_exit_value, align 4
  %call523 = call i32* @__errno_location()
  %258 = load i32, i32* %call523, align 4
  %cmp524 = icmp eq i32 %258, 0
  br i1 %cmp524, label %cond.true526, label %cond.false527

cond.true526:                                     ; preds = %if.then522
  br label %cond.end529

cond.false527:                                    ; preds = %if.then522
  %call528 = call i32* @__errno_location()
  %259 = load i32, i32* %call528, align 4
  br label %cond.end529

cond.end529:                                      ; preds = %cond.false527, %cond.true526
  %cond530 = phi i32 [ 22, %cond.true526 ], [ %259, %cond.false527 ]
  store i32 %cond530, i32* %retval, align 4
  br label %return

if.end531:                                        ; preds = %do.body519
  br label %do.end532

do.end532:                                        ; preds = %if.end531
  br label %if.end533

if.end533:                                        ; preds = %do.end532, %if.then513
  br label %if.end534

if.end534:                                        ; preds = %if.end533, %lor.lhs.false510, %if.end504
  %260 = load i32, i32* %redirector, align 4
  %cmp535 = icmp ne i32 %260, 0
  br i1 %cmp535, label %if.then541, label %lor.lhs.false537

lor.lhs.false537:                                 ; preds = %if.end534
  %261 = load i32, i32* @subshell_environment, align 4
  %and538 = and i32 %261, 1
  %cmp539 = icmp eq i32 %and538, 0
  br i1 %cmp539, label %if.then541, label %if.end543

if.then541:                                       ; preds = %lor.lhs.false537, %if.end534
  %262 = load i32, i32* %redirector, align 4
  %call542 = call i32 @check_bash_input(i32 %262)
  br label %if.end543

if.end543:                                        ; preds = %if.then541, %lor.lhs.false537
  %263 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags544 = getelementptr inbounds %struct.redirect, %struct.redirect* %263, i32 0, i32 2
  %264 = load i32, i32* %rflags544, align 4
  %and545 = and i32 %264, 1
  %tobool546 = icmp ne i32 %and545, 0
  br i1 %tobool546, label %if.then547, label %if.else554

if.then547:                                       ; preds = %if.end543
  %265 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %266 = load i32, i32* %redirector, align 4
  %call548 = call i32 @redir_varassign(%struct.redirect* %265, i32 %266)
  store i32 %call548, i32* %r, align 4
  %cmp549 = icmp slt i32 %call548, 0
  br i1 %cmp549, label %if.then551, label %if.end553

if.then551:                                       ; preds = %if.then547
  %267 = load i32, i32* %redirector, align 4
  %call552 = call i32 @close(i32 %267)
  %268 = load i32, i32* %r, align 4
  store i32 %268, i32* %retval, align 4
  br label %return

if.end553:                                        ; preds = %if.then547
  br label %if.end561

if.else554:                                       ; preds = %if.end543
  %269 = load i32, i32* %redir_fd, align 4
  %270 = load i32, i32* %redirector, align 4
  %call555 = call i32 @dup2(i32 %269, i32 %270)
  %cmp556 = icmp slt i32 %call555, 0
  br i1 %cmp556, label %if.then558, label %if.end560

if.then558:                                       ; preds = %if.else554
  %call559 = call i32* @__errno_location()
  %271 = load i32, i32* %call559, align 4
  store i32 %271, i32* %retval, align 4
  br label %return

if.end560:                                        ; preds = %if.else554
  br label %if.end561

if.end561:                                        ; preds = %if.end560, %if.end553
  %272 = load i32, i32* %ri, align 4
  %cmp562 = icmp eq i32 %272, 6
  br i1 %cmp562, label %if.then567, label %lor.lhs.false564

lor.lhs.false564:                                 ; preds = %if.end561
  %273 = load i32, i32* %ri, align 4
  %cmp565 = icmp eq i32 %273, 15
  br i1 %cmp565, label %if.then567, label %if.end569

if.then567:                                       ; preds = %lor.lhs.false564, %if.end561
  %274 = load i32, i32* %redir_fd, align 4
  %275 = load i32, i32* %redirector, align 4
  %call568 = call i32 @duplicate_buffered_stream(i32 %274, i32 %275)
  br label %if.end569

if.end569:                                        ; preds = %if.then567, %lor.lhs.false564
  %276 = load i32, i32* %redir_fd, align 4
  %call570 = call i32 (i32, i32, ...) @fcntl(i32 %276, i32 1, i32 0)
  %cmp571 = icmp eq i32 %call570, 1
  br i1 %cmp571, label %land.lhs.true582, label %lor.lhs.false573

lor.lhs.false573:                                 ; preds = %if.end569
  %277 = load i32, i32* %redir_fd, align 4
  %cmp574 = icmp slt i32 %277, 2
  br i1 %cmp574, label %land.lhs.true576, label %lor.lhs.false579

land.lhs.true576:                                 ; preds = %lor.lhs.false573
  %278 = load i32, i32* %flags.addr, align 4
  %and577 = and i32 %278, 8
  %tobool578 = icmp ne i32 %and577, 0
  br i1 %tobool578, label %land.lhs.true582, label %lor.lhs.false579

lor.lhs.false579:                                 ; preds = %land.lhs.true576, %lor.lhs.false573
  %279 = load i32, i32* %flags.addr, align 4
  %and580 = and i32 %279, 4
  %tobool581 = icmp ne i32 %and580, 0
  br i1 %tobool581, label %land.lhs.true582, label %if.end587

land.lhs.true582:                                 ; preds = %lor.lhs.false579, %land.lhs.true576, %if.end569
  %280 = load i32, i32* %redirector, align 4
  %cmp583 = icmp sgt i32 %280, 2
  br i1 %cmp583, label %if.then585, label %if.end587

if.then585:                                       ; preds = %land.lhs.true582
  %281 = load i32, i32* %redirector, align 4
  %call586 = call i32 (i32, i32, ...) @fcntl(i32 %281, i32 2, i32 1)
  br label %if.end587

if.end587:                                        ; preds = %if.then585, %land.lhs.true582, %lor.lhs.false579
  %282 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags588 = getelementptr inbounds %struct.redirect, %struct.redirect* %282, i32 0, i32 3
  %283 = load i32, i32* %flags588, align 4
  %and589 = and i32 %283, 8
  %tobool590 = icmp ne i32 %and589, 0
  br i1 %tobool590, label %land.lhs.true591, label %if.end607

land.lhs.true591:                                 ; preds = %if.end587
  %284 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags592 = getelementptr inbounds %struct.redirect, %struct.redirect* %284, i32 0, i32 3
  %285 = load i32, i32* %flags592, align 4
  %and593 = and i32 %285, 32
  %tobool594 = icmp ne i32 %and593, 0
  br i1 %tobool594, label %land.lhs.true595, label %if.end607

land.lhs.true595:                                 ; preds = %land.lhs.true591
  %286 = load i32, i32* %redirector, align 4
  %cmp596 = icmp sge i32 %286, 3
  br i1 %cmp596, label %land.lhs.true598, label %if.end607

land.lhs.true598:                                 ; preds = %land.lhs.true595
  %287 = load i32, i32* %redir_fd, align 4
  %cmp599 = icmp sge i32 %287, 10
  br i1 %cmp599, label %if.then605, label %lor.lhs.false601

lor.lhs.false601:                                 ; preds = %land.lhs.true598
  %288 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %flags602 = getelementptr inbounds %struct.redirect, %struct.redirect* %288, i32 0, i32 3
  %289 = load i32, i32* %flags602, align 4
  %and603 = and i32 %289, 64
  %tobool604 = icmp ne i32 %and603, 0
  br i1 %tobool604, label %if.then605, label %if.end607

if.then605:                                       ; preds = %lor.lhs.false601, %land.lhs.true598
  %290 = load i32, i32* %redirector, align 4
  %call606 = call i32 (i32, i32, ...) @fcntl(i32 %290, i32 2, i32 0)
  br label %if.end607

if.end607:                                        ; preds = %if.then605, %lor.lhs.false601, %land.lhs.true595, %land.lhs.true591, %if.end587
  %291 = load i32, i32* %ri, align 4
  %cmp608 = icmp eq i32 %291, 15
  br i1 %cmp608, label %if.then613, label %lor.lhs.false610

lor.lhs.false610:                                 ; preds = %if.end607
  %292 = load i32, i32* %ri, align 4
  %cmp611 = icmp eq i32 %292, 16
  br i1 %cmp611, label %if.then613, label %if.end615

if.then613:                                       ; preds = %lor.lhs.false610, %if.end607
  %293 = load i32, i32* %redir_fd, align 4
  call void @xtrace_fdchk(i32 %293)
  %294 = load i32, i32* %redir_fd, align 4
  %call614 = call i32 @close(i32 %294)
  %295 = load i32, i32* %redir_fd, align 4
  call void @coproc_fdchk(i32 %295)
  br label %if.end615

if.end615:                                        ; preds = %if.then613, %lor.lhs.false610
  br label %if.end616

if.end616:                                        ; preds = %if.end615, %land.lhs.true470, %if.end467
  br label %sw.epilog700

sw.bb617:                                         ; preds = %if.end91
  %296 = load i32, i32* %flags.addr, align 4
  %and618 = and i32 %296, 1
  %tobool619 = icmp ne i32 %and618, 0
  br i1 %tobool619, label %if.then620, label %if.end698

if.then620:                                       ; preds = %sw.bb617
  %297 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %rflags621 = getelementptr inbounds %struct.redirect, %struct.redirect* %297, i32 0, i32 2
  %298 = load i32, i32* %rflags621, align 4
  %and622 = and i32 %298, 1
  %tobool623 = icmp ne i32 %and622, 0
  br i1 %tobool623, label %if.then624, label %if.end630

if.then624:                                       ; preds = %if.then620
  %299 = load %struct.redirect*, %struct.redirect** %redirect.addr, align 4
  %call625 = call i32 @redir_varvalue(%struct.redirect* %299)
  store i32 %call625, i32* %redirector, align 4
  %300 = load i32, i32* %redirector, align 4
  %cmp626 = icmp slt i32 %300, 0
  br i1 %cmp626, label %if.then628, label %if.end629

if.then628:                                       ; preds = %if.then624
  store i32 -1, i32* %retval, align 4
  br label %return

if.end629:                                        ; preds = %if.then624
  br label %if.end630

if.end630:                                        ; preds = %if.end629, %if.then620
  store i32 0, i32* %r, align 4
  %301 = load i32, i32* %flags.addr, align 4
  %and631 = and i32 %301, 2
  %tobool632 = icmp ne i32 %and631, 0
  br i1 %tobool632, label %land.lhs.true633, label %if.end658

land.lhs.true633:                                 ; preds = %if.end630
  %302 = load i32, i32* %redirector, align 4
  %call634 = call i32 (i32, i32, ...) @fcntl(i32 %302, i32 1, i32 0)
  %cmp635 = icmp ne i32 %call634, -1
  br i1 %cmp635, label %if.then637, label %if.end658

if.then637:                                       ; preds = %land.lhs.true633
  %303 = load i32, i32* %redirector, align 4
  %304 = load i32, i32* %ri, align 4
  %call638 = call i32 @add_undo_redirect(i32 %303, i32 %304, i32 -1)
  store i32 %call638, i32* %r, align 4
  br label %do.body639

do.body639:                                       ; preds = %if.then637
  %305 = load i32, i32* %r, align 4
  %cmp640 = icmp slt i32 %305, 0
  br i1 %cmp640, label %if.then642, label %if.end656

if.then642:                                       ; preds = %do.body639
  %306 = load i32, i32* %redirector, align 4
  %cmp643 = icmp sge i32 %306, 0
  br i1 %cmp643, label %if.then645, label %if.end647

if.then645:                                       ; preds = %if.then642
  %307 = load i32, i32* %redirector, align 4
  %call646 = call i32 @close(i32 %307)
  br label %if.end647

if.end647:                                        ; preds = %if.then645, %if.then642
  store i32 1, i32* @last_command_exit_value, align 4
  %call648 = call i32* @__errno_location()
  %308 = load i32, i32* %call648, align 4
  %cmp649 = icmp eq i32 %308, 0
  br i1 %cmp649, label %cond.true651, label %cond.false652

cond.true651:                                     ; preds = %if.end647
  br label %cond.end654

cond.false652:                                    ; preds = %if.end647
  %call653 = call i32* @__errno_location()
  %309 = load i32, i32* %call653, align 4
  br label %cond.end654

cond.end654:                                      ; preds = %cond.false652, %cond.true651
  %cond655 = phi i32 [ 22, %cond.true651 ], [ %309, %cond.false652 ]
  store i32 %cond655, i32* %retval, align 4
  br label %return

if.end656:                                        ; preds = %do.body639
  br label %do.end657

do.end657:                                        ; preds = %if.end656
  br label %if.end658

if.end658:                                        ; preds = %do.end657, %land.lhs.true633, %if.end630
  %310 = load i32, i32* %redirector, align 4
  call void @coproc_fdchk(i32 %310)
  %311 = load i32, i32* %redirector, align 4
  call void @xtrace_fdchk(i32 %311)
  %312 = load i32, i32* %redirector, align 4
  %cmp659 = icmp ne i32 %312, 0
  br i1 %cmp659, label %if.then665, label %lor.lhs.false661

lor.lhs.false661:                                 ; preds = %if.end658
  %313 = load i32, i32* @subshell_environment, align 4
  %and662 = and i32 %313, 1
  %cmp663 = icmp eq i32 %and662, 0
  br i1 %cmp663, label %if.then665, label %if.end667

if.then665:                                       ; preds = %lor.lhs.false661, %if.end658
  %314 = load i32, i32* %redirector, align 4
  %call666 = call i32 @check_bash_input(i32 %314)
  br label %if.end667

if.end667:                                        ; preds = %if.then665, %lor.lhs.false661
  %315 = load i32, i32* %redirector, align 4
  %call668 = call i32 @close_buffered_fd(i32 %315)
  store i32 %call668, i32* %r, align 4
  %316 = load i32, i32* %r, align 4
  %cmp669 = icmp slt i32 %316, 0
  br i1 %cmp669, label %land.lhs.true671, label %if.end697

land.lhs.true671:                                 ; preds = %if.end667
  %317 = load i32, i32* %flags.addr, align 4
  %and672 = and i32 %317, 8
  %tobool673 = icmp ne i32 %and672, 0
  br i1 %tobool673, label %land.lhs.true674, label %if.end697

land.lhs.true674:                                 ; preds = %land.lhs.true671
  %call675 = call i32* @__errno_location()
  %318 = load i32, i32* %call675, align 4
  %cmp676 = icmp eq i32 %318, 5
  br i1 %cmp676, label %if.then682, label %lor.lhs.false678

lor.lhs.false678:                                 ; preds = %land.lhs.true674
  %call679 = call i32* @__errno_location()
  %319 = load i32, i32* %call679, align 4
  %cmp680 = icmp eq i32 %319, 28
  br i1 %cmp680, label %if.then682, label %if.end697

if.then682:                                       ; preds = %lor.lhs.false678, %land.lhs.true674
  br label %do.body683

do.body683:                                       ; preds = %if.then682
  %320 = load i32, i32* %r, align 4
  %cmp684 = icmp slt i32 %320, 0
  br i1 %cmp684, label %if.then686, label %if.end695

if.then686:                                       ; preds = %do.body683
  store i32 1, i32* @last_command_exit_value, align 4
  %call687 = call i32* @__errno_location()
  %321 = load i32, i32* %call687, align 4
  %cmp688 = icmp eq i32 %321, 0
  br i1 %cmp688, label %cond.true690, label %cond.false691

cond.true690:                                     ; preds = %if.then686
  br label %cond.end693

cond.false691:                                    ; preds = %if.then686
  %call692 = call i32* @__errno_location()
  %322 = load i32, i32* %call692, align 4
  br label %cond.end693

cond.end693:                                      ; preds = %cond.false691, %cond.true690
  %cond694 = phi i32 [ 22, %cond.true690 ], [ %322, %cond.false691 ]
  store i32 %cond694, i32* %retval, align 4
  br label %return

if.end695:                                        ; preds = %do.body683
  br label %do.end696

do.end696:                                        ; preds = %if.end695
  br label %if.end697

if.end697:                                        ; preds = %do.end696, %lor.lhs.false678, %land.lhs.true671, %if.end667
  br label %if.end698

if.end698:                                        ; preds = %if.end697, %sw.bb617
  br label %sw.epilog700

sw.bb699:                                         ; preds = %if.end91, %if.end91
  br label %sw.epilog700

sw.epilog700:                                     ; preds = %if.end91, %sw.bb699, %if.end698, %if.end616, %if.end439, %if.end319
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog700, %cond.end693, %cond.end654, %if.then628, %if.then558, %if.then551, %cond.end529, %cond.end500, %cond.end463, %if.then419, %if.then408, %cond.end395, %cond.end353, %if.then326, %if.then315, %if.then259, %if.then248, %cond.end206, %cond.end, %if.then143, %if.then139, %if.then133, %if.then112, %if.else60, %if.then13
  %323 = load i32, i32* %retval, align 4
  ret i32 %323
}

declare %struct.word_desc* @copy_word(%struct.word_desc*) #1

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare void @sv_ifs(i8*) #1

declare %struct.word_list* @expand_words_no_vars(%struct.word_list*) #1

declare void @dispose_words(%struct.word_list*) #1

declare i8* @string_list(%struct.word_list*) #1

; Function Attrs: noinline nounwind
define i32 @stdin_redirects(%struct.redirect* %redirs) #0 {
entry:
  %redirs.addr = alloca %struct.redirect*, align 4
  %rp = alloca %struct.redirect*, align 4
  %n = alloca i32, align 4
  store %struct.redirect* %redirs, %struct.redirect** %redirs.addr, align 4
  store i32 0, i32* %n, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redirs.addr, align 4
  store %struct.redirect* %0, %struct.redirect** %rp, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load %struct.redirect*, %struct.redirect** %rp, align 4
  %tobool = icmp ne %struct.redirect* %1, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.redirect*, %struct.redirect** %rp, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 2
  %3 = load i32, i32* %rflags, align 4
  %and = and i32 %3, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct.redirect*, %struct.redirect** %rp, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 4
  %5 = load i32, i32* %instruction, align 4
  %6 = load %struct.redirect*, %struct.redirect** %rp, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 1
  %dest = bitcast %union.REDIRECTEE* %redirector to i32*
  %7 = load i32, i32* %dest, align 4
  %call = call i32 @stdin_redirection(i32 %5, i32 %7)
  %8 = load i32, i32* %n, align 4
  %add = add nsw i32 %8, %call
  store i32 %add, i32* %n, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load %struct.redirect*, %struct.redirect** %rp, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %9, i32 0, i32 0
  %10 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %10, %struct.redirect** %rp, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %n, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i32 @stdin_redirection(i32 %ri, i32 %redirector) #0 {
entry:
  %retval = alloca i32, align 4
  %ri.addr = alloca i32, align 4
  %redirector.addr = alloca i32, align 4
  store i32 %ri, i32* %ri.addr, align 4
  store i32 %redirector, i32* %redirector.addr, align 4
  %0 = load i32, i32* %ri.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb
    i32 11, label %sw.bb
    i32 4, label %sw.bb
    i32 8, label %sw.bb
    i32 5, label %sw.bb
    i32 6, label %sw.bb1
    i32 13, label %sw.bb1
    i32 9, label %sw.bb1
    i32 0, label %sw.bb2
    i32 3, label %sw.bb2
    i32 7, label %sw.bb2
    i32 10, label %sw.bb2
    i32 19, label %sw.bb2
    i32 12, label %sw.bb2
    i32 14, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry, %entry
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb1:                                           ; preds = %entry, %entry, %entry
  %1 = load i32, i32* %redirector.addr, align 4
  %cmp = icmp eq i32 %1, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %entry, %entry, %entry, %entry, %entry, %entry, %entry
  store i32 0, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb2, %sw.bb1, %sw.bb
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4, i32, %union.REDIRECTEE* byval align 4, i32) #1

declare i32 @all_digits(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare %struct.word_desc* @make_bare_word(i8*) #1

declare void @xbcopy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @redir_open(i8* %filename, i32 %flags, i32 %mode, i32 %ri) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %ri.addr = alloca i32, align 4
  %fd = alloca i32, align 4
  %r = alloca i32, align 4
  %e = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %ri, i32* %ri.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @find_string_in_alist(i8* %0, %struct.STRING_INT_ALIST* getelementptr inbounds ([3 x %struct.STRING_INT_ALIST], [3 x %struct.STRING_INT_ALIST]* @_redir_special_filenames, i32 0, i32 0), i32 1)
  store i32 %call, i32* %r, align 4
  %1 = load i32, i32* %r, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %r, align 4
  %3 = load i8*, i8** %filename.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %5 = load i32, i32* %mode.addr, align 4
  %6 = load i32, i32* %ri.addr, align 4
  %call1 = call i32 @redir_special_open(i32 %2, i8* %3, i32 %4, i32 %5, i32 %6)
  store i32 %call1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %7 = load i32, i32* @noclobber, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %8 = load i32, i32* %ri.addr, align 4
  %cmp2 = icmp eq i32 %8, 0
  br i1 %cmp2, label %if.then4, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %9 = load i32, i32* %ri.addr, align 4
  %cmp3 = icmp eq i32 %9, 10
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %10 = load i8*, i8** %filename.addr, align 4
  %11 = load i32, i32* %flags.addr, align 4
  %12 = load i32, i32* %mode.addr, align 4
  %13 = load i32, i32* %ri.addr, align 4
  %call5 = call i32 @noclobber_open(i8* %10, i32 %11, i32 %12, i32 %13)
  store i32 %call5, i32* %fd, align 4
  %14 = load i32, i32* %fd, align 4
  %cmp6 = icmp eq i32 %14, -2
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.then4
  store i32 -2, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.then4
  br label %if.end28

if.else:                                          ; preds = %lor.lhs.false, %if.end
  br label %do.body

do.body:                                          ; preds = %land.end, %if.else
  %15 = load i8*, i8** %filename.addr, align 4
  %16 = load i32, i32* %flags.addr, align 4
  %17 = load i32, i32* %mode.addr, align 4
  %call9 = call i32 (i8*, i32, ...) @open(i8* %15, i32 %16, i32 %17)
  store i32 %call9, i32* %fd, align 4
  %call10 = call i32* @__errno_location()
  %18 = load i32, i32* %call10, align 4
  store i32 %18, i32* %e, align 4
  %19 = load i32, i32* %fd, align 4
  %cmp11 = icmp slt i32 %19, 0
  br i1 %cmp11, label %land.lhs.true12, label %if.end22

land.lhs.true12:                                  ; preds = %do.body
  %20 = load i32, i32* %e, align 4
  %cmp13 = icmp eq i32 %20, 4
  br i1 %cmp13, label %if.then14, label %if.end22

if.then14:                                        ; preds = %land.lhs.true12
  br label %do.body15

do.body15:                                        ; preds = %if.then14
  %21 = load volatile i32, i32* @terminating_signal, align 4
  %tobool16 = icmp ne i32 %21, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %do.body15
  %22 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %22)
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %do.body15
  %23 = load volatile i32, i32* @interrupt_state, align 4
  %tobool19 = icmp ne i32 %23, 0
  br i1 %tobool19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  call void @throw_to_top_level()
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end18
  br label %do.end

do.end:                                           ; preds = %if.end21
  call void @run_pending_traps()
  br label %if.end22

if.end22:                                         ; preds = %do.end, %land.lhs.true12, %do.body
  %24 = load i32, i32* %e, align 4
  %call23 = call i32* @__errno_location()
  store i32 %24, i32* %call23, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end22
  %25 = load i32, i32* %fd, align 4
  %cmp24 = icmp slt i32 %25, 0
  br i1 %cmp24, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.cond
  %call25 = call i32* @__errno_location()
  %26 = load i32, i32* %call25, align 4
  %cmp26 = icmp eq i32 %26, 4
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %27 = phi i1 [ false, %do.cond ], [ %cmp26, %land.rhs ]
  br i1 %27, label %do.body, label %do.end27

do.end27:                                         ; preds = %land.end
  br label %if.end28

if.end28:                                         ; preds = %do.end27, %if.end8
  %28 = load i32, i32* %fd, align 4
  store i32 %28, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end28, %if.then7, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

declare i32* @__errno_location() #1

declare i32 @fcntl(i32, i32, ...) #1

declare void @sys_error(i8*, ...) #1

declare i32 @close(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @add_undo_redirect(i32 %fd, i32 %ri, i32 %fdbase) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ri.addr = alloca i32, align 4
  %fdbase.addr = alloca i32, align 4
  %new_fd = alloca i32, align 4
  %clexec_flag = alloca i32, align 4
  %savefd_flag = alloca i32, align 4
  %new_redirect = alloca %struct.redirect*, align 4
  %closer = alloca %struct.redirect*, align 4
  %dummy_redirect = alloca %struct.redirect*, align 4
  %sd = alloca %union.REDIRECTEE, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %ri, i32* %ri.addr, align 4
  store i32 %fdbase, i32* %fdbase.addr, align 4
  store i32 0, i32* %savefd_flag, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i32, i32* %fdbase.addr, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %fdbase.addr, align 4
  %add = add nsw i32 %2, 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 10, %cond.true ], [ %add, %cond.false ]
  %call = call i32 (i32, i32, ...) @fcntl(i32 %0, i32 0, i32 %cond)
  store i32 %call, i32* %new_fd, align 4
  %3 = load i32, i32* %new_fd, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %4 = load i32, i32* %fd.addr, align 4
  %call2 = call i32 (i32, i32, ...) @fcntl(i32 %4, i32 0, i32 10)
  store i32 %call2, i32* %new_fd, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load i32, i32* %new_fd, align 4
  %cmp3 = icmp slt i32 %5, 0
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %6 = load i32, i32* %fd.addr, align 4
  %call5 = call i32 (i32, i32, ...) @fcntl(i32 %6, i32 0, i32 0)
  store i32 %call5, i32* %new_fd, align 4
  store i32 1, i32* %savefd_flag, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %7 = load i32, i32* %new_fd, align 4
  %cmp7 = icmp slt i32 %7, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %call9 = call i8* @libintl_gettext(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @sys_error(i8* %call9)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end6
  %8 = load i32, i32* %fd.addr, align 4
  %call11 = call i32 (i32, i32, ...) @fcntl(i32 %8, i32 1, i32 0)
  store i32 %call11, i32* %clexec_flag, align 4
  %9 = load i32, i32* %new_fd, align 4
  %dest = bitcast %union.REDIRECTEE* %sd to i32*
  store i32 %9, i32* %dest, align 4
  store i32 0, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  %call12 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 9, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call12, %struct.redirect** %closer, align 4
  %10 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %flags = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 3
  %11 = load i32, i32* %flags, align 4
  %or = or i32 %11, 8
  store i32 %or, i32* %flags, align 4
  %12 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %call13 = call %struct.redirect* @copy_redirects(%struct.redirect* %12)
  store %struct.redirect* %call13, %struct.redirect** %dummy_redirect, align 4
  %13 = load i32, i32* %fd.addr, align 4
  %dest14 = bitcast %union.REDIRECTEE* %sd to i32*
  store i32 %13, i32* %dest14, align 4
  %14 = load i32, i32* %new_fd, align 4
  store i32 %14, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  %15 = load i32, i32* %fd.addr, align 4
  %cmp15 = icmp eq i32 %15, 0
  br i1 %cmp15, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end10
  %call17 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 6, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call17, %struct.redirect** %new_redirect, align 4
  br label %if.end19

if.else:                                          ; preds = %if.end10
  %call18 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 7, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call18, %struct.redirect** %new_redirect, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then16
  %16 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %flags20 = getelementptr inbounds %struct.redirect, %struct.redirect* %16, i32 0, i32 3
  %17 = load i32, i32* %flags20, align 4
  %or21 = or i32 %17, 8
  store i32 %or21, i32* %flags20, align 4
  %18 = load i32, i32* %savefd_flag, align 4
  %tobool = icmp ne i32 %18, 0
  br i1 %tobool, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end19
  %19 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %flags23 = getelementptr inbounds %struct.redirect, %struct.redirect* %19, i32 0, i32 3
  %20 = load i32, i32* %flags23, align 4
  %or24 = or i32 %20, 64
  store i32 %or24, i32* %flags23, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end19
  %21 = load i32, i32* %clexec_flag, align 4
  %cmp26 = icmp eq i32 %21, 0
  br i1 %cmp26, label %land.lhs.true, label %if.end34

land.lhs.true:                                    ; preds = %if.end25
  %22 = load i32, i32* %fd.addr, align 4
  %cmp27 = icmp sge i32 %22, 3
  br i1 %cmp27, label %land.lhs.true28, label %if.end34

land.lhs.true28:                                  ; preds = %land.lhs.true
  %23 = load i32, i32* %new_fd, align 4
  %cmp29 = icmp sge i32 %23, 10
  br i1 %cmp29, label %if.then31, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true28
  %24 = load i32, i32* %savefd_flag, align 4
  %tobool30 = icmp ne i32 %24, 0
  br i1 %tobool30, label %if.then31, label %if.end34

if.then31:                                        ; preds = %lor.lhs.false, %land.lhs.true28
  %25 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %flags32 = getelementptr inbounds %struct.redirect, %struct.redirect* %25, i32 0, i32 3
  %26 = load i32, i32* %flags32, align 4
  %or33 = or i32 %26, 32
  store i32 %or33, i32* %flags32, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then31, %lor.lhs.false, %land.lhs.true, %if.end25
  %27 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %28 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %28, i32 0, i32 0
  store %struct.redirect* %27, %struct.redirect** %next, align 4
  %29 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %30 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %next35 = getelementptr inbounds %struct.redirect, %struct.redirect* %30, i32 0, i32 0
  store %struct.redirect* %29, %struct.redirect** %next35, align 4
  %31 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  store %struct.redirect* %31, %struct.redirect** @redirection_undo_list, align 4
  %32 = load %struct.redirect*, %struct.redirect** %dummy_redirect, align 4
  call void @add_exec_redirect(%struct.redirect* %32)
  %33 = load i32, i32* %fd.addr, align 4
  %cmp36 = icmp sge i32 %33, 10
  br i1 %cmp36, label %land.lhs.true37, label %if.end46

land.lhs.true37:                                  ; preds = %if.end34
  %34 = load i32, i32* %ri.addr, align 4
  %cmp38 = icmp ne i32 %34, 9
  br i1 %cmp38, label %land.lhs.true39, label %if.end46

land.lhs.true39:                                  ; preds = %land.lhs.true37
  %35 = load i32, i32* %clexec_flag, align 4
  %tobool40 = icmp ne i32 %35, 0
  br i1 %tobool40, label %if.then41, label %if.end46

if.then41:                                        ; preds = %land.lhs.true39
  %36 = load i32, i32* %fd.addr, align 4
  %dest42 = bitcast %union.REDIRECTEE* %sd to i32*
  store i32 %36, i32* %dest42, align 4
  %37 = load i32, i32* %new_fd, align 4
  store i32 %37, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  %call43 = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 7, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call43, %struct.redirect** %new_redirect, align 4
  %38 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  %flags44 = getelementptr inbounds %struct.redirect, %struct.redirect* %38, i32 0, i32 3
  %39 = load i32, i32* %flags44, align 4
  %or45 = or i32 %39, 8
  store i32 %or45, i32* %flags44, align 4
  %40 = load %struct.redirect*, %struct.redirect** %new_redirect, align 4
  call void @add_exec_redirect(%struct.redirect* %40)
  br label %if.end46

if.end46:                                         ; preds = %if.then41, %land.lhs.true39, %land.lhs.true37, %if.end34
  %41 = load i32, i32* %clexec_flag, align 4
  %tobool47 = icmp ne i32 %41, 0
  br i1 %tobool47, label %if.then50, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %if.end46
  %42 = load i32, i32* %fd.addr, align 4
  %cmp49 = icmp slt i32 %42, 3
  br i1 %cmp49, label %if.then50, label %if.else52

if.then50:                                        ; preds = %lor.lhs.false48, %if.end46
  %43 = load i32, i32* %new_fd, align 4
  %call51 = call i32 (i32, i32, ...) @fcntl(i32 %43, i32 2, i32 1)
  br label %if.end58

if.else52:                                        ; preds = %lor.lhs.false48
  %44 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %flags53 = getelementptr inbounds %struct.redirect, %struct.redirect* %44, i32 0, i32 3
  %45 = load i32, i32* %flags53, align 4
  %and = and i32 %45, 32
  %tobool54 = icmp ne i32 %and, 0
  br i1 %tobool54, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.else52
  %46 = load i32, i32* %new_fd, align 4
  %call56 = call i32 (i32, i32, ...) @fcntl(i32 %46, i32 2, i32 1)
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.else52
  br label %if.end58

if.end58:                                         ; preds = %if.end57, %if.then50
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end58, %if.then8
  %47 = load i32, i32* %retval, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind
define internal i32 @add_undo_close_redirect(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %closer = alloca %struct.redirect*, align 4
  %sd = alloca %union.REDIRECTEE, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %dest = bitcast %union.REDIRECTEE* %sd to i32*
  store i32 %0, i32* %dest, align 4
  store i32 0, i32* getelementptr inbounds (%union.REDIRECTEE, %union.REDIRECTEE* @rd, i32 0, i32 0), align 4
  %call = call %struct.redirect* @make_redirection(%union.REDIRECTEE* byval align 4 %sd, i32 9, %union.REDIRECTEE* byval align 4 @rd, i32 0)
  store %struct.redirect* %call, %struct.redirect** %closer, align 4
  %1 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %flags = getelementptr inbounds %struct.redirect, %struct.redirect* %1, i32 0, i32 3
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 8
  store i32 %or, i32* %flags, align 4
  %3 = load %struct.redirect*, %struct.redirect** @redirection_undo_list, align 4
  %4 = load %struct.redirect*, %struct.redirect** %closer, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 0
  store %struct.redirect* %3, %struct.redirect** %next, align 4
  %5 = load %struct.redirect*, %struct.redirect** %closer, align 4
  store %struct.redirect* %5, %struct.redirect** @redirection_undo_list, align 4
  ret i32 0
}

declare i32 @check_bash_input(i32) #1

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @_bash_fpurge(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @redir_varassign(%struct.redirect* %redir, i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %redir.addr = alloca %struct.redirect*, align 4
  %fd.addr = alloca i32, align 4
  %w = alloca %struct.word_desc*, align 4
  %v = alloca %struct.variable*, align 4
  store %struct.redirect* %redir, %struct.redirect** %redir.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redir.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 1
  %filename = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %1 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  store %struct.word_desc* %1, %struct.word_desc** %w, align 4
  %2 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word, align 4
  %4 = load i32, i32* %fd.addr, align 4
  %conv = sext i32 %4 to i64
  %call = call %struct.variable* @bind_var_to_int(i8* %3, i64 %conv)
  store %struct.variable* %call, %struct.variable** %v, align 4
  %5 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %5, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes, align 4
  %and = and i32 %7, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 5
  %9 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %9, 16384
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  store i32 -5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %10 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word6, align 4
  call void @stupidly_hack_special_variables(i8* %11)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

declare i32 @dup2(i32, i32) #1

declare i32 @duplicate_buffered_stream(i32, i32) #1

declare i32 @close_buffered_fd(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @here_document_to_fd(%struct.word_desc* %redirectee, i32 %ri) #0 {
entry:
  %retval = alloca i32, align 4
  %redirectee.addr = alloca %struct.word_desc*, align 4
  %ri.addr = alloca i32, align 4
  %filename = alloca i8*, align 4
  %r = alloca i32, align 4
  %fd = alloca i32, align 4
  %fd2 = alloca i32, align 4
  store %struct.word_desc* %redirectee, %struct.word_desc** %redirectee.addr, align 4
  store i32 %ri, i32* %ri.addr, align 4
  %call = call i32 @sh_mktmpfd(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.13, i32 0, i32 0), i32 5, i8** %filename)
  store i32 %call, i32* %fd, align 4
  %0 = load i32, i32* %fd, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** %filename, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 468)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %3 = load i32, i32* %fd, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %entry
  %4 = load i32, i32* %fd, align 4
  %call3 = call i32 (i32, i32, ...) @fcntl(i32 %4, i32 2, i32 1)
  store i32 0, i32* %r, align 4
  %call4 = call i32* @__errno_location()
  store i32 0, i32* %call4, align 4
  %5 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word, align 4
  %tobool5 = icmp ne i8* %6, null
  br i1 %tobool5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.end2
  %7 = load i32, i32* %ri.addr, align 4
  %cmp7 = icmp ne i32 %7, 5
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then6
  %8 = load i32, i32* %fd, align 4
  %9 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %call8 = call i32 @write_here_document(i32 %8, %struct.word_desc* %9)
  br label %cond.end

cond.false:                                       ; preds = %if.then6
  %10 = load i32, i32* %fd, align 4
  %11 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %call9 = call i32 @write_here_string(i32 %10, %struct.word_desc* %11)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call8, %cond.true ], [ %call9, %cond.false ]
  store i32 %cond, i32* %r, align 4
  br label %if.end10

if.end10:                                         ; preds = %cond.end, %if.end2
  %12 = load i32, i32* %r, align 4
  %tobool11 = icmp ne i32 %12, 0
  br i1 %tobool11, label %if.then12, label %if.end16

if.then12:                                        ; preds = %if.end10
  %13 = load i32, i32* %fd, align 4
  %call13 = call i32 @close(i32 %13)
  %14 = load i8*, i8** %filename, align 4
  %call14 = call i32 @unlink(i8* %14)
  %15 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 484)
  %16 = load i32, i32* %r, align 4
  %call15 = call i32* @__errno_location()
  store i32 %16, i32* %call15, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end10
  %17 = load i8*, i8** %filename, align 4
  %call17 = call i32 (i8*, i32, ...) @open(i8* %17, i32 0, i32 384)
  store i32 %call17, i32* %fd2, align 4
  %18 = load i32, i32* %fd2, align 4
  %cmp18 = icmp slt i32 %18, 0
  br i1 %cmp18, label %if.then19, label %if.end24

if.then19:                                        ; preds = %if.end16
  %call20 = call i32* @__errno_location()
  %19 = load i32, i32* %call20, align 4
  store i32 %19, i32* %r, align 4
  %20 = load i8*, i8** %filename, align 4
  %call21 = call i32 @unlink(i8* %20)
  %21 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 498)
  %22 = load i32, i32* %fd, align 4
  %call22 = call i32 @close(i32 %22)
  %23 = load i32, i32* %r, align 4
  %call23 = call i32* @__errno_location()
  store i32 %23, i32* %call23, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %if.end16
  %24 = load i32, i32* %fd, align 4
  %call25 = call i32 @close(i32 %24)
  %25 = load i8*, i8** %filename, align 4
  %call26 = call i32 @unlink(i8* %25)
  %cmp27 = icmp slt i32 %call26, 0
  br i1 %cmp27, label %if.then28, label %if.end32

if.then28:                                        ; preds = %if.end24
  %call29 = call i32* @__errno_location()
  %26 = load i32, i32* %call29, align 4
  store i32 %26, i32* %r, align 4
  %27 = load i32, i32* %fd2, align 4
  %call30 = call i32 @close(i32 %27)
  %28 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 509)
  %29 = load i32, i32* %r, align 4
  %call31 = call i32* @__errno_location()
  store i32 %29, i32* %call31, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end32:                                         ; preds = %if.end24
  %30 = load i8*, i8** %filename, align 4
  call void @sh_xfree(i8* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 514)
  %31 = load i32, i32* %fd2, align 4
  store i32 %31, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end32, %if.then28, %if.then19, %if.then12, %do.end
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

declare void @xtrace_fdchk(i32) #1

declare void @coproc_fdchk(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @redir_varvalue(%struct.redirect* %redir) #0 {
entry:
  %retval = alloca i32, align 4
  %redir.addr = alloca %struct.redirect*, align 4
  %v = alloca %struct.variable*, align 4
  %val = alloca i8*, align 4
  %w = alloca i8*, align 4
  %vmax = alloca i64, align 8
  %i = alloca i32, align 4
  %sub = alloca i8*, align 4
  %len = alloca i32, align 4
  %vr = alloca i32, align 4
  store %struct.redirect* %redir, %struct.redirect** %redir.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** %redir.addr, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %0, i32 0, i32 1
  %filename = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %1 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %1, i32 0, i32 0
  %2 = load i8*, i8** %word, align 4
  store i8* %2, i8** %w, align 4
  %3 = load i8*, i8** %w, align 4
  %call = call i32 @valid_array_reference(i8* %3, i32 0)
  store i32 %call, i32* %vr, align 4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %w, align 4
  %call1 = call %struct.variable* @array_variable_part(i8* %4, i8** %sub, i32* %len)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  br label %if.end16

if.else:                                          ; preds = %entry
  %5 = load i8*, i8** %w, align 4
  %call2 = call %struct.variable* @find_variable(i8* %5)
  store %struct.variable* %call2, %struct.variable** %v, align 4
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp = icmp eq %struct.variable* %6, null
  br i1 %cmp, label %if.then3, label %if.end15

if.then3:                                         ; preds = %if.else
  %7 = load i8*, i8** %w, align 4
  %call4 = call %struct.variable* @find_variable_last_nameref(i8* %7, i32 0)
  store %struct.variable* %call4, %struct.variable** %v, align 4
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool5 = icmp ne %struct.variable* %8, null
  br i1 %tobool5, label %land.lhs.true, label %if.end14

land.lhs.true:                                    ; preds = %if.then3
  %9 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes, align 4
  %and = and i32 %10, 2048
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %if.then7, label %if.end14

if.then7:                                         ; preds = %land.lhs.true
  %11 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 1
  %12 = load i8*, i8** %value, align 4
  store i8* %12, i8** %w, align 4
  %13 = load i8*, i8** %w, align 4
  %call8 = call i32 @valid_array_reference(i8* %13, i32 0)
  store i32 %call8, i32* %vr, align 4
  %tobool9 = icmp ne i32 %call8, 0
  br i1 %tobool9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.then7
  %14 = load i8*, i8** %w, align 4
  %call11 = call %struct.variable* @array_variable_part(i8* %14, i8** %sub, i32* %len)
  store %struct.variable* %call11, %struct.variable** %v, align 4
  br label %if.end

if.else12:                                        ; preds = %if.then7
  %15 = load i8*, i8** %w, align 4
  %call13 = call %struct.variable* @find_variable(i8* %15)
  store %struct.variable* %call13, %struct.variable** %v, align 4
  br label %if.end

if.end:                                           ; preds = %if.else12, %if.then10
  br label %if.end14

if.end14:                                         ; preds = %if.end, %land.lhs.true, %if.then3
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.else
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.then
  %16 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp17 = icmp eq %struct.variable* %16, null
  br i1 %cmp17, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end16
  %17 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes18 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes18, align 4
  %and19 = and i32 %18, 4096
  %tobool20 = icmp ne i32 %and19, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %lor.lhs.false, %if.end16
  store i32 -1, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %lor.lhs.false
  %19 = load i32, i32* %vr, align 4
  %tobool23 = icmp ne i32 %19, 0
  br i1 %tobool23, label %land.lhs.true24, label %if.else34

land.lhs.true24:                                  ; preds = %if.end22
  %20 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes25 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 5
  %21 = load i32, i32* %attributes25, align 4
  %and26 = and i32 %21, 4
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %if.then32, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %land.lhs.true24
  %22 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes29 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes29, align 4
  %and30 = and i32 %23, 64
  %tobool31 = icmp ne i32 %and30, 0
  br i1 %tobool31, label %if.then32, label %if.else34

if.then32:                                        ; preds = %lor.lhs.false28, %land.lhs.true24
  %24 = load i8*, i8** %w, align 4
  %call33 = call i8* @get_array_value(i8* %24, i32 0, i32* null, i64* null)
  store i8* %call33, i8** %val, align 4
  br label %if.end36

if.else34:                                        ; preds = %lor.lhs.false28, %if.end22
  %25 = load %struct.variable*, %struct.variable** %v, align 4
  %call35 = call i8* @get_variable_value(%struct.variable* %25)
  store i8* %call35, i8** %val, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else34, %if.then32
  %26 = load i8*, i8** %val, align 4
  %cmp37 = icmp eq i8* %26, null
  br i1 %cmp37, label %if.then41, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.end36
  %27 = load i8*, i8** %val, align 4
  %28 = load i8, i8* %27, align 1
  %conv = sext i8 %28 to i32
  %cmp39 = icmp eq i32 %conv, 0
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %lor.lhs.false38, %if.end36
  store i32 -1, i32* %retval, align 4
  br label %return

if.end42:                                         ; preds = %lor.lhs.false38
  %29 = load i8*, i8** %val, align 4
  %call43 = call i32 @legal_number(i8* %29, i64* %vmax)
  %cmp44 = icmp slt i32 %call43, 0
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end42
  store i32 -1, i32* %retval, align 4
  br label %return

if.end47:                                         ; preds = %if.end42
  %30 = load i64, i64* %vmax, align 8
  %conv48 = trunc i64 %30 to i32
  store i32 %conv48, i32* %i, align 4
  %31 = load i32, i32* %i, align 4
  store i32 %31, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end47, %if.then46, %if.then41, %if.then21
  %32 = load i32, i32* %retval, align 4
  ret i32 %32
}

declare i32 @find_string_in_alist(i8*, %struct.STRING_INT_ALIST*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @redir_special_open(i32 %spec, i8* %filename, i32 %flags, i32 %mode, i32 %ri) #0 {
entry:
  %spec.addr = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %ri.addr = alloca i32, align 4
  %fd = alloca i32, align 4
  store i32 %spec, i32* %spec.addr, align 4
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %ri, i32* %ri.addr, align 4
  store i32 -1, i32* %fd, align 4
  %0 = load i32, i32* %spec.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 5, label %sw.bb
    i32 6, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.12, i32 0, i32 0))
  call void (i8*, ...) @internal_warning(i8* %call)
  %1 = load i8*, i8** %filename.addr, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %3 = load i32, i32* %mode.addr, align 4
  %call1 = call i32 (i8*, i32, ...) @open(i8* %1, i32 %2, i32 %3)
  store i32 %call1, i32* %fd, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %sw.bb
  %4 = load i32, i32* %fd, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define internal i32 @noclobber_open(i8* %filename, i32 %flags, i32 %mode, i32 %ri) #0 {
entry:
  %retval = alloca i32, align 4
  %filename.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %mode.addr = alloca i32, align 4
  %ri.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %fd = alloca i32, align 4
  %finfo = alloca %struct.stat, align 8
  %finfo2 = alloca %struct.stat, align 8
  store i8* %filename, i8** %filename.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  store i32 %ri, i32* %ri.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %finfo)
  store i32 %call, i32* %r, align 4
  %1 = load i32, i32* %r, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %2 = load i32, i32* %st_mode, align 8
  %and = and i32 %2, 61440
  %cmp1 = icmp eq i32 %and, 32768
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 -2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %3 = load i32, i32* %flags.addr, align 4
  %and2 = and i32 %3, -513
  store i32 %and2, i32* %flags.addr, align 4
  %4 = load i32, i32* %r, align 4
  %cmp3 = icmp ne i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.end10

if.then4:                                         ; preds = %if.end
  %5 = load i8*, i8** %filename.addr, align 4
  %6 = load i32, i32* %flags.addr, align 4
  %or = or i32 %6, 128
  %7 = load i32, i32* %mode.addr, align 4
  %call5 = call i32 (i8*, i32, ...) @open(i8* %5, i32 %or, i32 %7)
  store i32 %call5, i32* %fd, align 4
  %8 = load i32, i32* %fd, align 4
  %cmp6 = icmp slt i32 %8, 0
  br i1 %cmp6, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %if.then4
  %call8 = call i32* @__errno_location()
  %9 = load i32, i32* %call8, align 4
  %cmp9 = icmp eq i32 %9, 17
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %if.then4
  %10 = load i32, i32* %fd, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -2, %cond.true ], [ %10, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end
  %11 = load i8*, i8** %filename.addr, align 4
  %12 = load i32, i32* %flags.addr, align 4
  %13 = load i32, i32* %mode.addr, align 4
  %call11 = call i32 (i8*, i32, ...) @open(i8* %11, i32 %12, i32 %13)
  store i32 %call11, i32* %fd, align 4
  %14 = load i32, i32* %fd, align 4
  %cmp12 = icmp slt i32 %14, 0
  br i1 %cmp12, label %if.then13, label %if.end20

if.then13:                                        ; preds = %if.end10
  %call14 = call i32* @__errno_location()
  %15 = load i32, i32* %call14, align 4
  %cmp15 = icmp eq i32 %15, 17
  br i1 %cmp15, label %cond.true16, label %cond.false17

cond.true16:                                      ; preds = %if.then13
  br label %cond.end18

cond.false17:                                     ; preds = %if.then13
  %16 = load i32, i32* %fd, align 4
  br label %cond.end18

cond.end18:                                       ; preds = %cond.false17, %cond.true16
  %cond19 = phi i32 [ -2, %cond.true16 ], [ %16, %cond.false17 ]
  store i32 %cond19, i32* %retval, align 4
  br label %return

if.end20:                                         ; preds = %if.end10
  %17 = load i32, i32* %fd, align 4
  %call21 = call i32 @fstat(i32 %17, %struct.stat* %finfo2)
  %cmp22 = icmp eq i32 %call21, 0
  br i1 %cmp22, label %land.lhs.true23, label %if.end42

land.lhs.true23:                                  ; preds = %if.end20
  %st_mode24 = getelementptr inbounds %struct.stat, %struct.stat* %finfo2, i32 0, i32 6
  %18 = load i32, i32* %st_mode24, align 8
  %and25 = and i32 %18, 61440
  %cmp26 = icmp eq i32 %and25, 32768
  %conv = zext i1 %cmp26 to i32
  %cmp27 = icmp eq i32 %conv, 0
  br i1 %cmp27, label %land.lhs.true29, label %if.end42

land.lhs.true29:                                  ; preds = %land.lhs.true23
  %19 = load i32, i32* %r, align 4
  %cmp30 = icmp eq i32 %19, 0
  br i1 %cmp30, label %land.lhs.true32, label %if.end42

land.lhs.true32:                                  ; preds = %land.lhs.true29
  %st_mode33 = getelementptr inbounds %struct.stat, %struct.stat* %finfo, i32 0, i32 6
  %20 = load i32, i32* %st_mode33, align 8
  %and34 = and i32 %20, 61440
  %cmp35 = icmp eq i32 %and34, 32768
  %conv36 = zext i1 %cmp35 to i32
  %cmp37 = icmp eq i32 %conv36, 0
  br i1 %cmp37, label %land.lhs.true39, label %if.end42

land.lhs.true39:                                  ; preds = %land.lhs.true32
  %21 = load i8*, i8** %filename.addr, align 4
  %22 = load i8*, i8** %filename.addr, align 4
  %call40 = call i32 @same_file(i8* %21, i8* %22, %struct.stat* %finfo, %struct.stat* %finfo2)
  %tobool = icmp ne i32 %call40, 0
  br i1 %tobool, label %if.then41, label %if.end42

if.then41:                                        ; preds = %land.lhs.true39
  %23 = load i32, i32* %fd, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

if.end42:                                         ; preds = %land.lhs.true39, %land.lhs.true32, %land.lhs.true29, %land.lhs.true23, %if.end20
  %24 = load i32, i32* %fd, align 4
  %call43 = call i32 @close(i32 %24)
  %call44 = call i32* @__errno_location()
  store i32 17, i32* %call44, align 4
  store i32 -2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end42, %if.then41, %cond.end18, %cond.end, %if.then
  %25 = load i32, i32* %retval, align 4
  ret i32 %25
}

declare i32 @open(i8*, i32, ...) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare void @run_pending_traps() #1

declare void @internal_warning(i8*, ...) #1

declare i32 @stat(i8*, %struct.stat*) #1

declare i32 @fstat(i32, %struct.stat*) #1

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

declare %struct.redirect* @copy_redirects(%struct.redirect*) #1

; Function Attrs: noinline nounwind
define internal void @add_exec_redirect(%struct.redirect* %dummy_redirect) #0 {
entry:
  %dummy_redirect.addr = alloca %struct.redirect*, align 4
  store %struct.redirect* %dummy_redirect, %struct.redirect** %dummy_redirect.addr, align 4
  %0 = load %struct.redirect*, %struct.redirect** @exec_redirection_undo_list, align 4
  %1 = load %struct.redirect*, %struct.redirect** %dummy_redirect.addr, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %1, i32 0, i32 0
  store %struct.redirect* %0, %struct.redirect** %next, align 4
  %2 = load %struct.redirect*, %struct.redirect** %dummy_redirect.addr, align 4
  store %struct.redirect* %2, %struct.redirect** @exec_redirection_undo_list, align 4
  ret void
}

declare %struct.variable* @bind_var_to_int(i8*, i64) #1

declare void @stupidly_hack_special_variables(i8*) #1

declare i32 @sh_mktmpfd(i8*, i32, i8**) #1

; Function Attrs: noinline nounwind
define internal i32 @write_here_document(i32 %fd, %struct.word_desc* %redirectee) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %redirectee.addr = alloca %struct.word_desc*, align 4
  %document = alloca i8*, align 4
  %document_len = alloca i32, align 4
  %fd2 = alloca i32, align 4
  %old = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 4
  %t = alloca %struct.word_list*, align 4
  %tlist = alloca %struct.word_list*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.word_desc* %redirectee, %struct.word_desc** %redirectee.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 1
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %2 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word, align 4
  store i8* %3, i8** %document, align 4
  %4 = load i8*, i8** %document, align 4
  %call = call i32 @strlen(i8* %4)
  store i32 %call, i32* %document_len, align 4
  %5 = load i32, i32* %fd.addr, align 4
  %6 = load i8*, i8** %document, align 4
  %7 = load i32, i32* %document_len, align 4
  %call1 = call i32 @write(i32 %5, i8* %6, i32 %7)
  %8 = load i32, i32* %document_len, align 4
  %cmp = icmp slt i32 %call1, %8
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %call3 = call i32* @__errno_location()
  %9 = load i32, i32* %call3, align 4
  %cmp4 = icmp eq i32 %9, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then2
  %call6 = call i32* @__errno_location()
  store i32 28, i32* %call6, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then2
  %call7 = call i32* @__errno_location()
  %10 = load i32, i32* %call7, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %entry
  store i32 1, i32* @expanding_redir, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %11 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %11, i32 0, i32 0
  %12 = load i8*, i8** %word9, align 4
  %call10 = call %struct.word_list* @expand_string(i8* %12, i32 2)
  store %struct.word_list* %call10, %struct.word_list** %tlist, align 4
  store i32 0, i32* @expanding_redir, align 4
  %13 = load i32, i32* @executing_builtin, align 4
  store i32 %13, i32* %old, align 4
  store i32 1, i32* @executing_builtin, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %14 = load i32, i32* %old, align 4
  store i32 %14, i32* @executing_builtin, align 4
  %15 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  %tobool11 = icmp ne %struct.word_list* %15, null
  br i1 %tobool11, label %if.then12, label %if.end57

if.then12:                                        ; preds = %if.end8
  %16 = load i32, i32* %fd.addr, align 4
  %call13 = call i32 @dup(i32 %16)
  store i32 %call13, i32* %fd2, align 4
  %cmp14 = icmp slt i32 %call13, 0
  br i1 %cmp14, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then12
  %17 = load i32, i32* %fd2, align 4
  %call15 = call %struct._IO_FILE* @fdopen(i32 %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0))
  store %struct._IO_FILE* %call15, %struct._IO_FILE** %fp, align 4
  %cmp16 = icmp eq %struct._IO_FILE* %call15, null
  br i1 %cmp16, label %if.then17, label %if.end25

if.then17:                                        ; preds = %lor.lhs.false, %if.then12
  %call18 = call i32* @__errno_location()
  %18 = load i32, i32* %call18, align 4
  store i32 %18, i32* %old, align 4
  %19 = load i32, i32* %fd2, align 4
  %cmp19 = icmp sge i32 %19, 0
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.then17
  %20 = load i32, i32* %fd2, align 4
  %call21 = call i32 @close(i32 %20)
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.then17
  %21 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  call void @dispose_words(%struct.word_list* %21)
  %22 = load i32, i32* %old, align 4
  %call23 = call i32* @__errno_location()
  store i32 %22, i32* %call23, align 4
  %call24 = call i32* @__errno_location()
  %23 = load i32, i32* %call24, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

if.end25:                                         ; preds = %lor.lhs.false
  %call26 = call i32* @__errno_location()
  store i32 0, i32* %call26, align 4
  %24 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  store %struct.word_list* %24, %struct.word_list** %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end25
  %25 = load %struct.word_list*, %struct.word_list** %t, align 4
  %tobool27 = icmp ne %struct.word_list* %25, null
  br i1 %tobool27, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %26 = load %struct.word_list*, %struct.word_list** %t, align 4
  %word28 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 1
  %27 = load %struct.word_desc*, %struct.word_desc** %word28, align 4
  %word29 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %27, i32 0, i32 0
  %28 = load i8*, i8** %word29, align 4
  store i8* %28, i8** %document, align 4
  %29 = load i8*, i8** %document, align 4
  %call30 = call i32 @strlen(i8* %29)
  store i32 %call30, i32* %document_len, align 4
  %30 = load %struct.word_list*, %struct.word_list** %t, align 4
  %31 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  %cmp31 = icmp ne %struct.word_list* %30, %31
  br i1 %cmp31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %for.body
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call33 = call i32 @putc(i32 32, %struct._IO_FILE* %32)
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %for.body
  %33 = load i8*, i8** %document, align 4
  %34 = load i32, i32* %document_len, align 4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call35 = call i32 @fwrite(i8* %33, i32 %34, i32 1, %struct._IO_FILE* %35)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call36 = call i32 @ferror(%struct._IO_FILE* %36)
  %tobool37 = icmp ne i32 %call36, 0
  br i1 %tobool37, label %if.then38, label %if.end46

if.then38:                                        ; preds = %if.end34
  %call39 = call i32* @__errno_location()
  %37 = load i32, i32* %call39, align 4
  %cmp40 = icmp eq i32 %37, 0
  br i1 %cmp40, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.then38
  %call42 = call i32* @__errno_location()
  store i32 28, i32* %call42, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.then38
  %call44 = call i32* @__errno_location()
  %38 = load i32, i32* %call44, align 4
  store i32 %38, i32* %fd2, align 4
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call45 = call i32 @fclose(%struct._IO_FILE* %39)
  %40 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  call void @dispose_words(%struct.word_list* %40)
  %41 = load i32, i32* %fd2, align 4
  store i32 %41, i32* %retval, align 4
  br label %return

if.end46:                                         ; preds = %if.end34
  br label %for.inc

for.inc:                                          ; preds = %if.end46
  %42 = load %struct.word_list*, %struct.word_list** %t, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 0
  %43 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %43, %struct.word_list** %t, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %44 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  call void @dispose_words(%struct.word_list* %44)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 4
  %call47 = call i32 @fclose(%struct._IO_FILE* %45)
  %cmp48 = icmp ne i32 %call47, 0
  br i1 %cmp48, label %if.then49, label %if.end56

if.then49:                                        ; preds = %for.end
  %call50 = call i32* @__errno_location()
  %46 = load i32, i32* %call50, align 4
  %cmp51 = icmp eq i32 %46, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %if.then49
  %call53 = call i32* @__errno_location()
  store i32 28, i32* %call53, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %if.then49
  %call55 = call i32* @__errno_location()
  %47 = load i32, i32* %call55, align 4
  store i32 %47, i32* %retval, align 4
  br label %return

if.end56:                                         ; preds = %for.end
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end8
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end57, %if.end54, %if.end43, %if.end22, %if.else, %if.end
  %48 = load i32, i32* %retval, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind
define internal i32 @write_here_string(i32 %fd, %struct.word_desc* %redirectee) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %redirectee.addr = alloca %struct.word_desc*, align 4
  %herestr = alloca i8*, align 4
  %herelen = alloca i32, align 4
  %n = alloca i32, align 4
  %e = alloca i32, align 4
  %old = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.word_desc* %redirectee, %struct.word_desc** %redirectee.addr, align 4
  store i32 1, i32* @expanding_redir, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %0 = load %struct.word_desc*, %struct.word_desc** %redirectee.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 0
  %1 = load i8*, i8** %word, align 4
  %call = call i8* @expand_string_unsplit_to_string(i8* %1, i32 0)
  store i8* %call, i8** %herestr, align 4
  store i32 0, i32* @expanding_redir, align 4
  %2 = load i32, i32* @executing_builtin, align 4
  store i32 %2, i32* %old, align 4
  store i32 1, i32* @executing_builtin, align 4
  call void @sv_ifs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0))
  %3 = load i32, i32* %old, align 4
  store i32 %3, i32* @executing_builtin, align 4
  %4 = load i8*, i8** %herestr, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %land.lhs.true, label %cond.false14

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %herestr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %cond.true, label %cond.false14

cond.true:                                        ; preds = %land.lhs.true
  %7 = load i8*, i8** %herestr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %8 to i32
  %tobool4 = icmp ne i32 %conv3, 0
  br i1 %tobool4, label %cond.true5, label %cond.false11

cond.true5:                                       ; preds = %cond.true
  %9 = load i8*, i8** %herestr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 2
  %10 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %10 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false

cond.true9:                                       ; preds = %cond.true5
  %11 = load i8*, i8** %herestr, align 4
  %call10 = call i32 @strlen(i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %cond.true5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true9
  %cond = phi i32 [ %call10, %cond.true9 ], [ 2, %cond.false ]
  br label %cond.end12

cond.false11:                                     ; preds = %cond.true
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.end
  %cond13 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false11 ]
  br label %cond.end15

cond.false14:                                     ; preds = %land.lhs.true, %entry
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.end12
  %cond16 = phi i32 [ %cond13, %cond.end12 ], [ 0, %cond.false14 ]
  store i32 %cond16, i32* %herelen, align 4
  %12 = load i32, i32* %fd.addr, align 4
  %13 = load i8*, i8** %herestr, align 4
  %14 = load i32, i32* %herelen, align 4
  %call17 = call i32 @write(i32 %12, i8* %13, i32 %14)
  store i32 %call17, i32* %n, align 4
  %15 = load i32, i32* %n, align 4
  %16 = load i32, i32* %herelen, align 4
  %cmp = icmp eq i32 %15, %16
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end15
  %17 = load i32, i32* %fd.addr, align 4
  %call19 = call i32 @write(i32 %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0), i32 1)
  store i32 %call19, i32* %n, align 4
  store i32 1, i32* %herelen, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end15
  %call20 = call i32* @__errno_location()
  %18 = load i32, i32* %call20, align 4
  store i32 %18, i32* %e, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %19 = load i8*, i8** %herestr, align 4
  %tobool21 = icmp ne i8* %19, null
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %do.body
  %20 = load i8*, i8** %herestr, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0), i32 348)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end23
  %21 = load i32, i32* %n, align 4
  %22 = load i32, i32* %herelen, align 4
  %cmp24 = icmp ne i32 %21, %22
  br i1 %cmp24, label %if.then26, label %if.end31

if.then26:                                        ; preds = %do.end
  %23 = load i32, i32* %e, align 4
  %cmp27 = icmp eq i32 %23, 0
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.then26
  store i32 28, i32* %e, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then29, %if.then26
  %24 = load i32, i32* %e, align 4
  store i32 %24, i32* %retval, align 4
  br label %return

if.end31:                                         ; preds = %do.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end31, %if.end30
  %25 = load i32, i32* %retval, align 4
  ret i32 %25
}

declare i32 @unlink(i8*) #1

declare i32 @write(i32, i8*, i32) #1

declare %struct.word_list* @expand_string(i8*, i32) #1

declare i32 @dup(i32) #1

declare %struct._IO_FILE* @fdopen(i32, i8*) #1

declare i32 @putc(i32, %struct._IO_FILE*) #1

declare i32 @fwrite(i8*, i32, i32, %struct._IO_FILE*) #1

declare i32 @ferror(%struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i8* @expand_string_unsplit_to_string(i8*, i32) #1

declare i32 @valid_array_reference(i8*, i32) #1

declare %struct.variable* @array_variable_part(i8*, i8**, i32*) #1

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @find_variable_last_nameref(i8*, i32) #1

declare i8* @get_array_value(i8*, i32, i32*, i64*) #1

declare i8* @get_variable_value(%struct.variable*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
