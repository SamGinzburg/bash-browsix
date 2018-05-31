; ModuleID = 'zcatfd.c'
source_filename = "zcatfd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @zcatfd(i32 %fd, i32 %ofd, i8* %fn) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %ofd.addr = alloca i32, align 4
  %fn.addr = alloca i8*, align 4
  %nr = alloca i32, align 4
  %rval = alloca i32, align 4
  %lbuf = alloca [128 x i8], align 1
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %ofd, i32* %ofd.addr, align 4
  store i8* %fn, i8** %fn.addr, align 4
  store i32 0, i32* %rval, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end9
  %0 = load i32, i32* %fd.addr, align 4
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %lbuf, i32 0, i32 0
  %call = call i32 @zread(i32 %0, i8* %arraydecay, i32 128)
  store i32 %call, i32* %nr, align 4
  %1 = load i32, i32* %nr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %while.end

if.else:                                          ; preds = %while.body
  %2 = load i32, i32* %nr, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  store i32 -1, i32* %rval, align 4
  br label %while.end

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %ofd.addr, align 4
  %arraydecay4 = getelementptr inbounds [128 x i8], [128 x i8]* %lbuf, i32 0, i32 0
  %4 = load i32, i32* %nr, align 4
  %call5 = call i32 @zwrite(i32 %3, i8* %arraydecay4, i32 %4)
  %cmp6 = icmp slt i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.else3
  store i32 -1, i32* %rval, align 4
  br label %while.end

if.end:                                           ; preds = %if.else3
  br label %if.end8

if.end8:                                          ; preds = %if.end
  br label %if.end9

if.end9:                                          ; preds = %if.end8
  br label %while.body

while.end:                                        ; preds = %if.then7, %if.then2, %if.then
  %5 = load i32, i32* %rval, align 4
  ret i32 %5
}

declare i32 @zread(i32, i8*, i32) #1

declare i32 @zwrite(i32, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
