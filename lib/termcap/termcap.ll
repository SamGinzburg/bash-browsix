; ModuleID = 'termcap.c'
source_filename = "termcap.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.buffer = type { i8*, i32, i8*, i32, i32 }

@term_entry = internal global i8* null, align 4
@PC = global i8 0, align 1
@ospeed = common global i16 0, align 2
@tputs_baud_rate = common global i32 0, align 4
@speeds = internal global [19 x i32] [i32 0, i32 50, i32 75, i32 110, i32 135, i32 150, i32 -2, i32 -3, i32 -6, i32 -12, i32 -18, i32 -24, i32 -48, i32 -96, i32 -192, i32 -288, i32 -384, i32 -576, i32 -1152], align 4
@.str = private unnamed_addr constant [8 x i8] c"TERMCAP\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"tc\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"/etc/termcap\00", align 1
@esctab = internal global [33 x i8] c" \07\08  \1B\0C       \0A   \0D \09 \0B         \00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"virtual memory exhausted\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @tgetnum(i8* %cap) #0 {
entry:
  %retval = alloca i32, align 4
  %cap.addr = alloca i8*, align 4
  %ptr = alloca i8*, align 4
  store i8* %cap, i8** %cap.addr, align 4
  %0 = load i8*, i8** @term_entry, align 4
  %1 = load i8*, i8** %cap.addr, align 4
  %call = call i8* @find_capability(i8* %0, i8* %1)
  store i8* %call, i8** %ptr, align 4
  %2 = load i8*, i8** %ptr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %ptr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 -1
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, 35
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i8*, i8** %ptr, align 4
  %call2 = call i32 @atoi(i8* %5)
  store i32 %call2, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define internal i8* @find_capability(i8* %bp, i8* %cap) #0 {
entry:
  %retval = alloca i8*, align 4
  %bp.addr = alloca i8*, align 4
  %cap.addr = alloca i8*, align 4
  store i8* %bp, i8** %bp.addr, align 4
  store i8* %cap, i8** %cap.addr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8*, i8** %bp.addr, align 4
  %1 = load i8, i8* %0, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %bp.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 58
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %for.body
  %4 = load i8*, i8** %bp.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %5 to i32
  %6 = load i8*, i8** %cap.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %7 to i32
  %cmp6 = icmp eq i32 %conv3, %conv5
  br i1 %cmp6, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %land.lhs.true
  %8 = load i8*, i8** %bp.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %8, i32 2
  %9 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %9 to i32
  %10 = load i8*, i8** %cap.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %10, i32 1
  %11 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %11 to i32
  %cmp13 = icmp eq i32 %conv10, %conv12
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true8
  %12 = load i8*, i8** %bp.addr, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %12, i32 4
  store i8* %arrayidx15, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true8, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i8*, i8** %bp.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr, i8** %bp.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* null, i8** %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %14 = load i8*, i8** %retval, align 4
  ret i8* %14
}

declare i32 @atoi(i8*) #1

; Function Attrs: noinline nounwind
define i32 @tgetflag(i8* %cap) #0 {
entry:
  %cap.addr = alloca i8*, align 4
  %ptr = alloca i8*, align 4
  store i8* %cap, i8** %cap.addr, align 4
  %0 = load i8*, i8** @term_entry, align 4
  %1 = load i8*, i8** %cap.addr, align 4
  %call = call i8* @find_capability(i8* %0, i8* %1)
  store i8* %call, i8** %ptr, align 4
  %2 = load i8*, i8** %ptr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %3 = load i8*, i8** %ptr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 -1
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %5 = phi i1 [ false, %entry ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define i8* @tgetstr(i8* %cap, i8** %area) #0 {
entry:
  %retval = alloca i8*, align 4
  %cap.addr = alloca i8*, align 4
  %area.addr = alloca i8**, align 4
  %ptr = alloca i8*, align 4
  store i8* %cap, i8** %cap.addr, align 4
  store i8** %area, i8*** %area.addr, align 4
  %0 = load i8*, i8** @term_entry, align 4
  %1 = load i8*, i8** %cap.addr, align 4
  %call = call i8* @find_capability(i8* %0, i8* %1)
  store i8* %call, i8** %ptr, align 4
  %2 = load i8*, i8** %ptr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8*, i8** %ptr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 -1
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, 61
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %5 = load i8*, i8** %ptr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i32 -1
  %6 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %6 to i32
  %cmp4 = icmp ne i32 %conv3, 126
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  %7 = load i8*, i8** %ptr, align 4
  %8 = load i8**, i8*** %area.addr, align 4
  %call6 = call i8* @tgetst1(i8* %7, i8** %8)
  store i8* %call6, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %9 = load i8*, i8** %retval, align 4
  ret i8* %9
}

; Function Attrs: noinline nounwind
define i32 @tputs(i8* %str, i32 %nlines, i32 (...)* %outfun) #0 {
entry:
  %retval = alloca i32, align 4
  %str.addr = alloca i8*, align 4
  %nlines.addr = alloca i32, align 4
  %outfun.addr = alloca i32 (...)*, align 4
  %padcount = alloca i32, align 4
  %speed = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  store i32 %nlines, i32* %nlines.addr, align 4
  store i32 (...)* %outfun, i32 (...)** %outfun.addr, align 4
  store i32 0, i32* %padcount, align 4
  %0 = load i16, i16* @ospeed, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @tputs_baud_rate, align 4
  store i32 %1, i32* %speed, align 4
  br label %if.end10

if.else:                                          ; preds = %entry
  %2 = load i16, i16* @ospeed, align 2
  %conv2 = sext i16 %2 to i32
  %cmp3 = icmp sgt i32 %conv2, 0
  br i1 %cmp3, label %land.lhs.true, label %if.else9

land.lhs.true:                                    ; preds = %if.else
  %3 = load i16, i16* @ospeed, align 2
  %conv5 = sext i16 %3 to i32
  %cmp6 = icmp ult i32 %conv5, 19
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %land.lhs.true
  %4 = load i16, i16* @ospeed, align 2
  %idxprom = sext i16 %4 to i32
  %arrayidx = getelementptr inbounds [19 x i32], [19 x i32]* @speeds, i32 0, i32 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  store i32 %5, i32* %speed, align 4
  br label %if.end

if.else9:                                         ; preds = %land.lhs.true, %if.else
  store i32 0, i32* %speed, align 4
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  br label %if.end10

if.end10:                                         ; preds = %if.end, %if.then
  %6 = load i8*, i8** %str.addr, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end10
  store i32 -1, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end10
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end12
  %7 = load i8*, i8** %str.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv13 = sext i8 %8 to i32
  %cmp14 = icmp sge i32 %conv13, 48
  br i1 %cmp14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %9 = load i8*, i8** %str.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv16 = sext i8 %10 to i32
  %cmp17 = icmp sle i32 %conv16, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %11 = phi i1 [ false, %while.cond ], [ %cmp17, %land.rhs ]
  br i1 %11, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %12 = load i8*, i8** %str.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %str.addr, align 4
  %13 = load i8, i8* %12, align 1
  %conv19 = sext i8 %13 to i32
  %sub = sub nsw i32 %conv19, 48
  %14 = load i32, i32* %padcount, align 4
  %add = add nsw i32 %14, %sub
  store i32 %add, i32* %padcount, align 4
  %15 = load i32, i32* %padcount, align 4
  %mul = mul nsw i32 %15, 10
  store i32 %mul, i32* %padcount, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %16 = load i8*, i8** %str.addr, align 4
  %17 = load i8, i8* %16, align 1
  %conv20 = sext i8 %17 to i32
  %cmp21 = icmp eq i32 %conv20, 46
  br i1 %cmp21, label %if.then23, label %if.end29

