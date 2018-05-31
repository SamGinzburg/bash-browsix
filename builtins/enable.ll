; ModuleID = 'enable.c'
source_filename = "enable.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct._list_of_items = type { i32, i32 (%struct._list_of_items*)*, %struct._list_of_strings*, %struct._list_of_strings*, i32 }
%struct._list_of_strings = type { i8**, i32, i32 }
%struct.builtin = type { i8*, i32 (%struct.word_list*)*, i32, i8**, i8*, i8* }

@.str = private unnamed_addr constant [8 x i8] c"adnpsf:\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"dynamic loading not available\00", align 1
@loptend = external global %struct.word_list*, align 4
@restricted = external global i32, align 4
@it_builtins = external global %struct._list_of_items, align 4
@num_shell_builtins = external global i32, align 4
@shell_builtins = external global %struct.builtin*, align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"enable %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"enable -n %s\0A\00", align 1
@it_enabled = external global %struct._list_of_items, align 4
@it_disabled = external global %struct._list_of_items, align 4
@.str.4 = private unnamed_addr constant [27 x i8] c"%s: not dynamically loaded\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"./enable.def\00", align 1
@.str.6 = private unnamed_addr constant [16 x i8] c"_builtin_unload\00", align 1
@static_shell_builtins = external global [0 x %struct.builtin], align 4

; Function Attrs: noinline nounwind
define i32 @enable_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %result = alloca i32, align 4
  %flags = alloca i32, align 4
  %opt = alloca i32, align 4
  %filter = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %result, align 4
  store i32 0, i32* %flags, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 97, label %sw.bb
    i32 110, label %sw.bb1
    i32 112, label %sw.bb3
    i32 115, label %sw.bb5
    i32 102, label %sw.bb7
    i32 100, label %sw.bb9
    i32 -99, label %sw.bb11
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i32, i32* %flags, align 4
  %or = or i32 %2, 1
  store i32 %or, i32* %flags, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %3 = load i32, i32* %flags, align 4
  %or2 = or i32 %3, 8
  store i32 %or2, i32* %flags, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  %4 = load i32, i32* %flags, align 4
  %or4 = or i32 %4, 16
  store i32 %or4, i32* %flags, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  %5 = load i32, i32* %flags, align 4
  %or6 = or i32 %5, 32
  store i32 %or6, i32* %flags, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %call8 = call i8* @libintl_gettext(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call8)
  store i32 258, i32* %retval, align 4
  br label %return

sw.bb9:                                           ; preds = %while.body
  %6 = load i32, i32* %flags, align 4
  %or10 = or i32 %6, 2
  store i32 %or10, i32* %flags, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb9, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %7, %struct.word_list** %list.addr, align 4
  %8 = load i32, i32* @restricted, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.end
  %9 = load i32, i32* %flags, align 4
  %and = and i32 %9, 6
  %tobool12 = icmp ne i32 %and, 0
  br i1 %tobool12, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @sh_restricted(i8* null)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %while.end
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp13 = icmp eq %struct.word_list* %10, null
  br i1 %cmp13, label %if.then16, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %11 = load i32, i32* %flags, align 4
  %and14 = and i32 %11, 16
  %tobool15 = icmp ne i32 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.else

if.then16:                                        ; preds = %lor.lhs.false, %if.end
  %12 = load i32, i32* %flags, align 4
  %and17 = and i32 %12, 1
  %tobool18 = icmp ne i32 %and17, 0
  br i1 %tobool18, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then16
  br label %cond.end

