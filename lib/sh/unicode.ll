; ModuleID = 'unicode.c'
source_filename = "unicode.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@u32init = internal global i32 0, align 4
@localconv = internal global i8* null, align 4
@utf8locale = internal global i32 0, align 4
@.str = private unnamed_addr constant [7 x i8] c"\5Cu%04X\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"\5Cu%08X\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"ASCII\00", align 1

; Function Attrs: noinline nounwind
define void @u32reset() #0 {
entry:
  %0 = load i32, i32* @u32init, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** @localconv, align 4
  %cmp = icmp ne i8* %1, inttoptr (i32 -1 to i8*)
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8*, i8** @localconv, align 4
  %call = call i32 @iconv_close(i8* %2)
  store i8* inttoptr (i32 -1 to i8*), i8** @localconv, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  store i32 0, i32* @u32init, align 4
  store i32 0, i32* @utf8locale, align 4
  ret void
}

declare i32 @iconv_close(i8*) #1

; Function Attrs: noinline nounwind
define i32 @u32tochar(i32 %x, i8* %s) #0 {
entry:
  %x.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %l = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp ule i32 %0, 255
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4
  %cmp1 = icmp ule i32 %1, 65535
  %cond = select i1 %cmp1, i32 2, i32 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond2 = phi i32 [ 1, %cond.true ], [ %cond, %cond.false ]
  store i32 %cond2, i32* %l, align 4
  %2 = load i32, i32* %x.addr, align 4
  %cmp3 = icmp ule i32 %2, 255
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  %3 = load i32, i32* %x.addr, align 4
  %and = and i32 %3, 255
  %conv = trunc i32 %and to i8
  %4 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  br label %if.end29

if.else:                                          ; preds = %cond.end
  %5 = load i32, i32* %x.addr, align 4
  %cmp4 = icmp ule i32 %5, 65535
  br i1 %cmp4, label %if.then6, label %if.else13

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %x.addr, align 4
  %shr = lshr i32 %6, 8
  %and7 = and i32 %shr, 255
  %conv8 = trunc i32 %and7 to i8
  %7 = load i8*, i8** %s.addr, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i32 0
  store i8 %conv8, i8* %arrayidx9, align 1
  %8 = load i32, i32* %x.addr, align 4
  %and10 = and i32 %8, 255
  %conv11 = trunc i32 %and10 to i8
  %9 = load i8*, i8** %s.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %9, i32 1
  store i8 %conv11, i8* %arrayidx12, align 1
  br label %if.end

if.else13:                                        ; preds = %if.else
  %10 = load i32, i32* %x.addr, align 4
  %shr14 = lshr i32 %10, 24
  %and15 = and i32 %shr14, 255
  %conv16 = trunc i32 %and15 to i8
  %11 = load i8*, i8** %s.addr, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %11, i32 0
  store i8 %conv16, i8* %arrayidx17, align 1
  %12 = load i32, i32* %x.addr, align 4
  %shr18 = lshr i32 %12, 16
  %and19 = and i32 %shr18, 255
  %conv20 = trunc i32 %and19 to i8
  %13 = load i8*, i8** %s.addr, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %13, i32 1
  store i8 %conv20, i8* %arrayidx21, align 1
  %14 = load i32, i32* %x.addr, align 4
  %shr22 = lshr i32 %14, 8
  %and23 = and i32 %shr22, 255
  %conv24 = trunc i32 %and23 to i8
  %15 = load i8*, i8** %s.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %15, i32 2
  store i8 %conv24, i8* %arrayidx25, align 1
  %16 = load i32, i32* %x.addr, align 4
  %and26 = and i32 %16, 255
  %conv27 = trunc i32 %and26 to i8
  %17 = load i8*, i8** %s.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %17, i32 3
  store i8 %conv27, i8* %arrayidx28, align 1
  br label %if.end

if.end:                                           ; preds = %if.else13, %if.then6
  br label %if.end29

if.end29:                                         ; preds = %if.end, %if.then
  %18 = load i8*, i8** %s.addr, align 4
  %19 = load i32, i32* %l, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %18, i32 %19
  store i8 0, i8* %arrayidx30, align 1
  %20 = load i32, i32* %l, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind
