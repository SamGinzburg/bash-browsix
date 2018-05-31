; ModuleID = 'dispose_cmd.c'
source_filename = "dispose_cmd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.objcache = type { i8*, i32, i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.word_desc = type { i8*, i32 }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.arith_for_com = type { i32, i32, %struct.word_list*, %struct.word_list*, %struct.word_list*, %struct.command* }
%struct.case_com = type { i32, i32, %struct.word_desc*, %struct.pattern_list* }
%struct.pattern_list = type { %struct.pattern_list*, %struct.word_list*, %struct.command*, i32 }
%struct.while_com = type { i32, %struct.command*, %struct.command* }
%struct.if_com = type { i32, %struct.command*, %struct.command*, %struct.command* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }
%struct.connection = type { i32, %struct.command*, %struct.command*, i32 }
%struct.arith_com = type { i32, i32, %struct.word_list* }
%struct.cond_com = type { i32, i32, i32, %struct.word_desc*, %struct.cond_com*, %struct.cond_com* }
%struct.function_def = type { i32, i32, %struct.word_desc*, %struct.command*, i8* }
%struct.select_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.group_com = type { i32, %struct.command* }
%struct.subshell_com = type { i32, %struct.command* }
%struct.coproc_com = type { i32, i8*, %struct.command* }

@.str = private unnamed_addr constant [14 x i8] c"dispose_cmd.c\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"dispose_command\00", align 1
@wdcache = external global %struct.objcache, align 4
@wlcache = external global %struct.objcache, align 4

; Function Attrs: noinline nounwind
define void @dispose_command(%struct.command* %command) #0 {
entry:
  %command.addr = alloca %struct.command*, align 4
  %c = alloca %struct.for_com*, align 4
  %c10 = alloca %struct.arith_for_com*, align 4
  %c32 = alloca %struct.case_com*, align 4
  %t = alloca %struct.pattern_list*, align 4
  %p = alloca %struct.pattern_list*, align 4
  %c37 = alloca %struct.while_com*, align 4
  %c42 = alloca %struct.if_com*, align 4
  %c46 = alloca %struct.simple_com*, align 4
  %c50 = alloca %struct.connection*, align 4
  %c53 = alloca %struct.arith_com*, align 4
  %c56 = alloca %struct.cond_com*, align 4
  %c59 = alloca %struct.function_def*, align 4
  store %struct.command* %command, %struct.command** %command.addr, align 4
  %0 = load %struct.command*, %struct.command** %command.addr, align 4
  %cmp = icmp eq %struct.command* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects = getelementptr inbounds %struct.command, %struct.command* %1, i32 0, i32 3
  %2 = load %struct.redirect*, %struct.redirect** %redirects, align 4
  %tobool = icmp ne %struct.redirect* %2, null
  br i1 %tobool, label %if.then1, label %if.end3

if.then1:                                         ; preds = %if.end
  %3 = load %struct.command*, %struct.command** %command.addr, align 4
  %redirects2 = getelementptr inbounds %struct.command, %struct.command* %3, i32 0, i32 3
  %4 = load %struct.redirect*, %struct.redirect** %redirects2, align 4
  call void @dispose_redirects(%struct.redirect* %4)
  br label %if.end3

if.end3:                                          ; preds = %if.then1, %if.end
  %5 = load %struct.command*, %struct.command** %command.addr, align 4
  %type = getelementptr inbounds %struct.command, %struct.command* %5, i32 0, i32 0
  %6 = load i32, i32* %type, align 4
  switch i32 %6, label %sw.default [
    i32 0, label %sw.bb
    i32 5, label %sw.bb
    i32 12, label %sw.bb9
    i32 9, label %sw.bb13
    i32 13, label %sw.bb18
    i32 14, label %sw.bb23
    i32 1, label %sw.bb31
    i32 8, label %sw.bb36
    i32 2, label %sw.bb36
    i32 3, label %sw.bb41
    i32 4, label %sw.bb45
    i32 6, label %sw.bb49
    i32 10, label %sw.bb52
    i32 11, label %sw.bb55
    i32 7, label %sw.bb58
  ]

sw.bb:                                            ; preds = %if.end3, %if.end3
  %7 = load %struct.command*, %struct.command** %command.addr, align 4
  %type4 = getelementptr inbounds %struct.command, %struct.command* %7, i32 0, i32 0
  %8 = load i32, i32* %type4, align 4
  %cmp5 = icmp eq i32 %8, 5
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %sw.bb
  %9 = load %struct.command*, %struct.command** %command.addr, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %9, i32 0, i32 4
  %Select = bitcast %union.anon* %value to %struct.select_com**
  %10 = load %struct.select_com*, %struct.select_com** %Select, align 4
  %11 = bitcast %struct.select_com* %10 to %struct.for_com*
  store %struct.for_com* %11, %struct.for_com** %c, align 4
  br label %if.end8

