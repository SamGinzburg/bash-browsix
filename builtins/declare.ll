; ModuleID = 'declare.c'
source_filename = "declare.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.var_context = type { i8*, i32, i32, %struct.var_context*, %struct.var_context*, %struct.hash_table* }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }

@variable_context = external global i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"can only be used in a function\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"+acfgilnprtuxAF\00", align 1
@list_opttype = external global i32, align 4
@array_needs_making = external global i32, align 4
@loptend = external global %struct.word_list*, align 4
@.str.2 = private unnamed_addr constant [14 x i8] c"./declare.def\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"%s: reference variable cannot be an array\00", align 1
@.str.6 = private unnamed_addr constant [49 x i8] c"%s: nameref variable self references not allowed\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"%s: circular name reference\00", align 1
@.str.8 = private unnamed_addr constant [47 x i8] c"`%s': invalid variable name for name reference\00", align 1
@posixly_correct = external global i32, align 4
@.str.9 = private unnamed_addr constant [34 x i8] c"cannot use `-f' to make functions\00", align 1
@.str.10 = private unnamed_addr constant [22 x i8] c"%s: readonly function\00", align 1
@debugging_mode = external global i32, align 4
@.str.11 = private unnamed_addr constant [10 x i8] c"%s %d %s\0A\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.13 = private unnamed_addr constant [31 x i8] c"%s: removing nameref attribute\00", align 1
@no_invisible_vars = external global i32, align 4
@shell_compatibility_level = external global i32, align 4
@.str.14 = private unnamed_addr constant [48 x i8] c"%s: quoted compound array assignment deprecated\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"%s: cannot destroy array variables in this way\00", align 1
@.str.16 = private unnamed_addr constant [48 x i8] c"%s: cannot convert associative to indexed array\00", align 1
@.str.17 = private unnamed_addr constant [48 x i8] c"%s: cannot convert indexed to associative array\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@global_variables = external global %struct.var_context*, align 4
@shell_variables = external global %struct.var_context*, align 4

; Function Attrs: noinline nounwind
define i32 @declare_builtin(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @declare_internal(%struct.word_list* %0, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @declare_internal(%struct.word_list* %list, i32 %local_var) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %local_var.addr = alloca i32, align 4
  %flags_on = alloca i32, align 4
  %flags_off = alloca i32, align 4
  %flags = alloca i32*, align 4
  %any_failed = alloca i32, align 4
  %assign_error = alloca i32, align 4
  %pflag = alloca i32, align 4
  %nodefs = alloca i32, align 4
  %opt = alloca i32, align 4
  %mkglobal = alloca i32, align 4
  %onref = alloca i32, align 4
  %offref = alloca i32, align 4
  %t = alloca i8*, align 4
  %subscript_start = alloca i8*, align 4
  %var = alloca %struct.variable*, align 4
  %refvar = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  %shell_fn = alloca %struct.function_def*, align 4
  %vlist = alloca %struct.variable**, align 4
  %i = alloca i32, align 4
  %value = alloca i8*, align 4
  %name = alloca i8*, align 4
  %oldname = alloca i8*, align 4
  %offset = alloca i32, align 4
  %aflags = alloca i32, align 4
  %wflags = alloca i32, align 4
  %created_var = alloca i32, align 4
  %namelen = alloca i32, align 4
  %making_array_special = alloca i32, align 4
  %compound_array_assign = alloca i32, align 4
  %simple_array_assign = alloca i32, align 4
  %var_exists = alloca i32, align 4
  %array_exists = alloca i32, align 4
  %creating_array = alloca i32, align 4
  %array_subscript_assignment = alloca i32, align 4
  %vlen = alloca i32, align 4
  %tv = alloca %struct.variable*, align 4
  %tvalue = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %local_var, i32* %local_var.addr, align 4
  store i32 0, i32* %mkglobal, align 4
  store i32 0, i32* %nodefs, align 4
  store i32 0, i32* %pflag, align 4
  store i32 0, i32* %assign_error, align 4
  store i32 0, i32* %any_failed, align 4
  store i32 0, i32* %flags_off, align 4
  store i32 0, i32* %flags_on, align 4
  store %struct.variable* null, %struct.variable** %refvar, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* @list_opttype, align 4
  %cmp1 = icmp eq i32 %1, 43
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  br label %cond.end

cond.false:                                       ; preds = %while.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32* [ %flags_off, %cond.true ], [ %flags_on, %cond.false ]
  store i32* %cond, i32** %flags, align 4
  %2 = load i32, i32* %opt, align 4
  switch i32 %2, label %sw.default [
    i32 97, label %sw.bb
    i32 65, label %sw.bb2
    i32 112, label %sw.bb4
    i32 70, label %sw.bb6
    i32 102, label %sw.bb9
    i32 103, label %sw.bb11
    i32 105, label %sw.bb15
    i32 110, label %sw.bb17
    i32 114, label %sw.bb19
    i32 116, label %sw.bb21
    i32 120, label %sw.bb23
    i32 99, label %sw.bb25
    i32 108, label %sw.bb31
    i32 117, label %sw.bb37
    i32 -99, label %sw.bb43
  ]

sw.bb:                                            ; preds = %cond.end
  %3 = load i32*, i32** %flags, align 4
  %4 = load i32, i32* %3, align 4
  %or = or i32 %4, 4
  store i32 %or, i32* %3, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %cond.end
  %5 = load i32*, i32** %flags, align 4
  %6 = load i32, i32* %5, align 4
  %or3 = or i32 %6, 64
  store i32 %or3, i32* %5, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %cond.end
  %7 = load i32, i32* %local_var.addr, align 4
  %cmp5 = icmp eq i32 %7, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb4
  %8 = load i32, i32* %pflag, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %pflag, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb4
  br label %sw.epilog

sw.bb6:                                           ; preds = %cond.end
  %9 = load i32, i32* %nodefs, align 4
  %inc7 = add nsw i32 %9, 1
  store i32 %inc7, i32* %nodefs, align 4
  %10 = load i32*, i32** %flags, align 4
  %11 = load i32, i32* %10, align 4
  %or8 = or i32 %11, 8
  store i32 %or8, i32* %10, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %cond.end
  %12 = load i32*, i32** %flags, align 4
  %13 = load i32, i32* %12, align 4
  %or10 = or i32 %13, 8
  store i32 %or10, i32* %12, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %cond.end
  %14 = load i32*, i32** %flags, align 4
  %cmp12 = icmp eq i32* %14, %flags_on
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %sw.bb11
  store i32 1, i32* %mkglobal, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %sw.bb11
  br label %sw.epilog

sw.bb15:                                          ; preds = %cond.end
  %15 = load i32*, i32** %flags, align 4
  %16 = load i32, i32* %15, align 4
  %or16 = or i32 %16, 16
  store i32 %or16, i32* %15, align 4
  br label %sw.epilog

sw.bb17:                                          ; preds = %cond.end
  %17 = load i32*, i32** %flags, align 4
  %18 = load i32, i32* %17, align 4
  %or18 = or i32 %18, 2048
  store i32 %or18, i32* %17, align 4
  br label %sw.epilog

sw.bb19:                                          ; preds = %cond.end
  %19 = load i32*, i32** %flags, align 4
  %20 = load i32, i32* %19, align 4
  %or20 = or i32 %20, 2
  store i32 %or20, i32* %19, align 4
  br label %sw.epilog

sw.bb21:                                          ; preds = %cond.end
  %21 = load i32*, i32** %flags, align 4
  %22 = load i32, i32* %21, align 4
  %or22 = or i32 %22, 128
  store i32 %or22, i32* %21, align 4
  br label %sw.epilog

sw.bb23:                                          ; preds = %cond.end
  %23 = load i32*, i32** %flags, align 4
  %24 = load i32, i32* %23, align 4
  %or24 = or i32 %24, 1
  store i32 %or24, i32* %23, align 4
  store i32 1, i32* @array_needs_making, align 4
  br label %sw.epilog

sw.bb25:                                          ; preds = %cond.end
  %25 = load i32*, i32** %flags, align 4
  %26 = load i32, i32* %25, align 4
  %or26 = or i32 %26, 1024
  store i32 %or26, i32* %25, align 4
  %27 = load i32*, i32** %flags, align 4
  %cmp27 = icmp eq i32* %27, %flags_on
  br i1 %cmp27, label %if.then28, label %if.end30

if.then28:                                        ; preds = %sw.bb25
  %28 = load i32, i32* %flags_off, align 4
  %or29 = or i32 %28, 768
  store i32 %or29, i32* %flags_off, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %sw.bb25
  br label %sw.epilog

sw.bb31:                                          ; preds = %cond.end
  %29 = load i32*, i32** %flags, align 4
  %30 = load i32, i32* %29, align 4
  %or32 = or i32 %30, 512
  store i32 %or32, i32* %29, align 4
  %31 = load i32*, i32** %flags, align 4
  %cmp33 = icmp eq i32* %31, %flags_on
  br i1 %cmp33, label %if.then34, label %if.end36

if.then34:                                        ; preds = %sw.bb31
  %32 = load i32, i32* %flags_off, align 4
  %or35 = or i32 %32, 1280
  store i32 %or35, i32* %flags_off, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %sw.bb31
  br label %sw.epilog

sw.bb37:                                          ; preds = %cond.end
  %33 = load i32*, i32** %flags, align 4
  %34 = load i32, i32* %33, align 4
  %or38 = or i32 %34, 256
  store i32 %or38, i32* %33, align 4
  %35 = load i32*, i32** %flags, align 4
  %cmp39 = icmp eq i32* %35, %flags_on
  br i1 %cmp39, label %if.then40, label %if.end42

if.then40:                                        ; preds = %sw.bb37
  %36 = load i32, i32* %flags_off, align 4
  %or41 = or i32 %36, 1536
  store i32 %or41, i32* %flags_off, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %sw.bb37
  br label %sw.epilog

sw.bb43:                                          ; preds = %cond.end
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %cond.end
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end42, %if.end36, %if.end30, %sw.bb23, %sw.bb21, %sw.bb19, %sw.bb17, %sw.bb15, %if.end14, %sw.bb9, %sw.bb6, %if.end, %sw.bb2, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %37 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %37, %struct.word_list** %list.addr, align 4
  %38 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp44 = icmp eq %struct.word_list* %38, null
  br i1 %cmp44, label %if.then45, label %if.end71

if.then45:                                        ; preds = %while.end
  %39 = load i32, i32* %local_var.addr, align 4
  %tobool = icmp ne i32 %39, 0
  br i1 %tobool, label %if.then46, label %if.else

if.then46:                                        ; preds = %if.then45
  %call47 = call %struct.variable** @all_local_variables()
  store %struct.variable** %call47, %struct.variable*** %vlist, align 4
  %40 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %tobool48 = icmp ne %struct.variable** %40, null
  br i1 %tobool48, label %if.then49, label %if.end53

if.then49:                                        ; preds = %if.then46
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then49
  %41 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %42 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %41, i32 %42
  %43 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  %tobool50 = icmp ne %struct.variable* %43, null
  br i1 %tobool50, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %44 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %45 = load i32, i32* %i, align 4
  %arrayidx51 = getelementptr inbounds %struct.variable*, %struct.variable** %44, i32 %45
  %46 = load %struct.variable*, %struct.variable** %arrayidx51, align 4
  call void @print_assignment(%struct.variable* %46)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %47 = load i32, i32* %i, align 4
  %inc52 = add nsw i32 %47, 1
  store i32 %inc52, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %48 = load %struct.variable**, %struct.variable*** %vlist, align 4
  %49 = bitcast %struct.variable** %48 to i8*
  call void @sh_xfree(i8* %49, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 254)
  br label %if.end53

if.end53:                                         ; preds = %for.end, %if.then46
  br label %if.end69

if.else:                                          ; preds = %if.then45
  %50 = load i32, i32* %pflag, align 4
  %tobool54 = icmp ne i32 %50, 0
  br i1 %tobool54, label %land.lhs.true, label %if.else60

land.lhs.true:                                    ; preds = %if.else
  %51 = load i32, i32* %flags_on, align 4
  %cmp55 = icmp eq i32 %51, 0
  br i1 %cmp55, label %if.then57, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %52 = load i32, i32* %flags_on, align 4
  %cmp56 = icmp eq i32 %52, 8
  br i1 %cmp56, label %if.then57, label %if.else60

if.then57:                                        ; preds = %lor.lhs.false, %land.lhs.true
  %53 = load i32, i32* %flags_on, align 4
  %cmp58 = icmp eq i32 %53, 0
  %conv = zext i1 %cmp58 to i32
  %54 = load i32, i32* %nodefs, align 4
  %call59 = call i32 @show_all_var_attributes(i32 %conv, i32 %54)
  br label %if.end68

if.else60:                                        ; preds = %lor.lhs.false, %if.else
  %55 = load i32, i32* %flags_on, align 4
  %cmp61 = icmp eq i32 %55, 0
  br i1 %cmp61, label %if.then63, label %if.else65

if.then63:                                        ; preds = %if.else60
  %call64 = call i32 @set_builtin(%struct.word_list* null)
  store i32 %call64, i32* %retval, align 4
  br label %return

if.else65:                                        ; preds = %if.else60
  %56 = load i32, i32* %flags_on, align 4
  %57 = load i32, i32* %nodefs, align 4
  %call66 = call i32 @set_or_show_attributes(%struct.word_list* null, i32 %56, i32 %57)
  br label %if.end67

if.end67:                                         ; preds = %if.else65
  br label %if.end68

if.end68:                                         ; preds = %if.end67, %if.then57
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.end53
  %call70 = call i32 @sh_chkwrite(i32 0)
  store i32 %call70, i32* %retval, align 4
  br label %return

if.end71:                                         ; preds = %while.end
  %58 = load i32, i32* %pflag, align 4
  %tobool72 = icmp ne i32 %58, 0
  br i1 %tobool72, label %if.then73, label %if.end97

if.then73:                                        ; preds = %if.end71
  store i32 0, i32* %any_failed, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc92, %if.then73
  %59 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool75 = icmp ne %struct.word_list* %59, null
  br i1 %tobool75, label %for.body76, label %for.end93

for.body76:                                       ; preds = %for.cond74
  %60 = load i32, i32* %flags_on, align 4
  %and = and i32 %60, 8
  %tobool77 = icmp ne i32 %and, 0
  br i1 %tobool77, label %if.then78, label %if.else81

if.then78:                                        ; preds = %for.body76
  %61 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %61, i32 0, i32 1
  %62 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word79 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %62, i32 0, i32 0
  %63 = load i8*, i8** %word79, align 4
  %64 = load i32, i32* %nodefs, align 4
  %call80 = call i32 @show_func_attributes(i8* %63, i32 %64)
  store i32 %call80, i32* %pflag, align 4
  br label %if.end85

if.else81:                                        ; preds = %for.body76
  %65 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word82 = getelementptr inbounds %struct.word_list, %struct.word_list* %65, i32 0, i32 1
  %66 = load %struct.word_desc*, %struct.word_desc** %word82, align 4
  %word83 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %66, i32 0, i32 0
  %67 = load i8*, i8** %word83, align 4
  %68 = load i32, i32* %nodefs, align 4
  %call84 = call i32 @show_name_attributes(i8* %67, i32 %68)
  store i32 %call84, i32* %pflag, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.else81, %if.then78
  %69 = load i32, i32* %pflag, align 4
  %tobool86 = icmp ne i32 %69, 0
  br i1 %tobool86, label %if.then87, label %if.end91

if.then87:                                        ; preds = %if.end85
  %70 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word88 = getelementptr inbounds %struct.word_list, %struct.word_list* %70, i32 0, i32 1
  %71 = load %struct.word_desc*, %struct.word_desc** %word88, align 4
  %word89 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %71, i32 0, i32 0
  %72 = load i8*, i8** %word89, align 4
  call void @sh_notfound(i8* %72)
  %73 = load i32, i32* %any_failed, align 4
  %inc90 = add nsw i32 %73, 1
  store i32 %inc90, i32* %any_failed, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.then87, %if.end85
  br label %for.inc92

for.inc92:                                        ; preds = %if.end91
  %74 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %74, i32 0, i32 0
  %75 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %75, %struct.word_list** %list.addr, align 4
  br label %for.cond74

for.end93:                                        ; preds = %for.cond74
  %76 = load i32, i32* %any_failed, align 4
  %tobool94 = icmp ne i32 %76, 0
  %cond95 = select i1 %tobool94, i32 1, i32 0
  %call96 = call i32 @sh_chkwrite(i32 %cond95)
  store i32 %call96, i32* %retval, align 4
  br label %return

if.end97:                                         ; preds = %if.end71
  br label %while.cond98

while.cond98:                                     ; preds = %if.end1088, %if.end1018, %if.then961, %if.then888, %if.then877, %if.then866, %if.end754, %if.then735, %if.then719, %if.then710, %if.then686, %if.then664, %if.then650, %if.then561, %if.then424, %if.end370, %if.then325, %if.then303, %if.then284, %if.then219, %if.then202, %if.then187, %if.then166, %if.then156, %do.end, %if.end97
  %77 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool99 = icmp ne %struct.word_list* %77, null
  br i1 %tobool99, label %while.body100, label %while.end1090

while.body100:                                    ; preds = %while.cond98
  %78 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word101 = getelementptr inbounds %struct.word_list, %struct.word_list* %78, i32 0, i32 1
  %79 = load %struct.word_desc*, %struct.word_desc** %word101, align 4
  %word102 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %79, i32 0, i32 0
  %80 = load i8*, i8** %word102, align 4
  %call103 = call i32 @strlen(i8* %80)
  %add = add i32 1, %call103
  %call104 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 296)
  %81 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word105 = getelementptr inbounds %struct.word_list, %struct.word_list* %81, i32 0, i32 1
  %82 = load %struct.word_desc*, %struct.word_desc** %word105, align 4
  %word106 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %82, i32 0, i32 0
  %83 = load i8*, i8** %word106, align 4
  %call107 = call i8* @strcpy(i8* %call104, i8* %83)
  store i8* %call107, i8** %name, align 4
  %84 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word108 = getelementptr inbounds %struct.word_list, %struct.word_list* %84, i32 0, i32 1
  %85 = load %struct.word_desc*, %struct.word_desc** %word108, align 4
  %flags109 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %85, i32 0, i32 1
  %86 = load i32, i32* %flags109, align 4
  store i32 %86, i32* %wflags, align 4
  %87 = load i8*, i8** %name, align 4
  %call110 = call i32 @assignment(i8* %87, i32 0)
  store i32 %call110, i32* %offset, align 4
  store i32 0, i32* %aflags, align 4
  store i32 0, i32* %created_var, align 4
  %88 = load i32, i32* %local_var.addr, align 4
  %tobool111 = icmp ne i32 %88, 0
  br i1 %tobool111, label %land.lhs.true112, label %if.end135

land.lhs.true112:                                 ; preds = %while.body100
  %89 = load i32, i32* @variable_context, align 4
  %tobool113 = icmp ne i32 %89, 0
  br i1 %tobool113, label %land.lhs.true114, label %if.end135

land.lhs.true114:                                 ; preds = %land.lhs.true112
  %90 = load i8*, i8** %name, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %90, i32 0
  %91 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %91 to i32
  %92 = load i8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), align 1
  %conv117 = sext i8 %92 to i32
  %cmp118 = icmp eq i32 %conv116, %conv117
  br i1 %cmp118, label %land.lhs.true120, label %if.end135