define i32 @u32tocesc(i32 %wc, i8* %s) #0 {
entry:
  %wc.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %l = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  %cmp = icmp ult i32 %0, 65536
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i32, i32* %wc.addr, align 4
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %2)
  store i32 %call, i32* %l, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i32, i32* %wc.addr, align 4
  %call1 = call i32 (i8*, i8*, ...) @sprintf(i8* %3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i32 %4)
  store i32 %call1, i32* %l, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %l, align 4
  ret i32 %5
}

declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: noinline nounwind
define i32 @u32toutf8(i32 %wc, i8* %s) #0 {
entry:
  %wc.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %l = alloca i32, align 4
  store i32 %wc, i32* %wc.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i32, i32* %wc.addr, align 4
  %cmp = icmp ult i32 %0, 128
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %wc.addr, align 4
  %conv = trunc i32 %1 to i8
  %2 = load i8*, i8** %s.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 0
  store i8 %conv, i8* %arrayidx, align 1
  store i32 1, i32* %l, align 4
  br label %if.end112

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %wc.addr, align 4
  %cmp1 = icmp ult i32 %3, 2048
  br i1 %cmp1, label %if.then3, label %if.else9

if.then3:                                         ; preds = %if.else
  %4 = load i32, i32* %wc.addr, align 4
  %shr = lshr i32 %4, 6
  %or = or i32 %shr, 192
  %conv4 = trunc i32 %or to i8
  %5 = load i8*, i8** %s.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %5, i32 0
  store i8 %conv4, i8* %arrayidx5, align 1
  %6 = load i32, i32* %wc.addr, align 4
  %and = and i32 %6, 63
  %or6 = or i32 %and, 128
  %conv7 = trunc i32 %or6 to i8
  %7 = load i8*, i8** %s.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %7, i32 1
  store i8 %conv7, i8* %arrayidx8, align 1
  store i32 2, i32* %l, align 4
  br label %if.end111

if.else9:                                         ; preds = %if.else
  %8 = load i32, i32* %wc.addr, align 4
  %cmp10 = icmp ult i32 %8, 65536
  br i1 %cmp10, label %if.then12, label %if.else26

if.then12:                                        ; preds = %if.else9
  %9 = load i32, i32* %wc.addr, align 4
  %shr13 = lshr i32 %9, 12
  %or14 = or i32 %shr13, 224
  %conv15 = trunc i32 %or14 to i8
  %10 = load i8*, i8** %s.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %10, i32 0
  store i8 %conv15, i8* %arrayidx16, align 1
  %11 = load i32, i32* %wc.addr, align 4
  %shr17 = lshr i32 %11, 6
  %and18 = and i32 %shr17, 63
  %or19 = or i32 %and18, 128
  %conv20 = trunc i32 %or19 to i8
  %12 = load i8*, i8** %s.addr, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %12, i32 1
  store i8 %conv20, i8* %arrayidx21, align 1
  %13 = load i32, i32* %wc.addr, align 4
  %and22 = and i32 %13, 63
  %or23 = or i32 %and22, 128
  %conv24 = trunc i32 %or23 to i8
  %14 = load i8*, i8** %s.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %14, i32 2
  store i8 %conv24, i8* %arrayidx25, align 1
  store i32 3, i32* %l, align 4
  br label %if.end110

if.else26:                                        ; preds = %if.else9
  %15 = load i32, i32* %wc.addr, align 4
  %cmp27 = icmp ult i32 %15, 2097152
  br i1 %cmp27, label %if.then29, label %if.else48

if.then29:                                        ; preds = %if.else26
  %16 = load i32, i32* %wc.addr, align 4
  %shr30 = lshr i32 %16, 18
  %or31 = or i32 %shr30, 240
  %conv32 = trunc i32 %or31 to i8
  %17 = load i8*, i8** %s.addr, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %17, i32 0
  store i8 %conv32, i8* %arrayidx33, align 1
  %18 = load i32, i32* %wc.addr, align 4
  %shr34 = lshr i32 %18, 12
  %and35 = and i32 %shr34, 63
  %or36 = or i32 %and35, 128
  %conv37 = trunc i32 %or36 to i8
  %19 = load i8*, i8** %s.addr, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %19, i32 1
  store i8 %conv37, i8* %arrayidx38, align 1
  %20 = load i32, i32* %wc.addr, align 4
  %shr39 = lshr i32 %20, 6
  %and40 = and i32 %shr39, 63
  %or41 = or i32 %and40, 128
  %conv42 = trunc i32 %or41 to i8
  %21 = load i8*, i8** %s.addr, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %21, i32 2
  store i8 %conv42, i8* %arrayidx43, align 1
  %22 = load i32, i32* %wc.addr, align 4
  %and44 = and i32 %22, 63
  %or45 = or i32 %and44, 128
  %conv46 = trunc i32 %or45 to i8
  %23 = load i8*, i8** %s.addr, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %23, i32 3
  store i8 %conv46, i8* %arrayidx47, align 1
  store i32 4, i32* %l, align 4
  br label %if.end109

