; ModuleID = 'help.c'
source_filename = "help.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [4 x i8] c"dms\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [34 x i8] c"Shell commands matching keyword `\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"Shell commands matching keywords `\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c", \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"'\0A\0A\00", align 1
@.str.5 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@shell_builtins = external global %struct.builtin*, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@extended_glob = external global i32, align 4
@.str.6 = private unnamed_addr constant [8 x i8] c"%s: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [73 x i8] c"no help topics match `%s'.  Try `help help' or `man -k %s' or `info %s'.\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@this_command_name = external global i8*, align 4
@current_builtin = external global %struct.builtin*, align 4
@.str.8 = private unnamed_addr constant [7 x i8] c"%*s%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"%s: cannot open: %s\00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"%s - \00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"./help.def\00", align 1
@.str.13 = private unnamed_addr constant [6 x i8] c"NAME\0A\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"%*s%s - \00", align 1
@.str.15 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"SYNOPSIS\0A\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"%*s%s\0A\0A\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c"DESCRIPTION\0A\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"%*s\00", align 1
@.str.20 = private unnamed_addr constant [10 x i8] c"SEE ALSO\0A\00", align 1
@.str.21 = private unnamed_addr constant [13 x i8] c"%*sbash(1)\0A\0A\00", align 1
@.str.22 = private unnamed_addr constant [16 x i8] c"IMPLEMENTATION\0A\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@bash_copyright = external constant i8*, align 4
@bash_license = external constant i8*, align 4
@.str.24 = private unnamed_addr constant [336 x i8] c"These shell commands are defined internally.  Type `help' to see this list.\0AType `help name' to find out more about the function `name'.\0AUse `info bash' to find out more about the shell in general.\0AUse `man -k' or `info' to find out more about commands not in this list.\0A\0AA star (*) next to a name means that the command is disabled.\0A\0A\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"COLUMNS\00", align 1
@num_shell_builtins = external global i32, align 4
@.str.26 = private unnamed_addr constant [4 x i8] c"%ls\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"%c%s\0A\00", align 1
@.str.28 = private unnamed_addr constant [5 x i8] c"%ls\0A\00", align 1
@.str.29 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind
define i32 @help_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %i = alloca i32, align 4
  %pattern = alloca i8*, align 4
  %name = alloca i8*, align 4
  %plen = alloca i32, align 4
  %match_found = alloca i32, align 4
  %sflag = alloca i32, align 4
  %dflag = alloca i32, align 4
  %mflag = alloca i32, align 4
  %m = alloca i32, align 4
  %pass = alloca i32, align 4
  %this_found = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %mflag, align 4
  store i32 0, i32* %sflag, align 4
  store i32 0, i32* %dflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %i, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %i, align 4
  switch i32 %1, label %sw.default [
    i32 100, label %sw.bb
    i32 109, label %sw.bb1
    i32 115, label %sw.bb2
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %dflag, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %mflag, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  store i32 1, i32* %sflag, align 4
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
  %2 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %2, %struct.word_list** %list.addr, align 4
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp4 = icmp eq %struct.word_list* %3, null
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @show_shell_version(i32 0)
  call void @show_builtin_command_help()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word5, align 4
  %call6 = call i32 @glob_pattern_p(i8* %6)
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %if.then7, label %if.end12

if.then7:                                         ; preds = %if.end
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %7, i32 0, i32 0
  %8 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool8 = icmp ne %struct.word_list* %8, null
  %cond = select i1 %tobool8, i32 2, i32 1
  %call9 = call i8* @libintl_ngettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i32 0, i32 0), i32 %cond)
  %call10 = call i32 (i8*, ...) @printf(i8* %call9)
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  call void @print_word_list(%struct.word_list* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.then7, %if.end
  store i32 0, i32* %match_found, align 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), i8** %pattern, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc68, %if.end12
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool13 = icmp ne %struct.word_list* %10, null
  br i1 %tobool13, label %for.body, label %for.end70

for.body:                                         ; preds = %for.cond
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %11, i32 0, i32 1
  %12 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %word15 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %12, i32 0, i32 0
  %13 = load i8*, i8** %word15, align 4
  store i8* %13, i8** %pattern, align 4
  %14 = load i8*, i8** %pattern, align 4
  %call16 = call i32 @strlen(i8* %14)
  store i32 %call16, i32* %plen, align 4
  store i32 1, i32* %pass, align 4
  store i32 0, i32* %this_found, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc65, %for.body
  %15 = load i32, i32* %pass, align 4
  %cmp18 = icmp slt i32 %15, 3
  br i1 %cmp18, label %for.body19, label %for.end67

for.body19:                                       ; preds = %for.cond17
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc, %for.body19
  %16 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %16, i32 %17
  %name21 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 0
  %18 = load i8*, i8** %name21, align 4
  store i8* %18, i8** %name, align 4
  %tobool22 = icmp ne i8* %18, null
  br i1 %tobool22, label %for.body23, label %for.end

for.body23:                                       ; preds = %for.cond20
  br label %do.body

do.body:                                          ; preds = %for.body23
  %19 = load volatile i32, i32* @terminating_signal, align 4
  %tobool24 = icmp ne i32 %19, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %do.body
  %20 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %20)
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %do.body
  %21 = load volatile i32, i32* @interrupt_state, align 4
  %tobool27 = icmp ne i32 %21, 0
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end26
  call void @throw_to_top_level()
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %if.end26
  br label %do.end

do.end:                                           ; preds = %if.end29
  %22 = load i32, i32* %pass, align 4
  %cmp30 = icmp eq i32 %22, 1
  br i1 %cmp30, label %if.then31, label %if.else

if.then31:                                        ; preds = %do.end
  %23 = load i8*, i8** %pattern, align 4
  %24 = load i8*, i8** %name, align 4
  %call32 = call i32 @strcmp(i8* %23, i8* %24)
  %cmp33 = icmp eq i32 %call32, 0
  br i1 %cmp33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then31
  %25 = load i8*, i8** %pattern, align 4
  %26 = load i8*, i8** %name, align 4
  %27 = load i32, i32* @extended_glob, align 4
  %tobool34 = icmp ne i32 %27, 0
  %cond35 = select i1 %tobool34, i32 32, i32 0
  %call36 = call i32 @strmatch(i8* %25, i8* %26, i32 %cond35)
  %cmp37 = icmp ne i32 %call36, 1
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then31
  %28 = phi i1 [ true, %if.then31 ], [ %cmp37, %lor.rhs ]
  %lor.ext = zext i1 %28 to i32
  store i32 %lor.ext, i32* %m, align 4
  br label %if.end40

