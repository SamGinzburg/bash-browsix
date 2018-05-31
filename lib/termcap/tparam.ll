; ModuleID = 'tparam.c'
source_filename = "tparam.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@tgoto_buf = internal global [50 x i8] zeroinitializer, align 1
@UP = common global i8* null, align 4
@BC = common global i8* null, align 4
@.str = private unnamed_addr constant [26 x i8] c"virtual memory exhausted\0A\00", align 1

; Function Attrs: noinline nounwind
define i8* @tparam(i8* %string, i8* %outstring, i32 %len, i32 %arg0, i32 %arg1, i32 %arg2, i32 %arg3) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %outstring.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %arg0.addr = alloca i32, align 4
  %arg1.addr = alloca i32, align 4
  %arg2.addr = alloca i32, align 4
  %arg3.addr = alloca i32, align 4
  %arg = alloca [4 x i32], align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %outstring, i8** %outstring.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %arg0, i32* %arg0.addr, align 4
  store i32 %arg1, i32* %arg1.addr, align 4
  store i32 %arg2, i32* %arg2.addr, align 4
  store i32 %arg3, i32* %arg3.addr, align 4
  %0 = load i32, i32* %arg0.addr, align 4
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %arg, i32 0, i32 0
  store i32 %0, i32* %arrayidx, align 4
  %1 = load i32, i32* %arg1.addr, align 4
  %arrayidx1 = getelementptr inbounds [4 x i32], [4 x i32]* %arg, i32 0, i32 1
  store i32 %1, i32* %arrayidx1, align 4
  %2 = load i32, i32* %arg2.addr, align 4
  %arrayidx2 = getelementptr inbounds [4 x i32], [4 x i32]* %arg, i32 0, i32 2
  store i32 %2, i32* %arrayidx2, align 4
  %3 = load i32, i32* %arg3.addr, align 4
  %arrayidx3 = getelementptr inbounds [4 x i32], [4 x i32]* %arg, i32 0, i32 3
  store i32 %3, i32* %arrayidx3, align 4
  %4 = load i8*, i8** %string.addr, align 4
  %5 = load i8*, i8** %outstring.addr, align 4
  %6 = load i32, i32* %len.addr, align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %arg, i32 0, i32 0
  %call = call i8* @tparam1(i8* %4, i8* %5, i32 %6, i8* null, i8* null, i32* %arraydecay)
  ret i8* %call
}

; Function Attrs: noinline nounwind
define i8* @tgoto(i8* %cm, i32 %hpos, i32 %vpos) #0 {
entry:
  %retval = alloca i8*, align 4
  %cm.addr = alloca i8*, align 4
  %hpos.addr = alloca i32, align 4
  %vpos.addr = alloca i32, align 4
  %args = alloca [2 x i32], align 4
  store i8* %cm, i8** %cm.addr, align 4
  store i32 %hpos, i32* %hpos.addr, align 4
  store i32 %vpos, i32* %vpos.addr, align 4
  %0 = load i8*, i8** %cm.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %vpos.addr, align 4
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %args, i32 0, i32 0
  store i32 %1, i32* %arrayidx, align 4
  %2 = load i32, i32* %hpos.addr, align 4
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %args, i32 0, i32 1
  store i32 %2, i32* %arrayidx1, align 4
  %3 = load i8*, i8** %cm.addr, align 4
  %4 = load i8*, i8** @UP, align 4
  %5 = load i8*, i8** @BC, align 4
  %arraydecay = getelementptr inbounds [2 x i32], [2 x i32]* %args, i32 0, i32 0
  %call = call i8* @tparam1(i8* %3, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @tgoto_buf, i32 0, i32 0), i32 50, i8* %4, i8* %5, i32* %arraydecay)
  store i8* %call, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %6 = load i8*, i8** %retval, align 4
  ret i8* %6
}