if.else:                                          ; preds = %sw.bb
  %12 = load %struct.command*, %struct.command** %command.addr, align 4
  %value7 = getelementptr inbounds %struct.command, %struct.command* %12, i32 0, i32 4
  %For = bitcast %union.anon* %value7 to %struct.for_com**
  %13 = load %struct.for_com*, %struct.for_com** %For, align 4
  store %struct.for_com* %13, %struct.for_com** %c, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.else, %if.then6
  %14 = load %struct.for_com*, %struct.for_com** %c, align 4
  %name = getelementptr inbounds %struct.for_com, %struct.for_com* %14, i32 0, i32 2
  %15 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  call void @dispose_word(%struct.word_desc* %15)
  %16 = load %struct.for_com*, %struct.for_com** %c, align 4
  %map_list = getelementptr inbounds %struct.for_com, %struct.for_com* %16, i32 0, i32 3
  %17 = load %struct.word_list*, %struct.word_list** %map_list, align 4
  call void @dispose_words(%struct.word_list* %17)
  %18 = load %struct.for_com*, %struct.for_com** %c, align 4
  %action = getelementptr inbounds %struct.for_com, %struct.for_com* %18, i32 0, i32 4
  %19 = load %struct.command*, %struct.command** %action, align 4
  call void @dispose_command(%struct.command* %19)
  %20 = load %struct.for_com*, %struct.for_com** %c, align 4
  %21 = bitcast %struct.for_com* %20 to i8*
  call void @sh_xfree(i8* %21, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 62)
  br label %sw.epilog

sw.bb9:                                           ; preds = %if.end3
  %22 = load %struct.command*, %struct.command** %command.addr, align 4
  %value11 = getelementptr inbounds %struct.command, %struct.command* %22, i32 0, i32 4
  %ArithFor = bitcast %union.anon* %value11 to %struct.arith_for_com**
  %23 = load %struct.arith_for_com*, %struct.arith_for_com** %ArithFor, align 4
  store %struct.arith_for_com* %23, %struct.arith_for_com** %c10, align 4
  %24 = load %struct.arith_for_com*, %struct.arith_for_com** %c10, align 4
  %init = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %24, i32 0, i32 2
  %25 = load %struct.word_list*, %struct.word_list** %init, align 4
  call void @dispose_words(%struct.word_list* %25)
  %26 = load %struct.arith_for_com*, %struct.arith_for_com** %c10, align 4
  %test = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %26, i32 0, i32 3
  %27 = load %struct.word_list*, %struct.word_list** %test, align 4
  call void @dispose_words(%struct.word_list* %27)
  %28 = load %struct.arith_for_com*, %struct.arith_for_com** %c10, align 4
  %step = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %28, i32 0, i32 4
  %29 = load %struct.word_list*, %struct.word_list** %step, align 4
  call void @dispose_words(%struct.word_list* %29)
  %30 = load %struct.arith_for_com*, %struct.arith_for_com** %c10, align 4
  %action12 = getelementptr inbounds %struct.arith_for_com, %struct.arith_for_com* %30, i32 0, i32 5
  %31 = load %struct.command*, %struct.command** %action12, align 4
  call void @dispose_command(%struct.command* %31)
  %32 = load %struct.arith_for_com*, %struct.arith_for_com** %c10, align 4
  %33 = bitcast %struct.arith_for_com* %32 to i8*
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 76)
  br label %sw.epilog

sw.bb13:                                          ; preds = %if.end3
  %34 = load %struct.command*, %struct.command** %command.addr, align 4
  %value14 = getelementptr inbounds %struct.command, %struct.command* %34, i32 0, i32 4
  %Group = bitcast %union.anon* %value14 to %struct.group_com**
  %35 = load %struct.group_com*, %struct.group_com** %Group, align 4
  %command15 = getelementptr inbounds %struct.group_com, %struct.group_com* %35, i32 0, i32 1
  %36 = load %struct.command*, %struct.command** %command15, align 4
  call void @dispose_command(%struct.command* %36)
  %37 = load %struct.command*, %struct.command** %command.addr, align 4
  %value16 = getelementptr inbounds %struct.command, %struct.command* %37, i32 0, i32 4
  %Group17 = bitcast %union.anon* %value16 to %struct.group_com**
  %38 = load %struct.group_com*, %struct.group_com** %Group17, align 4
  %39 = bitcast %struct.group_com* %38 to i8*
  call void @sh_xfree(i8* %39, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 84)
  br label %sw.epilog

sw.bb18:                                          ; preds = %if.end3
  %40 = load %struct.command*, %struct.command** %command.addr, align 4
  %value19 = getelementptr inbounds %struct.command, %struct.command* %40, i32 0, i32 4
  %Subshell = bitcast %union.anon* %value19 to %struct.subshell_com**
  %41 = load %struct.subshell_com*, %struct.subshell_com** %Subshell, align 4
  %command20 = getelementptr inbounds %struct.subshell_com, %struct.subshell_com* %41, i32 0, i32 1
  %42 = load %struct.command*, %struct.command** %command20, align 4
  call void @dispose_command(%struct.command* %42)
  %43 = load %struct.command*, %struct.command** %command.addr, align 4
  %value21 = getelementptr inbounds %struct.command, %struct.command* %43, i32 0, i32 4
  %Subshell22 = bitcast %union.anon* %value21 to %struct.subshell_com**
  %44 = load %struct.subshell_com*, %struct.subshell_com** %Subshell22, align 4
  %45 = bitcast %struct.subshell_com* %44 to i8*
  call void @sh_xfree(i8* %45, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 91)
  br label %sw.epilog

