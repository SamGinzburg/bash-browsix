; ModuleID = 'ufuncs.c'
source_filename = "ufuncs.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.itimerval = type { %struct.timeval, %struct.timeval }
%struct.timeval = type { i32, i32 }
%struct.fd_set = type { [32 x i32] }

; Function Attrs: noinline nounwind
define i32 @falarm(i32 %secs, i32 %usecs) #0 {
entry:
  %retval = alloca i32, align 4
  %secs.addr = alloca i32, align 4
  %usecs.addr = alloca i32, align 4
  %it = alloca %struct.itimerval, align 4
  %oit = alloca %struct.itimerval, align 4
  store i32 %secs, i32* %secs.addr, align 4
  store i32 %usecs, i32* %usecs.addr, align 4
  %it_interval = getelementptr inbounds %struct.itimerval, %struct.itimerval* %it, i32 0, i32 0
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %it_interval, i32 0, i32 0
  store i32 0, i32* %tv_sec, align 4
  %it_interval1 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %it, i32 0, i32 0
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %it_interval1, i32 0, i32 1
  store i32 0, i32* %tv_usec, align 4
  %0 = load i32, i32* %secs.addr, align 4
  %it_value = getelementptr inbounds %struct.itimerval, %struct.itimerval* %it, i32 0, i32 1
  %tv_sec2 = getelementptr inbounds %struct.timeval, %struct.timeval* %it_value, i32 0, i32 0
  store i32 %0, i32* %tv_sec2, align 4
  %1 = load i32, i32* %usecs.addr, align 4
  %it_value3 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %it, i32 0, i32 1
  %tv_usec4 = getelementptr inbounds %struct.timeval, %struct.timeval* %it_value3, i32 0, i32 1
  store i32 %1, i32* %tv_usec4, align 4
  %call = call i32 @setitimer(i32 0, %struct.itimerval* %it, %struct.itimerval* %oit)
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %it_value5 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %oit, i32 0, i32 1
  %tv_usec6 = getelementptr inbounds %struct.timeval, %struct.timeval* %it_value5, i32 0, i32 1
  %2 = load i32, i32* %tv_usec6, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then7, label %if.end10

if.then7:                                         ; preds = %if.end
  %it_value8 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %oit, i32 0, i32 1
  %tv_sec9 = getelementptr inbounds %struct.timeval, %struct.timeval* %it_value8, i32 0, i32 0
  %3 = load i32, i32* %tv_sec9, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %tv_sec9, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then7, %if.end
  %it_value11 = getelementptr inbounds %struct.itimerval, %struct.itimerval* %oit, i32 0, i32 1
  %tv_sec12 = getelementptr inbounds %struct.timeval, %struct.timeval* %it_value11, i32 0, i32 0
  %4 = load i32, i32* %tv_sec12, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end10, %if.then
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

declare i32 @setitimer(i32, %struct.itimerval*, %struct.itimerval*) #1

; Function Attrs: noinline nounwind
define i32 @fsleep(i32 %sec, i32 %usec) #0 {
entry:
  %sec.addr = alloca i32, align 4
  %usec.addr = alloca i32, align 4
  %tv = alloca %struct.timeval, align 4
  store i32 %sec, i32* %sec.addr, align 4
  store i32 %usec, i32* %usec.addr, align 4
  %0 = load i32, i32* %sec.addr, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 0
  store i32 %0, i32* %tv_sec, align 4
  %1 = load i32, i32* %usec.addr, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tv, i32 0, i32 1
  store i32 %1, i32* %tv_usec, align 4
  %call = call i32 @select(i32 0, %struct.fd_set* null, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* %tv)
  ret i32 %call
}

declare i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