; Function Attrs: noinline nounwind
define internal i8* @tparam1(i8* %string, i8* %outstring, i32 %len, i8* %up, i8* %left, i32* %argp) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %outstring.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %up.addr = alloca i8*, align 4
  %left.addr = alloca i8*, align 4
  %argp.addr = alloca i32*, align 4
  %c = alloca i32, align 4
  %p = alloca i8*, align 4
  %op = alloca i8*, align 4
  %outend = alloca i8*, align 4
  %outlen = alloca i32, align 4
  %tem = alloca i32, align 4
  %old_argp = alloca i32*, align 4
  %doleft = alloca i32, align 4
  %doup = alloca i32, align 4
  %new = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %outstring, i8** %outstring.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i8* %up, i8** %up.addr, align 4
  store i8* %left, i8** %left.addr, align 4
  store i32* %argp, i32** %argp.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %p, align 4
  %1 = load i8*, i8** %outstring.addr, align 4
  store i8* %1, i8** %op, align 4
  store i32 0, i32* %outlen, align 4
  %2 = load i32*, i32** %argp.addr, align 4
  store i32* %2, i32** %old_argp, align 4
  store i32 0, i32* %doleft, align 4
  store i32 0, i32* %doup, align 4
  %3 = load i8*, i8** %outstring.addr, align 4
  %4 = load i32, i32* %len.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 %4
  store i8* %add.ptr, i8** %outend, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end190
  %5 = load i8*, i8** %op, align 4
  %add.ptr1 = getelementptr inbounds i8, i8* %5, i32 5
  %6 = load i8*, i8** %outend, align 4
  %cmp = icmp uge i8* %add.ptr1, %6
  br i1 %cmp, label %if.then, label %if.end15

if.then:                                          ; preds = %while.body
  %7 = load i32, i32* %outlen, align 4
  %cmp2 = icmp eq i32 %7, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %8 = load i32, i32* %len.addr, align 4
  %add = add nsw i32 %8, 40
  store i32 %add, i32* %outlen, align 4
  %9 = load i32, i32* %outlen, align 4
  %call = call i8* @xmalloc(i32 %9)
  store i8* %call, i8** %new, align 4
  %10 = load i8*, i8** %outend, align 4
  %add.ptr4 = getelementptr inbounds i8, i8* %10, i32 40
  store i8* %add.ptr4, i8** %outend, align 4
  %11 = load i8*, i8** %outstring.addr, align 4
  %12 = load i8*, i8** %new, align 4
  %13 = load i8*, i8** %op, align 4
  %14 = load i8*, i8** %outstring.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %13 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %14 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  call void @bcopy(i8* %11, i8* %12, i32 %sub.ptr.sub)
  br label %if.end

if.else:                                          ; preds = %if.then
  %15 = load i32, i32* %outlen, align 4
  %16 = load i8*, i8** %outend, align 4
  %add.ptr5 = getelementptr inbounds i8, i8* %16, i32 %15
  store i8* %add.ptr5, i8** %outend, align 4
  %17 = load i32, i32* %outlen, align 4
  %mul = mul nsw i32 %17, 2
  store i32 %mul, i32* %outlen, align 4
  %18 = load i8*, i8** %outstring.addr, align 4
  %19 = load i32, i32* %outlen, align 4
  %call6 = call i8* @xrealloc(i8* %18, i32 %19)
  store i8* %call6, i8** %new, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %20 = load i8*, i8** %new, align 4
  %21 = load i8*, i8** %outstring.addr, align 4
  %sub.ptr.lhs.cast7 = ptrtoint i8* %20 to i32
  %sub.ptr.rhs.cast8 = ptrtoint i8* %21 to i32
  %sub.ptr.sub9 = sub i32 %sub.ptr.lhs.cast7, %sub.ptr.rhs.cast8
  %22 = load i8*, i8** %op, align 4
  %add.ptr10 = getelementptr inbounds i8, i8* %22, i32 %sub.ptr.sub9
  store i8* %add.ptr10, i8** %op, align 4
  %23 = load i8*, i8** %new, align 4
  %24 = load i8*, i8** %outstring.addr, align 4
  %sub.ptr.lhs.cast11 = ptrtoint i8* %23 to i32
  %sub.ptr.rhs.cast12 = ptrtoint i8* %24 to i32
  %sub.ptr.sub13 = sub i32 %sub.ptr.lhs.cast11, %sub.ptr.rhs.cast12
  %25 = load i8*, i8** %outend, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %25, i32 %sub.ptr.sub13
  store i8* %add.ptr14, i8** %outend, align 4
  %26 = load i8*, i8** %new, align 4
  store i8* %26, i8** %outstring.addr, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.end, %while.body
  %27 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %28 = load i8, i8* %27, align 1
  %conv = sext i8 %28 to i32
  store i32 %conv, i32* %c, align 4
  %29 = load i32, i32* %c, align 4
  %tobool = icmp ne i32 %29, 0
  br i1 %tobool, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end15
  br label %while.end191

