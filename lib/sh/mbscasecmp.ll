; ModuleID = 'mbscasecmp.c'
source_filename = "mbscasecmp.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @mbscasecmp(i8* %mbs1, i8* %mbs2) #0 {
entry:
  %retval = alloca i32, align 4
  %mbs1.addr = alloca i8*, align 4
  %mbs2.addr = alloca i8*, align 4
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %l1 = alloca i32, align 4
  %l2 = alloca i32, align 4
  store i8* %mbs1, i8** %mbs1.addr, align 4
  store i8* %mbs2, i8** %mbs2.addr, align 4
  store i32 0, i32* %len2, align 4
  store i32 0, i32* %len1, align 4
  %call = call i32 @mblen(i8* null, i32 0)
  %call1 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call1, i32* %mb_cur_max, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i8*, i8** %mbs1.addr, align 4
  %1 = load i32, i32* %mb_cur_max, align 4
  %call2 = call i32 @mbtowc(i32* %c1, i8* %0, i32 %1)
  store i32 %call2, i32* %len1, align 4
  %2 = load i8*, i8** %mbs2.addr, align 4
  %3 = load i32, i32* %mb_cur_max, align 4
  %call3 = call i32 @mbtowc(i32* %c2, i8* %2, i32 %3)
  store i32 %call3, i32* %len2, align 4
  %4 = load i32, i32* %len1, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  %5 = load i32, i32* %len2, align 4
  %cmp4 = icmp eq i32 %5, 0
  %cond = select i1 %cmp4, i32 0, i32 -1
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %do.body
  %6 = load i32, i32* %len2, align 4
  %cmp5 = icmp eq i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4
  br label %return

if.else7:                                         ; preds = %if.else
  %7 = load i32, i32* %len1, align 4
  %cmp8 = icmp sgt i32 %7, 0
  br i1 %cmp8, label %land.lhs.true, label %if.else11

land.lhs.true:                                    ; preds = %if.else7
  %8 = load i32, i32* %len2, align 4
  %cmp9 = icmp slt i32 %8, 0
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %land.lhs.true
  store i32 -1, i32* %retval, align 4
  br label %return

if.else11:                                        ; preds = %land.lhs.true, %if.else7
  %9 = load i32, i32* %len1, align 4
  %cmp12 = icmp slt i32 %9, 0
  br i1 %cmp12, label %land.lhs.true13, label %if.else16

land.lhs.true13:                                  ; preds = %if.else11
  %10 = load i32, i32* %len2, align 4
  %cmp14 = icmp sgt i32 %10, 0
  br i1 %cmp14, label %if.then15, label %if.else16

if.then15:                                        ; preds = %land.lhs.true13
  store i32 1, i32* %retval, align 4
  br label %return

if.else16:                                        ; preds = %land.lhs.true13, %if.else11
  %11 = load i32, i32* %len1, align 4
  %cmp17 = icmp slt i32 %11, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end

land.lhs.true18:                                  ; preds = %if.else16
  %12 = load i32, i32* %len2, align 4
  %cmp19 = icmp slt i32 %12, 0
  br i1 %cmp19, label %if.then20, label %if.end

if.then20:                                        ; preds = %land.lhs.true18
  %13 = load i8*, i8** %mbs1.addr, align 4
  %call21 = call i32 @strlen(i8* %13)
  store i32 %call21, i32* %len1, align 4
  %14 = load i8*, i8** %mbs2.addr, align 4
  %call22 = call i32 @strlen(i8* %14)
  store i32 %call22, i32* %len2, align 4
  %15 = load i32, i32* %len1, align 4
  %16 = load i32, i32* %len2, align 4
  %cmp23 = icmp eq i32 %15, %16
  br i1 %cmp23, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then20
  %17 = load i8*, i8** %mbs1.addr, align 4
  %18 = load i8*, i8** %mbs2.addr, align 4
  %19 = load i32, i32* %len1, align 4
  %call24 = call i32 @memcmp(i8* %17, i8* %18, i32 %19)
  br label %cond.end35

cond.false:                                       ; preds = %if.then20
  %20 = load i32, i32* %len1, align 4
  %21 = load i32, i32* %len2, align 4
  %cmp25 = icmp slt i32 %20, %21
  br i1 %cmp25, label %cond.true26, label %cond.false30

cond.true26:                                      ; preds = %cond.false
  %22 = load i8*, i8** %mbs1.addr, align 4
  %23 = load i8*, i8** %mbs2.addr, align 4
  %24 = load i32, i32* %len1, align 4
  %call27 = call i32 @memcmp(i8* %22, i8* %23, i32 %24)
  %cmp28 = icmp sgt i32 %call27, 0
  %cond29 = select i1 %cmp28, i32 1, i32 -1
  br label %cond.end

cond.false30:                                     ; preds = %cond.false
  %25 = load i8*, i8** %mbs1.addr, align 4
  %26 = load i8*, i8** %mbs2.addr, align 4
  %27 = load i32, i32* %len2, align 4
  %call31 = call i32 @memcmp(i8* %25, i8* %26, i32 %27)
  %cmp32 = icmp sge i32 %call31, 0
  %cond33 = select i1 %cmp32, i32 1, i32 -1
  br label %cond.end

cond.end:                                         ; preds = %cond.false30, %cond.true26
  %cond34 = phi i32 [ %cond29, %cond.true26 ], [ %cond33, %cond.false30 ]
  br label %cond.end35

cond.end35:                                       ; preds = %cond.end, %cond.true
  %cond36 = phi i32 [ %call24, %cond.true ], [ %cond34, %cond.end ]
  store i32 %cond36, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true18, %if.else16
  br label %if.end37

if.end37:                                         ; preds = %if.end
  br label %if.end38

if.end38:                                         ; preds = %if.end37
  br label %if.end39

if.end39:                                         ; preds = %if.end38
  br label %if.end40

if.end40:                                         ; preds = %if.end39
  %28 = load i32, i32* %c1, align 4
  %call41 = call i32 @towlower(i32 %28)
  store i32 %call41, i32* %l1, align 4
  %29 = load i32, i32* %c2, align 4
  %call42 = call i32 @towlower(i32 %29)
  store i32 %call42, i32* %l2, align 4
  %30 = load i32, i32* %len1, align 4
  %31 = load i8*, i8** %mbs1.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %31, i32 %30
  store i8* %add.ptr, i8** %mbs1.addr, align 4
  %32 = load i32, i32* %len2, align 4
  %33 = load i8*, i8** %mbs2.addr, align 4
  %add.ptr43 = getelementptr inbounds i8, i8* %33, i32 %32
  store i8* %add.ptr43, i8** %mbs2.addr, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end40
  %34 = load i32, i32* %l1, align 4
  %35 = load i32, i32* %l2, align 4
  %cmp44 = icmp eq i32 %34, %35
  br i1 %cmp44, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %36 = load i32, i32* %l1, align 4
  %37 = load i32, i32* %l2, align 4
  %sub = sub nsw i32 %36, %37
  store i32 %sub, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end, %cond.end35, %if.then15, %if.then10, %if.then6, %if.then
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

declare i32 @mblen(i8*, i32) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @mbtowc(i32*, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i32 @memcmp(i8*, i8*, i32) #1

declare i32 @towlower(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
