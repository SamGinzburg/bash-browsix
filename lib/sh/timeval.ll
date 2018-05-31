; ModuleID = 'timeval.c'
source_filename = "timeval.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.timeval = type { i32, i32 }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [13 x i8] c"%ldm%d.%03ds\00", align 1

; Function Attrs: noinline nounwind
define %struct.timeval* @difftimeval(%struct.timeval* %d, %struct.timeval* %t1, %struct.timeval* %t2) #0 {
entry:
  %d.addr = alloca %struct.timeval*, align 4
  %t1.addr = alloca %struct.timeval*, align 4
  %t2.addr = alloca %struct.timeval*, align 4
  store %struct.timeval* %d, %struct.timeval** %d.addr, align 4
  store %struct.timeval* %t1, %struct.timeval** %t1.addr, align 4
  store %struct.timeval* %t2, %struct.timeval** %t2.addr, align 4
  %0 = load %struct.timeval*, %struct.timeval** %t2.addr, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i32 0, i32 0
  %1 = load i32, i32* %tv_sec, align 4
  %2 = load %struct.timeval*, %struct.timeval** %t1.addr, align 4
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i32 0, i32 0
  %3 = load i32, i32* %tv_sec1, align 4
  %sub = sub nsw i32 %1, %3
  %4 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec2 = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i32 0, i32 0
  store i32 %sub, i32* %tv_sec2, align 4
  %5 = load %struct.timeval*, %struct.timeval** %t2.addr, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %5, i32 0, i32 1
  %6 = load i32, i32* %tv_usec, align 4
  %7 = load %struct.timeval*, %struct.timeval** %t1.addr, align 4
  %tv_usec3 = getelementptr inbounds %struct.timeval, %struct.timeval* %7, i32 0, i32 1
  %8 = load i32, i32* %tv_usec3, align 4
  %sub4 = sub nsw i32 %6, %8
  %9 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec5 = getelementptr inbounds %struct.timeval, %struct.timeval* %9, i32 0, i32 1
  store i32 %sub4, i32* %tv_usec5, align 4
  %10 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec6 = getelementptr inbounds %struct.timeval, %struct.timeval* %10, i32 0, i32 1
  %11 = load i32, i32* %tv_usec6, align 4
  %cmp = icmp slt i32 %11, 0
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %entry
  %12 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec7 = getelementptr inbounds %struct.timeval, %struct.timeval* %12, i32 0, i32 1
  %13 = load i32, i32* %tv_usec7, align 4
  %add = add nsw i32 %13, 1000000
  store i32 %add, i32* %tv_usec7, align 4
  %14 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec8 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 0
  %15 = load i32, i32* %tv_sec8, align 4
  %sub9 = sub nsw i32 %15, 1
  store i32 %sub9, i32* %tv_sec8, align 4
  %16 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec10 = getelementptr inbounds %struct.timeval, %struct.timeval* %16, i32 0, i32 0
  %17 = load i32, i32* %tv_sec10, align 4
  %cmp11 = icmp slt i32 %17, 0
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %if.then
  %18 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec13 = getelementptr inbounds %struct.timeval, %struct.timeval* %18, i32 0, i32 0
  store i32 0, i32* %tv_sec13, align 4
  %19 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec14 = getelementptr inbounds %struct.timeval, %struct.timeval* %19, i32 0, i32 1
  store i32 0, i32* %tv_usec14, align 4
  br label %if.end

if.end:                                           ; preds = %if.then12, %if.then
  br label %if.end15

if.end15:                                         ; preds = %if.end, %entry
  %20 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  ret %struct.timeval* %20
}

