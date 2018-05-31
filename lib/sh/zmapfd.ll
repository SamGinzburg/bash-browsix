; ModuleID = 'zmapfd.c'
source_filename = "zmapfd.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [9 x i8] c"zmapfd.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @zmapfd(i32 %fd, i8** %ostr, i8* %fn) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %ostr.addr = alloca i8**, align 4
  %fn.addr = alloca i8*, align 4
  %nr = alloca i32, align 4
  %rval = alloca i32, align 4
  %lbuf = alloca [128 x i8], align 1
  %result = alloca i8*, align 4
  %rsize = alloca i32, align 4
  %rind = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8** %ostr, i8*** %ostr.addr, align 4
  store i8* %fn, i8** %fn.addr, align 4
  store i32 0, i32* %rval, align 4
  store i32 64, i32* %rsize, align 4
  %call = call i8* @sh_xmalloc(i32 64, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 56)
  store i8* %call, i8** %result, align 4
  store i32 0, i32* %rind, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %do.end
  %0 = load i32, i32* %fd.addr, align 4
  %arraydecay = getelementptr inbounds [128 x i8], [128 x i8]* %lbuf, i32 0, i32 0
  %call1 = call i32 @zread(i32 %0, i8* %arraydecay, i32 128)
  store i32 %call1, i32* %nr, align 4
  %1 = load i32, i32* %nr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %2 = load i32, i32* %rind, align 4
  store i32 %2, i32* %rval, align 4
  br label %while.end18

if.else:                                          ; preds = %while.body
  %3 = load i32, i32* %nr, align 4
  %cmp2 = icmp slt i32 %3, 0
  br i1 %cmp2, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.else
  %4 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 69)
  %5 = load i8**, i8*** %ostr.addr, align 4
  %tobool = icmp ne i8** %5, null
  br i1 %tobool, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then3
  %6 = load i8**, i8*** %ostr.addr, align 4
  store i8* null, i8** %6, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then3
  store i32 -1, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5
  br label %do.body

do.body:                                          ; preds = %if.end6
  %7 = load i32, i32* %rind, align 4
  %8 = load i32, i32* %nr, align 4
  %add = add nsw i32 %7, %8
  %9 = load i32, i32* %rsize, align 4
  %cmp7 = icmp sge i32 %add, %9
  br i1 %cmp7, label %if.then8, label %if.end15

if.then8:                                         ; preds = %do.body
  br label %while.cond9

while.cond9:                                      ; preds = %while.body12, %if.then8
  %10 = load i32, i32* %rind, align 4
  %11 = load i32, i32* %nr, align 4
  %add10 = add nsw i32 %10, %11
  %12 = load i32, i32* %rsize, align 4
  %cmp11 = icmp sge i32 %add10, %12
  br i1 %cmp11, label %while.body12, label %while.end

while.body12:                                     ; preds = %while.cond9
  %13 = load i32, i32* %rsize, align 4
  %add13 = add nsw i32 %13, 128
  store i32 %add13, i32* %rsize, align 4
  br label %while.cond9

while.end:                                        ; preds = %while.cond9
  %14 = load i8*, i8** %result, align 4
  %15 = load i32, i32* %rsize, align 4
  %call14 = call i8* @sh_xrealloc(i8* %14, i32 %15, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 75)
  store i8* %call14, i8** %result, align 4
  br label %if.end15

if.end15:                                         ; preds = %while.end, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end15
  %16 = load i8*, i8** %result, align 4
  %17 = load i32, i32* %rind, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 %17
  %arraydecay16 = getelementptr inbounds [128 x i8], [128 x i8]* %lbuf, i32 0, i32 0
  %18 = load i32, i32* %nr, align 4
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr, i8* %arraydecay16, i32 %18, i32 1, i1 false)
  %19 = load i32, i32* %nr, align 4
  %20 = load i32, i32* %rind, align 4
  %add17 = add nsw i32 %20, %19
  store i32 %add17, i32* %rind, align 4
  br label %while.body

while.end18:                                      ; preds = %if.then
  br label %do.body19

do.body19:                                        ; preds = %while.end18
  %21 = load i32, i32* %rind, align 4
  %add20 = add nsw i32 %21, 1
  %22 = load i32, i32* %rsize, align 4
  %cmp21 = icmp sge i32 %add20, %22
  br i1 %cmp21, label %if.then22, label %if.end29

if.then22:                                        ; preds = %do.body19
  br label %while.cond

while.cond:                                       ; preds = %while.body25, %if.then22
  %23 = load i32, i32* %rind, align 4
  %add23 = add nsw i32 %23, 1
  %24 = load i32, i32* %rsize, align 4
  %cmp24 = icmp sge i32 %add23, %24
  br i1 %cmp24, label %while.body25, label %while.end27

while.body25:                                     ; preds = %while.cond
  %25 = load i32, i32* %rsize, align 4
  %add26 = add nsw i32 %25, 128
  store i32 %add26, i32* %rsize, align 4
  br label %while.cond

while.end27:                                      ; preds = %while.cond
  %26 = load i8*, i8** %result, align 4
  %27 = load i32, i32* %rsize, align 4
  %call28 = call i8* @sh_xrealloc(i8* %26, i32 %27, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 80)
  store i8* %call28, i8** %result, align 4
  br label %if.end29

if.end29:                                         ; preds = %while.end27, %do.body19
  br label %do.end30

do.end30:                                         ; preds = %if.end29
  %28 = load i8*, i8** %result, align 4
  %29 = load i32, i32* %rind, align 4
  %arrayidx = getelementptr inbounds i8, i8* %28, i32 %29
  store i8 0, i8* %arrayidx, align 1
  %30 = load i8**, i8*** %ostr.addr, align 4
  %tobool31 = icmp ne i8** %30, null
  br i1 %tobool31, label %if.then32, label %if.else33

if.then32:                                        ; preds = %do.end30
  %31 = load i8*, i8** %result, align 4
  %32 = load i8**, i8*** %ostr.addr, align 4
  store i8* %31, i8** %32, align 4
  br label %if.end34

if.else33:                                        ; preds = %do.end30
  %33 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %33, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 86)
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %if.then32
  %34 = load i32, i32* %rval, align 4
  store i32 %34, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end34, %if.end
  %35 = load i32, i32* %retval, align 4
  ret i32 %35
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @zread(i32, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
