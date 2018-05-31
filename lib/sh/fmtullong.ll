; ModuleID = 'fmtullong.c'
source_filename = "fmtullong.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [13 x i8] c"invalid base\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"0123456789ABCDEF\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

; Function Attrs: noinline nounwind
define i8* @fmtullong(i64 %ui, i32 %base, i8* %buf, i32 %len, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %ui.addr = alloca i64, align 8
  %base.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca i8*, align 4
  %sign = alloca i32, align 4
  %si = alloca i64, align 8
  store i64 %ui, i64* %ui.addr, align 8
  store i32 %base, i32* %base.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %base.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 10, i32* %base.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %base.addr, align 4
  %cmp1 = icmp slt i32 %1, 2
  br i1 %cmp1, label %if.then3, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i32, i32* %base.addr, align 4
  %cmp2 = icmp sgt i32 %2, 64
  br i1 %cmp2, label %if.then3, label %if.end7

if.then3:                                         ; preds = %lor.lhs.false, %if.end
  %3 = load i8*, i8** %buf.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %4 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %4, 1
  %call4 = call i8* @strncpy(i8* %3, i8* %call, i32 %sub)
  %5 = load i8*, i8** %buf.addr, align 4
  %6 = load i32, i32* %len.addr, align 4
  %sub5 = sub i32 %6, 1
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %sub5
  store i8 0, i8* %arrayidx, align 1
  %call6 = call i32* @__errno_location()
  store i32 22, i32* %call6, align 4
  %7 = load i8*, i8** %buf.addr, align 4
  store i8* %7, i8** %p, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

if.end7:                                          ; preds = %lor.lhs.false
  store i32 0, i32* %sign, align 4
  %8 = load i32, i32* %flags.addr, align 4
  %and = and i32 %8, 8
  %cmp8 = icmp eq i32 %and, 0
  br i1 %cmp8, label %land.lhs.true, label %if.end12

land.lhs.true:                                    ; preds = %if.end7
  %9 = load i64, i64* %ui.addr, align 8
  %cmp9 = icmp slt i64 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i64, i64* %ui.addr, align 8
  %sub11 = sub i64 0, %10
  store i64 %sub11, i64* %ui.addr, align 8
  store i32 45, i32* %sign, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %land.lhs.true, %if.end7
  %11 = load i8*, i8** %buf.addr, align 4
  %12 = load i32, i32* %len.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %12
  %add.ptr13 = getelementptr inbounds i8, i8* %add.ptr, i32 -2
  store i8* %add.ptr13, i8** %p, align 4
  %13 = load i8*, i8** %p, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i32 1
  store i8 0, i8* %arrayidx14, align 1
  %14 = load i32, i32* %base.addr, align 4
  switch i32 %14, label %sw.default [
    i32 10, label %sw.bb
    i32 8, label %sw.bb30
    i32 16, label %sw.bb39
    i32 2, label %sw.bb56
  ]

sw.bb:                                            ; preds = %if.end12
  %15 = load i64, i64* %ui.addr, align 8
  %cmp15 = icmp ult i64 %15, 10
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %sw.bb
  %16 = load i64, i64* %ui.addr, align 8
  %add = add i64 %16, 48
  %conv = trunc i64 %add to i8
  %17 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 -1
  store i8* %incdec.ptr, i8** %p, align 4
  store i8 %conv, i8* %17, align 1
  br label %sw.epilog

if.end17:                                         ; preds = %sw.bb
  %18 = load i64, i64* %ui.addr, align 8
  %cmp18 = icmp slt i64 %18, 0
  br i1 %cmp18, label %if.then20, label %if.else

if.then20:                                        ; preds = %if.end17
  %19 = load i64, i64* %ui.addr, align 8
  %rem = urem i64 %19, 10
  %add21 = add i64 %rem, 48
  %conv22 = trunc i64 %add21 to i8
  %20 = load i8*, i8** %p, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %20, i32 -1
  store i8* %incdec.ptr23, i8** %p, align 4
  store i8 %conv22, i8* %20, align 1
  %21 = load i64, i64* %ui.addr, align 8
  %div = udiv i64 %21, 10
  store i64 %div, i64* %si, align 8
  br label %if.end24

if.else:                                          ; preds = %if.end17
  %22 = load i64, i64* %ui.addr, align 8
  store i64 %22, i64* %si, align 8
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then20
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end24
  %23 = load i64, i64* %si, align 8
  %rem25 = srem i64 %23, 10
  %add26 = add nsw i64 %rem25, 48
  %conv27 = trunc i64 %add26 to i8
  %24 = load i8*, i8** %p, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %24, i32 -1
  store i8* %incdec.ptr28, i8** %p, align 4
  store i8 %conv27, i8* %24, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %25 = load i64, i64* %si, align 8
  %div29 = sdiv i64 %25, 10
  store i64 %div29, i64* %si, align 8
  %tobool = icmp ne i64 %div29, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.bb30:                                          ; preds = %if.end12
  br label %do.body31

do.body31:                                        ; preds = %do.cond36, %sw.bb30
  %26 = load i64, i64* %ui.addr, align 8
  %and32 = and i64 %26, 7
  %add33 = add i64 %and32, 48
  %conv34 = trunc i64 %add33 to i8
  %27 = load i8*, i8** %p, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %27, i32 -1
  store i8* %incdec.ptr35, i8** %p, align 4
  store i8 %conv34, i8* %27, align 1
  br label %do.cond36

do.cond36:                                        ; preds = %do.body31
  %28 = load i64, i64* %ui.addr, align 8
  %shr = lshr i64 %28, 3
  store i64 %shr, i64* %ui.addr, align 8
  %tobool37 = icmp ne i64 %shr, 0
  br i1 %tobool37, label %do.body31, label %do.end38

do.end38:                                         ; preds = %do.cond36
  br label %sw.epilog

sw.bb39:                                          ; preds = %if.end12
  br label %do.body40

do.body40:                                        ; preds = %do.cond52, %sw.bb39
  %29 = load i32, i32* %flags.addr, align 4
  %and41 = and i32 %29, 4
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.body40
  %30 = load i64, i64* %ui.addr, align 8
  %and43 = and i64 %30, 15
  %idxprom = trunc i64 %and43 to i32
  %arrayidx44 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.1, i32 0, i32 %idxprom
  %31 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %31 to i32
  br label %cond.end

cond.false:                                       ; preds = %do.body40
  %32 = load i64, i64* %ui.addr, align 8
  %and46 = and i64 %32, 15
  %idxprom47 = trunc i64 %and46 to i32
  %arrayidx48 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.2, i32 0, i32 %idxprom47
  %33 = load i8, i8* %arrayidx48, align 1
  %conv49 = sext i8 %33 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv45, %cond.true ], [ %conv49, %cond.false ]
  %conv50 = trunc i32 %cond to i8
  %34 = load i8*, i8** %p, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %34, i32 -1
  store i8* %incdec.ptr51, i8** %p, align 4
  store i8 %conv50, i8* %34, align 1
  br label %do.cond52