sw.bb23:                                          ; preds = %if.end3
  %46 = load %struct.command*, %struct.command** %command.addr, align 4
  %value24 = getelementptr inbounds %struct.command, %struct.command* %46, i32 0, i32 4
  %Coproc = bitcast %union.anon* %value24 to %struct.coproc_com**
  %47 = load %struct.coproc_com*, %struct.coproc_com** %Coproc, align 4
  %name25 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %47, i32 0, i32 1
  %48 = load i8*, i8** %name25, align 4
  call void @sh_xfree(i8* %48, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 97)
  %49 = load %struct.command*, %struct.command** %command.addr, align 4
  %value26 = getelementptr inbounds %struct.command, %struct.command* %49, i32 0, i32 4
  %Coproc27 = bitcast %union.anon* %value26 to %struct.coproc_com**
  %50 = load %struct.coproc_com*, %struct.coproc_com** %Coproc27, align 4
  %command28 = getelementptr inbounds %struct.coproc_com, %struct.coproc_com* %50, i32 0, i32 2
  %51 = load %struct.command*, %struct.command** %command28, align 4
  call void @dispose_command(%struct.command* %51)
  %52 = load %struct.command*, %struct.command** %command.addr, align 4
  %value29 = getelementptr inbounds %struct.command, %struct.command* %52, i32 0, i32 4
  %Coproc30 = bitcast %union.anon* %value29 to %struct.coproc_com**
  %53 = load %struct.coproc_com*, %struct.coproc_com** %Coproc30, align 4
  %54 = bitcast %struct.coproc_com* %53 to i8*
  call void @sh_xfree(i8* %54, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 99)
  br label %sw.epilog

sw.bb31:                                          ; preds = %if.end3
  %55 = load %struct.command*, %struct.command** %command.addr, align 4
  %value33 = getelementptr inbounds %struct.command, %struct.command* %55, i32 0, i32 4
  %Case = bitcast %union.anon* %value33 to %struct.case_com**
  %56 = load %struct.case_com*, %struct.case_com** %Case, align 4
  store %struct.case_com* %56, %struct.case_com** %c32, align 4
  %57 = load %struct.case_com*, %struct.case_com** %c32, align 4
  %word = getelementptr inbounds %struct.case_com, %struct.case_com* %57, i32 0, i32 2
  %58 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  call void @dispose_word(%struct.word_desc* %58)
  %59 = load %struct.case_com*, %struct.case_com** %c32, align 4
  %clauses = getelementptr inbounds %struct.case_com, %struct.case_com* %59, i32 0, i32 3
  %60 = load %struct.pattern_list*, %struct.pattern_list** %clauses, align 4
  store %struct.pattern_list* %60, %struct.pattern_list** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %sw.bb31
  %61 = load %struct.pattern_list*, %struct.pattern_list** %p, align 4
  %tobool34 = icmp ne %struct.pattern_list* %61, null
  br i1 %tobool34, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %62 = load %struct.pattern_list*, %struct.pattern_list** %p, align 4
  %patterns = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %62, i32 0, i32 1
  %63 = load %struct.word_list*, %struct.word_list** %patterns, align 4
  call void @dispose_words(%struct.word_list* %63)
  %64 = load %struct.pattern_list*, %struct.pattern_list** %p, align 4
  %action35 = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %64, i32 0, i32 2
  %65 = load %struct.command*, %struct.command** %action35, align 4
  call void @dispose_command(%struct.command* %65)
  %66 = load %struct.pattern_list*, %struct.pattern_list** %p, align 4
  store %struct.pattern_list* %66, %struct.pattern_list** %t, align 4
  %67 = load %struct.pattern_list*, %struct.pattern_list** %p, align 4
  %next = getelementptr inbounds %struct.pattern_list, %struct.pattern_list* %67, i32 0, i32 0
  %68 = load %struct.pattern_list*, %struct.pattern_list** %next, align 4
  store %struct.pattern_list* %68, %struct.pattern_list** %p, align 4
  %69 = load %struct.pattern_list*, %struct.pattern_list** %t, align 4
  %70 = bitcast %struct.pattern_list* %69 to i8*
  call void @sh_xfree(i8* %70, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 117)
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %71 = load %struct.case_com*, %struct.case_com** %c32, align 4
  %72 = bitcast %struct.case_com* %71 to i8*
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 119)
  br label %sw.epilog

sw.bb36:                                          ; preds = %if.end3, %if.end3
  %73 = load %struct.command*, %struct.command** %command.addr, align 4
  %value38 = getelementptr inbounds %struct.command, %struct.command* %73, i32 0, i32 4
  %While = bitcast %union.anon* %value38 to %struct.while_com**
  %74 = load %struct.while_com*, %struct.while_com** %While, align 4
  store %struct.while_com* %74, %struct.while_com** %c37, align 4
  %75 = load %struct.while_com*, %struct.while_com** %c37, align 4
  %test39 = getelementptr inbounds %struct.while_com, %struct.while_com* %75, i32 0, i32 1
  %76 = load %struct.command*, %struct.command** %test39, align 4
  call void @dispose_command(%struct.command* %76)
  %77 = load %struct.while_com*, %struct.while_com** %c37, align 4
  %action40 = getelementptr inbounds %struct.while_com, %struct.while_com* %77, i32 0, i32 2
  %78 = load %struct.command*, %struct.command** %action40, align 4
  call void @dispose_command(%struct.command* %78)
  %79 = load %struct.while_com*, %struct.while_com** %c37, align 4
  %80 = bitcast %struct.while_com* %79 to i8*
  call void @sh_xfree(i8* %80, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 131)
  br label %sw.epilog

