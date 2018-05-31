; ModuleID = 'let.c'
source_filename = "let.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"expression expected\00", align 1

; Function Attrs: noinline nounwind
define i32 @let_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %ret = alloca i64, align 8
  %expok = alloca i32, align 4
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
  %tobool12 = icmp ne %struct.word_list* %11, null
  br i1 %tobool12, label %land.lhs.true13, label %if.end36

land.lhs.true13:                                  ; preds = %do.end
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word14 = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word14, align 4
  %tobool15 = icmp ne %struct.word_desc* %13, null
  br i1 %tobool15, label %land.lhs.true16, label %if.end36

land.lhs.true16:                                  ; preds = %land.lhs.true13
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word17 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word17, align 4
  %word18 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word18, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 45
  br i1 %cmp21, label %land.lhs.true23, label %if.end36

land.lhs.true23:                                  ; preds = %land.lhs.true16
  %18 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word25, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %20, i32 2
  %21 = load i8, i8* %arrayidx26, align 1
  %tobool27 = icmp ne i8 %21, 0
  br i1 %tobool27, label %if.end36, label %land.lhs.true28

land.lhs.true28:                                  ; preds = %land.lhs.true23
  %22 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word29 = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 1
  %23 = load %struct.word_desc*, %struct.word_desc** %word29, align 4
  %word30 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %23, i32 0, i32 0
  %24 = load i8*, i8** %word30, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %24, i32 1
  %25 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %25 to i32
  %cmp33 = icmp eq i32 %conv32, 45
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %land.lhs.true28
  %26 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 0
  %27 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %27, %struct.word_list** %list.addr, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %land.lhs.true28, %land.lhs.true23, %land.lhs.true16, %land.lhs.true13, %do.end
  %28 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp37 = icmp eq %struct.word_list* %28, null
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.end36
  %call40 = call i8* @libintl_gettext(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call40)
  store i32 1, i32* %retval, align 4
  br label %return

if.end41:                                         ; preds = %if.end36
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end41
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool42 = icmp ne %struct.word_list* %29, null
  br i1 %tobool42, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %30 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word43 = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 1
  %31 = load %struct.word_desc*, %struct.word_desc** %word43, align 4
  %word44 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %31, i32 0, i32 0
  %32 = load i8*, i8** %word44, align 4
  %call45 = call i64 @evalexp(i8* %32, i32* %expok)
  store i64 %call45, i64* %ret, align 8
  %33 = load i32, i32* %expok, align 4
  %cmp46 = icmp eq i32 %33, 0
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end49:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end49
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next50 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 0
  %35 = load %struct.word_list*, %struct.word_list** %next50, align 4
  store %struct.word_list* %35, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %36 = load i64, i64* %ret, align 8
  %cmp51 = icmp eq i64 %36, 0
  %cond = select i1 %cmp51, i32 1, i32 0
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then48, %if.then39, %if.then
  %37 = load i32, i32* %retval, align 4
  ret i32 %37
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i64 @evalexp(i8*, i32*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