land.lhs.true120:                                 ; preds = %land.lhs.true114
  %93 = load i8*, i8** %name, align 4
  %call121 = call i32 @strcmp(i8* %93, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %cmp122 = icmp eq i32 %call121, 0
  br i1 %cmp122, label %if.then124, label %if.end135

if.then124:                                       ; preds = %land.lhs.true120
  %call125 = call %struct.variable* @make_local_variable(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct.variable* %call125, %struct.variable** %var, align 4
  br label %do.body

do.body:                                          ; preds = %if.then124
  %94 = load %struct.variable*, %struct.variable** %var, align 4
  %value126 = getelementptr inbounds %struct.variable, %struct.variable* %94, i32 0, i32 1
  %95 = load i8*, i8** %value126, align 4
  %tobool127 = icmp ne i8* %95, null
  br i1 %tobool127, label %if.then128, label %if.end130

if.then128:                                       ; preds = %do.body
  %96 = load %struct.variable*, %struct.variable** %var, align 4
  %value129 = getelementptr inbounds %struct.variable, %struct.variable* %96, i32 0, i32 1
  %97 = load i8*, i8** %value129, align 4
  call void @sh_xfree(i8* %97, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 305)
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end130
  %call131 = call i8* @get_current_options()
  store i8* %call131, i8** %value, align 4
  %98 = load i8*, i8** %value, align 4
  %99 = load %struct.variable*, %struct.variable** %var, align 4
  %value132 = getelementptr inbounds %struct.variable, %struct.variable* %99, i32 0, i32 1
  store i8* %98, i8** %value132, align 4
  %100 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %100, i32 0, i32 5
  %101 = load i32, i32* %attributes, align 4
  %or133 = or i32 %101, 4096
  store i32 %or133, i32* %attributes, align 4
  %102 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %102, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 309)
  %103 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next134 = getelementptr inbounds %struct.word_list, %struct.word_list* %103, i32 0, i32 0
  %104 = load %struct.word_list*, %struct.word_list** %next134, align 4
  store %struct.word_list* %104, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end135:                                        ; preds = %land.lhs.true120, %land.lhs.true114, %land.lhs.true112, %while.body100
  %105 = load i32, i32* %offset, align 4
  %tobool136 = icmp ne i32 %105, 0
  br i1 %tobool136, label %if.then137, label %if.else149

if.then137:                                       ; preds = %if.end135
  %106 = load i8*, i8** %name, align 4
  %107 = load i32, i32* %offset, align 4
  %arrayidx138 = getelementptr inbounds i8, i8* %106, i32 %107
  store i8 0, i8* %arrayidx138, align 1
  %108 = load i8*, i8** %name, align 4
  %109 = load i32, i32* %offset, align 4
  %add.ptr = getelementptr inbounds i8, i8* %108, i32 %109
  %add.ptr139 = getelementptr inbounds i8, i8* %add.ptr, i32 1
  store i8* %add.ptr139, i8** %value, align 4
  %110 = load i8*, i8** %name, align 4
  %111 = load i32, i32* %offset, align 4
  %sub = sub nsw i32 %111, 1
  %arrayidx140 = getelementptr inbounds i8, i8* %110, i32 %sub
  %112 = load i8, i8* %arrayidx140, align 1
  %conv141 = sext i8 %112 to i32
  %cmp142 = icmp eq i32 %conv141, 43
  br i1 %cmp142, label %if.then144, label %if.end148

if.then144:                                       ; preds = %if.then137
  %113 = load i32, i32* %aflags, align 4
  %or145 = or i32 %113, 1
  store i32 %or145, i32* %aflags, align 4
  %114 = load i8*, i8** %name, align 4
  %115 = load i32, i32* %offset, align 4
  %sub146 = sub nsw i32 %115, 1
  %arrayidx147 = getelementptr inbounds i8, i8* %114, i32 %sub146
  store i8 0, i8* %arrayidx147, align 1
  br label %if.end148

if.end148:                                        ; preds = %if.then144, %if.then137
  br label %if.end150

if.else149:                                       ; preds = %if.end135
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0), i8** %value, align 4
  br label %if.end150

if.end150:                                        ; preds = %if.else149, %if.end148
  %116 = load i32, i32* %flags_on, align 4
  %and151 = and i32 %116, 2048
  %tobool152 = icmp ne i32 %and151, 0
  br i1 %tobool152, label %if.then153, label %if.end192

if.then153:                                       ; preds = %if.end150
  %117 = load i8*, i8** %name, align 4
  %call154 = call i32 @valid_array_reference(i8* %117, i32 0)
  %tobool155 = icmp ne i32 %call154, 0
  br i1 %tobool155, label %if.then156, label %if.else160

if.then156:                                       ; preds = %if.then153
  %call157 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i32 0, i32 0))
  %118 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call157, i8* %118)
  %119 = load i32, i32* %assign_error, align 4
  %inc158 = add nsw i32 %119, 1
  store i32 %inc158, i32* %assign_error, align 4
  %120 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %120, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 334)
  %121 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next159 = getelementptr inbounds %struct.word_list, %struct.word_list* %121, i32 0, i32 0
  %122 = load %struct.word_list*, %struct.word_list** %next159, align 4
  store %struct.word_list* %122, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.else160:                                       ; preds = %if.then153
  %123 = load i8*, i8** %name, align 4
  %124 = load i8*, i8** %value, align 4
  %call161 = call i32 @check_selfref(i8* %123, i8* %124, i32 0)
  %tobool162 = icmp ne i32 %call161, 0
  br i1 %tobool162, label %if.then163, label %if.end173

if.then163:                                       ; preds = %if.else160
  %125 = load i32, i32* @variable_context, align 4
  %cmp164 = icmp eq i32 %125, 0
  br i1 %cmp164, label %if.then166, label %if.else170

if.then166:                                       ; preds = %if.then163
  %call167 = call i8* @libintl_gettext(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.6, i32 0, i32 0))
  %126 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call167, i8* %126)
  %127 = load i32, i32* %assign_error, align 4
  %inc168 = add nsw i32 %127, 1
  store i32 %inc168, i32* %assign_error, align 4
  %128 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %128, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 345)
  %129 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next169 = getelementptr inbounds %struct.word_list, %struct.word_list* %129, i32 0, i32 0
  %130 = load %struct.word_list*, %struct.word_list** %next169, align 4
  store %struct.word_list* %130, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.else170:                                       ; preds = %if.then163
  %call171 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.7, i32 0, i32 0))
  %131 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_warning(i8* %call171, i8* %131)
  br label %if.end172

if.end172:                                        ; preds = %if.else170
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %if.else160
  br label %if.end174

if.end174:                                        ; preds = %if.end173
  %132 = load i8*, i8** %value, align 4
  %tobool175 = icmp ne i8* %132, null
  br i1 %tobool175, label %land.lhs.true176, label %if.end191

land.lhs.true176:                                 ; preds = %if.end174
  %133 = load i8*, i8** %value, align 4
  %134 = load i8, i8* %133, align 1
  %conv177 = sext i8 %134 to i32
  %tobool178 = icmp ne i32 %conv177, 0
  br i1 %tobool178, label %land.lhs.true179, label %if.end191

land.lhs.true179:                                 ; preds = %land.lhs.true176
  %135 = load i32, i32* %aflags, align 4
  %and180 = and i32 %135, 1
  %cmp181 = icmp eq i32 %and180, 0
  br i1 %cmp181, label %land.lhs.true183, label %if.end191

land.lhs.true183:                                 ; preds = %land.lhs.true179
  %136 = load i8*, i8** %value, align 4
  %call184 = call i32 @valid_nameref_value(i8* %136, i32 1)
  %cmp185 = icmp eq i32 %call184, 0
  br i1 %cmp185, label %if.then187, label %if.end191

if.then187:                                       ; preds = %land.lhs.true183
  %call188 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.8, i32 0, i32 0))
  %137 = load i8*, i8** %value, align 4
  call void (i8*, ...) @builtin_error(i8* %call188, i8* %137)
  %138 = load i32, i32* %assign_error, align 4
  %inc189 = add nsw i32 %138, 1
  store i32 %inc189, i32* %assign_error, align 4
  %139 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %139, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 355)
  %140 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next190 = getelementptr inbounds %struct.word_list, %struct.word_list* %140, i32 0, i32 0
  %141 = load %struct.word_list*, %struct.word_list** %next190, align 4
  store %struct.word_list* %141, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end191:                                        ; preds = %land.lhs.true183, %land.lhs.true179, %land.lhs.true176, %if.end174
  br label %if.end192

if.end192:                                        ; preds = %if.end191, %if.end150
  br label %restart_new_var_name

restart_new_var_name:                             ; preds = %if.end567, %if.end192
  store i32 0, i32* %creating_array, align 4
  store i32 0, i32* %array_exists, align 4
  store i32 0, i32* %var_exists, align 4
  store i32 0, i32* %simple_array_assign, align 4
  store i32 0, i32* %compound_array_assign, align 4
  store i32 0, i32* %array_subscript_assignment, align 4
  store i8* null, i8** %subscript_start, align 4
  %142 = load i8*, i8** %name, align 4
  %call193 = call i8* @strchr(i8* %142, i32 91)
  store i8* %call193, i8** %t, align 4
  %tobool194 = icmp ne i8* %call193, null
  br i1 %tobool194, label %if.then195, label %if.else208

if.then195:                                       ; preds = %restart_new_var_name
  %143 = load i32, i32* %offset, align 4
  %cmp196 = icmp eq i32 %143, 0
  br i1 %cmp196, label %land.lhs.true198, label %if.end205

land.lhs.true198:                                 ; preds = %if.then195
  %144 = load i8*, i8** %name, align 4
  %call199 = call i32 @valid_array_reference(i8* %144, i32 0)
  %cmp200 = icmp eq i32 %call199, 0
  br i1 %cmp200, label %if.then202, label %if.end205

if.then202:                                       ; preds = %land.lhs.true198
  %145 = load i8*, i8** %name, align 4
  call void @sh_invalidid(i8* %145)
  %146 = load i32, i32* %assign_error, align 4
  %inc203 = add nsw i32 %146, 1
  store i32 %inc203, i32* %assign_error, align 4
  %147 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %147, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 374)
  %148 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next204 = getelementptr inbounds %struct.word_list, %struct.word_list* %148, i32 0, i32 0
  %149 = load %struct.word_list*, %struct.word_list** %next204, align 4
  store %struct.word_list* %149, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end205:                                        ; preds = %land.lhs.true198, %if.then195
  %150 = load i8*, i8** %t, align 4
  store i8* %150, i8** %subscript_start, align 4
  %151 = load i8*, i8** %t, align 4
  store i8 0, i8* %151, align 1
  store i32 1, i32* %making_array_special, align 4
  %152 = load i32, i32* %offset, align 4
  %cmp206 = icmp ne i32 %152, 0
  %conv207 = zext i1 %cmp206 to i32
  store i32 %conv207, i32* %array_subscript_assignment, align 4
  br label %if.end209

if.else208:                                       ; preds = %restart_new_var_name
  store i32 0, i32* %making_array_special, align 4
  br label %if.end209

if.end209:                                        ; preds = %if.else208, %if.end205
  %153 = load i32, i32* @posixly_correct, align 4
  %tobool210 = icmp ne i32 %153, 0
  br i1 %tobool210, label %land.lhs.true215, label %lor.lhs.false211

lor.lhs.false211:                                 ; preds = %if.end209
  %154 = load i32, i32* %flags_on, align 4
  %and212 = and i32 %154, 8
  %cmp213 = icmp eq i32 %and212, 0
  br i1 %cmp213, label %land.lhs.true215, label %if.end222

land.lhs.true215:                                 ; preds = %lor.lhs.false211, %if.end209
  %155 = load i8*, i8** %name, align 4
  %call216 = call i32 @legal_identifier(i8* %155)
  %cmp217 = icmp eq i32 %call216, 0
  br i1 %cmp217, label %if.then219, label %if.end222

if.then219:                                       ; preds = %land.lhs.true215
  %156 = load i8*, i8** %name, align 4
  call void @sh_invalidid(i8* %156)
  %157 = load i32, i32* %assign_error, align 4
  %inc220 = add nsw i32 %157, 1
  store i32 %inc220, i32* %assign_error, align 4
  %158 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %158, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 393)
  %159 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next221 = getelementptr inbounds %struct.word_list, %struct.word_list* %159, i32 0, i32 0
  %160 = load %struct.word_list*, %struct.word_list** %next221, align 4
  store %struct.word_list* %160, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end222:                                        ; preds = %land.lhs.true215, %lor.lhs.false211
  store %struct.variable* null, %struct.variable** %refvar, align 4
  %161 = load i32, i32* @variable_context, align 4
  %tobool223 = icmp ne i32 %161, 0
  br i1 %tobool223, label %land.lhs.true224, label %if.else307

land.lhs.true224:                                 ; preds = %if.end222
  %162 = load i32, i32* %mkglobal, align 4
  %cmp225 = icmp eq i32 %162, 0
  br i1 %cmp225, label %land.lhs.true227, label %if.else307

land.lhs.true227:                                 ; preds = %land.lhs.true224
  %163 = load i32, i32* %flags_on, align 4
  %and228 = and i32 %163, 8
  %cmp229 = icmp eq i32 %and228, 0
  br i1 %cmp229, label %if.then231, label %if.else307

if.then231:                                       ; preds = %land.lhs.true227
  %164 = load i32, i32* %flags_on, align 4
  %and232 = and i32 %164, 64
  %tobool233 = icmp ne i32 %and232, 0
  br i1 %tobool233, label %if.then234, label %if.else236

if.then234:                                       ; preds = %if.then231
  %165 = load i8*, i8** %name, align 4
  %call235 = call %struct.variable* @make_local_assoc_variable(i8* %165)
  store %struct.variable* %call235, %struct.variable** %var, align 4
  br label %if.end281

if.else236:                                       ; preds = %if.then231
  %166 = load i32, i32* %flags_on, align 4
  %and237 = and i32 %166, 4
  %tobool238 = icmp ne i32 %and237, 0
  br i1 %tobool238, label %if.then241, label %lor.lhs.false239

lor.lhs.false239:                                 ; preds = %if.else236
  %167 = load i32, i32* %making_array_special, align 4
  %tobool240 = icmp ne i32 %167, 0
  br i1 %tobool240, label %if.then241, label %if.else243