if.else:                                          ; preds = %do.end
  %29 = load i8*, i8** %pattern, align 4
  %30 = load i8*, i8** %name, align 4
  %31 = load i32, i32* %plen, align 4
  %call38 = call i32 @strncmp(i8* %29, i8* %30, i32 %31)
  %cmp39 = icmp eq i32 %call38, 0
  %conv = zext i1 %cmp39 to i32
  store i32 %conv, i32* %m, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.else, %lor.end
  %32 = load i32, i32* %m, align 4
  %tobool41 = icmp ne i32 %32, 0
  br i1 %tobool41, label %if.then42, label %if.end57

if.then42:                                        ; preds = %if.end40
  store i32 1, i32* %this_found, align 4
  %33 = load i32, i32* %match_found, align 4
  %inc = add nsw i32 %33, 1
  store i32 %inc, i32* %match_found, align 4
  %34 = load i32, i32* %dflag, align 4
  %tobool43 = icmp ne i32 %34, 0
  br i1 %tobool43, label %if.then44, label %if.else45

if.then44:                                        ; preds = %if.then42
  %35 = load i8*, i8** %name, align 4
  %36 = load i32, i32* %i, align 4
  call void @show_desc(i8* %35, i32 %36)
  br label %for.inc

if.else45:                                        ; preds = %if.then42
  %37 = load i32, i32* %mflag, align 4
  %tobool46 = icmp ne i32 %37, 0
  br i1 %tobool46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.else45
  %38 = load i8*, i8** %name, align 4
  %39 = load i32, i32* %i, align 4
  call void @show_manpage(i8* %38, i32 %39)
  br label %for.inc

if.end48:                                         ; preds = %if.else45
  br label %if.end49

if.end49:                                         ; preds = %if.end48
  %40 = load i8*, i8** %name, align 4
  %41 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx50 = getelementptr inbounds %struct.builtin, %struct.builtin* %41, i32 %42
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx50, i32 0, i32 4
  %43 = load i8*, i8** %short_doc, align 4
  %call51 = call i8* @libintl_gettext(i8* %43)
  %call52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8* %40, i8* %call51)
  %44 = load i32, i32* %sflag, align 4
  %cmp53 = icmp eq i32 %44, 0
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end49
  %45 = load i32, i32* %i, align 4
  call void @show_longdoc(i32 %45)
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %if.end49
  br label %if.end57

if.end57:                                         ; preds = %if.end56, %if.end40
  br label %for.inc

for.inc:                                          ; preds = %if.end57, %if.then47, %if.then44
  %46 = load i32, i32* %i, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %i, align 4
  br label %for.cond20

for.end:                                          ; preds = %for.cond20
  %47 = load i32, i32* %pass, align 4
  %cmp59 = icmp eq i32 %47, 1
  br i1 %cmp59, label %land.lhs.true, label %if.end64

land.lhs.true:                                    ; preds = %for.end
  %48 = load i32, i32* %this_found, align 4
  %cmp61 = icmp eq i32 %48, 1
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %land.lhs.true
  br label %for.end67

if.end64:                                         ; preds = %land.lhs.true, %for.end
  br label %for.inc65

for.inc65:                                        ; preds = %if.end64
  %49 = load i32, i32* %pass, align 4
  %inc66 = add nsw i32 %49, 1
  store i32 %inc66, i32* %pass, align 4
  br label %for.cond17

for.end67:                                        ; preds = %if.then63, %for.cond17
  br label %for.inc68

for.inc68:                                        ; preds = %for.end67
  %50 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next69 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 0
  %51 = load %struct.word_list*, %struct.word_list** %next69, align 4
  store %struct.word_list* %51, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end70:                                        ; preds = %for.cond
  %52 = load i32, i32* %match_found, align 4
  %cmp71 = icmp eq i32 %52, 0
  br i1 %cmp71, label %if.then73, label %if.end75

if.then73:                                        ; preds = %for.end70
  %call74 = call i8* @libintl_gettext(i8* getelementptr inbounds ([73 x i8], [73 x i8]* @.str.7, i32 0, i32 0))
  %53 = load i8*, i8** %pattern, align 4
  %54 = load i8*, i8** %pattern, align 4
  %55 = load i8*, i8** %pattern, align 4
  call void (i8*, ...) @builtin_error(i8* %call74, i8* %53, i8* %54, i8* %55)
  store i32 1, i32* %retval, align 4
  br label %return

if.end75:                                         ; preds = %for.end70
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call76 = call i32 @fflush(%struct._IO_FILE* %56)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end75, %if.then73, %if.then, %sw.default, %sw.bb3
  %57 = load i32, i32* %retval, align 4
  ret i32 %57
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

; Function Attrs: noinline nounwind
define void @builtin_help() #0 {
entry:
  %ind = alloca i32, align 4
  %d = alloca i32, align 4
  %0 = load i8*, i8** @this_command_name, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 0)
  store %struct.builtin* %call, %struct.builtin** @current_builtin, align 4
  %1 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %cmp = icmp eq %struct.builtin* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %2 = load %struct.builtin*, %struct.builtin** @current_builtin, align 4
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %sub.ptr.lhs.cast = ptrtoint %struct.builtin* %2 to i32
  %sub.ptr.rhs.cast = ptrtoint %struct.builtin* %3 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 24
  store i32 %sub.ptr.div, i32* %d, align 4
  %4 = load i32, i32* %d, align 4
  store i32 %4, i32* %ind, align 4
  %5 = load i8*, i8** @this_command_name, align 4
  %6 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %7 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 %7
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 4
  %8 = load i8*, i8** %short_doc, align 4
  %call1 = call i8* @libintl_gettext(i8* %8)
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i32 0, i32 0), i8* %5, i8* %call1)
  %9 = load i32, i32* %ind, align 4
  call void @show_longdoc(i32 %9)
  br label %return

return:                                           ; preds = %if.end, %if.then
  ret void
}

declare void @builtin_usage() #1

declare void @show_shell_version(i32) #1

