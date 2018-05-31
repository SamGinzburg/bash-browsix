; ModuleID = 'fmtulong.c'
source_filename = "fmtulong.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [13 x i8] c"invalid base\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"0123456789ABCDEF\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"0123456789abcdef\00", align 1

; Function Attrs: noinline nounwind
define i8* @fmtulong(i32 %ui, i32 %base, i8* %buf, i32 %len, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %ui.addr = alloca i32, align 4
  %base.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %p = alloca i8*, align 4
  %sign = alloca i32, align 4
  %si = alloca i32, align 4
  store i32 %ui, i32* %ui.addr, align 4
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
  %9 = load i32, i32* %ui.addr, align 4
  %cmp9 = icmp slt i32 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end12

if.then10:                                        ; preds = %land.lhs.true
  %10 = load i32, i32* %ui.addr, align 4
  %sub11 = sub i32 0, %10
  store i32 %sub11, i32* %ui.addr, align 4
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
    i32 2, label %sw.bb55
  ]

sw.bb:                                            ; preds = %if.end12
  %15 = load i32, i32* %ui.addr, align 4
  %cmp15 = icmp ult i32 %15, 10
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %sw.bb
  %16 = load i32, i32* %ui.addr, align 4
  %add = add i32 %16, 48
  %conv = trunc i32 %add to i8
  %17 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 -1
  store i8* %incdec.ptr, i8** %p, align 4
  store i8 %conv, i8* %17, align 1
  br label %sw.epilog

if.end17:                                         ; preds = %sw.bb
  %18 = load i32, i32* %ui.addr, align 4
  %cmp18 = icmp slt i32 %18, 0
  br i1 %cmp18, label %if.then20, label %if.else

if.then20:                                        ; preds = %if.end17
  %19 = load i32, i32* %ui.addr, align 4
  %rem = urem i32 %19, 10
  %add21 = add i32 %rem, 48
  %conv22 = trunc i32 %add21 to i8
  %20 = load i8*, i8** %p, align 4
  %incdec.ptr23 = getelementptr inbounds i8, i8* %20, i32 -1
  store i8* %incdec.ptr23, i8** %p, align 4
  store i8 %conv22, i8* %20, align 1
  %21 = load i32, i32* %ui.addr, align 4
  %div = udiv i32 %21, 10
  store i32 %div, i32* %si, align 4
  br label %if.end24

if.else:                                          ; preds = %if.end17
  %22 = load i32, i32* %ui.addr, align 4
  store i32 %22, i32* %si, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then20
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end24
  %23 = load i32, i32* %si, align 4
  %rem25 = srem i32 %23, 10
  %add26 = add nsw i32 %rem25, 48
  %conv27 = trunc i32 %add26 to i8
  %24 = load i8*, i8** %p, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %24, i32 -1
  store i8* %incdec.ptr28, i8** %p, align 4
  store i8 %conv27, i8* %24, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %25 = load i32, i32* %si, align 4
  %div29 = sdiv i32 %25, 10
  store i32 %div29, i32* %si, align 4
  %tobool = icmp ne i32 %div29, 0
  br i1 %tobool, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.bb30:                                          ; preds = %if.end12
  br label %do.body31

do.body31:                                        ; preds = %do.cond36, %sw.bb30
  %26 = load i32, i32* %ui.addr, align 4
  %and32 = and i32 %26, 7
  %add33 = add i32 %and32, 48
  %conv34 = trunc i32 %add33 to i8
  %27 = load i8*, i8** %p, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %27, i32 -1
  store i8* %incdec.ptr35, i8** %p, align 4
  store i8 %conv34, i8* %27, align 1
  br label %do.cond36

do.cond36:                                        ; preds = %do.body31
  %28 = load i32, i32* %ui.addr, align 4
  %shr = lshr i32 %28, 3
  store i32 %shr, i32* %ui.addr, align 4
  %tobool37 = icmp ne i32 %shr, 0
  br i1 %tobool37, label %do.body31, label %do.end38

do.end38:                                         ; preds = %do.cond36
  br label %sw.epilog

