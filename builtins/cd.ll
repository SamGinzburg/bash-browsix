; ModuleID = 'cd.c'
source_filename = "cd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@cdspelling = global i32 0, align 4
@restricted = external global i32, align 4
@eflag = internal global i32 0, align 4
@no_symbolic_links = external global i32, align 4
@xattrflag = internal global i32 0, align 4
@.str = private unnamed_addr constant [4 x i8] c"eLP\00", align 1
@loptend = external global %struct.word_list*, align 4
@cdable_vars = common global i32 0, align 4
@interactive = external global i32, align 4
@.str.1 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"HOME not set\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"OLDPWD\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"OLDPWD not set\00", align 1
@privileged_mode = external global i32, align 4
@.str.6 = private unnamed_addr constant [7 x i8] c"CDPATH\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"./cd.def\00", align 1
@the_current_working_directory = external global i8*, align 4
@.str.8 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"%s: %s\00", align 1
@verbatim_pwd = internal global i32 0, align 4
@.str.10 = private unnamed_addr constant [3 x i8] c"LP\00", align 1
@.str.11 = private unnamed_addr constant [4 x i8] c"pwd\00", align 1
@posixly_correct = external global i32, align 4
@.str.12 = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"cd\00", align 1
@array_needs_making = external global i32, align 4
@.str.14 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"OLDPWD=\00", align 1
@.str.16 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"PWD=\00", align 1
@.str.18 = private unnamed_addr constant [6 x i8] c"chdir\00", align 1
@xattrfd = internal global i32 -1, align 4

; Function Attrs: noinline nounwind
define i32 @cd_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %dirname = alloca i8*, align 4
  %cdpath = alloca i8*, align 4
  %path = alloca i8*, align 4
  %temp = alloca i8*, align 4
  %path_index = alloca i32, align 4
  %no_symlinks = alloca i32, align 4
  %opt = alloca i32, align 4
  %lflag = alloca i32, align 4
  %e = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @sh_restricted(i8* null)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* @eflag, align 4
  %1 = load i32, i32* @no_symbolic_links, align 4
  store i32 %1, i32* %no_symlinks, align 4
  store i32 0, i32* @xattrflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %opt, align 4
  switch i32 %3, label %sw.default [
    i32 80, label %sw.bb
    i32 76, label %sw.bb1
    i32 101, label %sw.bb2
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %no_symlinks, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 0, i32* %no_symlinks, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  store i32 1, i32* @eflag, align 4
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
  %4 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %4, %struct.word_list** %list.addr, align 4
  %5 = load i32, i32* @cdable_vars, align 4
  %tobool4 = icmp ne i32 %5, 0
  %cond = select i1 %tobool4, i32 1, i32 0
  %6 = load i32, i32* @interactive, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.end
  %7 = load i32, i32* @cdspelling, align 4
  %tobool6 = icmp ne i32 %7, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.end
  %8 = phi i1 [ false, %while.end ], [ %tobool6, %land.rhs ]
  %cond7 = select i1 %8, i32 2, i32 0
  %or = or i32 %cond, %cond7
  store i32 %or, i32* %lflag, align 4
  %9 = load i32, i32* @eflag, align 4
  %tobool8 = icmp ne i32 %9, 0
  br i1 %tobool8, label %land.lhs.true, label %if.end11

land.lhs.true:                                    ; preds = %land.end
  %10 = load i32, i32* %no_symlinks, align 4
  %cmp9 = icmp eq i32 %10, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %land.lhs.true
  store i32 0, i32* @eflag, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %land.lhs.true, %land.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp12 = icmp eq %struct.word_list* %11, null
  br i1 %cmp12, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.end11
  %call14 = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call14, i8** %dirname, align 4
  %12 = load i8*, i8** %dirname, align 4
  %cmp15 = icmp eq i8* %12, null
  br i1 %cmp15, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.then13
  %call17 = call i8* @libintl_gettext(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call17)
  store i32 1, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.then13
  store i32 0, i32* %lflag, align 4
  br label %if.end88

if.else:                                          ; preds = %if.end11
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 0
  %14 = load %struct.word_list*, %struct.word_list** %next, align 4
  %tobool19 = icmp ne %struct.word_list* %14, null
  br i1 %tobool19, label %if.then20, label %if.else22

if.then20:                                        ; preds = %if.else
  %call21 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call21)
  store i32 1, i32* %retval, align 4
  br label %return

if.else22:                                        ; preds = %if.else
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word23 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word23, align 4
  %arrayidx = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %18 to i32
  %cmp24 = icmp eq i32 %conv, 45
  br i1 %cmp24, label %land.lhs.true26, label %if.else40

land.lhs.true26:                                  ; preds = %if.else22
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word27 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word27, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word28, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %22 to i32
  %cmp31 = icmp eq i32 %conv30, 0
  br i1 %cmp31, label %if.then33, label %if.else40

