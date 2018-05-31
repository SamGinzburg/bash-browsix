; ModuleID = 'getopts.c'
source_filename = "getopts.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }

@sh_optind = external global i32, align 4
@sh_badopt = external global i32, align 4
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [14 x i8] c"./getopts.def\00", align 1
@sh_opterr = external global i32, align 4
@dollar_vars = external global [0 x i8*], align 4
@rest_of_args = external global %struct.word_list*, align 4
@.str.2 = private unnamed_addr constant [7 x i8] c"OPTIND\00", align 1
@sh_optarg = external global i8*, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"OPTARG\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"?\00", align 1
@sh_optopt = external global i32, align 4
@.str.5 = private unnamed_addr constant [2 x i8] c":\00", align 1

; Function Attrs: noinline nounwind
define void @getopts_reset(i32 %newind) #0 {
entry:
  %newind.addr = alloca i32, align 4
  store i32 %newind, i32* %newind.addr, align 4
  %0 = load i32, i32* %newind.addr, align 4
  store i32 %0, i32* @sh_optind, align 4
  store i32 0, i32* @sh_badopt, align 4
  ret void
}

; Function Attrs: noinline nounwind
define i32 @getopts_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %av = alloca i8**, align 4
  %ac = alloca i32, align 4
  %ret = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @reset_internal_getopt()
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %1, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %ret, align 4
  %cmp1 = icmp ne i32 %call, -1
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %ret, align 4
  %cmp3 = icmp eq i32 %2, -99
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then2
  call void @builtin_help()
  br label %if.end5

if.else:                                          ; preds = %if.then2
  call void @builtin_usage()
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  store i32 258, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %3 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %3, %struct.word_list** %list.addr, align 4
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call7 = call i8** @make_builtin_argv(%struct.word_list* %4, i32* %ac)
  store i8** %call7, i8*** %av, align 4
  %5 = load i32, i32* %ac, align 4
  %6 = load i8**, i8*** %av, align 4
  %call8 = call i32 @dogetopts(i32 %5, i8** %6)
  store i32 %call8, i32* %ret, align 4
  %7 = load i8**, i8*** %av, align 4
  %8 = bitcast i8** %7 to i8*
  call void @sh_xfree(i8* %8, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 344)
  %9 = load i32, i32* %ret, align 4
  store i32 %9, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.end5, %if.then
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare void @builtin_usage() #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare i8** @make_builtin_argv(%struct.word_list*, i32*) #1

; Function Attrs: noinline nounwind
define internal i32 @dogetopts(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %ret = alloca i32, align 4
  %special_error = alloca i32, align 4
  %old_opterr = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %strval = alloca [2 x i8], align 1
  %numval = alloca [16 x i8], align 1
  %optstr = alloca i8*, align 4
  %name = alloca i8*, align 4
  %t = alloca i8*, align 4
  %words = alloca %struct.word_list*, align 4
  %v = alloca i8**, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  %0 = load i32, i32* %argc.addr, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %argv.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 1
  %2 = load i8*, i8** %arrayidx, align 4
  store i8* %2, i8** %optstr, align 4
  %3 = load i8**, i8*** %argv.addr, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %3, i32 2
  %4 = load i8*, i8** %arrayidx1, align 4
  store i8* %4, i8** %name, align 4
  %5 = load i32, i32* %argc.addr, align 4
  %sub = sub nsw i32 %5, 2
  store i32 %sub, i32* %argc.addr, align 4
  %6 = load i8**, i8*** %argv.addr, align 4
  %add.ptr = getelementptr inbounds i8*, i8** %6, i32 2
  store i8** %add.ptr, i8*** %argv.addr, align 4
  %7 = load i8*, i8** %optstr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %8 to i32
  %cmp3 = icmp eq i32 %conv, 58
  %conv4 = zext i1 %cmp3 to i32
  store i32 %conv4, i32* %special_error, align 4
  %9 = load i32, i32* %special_error, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  %10 = load i32, i32* @sh_opterr, align 4
  store i32 %10, i32* %old_opterr, align 4
  %11 = load i8*, i8** %optstr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %optstr, align 4
  store i32 0, i32* @sh_opterr, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %12 = load i32, i32* %argc.addr, align 4
  %cmp7 = icmp sgt i32 %12, 1
  br i1 %cmp7, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end6
  %13 = load i8**, i8*** %argv.addr, align 4
  call void @sh_getopt_restore_state(i8** %13)
  %14 = load i8**, i8*** %argv.addr, align 4
  %arrayidx10 = getelementptr inbounds i8*, i8** %14, i32 0
  %15 = load i8*, i8** %arrayidx10, align 4
  store i8* %15, i8** %t, align 4
  %16 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), align 4
  %17 = load i8**, i8*** %argv.addr, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %17, i32 0
  store i8* %16, i8** %arrayidx11, align 4
  %18 = load i32, i32* %argc.addr, align 4
  %19 = load i8**, i8*** %argv.addr, align 4
  %20 = load i8*, i8** %optstr, align 4
  %call = call i32 @sh_getopt(i32 %18, i8** %19, i8* %20)
  store i32 %call, i32* %ret, align 4
  %21 = load i8*, i8** %t, align 4
  %22 = load i8**, i8*** %argv.addr, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %22, i32 0
  store i8* %21, i8** %arrayidx12, align 4
  br label %if.end65