do.cond52:                                        ; preds = %cond.end
  %35 = load i64, i64* %ui.addr, align 8
  %shr53 = lshr i64 %35, 4
  store i64 %shr53, i64* %ui.addr, align 8
  %tobool54 = icmp ne i64 %shr53, 0
  br i1 %tobool54, label %do.body40, label %do.end55

do.end55:                                         ; preds = %do.cond52
  br label %sw.epilog

sw.bb56:                                          ; preds = %if.end12
  br label %do.body57

do.body57:                                        ; preds = %do.cond62, %sw.bb56
  %36 = load i64, i64* %ui.addr, align 8
  %and58 = and i64 %36, 1
  %add59 = add i64 %and58, 48
  %conv60 = trunc i64 %add59 to i8
  %37 = load i8*, i8** %p, align 4
  %incdec.ptr61 = getelementptr inbounds i8, i8* %37, i32 -1
  store i8* %incdec.ptr61, i8** %p, align 4
  store i8 %conv60, i8* %37, align 1
  br label %do.cond62

do.cond62:                                        ; preds = %do.body57
  %38 = load i64, i64* %ui.addr, align 8
  %shr63 = lshr i64 %38, 1
  store i64 %shr63, i64* %ui.addr, align 8
  %tobool64 = icmp ne i64 %shr63, 0
  br i1 %tobool64, label %do.body57, label %do.end65

do.end65:                                         ; preds = %do.cond62
  br label %sw.epilog

sw.default:                                       ; preds = %if.end12
  br label %do.body66

do.body66:                                        ; preds = %do.cond110, %sw.default
  %39 = load i64, i64* %ui.addr, align 8
  %40 = load i32, i32* %base.addr, align 4
  %conv67 = sext i32 %40 to i64
  %rem68 = urem i64 %39, %conv67
  %cmp69 = icmp ult i64 %rem68, 10
  br i1 %cmp69, label %cond.true71, label %cond.false75

cond.true71:                                      ; preds = %do.body66
  %41 = load i64, i64* %ui.addr, align 8
  %42 = load i32, i32* %base.addr, align 4
  %conv72 = sext i32 %42 to i64
  %rem73 = urem i64 %41, %conv72
  %add74 = add i64 %rem73, 48
  br label %cond.end106