; Function Attrs: noinline nounwind
define %struct.timeval* @addtimeval(%struct.timeval* %d, %struct.timeval* %t1, %struct.timeval* %t2) #0 {
entry:
  %d.addr = alloca %struct.timeval*, align 4
  %t1.addr = alloca %struct.timeval*, align 4
  %t2.addr = alloca %struct.timeval*, align 4
  store %struct.timeval* %d, %struct.timeval** %d.addr, align 4
  store %struct.timeval* %t1, %struct.timeval** %t1.addr, align 4
  store %struct.timeval* %t2, %struct.timeval** %t2.addr, align 4
  %0 = load %struct.timeval*, %struct.timeval** %t1.addr, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i32 0, i32 0
  %1 = load i32, i32* %tv_sec, align 4
  %2 = load %struct.timeval*, %struct.timeval** %t2.addr, align 4
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i32 0, i32 0
  %3 = load i32, i32* %tv_sec1, align 4
  %add = add nsw i32 %1, %3
  %4 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec2 = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i32 0, i32 0
  store i32 %add, i32* %tv_sec2, align 4
  %5 = load %struct.timeval*, %struct.timeval** %t1.addr, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %5, i32 0, i32 1
  %6 = load i32, i32* %tv_usec, align 4
  %7 = load %struct.timeval*, %struct.timeval** %t2.addr, align 4
  %tv_usec3 = getelementptr inbounds %struct.timeval, %struct.timeval* %7, i32 0, i32 1
  %8 = load i32, i32* %tv_usec3, align 4
  %add4 = add nsw i32 %6, %8
  %9 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec5 = getelementptr inbounds %struct.timeval, %struct.timeval* %9, i32 0, i32 1
  store i32 %add4, i32* %tv_usec5, align 4
  %10 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec6 = getelementptr inbounds %struct.timeval, %struct.timeval* %10, i32 0, i32 1
  %11 = load i32, i32* %tv_usec6, align 4
  %cmp = icmp sge i32 %11, 1000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %12 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_usec7 = getelementptr inbounds %struct.timeval, %struct.timeval* %12, i32 0, i32 1
  %13 = load i32, i32* %tv_usec7, align 4
  %sub = sub nsw i32 %13, 1000000
  store i32 %sub, i32* %tv_usec7, align 4
  %14 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  %tv_sec8 = getelementptr inbounds %struct.timeval, %struct.timeval* %14, i32 0, i32 0
  %15 = load i32, i32* %tv_sec8, align 4
  %add9 = add nsw i32 %15, 1
  store i32 %add9, i32* %tv_sec8, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = load %struct.timeval*, %struct.timeval** %d.addr, align 4
  ret %struct.timeval* %16
}