if.else:                                          ; preds = %if.end6
  %23 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  %cmp13 = icmp eq %struct.word_list* %23, null
  br i1 %cmp13, label %if.then15, label %if.else21

if.then15:                                        ; preds = %if.else
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then15
  %24 = load i32, i32* %i, align 4
  %cmp16 = icmp slt i32 %24, 10
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %25 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %25
  %26 = load i8*, i8** %arrayidx18, align 4
  %tobool19 = icmp ne i8* %26, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %27 = phi i1 [ false, %for.cond ], [ %tobool19, %land.rhs ]
  br i1 %27, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  call void @sh_getopt_restore_state(i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0))
  %29 = load i32, i32* %i, align 4
  %30 = load i8*, i8** %optstr, align 4
  %call20 = call i32 @sh_getopt(i32 %29, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 0), i8* %30)
  store i32 %call20, i32* %ret, align 4
  br label %if.end64

if.else21:                                        ; preds = %if.else
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc30, %if.else21
  %31 = load i32, i32* %i, align 4
  %cmp23 = icmp slt i32 %31, 10
  br i1 %cmp23, label %land.rhs25, label %land.end28

land.rhs25:                                       ; preds = %for.cond22
  %32 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %32
  %33 = load i8*, i8** %arrayidx26, align 4
  %tobool27 = icmp ne i8* %33, null
  br label %land.end28

land.end28:                                       ; preds = %land.rhs25, %for.cond22
  %34 = phi i1 [ false, %for.cond22 ], [ %tobool27, %land.rhs25 ]
  br i1 %34, label %for.body29, label %for.end32

for.body29:                                       ; preds = %land.end28
  br label %for.inc30

for.inc30:                                        ; preds = %for.body29
  %35 = load i32, i32* %i, align 4
  %inc31 = add nsw i32 %35, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond22

for.end32:                                        ; preds = %land.end28
  %36 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  store %struct.word_list* %36, %struct.word_list** %words, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc36, %for.end32
  %37 = load %struct.word_list*, %struct.word_list** %words, align 4
  %tobool34 = icmp ne %struct.word_list* %37, null
  br i1 %tobool34, label %for.body35, label %for.end38

for.body35:                                       ; preds = %for.cond33
  br label %for.inc36

for.inc36:                                        ; preds = %for.body35
  %38 = load %struct.word_list*, %struct.word_list** %words, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %38, i32 0, i32 0
  %39 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %39, %struct.word_list** %words, align 4
  %40 = load i32, i32* %i, align 4
  %inc37 = add nsw i32 %40, 1
  store i32 %inc37, i32* %i, align 4
  br label %for.cond33

for.end38:                                        ; preds = %for.cond33
  %41 = load i32, i32* %i, align 4
  %add = add nsw i32 %41, 1
  %call39 = call i8** @strvec_create(i32 %add)
  store i8** %call39, i8*** %v, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc50, %for.end38
  %42 = load i32, i32* %i, align 4
  %cmp41 = icmp slt i32 %42, 10
  br i1 %cmp41, label %land.rhs43, label %land.end46

land.rhs43:                                       ; preds = %for.cond40
  %43 = load i32, i32* %i, align 4
  %arrayidx44 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %43
  %44 = load i8*, i8** %arrayidx44, align 4
  %tobool45 = icmp ne i8* %44, null
  br label %land.end46

