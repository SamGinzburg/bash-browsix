; ModuleID = 'zwrite.c'
source_filename = "zwrite.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @zwrite(i32 %fd, i8* %buf, i32 %nb) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %nb.addr = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %nt = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %nb, i32* %nb.addr, align 4
  %0 = load i32, i32* %nb.addr, align 4
  store i32 %0, i32* %n, align 4
  store i32 0, i32* %nt, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end15, %entry
  %1 = load i32, i32* %fd.addr, align 4
  %2 = load i8*, i8** %buf.addr, align 4
  %3 = load i32, i32* %n, align 4
  %call = call i32 @write(i32 %1, i8* %2, i32 %3)
  store i32 %call, i32* %i, align 4
  %4 = load i32, i32* %i, align 4
  %cmp = icmp sgt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.cond
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %n, align 4
  %sub = sub nsw i32 %6, %5
  store i32 %sub, i32* %n, align 4
  %7 = load i32, i32* %n, align 4
  %cmp1 = icmp sle i32 %7, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %8 = load i32, i32* %nb.addr, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %9 = load i32, i32* %i, align 4
  %10 = load i8*, i8** %buf.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %10, i32 %9
  store i8* %add.ptr, i8** %buf.addr, align 4
  br label %if.end15

if.else:                                          ; preds = %for.cond
  %11 = load i32, i32* %i, align 4
  %cmp3 = icmp eq i32 %11, 0
  br i1 %cmp3, label %if.then4, label %if.else9

if.then4:                                         ; preds = %if.else
  %12 = load i32, i32* %nt, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %nt, align 4
  %cmp5 = icmp sgt i32 %inc, 3
  br i1 %cmp5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.then4
  %13 = load i32, i32* %nb.addr, align 4
  %14 = load i32, i32* %n, align 4
  %sub7 = sub i32 %13, %14
  store i32 %sub7, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %if.then4
  br label %if.end14

if.else9:                                         ; preds = %if.else
  %call10 = call i32* @__errno_location()
  %15 = load i32, i32* %call10, align 4
  %cmp11 = icmp ne i32 %15, 4
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.else9
  store i32 -1, i32* %retval, align 4
  br label %return

if.end13:                                         ; preds = %if.else9
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.end8
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end
  br label %for.cond

return:                                           ; preds = %if.then12, %if.then6, %if.then2
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare i32 @write(i32, i8*, i32) #1

declare i32* @__errno_location() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
