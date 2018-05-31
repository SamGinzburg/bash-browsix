; ModuleID = 'strmatch.c'
source_filename = "strmatch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @strmatch(i8* %pattern, i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pattern.addr = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %pattern.addr, align 4
  %cmp1 = icmp eq i8* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*, i8** %pattern.addr, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call = call i32 @xstrmatch(i8* %2, i8* %3, i32 %4)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @xstrmatch(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @wcsmatch(i32* %wpattern, i32* %wstring, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %wpattern.addr = alloca i32*, align 4
  %wstring.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  store i32* %wpattern, i32** %wpattern.addr, align 4
  store i32* %wstring, i32** %wstring.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %wstring.addr, align 4
  %cmp = icmp eq i32* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32*, i32** %wpattern.addr, align 4
  %cmp1 = icmp eq i32* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32*, i32** %wpattern.addr, align 4
  %3 = load i32*, i32** %wstring.addr, align 4
  %4 = load i32, i32* %flags.addr, align 4
  %call = call i32 @internal_wstrmatch(i32* %2, i32* %3, i32 %4)
  store i32 %call, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @internal_wstrmatch(i32*, i32*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