; Function Attrs: noinline nounwind
define internal void @show_builtin_command_help() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %height = alloca i32, align 4
  %width = alloca i32, align 4
  %t = alloca i8*, align 4
  %blurb = alloca [128 x i8], align 1
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([336 x i8], [336 x i8]* @.str.24, i32 0, i32 0))
  %call1 = call i32 (i8*, ...) @printf(i8* %call)
  %call2 = call i8* @get_string_value(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0))
  store i8* %call2, i8** %t, align 4
  %0 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %t, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %3 = load i8*, i8** %t, align 4
  %call4 = call i32 @atoi(i8* %3)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call4, %cond.true ], [ 80, %cond.false ]
  store i32 %cond, i32* %width, align 4
  %4 = load i32, i32* %width, align 4
  %cmp = icmp sle i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 80, i32* %width, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load i32, i32* %width, align 4
  %div = sdiv i32 %5, 2
  store i32 %div, i32* %width, align 4
  %6 = load i32, i32* %width, align 4
  %cmp6 = icmp ugt i32 %6, 128
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i32 128, i32* %width, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %7 = load i32, i32* %width, align 4
  %cmp10 = icmp sle i32 %7, 3
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  store i32 40, i32* %width, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %if.end9
  %8 = load i32, i32* @num_shell_builtins, align 4
  %add = add nsw i32 %8, 1
  %div14 = sdiv i32 %add, 2
  store i32 %div14, i32* %height, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end13
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %height, align 4
  %cmp15 = icmp slt i32 %9, %10
  br i1 %cmp15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %for.body
  %11 = load volatile i32, i32* @terminating_signal, align 4
  %tobool17 = icmp ne i32 %11, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %do.body
  %12 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %12)
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %do.body
  %13 = load volatile i32, i32* @interrupt_state, align 4
  %tobool20 = icmp ne i32 %13, 0
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end19
  call void @throw_to_top_level()
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.end19
  br label %do.end

do.end:                                           ; preds = %if.end22
  %call23 = call i32 @__ctype_get_mb_cur_max()
  %cmp24 = icmp ugt i32 %call23, 1
  br i1 %cmp24, label %if.then26, label %if.else

if.then26:                                        ; preds = %do.end
  %14 = load i32, i32* %i, align 4
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %blurb, i32 0, i32 0
  %15 = load i32, i32* %width, align 4
  %16 = load i32, i32* %height, align 4
  call void @wdispcolumn(i32 %14, i8* %arraydecay, i32 128, i32 %15, i32 %16)
  br label %if.end28

if.else:                                          ; preds = %do.end
  %17 = load i32, i32* %i, align 4
  %arraydecay27 = getelementptr inbounds [128 x i8], [128 x i8]* %blurb, i32 0, i32 0
  %18 = load i32, i32* %width, align 4
  %19 = load i32, i32* %height, align 4
  call void @dispcolumn(i32 %17, i8* %arraydecay27, i32 128, i32 %18, i32 %19)
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then26
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @glob_pattern_p(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i8* @libintl_ngettext(i8*, i8*, i32) #1

declare void @print_word_list(%struct.word_list*, i8*) #1

declare i32 @strlen(i8*) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare i32 @strcmp(i8*, i8*) #1

declare i32 @strmatch(i8*, i8*, i32) #1

declare i32 @strncmp(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal void @show_desc(i8* %name, i32 %i) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %doc = alloca i8**, align 4
  %line = alloca i8*, align 4
  %fd = alloca i32, align 4
  %usefile = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 %1
  %long_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 3
  %2 = load i8**, i8*** %long_doc, align 4
  store i8** %2, i8*** %doc, align 4
  %3 = load i8**, i8*** %doc, align 4
  %tobool = icmp ne i8** %3, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8**, i8*** %doc, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx1, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load i8**, i8*** %doc, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx4, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true3
  %9 = load i8**, i8*** %doc, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %9, i32 1
  %10 = load i8*, i8** %arrayidx6, align 4
  %cmp7 = icmp eq i8* %10, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true3, %land.lhs.true, %entry
  %11 = phi i1 [ false, %land.lhs.true3 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  store i32 %land.ext, i32* %usefile, align 4
  %12 = load i32, i32* %usefile, align 4
  %tobool9 = icmp ne i32 %12, 0
  br i1 %tobool9, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %13 = load i8**, i8*** %doc, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %13, i32 0
  %14 = load i8*, i8** %arrayidx10, align 4
  %call = call i32 @open_helpfile(i8* %14)
  store i32 %call, i32* %fd, align 4
  %15 = load i32, i32* %fd, align 4
  %cmp11 = icmp slt i32 %15, 0
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.then
  br label %if.end40

if.end:                                           ; preds = %if.then
  %16 = load i32, i32* %fd, align 4
  %17 = load i8**, i8*** %doc, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %17, i32 0
  %18 = load i8*, i8** %arrayidx14, align 4
  %call15 = call i32 @zmapfd(i32 %16, i8** %line, i8* %18)
  %19 = load i32, i32* %fd, align 4
  %call16 = call i32 @close(i32 %19)
  br label %if.end19

if.else:                                          ; preds = %land.end
  %20 = load i8**, i8*** %doc, align 4
  %tobool17 = icmp ne i8** %20, null
  br i1 %tobool17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %21 = load i8**, i8*** %doc, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %21, i32 0
  %22 = load i8*, i8** %arrayidx18, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %22, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %line, align 4
  br label %if.end19

if.end19:                                         ; preds = %cond.end, %if.end
  %23 = load i8*, i8** %name.addr, align 4
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i32 0, i32 0), i8* %23)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end19
  %24 = load i8*, i8** %line, align 4
  %tobool21 = icmp ne i8* %24, null
  br i1 %tobool21, label %land.rhs22, label %land.end26

land.rhs22:                                       ; preds = %for.cond
  %25 = load i8*, i8** %line, align 4
  %26 = load i32, i32* %j, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %27 to i32
  %tobool25 = icmp ne i32 %conv24, 0
  br label %land.end26

land.end26:                                       ; preds = %land.rhs22, %for.cond
  %28 = phi i1 [ false, %for.cond ], [ %tobool25, %land.rhs22 ]
  br i1 %28, label %for.body, label %for.end

for.body:                                         ; preds = %land.end26
  %29 = load i8*, i8** %line, align 4
  %30 = load i32, i32* %j, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %31 to i32
  %call30 = call i32 @putchar(i32 %conv29)
  %32 = load i8*, i8** %line, align 4
  %33 = load i32, i32* %j, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %34 to i32
  %cmp33 = icmp eq i32 %conv32, 10
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %for.body
  br label %for.end

if.end36:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end36
  %35 = load i32, i32* %j, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then35, %land.end26
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call37 = call i32 @fflush(%struct._IO_FILE* %36)
  %37 = load i32, i32* %usefile, align 4
  %tobool38 = icmp ne i32 %37, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %for.end
  %38 = load i8*, i8** %line, align 4
  call void @sh_xfree(i8* %38, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 292)
  br label %if.end40

if.end40:                                         ; preds = %if.then13, %if.then39, %for.end
  ret void
}

