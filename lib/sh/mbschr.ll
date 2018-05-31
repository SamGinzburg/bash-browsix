; ModuleID = 'mbschr.c'
source_filename = "mbschr.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@locale_mb_cur_max = external global i32, align 4
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define i8* @mbschr(i8* %s, i32 %c) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %c.addr = alloca i32, align 4
  %pos = alloca i8*, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %strlength = alloca i32, align 4
  %mblength = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  %cmp = icmp sge i32 %conv1, 48
  br i1 %cmp, label %land.lhs.true, label %if.else27

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp3 = icmp sgt i32 %1, 1
  br i1 %cmp3, label %if.then, label %if.else27

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** %s.addr, align 4
  store i8* %2, i8** %pos, align 4
  %3 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %3, i8 0, i32 8, i32 4, i1 false)
  %4 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strlen(i8* %4)
  store i32 %call, i32* %strlength, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end26, %if.then
  %5 = load i32, i32* %strlength, align 4
  %cmp5 = icmp ugt i32 %5, 0
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load i8*, i8** %pos, align 4
  %7 = load i8, i8* %6, align 1
  %call7 = call i32 @is_basic(i8 signext %7)
  %tobool = icmp ne i32 %call7, 0
  br i1 %tobool, label %if.then8, label %if.else

if.then8:                                         ; preds = %while.body
  store i32 1, i32* %mblength, align 4
  br label %if.end18

if.else:                                          ; preds = %while.body
  %8 = load i8*, i8** %pos, align 4
  %9 = load i32, i32* %strlength, align 4
  %call9 = call i32 @mbrlen(i8* %8, i32 %9, %struct.__mbstate_t* %state)
  store i32 %call9, i32* %mblength, align 4
  %10 = load i32, i32* %mblength, align 4
  %cmp10 = icmp eq i32 %10, -2
  br i1 %cmp10, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %11 = load i32, i32* %mblength, align 4
  %cmp12 = icmp eq i32 %11, -1
  br i1 %cmp12, label %if.then17, label %lor.lhs.false14

lor.lhs.false14:                                  ; preds = %lor.lhs.false
  %12 = load i32, i32* %mblength, align 4
  %cmp15 = icmp eq i32 %12, 0
  br i1 %cmp15, label %if.then17, label %if.end

if.then17:                                        ; preds = %lor.lhs.false14, %lor.lhs.false, %if.else
  store i32 1, i32* %mblength, align 4
  br label %if.end

if.end:                                           ; preds = %if.then17, %lor.lhs.false14
  br label %if.end18

if.end18:                                         ; preds = %if.end, %if.then8
  %13 = load i32, i32* %mblength, align 4
  %cmp19 = icmp eq i32 %13, 1
  br i1 %cmp19, label %land.lhs.true21, label %if.end26

land.lhs.true21:                                  ; preds = %if.end18
  %14 = load i32, i32* %c.addr, align 4
  %15 = load i8*, i8** %pos, align 4
  %16 = load i8, i8* %15, align 1
  %conv22 = zext i8 %16 to i32
  %cmp23 = icmp eq i32 %14, %conv22
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %land.lhs.true21
  %17 = load i8*, i8** %pos, align 4
  store i8* %17, i8** %retval, align 4
  br label %return

if.end26:                                         ; preds = %land.lhs.true21, %if.end18
  %18 = load i32, i32* %mblength, align 4
  %19 = load i32, i32* %strlength, align 4
  %sub = sub i32 %19, %18
  store i32 %sub, i32* %strlength, align 4
  %20 = load i32, i32* %mblength, align 4
  %21 = load i8*, i8** %pos, align 4
  %add.ptr = getelementptr inbounds i8, i8* %21, i32 %20
  store i8* %add.ptr, i8** %pos, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i8* null, i8** %retval, align 4
  br label %return

if.else27:                                        ; preds = %land.lhs.true, %entry
  %22 = load i8*, i8** %s.addr, align 4
  %23 = load i32, i32* %c.addr, align 4
  %call28 = call i8* @strchr(i8* %22, i32 %23)
  store i8* %call28, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else27, %while.end, %if.then25
  %24 = load i8*, i8** %retval, align 4
  ret i8* %24
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @strlen(i8*) #2

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #2

declare i8* @strchr(i8*, i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
