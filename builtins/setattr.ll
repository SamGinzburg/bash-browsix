; ModuleID = 'setattr.c'
source_filename = "setattr.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }

@.str = private unnamed_addr constant [6 x i8] c"aAfnp\00", align 1
@loptend = external global %struct.word_list*, align 4
@array_needs_making = external global i32, align 4
@.str.1 = private unnamed_addr constant [19 x i8] c"%s: not a function\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"%s: cannot export\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"./setattr.def\00", align 1
@this_shell_builtin = external global i32 (%struct.word_list*)*, align 4
@posixly_correct = external global i32, align 4
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"declare -%s \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"%s -%s \00", align 1
@this_command_name = external global i8*, align 4
@.str.8 = private unnamed_addr constant [4 x i8] c"%s \00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"%s=%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@nameref_invalid_value = external global %struct.variable, align 4
@no_invisible_vars = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @export_builtin(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @set_or_show_attributes(%struct.word_list* %0, i32 1, i32 0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @set_or_show_attributes(%struct.word_list* %list, i32 %attribute, i32 %nodefs) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %attribute.addr = alloca i32, align 4
  %nodefs.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %assign = alloca i32, align 4
  %undo = alloca i32, align 4
  %any_failed = alloca i32, align 4
  %assign_error = alloca i32, align 4
  %opt = alloca i32, align 4
  %functions_only = alloca i32, align 4
  %arrays_only = alloca i32, align 4
  %assoc_only = alloca i32, align 4
  %aflags = alloca i32, align 4
  %name = alloca i8*, align 4
  %nlist = alloca %struct.word_list*, align 4
  %tlist = alloca %struct.word_list*, align 4
  %w = alloca %struct.word_desc*, align 4
  %optw = alloca [8 x i8], align 1
  %opti = alloca i32, align 4
  %variable_list = alloca %struct.variable**, align 4
  %i = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 %attribute, i32* %attribute.addr, align 4
  store i32 %nodefs, i32* %nodefs.addr, align 4
  store i32 0, i32* %assoc_only, align 4
  store i32 0, i32* %arrays_only, align 4
  store i32 0, i32* %functions_only, align 4
  store i32 0, i32* %assign_error, align 4
  store i32 0, i32* %any_failed, align 4
  store i32 0, i32* %undo, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 110, label %sw.bb
    i32 102, label %sw.bb1
    i32 97, label %sw.bb2
    i32 65, label %sw.bb3
    i32 112, label %sw.bb4
    i32 -99, label %sw.bb5
  ]

sw.bb:                                            ; preds = %while.body
  store i32 1, i32* %undo, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 1, i32* %functions_only, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  store i32 1, i32* %arrays_only, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  store i32 1, i32* %assoc_only, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %while.body
  br label %sw.epilog

sw.bb5:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %2 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %2, %struct.word_list** %list.addr, align 4
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %3, null
  br i1 %tobool, label %if.then, label %if.else131

if.then:                                          ; preds = %while.end
  %4 = load i32, i32* %attribute.addr, align 4
  %and = and i32 %4, 1
  %tobool6 = icmp ne i32 %and, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  store i32 1, i32* @array_needs_making, align 4
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  %5 = load i32, i32* %undo, align 4
  %tobool8 = icmp ne i32 %5, 0
  br i1 %tobool8, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end
  %6 = load i32, i32* %attribute.addr, align 4
  %and9 = and i32 %6, 2
  %tobool10 = icmp ne i32 %and9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %land.lhs.true
  %7 = load i32, i32* %attribute.addr, align 4
  %and12 = and i32 %7, -3
  store i32 %and12, i32* %attribute.addr, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %land.lhs.true, %if.end
  br label %while.cond14

while.cond14:                                     ; preds = %if.end128, %if.end62, %if.end39, %if.end13
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool15 = icmp ne %struct.word_list* %8, null
  br i1 %tobool15, label %while.body16, label %while.end130

while.body16:                                     ; preds = %while.cond14
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word17 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word17, align 4
  store i8* %11, i8** %name, align 4
  %12 = load i32, i32* %functions_only, align 4
  %tobool18 = icmp ne i32 %12, 0
  br i1 %tobool18, label %if.then19, label %if.end40

if.then19:                                        ; preds = %while.body16
  %13 = load i8*, i8** %name, align 4
  %call20 = call %struct.variable* @find_function(i8* %13)
  store %struct.variable* %call20, %struct.variable** %var, align 4
  %14 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp21 = icmp eq %struct.variable* %14, null
  br i1 %cmp21, label %if.then22, label %if.else

if.then22:                                        ; preds = %if.then19
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0))
  %15 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call23, i8* %15)
  %16 = load i32, i32* %any_failed, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %any_failed, align 4
  br label %if.end39

if.else:                                          ; preds = %if.then19
  %17 = load i32, i32* %attribute.addr, align 4
  %and24 = and i32 %17, 1
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %land.lhs.true26, label %if.else34

land.lhs.true26:                                  ; preds = %if.else
  %18 = load i32, i32* %undo, align 4
  %cmp27 = icmp eq i32 %18, 0
  br i1 %cmp27, label %land.lhs.true28, label %if.else34

land.lhs.true28:                                  ; preds = %land.lhs.true26
  %19 = load i8*, i8** %name, align 4
  %call29 = call i32 @exportable_function_name(i8* %19)
  %cmp30 = icmp eq i32 %call29, 0
  br i1 %cmp30, label %if.then31, label %if.else34

if.then31:                                        ; preds = %land.lhs.true28
  %call32 = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i32 0, i32 0))
  %20 = load i8*, i8** %name, align 4
  call void (i8*, ...) @builtin_error(i8* %call32, i8* %20)
  %21 = load i32, i32* %any_failed, align 4
  %inc33 = add nsw i32 %21, 1
  store i32 %inc33, i32* %any_failed, align 4
  br label %if.end38

if.else34:                                        ; preds = %land.lhs.true28, %land.lhs.true26, %if.else
  %22 = load i32, i32* %undo, align 4
  %cmp35 = icmp eq i32 %22, 0
  br i1 %cmp35, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else34
  %23 = load i32, i32* %attribute.addr, align 4
  %24 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes, align 4
  %or = or i32 %25, %23
  store i32 %or, i32* %attributes, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else34
  %26 = load i32, i32* %attribute.addr, align 4
  %neg = xor i32 %26, -1
  %27 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes36 = getelementptr inbounds %struct.variable, %struct.variable* %27, i32 0, i32 5
  %28 = load i32, i32* %attributes36, align 4
  %and37 = and i32 %28, %neg
  store i32 %and37, i32* %attributes36, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %or, %cond.true ], [ %and37, %cond.false ]
  br label %if.end38

if.end38:                                         ; preds = %cond.end, %if.then31
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.then22
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %29, i32 0, i32 0
  %30 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %30, %struct.word_list** %list.addr, align 4
  br label %while.cond14

if.end40:                                         ; preds = %while.body16
  %31 = load i8*, i8** %name, align 4
  %call41 = call i32 @assignment(i8* %31, i32 0)
  store i32 %call41, i32* %assign, align 4
  store i32 0, i32* %aflags, align 4
  %32 = load i32, i32* %assign, align 4
  %tobool42 = icmp ne i32 %32, 0
  br i1 %tobool42, label %if.then43, label %if.end52

if.then43:                                        ; preds = %if.end40
  %33 = load i8*, i8** %name, align 4
  %34 = load i32, i32* %assign, align 4
  %arrayidx = getelementptr inbounds i8, i8* %33, i32 %34
  store i8 0, i8* %arrayidx, align 1
  %35 = load i8*, i8** %name, align 4
  %36 = load i32, i32* %assign, align 4
  %sub = sub nsw i32 %36, 1
  %arrayidx44 = getelementptr inbounds i8, i8* %35, i32 %sub
  %37 = load i8, i8* %arrayidx44, align 1
  %conv = sext i8 %37 to i32
  %cmp45 = icmp eq i32 %conv, 43
  br i1 %cmp45, label %if.then47, label %if.end51