cond.false:                                       ; preds = %if.then16
  %13 = load i32, i32* %flags, align 4
  %and19 = and i32 %13, 8
  %tobool20 = icmp ne i32 %and19, 0
  %cond = select i1 %tobool20, i32 2, i32 1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond21 = phi i32 [ 3, %cond.true ], [ %cond, %cond.false ]
  store i32 %cond21, i32* %filter, align 4
  %14 = load i32, i32* %flags, align 4
  %and22 = and i32 %14, 32
  %tobool23 = icmp ne i32 %and22, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %cond.end
  %15 = load i32, i32* %filter, align 4
  %or25 = or i32 %15, 4
  store i32 %or25, i32* %filter, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %cond.end
  %16 = load i32, i32* %filter, align 4
  call void @list_some_builtins(i32 %16)
  br label %if.end55

if.else:                                          ; preds = %lor.lhs.false
  %17 = load i32, i32* %flags, align 4
  %and27 = and i32 %17, 2
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.else39

if.then29:                                        ; preds = %if.else
  br label %while.cond30

while.cond30:                                     ; preds = %if.end37, %if.then29
  %18 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool31 = icmp ne %struct.word_list* %18, null
  br i1 %tobool31, label %while.body32, label %while.end38

while.body32:                                     ; preds = %while.cond30
  %19 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word33 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word33, align 4
  %call34 = call i32 @dyn_unload_builtin(i8* %21)
  store i32 %call34, i32* %opt, align 4
  %22 = load i32, i32* %opt, align 4
  %cmp35 = icmp eq i32 %22, 1
  br i1 %cmp35, label %if.then36, label %if.end37

if.then36:                                        ; preds = %while.body32
  store i32 1, i32* %result, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then36, %while.body32
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %23, i32 0, i32 0
  %24 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %24, %struct.word_list** %list.addr, align 4
  br label %while.cond30

while.end38:                                      ; preds = %while.cond30
  call void @set_itemlist_dirty(%struct._list_of_items* @it_builtins)
  br label %if.end54

if.else39:                                        ; preds = %if.else
  br label %while.cond40

while.cond40:                                     ; preds = %if.end51, %if.else39
  %25 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool41 = icmp ne %struct.word_list* %25, null
  br i1 %tobool41, label %while.body42, label %while.end53

while.body42:                                     ; preds = %while.cond40
  %26 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word43 = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 1
  %27 = load %struct.word_desc*, %struct.word_desc** %word43, align 4
  %word44 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %27, i32 0, i32 0
  %28 = load i8*, i8** %word44, align 4
  %29 = load i32, i32* %flags, align 4
  %and45 = and i32 %29, 8
  %call46 = call i32 @enable_shell_command(i8* %28, i32 %and45)
  store i32 %call46, i32* %opt, align 4
  %30 = load i32, i32* %opt, align 4
  %cmp47 = icmp eq i32 %30, 1
  br i1 %cmp47, label %if.then48, label %if.end51

if.then48:                                        ; preds = %while.body42
  %31 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word49 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word49, align 4
  %word50 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word50, align 4
  call void @sh_notbuiltin(i8* %33)
  store i32 1, i32* %result, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then48, %while.body42
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next52 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 0
  %35 = load %struct.word_list*, %struct.word_list** %next52, align 4
  store %struct.word_list* %35, %struct.word_list** %list.addr, align 4
  br label %while.cond40

while.end53:                                      ; preds = %while.cond40
  br label %if.end54

if.end54:                                         ; preds = %while.end53, %while.end38
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %if.end26
  %36 = load i32, i32* %result, align 4
  store i32 %36, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end55, %if.then, %sw.default, %sw.bb11, %sw.bb7
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @sh_restricted(i8*) #1

; Function Attrs: noinline nounwind
define internal void @list_some_builtins(i32 %filter) #0 {
entry:
  %filter.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %filter, i32* %filter.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* @num_shell_builtins, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %2, i32 %3
  %function = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 1
  %4 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %cmp1 = icmp eq i32 (%struct.word_list*)* %4, null
  br i1 %cmp1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds %struct.builtin, %struct.builtin* %5, i32 %6
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx2, i32 0, i32 2
  %7 = load i32, i32* %flags, align 4
  %and = and i32 %7, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.inc