sw.bb41:                                          ; preds = %if.end3
  %81 = load %struct.command*, %struct.command** %command.addr, align 4
  %value43 = getelementptr inbounds %struct.command, %struct.command* %81, i32 0, i32 4
  %If = bitcast %union.anon* %value43 to %struct.if_com**
  %82 = load %struct.if_com*, %struct.if_com** %If, align 4
  store %struct.if_com* %82, %struct.if_com** %c42, align 4
  %83 = load %struct.if_com*, %struct.if_com** %c42, align 4
  %test44 = getelementptr inbounds %struct.if_com, %struct.if_com* %83, i32 0, i32 1
  %84 = load %struct.command*, %struct.command** %test44, align 4
  call void @dispose_command(%struct.command* %84)
  %85 = load %struct.if_com*, %struct.if_com** %c42, align 4
  %true_case = getelementptr inbounds %struct.if_com, %struct.if_com* %85, i32 0, i32 2
  %86 = load %struct.command*, %struct.command** %true_case, align 4
  call void @dispose_command(%struct.command* %86)
  %87 = load %struct.if_com*, %struct.if_com** %c42, align 4
  %false_case = getelementptr inbounds %struct.if_com, %struct.if_com* %87, i32 0, i32 3
  %88 = load %struct.command*, %struct.command** %false_case, align 4
  call void @dispose_command(%struct.command* %88)
  %89 = load %struct.if_com*, %struct.if_com** %c42, align 4
  %90 = bitcast %struct.if_com* %89 to i8*
  call void @sh_xfree(i8* %90, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 143)
  br label %sw.epilog

sw.bb45:                                          ; preds = %if.end3
  %91 = load %struct.command*, %struct.command** %command.addr, align 4
  %value47 = getelementptr inbounds %struct.command, %struct.command* %91, i32 0, i32 4
  %Simple = bitcast %union.anon* %value47 to %struct.simple_com**
  %92 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  store %struct.simple_com* %92, %struct.simple_com** %c46, align 4
  %93 = load %struct.simple_com*, %struct.simple_com** %c46, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %93, i32 0, i32 2
  %94 = load %struct.word_list*, %struct.word_list** %words, align 4
  call void @dispose_words(%struct.word_list* %94)
  %95 = load %struct.simple_com*, %struct.simple_com** %c46, align 4
  %redirects48 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %95, i32 0, i32 3
  %96 = load %struct.redirect*, %struct.redirect** %redirects48, align 4
  call void @dispose_redirects(%struct.redirect* %96)
  %97 = load %struct.simple_com*, %struct.simple_com** %c46, align 4
  %98 = bitcast %struct.simple_com* %97 to i8*
  call void @sh_xfree(i8* %98, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 154)
  br label %sw.epilog

sw.bb49:                                          ; preds = %if.end3
  %99 = load %struct.command*, %struct.command** %command.addr, align 4
  %value51 = getelementptr inbounds %struct.command, %struct.command* %99, i32 0, i32 4
  %Connection = bitcast %union.anon* %value51 to %struct.connection**
  %100 = load %struct.connection*, %struct.connection** %Connection, align 4
  store %struct.connection* %100, %struct.connection** %c50, align 4
  %101 = load %struct.connection*, %struct.connection** %c50, align 4
  %first = getelementptr inbounds %struct.connection, %struct.connection* %101, i32 0, i32 1
  %102 = load %struct.command*, %struct.command** %first, align 4
  call void @dispose_command(%struct.command* %102)
  %103 = load %struct.connection*, %struct.connection** %c50, align 4
  %second = getelementptr inbounds %struct.connection, %struct.connection* %103, i32 0, i32 2
  %104 = load %struct.command*, %struct.command** %second, align 4
  call void @dispose_command(%struct.command* %104)
  %105 = load %struct.connection*, %struct.connection** %c50, align 4
  %106 = bitcast %struct.connection* %105 to i8*
  call void @sh_xfree(i8* %106, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 165)
  br label %sw.epilog

sw.bb52:                                          ; preds = %if.end3
  %107 = load %struct.command*, %struct.command** %command.addr, align 4
  %value54 = getelementptr inbounds %struct.command, %struct.command* %107, i32 0, i32 4
  %Arith = bitcast %union.anon* %value54 to %struct.arith_com**
  %108 = load %struct.arith_com*, %struct.arith_com** %Arith, align 4
  store %struct.arith_com* %108, %struct.arith_com** %c53, align 4
  %109 = load %struct.arith_com*, %struct.arith_com** %c53, align 4
  %exp = getelementptr inbounds %struct.arith_com, %struct.arith_com* %109, i32 0, i32 2
  %110 = load %struct.word_list*, %struct.word_list** %exp, align 4
  call void @dispose_words(%struct.word_list* %110)
  %111 = load %struct.arith_com*, %struct.arith_com** %c53, align 4
  %112 = bitcast %struct.arith_com* %111 to i8*
  call void @sh_xfree(i8* %112, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 176)
  br label %sw.epilog

sw.bb55:                                          ; preds = %if.end3
  %113 = load %struct.command*, %struct.command** %command.addr, align 4
  %value57 = getelementptr inbounds %struct.command, %struct.command* %113, i32 0, i32 4
  %Cond = bitcast %union.anon* %value57 to %struct.cond_com**
  %114 = load %struct.cond_com*, %struct.cond_com** %Cond, align 4
  store %struct.cond_com* %114, %struct.cond_com** %c56, align 4
  %115 = load %struct.cond_com*, %struct.cond_com** %c56, align 4
  call void @dispose_cond_node(%struct.cond_com* %115)
  br label %sw.epilog