if.then23:                                        ; preds = %while.end
  %18 = load i8*, i8** %str.addr, align 4
  %incdec.ptr24 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr24, i8** %str.addr, align 4
  %19 = load i8*, i8** %str.addr, align 4
  %incdec.ptr25 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr25, i8** %str.addr, align 4
  %20 = load i8, i8* %19, align 1
  %conv26 = sext i8 %20 to i32
  %sub27 = sub nsw i32 %conv26, 48
  %21 = load i32, i32* %padcount, align 4
  %add28 = add nsw i32 %21, %sub27
  store i32 %add28, i32* %padcount, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then23, %while.end
  %22 = load i8*, i8** %str.addr, align 4
  %23 = load i8, i8* %22, align 1
  %conv30 = sext i8 %23 to i32
  %cmp31 = icmp eq i32 %conv30, 42
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %if.end29
  %24 = load i8*, i8** %str.addr, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr34, i8** %str.addr, align 4
  %25 = load i32, i32* %nlines.addr, align 4
  %26 = load i32, i32* %padcount, align 4
  %mul35 = mul nsw i32 %26, %25
  store i32 %mul35, i32* %padcount, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then33, %if.end29
  br label %while.cond37

while.cond37:                                     ; preds = %while.body39, %if.end36
  %27 = load i8*, i8** %str.addr, align 4
  %28 = load i8, i8* %27, align 1
  %tobool38 = icmp ne i8 %28, 0
  br i1 %tobool38, label %while.body39, label %while.end42

while.body39:                                     ; preds = %while.cond37
  %29 = load i32 (...)*, i32 (...)** %outfun.addr, align 4
  %30 = load i8*, i8** %str.addr, align 4
  %incdec.ptr40 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr40, i8** %str.addr, align 4
  %31 = load i8, i8* %30, align 1
  %conv41 = sext i8 %31 to i32
  %callee.knr.cast = bitcast i32 (...)* %29 to i32 (i32)*
  %call = call i32 %callee.knr.cast(i32 %conv41)
  br label %while.cond37

while.end42:                                      ; preds = %while.cond37
  %32 = load i32, i32* %speed, align 4
  %33 = load i32, i32* %padcount, align 4
  %mul43 = mul nsw i32 %33, %32
  store i32 %mul43, i32* %padcount, align 4
  %34 = load i32, i32* %padcount, align 4
  %add44 = add nsw i32 %34, 500
  store i32 %add44, i32* %padcount, align 4
  %35 = load i32, i32* %padcount, align 4
  %div = sdiv i32 %35, 1000
  store i32 %div, i32* %padcount, align 4
  %36 = load i32, i32* %speed, align 4
  %cmp45 = icmp slt i32 %36, 0
  br i1 %cmp45, label %if.then47, label %if.else49

if.then47:                                        ; preds = %while.end42
  %37 = load i32, i32* %padcount, align 4
  %sub48 = sub nsw i32 0, %37
  store i32 %sub48, i32* %padcount, align 4
  br label %if.end52

if.else49:                                        ; preds = %while.end42
  %38 = load i32, i32* %padcount, align 4
  %add50 = add nsw i32 %38, 50
  store i32 %add50, i32* %padcount, align 4
  %39 = load i32, i32* %padcount, align 4
  %div51 = sdiv i32 %39, 100
  store i32 %div51, i32* %padcount, align 4
  br label %if.end52

if.end52:                                         ; preds = %if.else49, %if.then47
  br label %while.cond53

while.cond53:                                     ; preds = %while.body56, %if.end52
  %40 = load i32, i32* %padcount, align 4
  %dec = add nsw i32 %40, -1
  store i32 %dec, i32* %padcount, align 4
  %cmp54 = icmp sgt i32 %40, 0
  br i1 %cmp54, label %while.body56, label %while.end60

while.body56:                                     ; preds = %while.cond53
  %41 = load i32 (...)*, i32 (...)** %outfun.addr, align 4
  %42 = load i8, i8* @PC, align 1
  %conv57 = sext i8 %42 to i32
  %callee.knr.cast58 = bitcast i32 (...)* %41 to i32 (i32)*
  %call59 = call i32 %callee.knr.cast58(i32 %conv57)
  br label %while.cond53

while.end60:                                      ; preds = %while.cond53
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end60, %if.then11
  %43 = load i32, i32* %retval, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind
define i32 @tgetent(i8* %bp, i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %bp.addr = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %termcap_name = alloca i8*, align 4
  %fd = alloca i32, align 4
  %buf = alloca %struct.buffer, align 4
  %bp1 = alloca i8*, align 4
  %bp2 = alloca i8*, align 4
  %term = alloca i8*, align 4
  %malloc_size = alloca i32, align 4
  %c = alloca i32, align 4
  %tcenv = alloca i8*, align 4
  %indirect = alloca i8*, align 4
  %filep = alloca i32, align 4
  store i8* %bp, i8** %bp.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 0, i32* %malloc_size, align 4
  store i8* null, i8** %indirect, align 4
  %0 = load i8*, i8** %bp.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %bp.addr, align 4
  store i8* %1, i8** @term_entry, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call = call i8* @getenv(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %termcap_name, align 4
  %2 = load i8*, i8** %termcap_name, align 4
  %tobool1 = icmp ne i8* %2, null
  br i1 %tobool1, label %land.lhs.true, label %if.end4

land.lhs.true:                                    ; preds = %if.end
  %3 = load i8*, i8** %termcap_name, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then3, label %if.end4

if.then3:                                         ; preds = %land.lhs.true
  store i8* null, i8** %termcap_name, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %land.lhs.true, %if.end
  %5 = load i8*, i8** %termcap_name, align 4
  %tobool5 = icmp ne i8* %5, null
  br i1 %tobool5, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end4
  %6 = load i8*, i8** %termcap_name, align 4
  %7 = load i8, i8* %6, align 1
  %conv6 = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end4
  %8 = phi i1 [ false, %if.end4 ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  store i32 %land.ext, i32* %filep, align 4
  %9 = load i8*, i8** %termcap_name, align 4
  %tobool9 = icmp ne i8* %9, null
  br i1 %tobool9, label %land.lhs.true10, label %if.end27

land.lhs.true10:                                  ; preds = %land.end
  %10 = load i32, i32* %filep, align 4
  %tobool11 = icmp ne i32 %10, 0
  br i1 %tobool11, label %if.end27, label %land.lhs.true12

land.lhs.true12:                                  ; preds = %land.lhs.true10
  %11 = load i8*, i8** %name.addr, align 4
  %call13 = call i8* @getenv(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0))
  %call14 = call i32 @strcmp(i8* %11, i8* %call13)
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.end27, label %if.then16

if.then16:                                        ; preds = %land.lhs.true12
  %12 = load i8*, i8** %termcap_name, align 4
  %call17 = call i8* @find_capability(i8* %12, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  %call18 = call i8* @tgetst1(i8* %call17, i8** null)
  store i8* %call18, i8** %indirect, align 4
  %13 = load i8*, i8** %indirect, align 4
  %tobool19 = icmp ne i8* %13, null
  br i1 %tobool19, label %if.else25, label %if.then20

if.then20:                                        ; preds = %if.then16
  %14 = load i8*, i8** %bp.addr, align 4
  %tobool21 = icmp ne i8* %14, null
  br i1 %tobool21, label %if.else, label %if.then22

if.then22:                                        ; preds = %if.then20
  %15 = load i8*, i8** %termcap_name, align 4
  store i8* %15, i8** %bp.addr, align 4
  br label %if.end24

if.else:                                          ; preds = %if.then20
  %16 = load i8*, i8** %bp.addr, align 4
  %17 = load i8*, i8** %termcap_name, align 4
  %call23 = call i8* @strcpy(i8* %16, i8* %17)
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then22
  br label %ret

if.else25:                                        ; preds = %if.then16
  %18 = load i8*, i8** %termcap_name, align 4
  store i8* %18, i8** %tcenv, align 4
  store i8* null, i8** %termcap_name, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.else25
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %land.lhs.true12, %land.lhs.true10, %land.end
  %19 = load i8*, i8** %termcap_name, align 4
  %tobool28 = icmp ne i8* %19, null
  br i1 %tobool28, label %lor.lhs.false, label %if.then30

lor.lhs.false:                                    ; preds = %if.end27
  %20 = load i32, i32* %filep, align 4
  %tobool29 = icmp ne i32 %20, 0
  br i1 %tobool29, label %if.end31, label %if.then30

if.then30:                                        ; preds = %lor.lhs.false, %if.end27
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i8** %termcap_name, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %lor.lhs.false
  %21 = load i8*, i8** %termcap_name, align 4
  %call32 = call i32 (i8*, i32, ...) @open(i8* %21, i32 0, i32 0)
  store i32 %call32, i32* %fd, align 4
  %22 = load i32, i32* %fd, align 4
  %cmp33 = icmp slt i32 %22, 0
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end31
  store i32 -1, i32* %retval, align 4
  br label %return

if.end36:                                         ; preds = %if.end31
  %size = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 1
  store i32 2048, i32* %size, align 4
  %size37 = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 1
  %23 = load i32, i32* %size37, align 4
  %add = add nsw i32 %23, 1
  %call38 = call i8* @xmalloc(i32 %add)
  %beg = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 0
  store i8* %call38, i8** %beg, align 4
  %24 = load i8*, i8** %indirect, align 4
  %tobool39 = icmp ne i8* %24, null
  br i1 %tobool39, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end36
  %25 = load i8*, i8** %indirect, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end36
  %26 = load i8*, i8** %name.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %25, %cond.true ], [ %26, %cond.false ]
  store i8* %cond, i8** %term, align 4
  %27 = load i8*, i8** %bp.addr, align 4
  %tobool40 = icmp ne i8* %27, null
  br i1 %tobool40, label %if.end51, label %if.then41

if.then41:                                        ; preds = %cond.end
  %28 = load i8*, i8** %indirect, align 4
  %tobool42 = icmp ne i8* %28, null
  br i1 %tobool42, label %cond.true43, label %cond.false46

cond.true43:                                      ; preds = %if.then41
  %29 = load i8*, i8** %tcenv, align 4
  %call44 = call i32 @strlen(i8* %29)
  %add45 = add i32 %call44, 1
  br label %cond.end48

cond.false46:                                     ; preds = %if.then41
  %size47 = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 1
  %30 = load i32, i32* %size47, align 4
  br label %cond.end48

cond.end48:                                       ; preds = %cond.false46, %cond.true43
  %cond49 = phi i32 [ %add45, %cond.true43 ], [ %30, %cond.false46 ]
  store i32 %cond49, i32* %malloc_size, align 4
  %31 = load i32, i32* %malloc_size, align 4
  %call50 = call i8* @xmalloc(i32 %31)
  store i8* %call50, i8** %bp.addr, align 4
  br label %if.end51

if.end51:                                         ; preds = %cond.end48, %cond.end
  %32 = load i8*, i8** %bp.addr, align 4
  store i8* %32, i8** %bp1, align 4
  %33 = load i8*, i8** %indirect, align 4
  %tobool52 = icmp ne i8* %33, null
  br i1 %tobool52, label %if.then53, label %if.end56

if.then53:                                        ; preds = %if.end51
  %34 = load i8*, i8** %bp.addr, align 4
  %35 = load i8*, i8** %tcenv, align 4
  %call54 = call i8* @strcpy(i8* %34, i8* %35)
  %36 = load i8*, i8** %tcenv, align 4
  %call55 = call i32 @strlen(i8* %36)
  %37 = load i8*, i8** %bp1, align 4
  %add.ptr = getelementptr inbounds i8, i8* %37, i32 %call55
  store i8* %add.ptr, i8** %bp1, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then53, %if.end51
  br label %while.cond

while.cond:                                       ; preds = %while.end, %if.end56
  %38 = load i8*, i8** %term, align 4
  %tobool57 = icmp ne i8* %38, null
  br i1 %tobool57, label %while.body, label %while.end106

while.body:                                       ; preds = %while.cond
  %39 = load i8*, i8** %term, align 4
  %40 = load i32, i32* %fd, align 4
  %call58 = call i32 @scan_file(i8* %39, i32 %40, %struct.buffer* %buf)
  %cmp59 = icmp eq i32 %call58, 0
  br i1 %cmp59, label %if.then61, label %if.end67

if.then61:                                        ; preds = %while.body
  %41 = load i32, i32* %fd, align 4
  %call62 = call i32 @close(i32 %41)
  %beg63 = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 0
  %42 = load i8*, i8** %beg63, align 4
  call void @free(i8* %42)
  %43 = load i32, i32* %malloc_size, align 4
  %tobool64 = icmp ne i32 %43, 0
  br i1 %tobool64, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.then61
  %44 = load i8*, i8** %bp.addr, align 4
  call void @free(i8* %44)
  br label %if.end66

if.end66:                                         ; preds = %if.then65, %if.then61
  store i32 0, i32* %retval, align 4
  br label %return

if.end67:                                         ; preds = %while.body
  %45 = load i8*, i8** %term, align 4
  %46 = load i8*, i8** %name.addr, align 4
  %cmp68 = icmp ne i8* %45, %46
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end67
  %47 = load i8*, i8** %term, align 4
  call void @free(i8* %47)
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %if.end67
  %48 = load i32, i32* %malloc_size, align 4
  %tobool72 = icmp ne i32 %48, 0
  br i1 %tobool72, label %if.then73, label %if.end81

if.then73:                                        ; preds = %if.end71
  %49 = load i8*, i8** %bp1, align 4
  %50 = load i8*, i8** %bp.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %49 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %50 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %size74 = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 1
  %51 = load i32, i32* %size74, align 4
  %add75 = add nsw i32 %sub.ptr.sub, %51
  store i32 %add75, i32* %malloc_size, align 4
  %52 = load i8*, i8** %bp.addr, align 4
  %53 = load i32, i32* %malloc_size, align 4
  %call76 = call i8* @xrealloc(i8* %52, i32 %53)
  store i8* %call76, i8** %termcap_name, align 4
  %54 = load i8*, i8** %termcap_name, align 4
  %55 = load i8*, i8** %bp.addr, align 4
  %sub.ptr.lhs.cast77 = ptrtoint i8* %54 to i32
  %sub.ptr.rhs.cast78 = ptrtoint i8* %55 to i32
  %sub.ptr.sub79 = sub i32 %sub.ptr.lhs.cast77, %sub.ptr.rhs.cast78
  %56 = load i8*, i8** %bp1, align 4
  %add.ptr80 = getelementptr inbounds i8, i8* %56, i32 %sub.ptr.sub79
  store i8* %add.ptr80, i8** %bp1, align 4
  %57 = load i8*, i8** %termcap_name, align 4
  store i8* %57, i8** %bp.addr, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.then73, %if.end71
  %58 = load i8*, i8** %bp1, align 4
  store i8* %58, i8** %bp2, align 4
  %ptr = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 2
  %59 = load i8*, i8** %ptr, align 4
  store i8* %59, i8** %termcap_name, align 4
  br label %while.cond82

while.cond82:                                     ; preds = %if.end103, %if.end81
  %60 = load i8*, i8** %termcap_name, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr, i8** %termcap_name, align 4
  %61 = load i8, i8* %60, align 1
  %conv83 = sext i8 %61 to i32
  store i32 %conv83, i32* %c, align 4
  %conv84 = trunc i32 %conv83 to i8
  %62 = load i8*, i8** %bp1, align 4
  %incdec.ptr85 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr85, i8** %bp1, align 4
  store i8 %conv84, i8* %62, align 1
  %conv86 = sext i8 %conv84 to i32
  %tobool87 = icmp ne i32 %conv86, 0
  br i1 %tobool87, label %land.rhs88, label %land.end91

land.rhs88:                                       ; preds = %while.cond82
  %63 = load i32, i32* %c, align 4
  %cmp89 = icmp ne i32 %63, 10
  br label %land.end91

land.end91:                                       ; preds = %land.rhs88, %while.cond82
  %64 = phi i1 [ false, %while.cond82 ], [ %cmp89, %land.rhs88 ]
  br i1 %64, label %while.body93, label %while.end

while.body93:                                     ; preds = %land.end91
  %65 = load i32, i32* %c, align 4
  %cmp94 = icmp eq i32 %65, 92
  br i1 %cmp94, label %land.lhs.true96, label %if.end103

land.lhs.true96:                                  ; preds = %while.body93
  %66 = load i8*, i8** %termcap_name, align 4
  %67 = load i8, i8* %66, align 1
  %conv97 = sext i8 %67 to i32
  %cmp98 = icmp eq i32 %conv97, 10
  br i1 %cmp98, label %if.then100, label %if.end103

if.then100:                                       ; preds = %land.lhs.true96
  %68 = load i8*, i8** %bp1, align 4
  %incdec.ptr101 = getelementptr inbounds i8, i8* %68, i32 -1
  store i8* %incdec.ptr101, i8** %bp1, align 4
  %69 = load i8*, i8** %termcap_name, align 4
  %incdec.ptr102 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %incdec.ptr102, i8** %termcap_name, align 4
  br label %if.end103

if.end103:                                        ; preds = %if.then100, %land.lhs.true96, %while.body93
  br label %while.cond82

while.end:                                        ; preds = %land.end91
  %70 = load i8*, i8** %bp1, align 4
  store i8 0, i8* %70, align 1
  %71 = load i8*, i8** %bp2, align 4
  %call104 = call i8* @find_capability(i8* %71, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  %call105 = call i8* @tgetst1(i8* %call104, i8** null)
  store i8* %call105, i8** %term, align 4
  br label %while.cond

while.end106:                                     ; preds = %while.cond
  %72 = load i32, i32* %fd, align 4
  %call107 = call i32 @close(i32 %72)
  %beg108 = getelementptr inbounds %struct.buffer, %struct.buffer* %buf, i32 0, i32 0
  %73 = load i8*, i8** %beg108, align 4
  call void @free(i8* %73)
  %74 = load i32, i32* %malloc_size, align 4
  %tobool109 = icmp ne i32 %74, 0
  br i1 %tobool109, label %if.then110, label %if.end116

if.then110:                                       ; preds = %while.end106
  %75 = load i8*, i8** %bp.addr, align 4
  %76 = load i8*, i8** %bp1, align 4
  %77 = load i8*, i8** %bp.addr, align 4
  %sub.ptr.lhs.cast111 = ptrtoint i8* %76 to i32
  %sub.ptr.rhs.cast112 = ptrtoint i8* %77 to i32
  %sub.ptr.sub113 = sub i32 %sub.ptr.lhs.cast111, %sub.ptr.rhs.cast112
  %add114 = add nsw i32 %sub.ptr.sub113, 1
  %call115 = call i8* @xrealloc(i8* %75, i32 %add114)
  store i8* %call115, i8** %bp.addr, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.then110, %while.end106
  br label %ret

ret:                                              ; preds = %if.end116, %if.end24
  %78 = load i8*, i8** %bp.addr, align 4
  store i8* %78, i8** @term_entry, align 4
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %ret, %if.end66, %if.then35
  %79 = load i32, i32* %retval, align 4
  ret i32 %79
}

declare i8* @getenv(i8*) #1

declare i32 @strcmp(i8*, i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32 @open(i8*, i32, ...) #1

; Function Attrs: noinline nounwind
define internal i8* @xmalloc(i32 %size) #0 {
entry:
  %size.addr = alloca i32, align 4
  %tem = alloca i8*, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i32, i32* %size.addr, align 4
  %call = call i8* @malloc(i32 %0)
  store i8* %call, i8** %tem, align 4
  %1 = load i8*, i8** %tem, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @memory_out()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %tem, align 4
  ret i8* %2
}

declare i32 @strlen(i8*) #1

declare i32 @close(i32) #1

declare void @free(i8*) #1

; Function Attrs: noinline nounwind
define internal i8* @xrealloc(i8* %ptr, i32 %size) #0 {
entry:
  %ptr.addr = alloca i8*, align 4
  %size.addr = alloca i32, align 4
  %tem = alloca i8*, align 4
  store i8* %ptr, i8** %ptr.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  %0 = load i8*, i8** %ptr.addr, align 4
  %1 = load i32, i32* %size.addr, align 4
  %call = call i8* @realloc(i8* %0, i32 %1)
  store i8* %call, i8** %tem, align 4
  %2 = load i8*, i8** %tem, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @memory_out()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i8*, i8** %tem, align 4
  ret i8* %3
}

; Function Attrs: noinline nounwind
define internal i8* @tgetst1(i8* %ptr, i8** %area) #0 {
entry:
  %retval = alloca i8*, align 4
  %ptr.addr = alloca i8*, align 4
  %area.addr = alloca i8**, align 4
  %p = alloca i8*, align 4
  %r = alloca i8*, align 4
  %c = alloca i32, align 4
  %size = alloca i32, align 4
  %ret = alloca i8*, align 4
  %c1 = alloca i32, align 4
  store i8* %ptr, i8** %ptr.addr, align 4
  store i8** %area, i8*** %area.addr, align 4
  %0 = load i8*, i8** %ptr.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8**, i8*** %area.addr, align 4
  %tobool1 = icmp ne i8** %1, null
  br i1 %tobool1, label %if.else, label %if.then2

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %ptr.addr, align 4
  store i8* %2, i8** %p, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then2
  %3 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  store i32 %conv, i32* %c, align 4
  %tobool3 = icmp ne i32 %conv, 0
  br i1 %tobool3, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %5 = load i32, i32* %c, align 4
  %cmp = icmp ne i32 %5, 58
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %c, align 4
  %cmp5 = icmp ne i32 %6, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %while.cond
  %7 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp5, %land.rhs ]
  br i1 %7, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  br label %while.cond

