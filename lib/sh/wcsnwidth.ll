; ModuleID = 'wcsnwidth.c'
source_filename = "wcsnwidth.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @wcsnwidth(i32* %pwcs, i32 %n, i32 %max) #0 {
entry:
  %retval = alloca i32, align 4
  %pwcs.addr = alloca i32*, align 4
  %n.addr = alloca i32, align 4
  %max.addr = alloca i32, align 4
  %wc = alloca i32, align 4
  %ws = alloca i32*, align 4
  %len = alloca i32, align 4
  %l = alloca i32, align 4
  store i32* %pwcs, i32** %pwcs.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %max, i32* %max.addr, align 4
  store i32 0, i32* %len, align 4
  %0 = load i32*, i32** %pwcs.addr, align 4
  store i32* %0, i32** %ws, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end15, %entry
  %1 = load i32, i32* %n.addr, align 4
  %dec = add i32 %1, -1
  store i32 %dec, i32* %n.addr, align 4
  %cmp = icmp ugt i32 %1, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %2 = load i32*, i32** %ws, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** %ws, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %wc, align 4
  %cmp1 = icmp ne i32 %3, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* %wc, align 4
  %call = call i32 @wcwidth(i32 %5)
  store i32 %call, i32* %l, align 4
  %6 = load i32, i32* %l, align 4
  %cmp2 = icmp slt i32 %6, 0
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  store i32 -1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %while.body
  %7 = load i32, i32* %l, align 4
  %8 = load i32, i32* %max.addr, align 4
  %9 = load i32, i32* %len, align 4
  %sub = sub i32 %8, %9
  %cmp3 = icmp eq i32 %7, %sub
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  %10 = load i32*, i32** %ws, align 4
  %11 = load i32*, i32** %pwcs.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i32* %10 to i32
  %sub.ptr.rhs.cast = ptrtoint i32* %11 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i32 %sub.ptr.sub, 4
  store i32 %sub.ptr.div, i32* %retval, align 4
  br label %return

if.else5:                                         ; preds = %if.else
  %12 = load i32, i32* %l, align 4
  %13 = load i32, i32* %max.addr, align 4
  %14 = load i32, i32* %len, align 4
  %sub6 = sub i32 %13, %14
  %cmp7 = icmp ugt i32 %12, %sub6
  br i1 %cmp7, label %if.then8, label %if.end

if.then8:                                         ; preds = %if.else5
  %15 = load i32*, i32** %ws, align 4
  %incdec.ptr9 = getelementptr inbounds i32, i32* %15, i32 -1
  store i32* %incdec.ptr9, i32** %ws, align 4
  %16 = load i32*, i32** %pwcs.addr, align 4
  %sub.ptr.lhs.cast10 = ptrtoint i32* %incdec.ptr9 to i32
  %sub.ptr.rhs.cast11 = ptrtoint i32* %16 to i32
  %sub.ptr.sub12 = sub i32 %sub.ptr.lhs.cast10, %sub.ptr.rhs.cast11
  %sub.ptr.div13 = sdiv exact i32 %sub.ptr.sub12, 4
  store i32 %sub.ptr.div13, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else5
  br label %if.end14

if.end14:                                         ; preds = %if.end
  br label %if.end15

if.end15:                                         ; preds = %if.end14
  %17 = load i32, i32* %l, align 4
  %18 = load i32, i32* %len, align 4
  %add = add nsw i32 %18, %17
  store i32 %add, i32* %len, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %19 = load i32*, i32** %ws, align 4
  %20 = load i32*, i32** %pwcs.addr, align 4
  %sub.ptr.lhs.cast16 = ptrtoint i32* %19 to i32
  %sub.ptr.rhs.cast17 = ptrtoint i32* %20 to i32
  %sub.ptr.sub18 = sub i32 %sub.ptr.lhs.cast16, %sub.ptr.rhs.cast17
  %sub.ptr.div19 = sdiv exact i32 %sub.ptr.sub18, 4
  store i32 %sub.ptr.div19, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then8, %if.then4, %if.then
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare i32 @wcwidth(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