; Function Attrs: noinline nounwind
define internal void @show_manpage(i8* %name, i32 %i) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %doc = alloca i8**, align 4
  %line = alloca i8*, align 4
  %fd = alloca i32, align 4
  %usefile = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 %1
  %long_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 3
  %2 = load i8**, i8*** %long_doc, align 4
  store i8** %2, i8*** %doc, align 4
  %3 = load i8**, i8*** %doc, align 4
  %tobool = icmp ne i8** %3, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8**, i8*** %doc, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx1, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load i8**, i8*** %doc, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx4, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true3
  %9 = load i8**, i8*** %doc, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %9, i32 1
  %10 = load i8*, i8** %arrayidx6, align 4
  %cmp7 = icmp eq i8* %10, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true3, %land.lhs.true, %entry
  %11 = phi i1 [ false, %land.lhs.true3 ], [ false, %land.lhs.true ], [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  store i32 %land.ext, i32* %usefile, align 4
  %12 = load i32, i32* %usefile, align 4
  %tobool9 = icmp ne i32 %12, 0
  br i1 %tobool9, label %if.then, label %if.else

if.then:                                          ; preds = %land.end
  %13 = load i8**, i8*** %doc, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %13, i32 0
  %14 = load i8*, i8** %arrayidx10, align 4
  %call = call i32 @open_helpfile(i8* %14)
  store i32 %call, i32* %fd, align 4
  %15 = load i32, i32* %fd, align 4
  %cmp11 = icmp slt i32 %15, 0
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.then
  br label %if.end96

if.end:                                           ; preds = %if.then
  %16 = load i32, i32* %fd, align 4
  %17 = load i8**, i8*** %doc, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %17, i32 0
  %18 = load i8*, i8** %arrayidx14, align 4
  %call15 = call i32 @zmapfd(i32 %16, i8** %line, i8* %18)
  %19 = load i32, i32* %fd, align 4
  %call16 = call i32 @close(i32 %19)
  br label %if.end20

if.else:                                          ; preds = %land.end
  %20 = load i8**, i8*** %doc, align 4
  %tobool17 = icmp ne i8** %20, null
  br i1 %tobool17, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  %21 = load i8**, i8*** %doc, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %21, i32 0
  %22 = load i8*, i8** %arrayidx18, align 4
  %call19 = call i8* @libintl_gettext(i8* %22)
  br label %cond.end

cond.false:                                       ; preds = %if.else
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call19, %cond.true ], [ null, %cond.false ]
  store i8* %cond, i8** %line, align 4
  br label %if.end20

if.end20:                                         ; preds = %cond.end, %if.end
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i32 0, i32 0))
  %23 = load i8*, i8** %name.addr, align 4
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* %23)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end20
  %24 = load i8*, i8** %line, align 4
  %tobool23 = icmp ne i8* %24, null
  br i1 %tobool23, label %land.rhs24, label %land.end28

land.rhs24:                                       ; preds = %for.cond
  %25 = load i8*, i8** %line, align 4
  %26 = load i32, i32* %j, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %27 to i32
  %tobool27 = icmp ne i32 %conv26, 0
  br label %land.end28

land.end28:                                       ; preds = %land.rhs24, %for.cond
  %28 = phi i1 [ false, %for.cond ], [ %tobool27, %land.rhs24 ]
  br i1 %28, label %for.body, label %for.end

for.body:                                         ; preds = %land.end28
  %29 = load i8*, i8** %line, align 4
  %30 = load i32, i32* %j, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %29, i32 %30
  %31 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %31 to i32
  %call32 = call i32 @putchar(i32 %conv31)
  %32 = load i8*, i8** %line, align 4
  %33 = load i32, i32* %j, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %32, i32 %33
  %34 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %34 to i32
  %cmp35 = icmp eq i32 %conv34, 10
  br i1 %cmp35, label %if.then37, label %if.end38

if.then37:                                        ; preds = %for.body
  br label %for.end

if.end38:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end38
  %35 = load i32, i32* %j, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then37, %land.end28
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  %call40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0))
  %36 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %37 = load i32, i32* %i.addr, align 4
  %arrayidx41 = getelementptr inbounds %struct.builtin, %struct.builtin* %36, i32 %37
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx41, i32 0, i32 4
  %38 = load i8*, i8** %short_doc, align 4
  %call42 = call i8* @libintl_gettext(i8* %38)
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* %call42)
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i32 0, i32 0))
  %39 = load i32, i32* %usefile, align 4
  %cmp45 = icmp eq i32 %39, 0
  br i1 %cmp45, label %if.then47, label %if.else58

if.then47:                                        ; preds = %for.end
  store i32 0, i32* %j, align 4
  br label %for.cond48

for.cond48:                                       ; preds = %for.inc55, %if.then47
  %40 = load i8**, i8*** %doc, align 4
  %41 = load i32, i32* %j, align 4
  %arrayidx49 = getelementptr inbounds i8*, i8** %40, i32 %41
  %42 = load i8*, i8** %arrayidx49, align 4
  %tobool50 = icmp ne i8* %42, null
  br i1 %tobool50, label %for.body51, label %for.end57

for.body51:                                       ; preds = %for.cond48
  %43 = load i8**, i8*** %doc, align 4
  %44 = load i32, i32* %j, align 4
  %arrayidx52 = getelementptr inbounds i8*, i8** %43, i32 %44
  %45 = load i8*, i8** %arrayidx52, align 4
  %call53 = call i8* @libintl_gettext(i8* %45)
  %call54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* %call53)
  br label %for.inc55

for.inc55:                                        ; preds = %for.body51
  %46 = load i32, i32* %j, align 4
  %inc56 = add nsw i32 %46, 1
  store i32 %inc56, i32* %j, align 4
  br label %for.cond48

for.end57:                                        ; preds = %for.cond48
  br label %if.end81

if.else58:                                        ; preds = %for.end
  store i32 0, i32* %j, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc78, %if.else58
  %47 = load i8*, i8** %line, align 4
  %tobool60 = icmp ne i8* %47, null
  br i1 %tobool60, label %land.rhs61, label %land.end65

land.rhs61:                                       ; preds = %for.cond59
  %48 = load i8*, i8** %line, align 4
  %49 = load i32, i32* %j, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %48, i32 %49
  %50 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %50 to i32
  %tobool64 = icmp ne i32 %conv63, 0
  br label %land.end65

land.end65:                                       ; preds = %land.rhs61, %for.cond59
  %51 = phi i1 [ false, %for.cond59 ], [ %tobool64, %land.rhs61 ]
  br i1 %51, label %for.body67, label %for.end80

for.body67:                                       ; preds = %land.end65
  %52 = load i8*, i8** %line, align 4
  %53 = load i32, i32* %j, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %54 to i32
  %call70 = call i32 @putchar(i32 %conv69)
  %55 = load i8*, i8** %line, align 4
  %56 = load i32, i32* %j, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %55, i32 %56
  %57 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %57 to i32
  %cmp73 = icmp eq i32 %conv72, 10
  br i1 %cmp73, label %if.then75, label %if.end77