if.then47:                                        ; preds = %if.then43
  %38 = load i32, i32* %aflags, align 4
  %or48 = or i32 %38, 1
  store i32 %or48, i32* %aflags, align 4
  %39 = load i8*, i8** %name, align 4
  %40 = load i32, i32* %assign, align 4
  %sub49 = sub nsw i32 %40, 1
  %arrayidx50 = getelementptr inbounds i8, i8* %39, i32 %sub49
  store i8 0, i8* %arrayidx50, align 1
  br label %if.end51

if.end51:                                         ; preds = %if.then47, %if.then43
  br label %if.end52

if.end52:                                         ; preds = %if.end51, %if.end40
  %41 = load i8*, i8** %name, align 4
  %call53 = call i32 @legal_identifier(i8* %41)
  %cmp54 = icmp eq i32 %call53, 0
  br i1 %cmp54, label %if.then56, label %if.end64

if.then56:                                        ; preds = %if.end52
  %42 = load i8*, i8** %name, align 4
  call void @sh_invalidid(i8* %42)
  %43 = load i32, i32* %assign, align 4
  %tobool57 = icmp ne i32 %43, 0
  br i1 %tobool57, label %if.then58, label %if.else60

if.then58:                                        ; preds = %if.then56
  %44 = load i32, i32* %assign_error, align 4
  %inc59 = add nsw i32 %44, 1
  store i32 %inc59, i32* %assign_error, align 4
  br label %if.end62

if.else60:                                        ; preds = %if.then56
  %45 = load i32, i32* %any_failed, align 4
  %inc61 = add nsw i32 %45, 1
  store i32 %inc61, i32* %any_failed, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.else60, %if.then58
  %46 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next63 = getelementptr inbounds %struct.word_list, %struct.word_list* %46, i32 0, i32 0
  %47 = load %struct.word_list*, %struct.word_list** %next63, align 4
  store %struct.word_list* %47, %struct.word_list** %list.addr, align 4
  br label %while.cond14

if.end64:                                         ; preds = %if.end52
  %48 = load i32, i32* %assign, align 4
  %tobool65 = icmp ne i32 %48, 0
  br i1 %tobool65, label %if.then66, label %if.end128

if.then66:                                        ; preds = %if.end64
  %49 = load i8*, i8** %name, align 4
  %50 = load i32, i32* %assign, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %49, i32 %50
  store i8 61, i8* %arrayidx67, align 1
  %51 = load i32, i32* %aflags, align 4
  %and68 = and i32 %51, 1
  %tobool69 = icmp ne i32 %and68, 0
  br i1 %tobool69, label %if.then70, label %if.end73

if.then70:                                        ; preds = %if.then66
  %52 = load i8*, i8** %name, align 4
  %53 = load i32, i32* %assign, align 4
  %sub71 = sub nsw i32 %53, 1
  %arrayidx72 = getelementptr inbounds i8, i8* %52, i32 %sub71
  store i8 43, i8* %arrayidx72, align 1
  br label %if.end73

if.end73:                                         ; preds = %if.then70, %if.then66
  %54 = load i32, i32* %arrays_only, align 4
  %tobool74 = icmp ne i32 %54, 0
  br i1 %tobool74, label %if.then76, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end73
  %55 = load i32, i32* %assoc_only, align 4
  %tobool75 = icmp ne i32 %55, 0
  br i1 %tobool75, label %if.then76, label %if.else113

if.then76:                                        ; preds = %lor.lhs.false, %if.end73
  %56 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next77 = getelementptr inbounds %struct.word_list, %struct.word_list* %56, i32 0, i32 0
  %57 = load %struct.word_list*, %struct.word_list** %next77, align 4
  store %struct.word_list* %57, %struct.word_list** %tlist, align 4
  %58 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next78 = getelementptr inbounds %struct.word_list, %struct.word_list* %58, i32 0, i32 0
  store %struct.word_list* null, %struct.word_list** %next78, align 4
  store i32 0, i32* %opti, align 4
  %59 = load i32, i32* %opti, align 4
  %inc79 = add nsw i32 %59, 1
  store i32 %inc79, i32* %opti, align 4
  %arrayidx80 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %59
  store i8 45, i8* %arrayidx80, align 1
  %60 = load i32, i32* %opti, align 4
  %inc81 = add nsw i32 %60, 1
  store i32 %inc81, i32* %opti, align 4
  %arrayidx82 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %60
  store i8 103, i8* %arrayidx82, align 1
  %61 = load i32, i32* %attribute.addr, align 4
  %and83 = and i32 %61, 2
  %tobool84 = icmp ne i32 %and83, 0
  br i1 %tobool84, label %if.then85, label %if.end88

if.then85:                                        ; preds = %if.then76
  %62 = load i32, i32* %opti, align 4
  %inc86 = add nsw i32 %62, 1
  store i32 %inc86, i32* %opti, align 4
  %arrayidx87 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %62
  store i8 114, i8* %arrayidx87, align 1
  br label %if.end88

if.end88:                                         ; preds = %if.then85, %if.then76
  %63 = load i32, i32* %attribute.addr, align 4
  %and89 = and i32 %63, 1
  %tobool90 = icmp ne i32 %and89, 0
  br i1 %tobool90, label %if.then91, label %if.end94

if.then91:                                        ; preds = %if.end88
  %64 = load i32, i32* %opti, align 4
  %inc92 = add nsw i32 %64, 1
  store i32 %inc92, i32* %opti, align 4
  %arrayidx93 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %64
  store i8 120, i8* %arrayidx93, align 1
  br label %if.end94

if.end94:                                         ; preds = %if.then91, %if.end88
  %65 = load i32, i32* %arrays_only, align 4
  %tobool95 = icmp ne i32 %65, 0
  br i1 %tobool95, label %if.then96, label %if.else99

if.then96:                                        ; preds = %if.end94
  %66 = load i32, i32* %opti, align 4
  %inc97 = add nsw i32 %66, 1
  store i32 %inc97, i32* %opti, align 4
  %arrayidx98 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %66
  store i8 97, i8* %arrayidx98, align 1
  br label %if.end102

if.else99:                                        ; preds = %if.end94
  %67 = load i32, i32* %opti, align 4
  %inc100 = add nsw i32 %67, 1
  store i32 %inc100, i32* %opti, align 4
  %arrayidx101 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %67
  store i8 65, i8* %arrayidx101, align 1
  br label %if.end102

if.end102:                                        ; preds = %if.else99, %if.then96
  %68 = load i32, i32* %opti, align 4
  %arrayidx103 = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 %68
  store i8 0, i8* %arrayidx103, align 1
  %arraydecay = getelementptr inbounds [8 x i8], [8 x i8]* %optw, i32 0, i32 0
  %call104 = call %struct.word_desc* @make_word(i8* %arraydecay)
  store %struct.word_desc* %call104, %struct.word_desc** %w, align 4
  %69 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  %70 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call105 = call %struct.word_list* @make_word_list(%struct.word_desc* %69, %struct.word_list* %70)
  store %struct.word_list* %call105, %struct.word_list** %nlist, align 4
  %71 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  %call106 = call i32 @declare_builtin(%struct.word_list* %71)
  store i32 %call106, i32* %opt, align 4
  %72 = load i32, i32* %opt, align 4
  %cmp107 = icmp ne i32 %72, 0
  br i1 %cmp107, label %if.then109, label %if.end111

if.then109:                                       ; preds = %if.end102
  %73 = load i32, i32* %assign_error, align 4
  %inc110 = add nsw i32 %73, 1
  store i32 %inc110, i32* %assign_error, align 4
  br label %if.end111

if.end111:                                        ; preds = %if.then109, %if.end102
  %74 = load %struct.word_list*, %struct.word_list** %tlist, align 4
  %75 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next112 = getelementptr inbounds %struct.word_list, %struct.word_list* %75, i32 0, i32 0
  store %struct.word_list* %74, %struct.word_list** %next112, align 4
  %76 = load %struct.word_desc*, %struct.word_desc** %w, align 4
  call void @dispose_word(%struct.word_desc* %76)
  %77 = load %struct.word_list*, %struct.word_list** %nlist, align 4
  %78 = bitcast %struct.word_list* %77 to i8*
  call void @sh_xfree(i8* %78, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 266)
  br label %if.end120