while.end:                                        ; preds = %land.end
  %8 = load i8*, i8** %p, align 4
  %9 = load i8*, i8** %ptr.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %8 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %9 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %add = add nsw i32 %sub.ptr.sub, 1
  %call = call i8* @xmalloc(i32 %add)
  store i8* %call, i8** %ret, align 4
  br label %if.end7

if.else:                                          ; preds = %if.end
  %10 = load i8**, i8*** %area.addr, align 4
  %11 = load i8*, i8** %10, align 4
  store i8* %11, i8** %ret, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else, %while.end
  %12 = load i8*, i8** %ptr.addr, align 4
  store i8* %12, i8** %p, align 4
  %13 = load i8*, i8** %ret, align 4
  store i8* %13, i8** %r, align 4
  br label %while.cond8

while.cond8:                                      ; preds = %if.end75, %if.end7
  %14 = load i8*, i8** %p, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr9, i8** %p, align 4
  %15 = load i8, i8* %14, align 1
  %conv10 = sext i8 %15 to i32
  store i32 %conv10, i32* %c, align 4
  %tobool11 = icmp ne i32 %conv10, 0
  br i1 %tobool11, label %land.lhs.true12, label %land.end18

land.lhs.true12:                                  ; preds = %while.cond8
  %16 = load i32, i32* %c, align 4
  %cmp13 = icmp ne i32 %16, 58
  br i1 %cmp13, label %land.rhs15, label %land.end18