if.then75:                                        ; preds = %for.body67
  %call76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %for.body67
  br label %for.inc78

for.inc78:                                        ; preds = %if.end77
  %58 = load i32, i32* %j, align 4
  %inc79 = add nsw i32 %58, 1
  store i32 %inc79, i32* %j, align 4
  br label %for.cond59

for.end80:                                        ; preds = %land.end65
  br label %if.end81

if.end81:                                         ; preds = %for.end80, %for.end57
  %call82 = call i32 @putchar(i32 10)
  %call83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.20, i32 0, i32 0))
  %call84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.21, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %call85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.22, i32 0, i32 0))
  %call86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  call void @show_shell_version(i32 0)
  %call87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %59 = load i8*, i8** @bash_copyright, align 4
  %call88 = call i8* @libintl_gettext(i8* %59)
  %call89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i8* %call88)
  %call90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  %60 = load i8*, i8** @bash_license, align 4
  %call91 = call i8* @libintl_gettext(i8* %60)
  %call92 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i8* %call91)
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call93 = call i32 @fflush(%struct._IO_FILE* %61)
  %62 = load i32, i32* %usefile, align 4
  %tobool94 = icmp ne i32 %62, 0
  br i1 %tobool94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end81
  %63 = load i8*, i8** %line, align 4
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 367)
  br label %if.end96

if.end96:                                         ; preds = %if.then13, %if.then95, %if.end81
  ret void
}

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal void @show_longdoc(i32 %i) #0 {
entry:
  %i.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %doc = alloca i8**, align 4
  %fd = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 %1
  %long_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 3
  %2 = load i8**, i8*** %long_doc, align 4
  store i8** %2, i8*** %doc, align 4
  %3 = load i8**, i8*** %doc, align 4
  %tobool = icmp ne i8** %3, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load i8**, i8*** %doc, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx1, align 4
  %tobool2 = icmp ne i8* %5, null
  br i1 %tobool2, label %land.lhs.true3, label %if.else

land.lhs.true3:                                   ; preds = %land.lhs.true
  %6 = load i8**, i8*** %doc, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx4, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.lhs.true6, label %if.else

land.lhs.true6:                                   ; preds = %land.lhs.true3
  %9 = load i8**, i8*** %doc, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %9, i32 1
  %10 = load i8*, i8** %arrayidx7, align 4
  %cmp8 = icmp eq i8* %10, null
  br i1 %cmp8, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true6
  %11 = load i8**, i8*** %doc, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %11, i32 0
  %12 = load i8*, i8** %arrayidx10, align 4
  %call = call i32 @open_helpfile(i8* %12)
  store i32 %call, i32* %fd, align 4
  %13 = load i32, i32* %fd, align 4
  %cmp11 = icmp slt i32 %13, 0
  br i1 %cmp11, label %if.then13, label %if.end

if.then13:                                        ; preds = %if.then
  br label %if.end25

if.end:                                           ; preds = %if.then
  %14 = load i32, i32* %fd, align 4
  %15 = load i8**, i8*** %doc, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %15, i32 0
  %16 = load i8*, i8** %arrayidx14, align 4
  %call15 = call i32 @zcatfd(i32 %14, i32 1, i8* %16)
  %17 = load i32, i32* %fd, align 4
  %call16 = call i32 @close(i32 %17)
  br label %if.end25

if.else:                                          ; preds = %land.lhs.true6, %land.lhs.true3, %land.lhs.true, %entry
  %18 = load i8**, i8*** %doc, align 4
  %tobool17 = icmp ne i8** %18, null
  br i1 %tobool17, label %if.then18, label %if.end24

if.then18:                                        ; preds = %if.else
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then18
  %19 = load i8**, i8*** %doc, align 4
  %20 = load i32, i32* %j, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx19, align 4
  %tobool20 = icmp ne i8* %21, null
  br i1 %tobool20, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i8**, i8*** %doc, align 4
  %23 = load i32, i32* %j, align 4
  %arrayidx21 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx21, align 4
  %call22 = call i8* @libintl_gettext(i8* %24)
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i32 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* %call22)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %j, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end24

if.end24:                                         ; preds = %for.end, %if.else
  br label %if.end25

if.end25:                                         ; preds = %if.then13, %if.end24, %if.end
  ret void
}

