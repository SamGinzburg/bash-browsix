; ModuleID = 'caller.c'
source_filename = "caller.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"FUNCNAME\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"BASH_SOURCE\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"BASH_LINENO\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.4 = private unnamed_addr constant [7 x i8] c"%s %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"NULL\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"%s %s %s\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @caller_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %funcname_v = alloca %struct.variable*, align 4
  %bash_source_v = alloca %struct.variable*, align 4
  %bash_lineno_v = alloca %struct.variable*, align 4
  %funcname_a = alloca %struct.array*, align 4
  %bash_source_a = alloca %struct.array*, align 4
  %bash_lineno_a = alloca %struct.array*, align 4
  %funcname_s = alloca i8*, align 4
  %source_s = alloca i8*, align 4
  %lineno_s = alloca i8*, align 4
  %num = alloca i64, align 8
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
  br label %do.body12

do.body12:                                        ; preds = %do.end
  %call13 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  store %struct.variable* %call13, %struct.variable** %funcname_v, align 4
  %11 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %tobool14 = icmp ne %struct.variable* %11, null
  br i1 %tobool14, label %land.lhs.true15, label %cond.false

land.lhs.true15:                                  ; preds = %do.body12
  %12 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %12, i32 0, i32 5
  %13 = load i32, i32* %attributes, align 4
  %and = and i32 %13, 4
  %tobool16 = icmp ne i32 %and, 0
  br i1 %tobool16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true15
  %14 = load %struct.variable*, %struct.variable** %funcname_v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value, align 4
  %16 = bitcast i8* %15 to %struct.array*
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true15, %do.body12
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi %struct.array* [ %16, %cond.true ], [ null, %cond.false ]
  store %struct.array* %cond, %struct.array** %funcname_a, align 4
  br label %do.end17

do.end17:                                         ; preds = %cond.end
  br label %do.body18

do.body18:                                        ; preds = %do.end17
  %call19 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0))
  store %struct.variable* %call19, %struct.variable** %bash_source_v, align 4
  %17 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %tobool20 = icmp ne %struct.variable* %17, null
  br i1 %tobool20, label %land.lhs.true21, label %cond.false27

land.lhs.true21:                                  ; preds = %do.body18
  %18 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %attributes22 = getelementptr inbounds %struct.variable, %struct.variable* %18, i32 0, i32 5
  %19 = load i32, i32* %attributes22, align 4
  %and23 = and i32 %19, 4
  %tobool24 = icmp ne i32 %and23, 0
  br i1 %tobool24, label %cond.true25, label %cond.false27

cond.true25:                                      ; preds = %land.lhs.true21
  %20 = load %struct.variable*, %struct.variable** %bash_source_v, align 4
  %value26 = getelementptr inbounds %struct.variable, %struct.variable* %20, i32 0, i32 1
  %21 = load i8*, i8** %value26, align 4
  %22 = bitcast i8* %21 to %struct.array*
  br label %cond.end28

cond.false27:                                     ; preds = %land.lhs.true21, %do.body18
  br label %cond.end28

cond.end28:                                       ; preds = %cond.false27, %cond.true25
  %cond29 = phi %struct.array* [ %22, %cond.true25 ], [ null, %cond.false27 ]
  store %struct.array* %cond29, %struct.array** %bash_source_a, align 4
  br label %do.end30

do.end30:                                         ; preds = %cond.end28
  br label %do.body31