if.end17:                                         ; preds = %if.end15
  %30 = load i32, i32* %c, align 4
  %cmp18 = icmp eq i32 %30, 37
  br i1 %cmp18, label %if.then20, label %if.else187

if.then20:                                        ; preds = %if.end17
  %31 = load i8*, i8** %p, align 4
  %incdec.ptr21 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr21, i8** %p, align 4
  %32 = load i8, i8* %31, align 1
  %conv22 = sext i8 %32 to i32
  store i32 %conv22, i32* %c, align 4
  %33 = load i32*, i32** %argp.addr, align 4
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %tem, align 4
  %35 = load i32, i32* %c, align 4
  switch i32 %35, label %sw.epilog [
    i32 100, label %sw.bb
    i32 51, label %sw.bb31
    i32 50, label %sw.bb43
    i32 67, label %sw.bb54
    i32 43, label %sw.bb63
    i32 46, label %sw.bb67
    i32 102, label %sw.bb94
    i32 98, label %sw.bb96
    i32 114, label %sw.bb98
    i32 62, label %sw.bb102
    i32 97, label %sw.bb114
    i32 105, label %sw.bb162
    i32 37, label %sw.bb167
    i32 110, label %sw.bb168
    i32 109, label %sw.bb172
    i32 66, label %sw.bb177
    i32 68, label %sw.bb182
  ]

sw.bb:                                            ; preds = %if.then20
  %36 = load i32, i32* %tem, align 4
  %cmp23 = icmp slt i32 %36, 10
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %sw.bb
  br label %onedigit

if.end26:                                         ; preds = %sw.bb
  %37 = load i32, i32* %tem, align 4
  %cmp27 = icmp slt i32 %37, 100
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  br label %twodigit

if.end30:                                         ; preds = %if.end26
  br label %sw.bb31

sw.bb31:                                          ; preds = %if.then20, %if.end30
  %38 = load i32, i32* %tem, align 4
  %cmp32 = icmp sgt i32 %38, 999
  br i1 %cmp32, label %if.then34, label %if.end38

if.then34:                                        ; preds = %sw.bb31
  %39 = load i32, i32* %tem, align 4
  %div = sdiv i32 %39, 1000
  %add35 = add nsw i32 %div, 48
  %conv36 = trunc i32 %add35 to i8
  %40 = load i8*, i8** %op, align 4
  %incdec.ptr37 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr37, i8** %op, align 4
  store i8 %conv36, i8* %40, align 1
  %41 = load i32, i32* %tem, align 4
  %rem = srem i32 %41, 1000
  store i32 %rem, i32* %tem, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.then34, %sw.bb31
  %42 = load i32, i32* %tem, align 4
  %div39 = sdiv i32 %42, 100
  %add40 = add nsw i32 %div39, 48
  %conv41 = trunc i32 %add40 to i8
  %43 = load i8*, i8** %op, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %incdec.ptr42, i8** %op, align 4
  store i8 %conv41, i8* %43, align 1
  br label %sw.bb43

sw.bb43:                                          ; preds = %if.then20, %if.end38
  br label %twodigit