; Function Attrs: noinline nounwind
define i32 @timeval_to_cpu(%struct.timeval* %rt, %struct.timeval* %ut, %struct.timeval* %st) #0 {
entry:
  %rt.addr = alloca %struct.timeval*, align 4
  %ut.addr = alloca %struct.timeval*, align 4
  %st.addr = alloca %struct.timeval*, align 4
  %t1 = alloca %struct.timeval, align 4
  %t2 = alloca %struct.timeval, align 4
  %i = alloca i32, align 4
  store %struct.timeval* %rt, %struct.timeval** %rt.addr, align 4
  store %struct.timeval* %ut, %struct.timeval** %ut.addr, align 4
  store %struct.timeval* %st, %struct.timeval** %st.addr, align 4
  %0 = load %struct.timeval*, %struct.timeval** %ut.addr, align 4
  %1 = load %struct.timeval*, %struct.timeval** %st.addr, align 4
  %call = call %struct.timeval* @addtimeval(%struct.timeval* %t1, %struct.timeval* %0, %struct.timeval* %1)
  %2 = load %struct.timeval*, %struct.timeval** %rt.addr, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %2, i32 0, i32 0
  %3 = load i32, i32* %tv_sec, align 4
  %tv_sec1 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  store i32 %3, i32* %tv_sec1, align 4
  %4 = load %struct.timeval*, %struct.timeval** %rt.addr, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %4, i32 0, i32 1
  %5 = load i32, i32* %tv_usec, align 4
  %tv_usec2 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 1
  store i32 %5, i32* %tv_usec2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %6, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tv_sec3 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %7 = load i32, i32* %tv_sec3, align 4
  %cmp4 = icmp sgt i32 %7, 99999999
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %tv_sec5 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %8 = load i32, i32* %tv_sec5, align 4
  %cmp6 = icmp sgt i32 %8, 99999999
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %tv_sec7 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %9 = load i32, i32* %tv_sec7, align 4
  %mul = mul nsw i32 %9, 10
  store i32 %mul, i32* %tv_sec7, align 4
  %tv_usec8 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 1
  %10 = load i32, i32* %tv_usec8, align 4
  %div = sdiv i32 %10, 100000
  %tv_sec9 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %11 = load i32, i32* %tv_sec9, align 4
  %add = add nsw i32 %11, %div
  store i32 %add, i32* %tv_sec9, align 4
  %tv_usec10 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 1
  %12 = load i32, i32* %tv_usec10, align 4
  %mul11 = mul nsw i32 %12, 10
  store i32 %mul11, i32* %tv_usec10, align 4
  %tv_usec12 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 1
  %13 = load i32, i32* %tv_usec12, align 4
  %rem = srem i32 %13, 1000000
  store i32 %rem, i32* %tv_usec12, align 4
  %tv_sec13 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %14 = load i32, i32* %tv_sec13, align 4
  %mul14 = mul nsw i32 %14, 10
  store i32 %mul14, i32* %tv_sec13, align 4
  %tv_usec15 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 1
  %15 = load i32, i32* %tv_usec15, align 4
  %div16 = sdiv i32 %15, 100000
  %tv_sec17 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %16 = load i32, i32* %tv_sec17, align 4
  %add18 = add nsw i32 %16, %div16
  store i32 %add18, i32* %tv_sec17, align 4
  %tv_usec19 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 1
  %17 = load i32, i32* %tv_usec19, align 4
  %mul20 = mul nsw i32 %17, 10
  store i32 %mul20, i32* %tv_usec19, align 4
  %tv_usec21 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 1
  %18 = load i32, i32* %tv_usec21, align 4
  %rem22 = srem i32 %18, 1000000
  store i32 %rem22, i32* %tv_usec21, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond23

for.cond23:                                       ; preds = %for.inc34, %for.end
  %20 = load i32, i32* %i, align 4
  %cmp24 = icmp slt i32 %20, 4
  br i1 %cmp24, label %for.body25, label %for.end36

for.body25:                                       ; preds = %for.cond23
  %tv_sec26 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %21 = load i32, i32* %tv_sec26, align 4
  %cmp27 = icmp slt i32 %21, 100000000
  br i1 %cmp27, label %if.then28, label %if.else

if.then28:                                        ; preds = %for.body25
  %tv_sec29 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %22 = load i32, i32* %tv_sec29, align 4
  %mul30 = mul nsw i32 %22, 10
  store i32 %mul30, i32* %tv_sec29, align 4
  br label %if.end33

if.else:                                          ; preds = %for.body25
  %tv_sec31 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %23 = load i32, i32* %tv_sec31, align 4
  %div32 = sdiv i32 %23, 10
  store i32 %div32, i32* %tv_sec31, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then28
  br label %for.inc34

for.inc34:                                        ; preds = %if.end33
  %24 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %24, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond23

for.end36:                                        ; preds = %for.cond23
  %tv_sec37 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %25 = load i32, i32* %tv_sec37, align 4
  %cmp38 = icmp eq i32 %25, 0
  br i1 %cmp38, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end36
  br label %cond.end

