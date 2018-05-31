; ModuleID = 'itos.c'
source_filename = "itos.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [7 x i8] c"itos.c\00", align 1

; Function Attrs: noinline nounwind
define i8* @inttostr(i64 %i, i8* %buf, i32 %len) #0 {
entry:
  %i.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i64 %i, i64* %i.addr, align 8
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i64, i64* %i.addr, align 8
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %len.addr, align 4
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %1, i32 %2, i32 0)
  ret i8* %call
}

declare i8* @fmtumax(i64, i32, i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i8* @itos(i64 %i) #0 {
entry:
  %i.addr = alloca i64, align 8
  %p = alloca i8*, align 4
  %lbuf = alloca [22 x i8], align 1
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64, i64* %i.addr, align 8
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %lbuf, i32 0, i32 0
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %arraydecay, i32 22, i32 0)
  store i8* %call, i8** %p, align 4
  %1 = load i8*, i8** %p, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 50)
  %2 = load i8*, i8** %p, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  ret i8* %call3
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define i8* @mitos(i64 %i) #0 {
entry:
  %i.addr = alloca i64, align 8
  %p = alloca i8*, align 4
  %lbuf = alloca [22 x i8], align 1
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64, i64* %i.addr, align 8
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %lbuf, i32 0, i32 0
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %arraydecay, i32 22, i32 0)
  store i8* %call, i8** %p, align 4
  %1 = load i8*, i8** %p, align 4
  %call1 = call i8* @strdup(i8* %1)
  ret i8* %call1
}

declare i8* @strdup(i8*) #1

; Function Attrs: noinline nounwind
define i8* @uinttostr(i64 %i, i8* %buf, i32 %len) #0 {
entry:
  %i.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i64 %i, i64* %i.addr, align 8
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i64, i64* %i.addr, align 8
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %len.addr, align 4
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %1, i32 %2, i32 8)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @uitos(i64 %i) #0 {
entry:
  %i.addr = alloca i64, align 8
  %p = alloca i8*, align 4
  %lbuf = alloca [21 x i8], align 1
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64, i64* %i.addr, align 8
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %lbuf, i32 0, i32 0
  %call = call i8* @fmtumax(i64 %0, i32 10, i8* %arraydecay, i32 21, i32 8)
  store i8* %call, i8** %p, align 4
  %1 = load i8*, i8** %p, align 4
  %call1 = call i32 @strlen(i8* %1)
  %add = add i32 1, %call1
  %call2 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 83)
  %2 = load i8*, i8** %p, align 4
  %call3 = call i8* @strcpy(i8* %call2, i8* %2)
  ret i8* %call3
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