declare void @builtin_error(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare %struct.builtin* @builtin_address_internal(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @open_helpfile(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %fd = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 (i8*, i32, ...) @open(i8* %0, i32 0)
  store i32 %call, i32* %fd, align 4
  %1 = load i32, i32* %fd, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0))
  %2 = load i8*, i8** %name.addr, align 4
  %call2 = call i32* @__errno_location()
  %3 = load i32, i32* %call2, align 4
  %call3 = call i8* @strerror(i32 %3)
  call void (i8*, ...) @builtin_error(i8* %call1, i8* %2, i8* %call3)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32, i32* %fd, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @zcatfd(i32, i32, i8*) #1

declare i32 @close(i32) #1

declare i32 @open(i8*, i32, ...) #1

declare i8* @strerror(i32) #1

declare i32* @__errno_location() #1

declare i32 @zmapfd(i32, i8**, i8*) #1

declare i32 @putchar(i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @get_string_value(i8*) #1

declare i32 @atoi(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal void @wdispcolumn(i32 %i, i8* %buf, i32 %bufsize, i32 %width, i32 %height) #0 {
entry:
  %i.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %bufsize.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %dispcols = alloca i32, align 4
  %dispchars = alloca i32, align 4
  %helpdoc = alloca i8*, align 4
  %wcstr = alloca i32*, align 4
  %slen = alloca i32, align 4
  %n = alloca i32, align 4
  %wclen = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %bufsize, i32* %bufsize.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 %1
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 4
  %2 = load i8*, i8** %short_doc, align 4
  %call = call i8* @libintl_gettext(i8* %2)
  store i8* %call, i8** %helpdoc, align 4
  store i32* null, i32** %wcstr, align 4
  %3 = load i8*, i8** %helpdoc, align 4
  %call1 = call i32 @mbstowcs(i32* null, i8* %3, i32 0)
  store i32 %call1, i32* %slen, align 4
  %4 = load i32, i32* %slen, align 4
  %cmp = icmp eq i32 %4, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %i.addr, align 4
  %6 = load i8*, i8** %buf.addr, align 4
  %7 = load i32, i32* %bufsize.addr, align 4
  %8 = load i32, i32* %width.addr, align 4
  %9 = load i32, i32* %height.addr, align 4
  call void @dispcolumn(i32 %5, i8* %6, i32 %7, i32 %8, i32 %9)
  br label %return

if.end:                                           ; preds = %entry
  %10 = load i32, i32* %slen, align 4
  %11 = load i32, i32* %width.addr, align 4
  %cmp2 = icmp uge i32 %10, %11
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  %12 = load i32, i32* %width.addr, align 4
  %sub = sub nsw i32 %12, 2
  store i32 %sub, i32* %slen, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %13 = load i32, i32* %width.addr, align 4
  %add = add nsw i32 %13, 2
  %mul = mul i32 4, %add
  %call5 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 440)
  %14 = bitcast i8* %call5 to i32*
  store i32* %14, i32** %wcstr, align 4
  %15 = load i32*, i32** %wcstr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %15, i32 1
  %16 = load i8*, i8** %helpdoc, align 4
  %17 = load i32, i32* %slen, align 4
  %add6 = add i32 %17, 1
  %call7 = call i32 @mbstowcs(i32* %add.ptr, i8* %16, i32 %add6)
  store i32 %call7, i32* %n, align 4
  %18 = load i32*, i32** %wcstr, align 4
  %19 = load i32, i32* %n, align 4
  %add8 = add i32 %19, 1
  %arrayidx9 = getelementptr inbounds i32, i32* %18, i32 %add8
  store i32 0, i32* %arrayidx9, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end4
  %20 = load i32, i32* %j, align 4
  %21 = load i32, i32* %n, align 4
  %cmp10 = icmp ult i32 %20, %21
  br i1 %cmp10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %22 = load i32*, i32** %wcstr, align 4
  %23 = load i32, i32* %j, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %22, i32 %23
  %24 = load i32, i32* %arrayidx11, align 4
  %cmp12 = icmp eq i32 %24, 10
  br i1 %cmp12, label %if.then15, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %25 = load i32*, i32** %wcstr, align 4
  %26 = load i32, i32* %j, align 4
  %arrayidx13 = getelementptr inbounds i32, i32* %25, i32 %26
  %27 = load i32, i32* %arrayidx13, align 4
  %cmp14 = icmp eq i32 %27, 9
  br i1 %cmp14, label %if.then15, label %if.end17

if.then15:                                        ; preds = %lor.lhs.false, %for.body
  %28 = load i32*, i32** %wcstr, align 4
  %29 = load i32, i32* %j, align 4
  %arrayidx16 = getelementptr inbounds i32, i32* %28, i32 %29
  store i32 32, i32* %arrayidx16, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %30 = load i32, i32* %j, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %31 = load i32*, i32** %wcstr, align 4
  %add.ptr18 = getelementptr inbounds i32, i32* %31, i32 1
  %32 = load i32, i32* %slen, align 4
  %33 = load i32, i32* %width.addr, align 4
  %sub19 = sub nsw i32 %33, 2
  %call20 = call i32 @wcsnwidth(i32* %add.ptr18, i32 %32, i32 %sub19)
  store i32 %call20, i32* %dispchars, align 4
  %34 = load i32*, i32** %wcstr, align 4
  %add.ptr21 = getelementptr inbounds i32, i32* %34, i32 1
  %35 = load i32, i32* %dispchars, align 4
  %call22 = call i32 @wcswidth(i32* %add.ptr21, i32 %35)
  %add23 = add nsw i32 %call22, 1
  store i32 %add23, i32* %dispcols, align 4
  %36 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %37 = load i32, i32* %i.addr, align 4
  %arrayidx24 = getelementptr inbounds %struct.builtin, %struct.builtin* %36, i32 %37
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx24, i32 0, i32 2
  %38 = load i32, i32* %flags, align 4
  %and = and i32 %38, 1
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 32, i32 42
  %39 = load i32*, i32** %wcstr, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %39, i32 0
  store i32 %cond, i32* %arrayidx25, align 4
  %40 = load i32, i32* %dispcols, align 4
  %41 = load i32, i32* %width.addr, align 4
  %sub26 = sub nsw i32 %41, 2
  %cmp27 = icmp sge i32 %40, %sub26
  br i1 %cmp27, label %if.then28, label %if.end32

if.then28:                                        ; preds = %for.end
  %42 = load i32*, i32** %wcstr, align 4
  %43 = load i32, i32* %dispchars, align 4
  %arrayidx29 = getelementptr inbounds i32, i32* %42, i32 %43
  store i32 62, i32* %arrayidx29, align 4
  %44 = load i32*, i32** %wcstr, align 4
  %45 = load i32, i32* %dispchars, align 4
  %add30 = add nsw i32 %45, 1
  %arrayidx31 = getelementptr inbounds i32, i32* %44, i32 %add30
  store i32 0, i32* %arrayidx31, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then28, %for.end
  %46 = load i32*, i32** %wcstr, align 4
  %call33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.26, i32 0, i32 0), i32* %46)
  %47 = load i32, i32* %i.addr, align 4
  %shl = shl i32 %47, 1
  %48 = load i32, i32* @num_shell_builtins, align 4
  %cmp34 = icmp sge i32 %shl, %48
  br i1 %cmp34, label %if.then38, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %if.end32
  %49 = load i32, i32* %i.addr, align 4
  %50 = load i32, i32* %height.addr, align 4
  %add36 = add nsw i32 %49, %50
  %51 = load i32, i32* @num_shell_builtins, align 4
  %cmp37 = icmp sge i32 %add36, %51
  br i1 %cmp37, label %if.then38, label %if.end40

if.then38:                                        ; preds = %lor.lhs.false35, %if.end32
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  %52 = load i32*, i32** %wcstr, align 4
  %53 = bitcast i32* %52 to i8*
  call void @sh_xfree(i8* %53, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 467)
  br label %return

if.end40:                                         ; preds = %lor.lhs.false35
  %54 = load i32, i32* %dispcols, align 4
  store i32 %54, i32* %j, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc45, %if.end40
  %55 = load i32, i32* %j, align 4
  %56 = load i32, i32* %width.addr, align 4
  %cmp42 = icmp slt i32 %55, %56
  br i1 %cmp42, label %for.body43, label %for.end47

for.body43:                                       ; preds = %for.cond41
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call44 = call i32 @putc(i32 32, %struct._IO_FILE* %57)
  br label %for.inc45

for.inc45:                                        ; preds = %for.body43
  %58 = load i32, i32* %j, align 4
  %inc46 = add nsw i32 %58, 1
  store i32 %inc46, i32* %j, align 4
  br label %for.cond41

