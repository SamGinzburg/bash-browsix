; ModuleID = 'localename.c'
source_filename = "localename.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"C\00", align 1

; Function Attrs: noinline nounwind
define i8* @_nl_locale_name(i32 %category, i8* %categoryname) #0 {
entry:
  %category.addr = alloca i32, align 4
  %categoryname.addr = alloca i8*, align 4
  %retval1 = alloca i8*, align 4
  store i32 %category, i32* %category.addr, align 4
  store i8* %categoryname, i8** %categoryname.addr, align 4
  %call = call i8* @getenv(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %retval1, align 4
  %0 = load i8*, i8** %retval1, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %retval1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp2 = icmp eq i32 %conv, 0
  br i1 %cmp2, label %if.then, label %if.end23

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %categoryname.addr, align 4
  %call4 = call i8* @getenv(i8* %3)
  store i8* %call4, i8** %retval1, align 4
  %4 = load i8*, i8** %retval1, align 4
  %cmp5 = icmp eq i8* %4, null
  br i1 %cmp5, label %if.then12, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %if.then
  %5 = load i8*, i8** %retval1, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %6 to i32
  %cmp10 = icmp eq i32 %conv9, 0
  br i1 %cmp10, label %if.then12, label %if.end22

if.then12:                                        ; preds = %lor.lhs.false7, %if.then
  %call13 = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call13, i8** %retval1, align 4
  %7 = load i8*, i8** %retval1, align 4
  %cmp14 = icmp eq i8* %7, null
  br i1 %cmp14, label %if.then21, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.then12
  %8 = load i8*, i8** %retval1, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %9 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end

if.then21:                                        ; preds = %lor.lhs.false16, %if.then12
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8** %retval1, align 4
  br label %if.end

if.end:                                           ; preds = %if.then21, %lor.lhs.false16
  br label %if.end22

if.end22:                                         ; preds = %if.end, %lor.lhs.false7
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %lor.lhs.false
  %10 = load i8*, i8** %retval1, align 4
  ret i8* %10
}

declare i8* @getenv(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