sw.bb58:                                          ; preds = %if.end3
  %116 = load %struct.command*, %struct.command** %command.addr, align 4
  %value60 = getelementptr inbounds %struct.command, %struct.command* %116, i32 0, i32 4
  %Function_def = bitcast %union.anon* %value60 to %struct.function_def**
  %117 = load %struct.function_def*, %struct.function_def** %Function_def, align 4
  store %struct.function_def* %117, %struct.function_def** %c59, align 4
  %118 = load %struct.function_def*, %struct.function_def** %c59, align 4
  call void @dispose_function_def(%struct.function_def* %118)
  br label %sw.epilog

sw.default:                                       ; preds = %if.end3
  %119 = load %struct.command*, %struct.command** %command.addr, align 4
  %type61 = getelementptr inbounds %struct.command, %struct.command* %119, i32 0, i32 0
  %120 = load i32, i32* %type61, align 4
  call void @command_error(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i32 1, i32 %120, i32 0)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb58, %sw.bb55, %sw.bb52, %sw.bb49, %sw.bb45, %sw.bb41, %sw.bb36, %for.end, %sw.bb23, %sw.bb18, %sw.bb13, %sw.bb9, %if.end8
  %121 = load %struct.command*, %struct.command** %command.addr, align 4
  %122 = bitcast %struct.command* %121 to i8*
  call void @sh_xfree(i8* %122, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 205)
  br label %return

return:                                           ; preds = %sw.epilog, %if.then
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_redirects(%struct.redirect* %list) #0 {
entry:
  %list.addr = alloca %struct.redirect*, align 4
  %t = alloca %struct.redirect*, align 4
  store %struct.redirect* %list, %struct.redirect** %list.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %tobool = icmp ne %struct.redirect* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  store %struct.redirect* %1, %struct.redirect** %t, align 4
  %2 = load %struct.redirect*, %struct.redirect** %list.addr, align 4
  %next = getelementptr inbounds %struct.redirect, %struct.redirect* %2, i32 0, i32 0
  %3 = load %struct.redirect*, %struct.redirect** %next, align 4
  store %struct.redirect* %3, %struct.redirect** %list.addr, align 4
  %4 = load %struct.redirect*, %struct.redirect** %t, align 4
  %rflags = getelementptr inbounds %struct.redirect, %struct.redirect* %4, i32 0, i32 2
  %5 = load i32, i32* %rflags, align 4
  %and = and i32 %5, 1
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %6 = load %struct.redirect*, %struct.redirect** %t, align 4
  %redirector = getelementptr inbounds %struct.redirect, %struct.redirect* %6, i32 0, i32 1
  %filename = bitcast %union.REDIRECTEE* %redirector to %struct.word_desc**
  %7 = load %struct.word_desc*, %struct.word_desc** %filename, align 4
  call void @dispose_word(%struct.word_desc* %7)
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %8 = load %struct.redirect*, %struct.redirect** %t, align 4
  %instruction = getelementptr inbounds %struct.redirect, %struct.redirect* %8, i32 0, i32 4
  %9 = load i32, i32* %instruction, align 4
  switch i32 %9, label %sw.default [
    i32 4, label %sw.bb
    i32 8, label %sw.bb
    i32 5, label %sw.bb2
    i32 0, label %sw.bb2
    i32 1, label %sw.bb2
    i32 2, label %sw.bb2
    i32 3, label %sw.bb2
    i32 10, label %sw.bb2
    i32 19, label %sw.bb2
    i32 11, label %sw.bb2
    i32 12, label %sw.bb2
    i32 13, label %sw.bb2
    i32 14, label %sw.bb2
    i32 17, label %sw.bb2
    i32 18, label %sw.bb2
  ]

sw.bb:                                            ; preds = %if.end, %if.end
  %10 = load %struct.redirect*, %struct.redirect** %t, align 4
  %here_doc_eof = getelementptr inbounds %struct.redirect, %struct.redirect* %10, i32 0, i32 6
  %11 = load i8*, i8** %here_doc_eof, align 4
  call void @sh_xfree(i8* %11, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 320)
  br label %sw.bb2

sw.bb2:                                           ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %sw.bb
  %12 = load %struct.redirect*, %struct.redirect** %t, align 4
  %redirectee = getelementptr inbounds %struct.redirect, %struct.redirect* %12, i32 0, i32 5
  %filename3 = bitcast %union.REDIRECTEE* %redirectee to %struct.word_desc**
  %13 = load %struct.word_desc*, %struct.word_desc** %filename3, align 4
  call void @dispose_word(%struct.word_desc* %13)
  br label %sw.default

sw.default:                                       ; preds = %if.end, %sw.bb2
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  %14 = load %struct.redirect*, %struct.redirect** %t, align 4
  %15 = bitcast %struct.redirect* %14 to i8*
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 340)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_word(%struct.word_desc* %w) #0 {
entry:
  %w.addr = alloca %struct.word_desc*, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store %struct.word_desc* %w, %struct.word_desc** %w.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 0
  %1 = load i8*, i8** %word, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %2 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  call void @sh_xfree(i8* %3, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 249)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  br label %do.body2

do.body2:                                         ; preds = %do.end
  %4 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 1), align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %if.then3, label %if.else26

if.then3:                                         ; preds = %do.body2
  br label %do.body4

do.body4:                                         ; preds = %if.then3
  %6 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %7 = bitcast %struct.word_desc* %6 to i8*
  store i8* %7, i8** %mzp, align 4
  store i32 8, i32* %mctmp, align 4
  %8 = load i32, i32* %mctmp, align 4
  %cmp5 = icmp ult i32 %8, 8
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %do.body4
  store i32 0, i32* %mcn, align 4
  br label %if.end7

