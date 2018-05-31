; ModuleID = 'fnxform.c'
source_filename = "fnxform.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @fnx_tofs(i8* %string, i32 %len) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  ret i8* %0
}

; Function Attrs: noinline nounwind
define i8* @fnx_fromfs(i8* %string, i32 %len) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  ret i8* %0
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