if.end:                                           ; preds = %lor.lhs.false
  %8 = load i32, i32* %filter.addr, align 4
  %and3 = and i32 %8, 4
  %tobool4 = icmp ne i32 %and3, 0
  br i1 %tobool4, label %land.lhs.true, label %if.end10

land.lhs.true:                                    ; preds = %if.end
  %9 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds %struct.builtin, %struct.builtin* %9, i32 %10
  %flags6 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx5, i32 0, i32 2
  %11 = load i32, i32* %flags6, align 4
  %and7 = and i32 %11, 8
  %cmp8 = icmp eq i32 %and7, 0
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %land.lhs.true
  br label %for.inc

if.end10:                                         ; preds = %land.lhs.true, %if.end
  %12 = load i32, i32* %filter.addr, align 4
  %and11 = and i32 %12, 1
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %land.lhs.true13, label %if.else

land.lhs.true13:                                  ; preds = %if.end10
  %13 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds %struct.builtin, %struct.builtin* %13, i32 %14
  %flags15 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx14, i32 0, i32 2
  %15 = load i32, i32* %flags15, align 4
  %and16 = and i32 %15, 1
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.else

if.then18:                                        ; preds = %land.lhs.true13
  %16 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds %struct.builtin, %struct.builtin* %16, i32 %17
  %name = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx19, i32 0, i32 0
  %18 = load i8*, i8** %name, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i8* %18)
  br label %if.end32

if.else:                                          ; preds = %land.lhs.true13, %if.end10
  %19 = load i32, i32* %filter.addr, align 4
  %and20 = and i32 %19, 2
  %tobool21 = icmp ne i32 %and20, 0
  br i1 %tobool21, label %land.lhs.true22, label %if.end31

land.lhs.true22:                                  ; preds = %if.else
  %20 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx23 = getelementptr inbounds %struct.builtin, %struct.builtin* %20, i32 %21
  %flags24 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx23, i32 0, i32 2
  %22 = load i32, i32* %flags24, align 4
  %and25 = and i32 %22, 1
  %cmp26 = icmp eq i32 %and25, 0
  br i1 %cmp26, label %if.then27, label %if.end31

if.then27:                                        ; preds = %land.lhs.true22
  %23 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %24 = load i32, i32* %i, align 4
  %arrayidx28 = getelementptr inbounds %struct.builtin, %struct.builtin* %23, i32 %24
  %name29 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx28, i32 0, i32 0
  %25 = load i8*, i8** %name29, align 4
  %call30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i8* %25)
  br label %if.end31

if.end31:                                         ; preds = %if.then27, %land.lhs.true22, %if.else
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then18
  br label %for.inc