if.else113:                                       ; preds = %lor.lhs.false
  %79 = load i8*, i8** %name, align 4
  %call114 = call i32 @do_assignment_no_expand(i8* %79)
  %cmp115 = icmp eq i32 %call114, 0
  br i1 %cmp115, label %if.then117, label %if.end119

if.then117:                                       ; preds = %if.else113
  %80 = load i32, i32* %assign_error, align 4
  %inc118 = add nsw i32 %80, 1
  store i32 %inc118, i32* %assign_error, align 4
  br label %if.end119

if.end119:                                        ; preds = %if.then117, %if.else113
  br label %if.end120

if.end120:                                        ; preds = %if.end119, %if.end111
  %81 = load i8*, i8** %name, align 4
  %82 = load i32, i32* %assign, align 4
  %arrayidx121 = getelementptr inbounds i8, i8* %81, i32 %82
  store i8 0, i8* %arrayidx121, align 1
  %83 = load i32, i32* %aflags, align 4
  %and122 = and i32 %83, 1
  %tobool123 = icmp ne i32 %and122, 0
  br i1 %tobool123, label %if.then124, label %if.end127

if.then124:                                       ; preds = %if.end120
  %84 = load i8*, i8** %name, align 4
  %85 = load i32, i32* %assign, align 4
  %sub125 = sub nsw i32 %85, 1
  %arrayidx126 = getelementptr inbounds i8, i8* %84, i32 %sub125
  store i8 0, i8* %arrayidx126, align 1
  br label %if.end127

if.end127:                                        ; preds = %if.then124, %if.end120
  br label %if.end128

if.end128:                                        ; preds = %if.end127, %if.end64
  %86 = load i8*, i8** %name, align 4
  %87 = load i32, i32* %attribute.addr, align 4
  %88 = load i32, i32* %undo, align 4
  call void @set_var_attribute(i8* %86, i32 %87, i32 %88)
  %89 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next129 = getelementptr inbounds %struct.word_list, %struct.word_list* %89, i32 0, i32 0
  %90 = load %struct.word_list*, %struct.word_list** %next129, align 4
  store %struct.word_list* %90, %struct.word_list** %list.addr, align 4
  br label %while.cond14

while.end130:                                     ; preds = %while.cond14
  br label %if.end210

if.else131:                                       ; preds = %while.end
  %91 = load i32, i32* %attribute.addr, align 4
  %and132 = and i32 %91, 8
  %tobool133 = icmp ne i32 %and132, 0
  br i1 %tobool133, label %if.then136, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %if.else131
  %92 = load i32, i32* %functions_only, align 4
  %tobool135 = icmp ne i32 %92, 0
  br i1 %tobool135, label %if.then136, label %if.else143

if.then136:                                       ; preds = %lor.lhs.false134, %if.else131
  %call137 = call %struct.variable** @all_shell_functions()
  store %struct.variable** %call137, %struct.variable*** %variable_list, align 4
  %93 = load i32, i32* %attribute.addr, align 4
  %cmp138 = icmp ne i32 %93, 8
  br i1 %cmp138, label %if.then140, label %if.end142

if.then140:                                       ; preds = %if.then136
  %94 = load i32, i32* %attribute.addr, align 4
  %and141 = and i32 %94, -9
  store i32 %and141, i32* %attribute.addr, align 4
  br label %if.end142

if.end142:                                        ; preds = %if.then140, %if.then136
  br label %if.end145

if.else143:                                       ; preds = %lor.lhs.false134
  %call144 = call %struct.variable** @all_shell_variables()
  store %struct.variable** %call144, %struct.variable*** %variable_list, align 4
  br label %if.end145

if.end145:                                        ; preds = %if.else143, %if.end142
  %95 = load i32, i32* %attribute.addr, align 4
  %and146 = and i32 %95, 4
  %tobool147 = icmp ne i32 %and146, 0
  br i1 %tobool147, label %if.then148, label %if.else155

if.then148:                                       ; preds = %if.end145
  %96 = load i32, i32* %arrays_only, align 4
  %inc149 = add nsw i32 %96, 1
  store i32 %inc149, i32* %arrays_only, align 4
  %97 = load i32, i32* %attribute.addr, align 4
  %cmp150 = icmp ne i32 %97, 4
  br i1 %cmp150, label %if.then152, label %if.end154

if.then152:                                       ; preds = %if.then148
  %98 = load i32, i32* %attribute.addr, align 4
  %and153 = and i32 %98, -5
  store i32 %and153, i32* %attribute.addr, align 4
  br label %if.end154

if.end154:                                        ; preds = %if.then152, %if.then148
  br label %if.end166

if.else155:                                       ; preds = %if.end145
  %99 = load i32, i32* %attribute.addr, align 4
  %and156 = and i32 %99, 64
  %tobool157 = icmp ne i32 %and156, 0
  br i1 %tobool157, label %if.then158, label %if.end165

if.then158:                                       ; preds = %if.else155
  %100 = load i32, i32* %assoc_only, align 4
  %inc159 = add nsw i32 %100, 1
  store i32 %inc159, i32* %assoc_only, align 4
  %101 = load i32, i32* %attribute.addr, align 4
  %cmp160 = icmp ne i32 %101, 64
  br i1 %cmp160, label %if.then162, label %if.end164

if.then162:                                       ; preds = %if.then158
  %102 = load i32, i32* %attribute.addr, align 4
  %and163 = and i32 %102, -65
  store i32 %and163, i32* %attribute.addr, align 4
  br label %if.end164

if.end164:                                        ; preds = %if.then162, %if.then158
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %if.else155
  br label %if.end166

if.end166:                                        ; preds = %if.end165, %if.end154
  %103 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %tobool167 = icmp ne %struct.variable** %103, null
  br i1 %tobool167, label %if.then168, label %if.end209

if.then168:                                       ; preds = %if.end166
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then168
  %104 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %105 = load i32, i32* %i, align 4
  %arrayidx169 = getelementptr inbounds %struct.variable*, %struct.variable** %104, i32 %105
  %106 = load %struct.variable*, %struct.variable** %arrayidx169, align 4
  store %struct.variable* %106, %struct.variable** %var, align 4
  %tobool170 = icmp ne %struct.variable* %106, null
  br i1 %tobool170, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %107 = load i32, i32* %arrays_only, align 4
  %tobool171 = icmp ne i32 %107, 0
  br i1 %tobool171, label %land.lhs.true172, label %if.else178

land.lhs.true172:                                 ; preds = %for.body
  %108 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes173 = getelementptr inbounds %struct.variable, %struct.variable* %108, i32 0, i32 5
  %109 = load i32, i32* %attributes173, align 4
  %and174 = and i32 %109, 4
  %cmp175 = icmp eq i32 %and174, 0
  br i1 %cmp175, label %if.then177, label %if.else178

if.then177:                                       ; preds = %land.lhs.true172
  br label %for.inc

if.else178:                                       ; preds = %land.lhs.true172, %for.body
  %110 = load i32, i32* %assoc_only, align 4
  %tobool179 = icmp ne i32 %110, 0
  br i1 %tobool179, label %land.lhs.true180, label %if.end186

land.lhs.true180:                                 ; preds = %if.else178
  %111 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes181 = getelementptr inbounds %struct.variable, %struct.variable* %111, i32 0, i32 5
  %112 = load i32, i32* %attributes181, align 4
  %and182 = and i32 %112, 64
  %cmp183 = icmp eq i32 %and182, 0
  br i1 %cmp183, label %if.then185, label %if.end186

if.then185:                                       ; preds = %land.lhs.true180
  br label %for.inc

if.end186:                                        ; preds = %land.lhs.true180, %if.else178
  br label %if.end187

if.end187:                                        ; preds = %if.end186
  %113 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes188 = getelementptr inbounds %struct.variable, %struct.variable* %113, i32 0, i32 5
  %114 = load i32, i32* %attributes188, align 4
  %and189 = and i32 %114, 36864
  %cmp190 = icmp eq i32 %and189, 36864
  br i1 %cmp190, label %if.then192, label %if.end193

