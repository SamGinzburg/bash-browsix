; ModuleID = 'return.c'
source_filename = "return.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@return_catch_value = external global i32, align 4
@return_catch_flag = external global i32, align 4
@return_catch = external global [1 x %struct.__jmp_buf_tag], align 4
@.str.1 = private unnamed_addr constant [52 x i8] c"can only `return' from a function or sourced script\00", align 1

; Function Attrs: noinline nounwind
define i32 @return_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call12 = call i32 @get_exitstat(%struct.word_list* %11)
  store i32 %call12, i32* @return_catch_value, align 4
  %12 = load i32, i32* @return_catch_flag, align 4
  %tobool13 = icmp ne i32 %12, 0
  br i1 %tobool13, label %if.then14, label %if.else

if.then14:                                        ; preds = %do.end
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @return_catch, i32 0, i32 0), i32 1) #3
  unreachable

if.else:                                          ; preds = %do.end
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call15)
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare i32 @get_exitstat(%struct.word_list*) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #2

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
