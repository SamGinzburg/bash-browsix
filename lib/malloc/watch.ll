; ModuleID = 'watch.c'
source_filename = "watch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @malloc_watch(i8* %addr) #0 {
entry:
  %retval = alloca i8*, align 4
  %addr.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %ret = alloca i8*, align 4
  store i8* %addr, i8** %addr.addr, align 4
  %0 = load i8*, i8** %addr.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %addr.addr, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i8* null, i8** %ret, align 4
  %2 = load i8*, i8** %ret, align 4
  store i8* %2, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i8*, i8** %retval, align 4
  ret i8* %3
}

; Function Attrs: noinline nounwind
define i8* @malloc_unwatch(i8* %addr) #0 {
entry:
  %addr.addr = alloca i8*, align 4
  store i8* %addr, i8** %addr.addr, align 4
  ret i8* null
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