if.then33:                                        ; preds = %land.lhs.true26
  %call34 = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call34, i8** %dirname, align 4
  %23 = load i8*, i8** %dirname, align 4
  %cmp35 = icmp eq i8* %23, null
  br i1 %cmp35, label %if.then37, label %if.end39

if.then37:                                        ; preds = %if.then33
  %call38 = call i8* @libintl_gettext(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call38)
  store i32 1, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %if.then33
  store i32 4, i32* %lflag, align 4
  br label %if.end86

if.else40:                                        ; preds = %land.lhs.true26, %if.else22
  %24 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word41 = getelementptr inbounds %struct.word_list, %struct.word_list* %24, i32 0, i32 1
  %25 = load %struct.word_desc*, %struct.word_desc** %word41, align 4
  %word42 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %25, i32 0, i32 0
  %26 = load i8*, i8** %word42, align 4
  %call43 = call i32 @absolute_pathname(i8* %26)
  %tobool44 = icmp ne i32 %call43, 0
  br i1 %tobool44, label %if.then45, label %if.else48

if.then45:                                        ; preds = %if.else40
  %27 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word46 = getelementptr inbounds %struct.word_list, %struct.word_list* %27, i32 0, i32 1
  %28 = load %struct.word_desc*, %struct.word_desc** %word46, align 4
  %word47 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %28, i32 0, i32 0
  %29 = load i8*, i8** %word47, align 4
  store i8* %29, i8** %dirname, align 4
  br label %if.end85

if.else48:                                        ; preds = %if.else40
  %30 = load i32, i32* @privileged_mode, align 4
  %cmp49 = icmp eq i32 %30, 0
  br i1 %cmp49, label %land.lhs.true51, label %if.else81

land.lhs.true51:                                  ; preds = %if.else48
  %call52 = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0))
  store i8* %call52, i8** %cdpath, align 4
  %tobool53 = icmp ne i8* %call52, null
  br i1 %tobool53, label %if.then54, label %if.else81

if.then54:                                        ; preds = %land.lhs.true51
  %31 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word55 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word55, align 4
  %word56 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word56, align 4
  store i8* %33, i8** %dirname, align 4
  store i32 0, i32* %path_index, align 4
  br label %while.cond57

while.cond57:                                     ; preds = %if.end79, %if.then54
  %34 = load i8*, i8** %cdpath, align 4
  %call58 = call i8* @extract_colon_unit(i8* %34, i32* %path_index)
  store i8* %call58, i8** %path, align 4
  %tobool59 = icmp ne i8* %call58, null
  br i1 %tobool59, label %while.body60, label %while.end80

while.body60:                                     ; preds = %while.cond57
  %35 = load i8*, i8** %path, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %35, i32 0
  %36 = load i8, i8* %arrayidx61, align 1
  %conv62 = sext i8 %36 to i32
  %cmp63 = icmp ne i32 %conv62, 0
  %conv64 = zext i1 %cmp63 to i32
  store i32 %conv64, i32* %opt, align 4
  %37 = load i8*, i8** %path, align 4
  %38 = load i8*, i8** %dirname, align 4
  %call65 = call i8* @sh_makepath(i8* %37, i8* %38, i32 1)
  store i8* %call65, i8** %temp, align 4
  %39 = load i8*, i8** %path, align 4
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 369)
  %40 = load i8*, i8** %temp, align 4
  %41 = load i32, i32* %no_symlinks, align 4
  %42 = load i32, i32* @xattrflag, align 4
  %call66 = call i32 @change_to_directory(i8* %40, i32 %41, i32 %42)
  %tobool67 = icmp ne i32 %call66, 0
  br i1 %tobool67, label %if.then68, label %if.else78

if.then68:                                        ; preds = %while.body60
  %43 = load i32, i32* %opt, align 4
  %tobool69 = icmp ne i32 %43, 0
  br i1 %tobool69, label %land.lhs.true70, label %if.end76

land.lhs.true70:                                  ; preds = %if.then68
  %44 = load i32, i32* %no_symlinks, align 4
  %tobool71 = icmp ne i32 %44, 0
  br i1 %tobool71, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true70
  %45 = load i8*, i8** %temp, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true70
  %46 = load i8*, i8** @the_current_working_directory, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond72 = phi i8* [ %45, %cond.true ], [ %46, %cond.false ]
  store i8* %cond72, i8** %path, align 4
  %tobool73 = icmp ne i8* %cond72, null
  br i1 %tobool73, label %if.then74, label %if.end76

if.then74:                                        ; preds = %cond.end
  %47 = load i8*, i8** %path, align 4
  %call75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %47)
  br label %if.end76

if.end76:                                         ; preds = %if.then74, %cond.end, %if.then68
  %48 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 380)
  %49 = load i32, i32* %no_symlinks, align 4
  %call77 = call i32 @bindpwd(i32 %49)
  store i32 %call77, i32* %retval, align 4
  br label %return

if.else78:                                        ; preds = %while.body60
  %50 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %50, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 390)
  br label %if.end79

if.end79:                                         ; preds = %if.else78
  br label %while.cond57