land.rhs15:                                       ; preds = %land.lhs.true12
  %17 = load i32, i32* %c, align 4
  %cmp16 = icmp ne i32 %17, 10
  br label %land.end18

land.end18:                                       ; preds = %land.rhs15, %land.lhs.true12, %while.cond8
  %18 = phi i1 [ false, %land.lhs.true12 ], [ false, %while.cond8 ], [ %cmp16, %land.rhs15 ]
  br i1 %18, label %while.body19, label %while.end78

while.body19:                                     ; preds = %land.end18
  %19 = load i32, i32* %c, align 4
  %cmp20 = icmp eq i32 %19, 94
  br i1 %cmp20, label %if.then22, label %if.else30

if.then22:                                        ; preds = %while.body19
  %20 = load i8*, i8** %p, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr23, i8** %p, align 4
  %21 = load i8, i8* %20, align 1
  %conv24 = sext i8 %21 to i32
  store i32 %conv24, i32* %c, align 4
  %22 = load i32, i32* %c, align 4
  %cmp25 = icmp eq i32 %22, 63
  br i1 %cmp25, label %if.then27, label %if.else28

if.then27:                                        ; preds = %if.then22
  store i32 127, i32* %c, align 4
  br label %if.end29

if.else28:                                        ; preds = %if.then22
  %23 = load i32, i32* %c, align 4
  %and = and i32 %23, 31
  store i32 %and, i32* %c, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.else28, %if.then27
  br label %if.end75

if.else30:                                        ; preds = %while.body19
  %24 = load i32, i32* %c, align 4
  %cmp31 = icmp eq i32 %24, 92
  br i1 %cmp31, label %if.then33, label %if.end74

if.then33:                                        ; preds = %if.else30
  %25 = load i8*, i8** %p, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr34, i8** %p, align 4
  %26 = load i8, i8* %25, align 1
  %conv35 = sext i8 %26 to i32
  store i32 %conv35, i32* %c, align 4
  %27 = load i32, i32* %c, align 4
  %cmp36 = icmp sge i32 %27, 48
  br i1 %cmp36, label %land.lhs.true38, label %if.else58

land.lhs.true38:                                  ; preds = %if.then33
  %28 = load i32, i32* %c, align 4
  %cmp39 = icmp sle i32 %28, 55
  br i1 %cmp39, label %if.then41, label %if.else58

if.then41:                                        ; preds = %land.lhs.true38
  %29 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %29, 48
  store i32 %sub, i32* %c, align 4
  store i32 0, i32* %size, align 4
  br label %while.cond42

while.cond42:                                     ; preds = %while.body53, %if.then41
  %30 = load i32, i32* %size, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %size, align 4
  %cmp43 = icmp slt i32 %inc, 3
  br i1 %cmp43, label %land.lhs.true45, label %land.end52

land.lhs.true45:                                  ; preds = %while.cond42
  %31 = load i8*, i8** %p, align 4
  %32 = load i8, i8* %31, align 1
  %conv46 = sext i8 %32 to i32
  store i32 %conv46, i32* %c1, align 4
  %cmp47 = icmp sge i32 %conv46, 48
  br i1 %cmp47, label %land.rhs49, label %land.end52

land.rhs49:                                       ; preds = %land.lhs.true45
  %33 = load i32, i32* %c1, align 4
  %cmp50 = icmp sle i32 %33, 55
  br label %land.end52

land.end52:                                       ; preds = %land.rhs49, %land.lhs.true45, %while.cond42
  %34 = phi i1 [ false, %land.lhs.true45 ], [ false, %while.cond42 ], [ %cmp50, %land.rhs49 ]
  br i1 %34, label %while.body53, label %while.end57

while.body53:                                     ; preds = %land.end52
  %35 = load i32, i32* %c, align 4
  %mul = mul nsw i32 %35, 8
  store i32 %mul, i32* %c, align 4
  %36 = load i32, i32* %c1, align 4
  %sub54 = sub nsw i32 %36, 48
  %37 = load i32, i32* %c, align 4
  %add55 = add nsw i32 %37, %sub54
  store i32 %add55, i32* %c, align 4
  %38 = load i8*, i8** %p, align 4
  %incdec.ptr56 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %incdec.ptr56, i8** %p, align 4
  br label %while.cond42

while.end57:                                      ; preds = %land.end52
  br label %if.end73

if.else58:                                        ; preds = %land.lhs.true38, %if.then33
  %39 = load i32, i32* %c, align 4
  %cmp59 = icmp sge i32 %39, 64
  br i1 %cmp59, label %land.lhs.true61, label %if.end72

land.lhs.true61:                                  ; preds = %if.else58
  %40 = load i32, i32* %c, align 4
  %cmp62 = icmp slt i32 %40, 128
  br i1 %cmp62, label %if.then64, label %if.end72

