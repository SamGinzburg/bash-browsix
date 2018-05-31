; ModuleID = 'builtin.c'
source_filename = "builtin.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@loptend = external global %struct.word_list*, align 4
@this_command_name = external global i8*, align 4

; Function Attrs: noinline nounwind
define i32 @builtin_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %function = alloca i32 (%struct.word_list*)*, align 4
  %command = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @no_options(%struct.word_list* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %1, %struct.word_list** %list.addr, align 4
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %2, null
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word3 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word3, align 4
  store i8* %5, i8** %command, align 4
  %6 = load i8*, i8** %command, align 4
  %call4 = call i32 (%struct.word_list*)* @find_shell_builtin(i8* %6)
  store i32 (%struct.word_list*)* %call4, i32 (%struct.word_list*)** %function, align 4
  %7 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %tobool5 = icmp ne i32 (%struct.word_list*)* %7, null
  br i1 %tobool5, label %if.else, label %if.then6

if.then6:                                         ; preds = %if.end2
  %8 = load i8*, i8** %command, align 4
  call void @sh_notbuiltin(i8* %8)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end2
  %9 = load i8*, i8** %command, align 4
  store i8* %9, i8** @this_command_name, align 4
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 0
  %11 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %11, %struct.word_list** %list.addr, align 4
  %12 = load i32 (%struct.word_list*)*, i32 (%struct.word_list*)** %function, align 4
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call7 = call i32 %12(%struct.word_list* %13)
  store i32 %call7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then6, %if.then1, %if.then
  %14 = load i32, i32* %retval, align 4
  ret i32 %14
}

declare i32 @no_options(%struct.word_list*) #1

declare i32 (%struct.word_list*)* @find_shell_builtin(i8*) #1

declare void @sh_notbuiltin(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