if.then192:                                       ; preds = %if.end187
  br label %for.inc

if.end193:                                        ; preds = %if.end187
  %115 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes194 = getelementptr inbounds %struct.variable, %struct.variable* %115, i32 0, i32 5
  %116 = load i32, i32* %attributes194, align 4
  %117 = load i32, i32* %attribute.addr, align 4
  %and195 = and i32 %116, %117
  %tobool196 = icmp ne i32 %and195, 0
  br i1 %tobool196, label %if.then197, label %if.end207

if.then197:                                       ; preds = %if.end193
  %118 = load %struct.variable*, %struct.variable** %var, align 4
  %119 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp198 = icmp eq i32 (%struct.word_list*)* %119, @readonly_builtin
  br i1 %cmp198, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then197
  %120 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp200 = icmp eq i32 (%struct.word_list*)* %120, @export_builtin
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then197
  %121 = phi i1 [ true, %if.then197 ], [ %cmp200, %lor.rhs ]
  %lor.ext = zext i1 %121 to i32
  %122 = load i32, i32* %nodefs.addr, align 4
  %call202 = call i32 @show_var_attributes(%struct.variable* %118, i32 %lor.ext, i32 %122)
  %123 = load i32, i32* %any_failed, align 4
  %call203 = call i32 @sh_chkwrite(i32 %123)
  store i32 %call203, i32* %any_failed, align 4
  %tobool204 = icmp ne i32 %call203, 0
  br i1 %tobool204, label %if.then205, label %if.end206

if.then205:                                       ; preds = %lor.end
  br label %for.end

if.end206:                                        ; preds = %lor.end
  br label %if.end207

if.end207:                                        ; preds = %if.end206, %if.end193
  br label %for.inc

for.inc:                                          ; preds = %if.end207, %if.then192, %if.then185, %if.then177
  %124 = load i32, i32* %i, align 4
  %inc208 = add nsw i32 %124, 1
  store i32 %inc208, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then205, %for.cond
  %125 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %126 = bitcast %struct.variable** %125 to i8*
  call void @sh_xfree(i8* %126, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 337)
  br label %if.end209

if.end209:                                        ; preds = %for.end, %if.end166
  br label %if.end210

if.end210:                                        ; preds = %if.end209, %while.end130
  %127 = load i32, i32* %assign_error, align 4
  %tobool211 = icmp ne i32 %127, 0
  br i1 %tobool211, label %cond.true212, label %cond.false213

cond.true212:                                     ; preds = %if.end210
  br label %cond.end217

cond.false213:                                    ; preds = %if.end210
  %128 = load i32, i32* %any_failed, align 4
  %cmp214 = icmp eq i32 %128, 0
  %cond216 = select i1 %cmp214, i32 0, i32 1
  br label %cond.end217

cond.end217:                                      ; preds = %cond.false213, %cond.true212
  %cond218 = phi i32 [ 260, %cond.true212 ], [ %cond216, %cond.false213 ]
  store i32 %cond218, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end217, %sw.default, %sw.bb5
  %129 = load i32, i32* %retval, align 4
  ret i32 %129
}

; Function Attrs: noinline nounwind
define i32 @readonly_builtin(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @set_or_show_attributes(%struct.word_list* %0, i32 2, i32 0)
  ret i32 %call
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare %struct.variable* @find_function(i8*) #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @exportable_function_name(i8*) #1

declare i32 @assignment(i8*, i32) #1

declare i32 @legal_identifier(i8*) #1

declare void @sh_invalidid(i8*) #1

declare %struct.word_desc* @make_word(i8*) #1

declare %struct.word_list* @make_word_list(%struct.word_desc*, %struct.word_list*) #1

declare i32 @declare_builtin(%struct.word_list*) #1

declare void @dispose_word(%struct.word_desc*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @do_assignment_no_expand(i8*) #1

; Function Attrs: noinline nounwind
define void @set_var_attribute(i8* %name, i32 %attribute, i32 %undo) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %attribute.addr = alloca i32, align 4
  %undo.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  %tv = alloca %struct.variable*, align 4
  %v = alloca %struct.variable*, align 4
  %refvar = alloca %struct.variable*, align 4
  %tvalue = alloca i8*, align 4
  %refname = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %attribute, i32* %attribute.addr, align 4
  store i32 %undo, i32* %undo.addr, align 4
  %0 = load i32, i32* %undo.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable(i8* %1)
  store %struct.variable* %call, %struct.variable** %var, align 4
  br label %if.end79

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %name.addr, align 4
  %call1 = call %struct.variable* @find_tempenv_variable(i8* %2)
  store %struct.variable* %call1, %struct.variable** %tv, align 4
  %3 = load %struct.variable*, %struct.variable** %tv, align 4
  %tobool2 = icmp ne %struct.variable* %3, null
  br i1 %tobool2, label %land.lhs.true, label %if.else51

land.lhs.true:                                    ; preds = %if.else
  %4 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 1048576
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then4, label %if.else51

if.then4:                                         ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %tv, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 1
  %7 = load i8*, i8** %value, align 4
  %cmp = icmp ne i8* %7, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then4
  %8 = load %struct.variable*, %struct.variable** %tv, align 4
  %value5 = getelementptr inbounds %struct.variable, %struct.variable* %8, i32 0, i32 1
  %9 = load i8*, i8** %value5, align 4
  %call6 = call i32 @strlen(i8* %9)
  %add = add i32 1, %call6
  %call7 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 554)
  %10 = load %struct.variable*, %struct.variable** %tv, align 4
  %value8 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 1
  %11 = load i8*, i8** %value8, align 4
  %call9 = call i8* @strcpy(i8* %call7, i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.then4
  %call10 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 554)
  %call11 = call i8* @strcpy(i8* %call10, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.10, i32 0, i32 0))
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call9, %cond.true ], [ %call11, %cond.false ]
  store i8* %cond, i8** %tvalue, align 4
  %12 = load %struct.variable*, %struct.variable** %tv, align 4
  %name12 = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 0
  %13 = load i8*, i8** %name12, align 4
  %14 = load i8*, i8** %tvalue, align 4
  %call13 = call %struct.variable* @bind_variable(i8* %13, i8* %14, i32 0)
  store %struct.variable* %call13, %struct.variable** %var, align 4
  %15 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp14 = icmp eq %struct.variable* %15, null
  br i1 %cmp14, label %if.then15, label %if.end

if.then15:                                        ; preds = %cond.end
  %16 = load i8*, i8** %tvalue, align 4
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 559)
  br label %if.end101

if.end:                                           ; preds = %cond.end
  %17 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes16 = getelementptr inbounds %struct.variable, %struct.variable* %17, i32 0, i32 5
  %18 = load i32, i32* %attributes16, align 4
  %and17 = and i32 %18, -1048577
  %19 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes18 = getelementptr inbounds %struct.variable, %struct.variable* %19, i32 0, i32 5
  %20 = load i32, i32* %attributes18, align 4
  %or = or i32 %20, %and17
  store i32 %or, i32* %attributes18, align 4
  %21 = load %struct.variable*, %struct.variable** %var, align 4
  %context = getelementptr inbounds %struct.variable, %struct.variable* %21, i32 0, i32 6
  %22 = load i32, i32* %context, align 4
  %cmp19 = icmp eq i32 %22, 0
  br i1 %cmp19, label %land.lhs.true20, label %if.else31

land.lhs.true20:                                  ; preds = %if.end
  %23 = load i32, i32* %attribute.addr, align 4
  %and21 = and i32 %23, 2
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then23, label %if.else31

if.then23:                                        ; preds = %land.lhs.true20
  %24 = load %struct.variable*, %struct.variable** %tv, align 4
  %name24 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 0
  %25 = load i8*, i8** %name24, align 4
  %call25 = call %struct.variable* @find_global_variable(i8* %25)
  store %struct.variable* %call25, %struct.variable** %v, align 4
  %26 = load %struct.variable*, %struct.variable** %v, align 4
  %27 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp26 = icmp ne %struct.variable* %26, %27
  br i1 %cmp26, label %if.then27, label %if.end30

