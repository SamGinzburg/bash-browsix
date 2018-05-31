; ModuleID = 'alias.c'
source_filename = "alias.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct._IO_FILE = type opaque
%struct.alias = type { i8*, i8*, i8 }

@posixly_correct = external global i32, align 4
@.str = private unnamed_addr constant [2 x i8] c"p\00", align 1
@loptend = external global %struct.word_list*, align 4
@aliases = external global %struct.hash_table*, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"./alias.def\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"`%s': invalid alias name\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"alias %s\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"-- \00", align 1
@.str.6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.7 = private unnamed_addr constant [7 x i8] c"%s=%s\0A\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4

; Function Attrs: noinline nounwind
define i32 @alias_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %any_failed = alloca i32, align 4
  %offset = alloca i32, align 4
  %pflag = alloca i32, align 4
  %dflags = alloca i32, align 4
  %alias_list = alloca %struct.alias**, align 4
  %t = alloca %struct.alias*, align 4
  %name = alloca i8*, align 4
  %value = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 0, i32 1
  store i32 %cond, i32* %dflags, align 4
  store i32 0, i32* %pflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %offset, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %offset, align 4
  switch i32 %2, label %sw.default [
    i32 112, label %sw.bb
    i32 -99, label %sw.bb1
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %pflag, align 4
  %3 = load i32, i32* %dflags, align 4
  %or = or i32 %3, 1
  store i32 %or, i32* %dflags, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %4, %struct.word_list** %list.addr, align 4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp2 = icmp eq %struct.word_list* %5, null
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %6 = load i32, i32* %pflag, align 4
  %tobool3 = icmp ne i32 %6, 0
  br i1 %tobool3, label %if.then, label %if.end16

if.then:                                          ; preds = %lor.lhs.false, %while.end
  %7 = load %struct.hash_table*, %struct.hash_table** @aliases, align 4
  %cmp4 = icmp eq %struct.hash_table* %7, null
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %call6 = call %struct.alias** @all_aliases()
  store %struct.alias** %call6, %struct.alias*** %alias_list, align 4
  %8 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %cmp7 = icmp eq %struct.alias** %8, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.end
  store i32 0, i32* %offset, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end9
  %9 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %10 = load i32, i32* %offset, align 4
  %arrayidx = getelementptr inbounds %struct.alias*, %struct.alias** %9, i32 %10
  %11 = load %struct.alias*, %struct.alias** %arrayidx, align 4
  %tobool10 = icmp ne %struct.alias* %11, null
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %13 = load i32, i32* %offset, align 4
  %arrayidx11 = getelementptr inbounds %struct.alias*, %struct.alias** %12, i32 %13
  %14 = load %struct.alias*, %struct.alias** %arrayidx11, align 4
  %15 = load i32, i32* %dflags, align 4
  call void @print_alias(%struct.alias* %14, i32 %15)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %offset, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %offset, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load %struct.alias**, %struct.alias*** %alias_list, align 4
  %18 = bitcast %struct.alias** %17 to i8*
  call void @sh_xfree(i8* %18, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 112)
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp12 = icmp eq %struct.word_list* %19, null
  br i1 %cmp12, label %if.then13, label %if.end15

if.then13:                                        ; preds = %for.end
  %call14 = call i32 @sh_chkwrite(i32 0)
  store i32 %call14, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %for.end
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %lor.lhs.false
  store i32 0, i32* %any_failed, align 4
  br label %while.cond17

while.cond17:                                     ; preds = %if.end54, %if.end16
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool18 = icmp ne %struct.word_list* %20, null
  br i1 %tobool18, label %while.body19, label %while.end55

while.body19:                                     ; preds = %while.cond17
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word20, align 4
  store i8* %23, i8** %name, align 4
  store i32 0, i32* %offset, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc29, %while.body19
  %24 = load i8*, i8** %name, align 4
  %25 = load i32, i32* %offset, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i8, i8* %arrayidx22, align 1
  %conv = sext i8 %26 to i32
  %tobool23 = icmp ne i32 %conv, 0
  br i1 %tobool23, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond21
  %27 = load i8*, i8** %name, align 4
  %28 = load i32, i32* %offset, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %27, i32 %28
  %29 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %29 to i32
  %cmp26 = icmp ne i32 %conv25, 61
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond21
  %30 = phi i1 [ false, %for.cond21 ], [ %cmp26, %land.rhs ]
  br i1 %30, label %for.body28, label %for.end31

for.body28:                                       ; preds = %land.end
  br label %for.inc29

for.inc29:                                        ; preds = %for.body28
  %31 = load i32, i32* %offset, align 4
  %inc30 = add nsw i32 %31, 1
  store i32 %inc30, i32* %offset, align 4
  br label %for.cond21

for.end31:                                        ; preds = %land.end
  %32 = load i32, i32* %offset, align 4
  %tobool32 = icmp ne i32 %32, 0
  br i1 %tobool32, label %land.lhs.true, label %if.else47

land.lhs.true:                                    ; preds = %for.end31
  %33 = load i8*, i8** %name, align 4
  %34 = load i32, i32* %offset, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %33, i32 %34
  %35 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %35 to i32
  %cmp35 = icmp eq i32 %conv34, 61
  br i1 %cmp35, label %if.then37, label %if.else47

if.then37:                                        ; preds = %land.lhs.true
  %36 = load i8*, i8** %name, align 4
  %37 = load i32, i32* %offset, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %36, i32 %37
  store i8 0, i8* %arrayidx38, align 1
  %38 = load i8*, i8** %name, align 4
  %39 = load i32, i32* %offset, align 4
  %add.ptr = getelementptr inbounds i8, i8* %38, i32 %39
  %add.ptr39 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr39, i8** %value, align 4
  %40 = load i8*, i8** %name, align 4
  %call40 = call i32 @legal_alias_name(i8* %40, i32 0)
  %cmp41 = icmp eq i32 %call40, 0
  br i1 %cmp41, label %if.then43, label %if.else

if.then43:                                        ; preds = %if.then37
  %call44 = call i8* @libintl_gettext(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i32 0, i32 0))
  %41 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call44, i8* %41)
  %42 = load i32, i32* %any_failed, align 4
  %inc45 = add nsw i32 %42, 1
  store i32 %inc45, i32* %any_failed, align 4
  br label %if.end46

if.else:                                          ; preds = %if.then37
  %43 = load i8*, i8** %name, align 4
  %44 = load i8*, i8** %value, align 4
  call void @add_alias(i8* %43, i8* %44)
  br label %if.end46

if.end46:                                         ; preds = %if.else, %if.then43
  br label %if.end54

if.else47:                                        ; preds = %land.lhs.true, %for.end31
  %45 = load i8*, i8** %name, align 4
  %call48 = call %struct.alias* @find_alias(i8* %45)
  store %struct.alias* %call48, %struct.alias** %t, align 4
  %46 = load %struct.alias*, %struct.alias** %t, align 4
  %tobool49 = icmp ne %struct.alias* %46, null
  br i1 %tobool49, label %if.then50, label %if.else51

if.then50:                                        ; preds = %if.else47
  %47 = load %struct.alias*, %struct.alias** %t, align 4
  %48 = load i32, i32* %dflags, align 4
  call void @print_alias(%struct.alias* %47, i32 %48)
  br label %if.end53

if.else51:                                        ; preds = %if.else47
  %49 = load i8*, i8** %name, align 4
  call void @sh_notfound(i8* %49)
  %50 = load i32, i32* %any_failed, align 4
  %inc52 = add nsw i32 %50, 1
  store i32 %inc52, i32* %any_failed, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.else51, %if.then50
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.end46
  %51 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %51, i32 0, i32 0
  %52 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %52, %struct.word_list** %list.addr, align 4
  br label %while.cond17

while.end55:                                      ; preds = %while.cond17
  %53 = load i32, i32* %any_failed, align 4
  %tobool56 = icmp ne i32 %53, 0
  %cond57 = select i1 %tobool56, i32 1, i32 0
  store i32 %cond57, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end55, %if.then13, %if.then8, %if.then5, %sw.default, %sw.bb1
  %54 = load i32, i32* %retval, align 4
  ret i32 %54
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare %struct.alias** @all_aliases() #1

; Function Attrs: noinline nounwind
define internal void @print_alias(%struct.alias* %alias, i32 %flags) #0 {
entry:
  %alias.addr = alloca %struct.alias*, align 4
  %flags.addr = alloca i32, align 4
  %value = alloca i8*, align 4
  store %struct.alias* %alias, %struct.alias** %alias.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load %struct.alias*, %struct.alias** %alias.addr, align 4
  %value1 = getelementptr inbounds %struct.alias, %struct.alias* %0, i32 0, i32 1
  %1 = load i8*, i8** %value1, align 4
  %call = call i8* @sh_single_quote(i8* %1)
  store i8* %call, i8** %value, align 4
  %2 = load i32, i32* %flags.addr, align 4
  %and = and i32 %2, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load %struct.alias*, %struct.alias** %alias.addr, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %3, i32 0, i32 0
  %4 = load i8*, i8** %name, align 4
  %tobool2 = icmp ne i8* %4, null
  br i1 %tobool2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then
  %5 = load %struct.alias*, %struct.alias** %alias.addr, align 4
  %name3 = getelementptr inbounds %struct.alias, %struct.alias* %5, i32 0, i32 0
  %6 = load i8*, i8** %name3, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %8 = phi i1 [ false, %if.then ], [ %cmp, %land.rhs ]
  %cond = select i1 %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.6, i32 0, i32 0)
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i8* %cond)
  br label %if.end

if.end:                                           ; preds = %land.end, %entry
  %9 = load %struct.alias*, %struct.alias** %alias.addr, align 4
  %name6 = getelementptr inbounds %struct.alias, %struct.alias* %9, i32 0, i32 0
  %10 = load i8*, i8** %name6, align 4
  %11 = load i8*, i8** %value, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.7, i32 0, i32 0), i8* %10, i8* %11)
  %12 = load i8*, i8** %value, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 239)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  %call8 = call i32 @fflush(%struct._IO_FILE* %13)
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @sh_chkwrite(i32) #1

declare i32 @legal_alias_name(i8*, i32) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @add_alias(i8*, i8*) #1

declare %struct.alias* @find_alias(i8*) #1

declare void @sh_notfound(i8*) #1

; Function Attrs: noinline nounwind
define i32 @unalias_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %alias = alloca %struct.alias*, align 4
  %opt = alloca i32, align 4
  %aflag = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %aflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 97, label %sw.bb
    i32 -99, label %sw.bb1
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %aflag, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %2, %struct.word_list** %list.addr, align 4
  %3 = load i32, i32* %aflag, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @delete_all_aliases()
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp2 = icmp eq %struct.word_list* %4, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %aflag, align 4
  br label %while.cond5

while.cond5:                                      ; preds = %if.end15, %if.end4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool6 = icmp ne %struct.word_list* %5, null
  br i1 %tobool6, label %while.body7, label %while.end16

while.body7:                                      ; preds = %while.cond5
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word8 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word8, align 4
  %call9 = call %struct.alias* @find_alias(i8* %8)
  store %struct.alias* %call9, %struct.alias** %alias, align 4
  %9 = load %struct.alias*, %struct.alias** %alias, align 4
  %tobool10 = icmp ne %struct.alias* %9, null
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %while.body7
  %10 = load %struct.alias*, %struct.alias** %alias, align 4
  %name = getelementptr inbounds %struct.alias, %struct.alias* %10, i32 0, i32 0
  %11 = load i8*, i8** %name, align 4
  %call12 = call i32 @remove_alias(i8* %11)
  br label %if.end15

if.else:                                          ; preds = %while.body7
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word14, align 4
  call void @sh_notfound(i8* %14)
  %15 = load i32, i32* %aflag, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %aflag, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  %16 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %16, i32 0, i32 0
  %17 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %17, %struct.word_list** %list.addr, align 4
  br label %while.cond5

while.end16:                                      ; preds = %while.cond5
  %18 = load i32, i32* %aflag, align 4
  %tobool17 = icmp ne i32 %18, 0
  %cond = select i1 %tobool17, i32 1, i32 0
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end16, %if.then3, %if.then, %sw.default, %sw.bb1
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

declare void @delete_all_aliases() #1

declare i32 @remove_alias(i8*) #1

declare i8* @sh_single_quote(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
