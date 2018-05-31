; ModuleID = 'uconvert.c'
source_filename = "uconvert.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@multiplier = internal global [7 x i32] [i32 1, i32 100000, i32 10000, i32 1000, i32 100, i32 10, i32 1], align 4

; Function Attrs: noinline nounwind
define i32 @uconvert(i8* %s, i32* %ip, i32* %up) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %ip.addr = alloca i32*, align 4
  %up.addr = alloca i32*, align 4
  %n = alloca i32, align 4
  %mult = alloca i32, align 4
  %ipart = alloca i32, align 4
  %upart = alloca i32, align 4
  %p = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32* %ip, i32** %ip.addr, align 4
  store i32* %up, i32** %up.addr, align 4
  store i32 0, i32* %upart, align 4
  store i32 0, i32* %ipart, align 4
  store i32 1, i32* %mult, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 43
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  %5 = load i8*, i8** %s.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 45
  %cond = select i1 %cmp6, i32 -1, i32 1
  store i32 %cond, i32* %mult, align 4
  %7 = load i8*, i8** %s.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %add.ptr, i8** %p, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false, %entry
  %8 = load i8*, i8** %s.addr, align 4
  store i8* %8, i8** %p, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i8*, i8** %p, align 4
  %tobool8 = icmp ne i8* %9, null
  br i1 %tobool8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %10 = load i8*, i8** %p, align 4
  %11 = load i8, i8* %10, align 1
  %conv9 = sext i8 %11 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %12 = phi i1 [ false, %for.cond ], [ %tobool10, %land.rhs ]
  br i1 %12, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %13 = load i8*, i8** %p, align 4
  %14 = load i8, i8* %13, align 1
  %conv11 = sext i8 %14 to i32
  %cmp12 = icmp eq i32 %conv11, 46
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %for.body
  br label %for.end

if.end15:                                         ; preds = %for.body
  %15 = load i8*, i8** %p, align 4
  %16 = load i8, i8* %15, align 1
  %conv16 = sext i8 %16 to i32
  %cmp17 = icmp sge i32 %conv16, 48
  br i1 %cmp17, label %land.rhs19, label %land.end23

land.rhs19:                                       ; preds = %if.end15
  %17 = load i8*, i8** %p, align 4
  %18 = load i8, i8* %17, align 1
  %conv20 = sext i8 %18 to i32
  %cmp21 = icmp sle i32 %conv20, 57
  br label %land.end23

land.end23:                                       ; preds = %land.rhs19, %if.end15
  %19 = phi i1 [ false, %if.end15 ], [ %cmp21, %land.rhs19 ]
  %land.ext = zext i1 %19 to i32
  %cmp24 = icmp eq i32 %land.ext, 0
  br i1 %cmp24, label %if.then26, label %if.end33

if.then26:                                        ; preds = %land.end23
  br label %do.body

do.body:                                          ; preds = %if.then26
  %20 = load i32*, i32** %ip.addr, align 4
  %tobool27 = icmp ne i32* %20, null
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %do.body
  %21 = load i32, i32* %ipart, align 4
  %22 = load i32, i32* %mult, align 4
  %mul = mul nsw i32 %21, %22
  %23 = load i32*, i32** %ip.addr, align 4
  store i32 %mul, i32* %23, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %do.body
  %24 = load i32*, i32** %up.addr, align 4
  %tobool30 = icmp ne i32* %24, null
  br i1 %tobool30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end29
  %25 = load i32, i32* %upart, align 4
  %26 = load i32*, i32** %up.addr, align 4
  store i32 %25, i32* %26, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %if.end29
  store i32 0, i32* %retval, align 4
  br label %do.end124

do.end:                                           ; No predecessors!
  br label %if.end33

if.end33:                                         ; preds = %do.end, %land.end23
  %27 = load i32, i32* %ipart, align 4
  %mul34 = mul nsw i32 %27, 10
  %28 = load i8*, i8** %p, align 4
  %29 = load i8, i8* %28, align 1
  %conv35 = sext i8 %29 to i32
  %sub = sub nsw i32 %conv35, 48
  %add = add nsw i32 %mul34, %sub
  store i32 %add, i32* %ipart, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end33
  %30 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then14, %land.end
  %31 = load i8*, i8** %p, align 4
  %cmp36 = icmp eq i8* %31, null
  br i1 %cmp36, label %if.then42, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %for.end
  %32 = load i8*, i8** %p, align 4
  %33 = load i8, i8* %32, align 1
  %conv39 = sext i8 %33 to i32
  %cmp40 = icmp eq i32 %conv39, 0
  br i1 %cmp40, label %if.then42, label %if.end52

