; ModuleID = 'zgetline.c'
source_filename = "zgetline.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [11 x i8] c"zgetline.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @zgetline(i32 %fd, i8** %lineptr, i32* %n, i32 %delim, i32 %unbuffered_read) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %lineptr.addr = alloca i8**, align 4
  %n.addr = alloca i32*, align 4
  %delim.addr = alloca i32, align 4
  %unbuffered_read.addr = alloca i32, align 4
  %nr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %line = alloca i8*, align 4
  %c = alloca i8, align 1
  %new_size = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i8** %lineptr, i8*** %lineptr.addr, align 4
  store i32* %n, i32** %n.addr, align 4
  store i32 %delim, i32* %delim.addr, align 4
  store i32 %unbuffered_read, i32* %unbuffered_read.addr, align 4
  %0 = load i8**, i8*** %lineptr.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32*, i32** %n.addr, align 4
  %cmp2 = icmp eq i32* %1, null
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %2 = load i8**, i8*** %lineptr.addr, align 4
  %3 = load i8*, i8** %2, align 4
  %cmp4 = icmp eq i8* %3, null
  br i1 %cmp4, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false3
  %4 = load i32*, i32** %n.addr, align 4
  %5 = load i32, i32* %4, align 4
  %cmp5 = icmp ne i32 %5, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true, %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false3
  store i32 0, i32* %nr, align 4
  %6 = load i8**, i8*** %lineptr.addr, align 4
  %7 = load i8*, i8** %6, align 4
  store i8* %7, i8** %line, align 4
  br label %while.body

while.body:                                       ; preds = %if.end, %if.end42
  %8 = load i32, i32* %unbuffered_read.addr, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %9 = load i32, i32* %fd.addr, align 4
  %call = call i32 @zread(i32 %9, i8* %c, i32 1)
  br label %cond.end

cond.false:                                       ; preds = %while.body
  %10 = load i32, i32* %fd.addr, align 4
  %call6 = call i32 @zreadc(i32 %10, i8* %c)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %call6, %cond.false ]
  store i32 %cond, i32* %retval1, align 4
  %11 = load i32, i32* %retval1, align 4
  %cmp7 = icmp sle i32 %11, 0
  br i1 %cmp7, label %if.then8, label %if.end14

if.then8:                                         ; preds = %cond.end
  %12 = load i8*, i8** %line, align 4
  %tobool9 = icmp ne i8* %12, null
  br i1 %tobool9, label %land.lhs.true10, label %if.end13

land.lhs.true10:                                  ; preds = %if.then8
  %13 = load i32, i32* %nr, align 4
  %cmp11 = icmp sgt i32 %13, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true10
  %14 = load i8*, i8** %line, align 4
  %15 = load i32, i32* %nr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %14, i32 %15
  store i8 0, i8* %arrayidx, align 1
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %land.lhs.true10, %if.then8
  br label %while.end

if.end14:                                         ; preds = %cond.end
  %16 = load i32, i32* %nr, align 4
  %add = add nsw i32 %16, 2
  %17 = load i32*, i32** %n.addr, align 4
  %18 = load i32, i32* %17, align 4
  %cmp15 = icmp uge i32 %add, %18
  br i1 %cmp15, label %if.then16, label %if.end36

if.then16:                                        ; preds = %if.end14
  %19 = load i32*, i32** %n.addr, align 4
  %20 = load i32, i32* %19, align 4
  %cmp17 = icmp eq i32 %20, 0
  br i1 %cmp17, label %cond.true18, label %cond.false19

cond.true18:                                      ; preds = %if.then16
  br label %cond.end20

cond.false19:                                     ; preds = %if.then16
  %21 = load i32*, i32** %n.addr, align 4
  %22 = load i32, i32* %21, align 4
  %mul = mul i32 %22, 2
  br label %cond.end20

cond.end20:                                       ; preds = %cond.false19, %cond.true18
  %cond21 = phi i32 [ 16, %cond.true18 ], [ %mul, %cond.false19 ]
  store i32 %cond21, i32* %new_size, align 4
  %23 = load i32*, i32** %n.addr, align 4
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %new_size, align 4
  %cmp22 = icmp uge i32 %24, %25
  br i1 %cmp22, label %cond.true23, label %cond.false24

cond.true23:                                      ; preds = %cond.end20
  br label %cond.end26

cond.false24:                                     ; preds = %cond.end20
  %26 = load i8**, i8*** %lineptr.addr, align 4
  %27 = load i8*, i8** %26, align 4
  %28 = load i32, i32* %new_size, align 4
  %call25 = call i8* @sh_xrealloc(i8* %27, i32 %28, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 96)
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false24, %cond.true23
  %cond27 = phi i8* [ null, %cond.true23 ], [ %call25, %cond.false24 ]
  store i8* %cond27, i8** %line, align 4
  %29 = load i8*, i8** %line, align 4
  %tobool28 = icmp ne i8* %29, null
  br i1 %tobool28, label %if.then29, label %if.else

if.then29:                                        ; preds = %cond.end26
  %30 = load i8*, i8** %line, align 4
  %31 = load i8**, i8*** %lineptr.addr, align 4
  store i8* %30, i8** %31, align 4
  %32 = load i32, i32* %new_size, align 4
  %33 = load i32*, i32** %n.addr, align 4
  store i32 %32, i32* %33, align 4
  br label %if.end35

if.else:                                          ; preds = %cond.end26
  %34 = load i32*, i32** %n.addr, align 4
  %35 = load i32, i32* %34, align 4
  %cmp30 = icmp ugt i32 %35, 0
  br i1 %cmp30, label %if.then31, label %if.end34

if.then31:                                        ; preds = %if.else
  %36 = load i8**, i8*** %lineptr.addr, align 4
  %37 = load i8*, i8** %36, align 4
  %38 = load i32*, i32** %n.addr, align 4
  %39 = load i32, i32* %38, align 4
  %sub = sub i32 %39, 1
  %arrayidx32 = getelementptr inbounds i8, i8* %37, i32 %sub
  store i8 0, i8* %arrayidx32, align 1
  %40 = load i32*, i32** %n.addr, align 4
  %41 = load i32, i32* %40, align 4
  %sub33 = sub i32 %41, 2
  store i32 %sub33, i32* %nr, align 4
  br label %if.end34

if.end34:                                         ; preds = %if.then31, %if.else
  br label %while.end

if.end35:                                         ; preds = %if.then29
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end14
  %42 = load i8, i8* %c, align 1
  %43 = load i8*, i8** %line, align 4
  %44 = load i32, i32* %nr, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %43, i32 %44
  store i8 %42, i8* %arrayidx37, align 1
  %45 = load i32, i32* %nr, align 4
  %inc = add nsw i32 %45, 1
  store i32 %inc, i32* %nr, align 4
  %46 = load i8, i8* %c, align 1
  %conv = sext i8 %46 to i32
  %47 = load i32, i32* %delim.addr, align 4
  %cmp38 = icmp eq i32 %conv, %47
  br i1 %cmp38, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.end36
  %48 = load i8*, i8** %line, align 4
  %49 = load i32, i32* %nr, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 0, i8* %arrayidx41, align 1
  br label %while.end

if.end42:                                         ; preds = %if.end36
  br label %while.body

while.end:                                        ; preds = %if.then40, %if.end34, %if.end13
  %50 = load i32, i32* %nr, align 4
  %sub43 = sub nsw i32 %50, 1
  store i32 %sub43, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %51 = load i32, i32* %retval, align 4
  ret i32 %51
}

declare i32 @zread(i32, i8*, i32) #1

declare i32 @zreadc(i32, i8*) #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
