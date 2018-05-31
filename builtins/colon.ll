; ModuleID = 'colon.c'
source_filename = "colon.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @colon_builtin(i8* %ignore) #0 {
entry:
  %ignore.addr = alloca i8*, align 4
  store i8* %ignore, i8** %ignore.addr, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @false_builtin(i8* %ignore) #0 {
entry:
  %ignore.addr = alloca i8*, align 4
  store i8* %ignore, i8** %ignore.addr, align 4
  ret i32 1
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
