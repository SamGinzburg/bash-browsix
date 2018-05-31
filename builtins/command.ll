; ModuleID = 'command.c'
source_filename = "command.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }
%struct.simple_com = type { i32, i32, %struct.word_list*, %struct.redirect* }

@.str = private unnamed_addr constant [4 x i8] c"pvV\00", align 1
@loptend = external global %struct.word_list*, align 4
@restricted = external global i32, align 4
@.str.1 = private unnamed_addr constant [3 x i8] c"-p\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"command_builtin\00", align 1

; Function Attrs: noinline nounwind
define i32 @command_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %result = alloca i32, align 4
  %verbose = alloca i32, align 4
  %use_standard_path = alloca i32, align 4
  %opt = alloca i32, align 4
  %old_path = alloca i8*, align 4
  %standard_path = alloca i8*, align 4
  %command = alloca %struct.command*, align 4
  %found = alloca i32, align 4
  %any_found = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %use_standard_path, align 4
  store i32 0, i32* %verbose, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 112, label %sw.bb
    i32 86, label %sw.bb1
    i32 118, label %sw.bb2
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  store i32 256, i32* %use_standard_path, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  store i32 130, i32* %verbose, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %while.body
  store i32 4, i32* %verbose, align 4
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
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %while.end
  %4 = load i32, i32* %use_standard_path, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end
  %5 = load i32, i32* @restricted, align 4
  %tobool5 = icmp ne i32 %5, 0
  br i1 %tobool5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  call void @sh_restricted(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %land.lhs.true, %if.end
  %6 = load i32, i32* %verbose, align 4
  %tobool8 = icmp ne i32 %6, 0
  br i1 %tobool8, label %if.then9, label %if.end21

if.then9:                                         ; preds = %if.end7
  store i32 0, i32* %any_found, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then9
  %7 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool10 = icmp ne %struct.word_list* %7, null
  br i1 %tobool10, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word11, align 4
  %11 = load i32, i32* %verbose, align 4
  %12 = load i32, i32* %use_standard_path, align 4
  %or = or i32 %11, %12
  %call12 = call i32 @describe_command(i8* %10, i32 %or)
  store i32 %call12, i32* %found, align 4
  %13 = load i32, i32* %found, align 4
  %cmp13 = icmp eq i32 %13, 0
  br i1 %cmp13, label %land.lhs.true14, label %if.end19

land.lhs.true14:                                  ; preds = %for.body
  %14 = load i32, i32* %verbose, align 4
  %cmp15 = icmp ne i32 %14, 4
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %land.lhs.true14
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word17 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word18, align 4
  call void @sh_notfound(i8* %17)
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %land.lhs.true14, %for.body
  %18 = load i32, i32* %found, align 4
  %19 = load i32, i32* %any_found, align 4
  %add = add nsw i32 %19, %18
  store i32 %add, i32* %any_found, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end19
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %20, i32 0, i32 0
  %21 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %21, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %22 = load i32, i32* %any_found, align 4
  %tobool20 = icmp ne i32 %22, 0
  %cond = select i1 %tobool20, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end7
  call void @begin_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  %call22 = call %struct.command* @make_bare_simple_command()
  store %struct.command* %call22, %struct.command** %command, align 4
  %23 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call23 = call %struct.word_list* @copy_word_list(%struct.word_list* %23)
  %24 = load %struct.command*, %struct.command** %command, align 4
  %value = getelementptr inbounds %struct.command, %struct.command* %24, i32 0, i32 4
  %Simple = bitcast %union.anon* %value to %struct.simple_com**
  %25 = load %struct.simple_com*, %struct.simple_com** %Simple, align 4
  %words = getelementptr inbounds %struct.simple_com, %struct.simple_com* %25, i32 0, i32 2
  store %struct.word_list* %call23, %struct.word_list** %words, align 4
  %26 = load %struct.command*, %struct.command** %command, align 4
  %value24 = getelementptr inbounds %struct.command, %struct.command* %26, i32 0, i32 4
  %Simple25 = bitcast %union.anon* %value24 to %struct.simple_com**
  %27 = load %struct.simple_com*, %struct.simple_com** %Simple25, align 4
  %redirects = getelementptr inbounds %struct.simple_com, %struct.simple_com* %27, i32 0, i32 3
  store %struct.redirect* null, %struct.redirect** %redirects, align 4
  %28 = load i32, i32* %use_standard_path, align 4
  %tobool26 = icmp ne i32 %28, 0
  %cond27 = select i1 %tobool26, i32 16384, i32 0
  %or28 = or i32 2096, %cond27
  %29 = load %struct.command*, %struct.command** %command, align 4
  %flags = getelementptr inbounds %struct.command, %struct.command* %29, i32 0, i32 1
  %30 = load i32, i32* %flags, align 4
  %or29 = or i32 %30, %or28
  store i32 %or29, i32* %flags, align 4
  %31 = load i32, i32* %use_standard_path, align 4
  %tobool30 = icmp ne i32 %31, 0
  %cond31 = select i1 %tobool30, i32 16384, i32 0
  %or32 = or i32 2096, %cond31
  %32 = load %struct.command*, %struct.command** %command, align 4
  %value33 = getelementptr inbounds %struct.command, %struct.command* %32, i32 0, i32 4
  %Simple34 = bitcast %union.anon* %value33 to %struct.simple_com**
  %33 = load %struct.simple_com*, %struct.simple_com** %Simple34, align 4
  %flags35 = getelementptr inbounds %struct.simple_com, %struct.simple_com* %33, i32 0, i32 0
  %34 = load i32, i32* %flags35, align 4
  %or36 = or i32 %34, %or32
  store i32 %or36, i32* %flags35, align 4
  %35 = load %struct.command*, %struct.command** %command, align 4
  call void bitcast (void (...)* @add_unwind_protect to void (i8*, %struct.command*)*)(i8* bitcast (void (%struct.command*)* @dispose_command to i8*), %struct.command* %35)
  %36 = load %struct.command*, %struct.command** %command, align 4
  %call37 = call i32 @execute_command(%struct.command* %36)
  store i32 %call37, i32* %result, align 4
  call void @run_unwind_frame(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i32 0, i32 0))
  %37 = load i32, i32* %result, align 4
  store i32 %37, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end21, %for.end, %if.then6, %if.then, %sw.default, %sw.bb3
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare void @sh_restricted(i8*) #1

declare i32 @describe_command(i8*, i32) #1

declare void @sh_notfound(i8*) #1

declare void @begin_unwind_frame(i8*) #1

declare %struct.command* @make_bare_simple_command() #1

declare %struct.word_list* @copy_word_list(%struct.word_list*) #1

declare void @add_unwind_protect(...) #1

declare void @dispose_command(%struct.command*) #1

declare i32 @execute_command(%struct.command*) #1

declare void @run_unwind_frame(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