for.end47:                                        ; preds = %for.cond41
  %59 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %60 = load i32, i32* %i.addr, align 4
  %61 = load i32, i32* %height.addr, align 4
  %add48 = add nsw i32 %60, %61
  %arrayidx49 = getelementptr inbounds %struct.builtin, %struct.builtin* %59, i32 %add48
  %short_doc50 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx49, i32 0, i32 4
  %62 = load i8*, i8** %short_doc50, align 4
  %call51 = call i8* @libintl_gettext(i8* %62)
  store i8* %call51, i8** %helpdoc, align 4
  %63 = load i8*, i8** %helpdoc, align 4
  %call52 = call i32 @mbstowcs(i32* null, i8* %63, i32 0)
  store i32 %call52, i32* %slen, align 4
  %64 = load i32, i32* %slen, align 4
  %cmp53 = icmp eq i32 %64, -1
  br i1 %cmp53, label %if.then54, label %if.end62

if.then54:                                        ; preds = %for.end47
  %65 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %66 = load i32, i32* %i.addr, align 4
  %67 = load i32, i32* %height.addr, align 4
  %add55 = add nsw i32 %66, %67
  %arrayidx56 = getelementptr inbounds %struct.builtin, %struct.builtin* %65, i32 %add55
  %flags57 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx56, i32 0, i32 2
  %68 = load i32, i32* %flags57, align 4
  %and58 = and i32 %68, 1
  %tobool59 = icmp ne i32 %and58, 0
  %cond60 = select i1 %tobool59, i32 32, i32 42
  %69 = load i8*, i8** %helpdoc, align 4
  %call61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i32 0, i32 0), i32 %cond60, i8* %69)
  %70 = load i32*, i32** %wcstr, align 4
  %71 = bitcast i32* %70 to i8*
  call void @sh_xfree(i8* %71, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 482)
  br label %return

if.end62:                                         ; preds = %for.end47
  %72 = load i32, i32* %slen, align 4
  %73 = load i32, i32* %width.addr, align 4
  %cmp63 = icmp uge i32 %72, %73
  br i1 %cmp63, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.end62
  %74 = load i32, i32* %width.addr, align 4
  %sub65 = sub nsw i32 %74, 2
  store i32 %sub65, i32* %slen, align 4
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.end62
  %75 = load i32*, i32** %wcstr, align 4
  %add.ptr67 = getelementptr inbounds i32, i32* %75, i32 1
  %76 = load i8*, i8** %helpdoc, align 4
  %77 = load i32, i32* %slen, align 4
  %add68 = add i32 %77, 1
  %call69 = call i32 @mbstowcs(i32* %add.ptr67, i8* %76, i32 %add68)
  store i32 %call69, i32* %n, align 4
  %78 = load i32*, i32** %wcstr, align 4
  %79 = load i32, i32* %n, align 4
  %add70 = add i32 %79, 1
  %arrayidx71 = getelementptr inbounds i32, i32* %78, i32 %add70
  store i32 0, i32* %arrayidx71, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond72

for.cond72:                                       ; preds = %for.inc83, %if.end66
  %80 = load i32, i32* %j, align 4
  %81 = load i32, i32* %n, align 4
  %cmp73 = icmp ult i32 %80, %81
  br i1 %cmp73, label %for.body74, label %for.end85

for.body74:                                       ; preds = %for.cond72
  %82 = load i32*, i32** %wcstr, align 4
  %83 = load i32, i32* %j, align 4
  %arrayidx75 = getelementptr inbounds i32, i32* %82, i32 %83
  %84 = load i32, i32* %arrayidx75, align 4
  %cmp76 = icmp eq i32 %84, 10
  br i1 %cmp76, label %if.then80, label %lor.lhs.false77

lor.lhs.false77:                                  ; preds = %for.body74
  %85 = load i32*, i32** %wcstr, align 4
  %86 = load i32, i32* %j, align 4
  %arrayidx78 = getelementptr inbounds i32, i32* %85, i32 %86
  %87 = load i32, i32* %arrayidx78, align 4
  %cmp79 = icmp eq i32 %87, 9
  br i1 %cmp79, label %if.then80, label %if.end82

if.then80:                                        ; preds = %lor.lhs.false77, %for.body74
  %88 = load i32*, i32** %wcstr, align 4
  %89 = load i32, i32* %j, align 4
  %arrayidx81 = getelementptr inbounds i32, i32* %88, i32 %89
  store i32 32, i32* %arrayidx81, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then80, %lor.lhs.false77
  br label %for.inc83

for.inc83:                                        ; preds = %if.end82
  %90 = load i32, i32* %j, align 4
  %inc84 = add nsw i32 %90, 1
  store i32 %inc84, i32* %j, align 4
  br label %for.cond72

for.end85:                                        ; preds = %for.cond72
  %91 = load i32*, i32** %wcstr, align 4
  %add.ptr86 = getelementptr inbounds i32, i32* %91, i32 1
  %92 = load i32, i32* %slen, align 4
  %93 = load i32, i32* %width.addr, align 4
  %sub87 = sub nsw i32 %93, 2
  %call88 = call i32 @wcsnwidth(i32* %add.ptr86, i32 %92, i32 %sub87)
  store i32 %call88, i32* %dispchars, align 4
  %94 = load i32*, i32** %wcstr, align 4
  %add.ptr89 = getelementptr inbounds i32, i32* %94, i32 1
  %95 = load i32, i32* %dispchars, align 4
  %call90 = call i32 @wcswidth(i32* %add.ptr89, i32 %95)
  %add91 = add nsw i32 %call90, 1
  store i32 %add91, i32* %dispcols, align 4
  %96 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %97 = load i32, i32* %i.addr, align 4
  %98 = load i32, i32* %height.addr, align 4
  %add92 = add nsw i32 %97, %98
  %arrayidx93 = getelementptr inbounds %struct.builtin, %struct.builtin* %96, i32 %add92
  %flags94 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx93, i32 0, i32 2
  %99 = load i32, i32* %flags94, align 4
  %and95 = and i32 %99, 1
  %tobool96 = icmp ne i32 %and95, 0
  %cond97 = select i1 %tobool96, i32 32, i32 42
  %100 = load i32*, i32** %wcstr, align 4
  %arrayidx98 = getelementptr inbounds i32, i32* %100, i32 0
  store i32 %cond97, i32* %arrayidx98, align 4
  %101 = load i32, i32* %dispcols, align 4
  %102 = load i32, i32* %width.addr, align 4
  %sub99 = sub nsw i32 %102, 2
  %cmp100 = icmp sge i32 %101, %sub99
  br i1 %cmp100, label %if.then101, label %if.end105