while.end80:                                      ; preds = %while.cond57
  br label %if.end84

if.else81:                                        ; preds = %land.lhs.true51, %if.else48
  %51 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word82 = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 1
  %52 = load %struct.word_desc*, %struct.word_desc** %word82, align 4
  %word83 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %52, i32 0, i32 0
  %53 = load i8*, i8** %word83, align 4
  store i8* %53, i8** %dirname, align 4
  br label %if.end84

if.end84:                                         ; preds = %if.else81, %while.end80
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.then45
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.end39
  br label %if.end87

if.end87:                                         ; preds = %if.end86
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %if.end18
  %54 = load i8*, i8** %dirname, align 4
  %55 = load i32, i32* %no_symlinks, align 4
  %56 = load i32, i32* @xattrflag, align 4
  %call89 = call i32 @change_to_directory(i8* %54, i32 %55, i32 %56)
  %tobool90 = icmp ne i32 %call89, 0
  br i1 %tobool90, label %if.then91, label %if.end97

if.then91:                                        ; preds = %if.end88
  %57 = load i32, i32* %lflag, align 4
  %and = and i32 %57, 4
  %tobool92 = icmp ne i32 %and, 0
  br i1 %tobool92, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.then91
  %58 = load i8*, i8** %dirname, align 4
  %call94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %58)
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.then91
  %59 = load i32, i32* %no_symlinks, align 4
  %call96 = call i32 @bindpwd(i32 %59)
  store i32 %call96, i32* %retval, align 4
  br label %return

if.end97:                                         ; preds = %if.end88
  %60 = load i32, i32* %lflag, align 4
  %and98 = and i32 %60, 1
  %tobool99 = icmp ne i32 %and98, 0
  br i1 %tobool99, label %if.then100, label %if.end110

if.then100:                                       ; preds = %if.end97
  %61 = load i8*, i8** %dirname, align 4
  %call101 = call i8* @get_string_value(i8* %61)
  store i8* %call101, i8** %temp, align 4
  %62 = load i8*, i8** %temp, align 4
  %tobool102 = icmp ne i8* %62, null
  br i1 %tobool102, label %land.lhs.true103, label %if.end109

land.lhs.true103:                                 ; preds = %if.then100
  %63 = load i8*, i8** %temp, align 4
  %64 = load i32, i32* %no_symlinks, align 4
  %65 = load i32, i32* @xattrflag, align 4
  %call104 = call i32 @change_to_directory(i8* %63, i32 %64, i32 %65)
  %tobool105 = icmp ne i32 %call104, 0
  br i1 %tobool105, label %if.then106, label %if.end109

if.then106:                                       ; preds = %land.lhs.true103
  %66 = load i8*, i8** %temp, align 4
  %call107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %66)
  %67 = load i32, i32* %no_symlinks, align 4
  %call108 = call i32 @bindpwd(i32 %67)
  store i32 %call108, i32* %retval, align 4
  br label %return

if.end109:                                        ; preds = %land.lhs.true103, %if.then100
  br label %if.end110

if.end110:                                        ; preds = %if.end109, %if.end97
  %68 = load i32, i32* %lflag, align 4
  %and111 = and i32 %68, 2
  %tobool112 = icmp ne i32 %and111, 0
  br i1 %tobool112, label %if.then113, label %if.end127

if.then113:                                       ; preds = %if.end110
  %69 = load i8*, i8** %dirname, align 4
  %call114 = call i8* @dirspell(i8* %69)
  store i8* %call114, i8** %temp, align 4
  %70 = load i8*, i8** %temp, align 4
  %tobool115 = icmp ne i8* %70, null
  br i1 %tobool115, label %land.lhs.true116, label %if.else122

land.lhs.true116:                                 ; preds = %if.then113
  %71 = load i8*, i8** %temp, align 4
  %72 = load i32, i32* %no_symlinks, align 4
  %73 = load i32, i32* @xattrflag, align 4
  %call117 = call i32 @change_to_directory(i8* %71, i32 %72, i32 %73)
  %tobool118 = icmp ne i32 %call117, 0
  br i1 %tobool118, label %if.then119, label %if.else122

if.then119:                                       ; preds = %land.lhs.true116
  %74 = load i8*, i8** %temp, align 4
  %call120 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %74)
  %75 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %75, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 441)
  %76 = load i32, i32* %no_symlinks, align 4
  %call121 = call i32 @bindpwd(i32 %76)
  store i32 %call121, i32* %retval, align 4
  br label %return

if.else122:                                       ; preds = %land.lhs.true116, %if.then113
  br label %do.body

do.body:                                          ; preds = %if.else122
  %77 = load i8*, i8** %temp, align 4
  %tobool123 = icmp ne i8* %77, null
  br i1 %tobool123, label %if.then124, label %if.end125

if.then124:                                       ; preds = %do.body
  %78 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %78, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 445)
  br label %if.end125

if.end125:                                        ; preds = %if.then124, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end125
  br label %if.end126