if.then241:                                       ; preds = %lor.lhs.false239, %if.else236
  %168 = load i8*, i8** %name, align 4
  %169 = load i32, i32* %making_array_special, align 4
  %call242 = call %struct.variable* @make_local_array_variable(i8* %168, i32 %169)
  store %struct.variable* %call242, %struct.variable** %var, align 4
  br label %if.end280

if.else243:                                       ; preds = %lor.lhs.false239
  %170 = load i32, i32* %offset, align 4
  %cmp244 = icmp eq i32 %170, 0
  br i1 %cmp244, label %land.lhs.true246, label %if.else277

land.lhs.true246:                                 ; preds = %if.else243
  %171 = load i32, i32* %flags_on, align 4
  %and247 = and i32 %171, 2048
  %tobool248 = icmp ne i32 %and247, 0
  br i1 %tobool248, label %if.then249, label %if.else277

if.then249:                                       ; preds = %land.lhs.true246
  %172 = load i8*, i8** %name, align 4
  %call250 = call %struct.variable* @find_variable_last_nameref(i8* %172, i32 1)
  store %struct.variable* %call250, %struct.variable** %refvar, align 4
  %173 = load i8*, i8** %name, align 4
  %call251 = call %struct.variable* @find_variable(i8* %173)
  store %struct.variable* %call251, %struct.variable** %var, align 4
  %174 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool252 = icmp ne %struct.variable* %174, null
  br i1 %tobool252, label %land.lhs.true253, label %if.else258

land.lhs.true253:                                 ; preds = %if.then249
  %175 = load %struct.variable*, %struct.variable** %refvar, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %175, i32 0, i32 6
  %176 = load i32, i32* %context, align 4
  %177 = load i32, i32* @variable_context, align 4
  %cmp254 = icmp ne i32 %176, %177
  br i1 %cmp254, label %if.then256, label %if.else258

if.then256:                                       ; preds = %land.lhs.true253
  store %struct.variable* null, %struct.variable** %refvar, align 4
  %178 = load i8*, i8** %name, align 4
  %call257 = call %struct.variable* @make_local_variable(i8* %178)
  store %struct.variable* %call257, %struct.variable** %var, align 4
  br label %if.end276

if.else258:                                       ; preds = %land.lhs.true253, %if.then249
  %179 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool259 = icmp ne %struct.variable* %179, null
  br i1 %tobool259, label %land.lhs.true260, label %if.else265

land.lhs.true260:                                 ; preds = %if.else258
  %180 = load %struct.variable*, %struct.variable** %refvar, align 4
  %context261 = getelementptr inbounds %struct.variable, %struct.variable* %180, i32 0, i32 6
  %181 = load i32, i32* %context261, align 4
  %182 = load i32, i32* @variable_context, align 4
  %cmp262 = icmp eq i32 %181, %182
  br i1 %cmp262, label %if.then264, label %if.else265

if.then264:                                       ; preds = %land.lhs.true260
  %183 = load %struct.variable*, %struct.variable** %refvar, align 4
  store %struct.variable* %183, %struct.variable** %var, align 4
  br label %if.end275

if.else265:                                       ; preds = %land.lhs.true260, %if.else258
  %184 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp266 = icmp eq %struct.variable* %184, null
  br i1 %cmp266, label %if.then272, label %lor.lhs.false268

lor.lhs.false268:                                 ; preds = %if.else265
  %185 = load %struct.variable*, %struct.variable** %var, align 4
  %context269 = getelementptr inbounds %struct.variable, %struct.variable* %185, i32 0, i32 6
  %186 = load i32, i32* %context269, align 4
  %187 = load i32, i32* @variable_context, align 4
  %cmp270 = icmp ne i32 %186, %187
  br i1 %cmp270, label %if.then272, label %if.end274

if.then272:                                       ; preds = %lor.lhs.false268, %if.else265
  %188 = load i8*, i8** %name, align 4
  %call273 = call %struct.variable* @make_local_variable(i8* %188)
  store %struct.variable* %call273, %struct.variable** %var, align 4
  br label %if.end274

if.end274:                                        ; preds = %if.then272, %lor.lhs.false268
  br label %if.end275

if.end275:                                        ; preds = %if.end274, %if.then264
  br label %if.end276

if.end276:                                        ; preds = %if.end275, %if.then256
  br label %if.end279

if.else277:                                       ; preds = %land.lhs.true246, %if.else243
  %189 = load i8*, i8** %name, align 4
  %call278 = call %struct.variable* @make_local_variable(i8* %189)
  store %struct.variable* %call278, %struct.variable** %var, align 4
  br label %if.end279

if.end279:                                        ; preds = %if.else277, %if.end276
  br label %if.end280

if.end280:                                        ; preds = %if.end279, %if.then241
  br label %if.end281

if.end281:                                        ; preds = %if.end280, %if.then234
  %190 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp282 = icmp eq %struct.variable* %190, null
  br i1 %cmp282, label %if.then284, label %if.end287

if.then284:                                       ; preds = %if.end281
  %191 = load i32, i32* %any_failed, align 4
  %inc285 = add nsw i32 %191, 1
  store i32 %inc285, i32* %any_failed, align 4
  %192 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %192, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 441)
  %193 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next286 = getelementptr inbounds %struct.word_list, %struct.word_list* %193, i32 0, i32 0
  %194 = load %struct.word_list*, %struct.word_list** %next286, align 4
  store %struct.word_list* %194, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end287:                                        ; preds = %if.end281
  %195 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool288 = icmp ne %struct.variable* %195, null
  br i1 %tobool288, label %land.lhs.true289, label %if.end306

land.lhs.true289:                                 ; preds = %if.end287
  %196 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes290 = getelementptr inbounds %struct.variable, %struct.variable* %196, i32 0, i32 5
  %197 = load i32, i32* %attributes290, align 4
  %and291 = and i32 %197, 2048
  %tobool292 = icmp ne i32 %and291, 0
  br i1 %tobool292, label %land.lhs.true293, label %if.end306

land.lhs.true293:                                 ; preds = %land.lhs.true289
  %198 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes294 = getelementptr inbounds %struct.variable, %struct.variable* %198, i32 0, i32 5
  %199 = load i32, i32* %attributes294, align 4
  %and295 = and i32 %199, 2
  %tobool296 = icmp ne i32 %and295, 0
  br i1 %tobool296, label %land.lhs.true297, label %if.end306

land.lhs.true297:                                 ; preds = %land.lhs.true293
  %200 = load %struct.variable*, %struct.variable** %var, align 4
  %value298 = getelementptr inbounds %struct.variable, %struct.variable* %200, i32 0, i32 1
  %201 = load i8*, i8** %value298, align 4
  %tobool299 = icmp ne i8* %201, null
  br i1 %tobool299, label %land.lhs.true300, label %if.end306

land.lhs.true300:                                 ; preds = %land.lhs.true297
  %202 = load i32, i32* %flags_off, align 4
  %and301 = and i32 %202, 2048
  %tobool302 = icmp ne i32 %and301, 0
  br i1 %tobool302, label %if.then303, label %if.end306

if.then303:                                       ; preds = %land.lhs.true300
  %203 = load i8*, i8** %name, align 4
  call void @sh_readonly(i8* %203)
  %204 = load i32, i32* %any_failed, align 4
  %inc304 = add nsw i32 %204, 1
  store i32 %inc304, i32* %any_failed, align 4
  %205 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %205, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 447)
  %206 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next305 = getelementptr inbounds %struct.word_list, %struct.word_list* %206, i32 0, i32 0
  %207 = load %struct.word_list*, %struct.word_list** %next305, align 4
  store %struct.word_list* %207, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end306:                                        ; preds = %land.lhs.true300, %land.lhs.true297, %land.lhs.true293, %land.lhs.true289, %if.end287
  br label %if.end308

if.else307:                                       ; preds = %land.lhs.true227, %land.lhs.true224, %if.end222
  store %struct.variable* null, %struct.variable** %var, align 4
  br label %if.end308

if.end308:                                        ; preds = %if.else307, %if.end306
  %208 = load i32, i32* %flags_on, align 4
  %and309 = and i32 %208, 8
  %tobool310 = icmp ne i32 %and309, 0
  br i1 %tobool310, label %if.then311, label %if.else372

if.then311:                                       ; preds = %if.end308
  %209 = load i32, i32* %offset, align 4
  %tobool312 = icmp ne i32 %209, 0
  br i1 %tobool312, label %if.then313, label %if.else315

if.then313:                                       ; preds = %if.then311
  %call314 = call i8* @libintl_gettext(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.9, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call314)
  %210 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %210, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 464)
  store i32 1, i32* %retval, align 4
  br label %return

if.else315:                                       ; preds = %if.then311
  %211 = load i8*, i8** %name, align 4
  %call316 = call %struct.variable* @find_function(i8* %211)
  store %struct.variable* %call316, %struct.variable** %var, align 4
  %212 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool317 = icmp ne %struct.variable* %212, null
  br i1 %tobool317, label %if.then318, label %if.else368

if.then318:                                       ; preds = %if.else315
  %213 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes319 = getelementptr inbounds %struct.variable, %struct.variable* %213, i32 0, i32 5
  %214 = load i32, i32* %attributes319, align 4
  %and320 = and i32 %214, 2
  %tobool321 = icmp ne i32 %and320, 0
  br i1 %tobool321, label %land.lhs.true322, label %if.end329

land.lhs.true322:                                 ; preds = %if.then318
  %215 = load i32, i32* %flags_off, align 4
  %and323 = and i32 %215, 2
  %tobool324 = icmp ne i32 %and323, 0
  br i1 %tobool324, label %if.then325, label %if.end329

if.then325:                                       ; preds = %land.lhs.true322
  %call326 = call i8* @libintl_gettext(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.10, i32 0, i32 0))
  %216 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call326, i8* %216)
  %217 = load i32, i32* %any_failed, align 4
  %inc327 = add nsw i32 %217, 1
  store i32 %inc327, i32* %any_failed, align 4
  %218 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %218, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 477)
  %219 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next328 = getelementptr inbounds %struct.word_list, %struct.word_list* %219, i32 0, i32 0
  %220 = load %struct.word_list*, %struct.word_list** %next328, align 4
  store %struct.word_list* %220, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end329:                                        ; preds = %land.lhs.true322, %if.then318
  %221 = load i32, i32* %flags_on, align 4
  %cmp330 = icmp eq i32 %221, 8
  br i1 %cmp330, label %land.lhs.true332, label %if.else362

land.lhs.true332:                                 ; preds = %if.end329
  %222 = load i32, i32* %flags_off, align 4
  %cmp333 = icmp eq i32 %222, 0
  br i1 %cmp333, label %if.then335, label %if.else362

if.then335:                                       ; preds = %land.lhs.true332
  %223 = load i32, i32* %nodefs, align 4
  %tobool336 = icmp ne i32 %223, 0
  br i1 %tobool336, label %land.lhs.true337, label %if.else350

land.lhs.true337:                                 ; preds = %if.then335
  %224 = load i32, i32* @debugging_mode, align 4
  %tobool338 = icmp ne i32 %224, 0
  br i1 %tobool338, label %if.then339, label %if.else350

if.then339:                                       ; preds = %land.lhs.true337
  %225 = load %struct.variable*, %struct.variable** %var, align 4
  %name340 = getelementptr inbounds %struct.variable, %struct.variable* %225, i32 0, i32 0
  %226 = load i8*, i8** %name340, align 4
  %call341 = call %struct.function_def* @find_function_def(i8* %226)
  store %struct.function_def* %call341, %struct.function_def** %shell_fn, align 4
  %227 = load %struct.function_def*, %struct.function_def** %shell_fn, align 4
  %tobool342 = icmp ne %struct.function_def* %227, null
  br i1 %tobool342, label %if.then343, label %if.else346

if.then343:                                       ; preds = %if.then339
  %228 = load %struct.variable*, %struct.variable** %var, align 4
  %name344 = getelementptr inbounds %struct.variable, %struct.variable* %228, i32 0, i32 0
  %229 = load i8*, i8** %name344, align 4
  %230 = load %struct.function_def*, %struct.function_def** %shell_fn, align 4
  %line = getelementptr inbounds %struct.function_def, %struct.function_def* %230, i32 0, i32 1
  %231 = load i32, i32* %line, align 4
  %232 = load %struct.function_def*, %struct.function_def** %shell_fn, align 4
  %source_file = getelementptr inbounds %struct.function_def, %struct.function_def* %232, i32 0, i32 4
  %233 = load i8*, i8** %source_file, align 4
  %call345 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.11, i32 0, i32 0), i8* %229, i32 %231, i8* %233)
  br label %if.end349

if.else346:                                       ; preds = %if.then339
  %234 = load %struct.variable*, %struct.variable** %var, align 4
  %name347 = getelementptr inbounds %struct.variable, %struct.variable* %234, i32 0, i32 0
  %235 = load i8*, i8** %name347, align 4
  %call348 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8* %235)
  br label %if.end349

if.end349:                                        ; preds = %if.else346, %if.then343
  br label %if.end361

if.else350:                                       ; preds = %land.lhs.true337, %if.then335
  %236 = load i32, i32* %nodefs, align 4
  %tobool351 = icmp ne i32 %236, 0
  br i1 %tobool351, label %cond.true352, label %cond.false354

cond.true352:                                     ; preds = %if.else350
  %237 = load %struct.variable*, %struct.variable** %var, align 4
  %name353 = getelementptr inbounds %struct.variable, %struct.variable* %237, i32 0, i32 0
  %238 = load i8*, i8** %name353, align 4
  br label %cond.end357

cond.false354:                                    ; preds = %if.else350
  %239 = load i8*, i8** %name, align 4
  %240 = load %struct.variable*, %struct.variable** %var, align 4
  %value355 = getelementptr inbounds %struct.variable, %struct.variable* %240, i32 0, i32 1
  %241 = load i8*, i8** %value355, align 4
  %242 = bitcast i8* %241 to %struct.command*
  %call356 = call i8* @named_function_string(i8* %239, %struct.command* %242, i32 3)
  br label %cond.end357

cond.end357:                                      ; preds = %cond.false354, %cond.true352
  %cond358 = phi i8* [ %238, %cond.true352 ], [ %call356, %cond.false354 ]
  store i8* %cond358, i8** %t, align 4
  %243 = load i8*, i8** %t, align 4
  %call359 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8* %243)
  %244 = load i32, i32* %any_failed, align 4
  %call360 = call i32 @sh_chkwrite(i32 %244)
  store i32 %call360, i32* %any_failed, align 4
  br label %if.end361

if.end361:                                        ; preds = %cond.end357, %if.end349
  br label %if.end367

if.else362:                                       ; preds = %land.lhs.true332, %if.end329
  %245 = load i32, i32* %flags_on, align 4
  %246 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes363 = getelementptr inbounds %struct.variable, %struct.variable* %246, i32 0, i32 5
  %247 = load i32, i32* %attributes363, align 4
  %or364 = or i32 %247, %245
  store i32 %or364, i32* %attributes363, align 4
  %248 = load i32, i32* %flags_off, align 4
  %neg = xor i32 %248, -1
  %249 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes365 = getelementptr inbounds %struct.variable, %struct.variable* %249, i32 0, i32 5
  %250 = load i32, i32* %attributes365, align 4
  %and366 = and i32 %250, %neg
  store i32 %and366, i32* %attributes365, align 4
  br label %if.end367

if.end367:                                        ; preds = %if.else362, %if.end361
  br label %if.end370

if.else368:                                       ; preds = %if.else315
  %251 = load i32, i32* %any_failed, align 4
  %inc369 = add nsw i32 %251, 1
  store i32 %inc369, i32* %any_failed, align 4
  br label %if.end370

if.end370:                                        ; preds = %if.else368, %if.end367
  %252 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %252, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 509)
  %253 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next371 = getelementptr inbounds %struct.word_list, %struct.word_list* %253, i32 0, i32 0
  %254 = load %struct.word_list*, %struct.word_list** %next371, align 4
  store %struct.word_list* %254, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.else372:                                       ; preds = %if.end308
  %255 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp373 = icmp eq %struct.variable* %255, null
  br i1 %cmp373, label %land.lhs.true375, label %if.else394

land.lhs.true375:                                 ; preds = %if.else372
  %256 = load i32, i32* %flags_on, align 4
  %and376 = and i32 %256, 2048
  %tobool377 = icmp ne i32 %and376, 0
  br i1 %tobool377, label %if.then378, label %if.else394

if.then378:                                       ; preds = %land.lhs.true375
  %257 = load i32, i32* %mkglobal, align 4
  %tobool379 = icmp ne i32 %257, 0
  br i1 %tobool379, label %cond.true380, label %cond.false382

cond.true380:                                     ; preds = %if.then378
  %258 = load i8*, i8** %name, align 4
  %call381 = call %struct.variable* @find_global_variable_noref(i8* %258)
  br label %cond.end384

