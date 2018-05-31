; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@this_command_name = external global i8*, align 4
@.str = private unnamed_addr constant [12 x i8] c"missing `]'\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"./test.def\00", align 1

; Function Attrs: noinline nounwind
define i32 @test_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %argv = alloca i8**, align 4
  %argc = alloca i32, align 4
  %result = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end5

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** @this_command_name, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 91
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %3 = load i8*, i8** @this_command_name, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx3, align 1
  %tobool = icmp ne i8 %4, 0
  br i1 %tobool, label %if.end, label %if.then4

if.then4:                                         ; preds = %land.lhs.true
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call)
  store i32 2, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %if.then
  store i32 1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %entry
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call6 = call i8** @make_builtin_argv(%struct.word_list* %5, i32* %argc)
  store i8** %call6, i8*** %argv, align 4
  %6 = load i32, i32* %argc, align 4
  %7 = load i8**, i8*** %argv, align 4
  %call7 = call i32 @test_command(i32 %6, i8** %7)
  store i32 %call7, i32* %result, align 4
  %8 = load i8**, i8*** %argv, align 4
  %9 = bitcast i8** %8 to i8*
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 157)
  %10 = load i32, i32* %result, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.end, %if.then4
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8** @make_builtin_argv(%struct.word_list*, i32*) #1

declare i32 @test_command(i32, i8**) #1

declare void @sh_xfree(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