if.end126:                                        ; preds = %do.end
  br label %if.end127

if.end127:                                        ; preds = %if.end126, %if.end110
  %call128 = call i32* @__errno_location()
  %79 = load i32, i32* %call128, align 4
  store i32 %79, i32* %e, align 4
  %80 = load i8*, i8** %dirname, align 4
  %call129 = call i8* @printable_filename(i8* %80, i32 0)
  store i8* %call129, i8** %temp, align 4
  %81 = load i8*, i8** %temp, align 4
  %82 = load i32, i32* %e, align 4
  %call130 = call i8* @strerror(i32 %82)
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8* %81, i8* %call130)
  %83 = load i8*, i8** %temp, align 4
  %84 = load i8*, i8** %dirname, align 4
  %cmp131 = icmp ne i8* %83, %84
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %if.end127
  %85 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %85, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 452)
  br label %if.end134

if.end134:                                        ; preds = %if.then133, %if.end127
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end134, %if.then119, %if.then106, %if.end95, %if.end76, %if.then37, %if.then20, %if.then16, %sw.default, %sw.bb3, %if.then
  %86 = load i32, i32* %retval, align 4
  ret i32 %86
}

declare void @sh_restricted(i8*) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i8* @get_string_value(i8*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @absolute_pathname(i8*) #1

declare i8* @extract_colon_unit(i8*, i32*) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @change_to_directory(i8* %newdir, i32 %nolinks, i32 %xattr) #0 {
entry:
  %retval = alloca i32, align 4
  %newdir.addr = alloca i8*, align 4
  %nolinks.addr = alloca i32, align 4
  %xattr.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %tdir = alloca i8*, align 4
  %ndir = alloca i8*, align 4
  %err = alloca i32, align 4
  %canon_failed = alloca i32, align 4
  %r = alloca i32, align 4
  %ndlen = alloca i32, align 4
  %dlen = alloca i32, align 4
  store i8* %newdir, i8** %newdir.addr, align 4
  store i32 %nolinks, i32* %nolinks.addr, align 4
  store i32 %xattr, i32* %xattr.addr, align 4
  store i8* null, i8** %tdir, align 4
  %0 = load i8*, i8** @the_current_working_directory, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end2

if.then:                                          ; preds = %entry
  %call = call i8* @get_working_directory(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.18, i32 0, i32 0))
  store i8* %call, i8** %t, align 4
  br label %do.body

do.body:                                          ; preds = %if.then
  %1 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %do.body
  %2 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 557)
  br label %if.end

if.end:                                           ; preds = %if.then1, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %if.end2

if.end2:                                          ; preds = %do.end, %entry
  %3 = load i8*, i8** %newdir.addr, align 4
  %4 = load i8*, i8** @the_current_working_directory, align 4
  %call3 = call i8* @make_absolute(i8* %3, i8* %4)
  store i8* %call3, i8** %t, align 4
  %5 = load i32, i32* %nolinks.addr, align 4
  %tobool4 = icmp ne i32 %5, 0
  br i1 %tobool4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end2
  %6 = load i8*, i8** %t, align 4
  %call5 = call i8* @sh_physpath(i8* %6, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %if.end2
  %7 = load i8*, i8** %t, align 4
  %call6 = call i8* @sh_canonpath(i8* %7, i32 3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call5, %cond.true ], [ %call6, %cond.false ]
  store i8* %cond, i8** %tdir, align 4
  %8 = load i8*, i8** %newdir.addr, align 4
  %call7 = call i32 @strlen(i8* %8)
  store i32 %call7, i32* %ndlen, align 4
  %9 = load i8*, i8** %t, align 4
  %call8 = call i32 @strlen(i8* %9)
  store i32 %call8, i32* %dlen, align 4
  store i32 0, i32* %canon_failed, align 4
  %10 = load i8*, i8** %tdir, align 4
  %tobool9 = icmp ne i8* %10, null
  br i1 %tobool9, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end
  %11 = load i8*, i8** %tdir, align 4
  %12 = load i8, i8* %11, align 1
  %conv = sext i8 %12 to i32
  %tobool10 = icmp ne i32 %conv, 0
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %land.lhs.true
  %13 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 575)
  br label %if.end17

if.else:                                          ; preds = %land.lhs.true, %cond.end
  br label %do.body12

do.body12:                                        ; preds = %if.else
  %14 = load i8*, i8** %tdir, align 4
  %tobool13 = icmp ne i8* %14, null
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %do.body12
  %15 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 578)
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %do.body12
  br label %do.end16

do.end16:                                         ; preds = %if.end15
  %16 = load i8*, i8** %t, align 4
  store i8* %16, i8** %tdir, align 4
  store i32 1, i32* %canon_failed, align 4
  br label %if.end17

if.end17:                                         ; preds = %do.end16, %if.then11
  %17 = load i32, i32* @posixly_correct, align 4
  %tobool18 = icmp ne i32 %17, 0
  br i1 %tobool18, label %land.lhs.true19, label %if.end41