if.then64:                                        ; preds = %land.lhs.true61
  %41 = load i32, i32* %c, align 4
  %and65 = and i32 %41, -33
  %sub66 = sub nsw i32 %and65, 64
  %arrayidx = getelementptr inbounds [33 x i8], [33 x i8]* @esctab, i32 0, i32 %sub66
  %42 = load i8, i8* %arrayidx, align 1
  %conv67 = sext i8 %42 to i32
  store i32 %conv67, i32* %c1, align 4
  %43 = load i32, i32* %c1, align 4
  %cmp68 = icmp ne i32 %43, 32
  br i1 %cmp68, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.then64
  %44 = load i32, i32* %c1, align 4
  store i32 %44, i32* %c, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %if.then64
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %land.lhs.true61, %if.else58
  br label %if.end73

if.end73:                                         ; preds = %if.end72, %while.end57
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.else30
  br label %if.end75

if.end75:                                         ; preds = %if.end74, %if.end29
  %45 = load i32, i32* %c, align 4
  %conv76 = trunc i32 %45 to i8
  %46 = load i8*, i8** %r, align 4
  %incdec.ptr77 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr77, i8** %r, align 4
  store i8 %conv76, i8* %46, align 1
  br label %while.cond8

while.end78:                                      ; preds = %land.end18
  %47 = load i8*, i8** %r, align 4
  store i8 0, i8* %47, align 1
  %48 = load i8**, i8*** %area.addr, align 4
  %tobool79 = icmp ne i8** %48, null
  br i1 %tobool79, label %if.then80, label %if.end81

if.then80:                                        ; preds = %while.end78
  %49 = load i8*, i8** %r, align 4
  %add.ptr = getelementptr inbounds i8, i8* %49, i32 1
  %50 = load i8**, i8*** %area.addr, align 4
  store i8* %add.ptr, i8** %50, align 4
  br label %if.end81

if.end81:                                         ; preds = %if.then80, %while.end78
  %51 = load i8*, i8** %ret, align 4
  store i8* %51, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end81, %if.then
  %52 = load i8*, i8** %retval, align 4
  ret i8* %52
}

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @memory_out() #0 {
entry:
  %call = call i32 @write(i32 2, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.4, i32 0, i32 0), i32 25)
  call void @exit(i32 1) #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @write(i32, i8*, i32) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare i8* @realloc(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @scan_file(i8* %str, i32 %fd, %struct.buffer* %bufp) #0 {
entry:
  %retval = alloca i32, align 4
  %str.addr = alloca i8*, align 4
  %fd.addr = alloca i32, align 4
  %bufp.addr = alloca %struct.buffer*, align 4
  %end = alloca i8*, align 4
  store i8* %str, i8** %str.addr, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.buffer* %bufp, %struct.buffer** %bufp.addr, align 4
  %0 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %beg = getelementptr inbounds %struct.buffer, %struct.buffer* %0, i32 0, i32 0
  %1 = load i8*, i8** %beg, align 4
  %2 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr = getelementptr inbounds %struct.buffer, %struct.buffer* %2, i32 0, i32 2
  store i8* %1, i8** %ptr, align 4
  %3 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full = getelementptr inbounds %struct.buffer, %struct.buffer* %3, i32 0, i32 4
  store i32 0, i32* %full, align 4
  %4 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ateof = getelementptr inbounds %struct.buffer, %struct.buffer* %4, i32 0, i32 3
  store i32 0, i32* %ateof, align 4
  %5 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr1 = getelementptr inbounds %struct.buffer, %struct.buffer* %5, i32 0, i32 2
  %6 = load i8*, i8** %ptr1, align 4
  store i8 0, i8* %6, align 1
  %7 = load i32, i32* %fd.addr, align 4
  %call = call i32 @lseek(i32 %7, i32 0, i32 0)
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %8 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ateof2 = getelementptr inbounds %struct.buffer, %struct.buffer* %8, i32 0, i32 3
  %9 = load i32, i32* %ateof2, align 4
  %tobool = icmp ne i32 %9, 0
  %lnot = xor i1 %tobool, true
  br i1 %lnot, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i8* null, i8** %end, align 4
  br label %do.body

do.body:                                          ; preds = %land.end, %while.body
  %10 = load i32, i32* %fd.addr, align 4
  %11 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %12 = load i8*, i8** %end, align 4
  %call3 = call i8* @gobble_line(i32 %10, %struct.buffer* %11, i8* %12)
  store i8* %call3, i8** %end, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %13 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ateof4 = getelementptr inbounds %struct.buffer, %struct.buffer* %13, i32 0, i32 3
  %14 = load i32, i32* %ateof4, align 4
  %tobool5 = icmp ne i32 %14, 0
  br i1 %tobool5, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %do.cond
  %15 = load i8*, i8** %end, align 4
  %arrayidx = getelementptr inbounds i8, i8* %15, i32 -2
  %16 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %16 to i32
  %cmp = icmp eq i32 %conv, 92
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %17 = phi i1 [ false, %do.cond ], [ %cmp, %land.rhs ]
  br i1 %17, label %do.body, label %do.end

do.end:                                           ; preds = %land.end
  %18 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr7 = getelementptr inbounds %struct.buffer, %struct.buffer* %18, i32 0, i32 2
  %19 = load i8*, i8** %ptr7, align 4
  %20 = load i8, i8* %19, align 1
  %conv8 = sext i8 %20 to i32
  %cmp9 = icmp ne i32 %conv8, 35
  br i1 %cmp9, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.end
  %21 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr11 = getelementptr inbounds %struct.buffer, %struct.buffer* %21, i32 0, i32 2
  %22 = load i8*, i8** %ptr11, align 4
  %23 = load i8*, i8** %str.addr, align 4
  %call12 = call i32 @name_match(i8* %22, i8* %23)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %do.end
  %24 = load i8*, i8** %end, align 4
  %25 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr14 = getelementptr inbounds %struct.buffer, %struct.buffer* %25, i32 0, i32 2
  store i8* %24, i8** %ptr14, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %26 = load i32, i32* %retval, align 4
  ret i32 %26
}

declare i32 @lseek(i32, i32, i32) #1

; Function Attrs: noinline nounwind
define internal i8* @gobble_line(i32 %fd, %struct.buffer* %bufp, i8* %append_end) #0 {
entry:
  %retval = alloca i8*, align 4
  %fd.addr = alloca i32, align 4
  %bufp.addr = alloca %struct.buffer*, align 4
  %append_end.addr = alloca i8*, align 4
  %end = alloca i8*, align 4
  %nread = alloca i32, align 4
  %buf = alloca i8*, align 4
  %tem = alloca i8*, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store %struct.buffer* %bufp, %struct.buffer** %bufp.addr, align 4
  store i8* %append_end, i8** %append_end.addr, align 4
  %0 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %beg = getelementptr inbounds %struct.buffer, %struct.buffer* %0, i32 0, i32 0
  %1 = load i8*, i8** %beg, align 4
  store i8* %1, i8** %buf, align 4
  %2 = load i8*, i8** %append_end.addr, align 4
  %tobool = icmp ne i8* %2, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %3 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr = getelementptr inbounds %struct.buffer, %struct.buffer* %3, i32 0, i32 2
  %4 = load i8*, i8** %ptr, align 4
  store i8* %4, i8** %append_end.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.body