do.body31:                                        ; preds = %do.end30
  %call32 = call %struct.variable* @find_variable(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  store %struct.variable* %call32, %struct.variable** %bash_lineno_v, align 4
  %23 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %tobool33 = icmp ne %struct.variable* %23, null
  br i1 %tobool33, label %land.lhs.true34, label %cond.false40

land.lhs.true34:                                  ; preds = %do.body31
  %24 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %attributes35 = getelementptr inbounds %struct.variable, %struct.variable* %24, i32 0, i32 5
  %25 = load i32, i32* %attributes35, align 4
  %and36 = and i32 %25, 4
  %tobool37 = icmp ne i32 %and36, 0
  br i1 %tobool37, label %cond.true38, label %cond.false40

cond.true38:                                      ; preds = %land.lhs.true34
  %26 = load %struct.variable*, %struct.variable** %bash_lineno_v, align 4
  %value39 = getelementptr inbounds %struct.variable, %struct.variable* %26, i32 0, i32 1
  %27 = load i8*, i8** %value39, align 4
  %28 = bitcast i8* %27 to %struct.array*
  br label %cond.end41

cond.false40:                                     ; preds = %land.lhs.true34, %do.body31
  br label %cond.end41

cond.end41:                                       ; preds = %cond.false40, %cond.true38
  %cond42 = phi %struct.array* [ %28, %cond.true38 ], [ null, %cond.false40 ]
  store %struct.array* %cond42, %struct.array** %bash_lineno_a, align 4
  br label %do.end43

do.end43:                                         ; preds = %cond.end41
  %29 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %cmp44 = icmp eq %struct.array* %29, null
  br i1 %cmp44, label %if.then48, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %do.end43
  %30 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %num_elements = getelementptr inbounds %struct.array, %struct.array* %30, i32 0, i32 2
  %31 = load i32, i32* %num_elements, align 8
  %cmp46 = icmp eq i32 %31, 0
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %lor.lhs.false, %do.end43
  store i32 1, i32* %retval, align 4
  br label %return

if.end49:                                         ; preds = %lor.lhs.false
  %32 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %cmp50 = icmp eq %struct.array* %32, null
  br i1 %cmp50, label %if.then56, label %lor.lhs.false52

lor.lhs.false52:                                  ; preds = %if.end49
  %33 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %num_elements53 = getelementptr inbounds %struct.array, %struct.array* %33, i32 0, i32 2
  %34 = load i32, i32* %num_elements53, align 8
  %cmp54 = icmp eq i32 %34, 0
  br i1 %cmp54, label %if.then56, label %if.end57

if.then56:                                        ; preds = %lor.lhs.false52, %if.end49
  store i32 1, i32* %retval, align 4
  br label %return

if.end57:                                         ; preds = %lor.lhs.false52
  %35 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call58 = call i32 @no_options(%struct.word_list* %35)
  %tobool59 = icmp ne i32 %call58, 0
  br i1 %tobool59, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end57
  store i32 258, i32* %retval, align 4
  br label %return

if.end61:                                         ; preds = %if.end57
  %36 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %36, %struct.word_list** %list.addr, align 4
  %37 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp62 = icmp eq %struct.word_list* %37, null
  br i1 %cmp62, label %if.then64, label %if.end78

if.then64:                                        ; preds = %if.end61
  %38 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %call65 = call i8* @array_reference(%struct.array* %38, i64 0)
  store i8* %call65, i8** %lineno_s, align 4
  %39 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %call66 = call i8* @array_reference(%struct.array* %39, i64 1)
  store i8* %call66, i8** %source_s, align 4
  %40 = load i8*, i8** %lineno_s, align 4
  %tobool67 = icmp ne i8* %40, null
  br i1 %tobool67, label %cond.true68, label %cond.false69

cond.true68:                                      ; preds = %if.then64
  %41 = load i8*, i8** %lineno_s, align 4
  br label %cond.end70

cond.false69:                                     ; preds = %if.then64
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false69, %cond.true68
  %cond71 = phi i8* [ %41, %cond.true68 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), %cond.false69 ]
  %42 = load i8*, i8** %source_s, align 4
  %tobool72 = icmp ne i8* %42, null
  br i1 %tobool72, label %cond.true73, label %cond.false74

cond.true73:                                      ; preds = %cond.end70
  %43 = load i8*, i8** %source_s, align 4
  br label %cond.end75

cond.false74:                                     ; preds = %cond.end70
  br label %cond.end75

cond.end75:                                       ; preds = %cond.false74, %cond.true73
  %cond76 = phi i8* [ %43, %cond.true73 ], [ getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), %cond.false74 ]
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i8* %cond71, i8* %cond76)
  store i32 0, i32* %retval, align 4
  br label %return