sw.bb39:                                          ; preds = %if.end12
  br label %do.body40

do.body40:                                        ; preds = %do.cond51, %sw.bb39
  %29 = load i32, i32* %flags.addr, align 4
  %and41 = and i32 %29, 4
  %tobool42 = icmp ne i32 %and41, 0
  br i1 %tobool42, label %cond.true, label %cond.false

cond.true:                                        ; preds = %do.body40
  %30 = load i32, i32* %ui.addr, align 4
  %and43 = and i32 %30, 15
  %arrayidx44 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.1, i32 0, i32 %and43
  %31 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %31 to i32
  br label %cond.end

cond.false:                                       ; preds = %do.body40
  %32 = load i32, i32* %ui.addr, align 4
  %and46 = and i32 %32, 15
  %arrayidx47 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.2, i32 0, i32 %and46
  %33 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %33 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv45, %cond.true ], [ %conv48, %cond.false ]
  %conv49 = trunc i32 %cond to i8
  %34 = load i8*, i8** %p, align 4
  %incdec.ptr50 = getelementptr inbounds i8, i8* %34, i32 -1
  store i8* %incdec.ptr50, i8** %p, align 4
  store i8 %conv49, i8* %34, align 1
  br label %do.cond51

do.cond51:                                        ; preds = %cond.end
  %35 = load i32, i32* %ui.addr, align 4
  %shr52 = lshr i32 %35, 4
  store i32 %shr52, i32* %ui.addr, align 4
  %tobool53 = icmp ne i32 %shr52, 0
  br i1 %tobool53, label %do.body40, label %do.end54

do.end54:                                         ; preds = %do.cond51
  br label %sw.epilog

sw.bb55:                                          ; preds = %if.end12
  br label %do.body56

do.body56:                                        ; preds = %do.cond61, %sw.bb55
  %36 = load i32, i32* %ui.addr, align 4
  %and57 = and i32 %36, 1
  %add58 = add i32 %and57, 48
  %conv59 = trunc i32 %add58 to i8
  %37 = load i8*, i8** %p, align 4
  %incdec.ptr60 = getelementptr inbounds i8, i8* %37, i32 -1
  store i8* %incdec.ptr60, i8** %p, align 4
  store i8 %conv59, i8* %37, align 1
  br label %do.cond61

do.cond61:                                        ; preds = %do.body56
  %38 = load i32, i32* %ui.addr, align 4
  %shr62 = lshr i32 %38, 1
  store i32 %shr62, i32* %ui.addr, align 4
  %tobool63 = icmp ne i32 %shr62, 0
  br i1 %tobool63, label %do.body56, label %do.end64

do.end64:                                         ; preds = %do.cond61
  br label %sw.epilog

sw.default:                                       ; preds = %if.end12
  br label %do.body65

do.body65:                                        ; preds = %do.cond101, %sw.default
  %39 = load i32, i32* %ui.addr, align 4
  %40 = load i32, i32* %base.addr, align 4
  %rem66 = urem i32 %39, %40
  %cmp67 = icmp ult i32 %rem66, 10
  br i1 %cmp67, label %cond.true69, label %cond.false72

cond.true69:                                      ; preds = %do.body65
  %41 = load i32, i32* %ui.addr, align 4
  %42 = load i32, i32* %base.addr, align 4
  %rem70 = urem i32 %41, %42
  %add71 = add i32 %rem70, 48
  br label %cond.end97

cond.false72:                                     ; preds = %do.body65
  %43 = load i32, i32* %ui.addr, align 4
  %44 = load i32, i32* %base.addr, align 4
  %rem73 = urem i32 %43, %44
  %cmp74 = icmp ult i32 %rem73, 36
  br i1 %cmp74, label %cond.true76, label %cond.false80

cond.true76:                                      ; preds = %cond.false72
  %45 = load i32, i32* %ui.addr, align 4
  %46 = load i32, i32* %base.addr, align 4
  %rem77 = urem i32 %45, %46
  %sub78 = sub i32 %rem77, 10
  %add79 = add i32 %sub78, 97
  br label %cond.end95