land.end46:                                       ; preds = %land.rhs43, %for.cond40
  %45 = phi i1 [ false, %for.cond40 ], [ %tobool45, %land.rhs43 ]
  br i1 %45, label %for.body47, label %for.end52

for.body47:                                       ; preds = %land.end46
  %46 = load i32, i32* %i, align 4
  %arrayidx48 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %46
  %47 = load i8*, i8** %arrayidx48, align 4
  %48 = load i8**, i8*** %v, align 4
  %49 = load i32, i32* %i, align 4
  %arrayidx49 = getelementptr inbounds i8*, i8** %48, i32 %49
  store i8* %47, i8** %arrayidx49, align 4
  br label %for.inc50

for.inc50:                                        ; preds = %for.body47
  %50 = load i32, i32* %i, align 4
  %inc51 = add nsw i32 %50, 1
  store i32 %inc51, i32* %i, align 4
  br label %for.cond40

for.end52:                                        ; preds = %land.end46
  %51 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  store %struct.word_list* %51, %struct.word_list** %words, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc58, %for.end52
  %52 = load %struct.word_list*, %struct.word_list** %words, align 4
  %tobool54 = icmp ne %struct.word_list* %52, null
  br i1 %tobool54, label %for.body55, label %for.end61

for.body55:                                       ; preds = %for.cond53
  %53 = load %struct.word_list*, %struct.word_list** %words, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %53, i32 0, i32 1
  %54 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word56 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %54, i32 0, i32 0
  %55 = load i8*, i8** %word56, align 4
  %56 = load i8**, i8*** %v, align 4
  %57 = load i32, i32* %i, align 4
  %arrayidx57 = getelementptr inbounds i8*, i8** %56, i32 %57
  store i8* %55, i8** %arrayidx57, align 4
  br label %for.inc58

for.inc58:                                        ; preds = %for.body55
  %58 = load %struct.word_list*, %struct.word_list** %words, align 4
  %next59 = getelementptr inbounds %struct.word_list, %struct.word_list* %58, i32 0, i32 0
  %59 = load %struct.word_list*, %struct.word_list** %next59, align 4
  store %struct.word_list* %59, %struct.word_list** %words, align 4
  %60 = load i32, i32* %i, align 4
  %inc60 = add nsw i32 %60, 1
  store i32 %inc60, i32* %i, align 4
  br label %for.cond53

for.end61:                                        ; preds = %for.cond53
  %61 = load i8**, i8*** %v, align 4
  %62 = load i32, i32* %i, align 4
  %arrayidx62 = getelementptr inbounds i8*, i8** %61, i32 %62
  store i8* null, i8** %arrayidx62, align 4
  %63 = load i8**, i8*** %v, align 4
  call void @sh_getopt_restore_state(i8** %63)
  %64 = load i32, i32* %i, align 4
  %65 = load i8**, i8*** %v, align 4
  %66 = load i8*, i8** %optstr, align 4
  %call63 = call i32 @sh_getopt(i32 %64, i8** %65, i8* %66)
  store i32 %call63, i32* %ret, align 4
  %67 = load i8**, i8*** %v, align 4
  %68 = bitcast i8** %67 to i8*
  call void @sh_xfree(i8* %68, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0), i32 228)
  br label %if.end64

if.end64:                                         ; preds = %for.end61, %for.end
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then9
  %69 = load i32, i32* %special_error, align 4
  %tobool66 = icmp ne i32 %69, 0
  br i1 %tobool66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end65
  %70 = load i32, i32* %old_opterr, align 4
  store i32 %70, i32* @sh_opterr, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then67, %if.end65
  %71 = load i32, i32* @sh_optind, align 4
  %cmp69 = icmp slt i32 %71, 10
  br i1 %cmp69, label %if.then71, label %if.else76

if.then71:                                        ; preds = %if.end68
  %72 = load i32, i32* @sh_optind, align 4
  %add72 = add nsw i32 %72, 48
  %conv73 = trunc i32 %add72 to i8
  %arrayidx74 = getelementptr inbounds [16 x i8], [16 x i8]* %numval, i32 0, i32 14
  store i8 %conv73, i8* %arrayidx74, align 1
  %arrayidx75 = getelementptr inbounds [16 x i8], [16 x i8]* %numval, i32 0, i32 15
  store i8 0, i8* %arrayidx75, align 1
  store i32 14, i32* %i, align 4
  br label %if.end82