land.lhs.true19:                                  ; preds = %if.end17
  %18 = load i32, i32* %nolinks.addr, align 4
  %cmp20 = icmp eq i32 %18, 0
  br i1 %cmp20, label %land.lhs.true22, label %if.end41

land.lhs.true22:                                  ; preds = %land.lhs.true19
  %19 = load i32, i32* %canon_failed, align 4
  %tobool23 = icmp ne i32 %19, 0
  br i1 %tobool23, label %land.lhs.true24, label %if.end41

land.lhs.true24:                                  ; preds = %land.lhs.true22
  %call25 = call i32* @__errno_location()
  %20 = load i32, i32* %call25, align 4
  %cmp26 = icmp ne i32 %20, 36
  br i1 %cmp26, label %if.then30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true24
  %21 = load i32, i32* %ndlen, align 4
  %cmp28 = icmp sgt i32 %21, 4096
  br i1 %cmp28, label %if.then30, label %if.end41

if.then30:                                        ; preds = %lor.lhs.false, %land.lhs.true24
  %call31 = call i32* @__errno_location()
  %22 = load i32, i32* %call31, align 4
  %cmp32 = icmp ne i32 %22, 2
  br i1 %cmp32, label %land.lhs.true34, label %if.end40

land.lhs.true34:                                  ; preds = %if.then30
  %call35 = call i32* @__errno_location()
  %23 = load i32, i32* %call35, align 4
  %cmp36 = icmp ne i32 %23, 36
  br i1 %cmp36, label %if.then38, label %if.end40

if.then38:                                        ; preds = %land.lhs.true34
  %call39 = call i32* @__errno_location()
  store i32 20, i32* %call39, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then38, %land.lhs.true34, %if.then30
  %24 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 594)
  store i32 0, i32* %retval, align 4
  br label %return

if.end41:                                         ; preds = %lor.lhs.false, %land.lhs.true22, %land.lhs.true19, %if.end17
  %25 = load i32, i32* %nolinks.addr, align 4
  %tobool42 = icmp ne i32 %25, 0
  br i1 %tobool42, label %cond.true43, label %cond.false44

cond.true43:                                      ; preds = %if.end41
  %26 = load i8*, i8** %newdir.addr, align 4
  br label %cond.end45

cond.false44:                                     ; preds = %if.end41
  %27 = load i8*, i8** %tdir, align 4
  br label %cond.end45

cond.end45:                                       ; preds = %cond.false44, %cond.true43
  %cond46 = phi i8* [ %26, %cond.true43 ], [ %27, %cond.false44 ]
  %call47 = call i32 @chdir(i8* %cond46)
  store i32 %call47, i32* %r, align 4
  %28 = load i32, i32* %r, align 4
  %cmp48 = icmp sge i32 %28, 0
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %cond.end45
  call void @resetxattr()
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %cond.end45
  %29 = load i32, i32* %r, align 4
  %cmp52 = icmp eq i32 %29, 0
  br i1 %cmp52, label %if.then54, label %if.end65

if.then54:                                        ; preds = %if.end51
  %30 = load i32, i32* %canon_failed, align 4
  %tobool55 = icmp ne i32 %30, 0
  br i1 %tobool55, label %if.then56, label %if.else63

if.then56:                                        ; preds = %if.then54
  %call57 = call i8* @resetpwd(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0))
  store i8* %call57, i8** %t, align 4
  %31 = load i8*, i8** %t, align 4
  %cmp58 = icmp eq i8* %31, null
  br i1 %cmp58, label %if.then60, label %if.else61

if.then60:                                        ; preds = %if.then56
  %32 = load i8*, i8** %tdir, align 4
  call void @set_working_directory(i8* %32)
  br label %if.end62

if.else61:                                        ; preds = %if.then56
  %33 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 635)
  br label %if.end62

if.end62:                                         ; preds = %if.else61, %if.then60
  br label %if.end64

if.else63:                                        ; preds = %if.then54
  %34 = load i8*, i8** %tdir, align 4
  call void @set_working_directory(i8* %34)
  br label %if.end64

if.end64:                                         ; preds = %if.else63, %if.end62
  %35 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 640)
  store i32 1, i32* %retval, align 4
  br label %return

if.end65:                                         ; preds = %if.end51
  %36 = load i32, i32* %nolinks.addr, align 4
  %tobool66 = icmp ne i32 %36, 0
  br i1 %tobool66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end65
  %37 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %37, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 648)
  store i32 0, i32* %retval, align 4
  br label %return

if.end68:                                         ; preds = %if.end65
  %call69 = call i32* @__errno_location()
  %38 = load i32, i32* %call69, align 4
  store i32 %38, i32* %err, align 4
  %39 = load i8*, i8** %newdir.addr, align 4
  %call70 = call i32 @chdir(i8* %39)
  %cmp71 = icmp eq i32 %call70, 0
  br i1 %cmp71, label %if.then73, label %if.else80