if.end78:                                         ; preds = %if.end61
  %44 = load %struct.array*, %struct.array** %funcname_a, align 4
  %cmp79 = icmp eq %struct.array* %44, null
  br i1 %cmp79, label %if.then85, label %lor.lhs.false81

lor.lhs.false81:                                  ; preds = %if.end78
  %45 = load %struct.array*, %struct.array** %funcname_a, align 4
  %num_elements82 = getelementptr inbounds %struct.array, %struct.array* %45, i32 0, i32 2
  %46 = load i32, i32* %num_elements82, align 8
  %cmp83 = icmp eq i32 %46, 0
  br i1 %cmp83, label %if.then85, label %if.end86

if.then85:                                        ; preds = %lor.lhs.false81, %if.end78
  store i32 1, i32* %retval, align 4
  br label %return

if.end86:                                         ; preds = %lor.lhs.false81
  %47 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word87 = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word87, align 4
  %word88 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word88, align 4
  %call89 = call i32 @legal_number(i8* %49, i64* %num)
  %tobool90 = icmp ne i32 %call89, 0
  br i1 %tobool90, label %if.then91, label %if.else

if.then91:                                        ; preds = %if.end86
  %50 = load %struct.array*, %struct.array** %bash_lineno_a, align 4
  %51 = load i64, i64* %num, align 8
  %call92 = call i8* @array_reference(%struct.array* %50, i64 %51)
  store i8* %call92, i8** %lineno_s, align 4
  %52 = load %struct.array*, %struct.array** %bash_source_a, align 4
  %53 = load i64, i64* %num, align 8
  %add = add nsw i64 %53, 1
  %call93 = call i8* @array_reference(%struct.array* %52, i64 %add)
  store i8* %call93, i8** %source_s, align 4
  %54 = load %struct.array*, %struct.array** %funcname_a, align 4
  %55 = load i64, i64* %num, align 8
  %add94 = add nsw i64 %55, 1
  %call95 = call i8* @array_reference(%struct.array* %54, i64 %add94)
  store i8* %call95, i8** %funcname_s, align 4
  %56 = load i8*, i8** %lineno_s, align 4
  %cmp96 = icmp eq i8* %56, null
  br i1 %cmp96, label %if.then104, label %lor.lhs.false98

lor.lhs.false98:                                  ; preds = %if.then91
  %57 = load i8*, i8** %source_s, align 4
  %cmp99 = icmp eq i8* %57, null
  br i1 %cmp99, label %if.then104, label %lor.lhs.false101

lor.lhs.false101:                                 ; preds = %lor.lhs.false98
  %58 = load i8*, i8** %funcname_s, align 4
  %cmp102 = icmp eq i8* %58, null
  br i1 %cmp102, label %if.then104, label %if.end105

if.then104:                                       ; preds = %lor.lhs.false101, %lor.lhs.false98, %if.then91
  store i32 1, i32* %retval, align 4
  br label %return

if.end105:                                        ; preds = %lor.lhs.false101
  %59 = load i8*, i8** %lineno_s, align 4
  %60 = load i8*, i8** %funcname_s, align 4
  %61 = load i8*, i8** %source_s, align 4
  %call106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* %59, i8* %60, i8* %61)
  br label %if.end109

if.else:                                          ; preds = %if.end86
  %62 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word107 = getelementptr inbounds %struct.word_list, %struct.word_list* %62, i32 0, i32 1
  %63 = load %struct.word_desc*, %struct.word_desc** %word107, align 4
  %word108 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %63, i32 0, i32 0
  %64 = load i8*, i8** %word108, align 4
  call void @sh_invalidnum(i8* %64)
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end109:                                        ; preds = %if.end105
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end109, %if.else, %if.then104, %if.then85, %cond.end75, %if.then60, %if.then56, %if.then48, %if.then
  %65 = load i32, i32* %retval, align 4
  ret i32 %65
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare %struct.variable* @find_variable(i8*) #1

declare i32 @no_options(%struct.word_list*) #1

declare i8* @array_reference(%struct.array*, i64) #1

declare i32 @printf(i8*, ...) #1

declare i32 @legal_number(i8*, i64*) #1

declare void @sh_invalidnum(i8*) #1

declare void @builtin_usage() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