for.inc:                                          ; preds = %if.end32, %if.then9, %if.then
  %26 = load i32, i32* %i, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @dyn_unload_builtin(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %b = alloca %struct.builtin*, align 4
  %handle = alloca i8*, align 4
  %funcname = alloca i8*, align 4
  %unloadfunc = alloca void (i8*)*, align 4
  %ref = alloca i32, align 4
  %i = alloca i32, align 4
  %size = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 1)
  store %struct.builtin* %call, %struct.builtin** %b, align 4
  %1 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp = icmp eq %struct.builtin* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  call void @sh_notbuiltin(i8* %2)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %call2 = call i8* @libintl_gettext(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i32 0, i32 0))
  %5 = load i8*, i8** %name.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %call2, i8* %5)
  store i32 1, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load %struct.builtin*, %struct.builtin** %b, align 4
  %handle4 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 0, i32 5
  %7 = load i8*, i8** %handle4, align 4
  store i8* %7, i8** %handle, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %ref, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end3
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* @num_shell_builtins, align 4
  %cmp5 = icmp slt i32 %8, %9
  br i1 %cmp5, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %10, i32 %11
  %handle6 = getelementptr inbounds %struct.builtin, %struct.builtin* %arrayidx, i32 0, i32 5
  %12 = load i8*, i8** %handle6, align 4
  %13 = load %struct.builtin*, %struct.builtin** %b, align 4
  %handle7 = getelementptr inbounds %struct.builtin, %struct.builtin* %13, i32 0, i32 5
  %14 = load i8*, i8** %handle7, align 4
  %cmp8 = icmp eq i8* %12, %14
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.body
  %15 = load i32, i32* %ref, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %ref, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %16 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %16, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %17 = load i8*, i8** %name.addr, align 4
  %call12 = call i32 @strlen(i8* %17)
  store i32 %call12, i32* %size, align 4
  %18 = load i32, i32* %size, align 4
  %add = add i32 %18, 16
  %add13 = add i32 %add, 1
  %call14 = call i8* @sh_xmalloc(i32 %add13, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 520)
  store i8* %call14, i8** %funcname, align 4
  %19 = load i8*, i8** %funcname, align 4
  %20 = load i8*, i8** %name.addr, align 4
  %call15 = call i8* @strcpy(i8* %19, i8* %20)
  %21 = load i8*, i8** %funcname, align 4
  %22 = load i32, i32* %size, align 4
  %add.ptr = getelementptr inbounds i8, i8* %21, i32 %22
  %call16 = call i8* @strcpy(i8* %add.ptr, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.6, i32 0, i32 0))
  %23 = load i8*, i8** %funcname, align 4
  call void @sh_xfree(i8* %23, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 524)
  %24 = load i32, i32* %ref, align 4
  %cmp17 = icmp eq i32 %24, 1
  br i1 %cmp17, label %land.lhs.true, label %if.end21

land.lhs.true:                                    ; preds = %for.end
  %25 = load i8*, i8** %handle, align 4
  %call18 = call i32 @local_dlclose(i8* %25)
  %cmp19 = icmp ne i32 %call18, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %land.lhs.true, %for.end
  %26 = load %struct.builtin*, %struct.builtin** %b, align 4
  call void @delete_builtin(%struct.builtin* %26)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %if.then20, %if.then1, %if.then
  %27 = load i32, i32* %retval, align 4
  ret i32 %27
}

declare void @set_itemlist_dirty(%struct._list_of_items*) #1

; Function Attrs: noinline nounwind
define internal i32 @enable_shell_command(i8* %name, i32 %disable_p) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %disable_p.addr = alloca i32, align 4
  %b = alloca %struct.builtin*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %disable_p, i32* %disable_p.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.builtin* @builtin_address_internal(i8* %0, i32 1)
  store %struct.builtin* %call, %struct.builtin** %b, align 4
  %1 = load %struct.builtin*, %struct.builtin** %b, align 4
  %cmp = icmp eq %struct.builtin* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %disable_p.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then1, label %if.else

if.then1:                                         ; preds = %if.end
  %3 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags = getelementptr inbounds %struct.builtin, %struct.builtin* %3, i32 0, i32 2
  %4 = load i32, i32* %flags, align 4
  %and = and i32 %4, -2
  store i32 %and, i32* %flags, align 4
  br label %if.end10

if.else:                                          ; preds = %if.end
  %5 = load i32, i32* @restricted, align 4
  %tobool2 = icmp ne i32 %5, 0
  br i1 %tobool2, label %land.lhs.true, label %if.else7

land.lhs.true:                                    ; preds = %if.else
  %6 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags3 = getelementptr inbounds %struct.builtin, %struct.builtin* %6, i32 0, i32 2
  %7 = load i32, i32* %flags3, align 4
  %and4 = and i32 %7, 1
  %cmp5 = icmp eq i32 %and4, 0
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %land.lhs.true
  call void @sh_restricted(i8* null)
  store i32 1, i32* %retval, align 4
  br label %return

