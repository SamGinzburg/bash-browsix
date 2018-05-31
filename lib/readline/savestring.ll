; ModuleID = 'savestring.c'
source_filename = "savestring.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @savestring(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strlen(i8* %0)
  %add = add i32 %call, 1
  %call1 = call i8* @xmalloc(i32 %add)
  store i8* %call1, i8** %ret, align 4
  %1 = load i8*, i8** %ret, align 4
  %2 = load i8*, i8** %s.addr, align 4
  %call2 = call i8* @strcpy(i8* %1, i8* %2)
  %3 = load i8*, i8** %ret, align 4
  ret i8* %3
}

declare i8* @xmalloc(i32) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