if.else76:                                        ; preds = %if.end68
  store i32 15, i32* %i, align 4
  %arrayidx77 = getelementptr inbounds [16 x i8], [16 x i8]* %numval, i32 0, i32 15
  store i8 0, i8* %arrayidx77, align 1
  %73 = load i32, i32* @sh_optind, align 4
  store i32 %73, i32* %n, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.else76
  %74 = load i32, i32* %n, align 4
  %rem = srem i32 %74, 10
  %add78 = add nsw i32 %rem, 48
  %conv79 = trunc i32 %add78 to i8
  %75 = load i32, i32* %i, align 4
  %dec = add nsw i32 %75, -1
  store i32 %dec, i32* %i, align 4
  %arrayidx80 = getelementptr inbounds [16 x i8], [16 x i8]* %numval, i32 0, i32 %dec
  store i8 %conv79, i8* %arrayidx80, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %76 = load i32, i32* %n, align 4
  %div = sdiv i32 %76, 10
  store i32 %div, i32* %n, align 4
  %tobool81 = icmp ne i32 %div, 0
  br i1 %tobool81, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end82

if.end82:                                         ; preds = %do.end, %if.then71
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %numval, i32 0, i32 0
  %77 = load i32, i32* %i, align 4
  %add.ptr83 = getelementptr inbounds i8, i8* %arraydecay, i32 %77
  %call84 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i32 0, i32 0), i8* %add.ptr83, i32 0)
  %78 = load i32, i32* %ret, align 4
  %cmp85 = icmp eq i32 %78, 63
  br i1 %cmp85, label %if.then87, label %if.end99

if.then87:                                        ; preds = %if.end82
  %79 = load i8*, i8** @sh_optarg, align 4
  %cmp88 = icmp eq i8* %79, null
  br i1 %cmp88, label %if.then90, label %if.else91

if.then90:                                        ; preds = %if.then87
  store i32 -2, i32* %ret, align 4
  br label %if.end98

if.else91:                                        ; preds = %if.then87
  %80 = load i8*, i8** @sh_optarg, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %80, i32 0
  %81 = load i8, i8* %arrayidx92, align 1
  %conv93 = sext i8 %81 to i32
  %cmp94 = icmp eq i32 %conv93, 0
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.else91
  store i32 -3, i32* %ret, align 4
  br label %if.end97

if.end97:                                         ; preds = %if.then96, %if.else91
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.then90
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end82
  %82 = load i32, i32* %ret, align 4
  %cmp100 = icmp eq i32 %82, -1
  br i1 %cmp100, label %if.then102, label %if.end105