cond.false:                                       ; preds = %for.end36
  %tv_sec39 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i32 0, i32 0
  %26 = load i32, i32* %tv_sec39, align 4
  %tv_sec40 = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i32 0, i32 0
  %27 = load i32, i32* %tv_sec40, align 4
  %div41 = sdiv i32 %26, %27
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %div41, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind
define void @timeval_to_secs(%struct.timeval* %tvp, i32* %sp, i32* %sfp) #0 {
entry:
  %tvp.addr = alloca %struct.timeval*, align 4
  %sp.addr = alloca i32*, align 4
  %sfp.addr = alloca i32*, align 4
  %rest = alloca i32, align 4
  store %struct.timeval* %tvp, %struct.timeval** %tvp.addr, align 4
  store i32* %sp, i32** %sp.addr, align 4
  store i32* %sfp, i32** %sfp.addr, align 4
  %0 = load %struct.timeval*, %struct.timeval** %tvp.addr, align 4
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %0, i32 0, i32 0
  %1 = load i32, i32* %tv_sec, align 4
  %2 = load i32*, i32** %sp.addr, align 4
  store i32 %1, i32* %2, align 4
  %3 = load %struct.timeval*, %struct.timeval** %tvp.addr, align 4
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %3, i32 0, i32 1
  %4 = load i32, i32* %tv_usec, align 4
  %rem = srem i32 %4, 1000000
  %5 = load i32*, i32** %sfp.addr, align 4
  store i32 %rem, i32* %5, align 4
  %6 = load i32*, i32** %sfp.addr, align 4
  %7 = load i32, i32* %6, align 4
  %rem1 = srem i32 %7, 1000
  store i32 %rem1, i32* %rest, align 4
  %8 = load i32*, i32** %sfp.addr, align 4
  %9 = load i32, i32* %8, align 4
  %mul = mul nsw i32 %9, 1000
  %div = sdiv i32 %mul, 1000000
  %10 = load i32*, i32** %sfp.addr, align 4
  store i32 %div, i32* %10, align 4
  %11 = load i32, i32* %rest, align 4
  %cmp = icmp sge i32 %11, 500
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %12 = load i32*, i32** %sfp.addr, align 4
  %13 = load i32, i32* %12, align 4
  %add = add nsw i32 %13, 1
  store i32 %add, i32* %12, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32*, i32** %sfp.addr, align 4
  %15 = load i32, i32* %14, align 4
  %cmp2 = icmp sge i32 %15, 1000
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %16 = load i32*, i32** %sp.addr, align 4
  %17 = load i32, i32* %16, align 4
  %add4 = add nsw i32 %17, 1
  store i32 %add4, i32* %16, align 4
  %18 = load i32*, i32** %sfp.addr, align 4
  %19 = load i32, i32* %18, align 4
  %sub = sub nsw i32 %19, 1000
  store i32 %sub, i32* %18, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define void @print_timeval(%struct._IO_FILE* %fp, %struct.timeval* %tvp) #0 {
entry:
  %fp.addr = alloca %struct._IO_FILE*, align 4
  %tvp.addr = alloca %struct.timeval*, align 4
  %timestamp = alloca i32, align 4
  %minutes = alloca i32, align 4
  %seconds = alloca i32, align 4
  %seconds_fraction = alloca i32, align 4
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %fp.addr, align 4
  store %struct.timeval* %tvp, %struct.timeval** %tvp.addr, align 4
  %0 = load %struct.timeval*, %struct.timeval** %tvp.addr, align 4
  call void @timeval_to_secs(%struct.timeval* %0, i32* %timestamp, i32* %seconds_fraction)
  %1 = load i32, i32* %timestamp, align 4
  %div = sdiv i32 %1, 60
  store i32 %div, i32* %minutes, align 4
  %2 = load i32, i32* %timestamp, align 4
  %rem = srem i32 %2, 60
  store i32 %rem, i32* %seconds, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %fp.addr, align 4
  %4 = load i32, i32* %minutes, align 4
  %5 = load i32, i32* %seconds, align 4
  %6 = load i32, i32* %seconds_fraction, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5, i32 %6)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