if.then73:                                        ; preds = %if.end68
  %call74 = call i8* @resetpwd(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0))
  store i8* %call74, i8** %t, align 4
  %40 = load i8*, i8** %t, align 4
  %cmp75 = icmp eq i8* %40, null
  br i1 %cmp75, label %if.then77, label %if.else78

if.then77:                                        ; preds = %if.then73
  %41 = load i8*, i8** %tdir, align 4
  call void @set_working_directory(i8* %41)
  br label %if.end79

if.else78:                                        ; preds = %if.then73
  %42 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 663)
  br label %if.end79

if.end79:                                         ; preds = %if.else78, %if.then77
  store i32 1, i32* %r, align 4
  br label %if.end82

if.else80:                                        ; preds = %if.end68
  %43 = load i32, i32* %err, align 4
  %call81 = call i32* @__errno_location()
  store i32 %43, i32* %call81, align 4
  store i32 0, i32* %r, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.else80, %if.end79
  %44 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 673)
  %45 = load i32, i32* %r, align 4
  store i32 %45, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end82, %if.then67, %if.end64, %if.end40
  %46 = load i32, i32* %retval, align 4
  ret i32 %46
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal i32 @bindpwd(i32 %no_symlinks) #0 {
entry:
  %no_symlinks.addr = alloca i32, align 4
  %dirname = alloca i8*, align 4
  %pwdvar = alloca i8*, align 4
  %old_anm = alloca i32, align 4
  %r = alloca i32, align 4
  %tvar = alloca %struct.variable*, align 4
  store i32 %no_symlinks, i32* %no_symlinks.addr, align 4
  %call = call i32 @sh_chkwrite(i32 0)
  store i32 %call, i32* %r, align 4
  %0 = load i8*, i8** @the_current_working_directory, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false4

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %no_symlinks.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %cond.true2, label %cond.false

cond.true2:                                       ; preds = %cond.true
  %2 = load i8*, i8** @the_current_working_directory, align 4
  %call3 = call i8* @sh_physpath(i8* %2, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %3 = load i8*, i8** @the_current_working_directory, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true2
  %cond = phi i8* [ %call3, %cond.true2 ], [ %3, %cond.false ]
  br label %cond.end6

cond.false4:                                      ; preds = %entry
  %call5 = call i8* @get_working_directory(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0))
  br label %cond.end6

cond.end6:                                        ; preds = %cond.false4, %cond.end
  %cond7 = phi i8* [ %cond, %cond.end ], [ %call5, %cond.false4 ]
  store i8* %cond7, i8** %dirname, align 4
  %4 = load i32, i32* @array_needs_making, align 4
  store i32 %4, i32* %old_anm, align 4
  %call8 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0))
  store i8* %call8, i8** %pwdvar, align 4
  %5 = load i8*, i8** %pwdvar, align 4
  %call9 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* %5, i32 0)
  store %struct.variable* %call9, %struct.variable** %tvar, align 4
  %6 = load %struct.variable*, %struct.variable** %tvar, align 4
  %tobool10 = icmp ne %struct.variable* %6, null
  br i1 %tobool10, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %cond.end6
  %7 = load %struct.variable*, %struct.variable** %tvar, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 5
  %8 = load i32, i32* %attributes, align 4
  %and = and i32 %8, 2
  %tobool11 = icmp ne i32 %and, 0
  br i1 %tobool11, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %cond.end6
  %9 = load i32, i32* %old_anm, align 4
  %cmp = icmp eq i32 %9, 0
  br i1 %cmp, label %land.lhs.true12, label %if.end19

land.lhs.true12:                                  ; preds = %if.end
  %10 = load i32, i32* @array_needs_making, align 4
  %tobool13 = icmp ne i32 %10, 0
  br i1 %tobool13, label %land.lhs.true14, label %if.end19

land.lhs.true14:                                  ; preds = %land.lhs.true12
  %11 = load %struct.variable*, %struct.variable** %tvar, align 4
  %attributes15 = getelementptr inbounds %struct.variable, %struct.variable* %11, i32 0, i32 5
  %12 = load i32, i32* %attributes15, align 4
  %and16 = and i32 %12, 1
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.end19

if.then18:                                        ; preds = %land.lhs.true14
  %13 = load i8*, i8** %pwdvar, align 4
  call void @update_export_env_inplace(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0), i32 7, i8* %13)
  store i32 0, i32* @array_needs_making, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then18, %land.lhs.true14, %land.lhs.true12, %if.end
  %14 = load i8*, i8** %dirname, align 4
  %call20 = call i32 @setpwd(i8* %14)
  %cmp21 = icmp eq i32 %call20, 1
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end19
  store i32 1, i32* %r, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %if.end19
  %15 = load i8*, i8** %dirname, align 4
  %cmp24 = icmp eq i8* %15, null
  br i1 %cmp24, label %land.lhs.true25, label %if.end28