if.then42:                                        ; preds = %lor.lhs.false38, %for.end
  br label %do.body43

do.body43:                                        ; preds = %if.then42
  %34 = load i32*, i32** %ip.addr, align 4
  %tobool44 = icmp ne i32* %34, null
  br i1 %tobool44, label %if.then45, label %if.end47

if.then45:                                        ; preds = %do.body43
  %35 = load i32, i32* %ipart, align 4
  %36 = load i32, i32* %mult, align 4
  %mul46 = mul nsw i32 %35, %36
  %37 = load i32*, i32** %ip.addr, align 4
  store i32 %mul46, i32* %37, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %do.body43
  %38 = load i32*, i32** %up.addr, align 4
  %tobool48 = icmp ne i32* %38, null
  br i1 %tobool48, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end47
  %39 = load i32, i32* %upart, align 4
  %40 = load i32*, i32** %up.addr, align 4
  store i32 %39, i32* %40, align 4
  br label %if.end50

if.end50:                                         ; preds = %if.then49, %if.end47
  store i32 1, i32* %retval, align 4
  br label %do.end124

do.end51:                                         ; No predecessors!
  br label %if.end52

if.end52:                                         ; preds = %do.end51, %lor.lhs.false38
  %41 = load i8*, i8** %p, align 4
  %42 = load i8, i8* %41, align 1
  %conv53 = sext i8 %42 to i32
  %cmp54 = icmp eq i32 %conv53, 46
  br i1 %cmp54, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.end52
  %43 = load i8*, i8** %p, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr57, i8** %p, align 4
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %if.end52
  store i32 0, i32* %n, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc97, %if.end58
  %44 = load i32, i32* %n, align 4
  %cmp60 = icmp slt i32 %44, 6
  br i1 %cmp60, label %land.rhs62, label %land.end65

land.rhs62:                                       ; preds = %for.cond59
  %45 = load i8*, i8** %p, align 4
  %46 = load i32, i32* %n, align 4
  %arrayidx = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx, align 1
  %conv63 = sext i8 %47 to i32
  %tobool64 = icmp ne i32 %conv63, 0
  br label %land.end65

land.end65:                                       ; preds = %land.rhs62, %for.cond59
  %48 = phi i1 [ false, %for.cond59 ], [ %tobool64, %land.rhs62 ]
  br i1 %48, label %for.body67, label %for.end98

for.body67:                                       ; preds = %land.end65
  %49 = load i8*, i8** %p, align 4
  %50 = load i32, i32* %n, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %49, i32 %50
  %51 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %51 to i32
  %cmp70 = icmp sge i32 %conv69, 48
  br i1 %cmp70, label %land.rhs72, label %land.end77

land.rhs72:                                       ; preds = %for.body67
  %52 = load i8*, i8** %p, align 4
  %53 = load i32, i32* %n, align 4
  %arrayidx73 = getelementptr inbounds i8, i8* %52, i32 %53
  %54 = load i8, i8* %arrayidx73, align 1
  %conv74 = sext i8 %54 to i32
  %cmp75 = icmp sle i32 %conv74, 57
  br label %land.end77

land.end77:                                       ; preds = %land.rhs72, %for.body67
  %55 = phi i1 [ false, %for.body67 ], [ %cmp75, %land.rhs72 ]
  %land.ext78 = zext i1 %55 to i32
  %cmp79 = icmp eq i32 %land.ext78, 0
  br i1 %cmp79, label %if.then81, label %if.end91

if.then81:                                        ; preds = %land.end77
  br label %do.body82

do.body82:                                        ; preds = %if.then81
  %56 = load i32*, i32** %ip.addr, align 4
  %tobool83 = icmp ne i32* %56, null
  br i1 %tobool83, label %if.then84, label %if.end86

if.then84:                                        ; preds = %do.body82
  %57 = load i32, i32* %ipart, align 4
  %58 = load i32, i32* %mult, align 4
  %mul85 = mul nsw i32 %57, %58
  %59 = load i32*, i32** %ip.addr, align 4
  store i32 %mul85, i32* %59, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.then84, %do.body82
  %60 = load i32*, i32** %up.addr, align 4
  %tobool87 = icmp ne i32* %60, null
  br i1 %tobool87, label %if.then88, label %if.end89

