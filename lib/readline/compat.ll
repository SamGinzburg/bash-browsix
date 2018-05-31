; ModuleID = 'compat.c'
source_filename = "compat.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define void @free_undo_list() #0 {
entry:
  call void @rl_free_undo_list()
  ret void
}

declare void @rl_free_undo_list() #1

; Function Attrs: noinline nounwind
define i32 @maybe_replace_line() #0 {
entry:
  %call = call i32 @rl_maybe_replace_line()
  ret i32 %call
}

declare i32 @rl_maybe_replace_line() #1

; Function Attrs: noinline nounwind
define i32 @maybe_save_line() #0 {
entry:
  %call = call i32 @rl_maybe_save_line()
  ret i32 %call
}

declare i32 @rl_maybe_save_line() #1

; Function Attrs: noinline nounwind
define i32 @maybe_unsave_line() #0 {
entry:
  %call = call i32 @rl_maybe_unsave_line()
  ret i32 %call
}

declare i32 @rl_maybe_unsave_line() #1

; Function Attrs: noinline nounwind
define i32 @ding() #0 {
entry:
  %call = call i32 @rl_ding()
  ret i32 %call
}

declare i32 @rl_ding() #1

; Function Attrs: noinline nounwind
define i32 @crlf() #0 {
entry:
  %call = call i32 @rl_crlf()
  ret i32 %call
}

declare i32 @rl_crlf() #1

; Function Attrs: noinline nounwind
define i32 @alphabetic(i32 %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %call = call i32 @rl_alphabetic(i32 %0)
  ret i32 %call
}

declare i32 @rl_alphabetic(i32) #1

; Function Attrs: noinline nounwind
define i8** @completion_matches(i8* %s, i8* (i8*, i32)* %f) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %f.addr = alloca i8* (i8*, i32)*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* (i8*, i32)* %f, i8* (i8*, i32)** %f.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i8* (i8*, i32)*, i8* (i8*, i32)** %f.addr, align 4
  %call = call i8** @rl_completion_matches(i8* %0, i8* (i8*, i32)* %1)
  ret i8** %call
}

declare i8** @rl_completion_matches(i8*, i8* (i8*, i32)*) #1

; Function Attrs: noinline nounwind
define i8* @username_completion_function(i8* %s, i32 %i) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i32, i32* %i.addr, align 4
  %call = call i8* @rl_username_completion_function(i8* %0, i32 %1)
  ret i8* %call
}

declare i8* @rl_username_completion_function(i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @filename_completion_function(i8* %s, i32 %i) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i32, i32* %i.addr, align 4
  %call = call i8* @rl_filename_completion_function(i8* %0, i32 %1)
  ret i8* %call
}

declare i8* @rl_filename_completion_function(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
