; ModuleID = 'echo.c'
source_filename = "echo.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@xpg_echo = global i32 0, align 4
@posixly_correct = external global i32, align 4
@.str = private unnamed_addr constant [4 x i8] c"neE\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@.str.2 = private unnamed_addr constant [11 x i8] c"./echo.def\00", align 1

; Function Attrs: noinline nounwind
define i32 @echo_builtin(%struct.word_list* %list) #0 {
entry:
  %list.addr = alloca %struct.word_list*, align 4
  %display_return = alloca i32, align 4
  %do_v9 = alloca i32, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %temp = alloca i8*, align 4
  %s = alloca i8*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @xpg_echo, align 4
  store i32 %0, i32* %do_v9, align 4
  store i32 1, i32* %display_return, align 4
  %1 = load i32, i32* @posixly_correct, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @xpg_echo, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %just_echo

if.end:                                           ; preds = %land.lhs.true, %entry
  br label %for.cond

for.cond:                                         ; preds = %for.inc29, %if.end
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool2 = icmp ne %struct.word_list* %3, null
  br i1 %tobool2, label %land.lhs.true3, label %land.end

land.lhs.true3:                                   ; preds = %for.cond
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word4, align 4
  store i8* %6, i8** %temp, align 4
  %tobool5 = icmp ne i8* %6, null
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true3
  %7 = load i8*, i8** %temp, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true3, %for.cond
  %9 = phi i1 [ false, %land.lhs.true3 ], [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %9, label %for.body, label %for.end30

for.body:                                         ; preds = %land.end
  %10 = load i8*, i8** %temp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body
  %11 = load i8*, i8** %temp, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %11, i32 %12
  %13 = load i8, i8* %arrayidx, align 1
  %tobool8 = icmp ne i8 %13, 0
  br i1 %tobool8, label %for.body9, label %for.end

for.body9:                                        ; preds = %for.cond7
  %14 = load i8*, i8** %temp, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %16 to i32
  %call = call i8* @strchr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv11)
  %cmp12 = icmp eq i8* %call, null
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %for.body9
  br label %for.end

if.end15:                                         ; preds = %for.body9
  br label %for.inc

for.inc:                                          ; preds = %if.end15
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond7

for.end:                                          ; preds = %if.then14, %for.cond7
  %18 = load i8*, i8** %temp, align 4
  %19 = load i8, i8* %18, align 1
  %conv16 = sext i8 %19 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br i1 %cmp17, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %20 = load i8*, i8** %temp, align 4
  %21 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %22 to i32
  %tobool21 = icmp ne i32 %conv20, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %lor.lhs.false, %for.end
  br label %for.end30

if.end23:                                         ; preds = %lor.lhs.false
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end23
  %23 = load i8*, i8** %temp, align 4
  %incdec.ptr24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr24, i8** %temp, align 4
  %24 = load i8, i8* %23, align 1
  %conv25 = sext i8 %24 to i32
  store i32 %conv25, i32* %i, align 4
  %tobool26 = icmp ne i32 %conv25, 0
  br i1 %tobool26, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %25 = load i32, i32* %i, align 4
  switch i32 %25, label %sw.default [
    i32 110, label %sw.bb
    i32 101, label %sw.bb27
    i32 69, label %sw.bb28
  ]

sw.bb:                                            ; preds = %while.body
  store i32 0, i32* %display_return, align 4
  br label %sw.epilog

sw.bb27:                                          ; preds = %while.body
  store i32 1, i32* %do_v9, align 4
  br label %sw.epilog

sw.bb28:                                          ; preds = %while.body
  store i32 0, i32* %do_v9, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  br label %just_echo

sw.epilog:                                        ; preds = %sw.bb28, %sw.bb27, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %for.inc29

for.inc29:                                        ; preds = %while.end
  %26 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %26, i32 0, i32 0
  %27 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %27, %struct.word_list** %list.addr, align 4
  br label %for.cond

for.end30:                                        ; preds = %if.then22, %land.end
  br label %just_echo

just_echo:                                        ; preds = %for.end30, %sw.default, %if.then
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  call void @clearerr(%struct._IO_FILE* %28)
  br label %while.cond31

while.cond31:                                     ; preds = %do.end116, %just_echo
  %29 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool32 = icmp ne %struct.word_list* %29, null
  br i1 %tobool32, label %while.body33, label %while.end117

while.body33:                                     ; preds = %while.cond31
  store i32 0, i32* %len, align 4
  store i32 0, i32* %i, align 4
  %30 = load i32, i32* %do_v9, align 4
  %tobool34 = icmp ne i32 %30, 0
  br i1 %tobool34, label %cond.true, label %cond.false69