if.then101:                                       ; preds = %for.end85
  %103 = load i32*, i32** %wcstr, align 4
  %104 = load i32, i32* %dispchars, align 4
  %sub102 = sub nsw i32 %104, 1
  %arrayidx103 = getelementptr inbounds i32, i32* %103, i32 %sub102
  store i32 62, i32* %arrayidx103, align 4
  %105 = load i32*, i32** %wcstr, align 4
  %106 = load i32, i32* %dispchars, align 4
  %arrayidx104 = getelementptr inbounds i32, i32* %105, i32 %106
  store i32 0, i32* %arrayidx104, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.then101, %for.end85
  %107 = load i32*, i32** %wcstr, align 4
  %call106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.28, i32 0, i32 0), i32* %107)
  %108 = load i32*, i32** %wcstr, align 4
  %109 = bitcast i32* %108 to i8*
  call void @sh_xfree(i8* %109, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i32 0, i32 0), i32 514)
  br label %return

return:                                           ; preds = %if.end105, %if.then54, %if.then38, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define internal void @dispcolumn(i32 %i, i8* %buf, i32 %bufsize, i32 %width, i32 %height) #0 {
entry:
  %i.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %bufsize.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %height.addr = alloca i32, align 4
  %j = alloca i32, align 4
  %dispcols = alloca i32, align 4
  %helpdoc = alloca i8*, align 4
  store i32 %i, i32* %i.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %bufsize, i32* %bufsize.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  store i32 %height, i32* %height.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %0, i32 %1
  %short_doc = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 4
  %2 = load i8*, i8** %short_doc, align 4
  %call = call i8* @libintl_gettext(i8* %2)
  store i8* %call, i8** %helpdoc, align 4
  %3 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %4 = load i32, i32* %i.addr, align 4
  %arrayidx1 = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 %4
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx1, i32 0, i32 2
  %5 = load i32, i32* %flags, align 4
  %and = and i32 %5, 1
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 32, i32 42
  %conv = trunc i32 %cond to i8
  %6 = load i8*, i8** %buf.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %6, i32 0
  store i8 %conv, i8* %arrayidx2, align 1
  %7 = load i8*, i8** %buf.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8*, i8** %helpdoc, align 4
  %9 = load i32, i32* %width.addr, align 4
  %sub = sub nsw i32 %9, 2
  %call3 = call i8* @strncpy(i8* %add.ptr, i8* %8, i32 %sub)
  %10 = load i8*, i8** %buf.addr, align 4
  %11 = load i32, i32* %width.addr, align 4
  %sub4 = sub nsw i32 %11, 2
  %arrayidx5 = getelementptr inbounds i8, i8* %10, i32 %sub4
  store i8 62, i8* %arrayidx5, align 1
  %12 = load i8*, i8** %buf.addr, align 4
  %13 = load i32, i32* %width.addr, align 4
  %sub6 = sub nsw i32 %13, 1
  %arrayidx7 = getelementptr inbounds i8, i8* %12, i32 %sub6
  store i8 0, i8* %arrayidx7, align 1
  %14 = load i8*, i8** %buf.addr, align 4
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.29, i32 0, i32 0), i8* %14)
  %15 = load i32, i32* %i.addr, align 4
  %shl = shl i32 %15, 1
  %16 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp sge i32 %shl, %16
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %17 = load i32, i32* %i.addr, align 4
  %18 = load i32, i32* %height.addr, align 4
  %add = add nsw i32 %17, %18
  %19 = load i32, i32* @num_shell_builtins, align 4
  %cmp10 = icmp sge i32 %add, %19
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.15, i32 0, i32 0))
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %20 = load i8*, i8** %buf.addr, align 4
  %call13 = call i32 @strlen(i8* %20)
  store i32 %call13, i32* %dispcols, align 4
  %21 = load i32, i32* %dispcols, align 4
  store i32 %21, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %22 = load i32, i32* %j, align 4
  %23 = load i32, i32* %width.addr, align 4
  %cmp14 = icmp slt i32 %22, %23
  br i1 %cmp14, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call16 = call i32 @putc(i32 32, %struct._IO_FILE* %24)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %25 = load i32, i32* %j, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %26 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %27 = load i32, i32* %i.addr, align 4
  %28 = load i32, i32* %height.addr, align 4
  %add17 = add nsw i32 %27, %28
  %arrayidx18 = getelementptr inbounds %struct.builtin, %struct.builtin* %26, i32 %add17
  %short_doc19 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx18, i32 0, i32 4
  %29 = load i8*, i8** %short_doc19, align 4
  %call20 = call i8* @libintl_gettext(i8* %29)
  store i8* %call20, i8** %helpdoc, align 4
  %30 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %31 = load i32, i32* %i.addr, align 4
  %32 = load i32, i32* %height.addr, align 4
  %add21 = add nsw i32 %31, %32
  %arrayidx22 = getelementptr inbounds %struct.builtin, %struct.builtin* %30, i32 %add21
  %flags23 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx22, i32 0, i32 2
  %33 = load i32, i32* %flags23, align 4
  %and24 = and i32 %33, 1
  %tobool25 = icmp ne i32 %and24, 0
  %cond26 = select i1 %tobool25, i32 32, i32 42
  %conv27 = trunc i32 %cond26 to i8
  %34 = load i8*, i8** %buf.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %34, i32 0
  store i8 %conv27, i8* %arrayidx28, align 1
  %35 = load i8*, i8** %buf.addr, align 4
  %add.ptr29 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8*, i8** %helpdoc, align 4
  %37 = load i32, i32* %width.addr, align 4
  %sub30 = sub nsw i32 %37, 3
  %call31 = call i8* @strncpy(i8* %add.ptr29, i8* %36, i32 %sub30)
  %38 = load i8*, i8** %buf.addr, align 4
  %39 = load i32, i32* %width.addr, align 4
  %sub32 = sub nsw i32 %39, 3
  %arrayidx33 = getelementptr inbounds i8, i8* %38, i32 %sub32
  store i8 62, i8* %arrayidx33, align 1
  %40 = load i8*, i8** %buf.addr, align 4
  %41 = load i32, i32* %width.addr, align 4
  %sub34 = sub nsw i32 %41, 2
  %arrayidx35 = getelementptr inbounds i8, i8* %40, i32 %sub34
  store i8 0, i8* %arrayidx35, align 1
  %42 = load i8*, i8** %buf.addr, align 4
  %call36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i8* %42)
  br label %return

return:                                           ; preds = %for.end, %if.then
  ret void
}

declare i32 @mbstowcs(i32*, i8*, i32) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @wcsnwidth(i32*, i32, i32) #1

declare i32 @wcswidth(i32*, i32) #1

declare i32 @putc(i32, %struct._IO_FILE*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