cond.false80:                                     ; preds = %cond.false72
  %47 = load i32, i32* %ui.addr, align 4
  %48 = load i32, i32* %base.addr, align 4
  %rem81 = urem i32 %47, %48
  %cmp82 = icmp ult i32 %rem81, 62
  br i1 %cmp82, label %cond.true84, label %cond.false88

cond.true84:                                      ; preds = %cond.false80
  %49 = load i32, i32* %ui.addr, align 4
  %50 = load i32, i32* %base.addr, align 4
  %rem85 = urem i32 %49, %50
  %sub86 = sub i32 %rem85, 36
  %add87 = add i32 %sub86, 65
  br label %cond.end93

cond.false88:                                     ; preds = %cond.false80
  %51 = load i32, i32* %ui.addr, align 4
  %52 = load i32, i32* %base.addr, align 4
  %rem89 = urem i32 %51, %52
  %cmp90 = icmp eq i32 %rem89, 62
  %cond92 = select i1 %cmp90, i32 64, i32 95
  br label %cond.end93

cond.end93:                                       ; preds = %cond.false88, %cond.true84
  %cond94 = phi i32 [ %add87, %cond.true84 ], [ %cond92, %cond.false88 ]
  br label %cond.end95

cond.end95:                                       ; preds = %cond.end93, %cond.true76
  %cond96 = phi i32 [ %add79, %cond.true76 ], [ %cond94, %cond.end93 ]
  br label %cond.end97

cond.end97:                                       ; preds = %cond.end95, %cond.true69
  %cond98 = phi i32 [ %add71, %cond.true69 ], [ %cond96, %cond.end95 ]
  %conv99 = trunc i32 %cond98 to i8
  %53 = load i8*, i8** %p, align 4
  %incdec.ptr100 = getelementptr inbounds i8, i8* %53, i32 -1
  store i8* %incdec.ptr100, i8** %p, align 4
  store i8 %conv99, i8* %53, align 1
  br label %do.cond101

do.cond101:                                       ; preds = %cond.end97
  %54 = load i32, i32* %base.addr, align 4
  %55 = load i32, i32* %ui.addr, align 4
  %div102 = udiv i32 %55, %54
  store i32 %div102, i32* %ui.addr, align 4
  %tobool103 = icmp ne i32 %div102, 0
  br i1 %tobool103, label %do.body65, label %do.end104

do.end104:                                        ; preds = %do.cond101
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end104, %do.end64, %do.end54, %do.end38, %do.end, %if.then16
  %56 = load i32, i32* %flags.addr, align 4
  %and105 = and i32 %56, 1
  %tobool106 = icmp ne i32 %and105, 0
  br i1 %tobool106, label %land.lhs.true107, label %if.else132

land.lhs.true107:                                 ; preds = %sw.epilog
  %57 = load i32, i32* %base.addr, align 4
  %cmp108 = icmp eq i32 %57, 8
  br i1 %cmp108, label %if.then113, label %lor.lhs.false110

lor.lhs.false110:                                 ; preds = %land.lhs.true107
  %58 = load i32, i32* %base.addr, align 4
  %cmp111 = icmp eq i32 %58, 16
  br i1 %cmp111, label %if.then113, label %if.else132

if.then113:                                       ; preds = %lor.lhs.false110, %land.lhs.true107
  %59 = load i32, i32* %base.addr, align 4
  %cmp114 = icmp eq i32 %59, 16
  br i1 %cmp114, label %if.then116, label %if.else123

if.then116:                                       ; preds = %if.then113
  %60 = load i32, i32* %flags.addr, align 4
  %and117 = and i32 %60, 4
  %tobool118 = icmp ne i32 %and117, 0
  %cond119 = select i1 %tobool118, i32 88, i32 120
  %conv120 = trunc i32 %cond119 to i8
  %61 = load i8*, i8** %p, align 4
  %incdec.ptr121 = getelementptr inbounds i8, i8* %61, i32 -1
  store i8* %incdec.ptr121, i8** %p, align 4
  store i8 %conv120, i8* %61, align 1
  %62 = load i8*, i8** %p, align 4
  %incdec.ptr122 = getelementptr inbounds i8, i8* %62, i32 -1
  store i8* %incdec.ptr122, i8** %p, align 4
  store i8 48, i8* %62, align 1
  br label %if.end131