land.lhs.true25:                                  ; preds = %if.end23
  %16 = load i32, i32* @eflag, align 4
  %tobool26 = icmp ne i32 %16, 0
  br i1 %tobool26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %land.lhs.true25
  store i32 1, i32* %r, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.then27, %land.lhs.true25, %if.end23
  %17 = load i8*, i8** %dirname, align 4
  %tobool29 = icmp ne i8* %17, null
  br i1 %tobool29, label %land.lhs.true30, label %if.end33

land.lhs.true30:                                  ; preds = %if.end28
  %18 = load i8*, i8** %dirname, align 4
  %19 = load i8*, i8** @the_current_working_directory, align 4
  %cmp31 = icmp ne i8* %18, %19
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %land.lhs.true30
  %20 = load i8*, i8** %dirname, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 172)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %land.lhs.true30, %if.end28
  %21 = load i32, i32* %r, align 4
  ret i32 %21
}

declare i8* @dirspell(i8*) #1

declare i32* @__errno_location() #1

declare i8* @printable_filename(i8*, i32) #1

declare i8* @strerror(i32) #1

; Function Attrs: noinline nounwind
define i32 @pwd_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %directory = alloca i8*, align 4
  %opt = alloca i32, align 4
  %pflag = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @no_symbolic_links, align 4
  store i32 %0, i32* @verbatim_pwd, align 4
  store i32 0, i32* %pflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %opt, align 4
  switch i32 %2, label %sw.default [
    i32 80, label %sw.bb
    i32 76, label %sw.bb1
    i32 -99, label %sw.bb2
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %pflag, align 4
  store i32 1, i32* @verbatim_pwd, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 0, i32* @verbatim_pwd, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %3 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %3, %struct.word_list** %list.addr, align 4
  %4 = load i8*, i8** @the_current_working_directory, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %cond.true, label %cond.false6

cond.true:                                        ; preds = %while.end
  %5 = load i32, i32* @verbatim_pwd, align 4
  %tobool3 = icmp ne i32 %5, 0
  br i1 %tobool3, label %cond.true4, label %cond.false

cond.true4:                                       ; preds = %cond.true
  %6 = load i8*, i8** @the_current_working_directory, align 4
  %call5 = call i8* @sh_physpath(i8* %6, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %7 = load i8*, i8** @the_current_working_directory, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true4
  %cond = phi i8* [ %call5, %cond.true4 ], [ %7, %cond.false ]
  br label %cond.end8

cond.false6:                                      ; preds = %while.end
  %call7 = call i8* @get_working_directory(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0))
  br label %cond.end8

cond.end8:                                        ; preds = %cond.false6, %cond.end
  %cond9 = phi i8* [ %cond, %cond.end ], [ %call7, %cond.false6 ]
  store i8* %cond9, i8** %directory, align 4
  %8 = load i8*, i8** @the_current_working_directory, align 4
  %tobool10 = icmp ne i8* %8, null
  br i1 %tobool10, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %cond.end8
  %9 = load i8*, i8** %directory, align 4
  %cmp11 = icmp eq i8* %9, null
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %cond.end8
  %10 = load i32, i32* @posixly_correct, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.end21

land.lhs.true13:                                  ; preds = %lor.lhs.false
  %11 = load i8*, i8** @the_current_working_directory, align 4
  %call14 = call i32 @same_file(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* %11, %struct.stat* null, %struct.stat* null)
  %cmp15 = icmp eq i32 %call14, 0
  br i1 %cmp15, label %if.then, label %if.end21

if.then:                                          ; preds = %land.lhs.true13, %land.lhs.true
  %12 = load i8*, i8** %directory, align 4
  %tobool16 = icmp ne i8* %12, null
  br i1 %tobool16, label %land.lhs.true17, label %if.end

land.lhs.true17:                                  ; preds = %if.then
  %13 = load i8*, i8** %directory, align 4
  %14 = load i8*, i8** @the_current_working_directory, align 4
  %cmp18 = icmp ne i8* %13, %14
  br i1 %cmp18, label %if.then19, label %if.end

if.then19:                                        ; preds = %land.lhs.true17
  %15 = load i8*, i8** %directory, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 517)
  br label %if.end

if.end:                                           ; preds = %if.then19, %land.lhs.true17, %if.then
  %call20 = call i8* @resetpwd(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.11, i32 0, i32 0))
  store i8* %call20, i8** %directory, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.end, %land.lhs.true13, %lor.lhs.false
  %16 = load i8*, i8** %directory, align 4
  %tobool22 = icmp ne i8* %16, null
  br i1 %tobool22, label %if.then23, label %if.else

if.then23:                                        ; preds = %if.end21
  store i32 0, i32* %opt, align 4
  %17 = load i8*, i8** %directory, align 4
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %17)
  %18 = load i32, i32* @posixly_correct, align 4
  %tobool25 = icmp ne i32 %18, 0
  br i1 %tobool25, label %land.lhs.true26, label %if.end30

