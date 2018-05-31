; ModuleID = 'zread.c'
source_filename = "zread.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@executing_builtin = external global i32, align 4
@lind = internal global i32 0, align 4
@lused = internal global i32 0, align 4
@lbuf = internal global [128 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define i32 @zread(i32 %fd, i8* %buf, i32 %len) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %len.addr, align 4
  %call = call i32 @read(i32 %0, i8* %1, i32 %2)
  store i32 %call, i32* %r, align 4
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %call1 = call i32* @__errno_location()
  %3 = load i32, i32* %call1, align 4
  %cmp2 = icmp eq i32 %3, 4
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %4 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %4, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %5 = load i32, i32* @executing_builtin, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  call void @check_signals_and_traps()
  br label %if.end

if.else:                                          ; preds = %while.body
  call void @check_signals()
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %land.end
  %6 = load i32, i32* %r, align 4
  ret i32 %6
}

declare i32 @read(i32, i8*, i32) #1

declare i32* @__errno_location() #1

declare void @check_signals_and_traps() #1

declare void @check_signals() #1

; Function Attrs: noinline nounwind
define i32 @zreadretry(i32 %fd, i8* %buf, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %nintr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 0, i32* %nintr, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end7, %entry
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %len.addr, align 4
  %call = call i32 @read(i32 %0, i8* %1, i32 %2)
  store i32 %call, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %cmp = icmp sge i32 %3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  %4 = load i32, i32* %r, align 4
  store i32 %4, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.cond
  %5 = load i32, i32* %r, align 4
  %cmp1 = icmp eq i32 %5, -1
  br i1 %cmp1, label %land.lhs.true, label %if.end8

land.lhs.true:                                    ; preds = %if.end
  %call2 = call i32* @__errno_location()
  %6 = load i32, i32* %call2, align 4
  %cmp3 = icmp eq i32 %6, 4
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %nintr, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %nintr, align 4
  %cmp5 = icmp sge i32 %inc, 3
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.then4
  store i32 -1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.then4
  br label %for.cond

if.end8:                                          ; preds = %land.lhs.true, %if.end
  %8 = load i32, i32* %r, align 4
  store i32 %8, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end8, %if.then6, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define i32 @zreadintr(i32 %fd, i8* %buf, i32 %len) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %len.addr, align 4
  %call = call i32 @read(i32 %0, i8* %1, i32 %2)
  ret i32 %call
}

; Function Attrs: noinline nounwind
define i32 @zreadc(i32 %fd, i8* %cp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %cp.addr = alloca i8*, align 4
  %nr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %cp, i8** %cp.addr, align 4
  %0 = load i32, i32* @lind, align 4
  %1 = load i32, i32* @lused, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* @lused, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end4

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %fd.addr, align 4
  %call = call i32 @zread(i32 %3, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @lbuf, i32 0, i32 0), i32 128)
  store i32 %call, i32* %nr, align 4
  store i32 0, i32* @lind, align 4
  %4 = load i32, i32* %nr, align 4
  %cmp2 = icmp sle i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* @lused, align 4
  %5 = load i32, i32* %nr, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i32, i32* %nr, align 4
  store i32 %6, i32* @lused, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.end, %lor.lhs.false
  %7 = load i8*, i8** %cp.addr, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end4
  %8 = load i32, i32* @lind, align 4
  %inc = add i32 %8, 1
  store i32 %inc, i32* @lind, align 4
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* @lbuf, i32 0, i32 %8
  %9 = load i8, i8* %arrayidx, align 1
  %10 = load i8*, i8** %cp.addr, align 4
  store i8 %9, i8* %10, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then3
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @zreadcintr(i32 %fd, i8* %cp) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %cp.addr = alloca i8*, align 4
  %nr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %cp, i8** %cp.addr, align 4
  %0 = load i32, i32* @lind, align 4
  %1 = load i32, i32* @lused, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* @lused, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end4

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %fd.addr, align 4
  %call = call i32 @zreadintr(i32 %3, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @lbuf, i32 0, i32 0), i32 128)
  store i32 %call, i32* %nr, align 4
  store i32 0, i32* @lind, align 4
  %4 = load i32, i32* %nr, align 4
  %cmp2 = icmp sle i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 0, i32* @lused, align 4
  %5 = load i32, i32* %nr, align 4
  store i32 %5, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i32, i32* %nr, align 4
  store i32 %6, i32* @lused, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.end, %lor.lhs.false
  %7 = load i8*, i8** %cp.addr, align 4
  %tobool = icmp ne i8* %7, null
  br i1 %tobool, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end4
  %8 = load i32, i32* @lind, align 4
  %inc = add i32 %8, 1
  store i32 %inc, i32* @lind, align 4
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* @lbuf, i32 0, i32 %8
  %9 = load i8, i8* %arrayidx, align 1
  %10 = load i8*, i8** %cp.addr, align 4
  store i8 %9, i8* %10, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end6, %if.then3
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define i32 @zreadn(i32 %fd, i8* %cp, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %cp.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %nr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8* %cp, i8** %cp.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32, i32* @lind, align 4
  %1 = load i32, i32* @lused, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* @lused, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then, label %if.end7

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %len.addr, align 4
  %cmp2 = icmp ugt i32 %3, 128
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  store i32 128, i32* %len.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %4 = load i32, i32* %fd.addr, align 4
  %5 = load i32, i32* %len.addr, align 4
  %call = call i32 @zread(i32 %4, i8* getelementptr inbounds ([128 x i8], [128 x i8]* @lbuf, i32 0, i32 0), i32 %5)
  store i32 %call, i32* %nr, align 4
  store i32 0, i32* @lind, align 4
  %6 = load i32, i32* %nr, align 4
  %cmp4 = icmp sle i32 %6, 0
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 0, i32* @lused, align 4
  %7 = load i32, i32* %nr, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

if.end6:                                          ; preds = %if.end
  %8 = load i32, i32* %nr, align 4
  store i32 %8, i32* @lused, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %lor.lhs.false
  %9 = load i8*, i8** %cp.addr, align 4
  %tobool = icmp ne i8* %9, null
  br i1 %tobool, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end7
  %10 = load i32, i32* @lind, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* @lind, align 4
  %arrayidx = getelementptr inbounds [128 x i8], [128 x i8]* @lbuf, i32 0, i32 %10
  %11 = load i8, i8* %arrayidx, align 1
  %12 = load i8*, i8** %cp.addr, align 4
  store i8 %11, i8* %12, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end7
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then5
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define void @zreset() #0 {
entry:
  store i32 0, i32* @lused, align 4
  store i32 0, i32* @lind, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @zsyncfd(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  %off = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* @lused, align 4
  %1 = load i32, i32* @lind, align 4
  %sub = sub i32 %0, %1
  store i32 %sub, i32* %off, align 4
  store i32 0, i32* %r, align 4
  %2 = load i32, i32* %off, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %fd.addr, align 4
  %4 = load i32, i32* %off, align 4
  %sub1 = sub nsw i32 0, %4
  %call = call i32 @lseek(i32 %3, i32 %sub1, i32 1)
  store i32 %call, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %r, align 4
  %cmp2 = icmp ne i32 %5, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 0, i32* @lind, align 4
  store i32 0, i32* @lused, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  ret void
}

declare i32 @lseek(i32, i32, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