cond.false75:                                     ; preds = %do.body66
  %43 = load i64, i64* %ui.addr, align 8
  %44 = load i32, i32* %base.addr, align 4
  %conv76 = sext i32 %44 to i64
  %rem77 = urem i64 %43, %conv76
  %cmp78 = icmp ult i64 %rem77, 36
  br i1 %cmp78, label %cond.true80, label %cond.false85

cond.true80:                                      ; preds = %cond.false75
  %45 = load i64, i64* %ui.addr, align 8
  %46 = load i32, i32* %base.addr, align 4
  %conv81 = sext i32 %46 to i64
  %rem82 = urem i64 %45, %conv81
  %sub83 = sub i64 %rem82, 10
  %add84 = add i64 %sub83, 97
  br label %cond.end104

cond.false85:                                     ; preds = %cond.false75
  %47 = load i64, i64* %ui.addr, align 8
  %48 = load i32, i32* %base.addr, align 4
  %conv86 = sext i32 %48 to i64
  %rem87 = urem i64 %47, %conv86
  %cmp88 = icmp ult i64 %rem87, 62
  br i1 %cmp88, label %cond.true90, label %cond.false95

cond.true90:                                      ; preds = %cond.false85
  %49 = load i64, i64* %ui.addr, align 8
  %50 = load i32, i32* %base.addr, align 4
  %conv91 = sext i32 %50 to i64
  %rem92 = urem i64 %49, %conv91
  %sub93 = sub i64 %rem92, 36
  %add94 = add i64 %sub93, 65
  br label %cond.end102

cond.false95:                                     ; preds = %cond.false85
  %51 = load i64, i64* %ui.addr, align 8
  %52 = load i32, i32* %base.addr, align 4
  %conv96 = sext i32 %52 to i64
  %rem97 = urem i64 %51, %conv96
  %cmp98 = icmp eq i64 %rem97, 62
  %cond100 = select i1 %cmp98, i32 64, i32 95
  %conv101 = sext i32 %cond100 to i64
  br label %cond.end102

cond.end102:                                      ; preds = %cond.false95, %cond.true90
  %cond103 = phi i64 [ %add94, %cond.true90 ], [ %conv101, %cond.false95 ]
  br label %cond.end104

cond.end104:                                      ; preds = %cond.end102, %cond.true80
  %cond105 = phi i64 [ %add84, %cond.true80 ], [ %cond103, %cond.end102 ]
  br label %cond.end106

cond.end106:                                      ; preds = %cond.end104, %cond.true71
  %cond107 = phi i64 [ %add74, %cond.true71 ], [ %cond105, %cond.end104 ]
  %conv108 = trunc i64 %cond107 to i8
  %53 = load i8*, i8** %p, align 4
  %incdec.ptr109 = getelementptr inbounds i8, i8* %53, i32 -1
  store i8* %incdec.ptr109, i8** %p, align 4
  store i8 %conv108, i8* %53, align 1
  br label %do.cond110

do.cond110:                                       ; preds = %cond.end106
  %54 = load i32, i32* %base.addr, align 4
  %conv111 = sext i32 %54 to i64
  %55 = load i64, i64* %ui.addr, align 8
  %div112 = udiv i64 %55, %conv111
  store i64 %div112, i64* %ui.addr, align 8
  %tobool113 = icmp ne i64 %div112, 0
  br i1 %tobool113, label %do.body66, label %do.end114

do.end114:                                        ; preds = %do.cond110
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end114, %do.end65, %do.end55, %do.end38, %do.end, %if.then16
  %56 = load i32, i32* %flags.addr, align 4
  %and115 = and i32 %56, 1
  %tobool116 = icmp ne i32 %and115, 0
  br i1 %tobool116, label %land.lhs.true117, label %if.else142

land.lhs.true117:                                 ; preds = %sw.epilog
  %57 = load i32, i32* %base.addr, align 4
  %cmp118 = icmp eq i32 %57, 8
  br i1 %cmp118, label %if.then123, label %lor.lhs.false120

lor.lhs.false120:                                 ; preds = %land.lhs.true117
  %58 = load i32, i32* %base.addr, align 4
  %cmp121 = icmp eq i32 %58, 16
  br i1 %cmp121, label %if.then123, label %if.else142

if.then123:                                       ; preds = %lor.lhs.false120, %land.lhs.true117
  %59 = load i32, i32* %base.addr, align 4
  %cmp124 = icmp eq i32 %59, 16
  br i1 %cmp124, label %if.then126, label %if.else133