if.else123:                                       ; preds = %if.then113
  %63 = load i8*, i8** %p, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %63, i32 1
  %64 = load i8, i8* %arrayidx124, align 1
  %conv125 = sext i8 %64 to i32
  %cmp126 = icmp ne i32 %conv125, 48
  br i1 %cmp126, label %if.then128, label %if.end130

if.then128:                                       ; preds = %if.else123
  %65 = load i8*, i8** %p, align 4
  %incdec.ptr129 = getelementptr inbounds i8, i8* %65, i32 -1
  store i8* %incdec.ptr129, i8** %p, align 4
  store i8 48, i8* %65, align 1
  br label %if.end130

if.end130:                                        ; preds = %if.then128, %if.else123
  br label %if.end131

if.end131:                                        ; preds = %if.end130, %if.then116
  br label %if.end153

if.else132:                                       ; preds = %lor.lhs.false110, %sw.epilog
  %66 = load i32, i32* %flags.addr, align 4
  %and133 = and i32 %66, 2
  %tobool134 = icmp ne i32 %and133, 0
  br i1 %tobool134, label %land.lhs.true135, label %if.end152

land.lhs.true135:                                 ; preds = %if.else132
  %67 = load i32, i32* %base.addr, align 4
  %cmp136 = icmp ne i32 %67, 10
  br i1 %cmp136, label %if.then138, label %if.end152

if.then138:                                       ; preds = %land.lhs.true135
  %68 = load i8*, i8** %p, align 4
  %incdec.ptr139 = getelementptr inbounds i8, i8* %68, i32 -1
  store i8* %incdec.ptr139, i8** %p, align 4
  store i8 35, i8* %68, align 1
  %69 = load i32, i32* %base.addr, align 4
  %rem140 = srem i32 %69, 10
  %add141 = add nsw i32 %rem140, 48
  %conv142 = trunc i32 %add141 to i8
  %70 = load i8*, i8** %p, align 4
  %incdec.ptr143 = getelementptr inbounds i8, i8* %70, i32 -1
  store i8* %incdec.ptr143, i8** %p, align 4
  store i8 %conv142, i8* %70, align 1
  %71 = load i32, i32* %base.addr, align 4
  %cmp144 = icmp sgt i32 %71, 10
  br i1 %cmp144, label %if.then146, label %if.end151

if.then146:                                       ; preds = %if.then138
  %72 = load i32, i32* %base.addr, align 4
  %div147 = sdiv i32 %72, 10
  %add148 = add nsw i32 %div147, 48
  %conv149 = trunc i32 %add148 to i8
  %73 = load i8*, i8** %p, align 4
  %incdec.ptr150 = getelementptr inbounds i8, i8* %73, i32 -1
  store i8* %incdec.ptr150, i8** %p, align 4
  store i8 %conv149, i8* %73, align 1
  br label %if.end151

if.end151:                                        ; preds = %if.then146, %if.then138
  br label %if.end152

if.end152:                                        ; preds = %if.end151, %land.lhs.true135, %if.else132
  br label %if.end153

if.end153:                                        ; preds = %if.end152, %if.end131
  %74 = load i32, i32* %sign, align 4
  %tobool154 = icmp ne i32 %74, 0
  br i1 %tobool154, label %if.then155, label %if.end157

if.then155:                                       ; preds = %if.end153
  %75 = load i8*, i8** %p, align 4
  %incdec.ptr156 = getelementptr inbounds i8, i8* %75, i32 -1
  store i8* %incdec.ptr156, i8** %p, align 4
  store i8 45, i8* %75, align 1
  br label %if.end157

if.end157:                                        ; preds = %if.then155, %if.end153
  %76 = load i8*, i8** %p, align 4
  %add.ptr158 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %add.ptr158, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end157, %if.then3
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