if.else:                                          ; preds = %do.body4
  %9 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %9, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %10 = load i32, i32* %mctmp, align 4
  %and = and i32 %10, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then6
  %11 = load i32, i32* %mctmp, align 4
  switch i32 %11, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb8
    i32 6, label %sw.bb10
    i32 5, label %sw.bb12
    i32 4, label %sw.bb14
    i32 3, label %sw.bb16
    i32 2, label %sw.bb18
    i32 1, label %sw.bb20
  ]

sw.bb:                                            ; preds = %if.end7
  br label %for.cond

for.cond:                                         ; preds = %if.end24, %sw.bb
  %12 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %12, align 1
  br label %sw.bb8

sw.bb8:                                           ; preds = %if.end7, %for.cond
  %13 = load i8*, i8** %mzp, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr9, i8** %mzp, align 4
  store i8 -33, i8* %13, align 1
  br label %sw.bb10

sw.bb10:                                          ; preds = %if.end7, %sw.bb8
  %14 = load i8*, i8** %mzp, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr11, i8** %mzp, align 4
  store i8 -33, i8* %14, align 1
  br label %sw.bb12

sw.bb12:                                          ; preds = %if.end7, %sw.bb10
  %15 = load i8*, i8** %mzp, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr13, i8** %mzp, align 4
  store i8 -33, i8* %15, align 1
  br label %sw.bb14

sw.bb14:                                          ; preds = %if.end7, %sw.bb12
  %16 = load i8*, i8** %mzp, align 4
  %incdec.ptr15 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr15, i8** %mzp, align 4
  store i8 -33, i8* %16, align 1
  br label %sw.bb16

sw.bb16:                                          ; preds = %if.end7, %sw.bb14
  %17 = load i8*, i8** %mzp, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr17, i8** %mzp, align 4
  store i8 -33, i8* %17, align 1
  br label %sw.bb18

sw.bb18:                                          ; preds = %if.end7, %sw.bb16
  %18 = load i8*, i8** %mzp, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr19, i8** %mzp, align 4
  store i8 -33, i8* %18, align 1
  br label %sw.bb20

sw.bb20:                                          ; preds = %if.end7, %sw.bb18
  %19 = load i8*, i8** %mzp, align 4
  %incdec.ptr21 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr21, i8** %mzp, align 4
  store i8 -33, i8* %19, align 1
  %20 = load i32, i32* %mcn, align 4
  %cmp22 = icmp sle i32 %20, 0
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %sw.bb20
  br label %for.end

if.end24:                                         ; preds = %sw.bb20
  %21 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %21, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then23
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end7
  br label %do.end25

do.end25:                                         ; preds = %sw.epilog
  %22 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %23 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 0), align 4
  %24 = bitcast i8* %23 to %struct.word_desc**
  %25 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %struct.word_desc*, %struct.word_desc** %24, i32 %25
  store %struct.word_desc* %22, %struct.word_desc** %arrayidx, align 4
  br label %if.end27

if.else26:                                        ; preds = %do.body2
  %26 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %27 = bitcast %struct.word_desc* %26 to i8*
  call void @sh_xfree(i8* %27, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 250)
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %do.end25
  br label %do.end28

do.end28:                                         ; preds = %if.end27
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_words(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %t = alloca %struct.word_list*, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end23, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %1, %struct.word_list** %t, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 0
  %3 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %3, %struct.word_list** %list.addr, align 4
  %4 = load %struct.word_list*, %struct.word_list** %t, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  call void @dispose_word(%struct.word_desc* %5)
  br label %do.body

do.body:                                          ; preds = %while.body
  %6 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 1), align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %if.then, label %if.else21

if.then:                                          ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %if.then
  %8 = load %struct.word_list*, %struct.word_list** %t, align 4
  %9 = bitcast %struct.word_list* %8 to i8*
  store i8* %9, i8** %mzp, align 4
  store i32 8, i32* %mctmp, align 4
  %10 = load i32, i32* %mctmp, align 4
  %cmp2 = icmp ult i32 %10, 8
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %do.body1
  store i32 0, i32* %mcn, align 4
  br label %if.end

if.else:                                          ; preds = %do.body1
  %11 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %11, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %12 = load i32, i32* %mctmp, align 4
  %and = and i32 %12, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %13 = load i32, i32* %mctmp, align 4
  switch i32 %13, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb4
    i32 6, label %sw.bb6
    i32 5, label %sw.bb8
    i32 4, label %sw.bb10
    i32 3, label %sw.bb12
    i32 2, label %sw.bb14
    i32 1, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %if.end20, %sw.bb
  %14 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %14, align 1
  br label %sw.bb4

sw.bb4:                                           ; preds = %if.end, %for.cond
  %15 = load i8*, i8** %mzp, align 4
  %incdec.ptr5 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr5, i8** %mzp, align 4
  store i8 -33, i8* %15, align 1
  br label %sw.bb6

sw.bb6:                                           ; preds = %if.end, %sw.bb4
  %16 = load i8*, i8** %mzp, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr7, i8** %mzp, align 4
  store i8 -33, i8* %16, align 1
  br label %sw.bb8

sw.bb8:                                           ; preds = %if.end, %sw.bb6
  %17 = load i8*, i8** %mzp, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr9, i8** %mzp, align 4
  store i8 -33, i8* %17, align 1
  br label %sw.bb10

