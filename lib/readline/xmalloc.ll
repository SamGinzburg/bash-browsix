; ModuleID = 'xmalloc.c'
source_filename = "xmalloc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [8 x i8] c"xmalloc\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"xrealloc\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.2 = private unnamed_addr constant [27 x i8] c"%s: out of virtual memory\0A\00", align 1

; Function Attrs: noinline nounwind
define i8* @xmalloc(i32 %bytes) #0 {
entry:
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  %0 = load i32, i32* %bytes.addr, align 4
  %call = call i8* @malloc(i32 %0)
  store i8* %call, i8** %temp, align 4
  %1 = load i8*, i8** %temp, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @memory_error_and_abort(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %temp, align 4
  ret i8* %2
}

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @memory_error_and_abort(i8* %fname) #0 {
entry:
  %fname.addr = alloca i8*, align 4
  store i8* %fname, i8** %fname.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %1 = load i8*, i8** %fname.addr, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i32 0, i32 0), i8* %1)
  call void @exit(i32 2) #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind
define i8* @xrealloc(i8* %pointer, i32 %bytes) #0 {
entry:
  %pointer.addr = alloca i8*, align 4
  %bytes.addr = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8* %pointer, i8** %pointer.addr, align 4
  store i32 %bytes, i32* %bytes.addr, align 4
  %0 = load i8*, i8** %pointer.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %pointer.addr, align 4
  %2 = load i32, i32* %bytes.addr, align 4
  %call = call i8* @realloc(i8* %1, i32 %2)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32, i32* %bytes.addr, align 4
  %call1 = call i8* @malloc(i32 %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call1, %cond.false ]
  store i8* %cond, i8** %temp, align 4
  %4 = load i8*, i8** %temp, align 4
  %cmp = icmp eq i8* %4, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @memory_error_and_abort(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end
  %5 = load i8*, i8** %temp, align 4
  ret i8* %5
}

declare i8* @realloc(i8*, i32) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