land.lhs.true26:                                  ; preds = %if.then23
  %19 = load i32, i32* %pflag, align 4
  %tobool27 = icmp ne i32 %19, 0
  br i1 %tobool27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %land.lhs.true26
  %20 = load i8*, i8** %directory, align 4
  %call29 = call i32 @setpwd(i8* %20)
  store i32 %call29, i32* %opt, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %land.lhs.true26, %if.then23
  %21 = load i8*, i8** %directory, align 4
  %22 = load i8*, i8** @the_current_working_directory, align 4
  %cmp31 = icmp ne i8* %21, %22
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  %23 = load i8*, i8** %directory, align 4
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 531)
  br label %if.end33

if.end33:                                         ; preds = %if.then32, %if.end30
  %24 = load i32, i32* %opt, align 4
  %call34 = call i32 @sh_chkwrite(i32 %24)
  store i32 %call34, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end21
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end33, %sw.default, %sw.bb2
  %25 = load i32, i32* %retval, align 4
  ret i32 %25
}

declare i8* @sh_physpath(i8*, i32) #1

declare i8* @get_working_directory(i8*) #1

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define internal i8* @resetpwd(i8* %caller) #0 {
entry:
  %caller.addr = alloca i8*, align 4
  %tdir = alloca i8*, align 4
  store i8* %caller, i8** %caller.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load i8*, i8** @the_current_working_directory, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %1 = load i8*, i8** @the_current_working_directory, align 4
  call void @sh_xfree(i8* %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i32 0, i32 0), i32 185)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  store i8* null, i8** @the_current_working_directory, align 4
  %2 = load i8*, i8** %caller.addr, align 4
  %call = call i8* @get_working_directory(i8* %2)
  store i8* %call, i8** %tdir, align 4
  %3 = load i8*, i8** %tdir, align 4
  ret i8* %3
}

; Function Attrs: noinline nounwind
define internal i32 @setpwd(i8* %dirname) #0 {
entry:
  %retval = alloca i32, align 4
  %dirname.addr = alloca i8*, align 4
  %old_anm = alloca i32, align 4
  %tvar = alloca %struct.variable*, align 4
  store i8* %dirname, i8** %dirname.addr, align 4
  %0 = load i32, i32* @array_needs_making, align 4
  store i32 %0, i32* %old_anm, align 4
  %1 = load i8*, i8** %dirname.addr, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %dirname.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %2, %cond.true ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.16, i32 0, i32 0), %cond.false ]
  %call = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* %cond, i32 0)
  store %struct.variable* %call, %struct.variable** %tvar, align 4
  %3 = load %struct.variable*, %struct.variable** %tvar, align 4
  %tobool1 = icmp ne %struct.variable* %3, null
  br i1 %tobool1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %cond.end
  %4 = load %struct.variable*, %struct.variable** %tvar, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 2
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %cond.end
  %6 = load %struct.variable*, %struct.variable** %tvar, align 4
  %tobool3 = icmp ne %struct.variable* %6, null
  br i1 %tobool3, label %land.lhs.true4, label %if.end17

land.lhs.true4:                                   ; preds = %if.end
  %7 = load i32, i32* %old_anm, align 4
  %cmp = icmp eq i32 %7, 0
  br i1 %cmp, label %land.lhs.true5, label %if.end17

land.lhs.true5:                                   ; preds = %land.lhs.true4
  %8 = load i32, i32* @array_needs_making, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %land.lhs.true7, label %if.end17

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %9 = load %struct.variable*, %struct.variable** %tvar, align 4
  %attributes8 = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 5
  %10 = load i32, i32* %attributes8, align 4
  %and9 = and i32 %10, 1
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end17

if.then11:                                        ; preds = %land.lhs.true7
  %11 = load i8*, i8** %dirname.addr, align 4
  %tobool12 = icmp ne i8* %11, null
  br i1 %tobool12, label %cond.true13, label %cond.false14

cond.true13:                                      ; preds = %if.then11
  %12 = load i8*, i8** %dirname.addr, align 4
  br label %cond.end15

cond.false14:                                     ; preds = %if.then11
  br label %cond.end15

cond.end15:                                       ; preds = %cond.false14, %cond.true13
  %cond16 = phi i8* [ %12, %cond.true13 ], [ getelementptr inbounds ([1 x i8], [1 x i8]* @.str.16, i32 0, i32 0), %cond.false14 ]
  call void @update_export_env_inplace(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i32 4, i8* %cond16)
  store i32 0, i32* @array_needs_making, align 4
  br label %if.end17

if.end17:                                         ; preds = %cond.end15, %land.lhs.true7, %land.lhs.true5, %land.lhs.true4, %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end17, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @sh_chkwrite(i32) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare void @update_export_env_inplace(i8*, i32, i8*) #1

declare i8* @make_absolute(i8*, i8*) #1

declare i8* @sh_canonpath(i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @chdir(i8*) #1

; Function Attrs: noinline nounwind
define internal void @resetxattr() #0 {
entry:
  store i32 -1, i32* @xattrfd, align 4
  ret void
}

declare void @set_working_directory(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