twodigit:                                         ; preds = %sw.bb43, %if.then29
  %44 = load i32, i32* %tem, align 4
  %rem44 = srem i32 %44, 100
  store i32 %rem44, i32* %tem, align 4
  %45 = load i32, i32* %tem, align 4
  %div45 = sdiv i32 %45, 10
  %add46 = add nsw i32 %div45, 48
  %conv47 = trunc i32 %add46 to i8
  %46 = load i8*, i8** %op, align 4
  %incdec.ptr48 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr48, i8** %op, align 4
  store i8 %conv47, i8* %46, align 1
  br label %onedigit

onedigit:                                         ; preds = %twodigit, %if.then25
  %47 = load i32, i32* %tem, align 4
  %rem49 = srem i32 %47, 10
  %add50 = add nsw i32 %rem49, 48
  %conv51 = trunc i32 %add50 to i8
  %48 = load i8*, i8** %op, align 4
  %incdec.ptr52 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %incdec.ptr52, i8** %op, align 4
  store i8 %conv51, i8* %48, align 1
  %49 = load i32*, i32** %argp.addr, align 4
  %incdec.ptr53 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %incdec.ptr53, i32** %argp.addr, align 4
  br label %sw.epilog

sw.bb54:                                          ; preds = %if.then20
  %50 = load i32, i32* %tem, align 4
  %cmp55 = icmp sge i32 %50, 96
  br i1 %cmp55, label %if.then57, label %if.end62

if.then57:                                        ; preds = %sw.bb54
  %51 = load i32, i32* %tem, align 4
  %div58 = sdiv i32 %51, 96
  %conv59 = trunc i32 %div58 to i8
  %52 = load i8*, i8** %op, align 4
  %incdec.ptr60 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %incdec.ptr60, i8** %op, align 4
  store i8 %conv59, i8* %52, align 1
  %53 = load i32, i32* %tem, align 4
  %rem61 = srem i32 %53, 96
  store i32 %rem61, i32* %tem, align 4
  br label %if.end62

if.end62:                                         ; preds = %if.then57, %sw.bb54
  br label %sw.bb63

sw.bb63:                                          ; preds = %if.then20, %if.end62
  %54 = load i8*, i8** %p, align 4
  %incdec.ptr64 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr64, i8** %p, align 4
  %55 = load i8, i8* %54, align 1
  %conv65 = sext i8 %55 to i32
  %56 = load i32, i32* %tem, align 4
  %add66 = add nsw i32 %56, %conv65
  store i32 %add66, i32* %tem, align 4
  br label %sw.bb67

sw.bb67:                                          ; preds = %if.then20, %sw.bb63
  %57 = load i8*, i8** %left.addr, align 4
  %tobool68 = icmp ne i8* %57, null
  br i1 %tobool68, label %if.then69, label %if.end90

if.then69:                                        ; preds = %sw.bb67
  br label %while.cond70

while.cond70:                                     ; preds = %if.end89, %if.then69
  %58 = load i32, i32* %tem, align 4
  %cmp71 = icmp eq i32 %58, 0
  br i1 %cmp71, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.cond70
  %59 = load i32, i32* %tem, align 4
  %cmp73 = icmp eq i32 %59, 10
  br i1 %cmp73, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %60 = load i32, i32* %tem, align 4
  %cmp75 = icmp eq i32 %60, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %while.cond70
  %61 = phi i1 [ true, %lor.lhs.false ], [ true, %while.cond70 ], [ %cmp75, %lor.rhs ]
  br i1 %61, label %while.body77, label %while.end

while.body77:                                     ; preds = %lor.end
  %62 = load i32, i32* %tem, align 4
  %inc = add nsw i32 %62, 1
  store i32 %inc, i32* %tem, align 4
  %63 = load i32*, i32** %argp.addr, align 4
  %64 = load i32*, i32** %old_argp, align 4
  %cmp78 = icmp eq i32* %63, %64
  br i1 %cmp78, label %if.then80, label %if.else84