cond.false382:                                    ; preds = %if.then378
  %259 = load i8*, i8** %name, align 4
  %call383 = call %struct.variable* @find_variable_noref(i8* %259)
  br label %cond.end384

cond.end384:                                      ; preds = %cond.false382, %cond.true380
  %cond385 = phi %struct.variable* [ %call381, %cond.true380 ], [ %call383, %cond.false382 ]
  store %struct.variable* %cond385, %struct.variable** %var, align 4
  %260 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool386 = icmp ne %struct.variable* %260, null
  br i1 %tobool386, label %land.lhs.true387, label %if.end393

land.lhs.true387:                                 ; preds = %cond.end384
  %261 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes388 = getelementptr inbounds %struct.variable, %struct.variable* %261, i32 0, i32 5
  %262 = load i32, i32* %attributes388, align 4
  %and389 = and i32 %262, 2048
  %cmp390 = icmp eq i32 %and389, 0
  br i1 %cmp390, label %if.then392, label %if.end393

if.then392:                                       ; preds = %land.lhs.true387
  store %struct.variable* null, %struct.variable** %var, align 4
  br label %if.end393

if.end393:                                        ; preds = %if.then392, %land.lhs.true387, %cond.end384
  br label %if.end475

if.else394:                                       ; preds = %land.lhs.true375, %if.else372
  %263 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp395 = icmp eq %struct.variable* %263, null
  br i1 %cmp395, label %land.lhs.true397, label %if.else440

land.lhs.true397:                                 ; preds = %if.else394
  %264 = load i32, i32* %flags_off, align 4
  %and398 = and i32 %264, 2048
  %tobool399 = icmp ne i32 %and398, 0
  br i1 %tobool399, label %if.then400, label %if.else440

if.then400:                                       ; preds = %land.lhs.true397
  %265 = load i32, i32* %mkglobal, align 4
  %tobool401 = icmp ne i32 %265, 0
  br i1 %tobool401, label %cond.true402, label %cond.false404

cond.true402:                                     ; preds = %if.then400
  %266 = load i8*, i8** %name, align 4
  %call403 = call %struct.variable* @find_global_variable_last_nameref(i8* %266, i32 0)
  br label %cond.end406

cond.false404:                                    ; preds = %if.then400
  %267 = load i8*, i8** %name, align 4
  %call405 = call %struct.variable* @find_variable_last_nameref(i8* %267, i32 0)
  br label %cond.end406

cond.end406:                                      ; preds = %cond.false404, %cond.true402
  %cond407 = phi %struct.variable* [ %call403, %cond.true402 ], [ %call405, %cond.false404 ]
  store %struct.variable* %cond407, %struct.variable** %refvar, align 4
  %268 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool408 = icmp ne %struct.variable* %268, null
  br i1 %tobool408, label %land.lhs.true409, label %if.end415

land.lhs.true409:                                 ; preds = %cond.end406
  %269 = load %struct.variable*, %struct.variable** %refvar, align 4
  %attributes410 = getelementptr inbounds %struct.variable, %struct.variable* %269, i32 0, i32 5
  %270 = load i32, i32* %attributes410, align 4
  %and411 = and i32 %270, 2048
  %cmp412 = icmp eq i32 %and411, 0
  br i1 %cmp412, label %if.then414, label %if.end415

if.then414:                                       ; preds = %land.lhs.true409
  store %struct.variable* null, %struct.variable** %refvar, align 4
  br label %if.end415

if.end415:                                        ; preds = %if.then414, %land.lhs.true409, %cond.end406
  %271 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool416 = icmp ne %struct.variable* %271, null
  br i1 %tobool416, label %land.lhs.true417, label %if.end427

land.lhs.true417:                                 ; preds = %if.end415
  %272 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value418 = getelementptr inbounds %struct.variable, %struct.variable* %272, i32 0, i32 1
  %273 = load i8*, i8** %value418, align 4
  %tobool419 = icmp ne i8* %273, null
  br i1 %tobool419, label %land.lhs.true420, label %if.end427

land.lhs.true420:                                 ; preds = %land.lhs.true417
  %274 = load %struct.variable*, %struct.variable** %refvar, align 4
  %attributes421 = getelementptr inbounds %struct.variable, %struct.variable* %274, i32 0, i32 5
  %275 = load i32, i32* %attributes421, align 4
  %and422 = and i32 %275, 2
  %tobool423 = icmp ne i32 %and422, 0
  br i1 %tobool423, label %if.then424, label %if.end427

if.then424:                                       ; preds = %land.lhs.true420
  %276 = load i8*, i8** %name, align 4
  call void @sh_readonly(i8* %276)
  %277 = load i32, i32* %any_failed, align 4
  %inc425 = add nsw i32 %277, 1
  store i32 %inc425, i32* %any_failed, align 4
  %278 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %278, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 561)
  %279 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next426 = getelementptr inbounds %struct.word_list, %struct.word_list* %279, i32 0, i32 0
  %280 = load %struct.word_list*, %struct.word_list** %next426, align 4
  store %struct.word_list* %280, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end427:                                        ; preds = %land.lhs.true420, %land.lhs.true417, %if.end415
  %281 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool428 = icmp ne %struct.variable* %281, null
  br i1 %tobool428, label %if.then429, label %if.end439

if.then429:                                       ; preds = %if.end427
  %282 = load i32, i32* %mkglobal, align 4
  %tobool430 = icmp ne i32 %282, 0
  br i1 %tobool430, label %cond.true431, label %cond.false434

cond.true431:                                     ; preds = %if.then429
  %283 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value432 = getelementptr inbounds %struct.variable, %struct.variable* %283, i32 0, i32 1
  %284 = load i8*, i8** %value432, align 4
  %call433 = call %struct.variable* @find_global_variable(i8* %284)
  br label %cond.end437

cond.false434:                                    ; preds = %if.then429
  %285 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value435 = getelementptr inbounds %struct.variable, %struct.variable* %285, i32 0, i32 1
  %286 = load i8*, i8** %value435, align 4
  %call436 = call %struct.variable* @find_variable(i8* %286)
  br label %cond.end437

cond.end437:                                      ; preds = %cond.false434, %cond.true431
  %cond438 = phi %struct.variable* [ %call433, %cond.true431 ], [ %call436, %cond.false434 ]
  store %struct.variable* %cond438, %struct.variable** %var, align 4
  br label %if.end439

if.end439:                                        ; preds = %cond.end437, %if.end427
  br label %if.end474

if.else440:                                       ; preds = %land.lhs.true397, %if.else394
  %287 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp441 = icmp eq %struct.variable* %287, null
  br i1 %cmp441, label %land.lhs.true443, label %if.end473

land.lhs.true443:                                 ; preds = %if.else440
  %288 = load i32, i32* %offset, align 4
  %tobool444 = icmp ne i32 %288, 0
  br i1 %tobool444, label %land.lhs.true445, label %if.end473

land.lhs.true445:                                 ; preds = %land.lhs.true443
  %289 = load i32, i32* %array_subscript_assignment, align 4
  %tobool446 = icmp ne i32 %289, 0
  br i1 %tobool446, label %if.then447, label %if.end473

if.then447:                                       ; preds = %land.lhs.true445
  %290 = load i32, i32* %mkglobal, align 4
  %tobool448 = icmp ne i32 %290, 0
  br i1 %tobool448, label %cond.true449, label %cond.false451

cond.true449:                                     ; preds = %if.then447
  %291 = load i8*, i8** %name, align 4
  %call450 = call %struct.variable* @find_global_variable_noref(i8* %291)
  br label %cond.end453

cond.false451:                                    ; preds = %if.then447
  %292 = load i8*, i8** %name, align 4
  %call452 = call %struct.variable* @find_variable_noref(i8* %292)
  br label %cond.end453

cond.end453:                                      ; preds = %cond.false451, %cond.true449
  %cond454 = phi %struct.variable* [ %call450, %cond.true449 ], [ %call452, %cond.false451 ]
  store %struct.variable* %cond454, %struct.variable** %var, align 4
  %293 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool455 = icmp ne %struct.variable* %293, null
  br i1 %tobool455, label %land.lhs.true456, label %if.end472

land.lhs.true456:                                 ; preds = %cond.end453
  %294 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes457 = getelementptr inbounds %struct.variable, %struct.variable* %294, i32 0, i32 5
  %295 = load i32, i32* %attributes457, align 4
  %and458 = and i32 %295, 2048
  %tobool459 = icmp ne i32 %and458, 0
  br i1 %tobool459, label %if.then460, label %if.end472

if.then460:                                       ; preds = %land.lhs.true456
  %call461 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.13, i32 0, i32 0))
  %296 = load i8*, i8** %name, align 4
  call void (i8*, ...) @internal_warning(i8* %call461, i8* %296)
  br label %do.body462

do.body462:                                       ; preds = %if.then460
  %297 = load %struct.variable*, %struct.variable** %var, align 4
  %value463 = getelementptr inbounds %struct.variable, %struct.variable* %297, i32 0, i32 1
  %298 = load i8*, i8** %value463, align 4
  %tobool464 = icmp ne i8* %298, null
  br i1 %tobool464, label %if.then465, label %if.end467

if.then465:                                       ; preds = %do.body462
  %299 = load %struct.variable*, %struct.variable** %var, align 4
  %value466 = getelementptr inbounds %struct.variable, %struct.variable* %299, i32 0, i32 1
  %300 = load i8*, i8** %value466, align 4
  call void @sh_xfree(i8* %300, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 575)
  br label %if.end467

if.end467:                                        ; preds = %if.then465, %do.body462
  br label %do.end468

do.end468:                                        ; preds = %if.end467
  %301 = load %struct.variable*, %struct.variable** %var, align 4
  %value469 = getelementptr inbounds %struct.variable, %struct.variable* %301, i32 0, i32 1
  store i8* null, i8** %value469, align 4
  %302 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes470 = getelementptr inbounds %struct.variable, %struct.variable* %302, i32 0, i32 5
  %303 = load i32, i32* %attributes470, align 4
  %and471 = and i32 %303, -2049
  store i32 %and471, i32* %attributes470, align 4
  br label %if.end472

if.end472:                                        ; preds = %do.end468, %land.lhs.true456, %cond.end453
  br label %if.end473

if.end473:                                        ; preds = %if.end472, %land.lhs.true445, %land.lhs.true443, %if.else440
  br label %if.end474

if.end474:                                        ; preds = %if.end473, %if.end439
  br label %if.end475

if.end475:                                        ; preds = %if.end474, %if.end393
  %304 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp476 = icmp eq %struct.variable* %304, null
  br i1 %cmp476, label %land.lhs.true478, label %if.end569

land.lhs.true478:                                 ; preds = %if.end475
  %305 = load i32, i32* %flags_on, align 4
  %tobool479 = icmp ne i32 %305, 0
  br i1 %tobool479, label %if.then484, label %lor.lhs.false480

lor.lhs.false480:                                 ; preds = %land.lhs.true478
  %306 = load i32, i32* %flags_off, align 4
  %tobool481 = icmp ne i32 %306, 0
  br i1 %tobool481, label %if.then484, label %lor.lhs.false482

lor.lhs.false482:                                 ; preds = %lor.lhs.false480
  %307 = load i32, i32* %offset, align 4
  %tobool483 = icmp ne i32 %307, 0
  br i1 %tobool483, label %if.then484, label %if.end569

if.then484:                                       ; preds = %lor.lhs.false482, %lor.lhs.false480, %land.lhs.true478
  %308 = load i32, i32* %mkglobal, align 4
  %tobool485 = icmp ne i32 %308, 0
  br i1 %tobool485, label %cond.true486, label %cond.false488

cond.true486:                                     ; preds = %if.then484
  %309 = load i8*, i8** %name, align 4
  %call487 = call %struct.variable* @find_global_variable_last_nameref(i8* %309, i32 0)
  br label %cond.end490

cond.false488:                                    ; preds = %if.then484
  %310 = load i8*, i8** %name, align 4
  %call489 = call %struct.variable* @find_variable_last_nameref(i8* %310, i32 0)
  br label %cond.end490

cond.end490:                                      ; preds = %cond.false488, %cond.true486
  %cond491 = phi %struct.variable* [ %call487, %cond.true486 ], [ %call489, %cond.false488 ]
  store %struct.variable* %cond491, %struct.variable** %refvar, align 4
  %311 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool492 = icmp ne %struct.variable* %311, null
  br i1 %tobool492, label %land.lhs.true493, label %if.end499

land.lhs.true493:                                 ; preds = %cond.end490
  %312 = load %struct.variable*, %struct.variable** %refvar, align 4
  %attributes494 = getelementptr inbounds %struct.variable, %struct.variable* %312, i32 0, i32 5
  %313 = load i32, i32* %attributes494, align 4
  %and495 = and i32 %313, 2048
  %cmp496 = icmp eq i32 %and495, 0
  br i1 %cmp496, label %if.then498, label %if.end499

if.then498:                                       ; preds = %land.lhs.true493
  store %struct.variable* null, %struct.variable** %refvar, align 4
  br label %if.end499

if.end499:                                        ; preds = %if.then498, %land.lhs.true493, %cond.end490
  %314 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool500 = icmp ne %struct.variable* %314, null
  br i1 %tobool500, label %if.then501, label %if.end511

if.then501:                                       ; preds = %if.end499
  %315 = load i32, i32* %mkglobal, align 4
  %tobool502 = icmp ne i32 %315, 0
  br i1 %tobool502, label %cond.true503, label %cond.false506

cond.true503:                                     ; preds = %if.then501
  %316 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value504 = getelementptr inbounds %struct.variable, %struct.variable* %316, i32 0, i32 1
  %317 = load i8*, i8** %value504, align 4
  %call505 = call %struct.variable* @find_global_variable(i8* %317)
  br label %cond.end509

cond.false506:                                    ; preds = %if.then501
  %318 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value507 = getelementptr inbounds %struct.variable, %struct.variable* %318, i32 0, i32 1
  %319 = load i8*, i8** %value507, align 4
  %call508 = call %struct.variable* @find_variable(i8* %319)
  br label %cond.end509

cond.end509:                                      ; preds = %cond.false506, %cond.true503
  %cond510 = phi %struct.variable* [ %call505, %cond.true503 ], [ %call508, %cond.false506 ]
  store %struct.variable* %cond510, %struct.variable** %var, align 4
  br label %if.end511

if.end511:                                        ; preds = %cond.end509, %if.end499
  %320 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool512 = icmp ne %struct.variable* %320, null
  br i1 %tobool512, label %land.lhs.true513, label %if.end568

land.lhs.true513:                                 ; preds = %if.end511
  %321 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp514 = icmp eq %struct.variable* %321, null
  br i1 %cmp514, label %if.then516, label %if.end568

if.then516:                                       ; preds = %land.lhs.true513
  %322 = load i8*, i8** %name, align 4
  store i8* %322, i8** %oldname, align 4
  %323 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value517 = getelementptr inbounds %struct.variable, %struct.variable* %323, i32 0, i32 1
  %324 = load i8*, i8** %value517, align 4
  %call518 = call i32 @strlen(i8* %324)
  store i32 %call518, i32* %namelen, align 4
  %325 = load i8*, i8** %subscript_start, align 4
  %tobool519 = icmp ne i8* %325, null
  br i1 %tobool519, label %if.then520, label %if.end523

if.then520:                                       ; preds = %if.then516
  %326 = load i8*, i8** %subscript_start, align 4
  store i8 91, i8* %326, align 1
  %327 = load i8*, i8** %subscript_start, align 4
  %call521 = call i32 @strlen(i8* %327)
  %328 = load i32, i32* %namelen, align 4
  %add522 = add i32 %328, %call521
  store i32 %add522, i32* %namelen, align 4
  br label %if.end523

if.end523:                                        ; preds = %if.then520, %if.then516
  %329 = load i32, i32* %namelen, align 4
  %add524 = add nsw i32 %329, 2
  %330 = load i8*, i8** %value, align 4
  %call525 = call i32 @strlen(i8* %330)
  %add526 = add i32 %add524, %call525
  %add527 = add i32 %add526, 1
  %call528 = call i8* @sh_xmalloc(i32 %add527, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 608)
  store i8* %call528, i8** %name, align 4
  %331 = load i8*, i8** %name, align 4
  %332 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value529 = getelementptr inbounds %struct.variable, %struct.variable* %332, i32 0, i32 1
  %333 = load i8*, i8** %value529, align 4
  %call530 = call i8* @strcpy(i8* %331, i8* %333)
  %334 = load i8*, i8** %subscript_start, align 4
  %tobool531 = icmp ne i8* %334, null
  br i1 %tobool531, label %if.then532, label %if.end537