cond.true:                                        ; preds = %while.body33
  %31 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word35 = getelementptr inbounds %struct.word_list, %struct.word_list* %31, i32 0, i32 1
  %32 = load %struct.word_desc*, %struct.word_desc** %word35, align 4
  %word36 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %32, i32 0, i32 0
  %33 = load i8*, i8** %word36, align 4
  %34 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word37 = getelementptr inbounds %struct.word_list, %struct.word_list* %34, i32 0, i32 1
  %35 = load %struct.word_desc*, %struct.word_desc** %word37, align 4
  %word38 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %35, i32 0, i32 0
  %36 = load i8*, i8** %word38, align 4
  %tobool39 = icmp ne i8* %36, null
  br i1 %tobool39, label %land.lhs.true40, label %cond.false65

land.lhs.true40:                                  ; preds = %cond.true
  %37 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word41 = getelementptr inbounds %struct.word_list, %struct.word_list* %37, i32 0, i32 1
  %38 = load %struct.word_desc*, %struct.word_desc** %word41, align 4
  %word42 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %38, i32 0, i32 0
  %39 = load i8*, i8** %word42, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %40 to i32
  %tobool45 = icmp ne i32 %conv44, 0
  br i1 %tobool45, label %cond.true46, label %cond.false65

cond.true46:                                      ; preds = %land.lhs.true40
  %41 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word47 = getelementptr inbounds %struct.word_list, %struct.word_list* %41, i32 0, i32 1
  %42 = load %struct.word_desc*, %struct.word_desc** %word47, align 4
  %word48 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %42, i32 0, i32 0
  %43 = load i8*, i8** %word48, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %43, i32 1
  %44 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %44 to i32
  %tobool51 = icmp ne i32 %conv50, 0
  br i1 %tobool51, label %cond.true52, label %cond.false62

cond.true52:                                      ; preds = %cond.true46
  %45 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %45, i32 0, i32 1
  %46 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %46, i32 0, i32 0
  %47 = load i8*, i8** %word54, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %47, i32 2
  %48 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %48 to i32
  %tobool57 = icmp ne i32 %conv56, 0
  br i1 %tobool57, label %cond.true58, label %cond.false

cond.true58:                                      ; preds = %cond.true52
  %49 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word59 = getelementptr inbounds %struct.word_list, %struct.word_list* %49, i32 0, i32 1
  %50 = load %struct.word_desc*, %struct.word_desc** %word59, align 4
  %word60 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %50, i32 0, i32 0
  %51 = load i8*, i8** %word60, align 4
  %call61 = call i32 @strlen(i8* %51)
  br label %cond.end

cond.false:                                       ; preds = %cond.true52
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true58
  %cond = phi i32 [ %call61, %cond.true58 ], [ 2, %cond.false ]
  br label %cond.end63

cond.false62:                                     ; preds = %cond.true46
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false62, %cond.end
  %cond64 = phi i32 [ %cond, %cond.end ], [ 1, %cond.false62 ]
  br label %cond.end66

cond.false65:                                     ; preds = %land.lhs.true40, %cond.true
  br label %cond.end66

cond.end66:                                       ; preds = %cond.false65, %cond.end63
  %cond67 = phi i32 [ %cond64, %cond.end63 ], [ 0, %cond.false65 ]
  %call68 = call i8* @ansicstr(i8* %33, i32 %cond67, i32 1, i32* %i, i32* %len)
  br label %cond.end72

cond.false69:                                     ; preds = %while.body33
  %52 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word70 = getelementptr inbounds %struct.word_list, %struct.word_list* %52, i32 0, i32 1
  %53 = load %struct.word_desc*, %struct.word_desc** %word70, align 4
  %word71 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %53, i32 0, i32 0
  %54 = load i8*, i8** %word71, align 4
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false69, %cond.end66
  %cond73 = phi i8* [ %call68, %cond.end66 ], [ %54, %cond.false69 ]
  store i8* %cond73, i8** %temp, align 4
  %55 = load i8*, i8** %temp, align 4
  %tobool74 = icmp ne i8* %55, null
  br i1 %tobool74, label %if.then75, label %if.end89

if.then75:                                        ; preds = %cond.end72
  %56 = load i32, i32* %do_v9, align 4
  %tobool76 = icmp ne i32 %56, 0
  br i1 %tobool76, label %if.then77, label %if.else

if.then77:                                        ; preds = %if.then75
  %57 = load i8*, i8** %temp, align 4
  store i8* %57, i8** %s, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc85, %if.then77
  %58 = load i32, i32* %len, align 4
  %cmp79 = icmp sgt i32 %58, 0
  br i1 %cmp79, label %for.body81, label %for.end86