if.then80:                                        ; preds = %while.body77
  %65 = load i32, i32* %doup, align 4
  %inc81 = add nsw i32 %65, 1
  store i32 %inc81, i32* %doup, align 4
  %66 = load i8*, i8** %up.addr, align 4
  %call82 = call i32 @strlen(i8* %66)
  %67 = load i8*, i8** %outend, align 4
  %idx.neg = sub i32 0, %call82
  %add.ptr83 = getelementptr inbounds i8, i8* %67, i32 %idx.neg
  store i8* %add.ptr83, i8** %outend, align 4
  br label %if.end89

if.else84:                                        ; preds = %while.body77
  %68 = load i32, i32* %doleft, align 4
  %inc85 = add nsw i32 %68, 1
  store i32 %inc85, i32* %doleft, align 4
  %69 = load i8*, i8** %left.addr, align 4
  %call86 = call i32 @strlen(i8* %69)
  %70 = load i8*, i8** %outend, align 4
  %idx.neg87 = sub i32 0, %call86
  %add.ptr88 = getelementptr inbounds i8, i8* %70, i32 %idx.neg87
  store i8* %add.ptr88, i8** %outend, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else84, %if.then80
  br label %while.cond70

while.end:                                        ; preds = %lor.end
  br label %if.end90

if.end90:                                         ; preds = %while.end, %sw.bb67
  %71 = load i32, i32* %tem, align 4
  %tobool91 = icmp ne i32 %71, 0
  br i1 %tobool91, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end90
  %72 = load i32, i32* %tem, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end90
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %72, %cond.true ], [ 128, %cond.false ]
  %conv92 = trunc i32 %cond to i8
  %73 = load i8*, i8** %op, align 4
  %incdec.ptr93 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr93, i8** %op, align 4
  store i8 %conv92, i8* %73, align 1
  br label %sw.bb94

sw.bb94:                                          ; preds = %if.then20, %cond.end
  %74 = load i32*, i32** %argp.addr, align 4
  %incdec.ptr95 = getelementptr inbounds i32, i32* %74, i32 1
  store i32* %incdec.ptr95, i32** %argp.addr, align 4
  br label %sw.epilog

sw.bb96:                                          ; preds = %if.then20
  %75 = load i32*, i32** %argp.addr, align 4
  %incdec.ptr97 = getelementptr inbounds i32, i32* %75, i32 -1
  store i32* %incdec.ptr97, i32** %argp.addr, align 4
  br label %sw.epilog

sw.bb98:                                          ; preds = %if.then20
  %76 = load i32*, i32** %argp.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %76, i32 1
  %77 = load i32, i32* %arrayidx, align 4
  %78 = load i32*, i32** %argp.addr, align 4
  %arrayidx99 = getelementptr inbounds i32, i32* %78, i32 0
  store i32 %77, i32* %arrayidx99, align 4
  %79 = load i32, i32* %tem, align 4
  %80 = load i32*, i32** %argp.addr, align 4
  %arrayidx100 = getelementptr inbounds i32, i32* %80, i32 1
  store i32 %79, i32* %arrayidx100, align 4
  %81 = load i32*, i32** %old_argp, align 4
  %incdec.ptr101 = getelementptr inbounds i32, i32* %81, i32 1
  store i32* %incdec.ptr101, i32** %old_argp, align 4
  br label %sw.epilog

sw.bb102:                                         ; preds = %if.then20
  %82 = load i32*, i32** %argp.addr, align 4
  %arrayidx103 = getelementptr inbounds i32, i32* %82, i32 0
  %83 = load i32, i32* %arrayidx103, align 4
  %84 = load i8*, i8** %p, align 4
  %incdec.ptr104 = getelementptr inbounds i8, i8* %84, i32 1
  store i8* %incdec.ptr104, i8** %p, align 4
  %85 = load i8, i8* %84, align 1
  %conv105 = sext i8 %85 to i32
  %cmp106 = icmp sgt i32 %83, %conv105
  br i1 %cmp106, label %if.then108, label %if.end112