if.then532:                                       ; preds = %if.end523
  %335 = load i8*, i8** %name, align 4
  %336 = load %struct.variable*, %struct.variable** %refvar, align 4
  %value533 = getelementptr inbounds %struct.variable, %struct.variable* %336, i32 0, i32 1
  %337 = load i8*, i8** %value533, align 4
  %call534 = call i32 @strlen(i8* %337)
  %add.ptr535 = getelementptr inbounds i8, i8* %335, i32 %call534
  %338 = load i8*, i8** %subscript_start, align 4
  %call536 = call i8* @strcpy(i8* %add.ptr535, i8* %338)
  br label %if.end537

if.end537:                                        ; preds = %if.then532, %if.end523
  %339 = load i32, i32* %offset, align 4
  %tobool538 = icmp ne i32 %339, 0
  br i1 %tobool538, label %if.then539, label %if.end567

if.then539:                                       ; preds = %if.end537
  %340 = load i32, i32* %aflags, align 4
  %and540 = and i32 %340, 1
  %tobool541 = icmp ne i32 %and540, 0
  br i1 %tobool541, label %if.then542, label %if.end545

if.then542:                                       ; preds = %if.then539
  %341 = load i8*, i8** %name, align 4
  %342 = load i32, i32* %namelen, align 4
  %inc543 = add nsw i32 %342, 1
  store i32 %inc543, i32* %namelen, align 4
  %arrayidx544 = getelementptr inbounds i8, i8* %341, i32 %342
  store i8 43, i8* %arrayidx544, align 1
  br label %if.end545

if.end545:                                        ; preds = %if.then542, %if.then539
  %343 = load i8*, i8** %name, align 4
  %344 = load i32, i32* %namelen, align 4
  %inc546 = add nsw i32 %344, 1
  store i32 %inc546, i32* %namelen, align 4
  %arrayidx547 = getelementptr inbounds i8, i8* %343, i32 %344
  store i8 61, i8* %arrayidx547, align 1
  %345 = load i8*, i8** %value, align 4
  %tobool548 = icmp ne i8* %345, null
  br i1 %tobool548, label %land.lhs.true549, label %if.else555

land.lhs.true549:                                 ; preds = %if.end545
  %346 = load i8*, i8** %value, align 4
  %347 = load i8, i8* %346, align 1
  %conv550 = sext i8 %347 to i32
  %tobool551 = icmp ne i32 %conv550, 0
  br i1 %tobool551, label %if.then552, label %if.else555

if.then552:                                       ; preds = %land.lhs.true549
  %348 = load i8*, i8** %name, align 4
  %349 = load i32, i32* %namelen, align 4
  %add.ptr553 = getelementptr inbounds i8, i8* %348, i32 %349
  %350 = load i8*, i8** %value, align 4
  %call554 = call i8* @strcpy(i8* %add.ptr553, i8* %350)
  br label %if.end557

if.else555:                                       ; preds = %land.lhs.true549, %if.end545
  %351 = load i8*, i8** %name, align 4
  %352 = load i32, i32* %namelen, align 4
  %arrayidx556 = getelementptr inbounds i8, i8* %351, i32 %352
  store i8 0, i8* %arrayidx556, align 1
  br label %if.end557

if.end557:                                        ; preds = %if.else555, %if.then552
  %353 = load i8*, i8** %name, align 4
  %call558 = call i32 @assignment(i8* %353, i32 0)
  store i32 %call558, i32* %offset, align 4
  %354 = load i32, i32* %offset, align 4
  %cmp559 = icmp eq i32 %354, 0
  br i1 %cmp559, label %if.then561, label %if.end564

if.then561:                                       ; preds = %if.end557
  %355 = load i8*, i8** %oldname, align 4
  call void @sh_xfree(i8* %355, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 631)
  %356 = load i8*, i8** %name, align 4
  call void @sh_invalidid(i8* %356)
  %357 = load i32, i32* %assign_error, align 4
  %inc562 = add nsw i32 %357, 1
  store i32 %inc562, i32* %assign_error, align 4
  %358 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %358, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 634)
  %359 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next563 = getelementptr inbounds %struct.word_list, %struct.word_list* %359, i32 0, i32 0
  %360 = load %struct.word_list*, %struct.word_list** %next563, align 4
  store %struct.word_list* %360, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end564:                                        ; preds = %if.end557
  %361 = load i8*, i8** %name, align 4
  %362 = load i32, i32* %offset, align 4
  %arrayidx565 = getelementptr inbounds i8, i8* %361, i32 %362
  store i8 0, i8* %arrayidx565, align 1
  %363 = load i8*, i8** %name, align 4
  %364 = load i32, i32* %namelen, align 4
  %add.ptr566 = getelementptr inbounds i8, i8* %363, i32 %364
  store i8* %add.ptr566, i8** %value, align 4
  br label %if.end567

if.end567:                                        ; preds = %if.end564, %if.end537
  %365 = load i8*, i8** %oldname, align 4
  call void @sh_xfree(i8* %365, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 639)
  br label %restart_new_var_name

if.end568:                                        ; preds = %land.lhs.true513, %if.end511
  br label %if.end569

if.end569:                                        ; preds = %if.end568, %lor.lhs.false482, %if.end475
  %366 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp570 = icmp eq %struct.variable* %366, null
  br i1 %cmp570, label %if.then572, label %if.end580

if.then572:                                       ; preds = %if.end569
  %367 = load i32, i32* %mkglobal, align 4
  %tobool573 = icmp ne i32 %367, 0
  br i1 %tobool573, label %cond.true574, label %cond.false576

cond.true574:                                     ; preds = %if.then572
  %368 = load i8*, i8** %name, align 4
  %call575 = call %struct.variable* @find_global_variable(i8* %368)
  br label %cond.end578

cond.false576:                                    ; preds = %if.then572
  %369 = load i8*, i8** %name, align 4
  %call577 = call %struct.variable* @find_variable(i8* %369)
  br label %cond.end578

cond.end578:                                      ; preds = %cond.false576, %cond.true574
  %cond579 = phi %struct.variable* [ %call575, %cond.true574 ], [ %call577, %cond.false576 ]
  store %struct.variable* %cond579, %struct.variable** %var, align 4
  br label %if.end580

if.end580:                                        ; preds = %cond.end578, %if.end569
  %370 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp581 = icmp ne %struct.variable* %370, null
  %conv582 = zext i1 %cmp581 to i32
  store i32 %conv582, i32* %var_exists, align 4
  %371 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool583 = icmp ne %struct.variable* %371, null
  br i1 %tobool583, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end580
  %372 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes584 = getelementptr inbounds %struct.variable, %struct.variable* %372, i32 0, i32 5
  %373 = load i32, i32* %attributes584, align 4
  %and585 = and i32 %373, 4
  %tobool586 = icmp ne i32 %and585, 0
  br i1 %tobool586, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %374 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes587 = getelementptr inbounds %struct.variable, %struct.variable* %374, i32 0, i32 5
  %375 = load i32, i32* %attributes587, align 4
  %and588 = and i32 %375, 64
  %tobool589 = icmp ne i32 %and588, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %376 = phi i1 [ true, %land.rhs ], [ %tobool589, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %if.end580
  %377 = phi i1 [ false, %if.end580 ], [ %376, %lor.end ]
  %land.ext = zext i1 %377 to i32
  store i32 %land.ext, i32* %array_exists, align 4
  %378 = load i32, i32* %flags_on, align 4
  %and590 = and i32 %378, 68
  store i32 %and590, i32* %creating_array, align 4
  %379 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp591 = icmp eq %struct.variable* %379, null
  br i1 %cmp591, label %if.then593, label %if.else653

if.then593:                                       ; preds = %land.end
  %380 = load i32, i32* %flags_on, align 4
  %and594 = and i32 %380, 64
  %tobool595 = icmp ne i32 %and594, 0
  br i1 %tobool595, label %if.then596, label %if.else609

if.then596:                                       ; preds = %if.then593
  %381 = load i8*, i8** %name, align 4
  %call597 = call %struct.variable* @make_new_assoc_variable(i8* %381)
  store %struct.variable* %call597, %struct.variable** %var, align 4
  %382 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool598 = icmp ne %struct.variable* %382, null
  br i1 %tobool598, label %land.lhs.true599, label %if.end608

land.lhs.true599:                                 ; preds = %if.then596
  %383 = load i32, i32* %offset, align 4
  %cmp600 = icmp eq i32 %383, 0
  br i1 %cmp600, label %land.lhs.true602, label %if.end608

land.lhs.true602:                                 ; preds = %land.lhs.true599
  %384 = load i32, i32* @no_invisible_vars, align 4
  %cmp603 = icmp eq i32 %384, 0
  br i1 %cmp603, label %if.then605, label %if.end608

if.then605:                                       ; preds = %land.lhs.true602
  %385 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes606 = getelementptr inbounds %struct.variable, %struct.variable* %385, i32 0, i32 5
  %386 = load i32, i32* %attributes606, align 4
  %or607 = or i32 %386, 4096
  store i32 %or607, i32* %attributes606, align 4
  br label %if.end608

if.end608:                                        ; preds = %if.then605, %land.lhs.true602, %land.lhs.true599, %if.then596
  br label %if.end647

if.else609:                                       ; preds = %if.then593
  %387 = load i32, i32* %flags_on, align 4
  %and610 = and i32 %387, 4
  %tobool611 = icmp ne i32 %and610, 0
  br i1 %tobool611, label %if.then614, label %lor.lhs.false612

lor.lhs.false612:                                 ; preds = %if.else609
  %388 = load i32, i32* %making_array_special, align 4
  %tobool613 = icmp ne i32 %388, 0
  br i1 %tobool613, label %if.then614, label %if.else627

if.then614:                                       ; preds = %lor.lhs.false612, %if.else609
  %389 = load i8*, i8** %name, align 4
  %call615 = call %struct.variable* @make_new_array_variable(i8* %389)
  store %struct.variable* %call615, %struct.variable** %var, align 4
  %390 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool616 = icmp ne %struct.variable* %390, null
  br i1 %tobool616, label %land.lhs.true617, label %if.end626

land.lhs.true617:                                 ; preds = %if.then614
  %391 = load i32, i32* %offset, align 4
  %cmp618 = icmp eq i32 %391, 0
  br i1 %cmp618, label %land.lhs.true620, label %if.end626

land.lhs.true620:                                 ; preds = %land.lhs.true617
  %392 = load i32, i32* @no_invisible_vars, align 4
  %cmp621 = icmp eq i32 %392, 0
  br i1 %cmp621, label %if.then623, label %if.end626

if.then623:                                       ; preds = %land.lhs.true620
  %393 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes624 = getelementptr inbounds %struct.variable, %struct.variable* %393, i32 0, i32 5
  %394 = load i32, i32* %attributes624, align 4
  %or625 = or i32 %394, 4096
  store i32 %or625, i32* %attributes624, align 4
  br label %if.end626

if.end626:                                        ; preds = %if.then623, %land.lhs.true620, %land.lhs.true617, %if.then614
  br label %if.end646

if.else627:                                       ; preds = %lor.lhs.false612
  %395 = load i32, i32* %mkglobal, align 4
  %tobool628 = icmp ne i32 %395, 0
  br i1 %tobool628, label %cond.true629, label %cond.false631

cond.true629:                                     ; preds = %if.else627
  %396 = load i8*, i8** %name, align 4
  %call630 = call %struct.variable* @bind_global_variable(i8* %396, i8* null, i32 32)
  br label %cond.end633

cond.false631:                                    ; preds = %if.else627
  %397 = load i8*, i8** %name, align 4
  %call632 = call %struct.variable* @bind_variable(i8* %397, i8* null, i32 32)
  br label %cond.end633

cond.end633:                                      ; preds = %cond.false631, %cond.true629
  %cond634 = phi %struct.variable* [ %call630, %cond.true629 ], [ %call632, %cond.false631 ]
  store %struct.variable* %cond634, %struct.variable** %var, align 4
  %398 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool635 = icmp ne %struct.variable* %398, null
  br i1 %tobool635, label %land.lhs.true636, label %if.end645

land.lhs.true636:                                 ; preds = %cond.end633
  %399 = load i32, i32* %offset, align 4
  %cmp637 = icmp eq i32 %399, 0
  br i1 %cmp637, label %land.lhs.true639, label %if.end645

land.lhs.true639:                                 ; preds = %land.lhs.true636
  %400 = load i32, i32* @no_invisible_vars, align 4
  %cmp640 = icmp eq i32 %400, 0
  br i1 %cmp640, label %if.then642, label %if.end645

if.then642:                                       ; preds = %land.lhs.true639
  %401 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes643 = getelementptr inbounds %struct.variable, %struct.variable* %401, i32 0, i32 5
  %402 = load i32, i32* %attributes643, align 4
  %or644 = or i32 %402, 4096
  store i32 %or644, i32* %attributes643, align 4
  br label %if.end645

if.end645:                                        ; preds = %if.then642, %land.lhs.true639, %land.lhs.true636, %cond.end633
  br label %if.end646

if.end646:                                        ; preds = %if.end645, %if.end626
  br label %if.end647

if.end647:                                        ; preds = %if.end646, %if.end608
  %403 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp648 = icmp eq %struct.variable* %403, null
  br i1 %cmp648, label %if.then650, label %if.end652

if.then650:                                       ; preds = %if.end647
  %404 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %404, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 678)
  %405 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next651 = getelementptr inbounds %struct.word_list, %struct.word_list* %405, i32 0, i32 0
  %406 = load %struct.word_list*, %struct.word_list** %next651, align 4
  store %struct.word_list* %406, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end652:                                        ; preds = %if.end647
  store i32 1, i32* %created_var, align 4
  br label %if.end728

if.else653:                                       ; preds = %land.end
  %407 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes654 = getelementptr inbounds %struct.variable, %struct.variable* %407, i32 0, i32 5
  %408 = load i32, i32* %attributes654, align 4
  %and655 = and i32 %408, 4
  %tobool656 = icmp ne i32 %and655, 0
  br i1 %tobool656, label %land.lhs.true661, label %lor.lhs.false657

lor.lhs.false657:                                 ; preds = %if.else653
  %409 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes658 = getelementptr inbounds %struct.variable, %struct.variable* %409, i32 0, i32 5
  %410 = load i32, i32* %attributes658, align 4
  %and659 = and i32 %410, 64
  %tobool660 = icmp ne i32 %and659, 0
  br i1 %tobool660, label %land.lhs.true661, label %if.else668

land.lhs.true661:                                 ; preds = %lor.lhs.false657, %if.else653
  %411 = load i32, i32* %flags_on, align 4
  %and662 = and i32 %411, 2048
  %tobool663 = icmp ne i32 %and662, 0
  br i1 %tobool663, label %if.then664, label %if.else668

if.then664:                                       ; preds = %land.lhs.true661
  %call665 = call i8* @libintl_gettext(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i32 0, i32 0))
  %412 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call665, i8* %412)
  %413 = load i32, i32* %assign_error, align 4
  %inc666 = add nsw i32 %413, 1
  store i32 %inc666, i32* %assign_error, align 4
  %414 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %414, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 687)
  %415 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next667 = getelementptr inbounds %struct.word_list, %struct.word_list* %415, i32 0, i32 0
  %416 = load %struct.word_list*, %struct.word_list** %next667, align 4
  store %struct.word_list* %416, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.else668:                                       ; preds = %land.lhs.true661, %lor.lhs.false657
  %417 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes669 = getelementptr inbounds %struct.variable, %struct.variable* %417, i32 0, i32 5
  %418 = load i32, i32* %attributes669, align 4
  %and670 = and i32 %418, 2048
  %tobool671 = icmp ne i32 %and670, 0
  br i1 %tobool671, label %land.lhs.true672, label %if.else690

land.lhs.true672:                                 ; preds = %if.else668
  %419 = load i32, i32* %flags_on, align 4
  %and673 = and i32 %419, 2048
  %cmp674 = icmp eq i32 %and673, 0
  br i1 %cmp674, label %land.lhs.true676, label %if.else690

land.lhs.true676:                                 ; preds = %land.lhs.true672
  %420 = load i32, i32* %flags_off, align 4
  %and677 = and i32 %420, 2048
  %cmp678 = icmp eq i32 %and677, 0
  br i1 %cmp678, label %land.lhs.true680, label %if.else690

land.lhs.true680:                                 ; preds = %land.lhs.true676
  %421 = load i32, i32* %offset, align 4
  %tobool681 = icmp ne i32 %421, 0
  br i1 %tobool681, label %land.lhs.true682, label %if.else690

land.lhs.true682:                                 ; preds = %land.lhs.true680
  %422 = load i8*, i8** %value, align 4
  %call683 = call i32 @valid_nameref_value(i8* %422, i32 1)
  %cmp684 = icmp eq i32 %call683, 0
  br i1 %cmp684, label %if.then686, label %if.else690