if.then27:                                        ; preds = %if.then23
  %28 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes28 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 5
  %29 = load i32, i32* %attributes28, align 4
  %or29 = or i32 %29, 2097152
  store i32 %or29, i32* %attributes28, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %if.then23
  br label %if.end34

if.else31:                                        ; preds = %land.lhs.true20, %if.end
  %30 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes32 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes32, align 4
  %or33 = or i32 %31, 2097152
  store i32 %or33, i32* %attributes32, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.else31, %if.end30
  %32 = load %struct.variable*, %struct.variable** %var, align 4
  %context35 = getelementptr inbounds %struct.variable, %struct.variable* %32, i32 0, i32 6
  %33 = load i32, i32* %context35, align 4
  %cmp36 = icmp ne i32 %33, 0
  br i1 %cmp36, label %if.then37, label %if.end40

if.then37:                                        ; preds = %if.end34
  %34 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes38 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 5
  %35 = load i32, i32* %attributes38, align 4
  %or39 = or i32 %35, 2097152
  store i32 %or39, i32* %attributes38, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then37, %if.end34
  %36 = load i32, i32* %undo.addr, align 4
  %cmp41 = icmp eq i32 %36, 0
  br i1 %cmp41, label %cond.true42, label %cond.false45

cond.true42:                                      ; preds = %if.end40
  %37 = load i32, i32* %attribute.addr, align 4
  %38 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes43 = getelementptr inbounds %struct.variable, %struct.variable* %38, i32 0, i32 5
  %39 = load i32, i32* %attributes43, align 4
  %or44 = or i32 %39, %37
  store i32 %or44, i32* %attributes43, align 4
  br label %cond.end48

cond.false45:                                     ; preds = %if.end40
  %40 = load i32, i32* %attribute.addr, align 4
  %neg = xor i32 %40, -1
  %41 = load %struct.variable*, %struct.variable** %tv, align 4
  %attributes46 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 5
  %42 = load i32, i32* %attributes46, align 4
  %and47 = and i32 %42, %neg
  store i32 %and47, i32* %attributes46, align 4
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false45, %cond.true42
  %cond49 = phi i32 [ %or44, %cond.true42 ], [ %and47, %cond.false45 ]
  %43 = load %struct.variable*, %struct.variable** %tv, align 4
  %name50 = getelementptr inbounds %struct.variable, %struct.variable* %43, i32 0, i32 0
  %44 = load i8*, i8** %name50, align 4
  call void @stupidly_hack_special_variables(i8* %44)
  %45 = load i8*, i8** %tvalue, align 4
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 581)
  br label %if.end78

if.else51:                                        ; preds = %land.lhs.true, %if.else
  %46 = load i8*, i8** %name.addr, align 4
  %call52 = call %struct.variable* @find_variable_notempenv(i8* %46)
  store %struct.variable* %call52, %struct.variable** %var, align 4
  %47 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp53 = icmp eq %struct.variable* %47, null
  br i1 %cmp53, label %if.then54, label %if.end59

if.then54:                                        ; preds = %if.else51
  %48 = load i8*, i8** %name.addr, align 4
  %call55 = call %struct.variable* @find_variable_nameref_for_create(i8* %48, i32 0)
  store %struct.variable* %call55, %struct.variable** %refvar, align 4
  %49 = load %struct.variable*, %struct.variable** %refvar, align 4
  %cmp56 = icmp eq %struct.variable* %49, @nameref_invalid_value
  br i1 %cmp56, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.then54
  br label %if.end101

if.end58:                                         ; preds = %if.then54
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %if.else51
  %50 = load %struct.variable*, %struct.variable** %var, align 4
  %cmp60 = icmp eq %struct.variable* %50, null
  br i1 %cmp60, label %if.then61, label %if.else70

if.then61:                                        ; preds = %if.end59
  %51 = load i8*, i8** %name.addr, align 4
  %call62 = call %struct.variable* @bind_variable(i8* %51, i8* null, i32 0)
  store %struct.variable* %call62, %struct.variable** %var, align 4
  %52 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool63 = icmp ne %struct.variable* %52, null
  br i1 %tobool63, label %land.lhs.true64, label %if.end69

land.lhs.true64:                                  ; preds = %if.then61
  %53 = load i32, i32* @no_invisible_vars, align 4
  %cmp65 = icmp eq i32 %53, 0
  br i1 %cmp65, label %if.then66, label %if.end69

if.then66:                                        ; preds = %land.lhs.true64
  %54 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes67 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 5
  %55 = load i32, i32* %attributes67, align 4
  %or68 = or i32 %55, 4096
  store i32 %or68, i32* %attributes67, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.then66, %land.lhs.true64, %if.then61
  br label %if.end77

if.else70:                                        ; preds = %if.end59
  %56 = load %struct.variable*, %struct.variable** %var, align 4
  %context71 = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 6
  %57 = load i32, i32* %context71, align 4
  %cmp72 = icmp ne i32 %57, 0
  br i1 %cmp72, label %if.then73, label %if.end76

if.then73:                                        ; preds = %if.else70
  %58 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes74 = getelementptr inbounds %struct.variable, %struct.variable* %58, i32 0, i32 5
  %59 = load i32, i32* %attributes74, align 4
  %or75 = or i32 %59, 2097152
  store i32 %or75, i32* %attributes74, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %if.else70
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.end69
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %cond.end48
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %if.then
  %60 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool80 = icmp ne %struct.variable* %60, null
  br i1 %tobool80, label %if.then81, label %if.end92

if.then81:                                        ; preds = %if.end79
  %61 = load i32, i32* %undo.addr, align 4
  %cmp82 = icmp eq i32 %61, 0
  br i1 %cmp82, label %cond.true83, label %cond.false86

cond.true83:                                      ; preds = %if.then81
  %62 = load i32, i32* %attribute.addr, align 4
  %63 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes84 = getelementptr inbounds %struct.variable, %struct.variable* %63, i32 0, i32 5
  %64 = load i32, i32* %attributes84, align 4
  %or85 = or i32 %64, %62
  store i32 %or85, i32* %attributes84, align 4
  br label %cond.end90

cond.false86:                                     ; preds = %if.then81
  %65 = load i32, i32* %attribute.addr, align 4
  %neg87 = xor i32 %65, -1
  %66 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes88 = getelementptr inbounds %struct.variable, %struct.variable* %66, i32 0, i32 5
  %67 = load i32, i32* %attributes88, align 4
  %and89 = and i32 %67, %neg87
  store i32 %and89, i32* %attributes88, align 4
  br label %cond.end90

cond.end90:                                       ; preds = %cond.false86, %cond.true83
  %cond91 = phi i32 [ %or85, %cond.true83 ], [ %and89, %cond.false86 ]
  br label %if.end92

if.end92:                                         ; preds = %cond.end90, %if.end79
  %68 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool93 = icmp ne %struct.variable* %68, null
  br i1 %tobool93, label %land.lhs.true94, label %if.end101

land.lhs.true94:                                  ; preds = %if.end92
  %69 = load %struct.variable*, %struct.variable** %var, align 4
  %attributes95 = getelementptr inbounds %struct.variable, %struct.variable* %69, i32 0, i32 5
  %70 = load i32, i32* %attributes95, align 4
  %and96 = and i32 %70, 1
  %tobool97 = icmp ne i32 %and96, 0
  br i1 %tobool97, label %if.then100, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true94
  %71 = load i32, i32* %attribute.addr, align 4
  %and98 = and i32 %71, 1
  %tobool99 = icmp ne i32 %and98, 0
  br i1 %tobool99, label %if.then100, label %if.end101

if.then100:                                       ; preds = %lor.lhs.false, %land.lhs.true94
  %72 = load i32, i32* @array_needs_making, align 4
  %inc = add nsw i32 %72, 1
  store i32 %inc, i32* @array_needs_making, align 4
  br label %if.end101

if.end101:                                        ; preds = %if.then15, %if.then57, %if.then100, %lor.lhs.false, %if.end92
  ret void
}