if.then88:                                        ; preds = %if.end86
  %61 = load i32, i32* %upart, align 4
  %62 = load i32*, i32** %up.addr, align 4
  store i32 %61, i32* %62, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.then88, %if.end86
  store i32 0, i32* %retval, align 4
  br label %do.end124

do.end90:                                         ; No predecessors!
  br label %if.end91

if.end91:                                         ; preds = %do.end90, %land.end77
  %63 = load i32, i32* %upart, align 4
  %mul92 = mul nsw i32 %63, 10
  %64 = load i8*, i8** %p, align 4
  %65 = load i32, i32* %n, align 4
  %arrayidx93 = getelementptr inbounds i8, i8* %64, i32 %65
  %66 = load i8, i8* %arrayidx93, align 1
  %conv94 = sext i8 %66 to i32
  %sub95 = sub nsw i32 %conv94, 48
  %add96 = add nsw i32 %mul92, %sub95
  store i32 %add96, i32* %upart, align 4
  br label %for.inc97

for.inc97:                                        ; preds = %if.end91
  %67 = load i32, i32* %n, align 4
  %inc = add nsw i32 %67, 1
  store i32 %inc, i32* %n, align 4
  br label %for.cond59

for.end98:                                        ; preds = %land.end65
  %68 = load i32, i32* %n, align 4
  %arrayidx99 = getelementptr inbounds [7 x i32], [7 x i32]* @multiplier, i32 0, i32 %68
  %69 = load i32, i32* %arrayidx99, align 4
  %70 = load i32, i32* %upart, align 4
  %mul100 = mul nsw i32 %70, %69
  store i32 %mul100, i32* %upart, align 4
  %71 = load i32, i32* %n, align 4
  %cmp101 = icmp eq i32 %71, 6
  br i1 %cmp101, label %land.lhs.true103, label %if.end115

land.lhs.true103:                                 ; preds = %for.end98
  %72 = load i8*, i8** %p, align 4
  %arrayidx104 = getelementptr inbounds i8, i8* %72, i32 6
  %73 = load i8, i8* %arrayidx104, align 1
  %conv105 = sext i8 %73 to i32
  %cmp106 = icmp sge i32 %conv105, 53
  br i1 %cmp106, label %land.lhs.true108, label %if.end115

land.lhs.true108:                                 ; preds = %land.lhs.true103
  %74 = load i8*, i8** %p, align 4
  %arrayidx109 = getelementptr inbounds i8, i8* %74, i32 6
  %75 = load i8, i8* %arrayidx109, align 1
  %conv110 = sext i8 %75 to i32
  %cmp111 = icmp sle i32 %conv110, 57
  br i1 %cmp111, label %if.then113, label %if.end115

if.then113:                                       ; preds = %land.lhs.true108
  %76 = load i32, i32* %upart, align 4
  %inc114 = add nsw i32 %76, 1
  store i32 %inc114, i32* %upart, align 4
  br label %if.end115

if.end115:                                        ; preds = %if.then113, %land.lhs.true108, %land.lhs.true103, %for.end98
  br label %do.body116

do.body116:                                       ; preds = %if.end115
  %77 = load i32*, i32** %ip.addr, align 4
  %tobool117 = icmp ne i32* %77, null
  br i1 %tobool117, label %if.then118, label %if.end120

if.then118:                                       ; preds = %do.body116
  %78 = load i32, i32* %ipart, align 4
  %79 = load i32, i32* %mult, align 4
  %mul119 = mul nsw i32 %78, %79
  %80 = load i32*, i32** %ip.addr, align 4
  store i32 %mul119, i32* %80, align 4
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %do.body116
  %81 = load i32*, i32** %up.addr, align 4
  %tobool121 = icmp ne i32* %81, null
  br i1 %tobool121, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.end120
  %82 = load i32, i32* %upart, align 4
  %83 = load i32*, i32** %up.addr, align 4
  store i32 %82, i32* %83, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.then122, %if.end120
  store i32 1, i32* %retval, align 4
  br label %do.end124

do.end124:                                        ; preds = %if.end32, %if.end50, %if.end89, %if.end123
  %84 = load i32, i32* %retval, align 4
  ret i32 %84
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