if.then686:                                       ; preds = %land.lhs.true682
  %call687 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.8, i32 0, i32 0))
  %423 = load i8*, i8** %value, align 4
  call void (i8*, ...) @builtin_error(i8* %call687, i8* %423)
  %424 = load i32, i32* %any_failed, align 4
  %inc688 = add nsw i32 %424, 1
  store i32 %inc688, i32* %any_failed, align 4
  %425 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %425, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 693)
  %426 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next689 = getelementptr inbounds %struct.word_list, %struct.word_list* %426, i32 0, i32 0
  %427 = load %struct.word_list*, %struct.word_list** %next689, align 4
  store %struct.word_list* %427, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.else690:                                       ; preds = %land.lhs.true682, %land.lhs.true680, %land.lhs.true676, %land.lhs.true672, %if.else668
  %428 = load i32, i32* %flags_on, align 4
  %and691 = and i32 %428, 2048
  %tobool692 = icmp ne i32 %and691, 0
  br i1 %tobool692, label %if.then693, label %if.end725

if.then693:                                       ; preds = %if.else690
  %429 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes694 = getelementptr inbounds %struct.variable, %struct.variable* %429, i32 0, i32 5
  %430 = load i32, i32* %attributes694, align 4
  %and695 = and i32 %430, 2048
  %cmp696 = icmp eq i32 %and695, 0
  br i1 %cmp696, label %land.lhs.true698, label %if.end715

land.lhs.true698:                                 ; preds = %if.then693
  %431 = load %struct.variable*, %struct.variable** %var, align 4
  %value699 = getelementptr inbounds %struct.variable, %struct.variable* %431, i32 0, i32 1
  %432 = load i8*, i8** %value699, align 4
  %cmp700 = icmp ne i8* %432, null
  br i1 %cmp700, label %land.lhs.true702, label %if.end715

land.lhs.true702:                                 ; preds = %land.lhs.true698
  %433 = load i32, i32* %offset, align 4
  %cmp703 = icmp eq i32 %433, 0
  br i1 %cmp703, label %land.lhs.true705, label %if.end715

land.lhs.true705:                                 ; preds = %land.lhs.true702
  %434 = load %struct.variable*, %struct.variable** %var, align 4
  %value706 = getelementptr inbounds %struct.variable, %struct.variable* %434, i32 0, i32 1
  %435 = load i8*, i8** %value706, align 4
  %call707 = call i32 @valid_nameref_value(i8* %435, i32 0)
  %cmp708 = icmp eq i32 %call707, 0
  br i1 %cmp708, label %if.then710, label %if.end715

if.then710:                                       ; preds = %land.lhs.true705
  %call711 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.8, i32 0, i32 0))
  %436 = load %struct.variable*, %struct.variable** %var, align 4
  %value712 = getelementptr inbounds %struct.variable, %struct.variable* %436, i32 0, i32 1
  %437 = load i8*, i8** %value712, align 4
  call void (i8*, ...) @builtin_error(i8* %call711, i8* %437)
  %438 = load i32, i32* %any_failed, align 4
  %inc713 = add nsw i32 %438, 1
  store i32 %inc713, i32* %any_failed, align 4
  %439 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %439, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 704)
  %440 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next714 = getelementptr inbounds %struct.word_list, %struct.word_list* %440, i32 0, i32 0
  %441 = load %struct.word_list*, %struct.word_list** %next714, align 4
  store %struct.word_list* %441, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end715:                                        ; preds = %land.lhs.true705, %land.lhs.true702, %land.lhs.true698, %if.then693
  %442 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes716 = getelementptr inbounds %struct.variable, %struct.variable* %442, i32 0, i32 5
  %443 = load i32, i32* %attributes716, align 4
  %and717 = and i32 %443, 2
  %tobool718 = icmp ne i32 %and717, 0
  br i1 %tobool718, label %if.then719, label %if.end722

if.then719:                                       ; preds = %if.end715
  %444 = load i8*, i8** %name, align 4
  call void @sh_readonly(i8* %444)
  %445 = load i32, i32* %any_failed, align 4
  %inc720 = add nsw i32 %445, 1
  store i32 %inc720, i32* %any_failed, align 4
  %446 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %446, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 711)
  %447 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next721 = getelementptr inbounds %struct.word_list, %struct.word_list* %447, i32 0, i32 0
  %448 = load %struct.word_list*, %struct.word_list** %next721, align 4
  store %struct.word_list* %448, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end722:                                        ; preds = %if.end715
  %449 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes723 = getelementptr inbounds %struct.variable, %struct.variable* %449, i32 0, i32 5
  %450 = load i32, i32* %attributes723, align 4
  %and724 = and i32 %450, -1809
  store i32 %and724, i32* %attributes723, align 4
  br label %if.end725

if.end725:                                        ; preds = %if.end722, %if.else690
  br label %if.end726

if.end726:                                        ; preds = %if.end725
  br label %if.end727

if.end727:                                        ; preds = %if.end726
  br label %if.end728

if.end728:                                        ; preds = %if.end727, %if.end652
  %451 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes729 = getelementptr inbounds %struct.variable, %struct.variable* %451, i32 0, i32 5
  %452 = load i32, i32* %attributes729, align 4
  %and730 = and i32 %452, 2
  %tobool731 = icmp ne i32 %and730, 0
  br i1 %tobool731, label %land.lhs.true732, label %if.end739

land.lhs.true732:                                 ; preds = %if.end728
  %453 = load i32, i32* %flags_off, align 4
  %and733 = and i32 %453, 2
  %tobool734 = icmp ne i32 %and733, 0
  br i1 %tobool734, label %if.then735, label %if.end739

if.then735:                                       ; preds = %land.lhs.true732
  %454 = load %struct.variable*, %struct.variable** %var, align 4
  %name736 = getelementptr inbounds %struct.variable, %struct.variable* %454, i32 0, i32 0
  %455 = load i8*, i8** %name736, align 4
  call void @sh_readonly(i8* %455)
  %456 = load i32, i32* %any_failed, align 4
  %inc737 = add nsw i32 %456, 1
  store i32 %inc737, i32* %any_failed, align 4
  %457 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %457, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 722)
  %458 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next738 = getelementptr inbounds %struct.word_list, %struct.word_list* %458, i32 0, i32 0
  %459 = load %struct.word_list*, %struct.word_list** %next738, align 4
  store %struct.word_list* %459, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end739:                                        ; preds = %land.lhs.true732, %if.end728
  %460 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes740 = getelementptr inbounds %struct.variable, %struct.variable* %460, i32 0, i32 5
  %461 = load i32, i32* %attributes740, align 4
  %and741 = and i32 %461, 2
  %tobool742 = icmp ne i32 %and741, 0
  br i1 %tobool742, label %land.lhs.true747, label %lor.lhs.false743

lor.lhs.false743:                                 ; preds = %if.end739
  %462 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes744 = getelementptr inbounds %struct.variable, %struct.variable* %462, i32 0, i32 5
  %463 = load i32, i32* %attributes744, align 4
  %and745 = and i32 %463, 16384
  %tobool746 = icmp ne i32 %and745, 0
  br i1 %tobool746, label %land.lhs.true747, label %if.end757

land.lhs.true747:                                 ; preds = %lor.lhs.false743, %if.end739
  %464 = load i32, i32* %offset, align 4
  %tobool748 = icmp ne i32 %464, 0
  br i1 %tobool748, label %if.then749, label %if.end757

if.then749:                                       ; preds = %land.lhs.true747
  %465 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes750 = getelementptr inbounds %struct.variable, %struct.variable* %465, i32 0, i32 5
  %466 = load i32, i32* %attributes750, align 4
  %and751 = and i32 %466, 2
  %tobool752 = icmp ne i32 %and751, 0
  br i1 %tobool752, label %if.then753, label %if.end754

if.then753:                                       ; preds = %if.then749
  %467 = load i8*, i8** %name, align 4
  call void @sh_readonly(i8* %467)
  br label %if.end754

if.end754:                                        ; preds = %if.then753, %if.then749
  %468 = load i32, i32* %assign_error, align 4
  %inc755 = add nsw i32 %468, 1
  store i32 %inc755, i32* %assign_error, align 4
  %469 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %469, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 732)
  %470 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next756 = getelementptr inbounds %struct.word_list, %struct.word_list* %470, i32 0, i32 0
  %471 = load %struct.word_list*, %struct.word_list** %next756, align 4
  store %struct.word_list* %471, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end757:                                        ; preds = %land.lhs.true747, %lor.lhs.false743
  %472 = load i32, i32* %array_subscript_assignment, align 4
  %tobool758 = icmp ne i32 %472, 0
  br i1 %tobool758, label %land.lhs.true759, label %if.else765

land.lhs.true759:                                 ; preds = %if.end757
  %473 = load i32, i32* %array_exists, align 4
  %tobool760 = icmp ne i32 %473, 0
  br i1 %tobool760, label %land.lhs.true761, label %if.else765

land.lhs.true761:                                 ; preds = %land.lhs.true759
  %474 = load i32, i32* %creating_array, align 4
  %cmp762 = icmp eq i32 %474, 0
  br i1 %cmp762, label %if.then764, label %if.else765

if.then764:                                       ; preds = %land.lhs.true761
  store i32 1, i32* %simple_array_assign, align 4
  br label %if.end852

if.else765:                                       ; preds = %land.lhs.true761, %land.lhs.true759, %if.end757
  %475 = load i32, i32* %making_array_special, align 4
  %tobool766 = icmp ne i32 %475, 0
  br i1 %tobool766, label %land.lhs.true771, label %lor.lhs.false767

lor.lhs.false767:                                 ; preds = %if.else765
  %476 = load i32, i32* %creating_array, align 4
  %tobool768 = icmp ne i32 %476, 0
  br i1 %tobool768, label %land.lhs.true771, label %lor.lhs.false769

lor.lhs.false769:                                 ; preds = %lor.lhs.false767
  %477 = load i32, i32* %array_exists, align 4
  %tobool770 = icmp ne i32 %477, 0
  br i1 %tobool770, label %land.lhs.true771, label %if.end851

land.lhs.true771:                                 ; preds = %lor.lhs.false769, %lor.lhs.false767, %if.else765
  %478 = load i32, i32* %offset, align 4
  %tobool772 = icmp ne i32 %478, 0
  br i1 %tobool772, label %if.then773, label %if.end851

if.then773:                                       ; preds = %land.lhs.true771
  %479 = load i8*, i8** %value, align 4
  %tobool774 = icmp ne i8* %479, null
  br i1 %tobool774, label %land.lhs.true775, label %cond.false795

land.lhs.true775:                                 ; preds = %if.then773
  %480 = load i8*, i8** %value, align 4
  %arrayidx776 = getelementptr inbounds i8, i8* %480, i32 0
  %481 = load i8, i8* %arrayidx776, align 1
  %conv777 = sext i8 %481 to i32
  %tobool778 = icmp ne i32 %conv777, 0
  br i1 %tobool778, label %cond.true779, label %cond.false795

cond.true779:                                     ; preds = %land.lhs.true775
  %482 = load i8*, i8** %value, align 4
  %arrayidx780 = getelementptr inbounds i8, i8* %482, i32 1
  %483 = load i8, i8* %arrayidx780, align 1
  %conv781 = sext i8 %483 to i32
  %tobool782 = icmp ne i32 %conv781, 0
  br i1 %tobool782, label %cond.true783, label %cond.false792

cond.true783:                                     ; preds = %cond.true779
  %484 = load i8*, i8** %value, align 4
  %arrayidx784 = getelementptr inbounds i8, i8* %484, i32 2
  %485 = load i8, i8* %arrayidx784, align 1
  %conv785 = sext i8 %485 to i32
  %tobool786 = icmp ne i32 %conv785, 0
  br i1 %tobool786, label %cond.true787, label %cond.false789

cond.true787:                                     ; preds = %cond.true783
  %486 = load i8*, i8** %value, align 4
  %call788 = call i32 @strlen(i8* %486)
  br label %cond.end790

cond.false789:                                    ; preds = %cond.true783
  br label %cond.end790

cond.end790:                                      ; preds = %cond.false789, %cond.true787
  %cond791 = phi i32 [ %call788, %cond.true787 ], [ 2, %cond.false789 ]
  br label %cond.end793

cond.false792:                                    ; preds = %cond.true779
  br label %cond.end793

cond.end793:                                      ; preds = %cond.false792, %cond.end790
  %cond794 = phi i32 [ %cond791, %cond.end790 ], [ 1, %cond.false792 ]
  br label %cond.end796

cond.false795:                                    ; preds = %land.lhs.true775, %if.then773
  br label %cond.end796

cond.end796:                                      ; preds = %cond.false795, %cond.end793
  %cond797 = phi i32 [ %cond794, %cond.end793 ], [ 0, %cond.false795 ]
  store i32 %cond797, i32* %vlen, align 4
  %487 = load i32, i32* @shell_compatibility_level, align 4
  %cmp798 = icmp sgt i32 %487, 43
  br i1 %cmp798, label %land.lhs.true800, label %if.else830

land.lhs.true800:                                 ; preds = %cond.end796
  %488 = load i32, i32* %wflags, align 4
  %and801 = and i32 %488, 32768
  %cmp802 = icmp eq i32 %and801, 0
  br i1 %cmp802, label %land.lhs.true804, label %if.else830

land.lhs.true804:                                 ; preds = %land.lhs.true800
  %489 = load i8*, i8** %value, align 4
  %arrayidx805 = getelementptr inbounds i8, i8* %489, i32 0
  %490 = load i8, i8* %arrayidx805, align 1
  %conv806 = sext i8 %490 to i32
  %cmp807 = icmp eq i32 %conv806, 40
  br i1 %cmp807, label %land.lhs.true809, label %if.else830

land.lhs.true809:                                 ; preds = %land.lhs.true804
  %491 = load i8*, i8** %value, align 4
  %492 = load i32, i32* %vlen, align 4
  %sub810 = sub nsw i32 %492, 1
  %arrayidx811 = getelementptr inbounds i8, i8* %491, i32 %sub810
  %493 = load i8, i8* %arrayidx811, align 1
  %conv812 = sext i8 %493 to i32
  %cmp813 = icmp eq i32 %conv812, 41
  br i1 %cmp813, label %if.then815, label %if.else830

if.then815:                                       ; preds = %land.lhs.true809
  %494 = load i32, i32* %array_exists, align 4
  %cmp816 = icmp eq i32 %494, 0
  br i1 %cmp816, label %land.lhs.true818, label %if.end825

land.lhs.true818:                                 ; preds = %if.then815
  %495 = load i32, i32* %creating_array, align 4
  %cmp819 = icmp eq i32 %495, 0
  br i1 %cmp819, label %if.then821, label %if.end825

if.then821:                                       ; preds = %land.lhs.true818
  %call822 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.14, i32 0, i32 0))
  %496 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word823 = getelementptr inbounds %struct.word_list, %struct.word_list* %496, i32 0, i32 1
  %497 = load %struct.word_desc*, %struct.word_desc** %word823, align 4
  %word824 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %497, i32 0, i32 0
  %498 = load i8*, i8** %word824, align 4
  call void (i8*, ...) @internal_warning(i8* %call822, i8* %498)
  br label %if.end825

if.end825:                                        ; preds = %if.then821, %land.lhs.true818, %if.then815
  %499 = load i32, i32* %array_exists, align 4
  %tobool826 = icmp ne i32 %499, 0
  br i1 %tobool826, label %lor.end829, label %lor.rhs827

lor.rhs827:                                       ; preds = %if.end825
  %500 = load i32, i32* %creating_array, align 4
  %tobool828 = icmp ne i32 %500, 0
  br label %lor.end829

lor.end829:                                       ; preds = %lor.rhs827, %if.end825
  %501 = phi i1 [ true, %if.end825 ], [ %tobool828, %lor.rhs827 ]
  %lor.ext = zext i1 %501 to i32
  store i32 %lor.ext, i32* %compound_array_assign, align 4
  %502 = load i32, i32* %making_array_special, align 4
  store i32 %502, i32* %simple_array_assign, align 4
  br label %if.end850

if.else830:                                       ; preds = %land.lhs.true809, %land.lhs.true804, %land.lhs.true800, %cond.end796
  %503 = load i8*, i8** %value, align 4
  %arrayidx831 = getelementptr inbounds i8, i8* %503, i32 0
  %504 = load i8, i8* %arrayidx831, align 1
  %conv832 = sext i8 %504 to i32
  %cmp833 = icmp eq i32 %conv832, 40
  br i1 %cmp833, label %land.lhs.true835, label %if.else848

land.lhs.true835:                                 ; preds = %if.else830
  %505 = load i8*, i8** %value, align 4
  %506 = load i32, i32* %vlen, align 4
  %sub836 = sub nsw i32 %506, 1
  %arrayidx837 = getelementptr inbounds i8, i8* %505, i32 %sub836
  %507 = load i8, i8* %arrayidx837, align 1
  %conv838 = sext i8 %507 to i32
  %cmp839 = icmp eq i32 %conv838, 41
  br i1 %cmp839, label %land.lhs.true841, label %if.else848