if.then102:                                       ; preds = %if.end99
  %call103 = call i32 @getopts_unbind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  %83 = load i8*, i8** %name, align 4
  %call104 = call i32 @getopts_bind_variable(i8* %83, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end105:                                        ; preds = %if.end99
  %84 = load i32, i32* %ret, align 4
  %cmp106 = icmp eq i32 %84, -2
  br i1 %cmp106, label %if.then108, label %if.end120

if.then108:                                       ; preds = %if.end105
  %85 = load i8*, i8** %name, align 4
  %call109 = call i32 @getopts_bind_variable(i8* %85, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store i32 %call109, i32* %ret, align 4
  %86 = load i32, i32* %special_error, align 4
  %tobool110 = icmp ne i32 %86, 0
  br i1 %tobool110, label %if.then111, label %if.else117

if.then111:                                       ; preds = %if.then108
  %87 = load i32, i32* @sh_optopt, align 4
  %conv112 = trunc i32 %87 to i8
  %arrayidx113 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  store i8 %conv112, i8* %arrayidx113, align 1
  %arrayidx114 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 1
  store i8 0, i8* %arrayidx114, align 1
  %arraydecay115 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  %call116 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %arraydecay115, i32 0)
  br label %if.end119

if.else117:                                       ; preds = %if.then108
  %call118 = call i32 @getopts_unbind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  br label %if.end119

if.end119:                                        ; preds = %if.else117, %if.then111
  %88 = load i32, i32* %ret, align 4
  store i32 %88, i32* %retval, align 4
  br label %return

if.end120:                                        ; preds = %if.end105
  %89 = load i32, i32* %ret, align 4
  %cmp121 = icmp eq i32 %89, -3
  br i1 %cmp121, label %if.then123, label %if.end136

if.then123:                                       ; preds = %if.end120
  %90 = load i32, i32* %special_error, align 4
  %tobool124 = icmp ne i32 %90, 0
  br i1 %tobool124, label %if.then125, label %if.else132

if.then125:                                       ; preds = %if.then123
  %91 = load i8*, i8** %name, align 4
  %call126 = call i32 @getopts_bind_variable(i8* %91, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i32 %call126, i32* %ret, align 4
  %92 = load i32, i32* @sh_optopt, align 4
  %conv127 = trunc i32 %92 to i8
  %arrayidx128 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  store i8 %conv127, i8* %arrayidx128, align 1
  %arrayidx129 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 1
  store i8 0, i8* %arrayidx129, align 1
  %arraydecay130 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  %call131 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %arraydecay130, i32 0)
  br label %if.end135

if.else132:                                       ; preds = %if.then123
  %93 = load i8*, i8** %name, align 4
  %call133 = call i32 @getopts_bind_variable(i8* %93, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store i32 %call133, i32* %ret, align 4
  %call134 = call i32 @getopts_unbind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  br label %if.end135

if.end135:                                        ; preds = %if.else132, %if.then125
  %94 = load i32, i32* %ret, align 4
  store i32 %94, i32* %retval, align 4
  br label %return

if.end136:                                        ; preds = %if.end120
  %95 = load i8*, i8** @sh_optarg, align 4
  %call137 = call %struct.variable* @bind_variable(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i8* %95, i32 0)
  %96 = load i32, i32* %ret, align 4
  %conv138 = trunc i32 %96 to i8
  %arrayidx139 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  store i8 %conv138, i8* %arrayidx139, align 1
  %arrayidx140 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 1
  store i8 0, i8* %arrayidx140, align 1
  %97 = load i8*, i8** %name, align 4
  %arraydecay141 = getelementptr inbounds [2 x i8], [2 x i8]* %strval, i32 0, i32 0
  %call142 = call i32 @getopts_bind_variable(i8* %97, i8* %arraydecay141)
  store i32 %call142, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end136, %if.end135, %if.end119, %if.then102, %if.then
  %98 = load i32, i32* %retval, align 4
  ret i32 %98
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare void @sh_getopt_restore_state(i8**) #1

declare i32 @sh_getopt(i32, i8**, i8*) #1

declare i8** @strvec_create(i32) #1

declare %struct.variable* @bind_variable(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @getopts_unbind_variable(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @unbind_variable_noref(i8* %0)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define internal i32 @getopts_bind_variable(i8* %name, i8* %value) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %v = alloca %struct.variable*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %call = call i32 @legal_identifier(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8*, i8** %value.addr, align 4
  %call1 = call %struct.variable* @bind_variable(i8* %1, i8* %2, i32 0)
  store %struct.variable* %call1, %struct.variable** %v, align 4
  %3 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool2 = icmp ne %struct.variable* %3, null
  br i1 %tobool2, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %4 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %4, i32 0, i32 5
  %5 = load i32, i32* %attributes, align 4
  %and = and i32 %5, 2
  %tobool3 = icmp ne i32 %and, 0
  br i1 %tobool3, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes4 = getelementptr inbounds %struct.variable, %struct.variable* %6, i32 0, i32 5
  %7 = load i32, i32* %attributes4, align 4
  %and5 = and i32 %7, 16384
  %tobool6 = icmp ne i32 %and5, 0
  br i1 %tobool6, label %if.then7, label %if.end

if.then7:                                         ; preds = %lor.lhs.false, %land.lhs.true
  store i32 2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false, %if.then
  %8 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool8 = icmp ne %struct.variable* %8, null
  %cond = select i1 %tobool8, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %9 = load i8*, i8** %name.addr, align 4
  call void @sh_invalidid(i8* %9)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.end, %if.then7
  %10 = load i32, i32* %retval, align 4
  ret i32 %10
}

declare i32 @unbind_variable_noref(i8*) #1

declare i32 @legal_identifier(i8*) #1

declare void @sh_invalidid(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
