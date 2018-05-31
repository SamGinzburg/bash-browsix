; ModuleID = 'shmbchar.c'
source_filename = "shmbchar.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@is_basic_table = constant [8 x i32] [i32 6656, i32 -17, i32 -2, i32 2147483646, i32 0, i32 0, i32 0, i32 0], align 4
@locale_mb_cur_max = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @mbstrlen(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %clen = alloca i32, align 4
  %nc = alloca i32, align 4
  %mbs = alloca %struct.__mbstate_t, align 4
  %mbsbak = alloca %struct.__mbstate_t, align 4
  %f = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %mbs to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = bitcast %struct.__mbstate_t* %mbsbak to i8*
  call void @llvm.memset.p0i8.i32(i8* %1, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %nc, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  store i32 %call, i32* %mb_cur_max, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %entry
  %2 = load i8*, i8** %s.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i8*, i8** %s.addr, align 4
  %5 = load i8, i8* %4, align 1
  %call1 = call i32 @is_basic(i8 signext %5)
  store i32 %call1, i32* %f, align 4
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.rhs
  br label %cond.end

cond.false:                                       ; preds = %land.rhs
  %6 = load i8*, i8** %s.addr, align 4
  %7 = load i32, i32* %mb_cur_max, align 4
  %call3 = call i32 @mbrlen(i8* %6, i32 %7, %struct.__mbstate_t* %mbs)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %call3, %cond.false ]
  store i32 %cond, i32* %clen, align 4
  %cmp = icmp ne i32 %cond, 0
  br label %land.end

land.end:                                         ; preds = %cond.end, %while.cond
  %8 = phi i1 [ false, %while.cond ], [ %cmp, %cond.end ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %9 = load i32, i32* %clen, align 4
  %cmp5 = icmp eq i32 %9, -1
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %10 = load i32, i32* %clen, align 4
  %cmp7 = icmp eq i32 %10, -2
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.body
  store i32 1, i32* %clen, align 4
  %11 = bitcast %struct.__mbstate_t* %mbs to i8*
  %12 = bitcast %struct.__mbstate_t* %mbsbak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* %12, i32 8, i32 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %13 = load i32, i32* %f, align 4
  %cmp9 = icmp eq i32 %13, 0
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  %14 = bitcast %struct.__mbstate_t* %mbsbak to i8*
  %15 = bitcast %struct.__mbstate_t* %mbs to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end
  %16 = load i32, i32* %clen, align 4
  %17 = load i8*, i8** %s.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %17, i32 %16
  store i8* %add.ptr, i8** %s.addr, align 4
  %18 = load i32, i32* %nc, align 4
  %inc = add i32 %18, 1
  store i32 %inc, i32* %nc, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %19 = load i32, i32* %nc, align 4
  ret i32 %19
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @__ctype_get_mb_cur_max() #2

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* bitcast ([8 x i32]* @is_basic_table to [0 x i32]*), i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: noinline nounwind
define i8* @mbsmbchar(i8* %s) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %t = alloca i8*, align 4
  %clen = alloca i32, align 4
  %mbs = alloca %struct.__mbstate_t, align 4
  %mb_cur_max = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %mbs to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %call = call i32 @__ctype_get_mb_cur_max()
  store i32 %call, i32* %mb_cur_max, align 4
  %1 = load i8*, i8** %s.addr, align 4
  store i8* %1, i8** %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %t, align 4
  %3 = load i8, i8* %2, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %t, align 4
  %5 = load i8, i8* %4, align 1
  %call1 = call i32 @is_basic(i8 signext %5)
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %6 = load i8*, i8** %t, align 4
  %7 = load i32, i32* %mb_cur_max, align 4
  %call3 = call i32 @mbrlen(i8* %6, i32 %7, %struct.__mbstate_t* %mbs)
  store i32 %call3, i32* %clen, align 4
  %8 = load i32, i32* %clen, align 4
  %cmp = icmp eq i32 %8, 0
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  %9 = load i32, i32* %clen, align 4
  %cmp6 = icmp eq i32 %9, -1
  br i1 %cmp6, label %if.then8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %10 = load i32, i32* %clen, align 4
  %cmp7 = icmp eq i32 %10, -2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %lor.lhs.false, %if.end5
  br label %for.inc

if.end9:                                          ; preds = %lor.lhs.false
  %11 = load i32, i32* %clen, align 4
  %cmp10 = icmp ugt i32 %11, 1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end9
  %12 = load i8*, i8** %t, align 4
  store i8* %12, i8** %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end9
  br label %for.inc

for.inc:                                          ; preds = %if.end12, %if.then8, %if.then
  %13 = load i8*, i8** %t, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** %t, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then11, %if.then4
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

; Function Attrs: noinline nounwind
define i32 @sh_mbsnlen(i8* %src, i32 %srclen, i32 %maxlen) #0 {
entry:
  %src.addr = alloca i8*, align 4
  %srclen.addr = alloca i32, align 4
  %maxlen.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %sind = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  store i8* %src, i8** %src.addr, align 4
  store i32 %srclen, i32* %srclen.addr, align 4
  store i32 %maxlen, i32* %maxlen.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %count, align 4
  store i32 0, i32* %sind, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end21, %entry
  %1 = load i8*, i8** %src.addr, align 4
  %2 = load i32, i32* %sind, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %count, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %count, align 4
  br label %do.body

do.body:                                          ; preds = %for.body
  %5 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp = icmp sgt i32 %5, 1
  br i1 %cmp, label %if.then, label %if.else16

if.then:                                          ; preds = %do.body
  %6 = load i8*, i8** %src.addr, align 4
  %7 = load i32, i32* %sind, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx1, align 1
  %call = call i32 @is_basic(i8 signext %8)
  store i32 %call, i32* %_f, align 4
  %9 = load i32, i32* %_f, align 4
  %tobool2 = icmp ne i32 %9, 0
  br i1 %tobool2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  store i32 1, i32* %mblength, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %10 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %11 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %10, i8* %11, i32 8, i32 4, i1 false)
  %12 = load i8*, i8** %src.addr, align 4
  %13 = load i32, i32* %sind, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 %13
  %14 = load i32, i32* %srclen.addr, align 4
  %15 = load i32, i32* %sind, align 4
  %sub = sub i32 %14, %15
  %call4 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call4, i32* %mblength, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %16 = load i32, i32* %mblength, align 4
  %cmp5 = icmp eq i32 %16, -2
  br i1 %cmp5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %17 = load i32, i32* %mblength, align 4
  %cmp6 = icmp eq i32 %17, -1
  br i1 %cmp6, label %if.then7, label %if.else9

if.then7:                                         ; preds = %lor.lhs.false, %if.end
  %18 = bitcast %struct.__mbstate_t* %state to i8*
  %19 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %18, i8* %19, i32 8, i32 4, i1 false)
  %20 = load i32, i32* %sind, align 4
  %inc8 = add nsw i32 %20, 1
  store i32 %inc8, i32* %sind, align 4
  br label %if.end15