if.then108:                                       ; preds = %sw.bb102
  %86 = load i8*, i8** %p, align 4
  %87 = load i8, i8* %86, align 1
  %conv109 = sext i8 %87 to i32
  %88 = load i32*, i32** %argp.addr, align 4
  %arrayidx110 = getelementptr inbounds i32, i32* %88, i32 0
  %89 = load i32, i32* %arrayidx110, align 4
  %add111 = add nsw i32 %89, %conv109
  store i32 %add111, i32* %arrayidx110, align 4
  br label %if.end112

if.end112:                                        ; preds = %if.then108, %sw.bb102
  %90 = load i8*, i8** %p, align 4
  %incdec.ptr113 = getelementptr inbounds i8, i8* %90, i32 1
  store i8* %incdec.ptr113, i8** %p, align 4
  br label %sw.epilog

sw.bb114:                                         ; preds = %if.then20
  %91 = load i8*, i8** %p, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %91, i32 2
  %92 = load i8, i8* %arrayidx115, align 1
  %conv116 = sext i8 %92 to i32
  %and = and i32 %conv116, 127
  store i32 %and, i32* %tem, align 4
  %93 = load i8*, i8** %p, align 4
  %arrayidx117 = getelementptr inbounds i8, i8* %93, i32 1
  %94 = load i8, i8* %arrayidx117, align 1
  %conv118 = sext i8 %94 to i32
  %cmp119 = icmp eq i32 %conv118, 112
  br i1 %cmp119, label %if.then121, label %if.end123

if.then121:                                       ; preds = %sw.bb114
  %95 = load i32*, i32** %argp.addr, align 4
  %96 = load i32, i32* %tem, align 4
  %sub = sub nsw i32 %96, 64
  %arrayidx122 = getelementptr inbounds i32, i32* %95, i32 %sub
  %97 = load i32, i32* %arrayidx122, align 4
  store i32 %97, i32* %tem, align 4
  br label %if.end123

if.end123:                                        ; preds = %if.then121, %sw.bb114
  %98 = load i8*, i8** %p, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %98, i32 0
  %99 = load i8, i8* %arrayidx124, align 1
  %conv125 = sext i8 %99 to i32
  %cmp126 = icmp eq i32 %conv125, 45
  br i1 %cmp126, label %if.then128, label %if.else131

if.then128:                                       ; preds = %if.end123
  %100 = load i32, i32* %tem, align 4
  %101 = load i32*, i32** %argp.addr, align 4
  %arrayidx129 = getelementptr inbounds i32, i32* %101, i32 0
  %102 = load i32, i32* %arrayidx129, align 4
  %sub130 = sub nsw i32 %102, %100
  store i32 %sub130, i32* %arrayidx129, align 4
  br label %if.end160

if.else131:                                       ; preds = %if.end123
  %103 = load i8*, i8** %p, align 4
  %arrayidx132 = getelementptr inbounds i8, i8* %103, i32 0
  %104 = load i8, i8* %arrayidx132, align 1
  %conv133 = sext i8 %104 to i32
  %cmp134 = icmp eq i32 %conv133, 43
  br i1 %cmp134, label %if.then136, label %if.else139

if.then136:                                       ; preds = %if.else131
  %105 = load i32, i32* %tem, align 4
  %106 = load i32*, i32** %argp.addr, align 4
  %arrayidx137 = getelementptr inbounds i32, i32* %106, i32 0
  %107 = load i32, i32* %arrayidx137, align 4
  %add138 = add nsw i32 %107, %105
  store i32 %add138, i32* %arrayidx137, align 4
  br label %if.end159

if.else139:                                       ; preds = %if.else131
  %108 = load i8*, i8** %p, align 4
  %arrayidx140 = getelementptr inbounds i8, i8* %108, i32 0
  %109 = load i8, i8* %arrayidx140, align 1
  %conv141 = sext i8 %109 to i32
  %cmp142 = icmp eq i32 %conv141, 42
  br i1 %cmp142, label %if.then144, label %if.else147