sw.bb10:                                          ; preds = %if.end, %sw.bb8
  %18 = load i8*, i8** %mzp, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr11, i8** %mzp, align 4
  store i8 -33, i8* %18, align 1
  br label %sw.bb12

sw.bb12:                                          ; preds = %if.end, %sw.bb10
  %19 = load i8*, i8** %mzp, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr13, i8** %mzp, align 4
  store i8 -33, i8* %19, align 1
  br label %sw.bb14

sw.bb14:                                          ; preds = %if.end, %sw.bb12
  %20 = load i8*, i8** %mzp, align 4
  %incdec.ptr15 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr15, i8** %mzp, align 4
  store i8 -33, i8* %20, align 1
  br label %sw.bb16

sw.bb16:                                          ; preds = %if.end, %sw.bb14
  %21 = load i8*, i8** %mzp, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr17, i8** %mzp, align 4
  store i8 -33, i8* %21, align 1
  %22 = load i32, i32* %mcn, align 4
  %cmp18 = icmp sle i32 %22, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %sw.bb16
  br label %for.end

if.end20:                                         ; preds = %sw.bb16
  %23 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %23, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then19
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end
  br label %do.end

do.end:                                           ; preds = %sw.epilog
  %24 = load %struct.word_list*, %struct.word_list** %t, align 4
  %25 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 0), align 4
  %26 = bitcast i8* %25 to %struct.word_list**
  %27 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wlcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %struct.word_list*, %struct.word_list** %26, i32 %27
  store %struct.word_list* %24, %struct.word_list** %arrayidx, align 4
  br label %if.end22

if.else21:                                        ; preds = %do.body
  %28 = load %struct.word_list*, %struct.word_list** %t, align 4
  %29 = bitcast %struct.word_list* %28 to i8*
  call void @sh_xfree(i8* %29, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 277)
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %do.end
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define void @dispose_cond_node(%struct.cond_com* %cond) #0 {
entry:
  %cond.addr = alloca %struct.cond_com*, align 4
  store %struct.cond_com* %cond, %struct.cond_com** %cond.addr, align 4
  %0 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %tobool = icmp ne %struct.cond_com* %0, null
  br i1 %tobool, label %if.then, label %if.end12

if.then:                                          ; preds = %entry
  %1 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left = getelementptr inbounds %struct.cond_com, %struct.cond_com* %1, i32 0, i32 4
  %2 = load %struct.cond_com*, %struct.cond_com** %left, align 4
  %tobool1 = icmp ne %struct.cond_com* %2, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %3 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %left3 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %3, i32 0, i32 4
  %4 = load %struct.cond_com*, %struct.cond_com** %left3, align 4
  call void @dispose_cond_node(%struct.cond_com* %4)
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %5 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right = getelementptr inbounds %struct.cond_com, %struct.cond_com* %5, i32 0, i32 5
  %6 = load %struct.cond_com*, %struct.cond_com** %right, align 4
  %tobool4 = icmp ne %struct.cond_com* %6, null
  br i1 %tobool4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %7 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %right6 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %7, i32 0, i32 5
  %8 = load %struct.cond_com*, %struct.cond_com** %right6, align 4
  call void @dispose_cond_node(%struct.cond_com* %8)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %9 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op = getelementptr inbounds %struct.cond_com, %struct.cond_com* %9, i32 0, i32 3
  %10 = load %struct.word_desc*, %struct.word_desc** %op, align 4
  %tobool8 = icmp ne %struct.word_desc* %10, null
  br i1 %tobool8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end7
  %11 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %op10 = getelementptr inbounds %struct.cond_com, %struct.cond_com* %11, i32 0, i32 3
  %12 = load %struct.word_desc*, %struct.word_desc** %op10, align 4
  call void @dispose_word(%struct.word_desc* %12)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end7
  %13 = load %struct.cond_com*, %struct.cond_com** %cond.addr, align 4
  %14 = bitcast %struct.cond_com* %13 to i8*
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 222)
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %entry
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_function_def(%struct.function_def* %c) #0 {
entry:
  %c.addr = alloca %struct.function_def*, align 4
  store %struct.function_def* %c, %struct.function_def** %c.addr, align 4
  %0 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  call void @dispose_function_def_contents(%struct.function_def* %0)
  %1 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  %2 = bitcast %struct.function_def* %1 to i8*
  call void @sh_xfree(i8* %2, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 241)
  ret void
}

declare void @command_error(i8*, i32, i32, i32) #1

; Function Attrs: noinline nounwind
define void @dispose_function_def_contents(%struct.function_def* %c) #0 {
entry:
  %c.addr = alloca %struct.function_def*, align 4
  store %struct.function_def* %c, %struct.function_def** %c.addr, align 4
  %0 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  %name = getelementptr inbounds %struct.function_def, %struct.function_def* %0, i32 0, i32 2
  %1 = load %struct.word_desc*, %struct.word_desc** %name, align 4
  call void @dispose_word(%struct.word_desc* %1)
  %2 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  %command = getelementptr inbounds %struct.function_def, %struct.function_def* %2, i32 0, i32 3
  %3 = load %struct.command*, %struct.command** %command, align 4
  call void @dispose_command(%struct.command* %3)
  br label %do.body