if.else9:                                         ; preds = %lor.lhs.false
  %21 = load i32, i32* %mblength, align 4
  %cmp10 = icmp eq i32 %21, 0
  br i1 %cmp10, label %if.then11, label %if.else13

if.then11:                                        ; preds = %if.else9
  %22 = load i32, i32* %sind, align 4
  %inc12 = add nsw i32 %22, 1
  store i32 %inc12, i32* %sind, align 4
  br label %if.end14

if.else13:                                        ; preds = %if.else9
  %23 = load i32, i32* %mblength, align 4
  %24 = load i32, i32* %sind, align 4
  %add = add i32 %24, %23
  store i32 %add, i32* %sind, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then11
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.then7
  br label %if.end18

if.else16:                                        ; preds = %do.body
  %25 = load i32, i32* %sind, align 4
  %inc17 = add nsw i32 %25, 1
  store i32 %inc17, i32* %sind, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.end15
  br label %do.end

do.end:                                           ; preds = %if.end18
  %26 = load i32, i32* %sind, align 4
  %27 = load i32, i32* %maxlen.addr, align 4
  %cmp19 = icmp sgt i32 %26, %27
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %do.end
  br label %for.end

if.end21:                                         ; preds = %do.end
  br label %for.cond

for.end:                                          ; preds = %if.then20, %for.cond
  %28 = load i32, i32* %count, align 4
  ret i32 %28
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