declare %struct.variable** @all_shell_functions() #1

declare %struct.variable** @all_shell_variables() #1

; Function Attrs: noinline nounwind
define i32 @show_var_attributes(%struct.variable* %var, i32 %pattr, i32 %nodefs) #0 {
entry:
  %retval = alloca i32, align 4
  %var.addr = alloca %struct.variable*, align 4
  %pattr.addr = alloca i32, align 4
  %nodefs.addr = alloca i32, align 4
  %flags = alloca [16 x i8], align 1
  %x = alloca i8*, align 4
  %i = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %pattr, i32* %pattr.addr, align 4
  store i32 %nodefs, i32* %nodefs.addr, align 4
  %0 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %1 = load i32, i32* %pattr.addr, align 4
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %flags, i32 0, i32 0
  %call = call i32 @var_attribute_string(%struct.variable* %0, i32 %1, i8* %arraydecay)
  store i32 %call, i32* %i, align 4
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %nodefs.addr, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %land.lhs.true1, label %if.end13

land.lhs.true1:                                   ; preds = %land.lhs.true
  %5 = load i32, i32* %pattr.addr, align 4
  %cmp2 = icmp eq i32 %5, 0
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true1
  %6 = load i32, i32* @posixly_correct, align 4
  %cmp3 = icmp eq i32 %6, 0
  br i1 %cmp3, label %if.then, label %if.end13

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true1
  %7 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name = getelementptr inbounds %struct.variable, %struct.variable* %7, i32 0, i32 0
  %8 = load i8*, i8** %name, align 4
  %9 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %9, i32 0, i32 1
  %10 = load i8*, i8** %value, align 4
  %11 = bitcast i8* %10 to %struct.command*
  %call4 = call i8* @named_function_string(i8* %8, %struct.command* %11, i32 3)
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %call4)
  %12 = load i32, i32* %nodefs.addr, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %nodefs.addr, align 4
  %13 = load i32, i32* %pattr.addr, align 4
  %cmp6 = icmp eq i32 %13, 0
  br i1 %cmp6, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %if.then
  %14 = load i32, i32* %i, align 4
  %cmp8 = icmp eq i32 %14, 1
  br i1 %cmp8, label %land.lhs.true9, label %if.end

land.lhs.true9:                                   ; preds = %land.lhs.true7
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %flags, i32 0, i32 0
  %15 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %15 to i32
  %cmp10 = icmp eq i32 %conv, 102
  br i1 %cmp10, label %if.then12, label %if.end

if.then12:                                        ; preds = %land.lhs.true9
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true9, %land.lhs.true7, %if.then
  br label %if.end13

if.end13:                                         ; preds = %if.end, %lor.lhs.false, %land.lhs.true, %entry
  %16 = load i32, i32* %pattr.addr, align 4
  %cmp14 = icmp eq i32 %16, 0
  br i1 %cmp14, label %if.then19, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.end13
  %17 = load i32, i32* @posixly_correct, align 4
  %cmp17 = icmp eq i32 %17, 0
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %lor.lhs.false16, %if.end13
  %18 = load i32, i32* %i, align 4
  %tobool20 = icmp ne i32 %18, 0
  br i1 %tobool20, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then19
  %arraydecay21 = getelementptr inbounds [16 x i8], [16 x i8]* %flags, i32 0, i32 0
  br label %cond.end

cond.false:                                       ; preds = %if.then19
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %arraydecay21, %cond.true ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), %cond.false ]
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* %cond)
  br label %if.end30

if.else:                                          ; preds = %lor.lhs.false16
  %19 = load i32, i32* %i, align 4
  %tobool23 = icmp ne i32 %19, 0
  br i1 %tobool23, label %if.then24, label %if.else27

if.then24:                                        ; preds = %if.else
  %20 = load i8*, i8** @this_command_name, align 4
  %arraydecay25 = getelementptr inbounds [16 x i8], [16 x i8]* %flags, i32 0, i32 0
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i8* %20, i8* %arraydecay25)
  br label %if.end29

if.else27:                                        ; preds = %if.else
  %21 = load i8*, i8** @this_command_name, align 4
  %call28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* %21)
  br label %if.end29

if.end29:                                         ; preds = %if.else27, %if.then24
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %cond.end
  %22 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes31 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes31, align 4
  %and32 = and i32 %23, 4096
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %land.lhs.true34, label %if.else45

land.lhs.true34:                                  ; preds = %if.end30
  %24 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes35 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes35, align 4
  %and36 = and i32 %25, 4
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %if.then42, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %land.lhs.true34
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes39 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes39, align 4
  %and40 = and i32 %27, 64
  %tobool41 = icmp ne i32 %and40, 0
  br i1 %tobool41, label %if.then42, label %if.else45

if.then42:                                        ; preds = %lor.lhs.false38, %land.lhs.true34
  %28 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name43 = getelementptr inbounds %struct.variable, %struct.variable* %28, i32 0, i32 0
  %29 = load i8*, i8** %name43, align 4
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %29)
  br label %if.end101

if.else45:                                        ; preds = %lor.lhs.false38, %if.end30
  %30 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes46 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes46, align 4
  %and47 = and i32 %31, 4
  %tobool48 = icmp ne i32 %and47, 0
  br i1 %tobool48, label %if.then49, label %if.else50

if.then49:                                        ; preds = %if.else45
  %32 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_array_assignment(%struct.variable* %32, i32 0)
  br label %if.end100

if.else50:                                        ; preds = %if.else45
  %33 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes51 = getelementptr inbounds %struct.variable, %struct.variable* %33, i32 0, i32 5
  %34 = load i32, i32* %attributes51, align 4
  %and52 = and i32 %34, 64
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %if.then54, label %if.else55

if.then54:                                        ; preds = %if.else50
  %35 = load %struct.variable*, %struct.variable** %var.addr, align 4
  call void @print_assoc_assignment(%struct.variable* %35, i32 0)
  br label %if.end99

if.else55:                                        ; preds = %if.else50
  %36 = load i32, i32* %nodefs.addr, align 4
  %tobool56 = icmp ne i32 %36, 0
  br i1 %tobool56, label %if.then66, label %lor.lhs.false57

lor.lhs.false57:                                  ; preds = %if.else55
  %37 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes58 = getelementptr inbounds %struct.variable, %struct.variable* %37, i32 0, i32 5
  %38 = load i32, i32* %attributes58, align 4
  %and59 = and i32 %38, 8
  %tobool60 = icmp ne i32 %and59, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.else69

land.lhs.true61:                                  ; preds = %lor.lhs.false57
  %39 = load i32, i32* %pattr.addr, align 4
  %cmp62 = icmp ne i32 %39, 0
  br i1 %cmp62, label %land.lhs.true64, label %if.else69

land.lhs.true64:                                  ; preds = %land.lhs.true61
  %40 = load i32, i32* @posixly_correct, align 4
  %tobool65 = icmp ne i32 %40, 0
  br i1 %tobool65, label %if.then66, label %if.else69

if.then66:                                        ; preds = %land.lhs.true64, %if.else55
  %41 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name67 = getelementptr inbounds %struct.variable, %struct.variable* %41, i32 0, i32 0
  %42 = load i8*, i8** %name67, align 4
  %call68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %42)
  br label %if.end98

if.else69:                                        ; preds = %land.lhs.true64, %land.lhs.true61, %lor.lhs.false57
  %43 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes70 = getelementptr inbounds %struct.variable, %struct.variable* %43, i32 0, i32 5
  %44 = load i32, i32* %attributes70, align 4
  %and71 = and i32 %44, 8
  %tobool72 = icmp ne i32 %and71, 0
  br i1 %tobool72, label %if.then73, label %if.else78

if.then73:                                        ; preds = %if.else69
  %45 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name74 = getelementptr inbounds %struct.variable, %struct.variable* %45, i32 0, i32 0
  %46 = load i8*, i8** %name74, align 4
  %47 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value75 = getelementptr inbounds %struct.variable, %struct.variable* %47, i32 0, i32 1
  %48 = load i8*, i8** %value75, align 4
  %49 = bitcast i8* %48 to %struct.command*
  %call76 = call i8* @named_function_string(i8* %46, %struct.command* %49, i32 3)
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %call76)
  br label %if.end97