if.else48:                                        ; preds = %if.else26
  %24 = load i32, i32* %wc.addr, align 4
  %cmp49 = icmp ult i32 %24, 67108864
  br i1 %cmp49, label %if.then51, label %if.else75

if.then51:                                        ; preds = %if.else48
  %25 = load i32, i32* %wc.addr, align 4
  %shr52 = lshr i32 %25, 24
  %or53 = or i32 %shr52, 248
  %conv54 = trunc i32 %or53 to i8
  %26 = load i8*, i8** %s.addr, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %26, i32 0
  store i8 %conv54, i8* %arrayidx55, align 1
  %27 = load i32, i32* %wc.addr, align 4
  %shr56 = lshr i32 %27, 18
  %and57 = and i32 %shr56, 63
  %or58 = or i32 %and57, 128
  %conv59 = trunc i32 %or58 to i8
  %28 = load i8*, i8** %s.addr, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %28, i32 1
  store i8 %conv59, i8* %arrayidx60, align 1
  %29 = load i32, i32* %wc.addr, align 4
  %shr61 = lshr i32 %29, 12
  %and62 = and i32 %shr61, 63
  %or63 = or i32 %and62, 128
  %conv64 = trunc i32 %or63 to i8
  %30 = load i8*, i8** %s.addr, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %30, i32 2
  store i8 %conv64, i8* %arrayidx65, align 1
  %31 = load i32, i32* %wc.addr, align 4
  %shr66 = lshr i32 %31, 6
  %and67 = and i32 %shr66, 63
  %or68 = or i32 %and67, 128
  %conv69 = trunc i32 %or68 to i8
  %32 = load i8*, i8** %s.addr, align 4
  %arrayidx70 = getelementptr inbounds i8, i8* %32, i32 3
  store i8 %conv69, i8* %arrayidx70, align 1
  %33 = load i32, i32* %wc.addr, align 4
  %and71 = and i32 %33, 63
  %or72 = or i32 %and71, 128
  %conv73 = trunc i32 %or72 to i8
  %34 = load i8*, i8** %s.addr, align 4
  %arrayidx74 = getelementptr inbounds i8, i8* %34, i32 4
  store i8 %conv73, i8* %arrayidx74, align 1
  store i32 5, i32* %l, align 4
  br label %if.end108

if.else75:                                        ; preds = %if.else48
  %35 = load i32, i32* %wc.addr, align 4
  %cmp76 = icmp ult i32 %35, -2147483648
  br i1 %cmp76, label %if.then78, label %if.else107

if.then78:                                        ; preds = %if.else75
  %36 = load i32, i32* %wc.addr, align 4
  %shr79 = lshr i32 %36, 30
  %or80 = or i32 %shr79, 248
  %conv81 = trunc i32 %or80 to i8
  %37 = load i8*, i8** %s.addr, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %37, i32 0
  store i8 %conv81, i8* %arrayidx82, align 1
  %38 = load i32, i32* %wc.addr, align 4
  %shr83 = lshr i32 %38, 24
  %and84 = and i32 %shr83, 63
  %or85 = or i32 %and84, 128
  %conv86 = trunc i32 %or85 to i8
  %39 = load i8*, i8** %s.addr, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %39, i32 1
  store i8 %conv86, i8* %arrayidx87, align 1
  %40 = load i32, i32* %wc.addr, align 4
  %shr88 = lshr i32 %40, 18
  %and89 = and i32 %shr88, 63
  %or90 = or i32 %and89, 128
  %conv91 = trunc i32 %or90 to i8
  %41 = load i8*, i8** %s.addr, align 4
  %arrayidx92 = getelementptr inbounds i8, i8* %41, i32 2
  store i8 %conv91, i8* %arrayidx92, align 1
  %42 = load i32, i32* %wc.addr, align 4
  %shr93 = lshr i32 %42, 12
  %and94 = and i32 %shr93, 63
  %or95 = or i32 %and94, 128
  %conv96 = trunc i32 %or95 to i8
  %43 = load i8*, i8** %s.addr, align 4
  %arrayidx97 = getelementptr inbounds i8, i8* %43, i32 3
  store i8 %conv96, i8* %arrayidx97, align 1
  %44 = load i32, i32* %wc.addr, align 4
  %shr98 = lshr i32 %44, 6
  %and99 = and i32 %shr98, 63
  %or100 = or i32 %and99, 128
  %conv101 = trunc i32 %or100 to i8
  %45 = load i8*, i8** %s.addr, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %45, i32 4
  store i8 %conv101, i8* %arrayidx102, align 1
  %46 = load i32, i32* %wc.addr, align 4
  %and103 = and i32 %46, 63
  %or104 = or i32 %and103, 128
  %conv105 = trunc i32 %or104 to i8
  %47 = load i8*, i8** %s.addr, align 4
  %arrayidx106 = getelementptr inbounds i8, i8* %47, i32 5
  store i8 %conv105, i8* %arrayidx106, align 1
  store i32 6, i32* %l, align 4
  br label %if.end