if.then126:                                       ; preds = %if.then123
  %60 = load i32, i32* %flags.addr, align 4
  %and127 = and i32 %60, 4
  %tobool128 = icmp ne i32 %and127, 0
  %cond129 = select i1 %tobool128, i32 88, i32 120
  %conv130 = trunc i32 %cond129 to i8
  %61 = load i8*, i8** %p, align 4
  %incdec.ptr131 = getelementptr inbounds i8, i8* %61, i32 -1
  store i8* %incdec.ptr131, i8** %p, align 4
  store i8 %conv130, i8* %61, align 1
  %62 = load i8*, i8** %p, align 4
  %incdec.ptr132 = getelementptr inbounds i8, i8* %62, i32 -1
  store i8* %incdec.ptr132, i8** %p, align 4
  store i8 48, i8* %62, align 1
  br label %if.end141

if.else133:                                       ; preds = %if.then123
  %63 = load i8*, i8** %p, align 4
  %arrayidx134 = getelementptr inbounds i8, i8* %63, i32 1
  %64 = load i8, i8* %arrayidx134, align 1
  %conv135 = sext i8 %64 to i32
  %cmp136 = icmp ne i32 %conv135, 48
  br i1 %cmp136, label %if.then138, label %if.end140

if.then138:                                       ; preds = %if.else133
  %65 = load i8*, i8** %p, align 4
  %incdec.ptr139 = getelementptr inbounds i8, i8* %65, i32 -1
  store i8* %incdec.ptr139, i8** %p, align 4
  store i8 48, i8* %65, align 1
  br label %if.end140

if.end140:                                        ; preds = %if.then138, %if.else133
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.then126
  br label %if.end163

if.else142:                                       ; preds = %lor.lhs.false120, %sw.epilog
  %66 = load i32, i32* %flags.addr, align 4
  %and143 = and i32 %66, 2
  %tobool144 = icmp ne i32 %and143, 0
  br i1 %tobool144, label %land.lhs.true145, label %if.end162

land.lhs.true145:                                 ; preds = %if.else142
  %67 = load i32, i32* %base.addr, align 4
  %cmp146 = icmp ne i32 %67, 10
  br i1 %cmp146, label %if.then148, label %if.end162

if.then148:                                       ; preds = %land.lhs.true145
  %68 = load i8*, i8** %p, align 4
  %incdec.ptr149 = getelementptr inbounds i8, i8* %68, i32 -1
  store i8* %incdec.ptr149, i8** %p, align 4
  store i8 35, i8* %68, align 1
  %69 = load i32, i32* %base.addr, align 4
  %rem150 = srem i32 %69, 10
  %add151 = add nsw i32 %rem150, 48
  %conv152 = trunc i32 %add151 to i8
  %70 = load i8*, i8** %p, align 4
  %incdec.ptr153 = getelementptr inbounds i8, i8* %70, i32 -1
  store i8* %incdec.ptr153, i8** %p, align 4
  store i8 %conv152, i8* %70, align 1
  %71 = load i32, i32* %base.addr, align 4
  %cmp154 = icmp sgt i32 %71, 10
  br i1 %cmp154, label %if.then156, label %if.end161

if.then156:                                       ; preds = %if.then148
  %72 = load i32, i32* %base.addr, align 4
  %div157 = sdiv i32 %72, 10
  %add158 = add nsw i32 %div157, 48
  %conv159 = trunc i32 %add158 to i8
  %73 = load i8*, i8** %p, align 4
  %incdec.ptr160 = getelementptr inbounds i8, i8* %73, i32 -1
  store i8* %incdec.ptr160, i8** %p, align 4
  store i8 %conv159, i8* %73, align 1
  br label %if.end161

if.end161:                                        ; preds = %if.then156, %if.then148
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %land.lhs.true145, %if.else142
  br label %if.end163

if.end163:                                        ; preds = %if.end162, %if.end141
  %74 = load i32, i32* %sign, align 4
  %tobool164 = icmp ne i32 %74, 0
  br i1 %tobool164, label %if.then165, label %if.end167

if.then165:                                       ; preds = %if.end163
  %75 = load i8*, i8** %p, align 4
  %incdec.ptr166 = getelementptr inbounds i8, i8* %75, i32 -1
  store i8* %incdec.ptr166, i8** %p, align 4
  store i8 45, i8* %75, align 1
  br label %if.end167

if.end167:                                        ; preds = %if.then165, %if.end163
  %76 = load i8*, i8** %p, align 4
  %add.ptr168 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %add.ptr168, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end167, %if.then3
  %77 = load i8*, i8** %retval, align 4
  ret i8* %77
}

declare i8* @strncpy(i8*, i8*, i32) #1

declare i8* @libintl_gettext(i8*) #1

declare i32* @__errno_location() #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