while.body:                                       ; preds = %if.end, %if.end53
  %5 = load i8*, i8** %append_end.addr, align 4
  store i8* %5, i8** %end, align 4
  br label %while.cond1

while.cond1:                                      ; preds = %while.body5, %while.body
  %6 = load i8*, i8** %end, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %tobool2 = icmp ne i32 %conv, 0
  br i1 %tobool2, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond1
  %8 = load i8*, i8** %end, align 4
  %9 = load i8, i8* %8, align 1
  %conv3 = sext i8 %9 to i32
  %cmp = icmp ne i32 %conv3, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond1
  %10 = phi i1 [ false, %while.cond1 ], [ %cmp, %land.rhs ]
  br i1 %10, label %while.body5, label %while.end

while.body5:                                      ; preds = %land.end
  %11 = load i8*, i8** %end, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %end, align 4
  br label %while.cond1

while.end:                                        ; preds = %land.end
  %12 = load i8*, i8** %end, align 4
  %13 = load i8, i8* %12, align 1
  %tobool6 = icmp ne i8 %13, 0
  br i1 %tobool6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %while.end
  br label %while.end57

if.end8:                                          ; preds = %while.end
  %14 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ateof = getelementptr inbounds %struct.buffer, %struct.buffer* %14, i32 0, i32 3
  %15 = load i32, i32* %ateof, align 4
  %tobool9 = icmp ne i32 %15, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  %16 = load i8*, i8** %buf, align 4
  %17 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full = getelementptr inbounds %struct.buffer, %struct.buffer* %17, i32 0, i32 4
  %18 = load i32, i32* %full, align 4
  %add.ptr = getelementptr inbounds i8, i8* %16, i32 %18
  store i8* %add.ptr, i8** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end8
  %19 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr12 = getelementptr inbounds %struct.buffer, %struct.buffer* %19, i32 0, i32 2
  %20 = load i8*, i8** %ptr12, align 4
  %21 = load i8*, i8** %buf, align 4
  %cmp13 = icmp eq i8* %20, %21
  br i1 %cmp13, label %if.then15, label %if.else

if.then15:                                        ; preds = %if.end11
  %22 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full16 = getelementptr inbounds %struct.buffer, %struct.buffer* %22, i32 0, i32 4
  %23 = load i32, i32* %full16, align 4
  %24 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %size = getelementptr inbounds %struct.buffer, %struct.buffer* %24, i32 0, i32 1
  %25 = load i32, i32* %size, align 4
  %cmp17 = icmp eq i32 %23, %25
  br i1 %cmp17, label %if.then19, label %if.end30

if.then19:                                        ; preds = %if.then15
  %26 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %size20 = getelementptr inbounds %struct.buffer, %struct.buffer* %26, i32 0, i32 1
  %27 = load i32, i32* %size20, align 4
  %mul = mul nsw i32 %27, 2
  store i32 %mul, i32* %size20, align 4
  %28 = load i8*, i8** %buf, align 4
  %29 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %size21 = getelementptr inbounds %struct.buffer, %struct.buffer* %29, i32 0, i32 1
  %30 = load i32, i32* %size21, align 4
  %add = add nsw i32 %30, 1
  %call = call i8* @xrealloc(i8* %28, i32 %add)
  store i8* %call, i8** %tem, align 4
  %31 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr22 = getelementptr inbounds %struct.buffer, %struct.buffer* %31, i32 0, i32 2
  %32 = load i8*, i8** %ptr22, align 4
  %33 = load i8*, i8** %buf, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %32 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %33 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %34 = load i8*, i8** %tem, align 4
  %add.ptr23 = getelementptr inbounds i8, i8* %34, i32 %sub.ptr.sub
  %35 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr24 = getelementptr inbounds %struct.buffer, %struct.buffer* %35, i32 0, i32 2
  store i8* %add.ptr23, i8** %ptr24, align 4
  %36 = load i8*, i8** %append_end.addr, align 4
  %37 = load i8*, i8** %buf, align 4
  %sub.ptr.lhs.cast25 = ptrtoint i8* %36 to i32
  %sub.ptr.rhs.cast26 = ptrtoint i8* %37 to i32
  %sub.ptr.sub27 = sub i32 %sub.ptr.lhs.cast25, %sub.ptr.rhs.cast26
  %38 = load i8*, i8** %tem, align 4
  %add.ptr28 = getelementptr inbounds i8, i8* %38, i32 %sub.ptr.sub27
  store i8* %add.ptr28, i8** %append_end.addr, align 4
  %39 = load i8*, i8** %tem, align 4
  store i8* %39, i8** %buf, align 4
  %40 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %beg29 = getelementptr inbounds %struct.buffer, %struct.buffer* %40, i32 0, i32 0
  store i8* %39, i8** %beg29, align 4
  br label %if.end30

if.end30:                                         ; preds = %if.then19, %if.then15
  br label %if.end43

if.else:                                          ; preds = %if.end11
  %41 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr31 = getelementptr inbounds %struct.buffer, %struct.buffer* %41, i32 0, i32 2
  %42 = load i8*, i8** %ptr31, align 4
  %43 = load i8*, i8** %buf, align 4
  %sub.ptr.lhs.cast32 = ptrtoint i8* %42 to i32
  %sub.ptr.rhs.cast33 = ptrtoint i8* %43 to i32
  %sub.ptr.sub34 = sub i32 %sub.ptr.lhs.cast32, %sub.ptr.rhs.cast33
  %44 = load i8*, i8** %append_end.addr, align 4
  %idx.neg = sub i32 0, %sub.ptr.sub34
  %add.ptr35 = getelementptr inbounds i8, i8* %44, i32 %idx.neg
  store i8* %add.ptr35, i8** %append_end.addr, align 4
  %45 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr36 = getelementptr inbounds %struct.buffer, %struct.buffer* %45, i32 0, i32 2
  %46 = load i8*, i8** %ptr36, align 4
  %47 = load i8*, i8** %buf, align 4
  %48 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr37 = getelementptr inbounds %struct.buffer, %struct.buffer* %48, i32 0, i32 2
  %49 = load i8*, i8** %ptr37, align 4
  %50 = load i8*, i8** %buf, align 4
  %sub.ptr.lhs.cast38 = ptrtoint i8* %49 to i32
  %sub.ptr.rhs.cast39 = ptrtoint i8* %50 to i32
  %sub.ptr.sub40 = sub i32 %sub.ptr.lhs.cast38, %sub.ptr.rhs.cast39
  %51 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full41 = getelementptr inbounds %struct.buffer, %struct.buffer* %51, i32 0, i32 4
  %52 = load i32, i32* %full41, align 4
  %sub = sub nsw i32 %52, %sub.ptr.sub40
  store i32 %sub, i32* %full41, align 4
  call void @bcopy(i8* %46, i8* %47, i32 %sub)
  %53 = load i8*, i8** %buf, align 4
  %54 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ptr42 = getelementptr inbounds %struct.buffer, %struct.buffer* %54, i32 0, i32 2
  store i8* %53, i8** %ptr42, align 4
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.end30
  %55 = load i32, i32* %fd.addr, align 4
  %56 = load i8*, i8** %buf, align 4
  %57 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full44 = getelementptr inbounds %struct.buffer, %struct.buffer* %57, i32 0, i32 4
  %58 = load i32, i32* %full44, align 4
  %add.ptr45 = getelementptr inbounds i8, i8* %56, i32 %58
  %59 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %size46 = getelementptr inbounds %struct.buffer, %struct.buffer* %59, i32 0, i32 1
  %60 = load i32, i32* %size46, align 4
  %61 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full47 = getelementptr inbounds %struct.buffer, %struct.buffer* %61, i32 0, i32 4
  %62 = load i32, i32* %full47, align 4
  %sub48 = sub nsw i32 %60, %62
  %call49 = call i32 @read(i32 %55, i8* %add.ptr45, i32 %sub48)
  store i32 %call49, i32* %nread, align 4
  %tobool50 = icmp ne i32 %call49, 0
  br i1 %tobool50, label %if.end53, label %if.then51