land.lhs.true841:                                 ; preds = %land.lhs.true835
  %508 = load i32, i32* @shell_compatibility_level, align 4
  %cmp842 = icmp slt i32 %508, 44
  br i1 %cmp842, label %if.then847, label %lor.lhs.false844

lor.lhs.false844:                                 ; preds = %land.lhs.true841
  %509 = load i32, i32* %wflags, align 4
  %and845 = and i32 %509, 32768
  %tobool846 = icmp ne i32 %and845, 0
  br i1 %tobool846, label %if.then847, label %if.else848

if.then847:                                       ; preds = %lor.lhs.false844, %land.lhs.true841
  store i32 1, i32* %compound_array_assign, align 4
  br label %if.end849

if.else848:                                       ; preds = %lor.lhs.false844, %land.lhs.true835, %if.else830
  store i32 1, i32* %simple_array_assign, align 4
  br label %if.end849

if.end849:                                        ; preds = %if.else848, %if.then847
  br label %if.end850

if.end850:                                        ; preds = %if.end849, %lor.end829
  br label %if.end851

if.end851:                                        ; preds = %if.end850, %land.lhs.true771, %lor.lhs.false769
  br label %if.end852

if.end852:                                        ; preds = %if.end851, %if.then764
  %510 = load i32, i32* %flags_off, align 4
  %and853 = and i32 %510, 4
  %tobool854 = icmp ne i32 %and853, 0
  br i1 %tobool854, label %land.lhs.true855, label %lor.lhs.false859

land.lhs.true855:                                 ; preds = %if.end852
  %511 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes856 = getelementptr inbounds %struct.variable, %struct.variable* %511, i32 0, i32 5
  %512 = load i32, i32* %attributes856, align 4
  %and857 = and i32 %512, 4
  %tobool858 = icmp ne i32 %and857, 0
  br i1 %tobool858, label %if.then866, label %lor.lhs.false859

lor.lhs.false859:                                 ; preds = %land.lhs.true855, %if.end852
  %513 = load i32, i32* %flags_off, align 4
  %and860 = and i32 %513, 64
  %tobool861 = icmp ne i32 %and860, 0
  br i1 %tobool861, label %land.lhs.true862, label %if.end870

land.lhs.true862:                                 ; preds = %lor.lhs.false859
  %514 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes863 = getelementptr inbounds %struct.variable, %struct.variable* %514, i32 0, i32 5
  %515 = load i32, i32* %attributes863, align 4
  %and864 = and i32 %515, 64
  %tobool865 = icmp ne i32 %and864, 0
  br i1 %tobool865, label %if.then866, label %if.end870

if.then866:                                       ; preds = %land.lhs.true862, %land.lhs.true855
  %call867 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i32 0, i32 0))
  %516 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call867, i8* %516)
  %517 = load i32, i32* %any_failed, align 4
  %inc868 = add nsw i32 %517, 1
  store i32 %inc868, i32* %any_failed, align 4
  %518 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %518, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 769)
  %519 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next869 = getelementptr inbounds %struct.word_list, %struct.word_list* %519, i32 0, i32 0
  %520 = load %struct.word_list*, %struct.word_list** %next869, align 4
  store %struct.word_list* %520, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end870:                                        ; preds = %land.lhs.true862, %lor.lhs.false859
  %521 = load i32, i32* %flags_on, align 4
  %and871 = and i32 %521, 4
  %tobool872 = icmp ne i32 %and871, 0
  br i1 %tobool872, label %land.lhs.true873, label %if.end881

land.lhs.true873:                                 ; preds = %if.end870
  %522 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes874 = getelementptr inbounds %struct.variable, %struct.variable* %522, i32 0, i32 5
  %523 = load i32, i32* %attributes874, align 4
  %and875 = and i32 %523, 64
  %tobool876 = icmp ne i32 %and875, 0
  br i1 %tobool876, label %if.then877, label %if.end881

if.then877:                                       ; preds = %land.lhs.true873
  %call878 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.16, i32 0, i32 0))
  %524 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call878, i8* %524)
  %525 = load i32, i32* %any_failed, align 4
  %inc879 = add nsw i32 %525, 1
  store i32 %inc879, i32* %any_failed, align 4
  %526 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %526, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 776)
  %527 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next880 = getelementptr inbounds %struct.word_list, %struct.word_list* %527, i32 0, i32 0
  %528 = load %struct.word_list*, %struct.word_list** %next880, align 4
  store %struct.word_list* %528, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end881:                                        ; preds = %land.lhs.true873, %if.end870
  %529 = load i32, i32* %flags_on, align 4
  %and882 = and i32 %529, 64
  %tobool883 = icmp ne i32 %and882, 0
  br i1 %tobool883, label %land.lhs.true884, label %if.end892

land.lhs.true884:                                 ; preds = %if.end881
  %530 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes885 = getelementptr inbounds %struct.variable, %struct.variable* %530, i32 0, i32 5
  %531 = load i32, i32* %attributes885, align 4
  %and886 = and i32 %531, 4
  %tobool887 = icmp ne i32 %and886, 0
  br i1 %tobool887, label %if.then888, label %if.end892

if.then888:                                       ; preds = %land.lhs.true884
  %call889 = call i8* @libintl_gettext(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.17, i32 0, i32 0))
  %532 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call889, i8* %532)
  %533 = load i32, i32* %any_failed, align 4
  %inc890 = add nsw i32 %533, 1
  store i32 %inc890, i32* %any_failed, align 4
  %534 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %534, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 782)
  %535 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next891 = getelementptr inbounds %struct.word_list, %struct.word_list* %535, i32 0, i32 0
  %536 = load %struct.word_list*, %struct.word_list** %next891, align 4
  store %struct.word_list* %536, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end892:                                        ; preds = %land.lhs.true884, %if.end881
  %537 = load i32, i32* %flags_on, align 4
  %and893 = and i32 %537, 64
  %tobool894 = icmp ne i32 %and893, 0
  br i1 %tobool894, label %if.then895, label %if.else903

if.then895:                                       ; preds = %if.end892
  %538 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes896 = getelementptr inbounds %struct.variable, %struct.variable* %538, i32 0, i32 5
  %539 = load i32, i32* %attributes896, align 4
  %and897 = and i32 %539, 64
  %cmp898 = icmp eq i32 %and897, 0
  br i1 %cmp898, label %if.then900, label %if.end902

if.then900:                                       ; preds = %if.then895
  %540 = load %struct.variable*, %struct.variable** %var, align 4
  %call901 = call %struct.variable* @convert_var_to_assoc(%struct.variable* %540)
  store %struct.variable* %call901, %struct.variable** %var, align 4
  br label %if.end902

if.end902:                                        ; preds = %if.then900, %if.then895
  br label %if.end921

if.else903:                                       ; preds = %if.end892
  %541 = load i32, i32* %making_array_special, align 4
  %tobool904 = icmp ne i32 %541, 0
  br i1 %tobool904, label %land.lhs.true908, label %lor.lhs.false905

lor.lhs.false905:                                 ; preds = %if.else903
  %542 = load i32, i32* %flags_on, align 4
  %and906 = and i32 %542, 4
  %tobool907 = icmp ne i32 %and906, 0
  br i1 %tobool907, label %land.lhs.true908, label %if.end920

land.lhs.true908:                                 ; preds = %lor.lhs.false905, %if.else903
  %543 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes909 = getelementptr inbounds %struct.variable, %struct.variable* %543, i32 0, i32 5
  %544 = load i32, i32* %attributes909, align 4
  %and910 = and i32 %544, 4
  %cmp911 = icmp eq i32 %and910, 0
  br i1 %cmp911, label %land.lhs.true913, label %if.end920

land.lhs.true913:                                 ; preds = %land.lhs.true908
  %545 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes914 = getelementptr inbounds %struct.variable, %struct.variable* %545, i32 0, i32 5
  %546 = load i32, i32* %attributes914, align 4
  %and915 = and i32 %546, 64
  %cmp916 = icmp eq i32 %and915, 0
  br i1 %cmp916, label %if.then918, label %if.end920

if.then918:                                       ; preds = %land.lhs.true913
  %547 = load %struct.variable*, %struct.variable** %var, align 4
  %call919 = call %struct.variable* @convert_var_to_array(%struct.variable* %547)
  store %struct.variable* %call919, %struct.variable** %var, align 4
  br label %if.end920

if.end920:                                        ; preds = %if.then918, %land.lhs.true913, %land.lhs.true908, %lor.lhs.false905
  br label %if.end921

if.end921:                                        ; preds = %if.end920, %if.end902
  %548 = load i32, i32* %flags_on, align 4
  %and922 = and i32 %548, 2048
  store i32 %and922, i32* %onref, align 4
  %549 = load i32, i32* %flags_on, align 4
  %and923 = and i32 %549, -2049
  store i32 %and923, i32* %flags_on, align 4
  %550 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes924 = getelementptr inbounds %struct.variable, %struct.variable* %550, i32 0, i32 5
  %551 = load i32, i32* %attributes924, align 4
  %and925 = and i32 %551, 4
  %tobool926 = icmp ne i32 %and925, 0
  br i1 %tobool926, label %if.then937, label %lor.lhs.false927

lor.lhs.false927:                                 ; preds = %if.end921
  %552 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes928 = getelementptr inbounds %struct.variable, %struct.variable* %552, i32 0, i32 5
  %553 = load i32, i32* %attributes928, align 4
  %and929 = and i32 %553, 64
  %tobool930 = icmp ne i32 %and929, 0
  br i1 %tobool930, label %if.then937, label %lor.lhs.false931

lor.lhs.false931:                                 ; preds = %lor.lhs.false927
  %554 = load i32, i32* %offset, align 4
  %tobool932 = icmp ne i32 %554, 0
  br i1 %tobool932, label %land.lhs.true933, label %lor.lhs.false935

land.lhs.true933:                                 ; preds = %lor.lhs.false931
  %555 = load i32, i32* %compound_array_assign, align 4
  %tobool934 = icmp ne i32 %555, 0
  br i1 %tobool934, label %if.then937, label %lor.lhs.false935

lor.lhs.false935:                                 ; preds = %land.lhs.true933, %lor.lhs.false931
  %556 = load i32, i32* %simple_array_assign, align 4
  %tobool936 = icmp ne i32 %556, 0
  br i1 %tobool936, label %if.then937, label %if.end938

if.then937:                                       ; preds = %lor.lhs.false935, %land.lhs.true933, %lor.lhs.false927, %if.end921
  store i32 0, i32* %onref, align 4
  br label %if.end938

if.end938:                                        ; preds = %if.then937, %lor.lhs.false935
  %557 = load i32, i32* %flags_off, align 4
  %and939 = and i32 %557, 2048
  store i32 %and939, i32* %offref, align 4
  %558 = load i32, i32* %flags_off, align 4
  %and940 = and i32 %558, -2049
  store i32 %and940, i32* %flags_off, align 4
  %559 = load i32, i32* %flags_on, align 4
  %560 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes941 = getelementptr inbounds %struct.variable, %struct.variable* %560, i32 0, i32 5
  %561 = load i32, i32* %attributes941, align 4
  %or942 = or i32 %561, %559
  store i32 %or942, i32* %attributes941, align 4
  %562 = load i32, i32* %flags_off, align 4
  %neg943 = xor i32 %562, -1
  %563 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes944 = getelementptr inbounds %struct.variable, %struct.variable* %563, i32 0, i32 5
  %564 = load i32, i32* %attributes944, align 4
  %and945 = and i32 %564, %neg943
  store i32 %and945, i32* %attributes944, align 4
  %565 = load i32, i32* %offset, align 4
  %tobool946 = icmp ne i32 %565, 0
  br i1 %tobool946, label %land.lhs.true947, label %if.else952

land.lhs.true947:                                 ; preds = %if.end938
  %566 = load i32, i32* %compound_array_assign, align 4
  %tobool948 = icmp ne i32 %566, 0
  br i1 %tobool948, label %if.then949, label %if.else952

if.then949:                                       ; preds = %land.lhs.true947
  %567 = load %struct.variable*, %struct.variable** %var, align 4
  %568 = load i8*, i8** %value, align 4
  %569 = load i32, i32* %aflags, align 4
  %or950 = or i32 %569, 32
  %call951 = call %struct.variable* @assign_array_var_from_string(%struct.variable* %567, i8* %568, i32 %or950)
  br label %if.end1026

if.else952:                                       ; preds = %land.lhs.true947, %if.end938
  %570 = load i32, i32* %simple_array_assign, align 4
  %tobool953 = icmp ne i32 %570, 0
  br i1 %tobool953, label %land.lhs.true954, label %if.else967

land.lhs.true954:                                 ; preds = %if.else952
  %571 = load i8*, i8** %subscript_start, align 4
  %tobool955 = icmp ne i8* %571, null
  br i1 %tobool955, label %if.then956, label %if.else967

if.then956:                                       ; preds = %land.lhs.true954
  %572 = load i8*, i8** %subscript_start, align 4
  store i8 91, i8* %572, align 1
  %573 = load i8*, i8** %name, align 4
  %574 = load i8*, i8** %value, align 4
  %575 = load i32, i32* %aflags, align 4
  %and957 = and i32 %575, 1
  %call958 = call %struct.variable* @assign_array_element(i8* %573, i8* %574, i32 %and957)
  store %struct.variable* %call958, %struct.variable** %var, align 4
  %576 = load i8*, i8** %subscript_start, align 4
  store i8 0, i8* %576, align 1
  %577 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp959 = icmp eq %struct.variable* %577, null
  br i1 %cmp959, label %if.then961, label %if.end966

if.then961:                                       ; preds = %if.then956
  %578 = load i32, i32* %assign_error, align 4
  %inc962 = add nsw i32 %578, 1
  store i32 %inc962, i32* %assign_error, align 4
  %579 = load i32, i32* %onref, align 4
  %580 = load i32, i32* %flags_on, align 4
  %or963 = or i32 %580, %579
  store i32 %or963, i32* %flags_on, align 4
  %581 = load i32, i32* %offref, align 4
  %582 = load i32, i32* %flags_off, align 4
  %or964 = or i32 %582, %581
  store i32 %or964, i32* %flags_off, align 4
  %583 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %583, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 834)
  %584 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next965 = getelementptr inbounds %struct.word_list, %struct.word_list* %584, i32 0, i32 0
  %585 = load %struct.word_list*, %struct.word_list** %next965, align 4
  store %struct.word_list* %585, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end966:                                        ; preds = %if.then956
  br label %if.end1025

if.else967:                                       ; preds = %land.lhs.true954, %if.else952
  %586 = load i32, i32* %simple_array_assign, align 4
  %tobool968 = icmp ne i32 %586, 0
  br i1 %tobool968, label %if.then969, label %if.else982

if.then969:                                       ; preds = %if.else967
  %587 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes970 = getelementptr inbounds %struct.variable, %struct.variable* %587, i32 0, i32 5
  %588 = load i32, i32* %attributes970, align 4
  %and971 = and i32 %588, 64
  %tobool972 = icmp ne i32 %and971, 0
  br i1 %tobool972, label %if.then973, label %if.else978

if.then973:                                       ; preds = %if.then969
  %589 = load %struct.variable*, %struct.variable** %var, align 4
  %590 = load i8*, i8** %name, align 4
  %call974 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 841)
  %call975 = call i8* @strcpy(i8* %call974, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i32 0, i32 0))
  %591 = load i8*, i8** %value, align 4
  %592 = load i32, i32* %aflags, align 4
  %or976 = or i32 %592, 32
  %call977 = call %struct.variable* @bind_assoc_variable(%struct.variable* %589, i8* %590, i8* %call975, i8* %591, i32 %or976)
  br label %if.end981

if.else978:                                       ; preds = %if.then969
  %593 = load i8*, i8** %name, align 4
  %594 = load i8*, i8** %value, align 4
  %595 = load i32, i32* %aflags, align 4
  %or979 = or i32 %595, 32
  %call980 = call %struct.variable* @bind_array_variable(i8* %593, i64 0, i8* %594, i32 %or979)
  br label %if.end981

if.end981:                                        ; preds = %if.else978, %if.then973
  br label %if.end1024

if.else982:                                       ; preds = %if.else967
  %596 = load i32, i32* %offset, align 4
  %tobool983 = icmp ne i32 %596, 0
  br i1 %tobool983, label %if.then984, label %if.end1023

if.then984:                                       ; preds = %if.else982
  %597 = load i32, i32* %onref, align 4
  %tobool985 = icmp ne i32 %597, 0
  br i1 %tobool985, label %if.then990, label %lor.lhs.false986

lor.lhs.false986:                                 ; preds = %if.then984
  %598 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes987 = getelementptr inbounds %struct.variable, %struct.variable* %598, i32 0, i32 5
  %599 = load i32, i32* %attributes987, align 4
  %and988 = and i32 %599, 2048
  %tobool989 = icmp ne i32 %and988, 0
  br i1 %tobool989, label %if.then990, label %if.end992