if.else7:                                         ; preds = %land.lhs.true, %if.else
  %8 = load %struct.builtin*, %struct.builtin** %b, align 4
  %flags8 = getelementptr inbounds %struct.builtin, %struct.builtin* %8, i32 0, i32 2
  %9 = load i32, i32* %flags8, align 4
  %or = or i32 %9, 1
  store i32 %or, i32* %flags8, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.else7
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.then1
  call void @set_itemlist_dirty(%struct._list_of_items* @it_enabled)
  call void @set_itemlist_dirty(%struct._list_of_items* @it_disabled)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then6, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare void @sh_notbuiltin(i8*) #1

declare i32 @printf(i8*, ...) #1

declare %struct.builtin* @builtin_address_internal(i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @local_dlclose(i8* %handle) #0 {
entry:
  %handle.addr = alloca i8*, align 4
  store i8* %handle, i8** %handle.addr, align 4
  ret i32 -1
}

; Function Attrs: noinline nounwind
define internal void @delete_builtin(%struct.builtin* %b) #0 {
entry:
  %b.addr = alloca %struct.builtin*, align 4
  %ind = alloca i32, align 4
  %size = alloca i32, align 4
  %new_shell_builtins = alloca %struct.builtin*, align 4
  store %struct.builtin* %b, %struct.builtin** %b.addr, align 4
  %0 = load %struct.builtin*, %struct.builtin** %b.addr, align 4
  %1 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %sub.ptr.lhs.cast = ptrtoint %struct.builtin* %0 to i32
  %sub.ptr.rhs.cast = ptrtoint %struct.builtin* %1 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 24
  store i32 %sub.ptr.div, i32* %ind, align 4
  %2 = load i32, i32* @num_shell_builtins, align 4
  %mul = mul i32 %2, 24
  store i32 %mul, i32* %size, align 4
  %3 = load i32, i32* %size, align 4
  %call = call i8* @sh_xmalloc(i32 %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 460)
  %4 = bitcast i8* %call to %struct.builtin*
  store %struct.builtin* %4, %struct.builtin** %new_shell_builtins, align 4
  %5 = load i32, i32* %ind, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load %struct.builtin*, %struct.builtin** %new_shell_builtins, align 4
  %7 = bitcast %struct.builtin* %6 to i8*
  %8 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %9 = bitcast %struct.builtin* %8 to i8*
  %10 = load i32, i32* %ind, align 4
  %mul1 = mul i32 %10, 24
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %7, i8* %9, i32 %mul1, i32 1, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %11 = load %struct.builtin*, %struct.builtin** %new_shell_builtins, align 4
  %12 = load i32, i32* %ind, align 4
  %arrayidx = getelementptr inbounds %struct.builtin, %struct.builtin* %11, i32 %12
  %13 = bitcast %struct.builtin* %arrayidx to i8*
  %14 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %15 = load i32, i32* %ind, align 4
  %add = add nsw i32 %15, 1
  %arrayidx2 = getelementptr inbounds %struct.builtin, %struct.builtin* %14, i32 %add
  %16 = bitcast %struct.builtin* %arrayidx2 to i8*
  %17 = load i32, i32* @num_shell_builtins, align 4
  %18 = load i32, i32* %ind, align 4
  %sub = sub nsw i32 %17, %18
  %mul3 = mul i32 %sub, 24
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %16, i32 %mul3, i32 1, i1 false)
  %19 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %cmp = icmp ne %struct.builtin* %19, getelementptr inbounds ([0 x %struct.builtin], [0 x %struct.builtin]* @static_shell_builtins, i32 0, i32 0)
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %20 = load %struct.builtin*, %struct.builtin** @shell_builtins, align 4
  %21 = bitcast %struct.builtin* %20 to i8*
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i32 473)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %22 = load i32, i32* @num_shell_builtins, align 4
  %dec = add nsw i32 %22, -1
  store i32 %dec, i32* @num_shell_builtins, align 4
  %23 = load %struct.builtin*, %struct.builtin** %new_shell_builtins, align 4
  store %struct.builtin* %23, %struct.builtin** @shell_builtins, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