if.then51:                                        ; preds = %if.end43
  %63 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %ateof52 = getelementptr inbounds %struct.buffer, %struct.buffer* %63, i32 0, i32 3
  store i32 1, i32* %ateof52, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then51, %if.end43
  %64 = load i32, i32* %nread, align 4
  %65 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full54 = getelementptr inbounds %struct.buffer, %struct.buffer* %65, i32 0, i32 4
  %66 = load i32, i32* %full54, align 4
  %add55 = add nsw i32 %66, %64
  store i32 %add55, i32* %full54, align 4
  %67 = load i8*, i8** %buf, align 4
  %68 = load %struct.buffer*, %struct.buffer** %bufp.addr, align 4
  %full56 = getelementptr inbounds %struct.buffer, %struct.buffer* %68, i32 0, i32 4
  %69 = load i32, i32* %full56, align 4
  %arrayidx = getelementptr inbounds i8, i8* %67, i32 %69
  store i8 0, i8* %arrayidx, align 1
  br label %while.body

while.end57:                                      ; preds = %if.then7
  %70 = load i8*, i8** %end, align 4
  %add.ptr58 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %add.ptr58, i8** %retval, align 4
  br label %return

return:                                           ; preds = %while.end57, %if.then10
  %71 = load i8*, i8** %retval, align 4
  ret i8* %71
}

declare void @bcopy(i8*, i8*, i32) #1

declare i32 @read(i32, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @name_match(i8* %line, i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %line.addr = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %tem = alloca i8*, align 4
  store i8* %line, i8** %line.addr, align 4
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %line.addr, align 4
  %1 = load i8*, i8** %name.addr, align 4
  %call = call i32 @compare_contin(i8* %0, i8* %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %line.addr, align 4
  store i8* %2, i8** %tem, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i8*, i8** %tem, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %for.cond
  %5 = load i8*, i8** %tem, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp = icmp ne i32 %conv2, 10
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %7 = load i8*, i8** %tem, align 4
  %8 = load i8, i8* %7, align 1
  %conv4 = sext i8 %8 to i32
  %cmp5 = icmp ne i32 %conv4, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %for.cond
  %9 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond ], [ %cmp5, %land.rhs ]
  br i1 %9, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %10 = load i8*, i8** %tem, align 4
  %11 = load i8, i8* %10, align 1
  %conv7 = sext i8 %11 to i32
  %cmp8 = icmp eq i32 %conv7, 124
  br i1 %cmp8, label %land.lhs.true10, label %if.end14

land.lhs.true10:                                  ; preds = %for.body
  %12 = load i8*, i8** %tem, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 1
  %13 = load i8*, i8** %name.addr, align 4
  %call11 = call i32 @compare_contin(i8* %add.ptr, i8* %13)
  %tobool12 = icmp ne i32 %call11, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %land.lhs.true10
  store i32 1, i32* %retval, align 4
  br label %return

if.end14:                                         ; preds = %land.lhs.true10, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %14 = load i8*, i8** %tem, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr, i8** %tem, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then13, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define internal i32 @compare_contin(i8* %str1, i8* %str2) #0 {
entry:
  %retval = alloca i32, align 4
  %str1.addr = alloca i8*, align 4
  %str2.addr = alloca i8*, align 4
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  store i8* %str1, i8** %str1.addr, align 4
  store i8* %str2, i8** %str2.addr, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end30
  %0 = load i8*, i8** %str1.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %0, i32 1
  store i8* %incdec.ptr, i8** %str1.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  store i32 %conv, i32* %c1, align 4
  %2 = load i8*, i8** %str2.addr, align 4
  %incdec.ptr1 = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr1, i8** %str2.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv2 = sext i8 %3 to i32
  store i32 %conv2, i32* %c2, align 4
  br label %while.cond3

while.cond3:                                      ; preds = %while.end, %while.body
  %4 = load i32, i32* %c1, align 4
  %cmp = icmp eq i32 %4, 92
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond3
  %5 = load i8*, i8** %str1.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond3
  %7 = phi i1 [ false, %while.cond3 ], [ %cmp6, %land.rhs ]
  br i1 %7, label %while.body8, label %while.end18

while.body8:                                      ; preds = %land.end
  %8 = load i8*, i8** %str1.addr, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr9, i8** %str1.addr, align 4
  br label %while.cond10

while.cond10:                                     ; preds = %while.body17, %while.body8
  %9 = load i8*, i8** %str1.addr, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr11, i8** %str1.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv12 = sext i8 %10 to i32
  store i32 %conv12, i32* %c1, align 4
  %cmp13 = icmp eq i32 %conv12, 32
  br i1 %cmp13, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond10
  %11 = load i32, i32* %c1, align 4
  %cmp15 = icmp eq i32 %11, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond10
  %12 = phi i1 [ true, %while.cond10 ], [ %cmp15, %lor.rhs ]
  br i1 %12, label %while.body17, label %while.end

while.body17:                                     ; preds = %lor.end
  br label %while.cond10

while.end:                                        ; preds = %lor.end
  br label %while.cond3

while.end18:                                      ; preds = %land.end
  %13 = load i32, i32* %c2, align 4
  %cmp19 = icmp eq i32 %13, 0
  br i1 %cmp19, label %if.then, label %if.else26

if.then:                                          ; preds = %while.end18
  %14 = load i32, i32* %c1, align 4
  %cmp21 = icmp eq i32 %14, 124
  br i1 %cmp21, label %if.then25, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %15 = load i32, i32* %c1, align 4
  %cmp23 = icmp eq i32 %15, 58
  br i1 %cmp23, label %if.then25, label %if.else

if.then25:                                        ; preds = %lor.lhs.false, %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  store i32 1, i32* %retval, align 4
  br label %return

if.else26:                                        ; preds = %while.end18
  %16 = load i32, i32* %c1, align 4
  %17 = load i32, i32* %c2, align 4
  %cmp27 = icmp ne i32 %16, %17
  br i1 %cmp27, label %if.then29, label %if.end

if.then29:                                        ; preds = %if.else26
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.else26
  br label %if.end30

if.end30:                                         ; preds = %if.end
  br label %while.body

return:                                           ; preds = %if.then29, %if.else, %if.then25
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