if.then990:                                       ; preds = %lor.lhs.false986, %if.then984
  %600 = load i32, i32* %aflags, align 4
  %or991 = or i32 %600, 16
  store i32 %or991, i32* %aflags, align 4
  br label %if.end992

if.end992:                                        ; preds = %if.then990, %lor.lhs.false986
  %601 = load %struct.variable*, %struct.variable** %var, align 4
  %602 = load i8*, i8** %value, align 4
  %603 = load i32, i32* %aflags, align 4
  %call993 = call %struct.variable* @bind_variable_value(%struct.variable* %601, i8* %602, i32 %603)
  store %struct.variable* %call993, %struct.variable** %v, align 4
  %604 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp994 = icmp eq %struct.variable* %604, null
  br i1 %cmp994, label %land.lhs.true996, label %if.end1022

land.lhs.true996:                                 ; preds = %if.end992
  %605 = load i32, i32* %onref, align 4
  %tobool997 = icmp ne i32 %605, 0
  br i1 %tobool997, label %if.then1002, label %lor.lhs.false998

lor.lhs.false998:                                 ; preds = %land.lhs.true996
  %606 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes999 = getelementptr inbounds %struct.variable, %struct.variable* %606, i32 0, i32 5
  %607 = load i32, i32* %attributes999, align 4
  %and1000 = and i32 %607, 2048
  %tobool1001 = icmp ne i32 %and1000, 0
  br i1 %tobool1001, label %if.then1002, label %if.end1022

if.then1002:                                      ; preds = %lor.lhs.false998, %land.lhs.true996
  %608 = load i8*, i8** %value, align 4
  %call1003 = call i32 @valid_nameref_value(i8* %608, i32 1)
  %cmp1004 = icmp eq i32 %call1003, 0
  br i1 %cmp1004, label %if.then1006, label %if.end1007

if.then1006:                                      ; preds = %if.then1002
  %609 = load i8*, i8** %value, align 4
  call void @sh_invalidid(i8* %609)
  br label %if.end1007

if.end1007:                                       ; preds = %if.then1006, %if.then1002
  %610 = load i32, i32* %assign_error, align 4
  %inc1008 = add nsw i32 %610, 1
  store i32 %inc1008, i32* %assign_error, align 4
  %611 = load i32, i32* %created_var, align 4
  %tobool1009 = icmp ne i32 %611, 0
  br i1 %tobool1009, label %if.then1010, label %if.end1018

if.then1010:                                      ; preds = %if.end1007
  %612 = load %struct.variable*, %struct.variable** %var, align 4
  %name1011 = getelementptr inbounds %struct.variable, %struct.variable* %612, i32 0, i32 0
  %613 = load i8*, i8** %name1011, align 4
  %614 = load i32, i32* %mkglobal, align 4
  %tobool1012 = icmp ne i32 %614, 0
  br i1 %tobool1012, label %cond.true1013, label %cond.false1014

cond.true1013:                                    ; preds = %if.then1010
  %615 = load %struct.var_context*, %struct.var_context** @global_variables, align 4
  br label %cond.end1015

cond.false1014:                                   ; preds = %if.then1010
  %616 = load %struct.var_context*, %struct.var_context** @shell_variables, align 4
  br label %cond.end1015

cond.end1015:                                     ; preds = %cond.false1014, %cond.true1013
  %cond1016 = phi %struct.var_context* [ %615, %cond.true1013 ], [ %616, %cond.false1014 ]
  %call1017 = call i32 @delete_var(i8* %613, %struct.var_context* %cond1016)
  br label %if.end1018

if.end1018:                                       ; preds = %cond.end1015, %if.end1007
  %617 = load i32, i32* %onref, align 4
  %618 = load i32, i32* %flags_on, align 4
  %or1019 = or i32 %618, %617
  store i32 %or1019, i32* %flags_on, align 4
  %619 = load i32, i32* %offref, align 4
  %620 = load i32, i32* %flags_off, align 4
  %or1020 = or i32 %620, %619
  store i32 %or1020, i32* %flags_off, align 4
  %621 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %621, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 865)
  %622 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next1021 = getelementptr inbounds %struct.word_list, %struct.word_list* %622, i32 0, i32 0
  %623 = load %struct.word_list*, %struct.word_list** %next1021, align 4
  store %struct.word_list* %623, %struct.word_list** %list.addr, align 4
  br label %while.cond98

if.end1022:                                       ; preds = %lor.lhs.false998, %if.end992
  br label %if.end1023

if.end1023:                                       ; preds = %if.end1022, %if.else982
  br label %if.end1024

if.end1024:                                       ; preds = %if.end1023, %if.end981
  br label %if.end1025

if.end1025:                                       ; preds = %if.end1024, %if.end966
  br label %if.end1026

if.end1026:                                       ; preds = %if.end1025, %if.then949
  %624 = load i32, i32* %flags_on, align 4
  %and1027 = and i32 %624, 3
  %tobool1028 = icmp ne i32 %and1027, 0
  br i1 %tobool1028, label %land.lhs.true1029, label %if.end1069

land.lhs.true1029:                                ; preds = %if.end1026
  %625 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1030 = getelementptr inbounds %struct.variable, %struct.variable* %625, i32 0, i32 5
  %626 = load i32, i32* %attributes1030, align 4
  %and1031 = and i32 %626, 1048576
  %tobool1032 = icmp ne i32 %and1031, 0
  br i1 %tobool1032, label %if.then1033, label %if.end1069

if.then1033:                                      ; preds = %land.lhs.true1029
  %627 = load %struct.variable*, %struct.variable** %var, align 4
  %name1034 = getelementptr inbounds %struct.variable, %struct.variable* %627, i32 0, i32 0
  %628 = load i8*, i8** %name1034, align 4
  %call1035 = call %struct.variable* @find_tempenv_variable(i8* %628)
  store %struct.variable* %call1035, %struct.variable** %tv, align 4
  %629 = load %struct.variable*, %struct.variable** %tv, align 4
  %tobool1036 = icmp ne %struct.variable* %629, null
  br i1 %tobool1036, label %if.then1037, label %if.end1066

if.then1037:                                      ; preds = %if.then1033
  %630 = load %struct.variable*, %struct.variable** %var, align 4
  %value1038 = getelementptr inbounds %struct.variable, %struct.variable* %630, i32 0, i32 1
  %631 = load i8*, i8** %value1038, align 4
  %cmp1039 = icmp ne i8* %631, null
  br i1 %cmp1039, label %cond.true1041, label %cond.false1048

cond.true1041:                                    ; preds = %if.then1037
  %632 = load %struct.variable*, %struct.variable** %var, align 4
  %value1042 = getelementptr inbounds %struct.variable, %struct.variable* %632, i32 0, i32 1
  %633 = load i8*, i8** %value1042, align 4
  %call1043 = call i32 @strlen(i8* %633)
  %add1044 = add i32 1, %call1043
  %call1045 = call i8* @sh_xmalloc(i32 %add1044, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 886)
  %634 = load %struct.variable*, %struct.variable** %var, align 4
  %value1046 = getelementptr inbounds %struct.variable, %struct.variable* %634, i32 0, i32 1
  %635 = load i8*, i8** %value1046, align 4
  %call1047 = call i8* @strcpy(i8* %call1045, i8* %635)
  br label %cond.end1051

cond.false1048:                                   ; preds = %if.then1037
  %call1049 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 886)
  %call1050 = call i8* @strcpy(i8* %call1049, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0))
  br label %cond.end1051

cond.end1051:                                     ; preds = %cond.false1048, %cond.true1041
  %cond1052 = phi i8* [ %call1047, %cond.true1041 ], [ %call1050, %cond.false1048 ]
  store i8* %cond1052, i8** %tvalue, align 4
  %636 = load %struct.variable*, %struct.variable** %var, align 4
  %name1053 = getelementptr inbounds %struct.variable, %struct.variable* %636, i32 0, i32 0
  %637 = load i8*, i8** %name1053, align 4
  %638 = load i8*, i8** %tvalue, align 4
  %call1054 = call %struct.variable* @bind_variable(i8* %637, i8* %638, i32 0)
  store %struct.variable* %call1054, %struct.variable** %tv, align 4
  %639 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1055 = getelementptr inbounds %struct.variable, %struct.variable* %639, i32 0, i32 5
  %640 = load i32, i32* %attributes1055, align 4
  %and1056 = and i32 %640, -1048577
  %641 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes1057 = getelementptr inbounds %struct.variable, %struct.variable* %641, i32 0, i32 5
  %642 = load i32, i32* %attributes1057, align 4
  %or1058 = or i32 %642, %and1056
  store i32 %or1058, i32* %attributes1057, align 4
  %643 = load %struct.variable*, %struct.variable** %tv, align 4
  %context1059 = getelementptr inbounds %struct.variable, %struct.variable* %643, i32 0, i32 6
  %644 = load i32, i32* %context1059, align 4
  %cmp1060 = icmp sgt i32 %644, 0
  br i1 %cmp1060, label %if.then1062, label %if.end1065

if.then1062:                                      ; preds = %cond.end1051
  %645 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes1063 = getelementptr inbounds %struct.variable, %struct.variable* %645, i32 0, i32 5
  %646 = load i32, i32* %attributes1063, align 4
  %or1064 = or i32 %646, 2097152
  store i32 %or1064, i32* %attributes1063, align 4
  br label %if.end1065

if.end1065:                                       ; preds = %if.then1062, %cond.end1051
  %647 = load i8*, i8** %tvalue, align 4
  call void @sh_xfree(i8* %647, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 891)
  br label %if.end1066

if.end1066:                                       ; preds = %if.end1065, %if.then1033
  %648 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1067 = getelementptr inbounds %struct.variable, %struct.variable* %648, i32 0, i32 5
  %649 = load i32, i32* %attributes1067, align 4
  %or1068 = or i32 %649, 2097152
  store i32 %or1068, i32* %attributes1067, align 4
  br label %if.end1069

if.end1069:                                       ; preds = %if.end1066, %land.lhs.true1029, %if.end1026
  br label %if.end1070

if.end1070:                                       ; preds = %if.end1069
  %650 = load i32, i32* %onref, align 4
  %651 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1071 = getelementptr inbounds %struct.variable, %struct.variable* %651, i32 0, i32 5
  %652 = load i32, i32* %attributes1071, align 4
  %or1072 = or i32 %652, %650
  store i32 %or1072, i32* %attributes1071, align 4
  %653 = load i32, i32* %onref, align 4
  %654 = load i32, i32* %flags_on, align 4
  %or1073 = or i32 %654, %653
  store i32 %or1073, i32* %flags_on, align 4
  %655 = load i32, i32* %offref, align 4
  %neg1074 = xor i32 %655, -1
  %656 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes1075 = getelementptr inbounds %struct.variable, %struct.variable* %656, i32 0, i32 5
  %657 = load i32, i32* %attributes1075, align 4
  %and1076 = and i32 %657, %neg1074
  store i32 %and1076, i32* %attributes1075, align 4
  %658 = load i32, i32* %offref, align 4
  %659 = load i32, i32* %flags_off, align 4
  %or1077 = or i32 %659, %658
  store i32 %or1077, i32* %flags_off, align 4
  %660 = load %struct.variable*, %struct.variable** %refvar, align 4
  %tobool1078 = icmp ne %struct.variable* %660, null
  br i1 %tobool1078, label %if.then1079, label %if.end1088

if.then1079:                                      ; preds = %if.end1070
  %661 = load i32, i32* %flags_off, align 4
  %and1080 = and i32 %661, 2
  %tobool1081 = icmp ne i32 %and1080, 0
  br i1 %tobool1081, label %if.then1082, label %if.end1084

if.then1082:                                      ; preds = %if.then1079
  %662 = load i32, i32* %flags_off, align 4
  %and1083 = and i32 %662, -3
  store i32 %and1083, i32* %flags_off, align 4
  br label %if.end1084

if.end1084:                                       ; preds = %if.then1082, %if.then1079
  %663 = load i32, i32* %flags_off, align 4
  %neg1085 = xor i32 %663, -1
  %664 = load %struct.variable*, %struct.variable** %refvar, align 4
  %attributes1086 = getelementptr inbounds %struct.variable, %struct.variable* %664, i32 0, i32 5
  %665 = load i32, i32* %attributes1086, align 4
  %and1087 = and i32 %665, %neg1085
  store i32 %and1087, i32* %attributes1086, align 4
  br label %if.end1088

if.end1088:                                       ; preds = %if.end1084, %if.end1070
  %666 = load i8*, i8** %name, align 4
  call void @stupidly_hack_special_variables(i8* %666)
  %667 = load i8*, i8** %name, align 4
  call void @sh_xfree(i8* %667, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0), i32 917)
  %668 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next1089 = getelementptr inbounds %struct.word_list, %struct.word_list* %668, i32 0, i32 0
  %669 = load %struct.word_list*, %struct.word_list** %next1089, align 4
  store %struct.word_list* %669, %struct.word_list** %list.addr, align 4
  br label %while.cond98

while.end1090:                                    ; preds = %while.cond98
  %670 = load i32, i32* %assign_error, align 4
  %tobool1091 = icmp ne i32 %670, 0
  br i1 %tobool1091, label %cond.true1092, label %cond.false1093

cond.true1092:                                    ; preds = %while.end1090
  br label %cond.end1097

cond.false1093:                                   ; preds = %while.end1090
  %671 = load i32, i32* %any_failed, align 4
  %cmp1094 = icmp eq i32 %671, 0
  %cond1096 = select i1 %cmp1094, i32 0, i32 1
  br label %cond.end1097

cond.end1097:                                     ; preds = %cond.false1093, %cond.true1092
  %cond1098 = phi i32 [ 260, %cond.true1092 ], [ %cond1096, %cond.false1093 ]
  store i32 %cond1098, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end1097, %if.then313, %for.end93, %if.end69, %if.then63, %sw.default, %sw.bb43
  %672 = load i32, i32* %retval, align 4
  ret i32 %672
}

; Function Attrs: noinline nounwind
define i32 @local_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @variable_context, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @declare_internal(%struct.word_list* %1, i32 1)
  store i32 %call, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call1)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare %struct.variable** @all_local_variables() #1

declare void @print_assignment(%struct.variable*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @show_all_var_attributes(i32, i32) #1

declare i32 @set_builtin(%struct.word_list*) #1

declare i32 @set_or_show_attributes(%struct.word_list*, i32, i32) #1

declare i32 @sh_chkwrite(i32) #1

declare i32 @show_func_attributes(i8*, i32) #1

declare i32 @show_name_attributes(i8*, i32) #1

declare void @sh_notfound(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @assignment(i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare %struct.variable* @make_local_variable(i8*) #1

declare i8* @get_current_options() #1

declare i32 @valid_array_reference(i8*, i32) #1

declare i32 @check_selfref(i8*, i8*, i32) #1

declare void @builtin_warning(i8*, ...) #1

declare i32 @valid_nameref_value(i8*, i32) #1

declare i8* @strchr(i8*, i32) #1

declare void @sh_invalidid(i8*) #1

declare i32 @legal_identifier(i8*) #1

declare %struct.variable* @make_local_assoc_variable(i8*) #1

declare %struct.variable* @make_local_array_variable(i8*, i32) #1

declare %struct.variable* @find_variable_last_nameref(i8*, i32) #1

declare %struct.variable* @find_variable(i8*) #1

declare void @sh_readonly(i8*) #1

declare %struct.variable* @find_function(i8*) #1

declare %struct.function_def* @find_function_def(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i8* @named_function_string(i8*, %struct.command*, i32) #1

declare %struct.variable* @find_global_variable_noref(i8*) #1

declare %struct.variable* @find_variable_noref(i8*) #1

declare %struct.variable* @find_global_variable_last_nameref(i8*, i32) #1

declare %struct.variable* @find_global_variable(i8*) #1

declare void @internal_warning(i8*, ...) #1

declare %struct.variable* @make_new_assoc_variable(i8*) #1

declare %struct.variable* @make_new_array_variable(i8*) #1

declare %struct.variable* @bind_global_variable(i8*, i8*, i32) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare %struct.variable* @convert_var_to_assoc(%struct.variable*) #1

declare %struct.variable* @convert_var_to_array(%struct.variable*) #1

declare %struct.variable* @assign_array_var_from_string(%struct.variable*, i8*, i32) #1

declare %struct.variable* @assign_array_element(i8*, i8*, i32) #1

declare %struct.variable* @bind_assoc_variable(%struct.variable*, i8*, i8*, i8*, i32) #1

declare %struct.variable* @bind_array_variable(i8*, i64, i8*, i32) #1

declare %struct.variable* @bind_variable_value(%struct.variable*, i8*, i32) #1

declare i32 @delete_var(i8*, %struct.var_context*) #1

declare %struct.variable* @find_tempenv_variable(i8*) #1

declare void @stupidly_hack_special_variables(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