if.then144:                                       ; preds = %if.else139
  %110 = load i32, i32* %tem, align 4
  %111 = load i32*, i32** %argp.addr, align 4
  %arrayidx145 = getelementptr inbounds i32, i32* %111, i32 0
  %112 = load i32, i32* %arrayidx145, align 4
  %mul146 = mul nsw i32 %112, %110
  store i32 %mul146, i32* %arrayidx145, align 4
  br label %if.end158

if.else147:                                       ; preds = %if.else139
  %113 = load i8*, i8** %p, align 4
  %arrayidx148 = getelementptr inbounds i8, i8* %113, i32 0
  %114 = load i8, i8* %arrayidx148, align 1
  %conv149 = sext i8 %114 to i32
  %cmp150 = icmp eq i32 %conv149, 47
  br i1 %cmp150, label %if.then152, label %if.else155

if.then152:                                       ; preds = %if.else147
  %115 = load i32, i32* %tem, align 4
  %116 = load i32*, i32** %argp.addr, align 4
  %arrayidx153 = getelementptr inbounds i32, i32* %116, i32 0
  %117 = load i32, i32* %arrayidx153, align 4
  %div154 = sdiv i32 %117, %115
  store i32 %div154, i32* %arrayidx153, align 4
  br label %if.end157

if.else155:                                       ; preds = %if.else147
  %118 = load i32, i32* %tem, align 4
  %119 = load i32*, i32** %argp.addr, align 4
  %arrayidx156 = getelementptr inbounds i32, i32* %119, i32 0
  store i32 %118, i32* %arrayidx156, align 4
  br label %if.end157

if.end157:                                        ; preds = %if.else155, %if.then152
  br label %if.end158

if.end158:                                        ; preds = %if.end157, %if.then144
  br label %if.end159

if.end159:                                        ; preds = %if.end158, %if.then136
  br label %if.end160

if.end160:                                        ; preds = %if.end159, %if.then128
  %120 = load i8*, i8** %p, align 4
  %add.ptr161 = getelementptr inbounds i8, i8* %120, i32 3
  store i8* %add.ptr161, i8** %p, align 4
  br label %sw.epilog

sw.bb162:                                         ; preds = %if.then20
  %121 = load i32*, i32** %argp.addr, align 4
  %arrayidx163 = getelementptr inbounds i32, i32* %121, i32 0
  %122 = load i32, i32* %arrayidx163, align 4
  %inc164 = add nsw i32 %122, 1
  store i32 %inc164, i32* %arrayidx163, align 4
  %123 = load i32*, i32** %argp.addr, align 4
  %arrayidx165 = getelementptr inbounds i32, i32* %123, i32 1
  %124 = load i32, i32* %arrayidx165, align 4
  %inc166 = add nsw i32 %124, 1
  store i32 %inc166, i32* %arrayidx165, align 4
  br label %sw.epilog

sw.bb167:                                         ; preds = %if.then20
  br label %ordinary

sw.bb168:                                         ; preds = %if.then20
  %125 = load i32*, i32** %argp.addr, align 4
  %arrayidx169 = getelementptr inbounds i32, i32* %125, i32 0
  %126 = load i32, i32* %arrayidx169, align 4
  %xor = xor i32 %126, 96
  store i32 %xor, i32* %arrayidx169, align 4
  %127 = load i32*, i32** %argp.addr, align 4
  %arrayidx170 = getelementptr inbounds i32, i32* %127, i32 1
  %128 = load i32, i32* %arrayidx170, align 4
  %xor171 = xor i32 %128, 96
  store i32 %xor171, i32* %arrayidx170, align 4
  br label %sw.epilog

sw.bb172:                                         ; preds = %if.then20
  %129 = load i32*, i32** %argp.addr, align 4
  %arrayidx173 = getelementptr inbounds i32, i32* %129, i32 0
  %130 = load i32, i32* %arrayidx173, align 4
  %xor174 = xor i32 %130, 127
  store i32 %xor174, i32* %arrayidx173, align 4
  %131 = load i32*, i32** %argp.addr, align 4
  %arrayidx175 = getelementptr inbounds i32, i32* %131, i32 1
  %132 = load i32, i32* %arrayidx175, align 4
  %xor176 = xor i32 %132, 127
  store i32 %xor176, i32* %arrayidx175, align 4
  br label %sw.epilog