if.else78:                                        ; preds = %if.else69
  %50 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes79 = getelementptr inbounds %struct.variable, %struct.variable* %50, i32 0, i32 5
  %51 = load i32, i32* %attributes79, align 4
  %and80 = and i32 %51, 4096
  %tobool81 = icmp ne i32 %and80, 0
  br i1 %tobool81, label %if.then88, label %lor.lhs.false82

lor.lhs.false82:                                  ; preds = %if.else78
  %52 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value83 = getelementptr inbounds %struct.variable, %struct.variable* %52, i32 0, i32 1
  %53 = load i8*, i8** %value83, align 4
  %cmp84 = icmp ne i8* %53, null
  %conv85 = zext i1 %cmp84 to i32
  %cmp86 = icmp eq i32 %conv85, 0
  br i1 %cmp86, label %if.then88, label %if.else91

if.then88:                                        ; preds = %lor.lhs.false82, %if.else78
  %54 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name89 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 0
  %55 = load i8*, i8** %name89, align 4
  %call90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* %55)
  br label %if.end96

if.else91:                                        ; preds = %lor.lhs.false82
  %56 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %value92 = getelementptr inbounds %struct.variable, %struct.variable* %56, i32 0, i32 1
  %57 = load i8*, i8** %value92, align 4
  %call93 = call i8* @sh_double_quote(i8* %57)
  store i8* %call93, i8** %x, align 4
  %58 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %name94 = getelementptr inbounds %struct.variable, %struct.variable* %58, i32 0, i32 0
  %59 = load i8*, i8** %name94, align 4
  %60 = load i8*, i8** %x, align 4
  %call95 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8* %59, i8* %60)
  %61 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %61, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 491)
  br label %if.end96

if.end96:                                         ; preds = %if.else91, %if.then88
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.then73
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.then66
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.then54
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then49
  br label %if.end101

if.end101:                                        ; preds = %if.end100, %if.then42
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end101, %if.then12
  %62 = load i32, i32* %retval, align 4
  ret i32 %62
}

declare i32 @sh_chkwrite(i32) #1

; Function Attrs: noinline nounwind
define i32 @show_all_var_attributes(i32 %v, i32 %nodefs) #0 {
entry:
  %retval = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %nodefs.addr = alloca i32, align 4
  %variable_list = alloca %struct.variable**, align 4
  %var = alloca %struct.variable*, align 4
  %any_failed = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  store i32 %nodefs, i32* %nodefs.addr, align 4
  %0 = load i32, i32* %v.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call %struct.variable** @all_shell_variables()
  br label %cond.end

cond.false:                                       ; preds = %entry
  %call1 = call %struct.variable** @all_shell_functions()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.variable** [ %call, %cond.true ], [ %call1, %cond.false ]
  store %struct.variable** %cond, %struct.variable*** %variable_list, align 4
  %1 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %cmp = icmp eq %struct.variable** %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  store i32 0, i32* %any_failed, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds %struct.variable*, %struct.variable** %2, i32 %3
  %4 = load %struct.variable*, %struct.variable** %arrayidx, align 4
  store %struct.variable* %4, %struct.variable** %var, align 4
  %tobool2 = icmp ne %struct.variable* %4, null
  br i1 %tobool2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load %struct.variable*, %struct.variable** %var, align 4
  %6 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp3 = icmp eq i32 (%struct.word_list*)* %6, @readonly_builtin
  br i1 %cmp3, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  %7 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp4 = icmp eq i32 (%struct.word_list*)* %7, @export_builtin
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %8 = phi i1 [ true, %for.body ], [ %cmp4, %lor.rhs ]
  %lor.ext = zext i1 %8 to i32
  %9 = load i32, i32* %nodefs.addr, align 4
  %call5 = call i32 @show_var_attributes(%struct.variable* %5, i32 %lor.ext, i32 %9)
  %10 = load i32, i32* %any_failed, align 4
  %call6 = call i32 @sh_chkwrite(i32 %10)
  store i32 %call6, i32* %any_failed, align 4
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.end
  br label %for.end

if.end9:                                          ; preds = %lor.end
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then8, %for.cond
  %12 = load %struct.variable**, %struct.variable*** %variable_list, align 4
  %13 = bitcast %struct.variable** %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0), i32 366)
  %14 = load i32, i32* %any_failed, align 4
  %cmp10 = icmp eq i32 %14, 0
  %cond11 = select i1 %cmp10, i32 0, i32 1
  store i32 %cond11, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define i32 @var_attribute_string(%struct.variable* %var, i32 %pattr, i8* %flags) #0 {
entry:
  %var.addr = alloca %struct.variable*, align 4
  %pattr.addr = alloca i32, align 4
  %flags.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store %struct.variable* %var, %struct.variable** %var.addr, align 4
  store i32 %pattr, i32* %pattr.addr, align 4
  store i8* %flags, i8** %flags.addr, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %pattr.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @posixly_correct, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %2, i32 0, i32 5
  %3 = load i32, i32* %attributes, align 4
  %and = and i32 %3, 4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %4 = load i8*, i8** %flags.addr, align 4
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  store i8 97, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %6 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes3 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes3, align 4
  %and4 = and i32 %7, 64
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %8 = load i8*, i8** %flags.addr, align 4
  %9 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %9, 1
  store i32 %inc7, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 65, i8* %arrayidx8, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end
  %10 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes10 = getelementptr inbounds %struct.variable, %struct.variable* %10, i32 0, i32 5
  %11 = load i32, i32* %attributes10, align 4
  %and11 = and i32 %11, 8
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end9
  %12 = load i8*, i8** %flags.addr, align 4
  %13 = load i32, i32* %i, align 4
  %inc14 = add nsw i32 %13, 1
  store i32 %inc14, i32* %i, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %12, i32 %13
  store i8 102, i8* %arrayidx15, align 1
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end9
  %14 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes17 = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 5
  %15 = load i32, i32* %attributes17, align 4
  %and18 = and i32 %15, 16
  %tobool19 = icmp ne i32 %and18, 0
  br i1 %tobool19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end16
  %16 = load i8*, i8** %flags.addr, align 4
  %17 = load i32, i32* %i, align 4
  %inc21 = add nsw i32 %17, 1
  store i32 %inc21, i32* %i, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %16, i32 %17
  store i8 105, i8* %arrayidx22, align 1
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end16
  %18 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes24 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes24, align 4
  %and25 = and i32 %19, 2048
  %tobool26 = icmp ne i32 %and25, 0
  br i1 %tobool26, label %if.then27, label %if.end30

if.then27:                                        ; preds = %if.end23
  %20 = load i8*, i8** %flags.addr, align 4
  %21 = load i32, i32* %i, align 4
  %inc28 = add nsw i32 %21, 1
  store i32 %inc28, i32* %i, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %20, i32 %21
  store i8 110, i8* %arrayidx29, align 1
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %if.end23
  %22 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes31 = getelementptr inbounds %struct.variable, %struct.variable* %22, i32 0, i32 5
  %23 = load i32, i32* %attributes31, align 4
  %and32 = and i32 %23, 2
  %tobool33 = icmp ne i32 %and32, 0
  br i1 %tobool33, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.end30
  %24 = load i8*, i8** %flags.addr, align 4
  %25 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %25, 1
  store i32 %inc35, i32* %i, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %24, i32 %25
  store i8 114, i8* %arrayidx36, align 1
  br label %if.end37

if.end37:                                         ; preds = %if.then34, %if.end30
  %26 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes38 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 5
  %27 = load i32, i32* %attributes38, align 4
  %and39 = and i32 %27, 128
  %tobool40 = icmp ne i32 %and39, 0
  br i1 %tobool40, label %if.then41, label %if.end44

