; ModuleID = 'shift.c'
source_filename = "shift.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"shift count\00", align 1
@print_shift_error = common global i32 0, align 4
@dollar_vars = external global [0 x i8*], align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"./shift.def\00", align 1
@rest_of_args = external global %struct.word_list*, align 4

; Function Attrs: noinline nounwind
define i32 @shift_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %times = alloca i64, align 8
  %count = alloca i32, align 4
  %temp = alloca %struct.word_list*, align 4
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
  %call12 = call i32 @get_numeric_arg(%struct.word_list* %11, i32 0, i64* %times)
  %cmp13 = icmp eq i32 %call12, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %do.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %do.end
  %12 = load i64, i64* %times, align 8
  %cmp17 = icmp eq i64 %12, 0
  br i1 %cmp17, label %if.then19, label %if.else

if.then19:                                        ; preds = %if.end16
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.end16
  %13 = load i64, i64* %times, align 8
  %cmp20 = icmp slt i64 %13, 0
  br i1 %cmp20, label %if.then22, label %if.else27

if.then22:                                        ; preds = %if.else
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool23 = icmp ne %struct.word_list* %14, null
  br i1 %tobool23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then22
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %15, i32 0, i32 1
  %16 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %16, i32 0, i32 0
  %17 = load i8*, i8** %word25, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then22
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %17, %cond.true ], [ null, %cond.false ]
  %call26 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  call void @sh_erange(i8* %cond, i8* %call26)
  store i32 1, i32* %retval, align 4
  br label %return

if.else27:                                        ; preds = %if.else
  %18 = load i64, i64* %times, align 8
  %call28 = call i32 @number_of_args()
  %conv29 = sext i32 %call28 to i64
  %cmp30 = icmp sgt i64 %18, %conv29
  br i1 %cmp30, label %if.then32, label %if.end44

if.then32:                                        ; preds = %if.else27
  %19 = load i32, i32* @print_shift_error, align 4
  %tobool33 = icmp ne i32 %19, 0
  br i1 %tobool33, label %if.then34, label %if.end43

if.then34:                                        ; preds = %if.then32
  %20 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool35 = icmp ne %struct.word_list* %20, null
  br i1 %tobool35, label %cond.true36, label %cond.false39

cond.true36:                                      ; preds = %if.then34
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word37 = getelementptr inbounds %struct.word_list, %struct.word_list* %21, i32 0, i32 1
  %22 = load %struct.word_desc*, %struct.word_desc** %word37, align 4
  %word38 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %22, i32 0, i32 0
  %23 = load i8*, i8** %word38, align 4
  br label %cond.end40

cond.false39:                                     ; preds = %if.then34
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false39, %cond.true36
  %cond41 = phi i8* [ %23, %cond.true36 ], [ null, %cond.false39 ]
  %call42 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  call void @sh_erange(i8* %cond41, i8* %call42)
  br label %if.end43

if.end43:                                         ; preds = %cond.end40, %if.then32
  store i32 1, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %if.else27
  br label %if.end45

if.end45:                                         ; preds = %if.end44
  br label %if.end46

if.end46:                                         ; preds = %if.end45
  br label %while.cond

while.cond:                                       ; preds = %if.end68, %if.end46
  %24 = load i64, i64* %times, align 8
  %dec = add nsw i64 %24, -1
  store i64 %dec, i64* %times, align 8
  %cmp47 = icmp sgt i64 %24, 0
  br i1 %cmp47, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %25 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 1), align 4
  %tobool49 = icmp ne i8* %25, null
  br i1 %tobool49, label %if.then50, label %if.end51

if.then50:                                        ; preds = %while.body
  %26 = load i8*, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 1), align 4
  call void @sh_xfree(i8* %26, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 86)
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %while.body
  store i32 1, i32* %count, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end51
  %27 = load i32, i32* %count, align 4
  %cmp52 = icmp slt i32 %27, 9
  br i1 %cmp52, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %28 = load i32, i32* %count, align 4
  %add = add nsw i32 %28, 1
  %arrayidx54 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %add
  %29 = load i8*, i8** %arrayidx54, align 4
  %30 = load i32, i32* %count, align 4
  %arrayidx55 = getelementptr inbounds [0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 %30
  store i8* %29, i8** %arrayidx55, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %count, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %count, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %32 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  %tobool56 = icmp ne %struct.word_list* %32, null
  br i1 %tobool56, label %if.then57, label %if.else67

if.then57:                                        ; preds = %for.end
  %33 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  store %struct.word_list* %33, %struct.word_list** %temp, align 4
  %34 = load %struct.word_list*, %struct.word_list** %temp, align 4
  %word58 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word58, align 4
  %word59 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word59, align 4
  %call60 = call i32 @strlen(i8* %36)
  %add61 = add i32 1, %call60
  %call62 = call i8* @sh_xmalloc(i32 %add61, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0), i32 94)
  %37 = load %struct.word_list*, %struct.word_list** %temp, align 4
  %word63 = getelementptr inbounds %struct.word_list, %struct.word_list* %37, i32 0, i32 1
  %38 = load %struct.word_desc*, %struct.word_desc** %word63, align 4
  %word64 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %38, i32 0, i32 0
  %39 = load i8*, i8** %word64, align 4
  %call65 = call i8* @strcpy(i8* %call62, i8* %39)
  store i8* %call65, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 9), align 4
  %40 = load %struct.word_list*, %struct.word_list** @rest_of_args, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %40, i32 0, i32 0
  %41 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %41, %struct.word_list** @rest_of_args, align 4
  %42 = load %struct.word_list*, %struct.word_list** %temp, align 4
  %next66 = getelementptr inbounds %struct.word_list, %struct.word_list* %42, i32 0, i32 0
  store %struct.word_list* null, %struct.word_list** %next66, align 4
  %43 = load %struct.word_list*, %struct.word_list** %temp, align 4
  call void @dispose_words(%struct.word_list* %43)
  br label %if.end68

if.else67:                                        ; preds = %for.end
  store i8* null, i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @dollar_vars, i32 0, i32 9), align 4
  br label %if.end68

if.end68:                                         ; preds = %if.else67, %if.then57
  br label %while.cond

while.end:                                        ; preds = %while.cond
  call void @invalidate_cached_quoted_dollar_at()
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.end43, %cond.end, %if.then19, %if.then15, %if.then
  %44 = load i32, i32* %retval, align 4
  ret i32 %44
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare i32 @get_numeric_arg(%struct.word_list*, i32, i64*) #1

declare void @sh_erange(i8*, i8*) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @number_of_args() #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare void @dispose_words(%struct.word_list*) #1

declare void @invalidate_cached_quoted_dollar_at() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