sw.bb177:                                         ; preds = %if.then20
  %133 = load i32, i32* %tem, align 4
  %div178 = sdiv i32 %133, 10
  %mul179 = mul nsw i32 6, %div178
  %134 = load i32*, i32** %argp.addr, align 4
  %arrayidx180 = getelementptr inbounds i32, i32* %134, i32 0
  %135 = load i32, i32* %arrayidx180, align 4
  %add181 = add nsw i32 %135, %mul179
  store i32 %add181, i32* %arrayidx180, align 4
  br label %sw.epilog

sw.bb182:                                         ; preds = %if.then20
  %136 = load i32, i32* %tem, align 4
  %rem183 = srem i32 %136, 16
  %mul184 = mul nsw i32 2, %rem183
  %137 = load i32*, i32** %argp.addr, align 4
  %arrayidx185 = getelementptr inbounds i32, i32* %137, i32 0
  %138 = load i32, i32* %arrayidx185, align 4
  %sub186 = sub nsw i32 %138, %mul184
  store i32 %sub186, i32* %arrayidx185, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.then20, %sw.bb182, %sw.bb177, %sw.bb172, %sw.bb168, %sw.bb162, %if.end160, %if.end112, %sw.bb98, %sw.bb96, %sw.bb94, %onedigit
  br label %if.end190

if.else187:                                       ; preds = %if.end17
  br label %ordinary

ordinary:                                         ; preds = %if.else187, %sw.bb167
  %139 = load i32, i32* %c, align 4
  %conv188 = trunc i32 %139 to i8
  %140 = load i8*, i8** %op, align 4
  %incdec.ptr189 = getelementptr inbounds i8, i8* %140, i32 1
  store i8* %incdec.ptr189, i8** %op, align 4
  store i8 %conv188, i8* %140, align 1
  br label %if.end190

if.end190:                                        ; preds = %ordinary, %sw.epilog
  br label %while.body

while.end191:                                     ; preds = %if.then16
  %141 = load i8*, i8** %op, align 4
  store i8 0, i8* %141, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body194, %while.end191
  %142 = load i32, i32* %doup, align 4
  %dec = add nsw i32 %142, -1
  store i32 %dec, i32* %doup, align 4
  %cmp192 = icmp sgt i32 %142, 0
  br i1 %cmp192, label %while.body194, label %while.end196

while.body194:                                    ; preds = %while.cond
  %143 = load i8*, i8** %op, align 4
  %144 = load i8*, i8** %up.addr, align 4
  %call195 = call i8* @strcat(i8* %143, i8* %144)
  br label %while.cond

while.end196:                                     ; preds = %while.cond
  br label %while.cond197

while.cond197:                                    ; preds = %while.body201, %while.end196
  %145 = load i32, i32* %doleft, align 4
  %dec198 = add nsw i32 %145, -1
  store i32 %dec198, i32* %doleft, align 4
  %cmp199 = icmp sgt i32 %145, 0
  br i1 %cmp199, label %while.body201, label %while.end203

while.body201:                                    ; preds = %while.cond197
  %146 = load i8*, i8** %op, align 4
  %147 = load i8*, i8** %left.addr, align 4
  %call202 = call i8* @strcat(i8* %146, i8* %147)
  br label %while.cond197

while.end203:                                     ; preds = %while.cond197
  %148 = load i8*, i8** %outstring.addr, align 4
  ret i8* %148
}

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

declare void @bcopy(i8*, i8*, i32) #1

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

declare i32 @strlen(i8*) #1

declare i8* @strcat(i8*, i8*) #1

declare i8* @malloc(i32) #1

; Function Attrs: noinline nounwind
define internal void @memory_out() #0 {
entry:
  %call = call i32 @write(i32 2, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 25)
  call void @exit(i32 1) #3
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare i32 @write(i32, i8*, i32) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare i8* @realloc(i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