for.body81:                                       ; preds = %for.cond78
  %59 = load i8*, i8** %s, align 4
  %incdec.ptr82 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %incdec.ptr82, i8** %s, align 4
  %60 = load i8, i8* %59, align 1
  %conv83 = sext i8 %60 to i32
  %call84 = call i32 @putchar(i32 %conv83)
  br label %for.inc85

for.inc85:                                        ; preds = %for.body81
  %61 = load i32, i32* %len, align 4
  %dec = add nsw i32 %61, -1
  store i32 %dec, i32* %len, align 4
  br label %for.cond78

for.end86:                                        ; preds = %for.cond78
  br label %if.end88

if.else:                                          ; preds = %if.then75
  %62 = load i8*, i8** %temp, align 4
  %call87 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i8* %62)
  br label %if.end88

if.end88:                                         ; preds = %if.else, %for.end86
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %cond.end72
  br label %do.body

do.body:                                          ; preds = %if.end89
  %63 = load volatile i32, i32* @terminating_signal, align 4
  %tobool90 = icmp ne i32 %63, 0
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %do.body
  %64 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %64)
  br label %if.end92

if.end92:                                         ; preds = %if.then91, %do.body
  %65 = load volatile i32, i32* @interrupt_state, align 4
  %tobool93 = icmp ne i32 %65, 0
  br i1 %tobool93, label %if.then94, label %if.end95

if.then94:                                        ; preds = %if.end92
  call void @throw_to_top_level()
  br label %if.end95

if.end95:                                         ; preds = %if.then94, %if.end92
  br label %do.end

do.end:                                           ; preds = %if.end95
  %66 = load i32, i32* %do_v9, align 4
  %tobool96 = icmp ne i32 %66, 0
  br i1 %tobool96, label %land.lhs.true97, label %if.end100

land.lhs.true97:                                  ; preds = %do.end
  %67 = load i8*, i8** %temp, align 4
  %tobool98 = icmp ne i8* %67, null
  br i1 %tobool98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %land.lhs.true97
  %68 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %68, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 184)
  br label %if.end100

if.end100:                                        ; preds = %if.then99, %land.lhs.true97, %do.end
  %69 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next101 = getelementptr inbounds %struct.word_list, %struct.word_list* %69, i32 0, i32 0
  %70 = load %struct.word_list*, %struct.word_list** %next101, align 4
  store %struct.word_list* %70, %struct.word_list** %list.addr, align 4
  %71 = load i32, i32* %i, align 4
  %tobool102 = icmp ne i32 %71, 0
  br i1 %tobool102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  store i32 0, i32* %display_return, align 4
  br label %while.end117

if.end104:                                        ; preds = %if.end100
  %72 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool105 = icmp ne %struct.word_list* %72, null
  br i1 %tobool105, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.end104
  %call107 = call i32 @putchar(i32 32)
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.end104
  br label %do.body109

do.body109:                                       ; preds = %if.end108
  %73 = load volatile i32, i32* @terminating_signal, align 4
  %tobool110 = icmp ne i32 %73, 0
  br i1 %tobool110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %do.body109
  %74 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %74)
  br label %if.end112

if.end112:                                        ; preds = %if.then111, %do.body109
  %75 = load volatile i32, i32* @interrupt_state, align 4
  %tobool113 = icmp ne i32 %75, 0
  br i1 %tobool113, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end112
  call void @throw_to_top_level()
  br label %if.end115

if.end115:                                        ; preds = %if.then114, %if.end112
  br label %do.end116

do.end116:                                        ; preds = %if.end115
  br label %while.cond31

while.end117:                                     ; preds = %if.then103, %while.cond31
  %76 = load i32, i32* %display_return, align 4
  %tobool118 = icmp ne i32 %76, 0
  br i1 %tobool118, label %if.then119, label %if.end121

if.then119:                                       ; preds = %while.end117
  %call120 = call i32 @putchar(i32 10)
  br label %if.end121

if.end121:                                        ; preds = %if.then119, %while.end117
  %call122 = call i32 @sh_chkwrite(i32 0)
  ret i32 %call122
}

declare i8* @strchr(i8*, i32) #1

declare void @clearerr(%struct._IO_FILE*) #1

declare i8* @ansicstr(i8*, i32, i32, i32*, i32*) #1

declare i32 @strlen(i8*) #1

declare i32 @putchar(i32) #1

declare i32 @printf(i8*, ...) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @sh_chkwrite(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
