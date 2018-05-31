; ModuleID = 'setlinebuf.c'
source_filename = "setlinebuf.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [13 x i8] c"setlinebuf.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @sh_setlinebuf(%struct._IO_FILE* %stream) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %local_linebuf = alloca i8*, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  %call = call i8* @sh_xmalloc(i32 1008, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 45)
  store i8* %call, i8** %local_linebuf, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %1 = load i8*, i8** %local_linebuf, align 4
  %call1 = call i32 @setvbuf(%struct._IO_FILE* %0, i8* %1, i32 1, i32 1008)
  ret i32 %call1
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @setvbuf(%struct._IO_FILE*, i8*, i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