if.then41:                                        ; preds = %if.end37
  %28 = load i8*, i8** %flags.addr, align 4
  %29 = load i32, i32* %i, align 4
  %inc42 = add nsw i32 %29, 1
  store i32 %inc42, i32* %i, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %28, i32 %29
  store i8 116, i8* %arrayidx43, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %if.end37
  %30 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes45 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 5
  %31 = load i32, i32* %attributes45, align 4
  %and46 = and i32 %31, 1
  %tobool47 = icmp ne i32 %and46, 0
  br i1 %tobool47, label %if.then48, label %if.end51

if.then48:                                        ; preds = %if.end44
  %32 = load i8*, i8** %flags.addr, align 4
  %33 = load i32, i32* %i, align 4
  %inc49 = add nsw i32 %33, 1
  store i32 %inc49, i32* %i, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %32, i32 %33
  store i8 120, i8* %arrayidx50, align 1
  br label %if.end51

if.end51:                                         ; preds = %if.then48, %if.end44
  %34 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes52 = getelementptr inbounds %struct.variable, %struct.variable* %34, i32 0, i32 5
  %35 = load i32, i32* %attributes52, align 4
  %and53 = and i32 %35, 1024
  %tobool54 = icmp ne i32 %and53, 0
  br i1 %tobool54, label %if.then55, label %if.end58

if.then55:                                        ; preds = %if.end51
  %36 = load i8*, i8** %flags.addr, align 4
  %37 = load i32, i32* %i, align 4
  %inc56 = add nsw i32 %37, 1
  store i32 %inc56, i32* %i, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %36, i32 %37
  store i8 99, i8* %arrayidx57, align 1
  br label %if.end58

if.end58:                                         ; preds = %if.then55, %if.end51
  %38 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes59 = getelementptr inbounds %struct.variable, %struct.variable* %38, i32 0, i32 5
  %39 = load i32, i32* %attributes59, align 4
  %and60 = and i32 %39, 512
  %tobool61 = icmp ne i32 %and60, 0
  br i1 %tobool61, label %if.then62, label %if.end65

if.then62:                                        ; preds = %if.end58
  %40 = load i8*, i8** %flags.addr, align 4
  %41 = load i32, i32* %i, align 4
  %inc63 = add nsw i32 %41, 1
  store i32 %inc63, i32* %i, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %40, i32 %41
  store i8 108, i8* %arrayidx64, align 1
  br label %if.end65

if.end65:                                         ; preds = %if.then62, %if.end58
  %42 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes66 = getelementptr inbounds %struct.variable, %struct.variable* %42, i32 0, i32 5
  %43 = load i32, i32* %attributes66, align 4
  %and67 = and i32 %43, 256
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then69, label %if.end72

if.then69:                                        ; preds = %if.end65
  %44 = load i8*, i8** %flags.addr, align 4
  %45 = load i32, i32* %i, align 4
  %inc70 = add nsw i32 %45, 1
  store i32 %inc70, i32* %i, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %44, i32 %45
  store i8 117, i8* %arrayidx71, align 1
  br label %if.end72

if.end72:                                         ; preds = %if.then69, %if.end65
  br label %if.end94

if.else:                                          ; preds = %lor.lhs.false
  %46 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes73 = getelementptr inbounds %struct.variable, %struct.variable* %46, i32 0, i32 5
  %47 = load i32, i32* %attributes73, align 4
  %and74 = and i32 %47, 4
  %tobool75 = icmp ne i32 %and74, 0
  br i1 %tobool75, label %if.then76, label %if.end79

if.then76:                                        ; preds = %if.else
  %48 = load i8*, i8** %flags.addr, align 4
  %49 = load i32, i32* %i, align 4
  %inc77 = add nsw i32 %49, 1
  store i32 %inc77, i32* %i, align 4
  %arrayidx78 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 97, i8* %arrayidx78, align 1
  br label %if.end79

if.end79:                                         ; preds = %if.then76, %if.else
  %50 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes80 = getelementptr inbounds %struct.variable, %struct.variable* %50, i32 0, i32 5
  %51 = load i32, i32* %attributes80, align 4
  %and81 = and i32 %51, 64
  %tobool82 = icmp ne i32 %and81, 0
  br i1 %tobool82, label %if.then83, label %if.end86

if.then83:                                        ; preds = %if.end79
  %52 = load i8*, i8** %flags.addr, align 4
  %53 = load i32, i32* %i, align 4
  %inc84 = add nsw i32 %53, 1
  store i32 %inc84, i32* %i, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %52, i32 %53
  store i8 65, i8* %arrayidx85, align 1
  br label %if.end86

if.end86:                                         ; preds = %if.then83, %if.end79
  %54 = load %struct.variable*, %struct.variable** %var.addr, align 4
  %attributes87 = getelementptr inbounds %struct.variable, %struct.variable* %54, i32 0, i32 5
  %55 = load i32, i32* %attributes87, align 4
  %and88 = and i32 %55, 8
  %tobool89 = icmp ne i32 %and88, 0
  br i1 %tobool89, label %if.then90, label %if.end93

if.then90:                                        ; preds = %if.end86
  %56 = load i8*, i8** %flags.addr, align 4
  %57 = load i32, i32* %i, align 4
  %inc91 = add nsw i32 %57, 1
  store i32 %inc91, i32* %i, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %56, i32 %57
  store i8 102, i8* %arrayidx92, align 1
  br label %if.end93

if.end93:                                         ; preds = %if.then90, %if.end86
  br label %if.end94

if.end94:                                         ; preds = %if.end93, %if.end72
  %58 = load i8*, i8** %flags.addr, align 4
  %59 = load i32, i32* %i, align 4
  %arrayidx95 = getelementptr inbounds i8, i8* %58, i32 %59
  store i8 0, i8* %arrayidx95, align 1
  %60 = load i32, i32* %i, align 4
  ret i32 %60
}

declare i32 @printf(i8*, ...) #1

declare i8* @named_function_string(i8*, %struct.command*, i32) #1

declare void @print_array_assignment(%struct.variable*, i32) #1

declare void @print_assoc_assignment(%struct.variable*, i32) #1

declare i8* @sh_double_quote(i8*) #1

; Function Attrs: noinline nounwind
define i32 @show_name_attributes(i8* %name, i32 %nodefs) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %nodefs.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %nodefs, i32* %nodefs.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_variable_noref(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp = icmp eq i32 (%struct.word_list*)* %3, @readonly_builtin
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then
  %4 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp1 = icmp eq i32 (%struct.word_list*)* %4, @export_builtin
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %5 = phi i1 [ true, %if.then ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  %6 = load i32, i32* %nodefs.addr, align 4
  %call2 = call i32 @show_var_attributes(%struct.variable* %2, i32 %lor.ext, i32 %6)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %lor.end
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare %struct.variable* @find_variable_noref(i8*) #1

; Function Attrs: noinline nounwind
define i32 @show_func_attributes(i8* %name, i32 %nodefs) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %nodefs.addr = alloca i32, align 4
  %var = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %nodefs, i32* %nodefs.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call %struct.variable* @find_function(i8* %0)
  store %struct.variable* %call, %struct.variable** %var, align 4
  %1 = load %struct.variable*, %struct.variable** %var, align 4
  %tobool = icmp ne %struct.variable* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load %struct.variable*, %struct.variable** %var, align 4
  %3 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp = icmp eq i32 (%struct.word_list*)* %3, @readonly_builtin
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then
  %4 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** @this_shell_builtin, align 4
  %cmp1 = icmp eq i32 (%struct.word_list*)* %4, @export_builtin
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then
  %5 = phi i1 [ true, %if.then ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  %6 = load i32, i32* %nodefs.addr, align 4
  %call2 = call i32 @show_var_attributes(%struct.variable* %2, i32 %lor.ext, i32 %6)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %lor.end
  %7 = load i32, i32* %retval, align 4
  ret i32 %7
}

declare %struct.variable* @find_variable(i8*) #1

declare %struct.variable* @find_tempenv_variable(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

declare %struct.variable* @find_global_variable(i8*) #1

declare void @stupidly_hack_special_variables(i8*) #1

declare %struct.variable* @find_variable_notempenv(i8*) #1

declare %struct.variable* @find_variable_nameref_for_create(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
