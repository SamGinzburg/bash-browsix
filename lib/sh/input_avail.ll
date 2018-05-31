; ModuleID = 'input_avail.c'
source_filename = "input_avail.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.fd_set = type { [32 x i32] }
%struct.timeval = type { i32, i32 }

; Function Attrs: noinline nounwind
define i32 @input_avail(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %chars_avail = alloca i32, align 4
  %readfds = alloca %struct.fd_set, align 4
  %exceptfds = alloca %struct.fd_set, align 4
  %timeout = alloca %struct.timeval, align 4
  %__i = alloca i32, align 4
  %__b = alloca i32*, align 4
  %__i2 = alloca i32, align 4
  %__b3 = alloca i32*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %chars_avail, align 4
  br label %do.body

do.body:                                          ; preds = %if.end
  %fds_bits = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %arraydecay = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits, i32 0, i32 0
  store i32* %arraydecay, i32** %__b, align 4
  store i32 32, i32* %__i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %1 = load i32, i32* %__i, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %__b, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** %__b, align 4
  store i32 0, i32* %2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %__i, align 4
  %dec = add nsw i32 %3, -1
  store i32 %dec, i32* %__i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %do.end

do.end:                                           ; preds = %for.end
  br label %do.body1

do.body1:                                         ; preds = %do.end
  %fds_bits4 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %arraydecay5 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits4, i32 0, i32 0
  store i32* %arraydecay5, i32** %__b3, align 4
  store i32 32, i32* %__i2, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc10, %do.body1
  %4 = load i32, i32* %__i2, align 4
  %tobool7 = icmp ne i32 %4, 0
  br i1 %tobool7, label %for.body8, label %for.end12

for.body8:                                        ; preds = %for.cond6
  %5 = load i32*, i32** %__b3, align 4
  %incdec.ptr9 = getelementptr inbounds i32, i32* %5, i32 1
  store i32* %incdec.ptr9, i32** %__b3, align 4
  store i32 0, i32* %5, align 4
  br label %for.inc10

for.inc10:                                        ; preds = %for.body8
  %6 = load i32, i32* %__i2, align 4
  %dec11 = add nsw i32 %6, -1
  store i32 %dec11, i32* %__i2, align 4
  br label %for.cond6

for.end12:                                        ; preds = %for.cond6
  br label %do.end13

do.end13:                                         ; preds = %for.end12
  %7 = load i32, i32* %fd.addr, align 4
  %rem = urem i32 %7, 32
  %shl = shl i32 1, %rem
  %fds_bits14 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %readfds, i32 0, i32 0
  %8 = load i32, i32* %fd.addr, align 4
  %div = udiv i32 %8, 32
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits14, i32 0, i32 %div
  %9 = load i32, i32* %arrayidx, align 4
  %or = or i32 %9, %shl
  store i32 %or, i32* %arrayidx, align 4
  %10 = load i32, i32* %fd.addr, align 4
  %rem15 = urem i32 %10, 32
  %shl16 = shl i32 1, %rem15
  %fds_bits17 = getelementptr inbounds %struct.fd_set, %struct.fd_set* %exceptfds, i32 0, i32 0
  %11 = load i32, i32* %fd.addr, align 4
  %div18 = udiv i32 %11, 32
  %arrayidx19 = getelementptr inbounds [32 x i32], [32 x i32]* %fds_bits17, i32 0, i32 %div18
  %12 = load i32, i32* %arrayidx19, align 4
  %or20 = or i32 %12, %shl16
  store i32 %or20, i32* %arrayidx19, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 0
  store i32 0, i32* %tv_sec, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %timeout, i32 0, i32 1
  store i32 0, i32* %tv_usec, align 4
  %13 = load i32, i32* %fd.addr, align 4
  %add = add nsw i32 %13, 1
  %call = call i32 @select(i32 %add, %struct.fd_set* %readfds, %struct.fd_set* null, %struct.fd_set* %exceptfds, %struct.timeval* %timeout)
  store i32 %call, i32* %result, align 4
  %14 = load i32, i32* %result, align 4
  %cmp21 = icmp sle i32 %14, 0
  %cond = select i1 %cmp21, i32 0, i32 1
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end13, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