if.else107:                                       ; preds = %if.else75
  store i32 0, i32* %l, align 4
  br label %if.end

if.end:                                           ; preds = %if.else107, %if.then78
  br label %if.end108

if.end108:                                        ; preds = %if.end, %if.then51
  br label %if.end109

if.end109:                                        ; preds = %if.end108, %if.then29
  br label %if.end110

if.end110:                                        ; preds = %if.end109, %if.then12
  br label %if.end111

if.end111:                                        ; preds = %if.end110, %if.then3
  br label %if.end112

if.end112:                                        ; preds = %if.end111, %if.then
  %48 = load i8*, i8** %s.addr, align 4
  %49 = load i32, i32* %l, align 4
  %arrayidx113 = getelementptr inbounds i8, i8* %48, i32 %49
  store i8 0, i8* %arrayidx113, align 1
  %50 = load i32, i32* %l, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind
define i32 @u32toutf16(i32 %c, i16* %s) #0 {
entry:
  %c.addr = alloca i32, align 4
  %s.addr = alloca i16*, align 4
  %l = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i16* %s, i16** %s.addr, align 4
  store i32 0, i32* %l, align 4
  %0 = load i32, i32* %c.addr, align 4
  %cmp = icmp ult i32 %0, 55296
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %c.addr, align 4
  %and = and i32 %1, 65535
  %conv = trunc i32 %and to i16
  %2 = load i16*, i16** %s.addr, align 4
  %arrayidx = getelementptr inbounds i16, i16* %2, i32 0
  store i16 %conv, i16* %arrayidx, align 2
  store i32 1, i32* %l, align 4
  br label %if.end12

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %c.addr, align 4
  %cmp1 = icmp uge i32 %3, 57344
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.else
  %4 = load i32, i32* %c.addr, align 4
  %cmp3 = icmp ule i32 %4, 1114111
  br i1 %cmp3, label %if.then5, label %if.end

if.then5:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %c.addr, align 4
  %sub = sub i32 %5, 65536
  store i32 %sub, i32* %c.addr, align 4
  %6 = load i32, i32* %c.addr, align 4
  %shr = lshr i32 %6, 10
  %add = add i32 %shr, 55296
  %conv6 = trunc i32 %add to i16
  %7 = load i16*, i16** %s.addr, align 4
  %arrayidx7 = getelementptr inbounds i16, i16* %7, i32 0
  store i16 %conv6, i16* %arrayidx7, align 2
  %8 = load i32, i32* %c.addr, align 4
  %and8 = and i32 %8, 1023
  %add9 = add i32 %and8, 56320
  %conv10 = trunc i32 %add9 to i16
  %9 = load i16*, i16** %s.addr, align 4
  %arrayidx11 = getelementptr inbounds i16, i16* %9, i32 1
  store i16 %conv10, i16* %arrayidx11, align 2
  store i32 2, i32* %l, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %land.lhs.true, %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  %10 = load i16*, i16** %s.addr, align 4
  %11 = load i32, i32* %l, align 4
  %arrayidx13 = getelementptr inbounds i16, i16* %10, i32 %11
  store i16 0, i16* %arrayidx13, align 2
  %12 = load i32, i32* %l, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind
define i32 @u32cconv(i32 %c, i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %wc = alloca i32, align 4
  %ws = alloca [3 x i32], align 4
  %n = alloca i32, align 4
  %charset = alloca i8*, align 4
  %obuf = alloca [25 x i8], align 1
  %optr = alloca i8*, align 4
  %obytesleft = alloca i32, align 4
  %iptr = alloca i8*, align 4
  %sn = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i32, i32* @u32init, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end14

if.then:                                          ; preds = %entry
  %call = call i8* @locale_charset()
  store i8* %call, i8** %charset, align 4
  %1 = load i8*, i8** %charset, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv1 = sext i8 %3 to i32
  %cmp2 = icmp eq i32 %conv, %conv1
  br i1 %cmp2, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %4 = load i8*, i8** %charset, align 4
  %call4 = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then7, label %if.else

if.then7:                                         ; preds = %land.lhs.true
  store i32 1, i32* @utf8locale, align 4
  br label %if.end13

if.else:                                          ; preds = %land.lhs.true, %if.then
  %5 = load i8*, i8** %charset, align 4
  %call8 = call i8* @iconv_open(i8* %5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call8, i8** @localconv, align 4
  %6 = load i8*, i8** @localconv, align 4
  %cmp9 = icmp eq i8* %6, inttoptr (i32 -1 to i8*)
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.else
  %call12 = call i8* @iconv_open(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call12, i8** @localconv, align 4
  br label %if.end

if.end:                                           ; preds = %if.then11, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then7
  store i32 1, i32* @u32init, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %entry
  %7 = load i32, i32* %c.addr, align 4
  %8 = load i8*, i8** %s.addr, align 4
  %call15 = call i32 @u32toutf8(i32 %7, i8* %8)
  store i32 %call15, i32* %n, align 4
  %9 = load i32, i32* @utf8locale, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end14
  %10 = load i32, i32* %n, align 4
  store i32 %10, i32* %retval, align 4
  br label %return

if.end17:                                         ; preds = %if.end14
  %11 = load i8*, i8** @localconv, align 4
  %cmp18 = icmp eq i8* %11, inttoptr (i32 -1 to i8*)
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end17
  %12 = load i32, i32* %n, align 4
  store i32 %12, i32* %retval, align 4
  br label %return

if.end21:                                         ; preds = %if.end17
  %arraydecay = getelementptr inbounds [25 x i8], [25 x i8]* %obuf, i32 0, i32 0
  store i8* %arraydecay, i8** %optr, align 4
  store i32 25, i32* %obytesleft, align 4
  %13 = load i8*, i8** %s.addr, align 4
  store i8* %13, i8** %iptr, align 4
  %14 = load i32, i32* %n, align 4
  store i32 %14, i32* %sn, align 4
  %15 = load i8*, i8** @localconv, align 4
  %call22 = call i32 @iconv(i8* %15, i8** null, i32* null, i8** null, i32* null)
  %16 = load i8*, i8** @localconv, align 4
  %call23 = call i32 @iconv(i8* %16, i8** %iptr, i32* %sn, i8** %optr, i32* %obytesleft)
  %cmp24 = icmp eq i32 %call23, -1
  br i1 %cmp24, label %if.then26, label %if.end28

if.then26:                                        ; preds = %if.end21
  %17 = load i32, i32* %c.addr, align 4
  %18 = load i8*, i8** %s.addr, align 4
  %call27 = call i32 @u32tocesc(i32 %17, i8* %18)
  store i32 %call27, i32* %n, align 4
  %19 = load i32, i32* %n, align 4
  store i32 %19, i32* %retval, align 4
  br label %return

if.end28:                                         ; preds = %if.end21
  %20 = load i8*, i8** %optr, align 4
  store i8 0, i8* %20, align 1
  %21 = load i8*, i8** %s.addr, align 4
  %arraydecay29 = getelementptr inbounds [25 x i8], [25 x i8]* %obuf, i32 0, i32 0
  %call30 = call i8* @strcpy(i8* %21, i8* %arraydecay29)
  %22 = load i8*, i8** %optr, align 4
  %arraydecay31 = getelementptr inbounds [25 x i8], [25 x i8]* %obuf, i32 0, i32 0
  %sub.ptr.lhs.cast = ptrtoint i8* %22 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %arraydecay31 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end28, %if.then26, %if.then20, %if.then16
  %23 = load i32, i32* %retval, align 4
  ret i32 %23
}

declare i8* @locale_charset() #1

declare i32 @strcmp(i8*, i8*) #1

declare i8* @iconv_open(i8*, i8*) #1

declare i32 @iconv(i8*, i8**, i32*, i8**, i32*) #1

declare i8* @strcpy(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