do.body:                                          ; preds = %entry
  %4 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  %source_file = getelementptr inbounds %struct.function_def, %struct.function_def* %4, i32 0, i32 4
  %5 = load i8*, i8** %source_file, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %do.body
  %6 = load %struct.function_def*, %struct.function_def** %c.addr, align 4
  %source_file1 = getelementptr inbounds %struct.function_def, %struct.function_def* %6, i32 0, i32 4
  %7 = load i8*, i8** %source_file1, align 4
  call void @sh_xfree(i8* %7, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 233)
  br label %if.end

if.end:                                           ; preds = %if.then, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  ret void
}

; Function Attrs: noinline nounwind
define void @dispose_word_desc(%struct.word_desc* %w) #0 {
entry:
  %w.addr = alloca %struct.word_desc*, align 4
  %mzp = alloca i8*, align 4
  %mctmp = alloca i32, align 4
  %mcn = alloca i32, align 4
  store %struct.word_desc* %w, %struct.word_desc** %w.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %word = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 0
  store i8* null, i8** %word, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %1 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 1), align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %if.then, label %if.else21

if.then:                                          ; preds = %do.body
  br label %do.body1

do.body1:                                         ; preds = %if.then
  %3 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %4 = bitcast %struct.word_desc* %3 to i8*
  store i8* %4, i8** %mzp, align 4
  store i32 8, i32* %mctmp, align 4
  %5 = load i32, i32* %mctmp, align 4
  %cmp2 = icmp ult i32 %5, 8
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %do.body1
  store i32 0, i32* %mcn, align 4
  br label %if.end

if.else:                                          ; preds = %do.body1
  %6 = load i32, i32* %mctmp, align 4
  %sub = sub i32 %6, 1
  %div = udiv i32 %sub, 8
  store i32 %div, i32* %mcn, align 4
  %7 = load i32, i32* %mctmp, align 4
  %and = and i32 %7, 7
  store i32 %and, i32* %mctmp, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %8 = load i32, i32* %mctmp, align 4
  switch i32 %8, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb4
    i32 6, label %sw.bb6
    i32 5, label %sw.bb8
    i32 4, label %sw.bb10
    i32 3, label %sw.bb12
    i32 2, label %sw.bb14
    i32 1, label %sw.bb16
  ]

sw.bb:                                            ; preds = %if.end
  br label %for.cond

for.cond:                                         ; preds = %if.end20, %sw.bb
  %9 = load i8*, i8** %mzp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %mzp, align 4
  store i8 -33, i8* %9, align 1
  br label %sw.bb4

sw.bb4:                                           ; preds = %if.end, %for.cond
  %10 = load i8*, i8** %mzp, align 4
  %incdec.ptr5 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr5, i8** %mzp, align 4
  store i8 -33, i8* %10, align 1
  br label %sw.bb6

sw.bb6:                                           ; preds = %if.end, %sw.bb4
  %11 = load i8*, i8** %mzp, align 4
  %incdec.ptr7 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr7, i8** %mzp, align 4
  store i8 -33, i8* %11, align 1
  br label %sw.bb8

sw.bb8:                                           ; preds = %if.end, %sw.bb6
  %12 = load i8*, i8** %mzp, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr9, i8** %mzp, align 4
  store i8 -33, i8* %12, align 1
  br label %sw.bb10

sw.bb10:                                          ; preds = %if.end, %sw.bb8
  %13 = load i8*, i8** %mzp, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr11, i8** %mzp, align 4
  store i8 -33, i8* %13, align 1
  br label %sw.bb12

sw.bb12:                                          ; preds = %if.end, %sw.bb10
  %14 = load i8*, i8** %mzp, align 4
  %incdec.ptr13 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr13, i8** %mzp, align 4
  store i8 -33, i8* %14, align 1
  br label %sw.bb14

sw.bb14:                                          ; preds = %if.end, %sw.bb12
  %15 = load i8*, i8** %mzp, align 4
  %incdec.ptr15 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %incdec.ptr15, i8** %mzp, align 4
  store i8 -33, i8* %15, align 1
  br label %sw.bb16

sw.bb16:                                          ; preds = %if.end, %sw.bb14
  %16 = load i8*, i8** %mzp, align 4
  %incdec.ptr17 = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr17, i8** %mzp, align 4
  store i8 -33, i8* %16, align 1
  %17 = load i32, i32* %mcn, align 4
  %cmp18 = icmp sle i32 %17, 0
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %sw.bb16
  br label %for.end

if.end20:                                         ; preds = %sw.bb16
  %18 = load i32, i32* %mcn, align 4
  %dec = add nsw i32 %18, -1
  store i32 %dec, i32* %mcn, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then19
  br label %sw.epilog

sw.epilog:                                        ; preds = %for.end, %if.end
  br label %do.end

do.end:                                           ; preds = %sw.epilog
  %19 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %20 = load i8*, i8** getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 0), align 4
  %21 = bitcast i8* %20 to %struct.word_desc**
  %22 = load i32, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* getelementptr inbounds (%struct.objcache, %struct.objcache* @wdcache, i32 0, i32 2), align 4
  %arrayidx = getelementptr inbounds %struct.word_desc*, %struct.word_desc** %21, i32 %22
  store %struct.word_desc* %19, %struct.word_desc** %arrayidx, align 4
  br label %if.end22

if.else21:                                        ; preds = %do.body
  %23 = load %struct.word_desc*, %struct.word_desc** %w.addr, align 4
  %24 = bitcast %struct.word_desc* %23 to i8*
  call void @sh_xfree(i8* %24, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i32 259)
  br label %if.end22

if.end22:                                         ; preds = %if.else21, %do.end
  br label %do.end23

do.end23:                                         ; preds = %if.end22
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
