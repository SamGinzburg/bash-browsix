; ModuleID = 'table.c'
source_filename = "table.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@malloc_register = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @malloc_set_register(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %old = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* @malloc_register, align 4
  store i32 %0, i32* %old, align 4
  %1 = load i32, i32* %n.addr, align 4
  store i32 %1, i32* @malloc_register, align 4
  %2 = load i32, i32* %old, align 4
  ret i32 %2
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
