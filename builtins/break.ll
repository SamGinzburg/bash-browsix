; ModuleID = 'break.c'
source_filename = "break.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@loop_level = global i32 0, align 4
@breaking = global i32 0, align 4
@continuing = global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"loop count\00", align 1
@posixly_correct = external global i32, align 4
@.str.2 = private unnamed_addr constant [53 x i8] c"only meaningful in a `for', `while', or `until' loop\00", align 1

; Function Attrs: noinline nounwind
define i32 @break_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %newbreak = alloca i64, align 8
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
  %call12 = call i32 @check_loop_level()
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %do.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call17 = call i32 @get_numeric_arg(%struct.word_list* %11, i32 1, i64* %newbreak)
  %12 = load i64, i64* %newbreak, align 8
  %cmp18 = icmp sle i64 %12, 0
  br i1 %cmp18, label %if.then20, label %if.end24

if.then20:                                        ; preds = %if.end16
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word21 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word21, align 4
  %word22 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %14, i32 0, i32 0
  %15 = load i8*, i8** %word22, align 4
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  call void @sh_erange(i8* %15, i8* %call23)
  %16 = load i32, i32* @loop_level, align 4
  store i32 %16, i32* @breaking, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %if.end16
  %17 = load i64, i64* %newbreak, align 8
  %18 = load i32, i32* @loop_level, align 4
  %conv25 = sext i32 %18 to i64
  %cmp26 = icmp sgt i64 %17, %conv25
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end24
  %19 = load i32, i32* @loop_level, align 4
  %conv29 = sext i32 %19 to i64
  store i64 %conv29, i64* %newbreak, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end24
  %20 = load i64, i64* %newbreak, align 8
  %conv31 = trunc i64 %20 to i32
  store i32 %conv31, i32* @breaking, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then20, %if.then15, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

; Function Attrs: noinline nounwind
define internal i32 @check_loop_level() #0 {
entry:
  %0 = load i32, i32* @loop_level, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @posixly_correct, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.2, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %2 = load i32, i32* @loop_level, align 4
  ret i32 %2
}

declare i32 @get_numeric_arg(%struct.word_list*, i32, i64*) #1

declare void @sh_erange(i8*, i8*) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define i32 @continue_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %newcont = alloca i64, align 8
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
  %call12 = call i32 @check_loop_level()
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %do.end
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call17 = call i32 @get_numeric_arg(%struct.word_list* %11, i32 1, i64* %newcont)
  %12 = load i64, i64* %newcont, align 8
  %cmp18 = icmp sle i64 %12, 0
  br i1 %cmp18, label %if.then20, label %if.end24

if.then20:                                        ; preds = %if.end16
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word21 = getelementptr inbounds %struct.word_list, %struct.word_list* %13, i32 0, i32 1
  %14 = load %struct.word_desc*, %struct.word_desc** %word21, align 4
  %word22 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %14, i32 0, i32 0
  %15 = load i8*, i8** %word22, align 4
  %call23 = call i8* @libintl_gettext(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  call void @sh_erange(i8* %15, i8* %call23)
  %16 = load i32, i32* @loop_level, align 4
  store i32 %16, i32* @breaking, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.end24:                                         ; preds = %if.end16
  %17 = load i64, i64* %newcont, align 8
  %18 = load i32, i32* @loop_level, align 4
  %conv25 = sext i32 %18 to i64
  %cmp26 = icmp sgt i64 %17, %conv25
  br i1 %cmp26, label %if.then28, label %if.end30

if.then28:                                        ; preds = %if.end24
  %19 = load i32, i32* @loop_level, align 4
  %conv29 = sext i32 %19 to i64
  store i64 %conv29, i64* %newcont, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then28, %if.end24
  %20 = load i64, i64* %newcont, align 8
  %conv31 = trunc i64 %20 to i32
  store i32 %conv31, i32* @continuing, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then20, %if.then15, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare void @builtin_error(i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
