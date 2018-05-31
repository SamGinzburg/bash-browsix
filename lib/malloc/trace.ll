; ModuleID = 'trace.c'
source_filename = "trace.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@malloc_trace = external global i32, align 4
@_mtrace_verbose = internal global i32 0, align 4

; Function Attrs: noinline nounwind
define i32 @malloc_set_trace(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %old = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* @malloc_trace, align 4
  store i32 %0, i32* %old, align 4
  %1 = load i32, i32* %n.addr, align 4
  store i32 %1, i32* @malloc_trace, align 4
  %2 = load i32, i32* %n.addr, align 4
  %cmp = icmp sgt i32 %2, 1
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @_mtrace_verbose, align 4
  %3 = load i32, i32* %old, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind
define void @malloc_set_tracefp(%struct._IO_FILE* %fp) #0 {
entry:
  %fp.addr = alloca %struct._IO_FILE*, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @malloc_trace_bin(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @malloc_set_tracefn(i8* %s, i8* %fn) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %fn.addr = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %fn, i8** %fn.addr, align 4
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
