; ModuleID = 'gmisc.c'
source_filename = "gmisc.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i32 @match_pattern_wchar(i32* %wpat, i32* %wstring, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %wpat.addr = alloca i32*, align 4
  %wstring.addr = alloca i32*, align 4
  %flags.addr = alloca i32, align 4
  %wc = alloca i32, align 4
  store i32* %wpat, i32** %wpat.addr, align 4
  store i32* %wstring, i32** %wstring.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32*, i32** %wstring.addr, align 4
  %1 = load i32, i32* %0, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %wpat.addr, align 4
  %3 = load i32, i32* %2, align 4
  %cmp1 = icmp eq i32 %3, 42
  %conv = zext i1 %cmp1 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %incdec.ptr, i32** %wpat.addr, align 4
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %wc, align 4
  switch i32 %5, label %sw.default [
    i32 92, label %sw.bb
    i32 63, label %sw.bb38
    i32 42, label %sw.bb47
    i32 43, label %sw.bb48
    i32 33, label %sw.bb48
    i32 64, label %sw.bb48
    i32 91, label %sw.bb77
  ]

sw.default:                                       ; preds = %if.end
  %6 = load i32, i32* %flags.addr, align 4
  %and = and i32 %6, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %sw.default
  %7 = load i32*, i32** %wstring.addr, align 4
  %8 = load i32, i32* %7, align 4
  %call = call i32 @iswupper(i32 %8)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %9 = load i32*, i32** %wstring.addr, align 4
  %10 = load i32, i32* %9, align 4
  %call3 = call i32 @towlower(i32 %10)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %sw.default
  %11 = load i32*, i32** %wstring.addr, align 4
  %12 = load i32, i32* %11, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call3, %cond.true ], [ %12, %cond.false ]
  %13 = load i32, i32* %flags.addr, align 4
  %and4 = and i32 %13, 16
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %land.lhs.true6, label %cond.false11

land.lhs.true6:                                   ; preds = %cond.end
  %14 = load i32, i32* %wc, align 4
  %call7 = call i32 @iswupper(i32 %14)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %cond.true9, label %cond.false11

cond.true9:                                       ; preds = %land.lhs.true6
  %15 = load i32, i32* %wc, align 4
  %call10 = call i32 @towlower(i32 %15)
  br label %cond.end12

cond.false11:                                     ; preds = %land.lhs.true6, %cond.end
  %16 = load i32, i32* %wc, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true9
  %cond13 = phi i32 [ %call10, %cond.true9 ], [ %16, %cond.false11 ]
  %cmp14 = icmp eq i32 %cond, %cond13
  %conv15 = zext i1 %cmp14 to i32
  store i32 %conv15, i32* %retval, align 4
  br label %return

sw.bb:                                            ; preds = %if.end
  %17 = load i32, i32* %flags.addr, align 4
  %and16 = and i32 %17, 16
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %land.lhs.true18, label %cond.false23

land.lhs.true18:                                  ; preds = %sw.bb
  %18 = load i32*, i32** %wstring.addr, align 4
  %19 = load i32, i32* %18, align 4
  %call19 = call i32 @iswupper(i32 %19)
  %tobool20 = icmp ne i32 %call19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false23

cond.true21:                                      ; preds = %land.lhs.true18
  %20 = load i32*, i32** %wstring.addr, align 4
  %21 = load i32, i32* %20, align 4
  %call22 = call i32 @towlower(i32 %21)
  br label %cond.end24

cond.false23:                                     ; preds = %land.lhs.true18, %sw.bb
  %22 = load i32*, i32** %wstring.addr, align 4
  %23 = load i32, i32* %22, align 4
  br label %cond.end24

cond.end24:                                       ; preds = %cond.false23, %cond.true21
  %cond25 = phi i32 [ %call22, %cond.true21 ], [ %23, %cond.false23 ]
  %24 = load i32, i32* %flags.addr, align 4
  %and26 = and i32 %24, 16
  %tobool27 = icmp ne i32 %and26, 0
  br i1 %tobool27, label %land.lhs.true28, label %cond.false33

land.lhs.true28:                                  ; preds = %cond.end24
  %25 = load i32*, i32** %wpat.addr, align 4
  %26 = load i32, i32* %25, align 4
  %call29 = call i32 @iswupper(i32 %26)
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %cond.true31, label %cond.false33

cond.true31:                                      ; preds = %land.lhs.true28
  %27 = load i32*, i32** %wpat.addr, align 4
  %28 = load i32, i32* %27, align 4
  %call32 = call i32 @towlower(i32 %28)
  br label %cond.end34

cond.false33:                                     ; preds = %land.lhs.true28, %cond.end24
  %29 = load i32*, i32** %wpat.addr, align 4
  %30 = load i32, i32* %29, align 4
  br label %cond.end34

cond.end34:                                       ; preds = %cond.false33, %cond.true31
  %cond35 = phi i32 [ %call32, %cond.true31 ], [ %30, %cond.false33 ]
  %cmp36 = icmp eq i32 %cond25, %cond35
  %conv37 = zext i1 %cmp36 to i32
  store i32 %conv37, i32* %retval, align 4
  br label %return

sw.bb38:                                          ; preds = %if.end
  %31 = load i32*, i32** %wpat.addr, align 4
  %32 = load i32, i32* %31, align 4
  %cmp39 = icmp eq i32 %32, 40
  br i1 %cmp39, label %cond.true41, label %cond.false42

cond.true41:                                      ; preds = %sw.bb38
  br label %cond.end45

cond.false42:                                     ; preds = %sw.bb38
  %33 = load i32*, i32** %wstring.addr, align 4
  %34 = load i32, i32* %33, align 4
  %cmp43 = icmp ne i32 %34, 0
  %conv44 = zext i1 %cmp43 to i32
  br label %cond.end45

cond.end45:                                       ; preds = %cond.false42, %cond.true41
  %cond46 = phi i32 [ 1, %cond.true41 ], [ %conv44, %cond.false42 ]
  store i32 %cond46, i32* %retval, align 4
  br label %return

sw.bb47:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb48:                                          ; preds = %if.end, %if.end, %if.end
  %35 = load i32*, i32** %wpat.addr, align 4
  %36 = load i32, i32* %35, align 4
  %cmp49 = icmp eq i32 %36, 40
  br i1 %cmp49, label %cond.true51, label %cond.false52

cond.true51:                                      ; preds = %sw.bb48
  br label %cond.end75

cond.false52:                                     ; preds = %sw.bb48
  %37 = load i32, i32* %flags.addr, align 4
  %and53 = and i32 %37, 16
  %tobool54 = icmp ne i32 %and53, 0
  br i1 %tobool54, label %land.lhs.true55, label %cond.false60

land.lhs.true55:                                  ; preds = %cond.false52
  %38 = load i32*, i32** %wstring.addr, align 4
  %39 = load i32, i32* %38, align 4
  %call56 = call i32 @iswupper(i32 %39)
  %tobool57 = icmp ne i32 %call56, 0
  br i1 %tobool57, label %cond.true58, label %cond.false60

cond.true58:                                      ; preds = %land.lhs.true55
  %40 = load i32*, i32** %wstring.addr, align 4
  %41 = load i32, i32* %40, align 4
  %call59 = call i32 @towlower(i32 %41)
  br label %cond.end61

cond.false60:                                     ; preds = %land.lhs.true55, %cond.false52
  %42 = load i32*, i32** %wstring.addr, align 4
  %43 = load i32, i32* %42, align 4
  br label %cond.end61

cond.end61:                                       ; preds = %cond.false60, %cond.true58
  %cond62 = phi i32 [ %call59, %cond.true58 ], [ %43, %cond.false60 ]
  %44 = load i32, i32* %flags.addr, align 4
  %and63 = and i32 %44, 16
  %tobool64 = icmp ne i32 %and63, 0
  br i1 %tobool64, label %land.lhs.true65, label %cond.false70

land.lhs.true65:                                  ; preds = %cond.end61
  %45 = load i32, i32* %wc, align 4
  %call66 = call i32 @iswupper(i32 %45)
  %tobool67 = icmp ne i32 %call66, 0
  br i1 %tobool67, label %cond.true68, label %cond.false70

cond.true68:                                      ; preds = %land.lhs.true65
  %46 = load i32, i32* %wc, align 4
  %call69 = call i32 @towlower(i32 %46)
  br label %cond.end71

cond.false70:                                     ; preds = %land.lhs.true65, %cond.end61
  %47 = load i32, i32* %wc, align 4
  br label %cond.end71

cond.end71:                                       ; preds = %cond.false70, %cond.true68
  %cond72 = phi i32 [ %call69, %cond.true68 ], [ %47, %cond.false70 ]
  %cmp73 = icmp eq i32 %cond62, %cond72
  %conv74 = zext i1 %cmp73 to i32
  br label %cond.end75

cond.end75:                                       ; preds = %cond.end71, %cond.true51
  %cond76 = phi i32 [ 1, %cond.true51 ], [ %conv74, %cond.end71 ]
  store i32 %cond76, i32* %retval, align 4
  br label %return

sw.bb77:                                          ; preds = %if.end
  %48 = load i32*, i32** %wstring.addr, align 4
  %49 = load i32, i32* %48, align 4
  %cmp78 = icmp ne i32 %49, 0
  %conv79 = zext i1 %cmp78 to i32
  store i32 %conv79, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.bb77, %cond.end75, %sw.bb47, %cond.end45, %cond.end34, %cond.end12, %if.then
  %50 = load i32, i32* %retval, align 4
  ret i32 %50
}

declare i32 @iswupper(i32) #1

declare i32 @towlower(i32) #1

; Function Attrs: noinline nounwind
define i32 @wmatchlen(i32* %wpat, i32 %wmax) #0 {
entry:
  %retval = alloca i32, align 4
  %wpat.addr = alloca i32*, align 4
  %wmax.addr = alloca i32, align 4
  %wc = alloca i32, align 4
  %matlen = alloca i32, align 4
  %bracklen = alloca i32, align 4
  %t = alloca i32, align 4
  %in_cclass = alloca i32, align 4
  %in_collsym = alloca i32, align 4
  %in_equiv = alloca i32, align 4
  store i32* %wpat, i32** %wpat.addr, align 4
  store i32 %wmax, i32* %wmax.addr, align 4
  %0 = load i32*, i32** %wpat.addr, align 4
  %1 = load i32, i32* %0, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %in_equiv, align 4
  store i32 0, i32* %in_collsym, align 4
  store i32 0, i32* %in_cclass, align 4
  store i32 0, i32* %matlen, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %2 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** %wpat.addr, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %wc, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, i32* %wc, align 4
  switch i32 %4, label %sw.default [
    i32 92, label %sw.bb
    i32 63, label %sw.bb7
    i32 42, label %sw.bb13
    i32 43, label %sw.bb14
    i32 33, label %sw.bb14
    i32 64, label %sw.bb14
    i32 91, label %sw.bb20
  ]

sw.default:                                       ; preds = %while.body
  %5 = load i32, i32* %matlen, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %matlen, align 4
  br label %sw.epilog

sw.bb:                                            ; preds = %while.body
  %6 = load i32*, i32** %wpat.addr, align 4
  %7 = load i32, i32* %6, align 4
  %cmp1 = icmp eq i32 %7, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %sw.bb
  %8 = load i32, i32* %matlen, align 4
  %inc3 = add nsw i32 %8, 1
  store i32 %inc3, i32* %matlen, align 4
  store i32 %inc3, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %sw.bb
  %9 = load i32, i32* %matlen, align 4
  %inc4 = add nsw i32 %9, 1
  store i32 %inc4, i32* %matlen, align 4
  %10 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr5 = getelementptr inbounds i32, i32* %10, i32 1
  store i32* %incdec.ptr5, i32** %wpat.addr, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else
  br label %sw.epilog

sw.bb7:                                           ; preds = %while.body
  %11 = load i32*, i32** %wpat.addr, align 4
  %12 = load i32, i32* %11, align 4
  %cmp8 = icmp eq i32 %12, 40
  br i1 %cmp8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %sw.bb7
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else10:                                        ; preds = %sw.bb7
  %13 = load i32, i32* %matlen, align 4
  %inc11 = add nsw i32 %13, 1
  store i32 %inc11, i32* %matlen, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.else10
  br label %sw.epilog

sw.bb13:                                          ; preds = %while.body
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb14:                                          ; preds = %while.body, %while.body, %while.body
  %14 = load i32*, i32** %wpat.addr, align 4
  %15 = load i32, i32* %14, align 4
  %cmp15 = icmp eq i32 %15, 40
  br i1 %cmp15, label %if.then16, label %if.else17

if.then16:                                        ; preds = %sw.bb14
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else17:                                        ; preds = %sw.bb14
  %16 = load i32, i32* %matlen, align 4
  %inc18 = add nsw i32 %16, 1
  store i32 %inc18, i32* %matlen, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.else17
  br label %sw.epilog

sw.bb20:                                          ; preds = %while.body
  store i32 1, i32* %bracklen, align 4
  %17 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr21 = getelementptr inbounds i32, i32* %17, i32 1
  store i32* %incdec.ptr21, i32** %wpat.addr, align 4
  %18 = load i32, i32* %17, align 4
  store i32 %18, i32* %wc, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb20
  %19 = load i32, i32* %wc, align 4
  %cmp22 = icmp eq i32 %19, 0
  br i1 %cmp22, label %if.then23, label %if.else25

if.then23:                                        ; preds = %do.body
  %20 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr24 = getelementptr inbounds i32, i32* %20, i32 -1
  store i32* %incdec.ptr24, i32** %wpat.addr, align 4
  %21 = load i32, i32* %bracklen, align 4
  %22 = load i32, i32* %matlen, align 4
  %add = add nsw i32 %22, %21
  store i32 %add, i32* %matlen, align 4
  br label %bad_bracket

if.else25:                                        ; preds = %do.body
  %23 = load i32, i32* %wc, align 4
  %cmp26 = icmp eq i32 %23, 92
  br i1 %cmp26, label %if.then27, label %if.else35

if.then27:                                        ; preds = %if.else25
  %24 = load i32, i32* %bracklen, align 4
  %inc28 = add nsw i32 %24, 1
  store i32 %inc28, i32* %bracklen, align 4
  %25 = load i32*, i32** %wpat.addr, align 4
  %26 = load i32, i32* %25, align 4
  %cmp29 = icmp eq i32 %26, 0
  br i1 %cmp29, label %if.then32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then27
  %27 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr30 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %incdec.ptr30, i32** %wpat.addr, align 4
  %28 = load i32, i32* %incdec.ptr30, align 4
  %cmp31 = icmp eq i32 %28, 0
  br i1 %cmp31, label %if.then32, label %if.end34

if.then32:                                        ; preds = %lor.lhs.false, %if.then27
  %29 = load i32, i32* %bracklen, align 4
  %30 = load i32, i32* %matlen, align 4
  %add33 = add nsw i32 %30, %29
  store i32 %add33, i32* %matlen, align 4
  br label %bad_bracket

if.end34:                                         ; preds = %lor.lhs.false
  br label %if.end100

if.else35:                                        ; preds = %if.else25
  %31 = load i32, i32* %wc, align 4
  %cmp36 = icmp eq i32 %31, 91
  br i1 %cmp36, label %land.lhs.true, label %if.else41

land.lhs.true:                                    ; preds = %if.else35
  %32 = load i32*, i32** %wpat.addr, align 4
  %33 = load i32, i32* %32, align 4
  %cmp37 = icmp eq i32 %33, 58
  br i1 %cmp37, label %if.then38, label %if.else41

if.then38:                                        ; preds = %land.lhs.true
  %34 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr39 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %incdec.ptr39, i32** %wpat.addr, align 4
  %35 = load i32, i32* %bracklen, align 4
  %inc40 = add nsw i32 %35, 1
  store i32 %inc40, i32* %bracklen, align 4
  store i32 1, i32* %in_cclass, align 4
  br label %if.end99

if.else41:                                        ; preds = %land.lhs.true, %if.else35
  %36 = load i32, i32* %in_cclass, align 4
  %tobool42 = icmp ne i32 %36, 0
  br i1 %tobool42, label %land.lhs.true43, label %if.else50

land.lhs.true43:                                  ; preds = %if.else41
  %37 = load i32, i32* %wc, align 4
  %cmp44 = icmp eq i32 %37, 58
  br i1 %cmp44, label %land.lhs.true45, label %if.else50

land.lhs.true45:                                  ; preds = %land.lhs.true43
  %38 = load i32*, i32** %wpat.addr, align 4
  %39 = load i32, i32* %38, align 4
  %cmp46 = icmp eq i32 %39, 93
  br i1 %cmp46, label %if.then47, label %if.else50

if.then47:                                        ; preds = %land.lhs.true45
  %40 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr48 = getelementptr inbounds i32, i32* %40, i32 1
  store i32* %incdec.ptr48, i32** %wpat.addr, align 4
  %41 = load i32, i32* %bracklen, align 4
  %inc49 = add nsw i32 %41, 1
  store i32 %inc49, i32* %bracklen, align 4
  store i32 0, i32* %in_cclass, align 4
  br label %if.end98

if.else50:                                        ; preds = %land.lhs.true45, %land.lhs.true43, %if.else41
  %42 = load i32, i32* %wc, align 4
  %cmp51 = icmp eq i32 %42, 91
  br i1 %cmp51, label %land.lhs.true52, label %if.else62

land.lhs.true52:                                  ; preds = %if.else50
  %43 = load i32*, i32** %wpat.addr, align 4
  %44 = load i32, i32* %43, align 4
  %cmp53 = icmp eq i32 %44, 46
  br i1 %cmp53, label %if.then54, label %if.else62

if.then54:                                        ; preds = %land.lhs.true52
  %45 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr55 = getelementptr inbounds i32, i32* %45, i32 1
  store i32* %incdec.ptr55, i32** %wpat.addr, align 4
  %46 = load i32, i32* %bracklen, align 4
  %inc56 = add nsw i32 %46, 1
  store i32 %inc56, i32* %bracklen, align 4
  %47 = load i32*, i32** %wpat.addr, align 4
  %48 = load i32, i32* %47, align 4
  %cmp57 = icmp eq i32 %48, 93
  br i1 %cmp57, label %if.then58, label %if.end61

if.then58:                                        ; preds = %if.then54
  %49 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr59 = getelementptr inbounds i32, i32* %49, i32 1
  store i32* %incdec.ptr59, i32** %wpat.addr, align 4
  %50 = load i32, i32* %bracklen, align 4
  %inc60 = add nsw i32 %50, 1
  store i32 %inc60, i32* %bracklen, align 4
  br label %if.end61

if.end61:                                         ; preds = %if.then58, %if.then54
  store i32 1, i32* %in_collsym, align 4
  br label %if.end97

if.else62:                                        ; preds = %land.lhs.true52, %if.else50
  %51 = load i32, i32* %in_collsym, align 4
  %tobool63 = icmp ne i32 %51, 0
  br i1 %tobool63, label %land.lhs.true64, label %if.else71

land.lhs.true64:                                  ; preds = %if.else62
  %52 = load i32, i32* %wc, align 4
  %cmp65 = icmp eq i32 %52, 46
  br i1 %cmp65, label %land.lhs.true66, label %if.else71

land.lhs.true66:                                  ; preds = %land.lhs.true64
  %53 = load i32*, i32** %wpat.addr, align 4
  %54 = load i32, i32* %53, align 4
  %cmp67 = icmp eq i32 %54, 93
  br i1 %cmp67, label %if.then68, label %if.else71

if.then68:                                        ; preds = %land.lhs.true66
  %55 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr69 = getelementptr inbounds i32, i32* %55, i32 1
  store i32* %incdec.ptr69, i32** %wpat.addr, align 4
  %56 = load i32, i32* %bracklen, align 4
  %inc70 = add nsw i32 %56, 1
  store i32 %inc70, i32* %bracklen, align 4
  store i32 0, i32* %in_collsym, align 4
  br label %if.end96

if.else71:                                        ; preds = %land.lhs.true66, %land.lhs.true64, %if.else62
  %57 = load i32, i32* %wc, align 4
  %cmp72 = icmp eq i32 %57, 91
  br i1 %cmp72, label %land.lhs.true73, label %if.else83

land.lhs.true73:                                  ; preds = %if.else71
  %58 = load i32*, i32** %wpat.addr, align 4
  %59 = load i32, i32* %58, align 4
  %cmp74 = icmp eq i32 %59, 61
  br i1 %cmp74, label %if.then75, label %if.else83

if.then75:                                        ; preds = %land.lhs.true73
  %60 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr76 = getelementptr inbounds i32, i32* %60, i32 1
  store i32* %incdec.ptr76, i32** %wpat.addr, align 4
  %61 = load i32, i32* %bracklen, align 4
  %inc77 = add nsw i32 %61, 1
  store i32 %inc77, i32* %bracklen, align 4
  %62 = load i32*, i32** %wpat.addr, align 4
  %63 = load i32, i32* %62, align 4
  %cmp78 = icmp eq i32 %63, 93
  br i1 %cmp78, label %if.then79, label %if.end82

if.then79:                                        ; preds = %if.then75
  %64 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr80 = getelementptr inbounds i32, i32* %64, i32 1
  store i32* %incdec.ptr80, i32** %wpat.addr, align 4
  %65 = load i32, i32* %bracklen, align 4
  %inc81 = add nsw i32 %65, 1
  store i32 %inc81, i32* %bracklen, align 4
  br label %if.end82

if.end82:                                         ; preds = %if.then79, %if.then75
  store i32 1, i32* %in_equiv, align 4
  br label %if.end95

if.else83:                                        ; preds = %land.lhs.true73, %if.else71
  %66 = load i32, i32* %in_equiv, align 4
  %tobool84 = icmp ne i32 %66, 0
  br i1 %tobool84, label %land.lhs.true85, label %if.else92

land.lhs.true85:                                  ; preds = %if.else83
  %67 = load i32, i32* %wc, align 4
  %cmp86 = icmp eq i32 %67, 61
  br i1 %cmp86, label %land.lhs.true87, label %if.else92

land.lhs.true87:                                  ; preds = %land.lhs.true85
  %68 = load i32*, i32** %wpat.addr, align 4
  %69 = load i32, i32* %68, align 4
  %cmp88 = icmp eq i32 %69, 93
  br i1 %cmp88, label %if.then89, label %if.else92

if.then89:                                        ; preds = %land.lhs.true87
  %70 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr90 = getelementptr inbounds i32, i32* %70, i32 1
  store i32* %incdec.ptr90, i32** %wpat.addr, align 4
  %71 = load i32, i32* %bracklen, align 4
  %inc91 = add nsw i32 %71, 1
  store i32 %inc91, i32* %bracklen, align 4
  store i32 0, i32* %in_equiv, align 4
  br label %if.end94

if.else92:                                        ; preds = %land.lhs.true87, %land.lhs.true85, %if.else83
  %72 = load i32, i32* %bracklen, align 4
  %inc93 = add nsw i32 %72, 1
  store i32 %inc93, i32* %bracklen, align 4
  br label %if.end94

if.end94:                                         ; preds = %if.else92, %if.then89
  br label %if.end95

if.end95:                                         ; preds = %if.end94, %if.end82
  br label %if.end96

if.end96:                                         ; preds = %if.end95, %if.then68
  br label %if.end97

if.end97:                                         ; preds = %if.end96, %if.end61
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %if.then47
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.then38
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.end34
  br label %if.end101

if.end101:                                        ; preds = %if.end100
  br label %do.cond

do.cond:                                          ; preds = %if.end101
  %73 = load i32*, i32** %wpat.addr, align 4
  %incdec.ptr102 = getelementptr inbounds i32, i32* %73, i32 1
  store i32* %incdec.ptr102, i32** %wpat.addr, align 4
  %74 = load i32, i32* %73, align 4
  store i32 %74, i32* %wc, align 4
  %cmp103 = icmp ne i32 %74, 93
  br i1 %cmp103, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %75 = load i32, i32* %matlen, align 4
  %inc104 = add nsw i32 %75, 1
  store i32 %inc104, i32* %matlen, align 4
  br label %bad_bracket

bad_bracket:                                      ; preds = %do.end, %if.then32, %if.then23
  br label %sw.epilog

sw.epilog:                                        ; preds = %bad_bracket, %if.end19, %if.end12, %if.end6, %sw.default
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %76 = load i32, i32* %matlen, align 4
  store i32 %76, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then16, %sw.bb13, %if.then9, %if.then2, %if.then
  %77 = load i32, i32* %retval, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind
define i32 @extglob_pattern_p(i8* %pat) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  store i8* %pat, i8** %pat.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  switch i32 %conv, label %sw.default [
    i32 42, label %sw.bb
    i32 43, label %sw.bb
    i32 33, label %sw.bb
    i32 64, label %sw.bb
    i32 63, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry, %entry
  %2 = load i8*, i8** %pat.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv2, 40
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.default, %sw.bb
  %4 = load i32, i32* %retval, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind
define i32 @match_pattern_char(i8* %pat, i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %c = alloca i8, align 1
  store i8* %pat, i8** %pat.addr, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %pat.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 42
  %conv4 = zext i1 %cmp3 to i32
  store i32 %conv4, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %pat.addr, align 4
  %5 = load i8, i8* %4, align 1
  store i8 %5, i8* %c, align 1
  %conv5 = sext i8 %5 to i32
  switch i32 %conv5, label %sw.default [
    i32 92, label %sw.bb
    i32 63, label %sw.bb71
    i32 42, label %sw.bb82
    i32 43, label %sw.bb83
    i32 33, label %sw.bb83
    i32 64, label %sw.bb83
    i32 91, label %sw.bb127
  ]

sw.default:                                       ; preds = %if.end
  %6 = load i32, i32* %flags.addr, align 4
  %and = and i32 %6, 16
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false12

cond.true:                                        ; preds = %sw.default
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv6 = zext i8 %8 to i32
  %call = call i32 @isupper(i32 %conv6) #3
  %tobool7 = icmp ne i32 %call, 0
  br i1 %tobool7, label %cond.true8, label %cond.false

cond.true8:                                       ; preds = %cond.true
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv9 = zext i8 %10 to i32
  %call10 = call i32 @tolower(i32 %conv9) #3
  br label %cond.end

cond.false:                                       ; preds = %cond.true
  %11 = load i8*, i8** %string.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv11 = zext i8 %12 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true8
  %cond = phi i32 [ %call10, %cond.true8 ], [ %conv11, %cond.false ]
  br label %cond.end14

cond.false12:                                     ; preds = %sw.default
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv13 = zext i8 %14 to i32
  br label %cond.end14

cond.end14:                                       ; preds = %cond.false12, %cond.end
  %cond15 = phi i32 [ %cond, %cond.end ], [ %conv13, %cond.false12 ]
  %15 = load i32, i32* %flags.addr, align 4
  %and16 = and i32 %15, 16
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %cond.true18, label %cond.false29

cond.true18:                                      ; preds = %cond.end14
  %16 = load i8, i8* %c, align 1
  %conv19 = zext i8 %16 to i32
  %call20 = call i32 @isupper(i32 %conv19) #3
  %tobool21 = icmp ne i32 %call20, 0
  br i1 %tobool21, label %cond.true22, label %cond.false25

cond.true22:                                      ; preds = %cond.true18
  %17 = load i8, i8* %c, align 1
  %conv23 = zext i8 %17 to i32
  %call24 = call i32 @tolower(i32 %conv23) #3
  br label %cond.end27

cond.false25:                                     ; preds = %cond.true18
  %18 = load i8, i8* %c, align 1
  %conv26 = zext i8 %18 to i32
  br label %cond.end27

cond.end27:                                       ; preds = %cond.false25, %cond.true22
  %cond28 = phi i32 [ %call24, %cond.true22 ], [ %conv26, %cond.false25 ]
  br label %cond.end31

cond.false29:                                     ; preds = %cond.end14
  %19 = load i8, i8* %c, align 1
  %conv30 = zext i8 %19 to i32
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false29, %cond.end27
  %cond32 = phi i32 [ %cond28, %cond.end27 ], [ %conv30, %cond.false29 ]
  %cmp33 = icmp eq i32 %cond15, %cond32
  %conv34 = zext i1 %cmp33 to i32
  store i32 %conv34, i32* %retval, align 4
  br label %return

sw.bb:                                            ; preds = %if.end
  %20 = load i32, i32* %flags.addr, align 4
  %and35 = and i32 %20, 16
  %tobool36 = icmp ne i32 %and35, 0
  br i1 %tobool36, label %cond.true37, label %cond.false48

cond.true37:                                      ; preds = %sw.bb
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i8, i8* %21, align 1
  %conv38 = zext i8 %22 to i32
  %call39 = call i32 @isupper(i32 %conv38) #3
  %tobool40 = icmp ne i32 %call39, 0
  br i1 %tobool40, label %cond.true41, label %cond.false44

cond.true41:                                      ; preds = %cond.true37
  %23 = load i8*, i8** %string.addr, align 4
  %24 = load i8, i8* %23, align 1
  %conv42 = zext i8 %24 to i32
  %call43 = call i32 @tolower(i32 %conv42) #3
  br label %cond.end46

cond.false44:                                     ; preds = %cond.true37
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i8, i8* %25, align 1
  %conv45 = zext i8 %26 to i32
  br label %cond.end46

cond.end46:                                       ; preds = %cond.false44, %cond.true41
  %cond47 = phi i32 [ %call43, %cond.true41 ], [ %conv45, %cond.false44 ]
  br label %cond.end50

cond.false48:                                     ; preds = %sw.bb
  %27 = load i8*, i8** %string.addr, align 4
  %28 = load i8, i8* %27, align 1
  %conv49 = zext i8 %28 to i32
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false48, %cond.end46
  %cond51 = phi i32 [ %cond47, %cond.end46 ], [ %conv49, %cond.false48 ]
  %29 = load i32, i32* %flags.addr, align 4
  %and52 = and i32 %29, 16
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %cond.true54, label %cond.false65

cond.true54:                                      ; preds = %cond.end50
  %30 = load i8*, i8** %pat.addr, align 4
  %31 = load i8, i8* %30, align 1
  %conv55 = zext i8 %31 to i32
  %call56 = call i32 @isupper(i32 %conv55) #3
  %tobool57 = icmp ne i32 %call56, 0
  br i1 %tobool57, label %cond.true58, label %cond.false61

cond.true58:                                      ; preds = %cond.true54
  %32 = load i8*, i8** %pat.addr, align 4
  %33 = load i8, i8* %32, align 1
  %conv59 = zext i8 %33 to i32
  %call60 = call i32 @tolower(i32 %conv59) #3
  br label %cond.end63

cond.false61:                                     ; preds = %cond.true54
  %34 = load i8*, i8** %pat.addr, align 4
  %35 = load i8, i8* %34, align 1
  %conv62 = zext i8 %35 to i32
  br label %cond.end63

cond.end63:                                       ; preds = %cond.false61, %cond.true58
  %cond64 = phi i32 [ %call60, %cond.true58 ], [ %conv62, %cond.false61 ]
  br label %cond.end67

cond.false65:                                     ; preds = %cond.end50
  %36 = load i8*, i8** %pat.addr, align 4
  %37 = load i8, i8* %36, align 1
  %conv66 = zext i8 %37 to i32
  br label %cond.end67

cond.end67:                                       ; preds = %cond.false65, %cond.end63
  %cond68 = phi i32 [ %cond64, %cond.end63 ], [ %conv66, %cond.false65 ]
  %cmp69 = icmp eq i32 %cond51, %cond68
  %conv70 = zext i1 %cmp69 to i32
  store i32 %conv70, i32* %retval, align 4
  br label %return

sw.bb71:                                          ; preds = %if.end
  %38 = load i8*, i8** %pat.addr, align 4
  %39 = load i8, i8* %38, align 1
  %conv72 = sext i8 %39 to i32
  %cmp73 = icmp eq i32 %conv72, 40
  br i1 %cmp73, label %cond.true75, label %cond.false76

cond.true75:                                      ; preds = %sw.bb71
  br label %cond.end80

cond.false76:                                     ; preds = %sw.bb71
  %40 = load i8*, i8** %string.addr, align 4
  %41 = load i8, i8* %40, align 1
  %conv77 = sext i8 %41 to i32
  %cmp78 = icmp ne i32 %conv77, 0
  %conv79 = zext i1 %cmp78 to i32
  br label %cond.end80

cond.end80:                                       ; preds = %cond.false76, %cond.true75
  %cond81 = phi i32 [ 1, %cond.true75 ], [ %conv79, %cond.false76 ]
  store i32 %cond81, i32* %retval, align 4
  br label %return

sw.bb82:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

sw.bb83:                                          ; preds = %if.end, %if.end, %if.end
  %42 = load i8*, i8** %pat.addr, align 4
  %43 = load i8, i8* %42, align 1
  %conv84 = sext i8 %43 to i32
  %cmp85 = icmp eq i32 %conv84, 40
  br i1 %cmp85, label %cond.true87, label %cond.false88

cond.true87:                                      ; preds = %sw.bb83
  br label %cond.end125

cond.false88:                                     ; preds = %sw.bb83
  %44 = load i32, i32* %flags.addr, align 4
  %and89 = and i32 %44, 16
  %tobool90 = icmp ne i32 %and89, 0
  br i1 %tobool90, label %cond.true91, label %cond.false102

cond.true91:                                      ; preds = %cond.false88
  %45 = load i8*, i8** %string.addr, align 4
  %46 = load i8, i8* %45, align 1
  %conv92 = zext i8 %46 to i32
  %call93 = call i32 @isupper(i32 %conv92) #3
  %tobool94 = icmp ne i32 %call93, 0
  br i1 %tobool94, label %cond.true95, label %cond.false98

cond.true95:                                      ; preds = %cond.true91
  %47 = load i8*, i8** %string.addr, align 4
  %48 = load i8, i8* %47, align 1
  %conv96 = zext i8 %48 to i32
  %call97 = call i32 @tolower(i32 %conv96) #3
  br label %cond.end100

cond.false98:                                     ; preds = %cond.true91
  %49 = load i8*, i8** %string.addr, align 4
  %50 = load i8, i8* %49, align 1
  %conv99 = zext i8 %50 to i32
  br label %cond.end100

cond.end100:                                      ; preds = %cond.false98, %cond.true95
  %cond101 = phi i32 [ %call97, %cond.true95 ], [ %conv99, %cond.false98 ]
  br label %cond.end104

cond.false102:                                    ; preds = %cond.false88
  %51 = load i8*, i8** %string.addr, align 4
  %52 = load i8, i8* %51, align 1
  %conv103 = zext i8 %52 to i32
  br label %cond.end104

cond.end104:                                      ; preds = %cond.false102, %cond.end100
  %cond105 = phi i32 [ %cond101, %cond.end100 ], [ %conv103, %cond.false102 ]
  %53 = load i32, i32* %flags.addr, align 4
  %and106 = and i32 %53, 16
  %tobool107 = icmp ne i32 %and106, 0
  br i1 %tobool107, label %cond.true108, label %cond.false119

cond.true108:                                     ; preds = %cond.end104
  %54 = load i8, i8* %c, align 1
  %conv109 = zext i8 %54 to i32
  %call110 = call i32 @isupper(i32 %conv109) #3
  %tobool111 = icmp ne i32 %call110, 0
  br i1 %tobool111, label %cond.true112, label %cond.false115

cond.true112:                                     ; preds = %cond.true108
  %55 = load i8, i8* %c, align 1
  %conv113 = zext i8 %55 to i32
  %call114 = call i32 @tolower(i32 %conv113) #3
  br label %cond.end117

cond.false115:                                    ; preds = %cond.true108
  %56 = load i8, i8* %c, align 1
  %conv116 = zext i8 %56 to i32
  br label %cond.end117

cond.end117:                                      ; preds = %cond.false115, %cond.true112
  %cond118 = phi i32 [ %call114, %cond.true112 ], [ %conv116, %cond.false115 ]
  br label %cond.end121

cond.false119:                                    ; preds = %cond.end104
  %57 = load i8, i8* %c, align 1
  %conv120 = zext i8 %57 to i32
  br label %cond.end121

cond.end121:                                      ; preds = %cond.false119, %cond.end117
  %cond122 = phi i32 [ %cond118, %cond.end117 ], [ %conv120, %cond.false119 ]
  %cmp123 = icmp eq i32 %cond105, %cond122
  %conv124 = zext i1 %cmp123 to i32
  br label %cond.end125

cond.end125:                                      ; preds = %cond.end121, %cond.true87
  %cond126 = phi i32 [ 1, %cond.true87 ], [ %conv124, %cond.end121 ]
  store i32 %cond126, i32* %retval, align 4
  br label %return

sw.bb127:                                         ; preds = %if.end
  %58 = load i8*, i8** %string.addr, align 4
  %59 = load i8, i8* %58, align 1
  %conv128 = sext i8 %59 to i32
  %cmp129 = icmp ne i32 %conv128, 0
  %conv130 = zext i1 %cmp129 to i32
  store i32 %conv130, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.bb127, %cond.end125, %sw.bb82, %cond.end80, %cond.end67, %cond.end31, %if.then
  %60 = load i32, i32* %retval, align 4
  ret i32 %60
}

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #2

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

; Function Attrs: noinline nounwind
define i32 @umatchlen(i8* %pat, i32 %max) #0 {
entry:
  %retval = alloca i32, align 4
  %pat.addr = alloca i8*, align 4
  %max.addr = alloca i32, align 4
  %c = alloca i8, align 1
  %matlen = alloca i32, align 4
  %bracklen = alloca i32, align 4
  %t = alloca i32, align 4
  %in_cclass = alloca i32, align 4
  %in_collsym = alloca i32, align 4
  %in_equiv = alloca i32, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %max, i32* %max.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %in_equiv, align 4
  store i32 0, i32* %in_collsym, align 4
  store i32 0, i32* %in_cclass, align 4
  store i32 0, i32* %matlen, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %if.end
  %2 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %pat.addr, align 4
  %3 = load i8, i8* %2, align 1
  store i8 %3, i8* %c, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8, i8* %c, align 1
  %conv2 = sext i8 %4 to i32
  switch i32 %conv2, label %sw.default [
    i32 92, label %sw.bb
    i32 63, label %sw.bb11
    i32 42, label %sw.bb19
    i32 43, label %sw.bb20
    i32 33, label %sw.bb20
    i32 64, label %sw.bb20
    i32 91, label %sw.bb28
  ]

sw.default:                                       ; preds = %while.body
  %5 = load i32, i32* %matlen, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %matlen, align 4
  br label %sw.epilog

sw.bb:                                            ; preds = %while.body
  %6 = load i8*, i8** %pat.addr, align 4
  %7 = load i8, i8* %6, align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then6, label %if.else

if.then6:                                         ; preds = %sw.bb
  %8 = load i32, i32* %matlen, align 4
  %inc7 = add nsw i32 %8, 1
  store i32 %inc7, i32* %matlen, align 4
  store i32 %inc7, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %sw.bb
  %9 = load i32, i32* %matlen, align 4
  %inc8 = add nsw i32 %9, 1
  store i32 %inc8, i32* %matlen, align 4
  %10 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr9 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr9, i8** %pat.addr, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  %11 = load i8*, i8** %pat.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv12 = sext i8 %12 to i32
  %cmp13 = icmp eq i32 %conv12, 40
  br i1 %cmp13, label %if.then15, label %if.else16

if.then15:                                        ; preds = %sw.bb11
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else16:                                        ; preds = %sw.bb11
  %13 = load i32, i32* %matlen, align 4
  %inc17 = add nsw i32 %13, 1
  store i32 %inc17, i32* %matlen, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.else16
  br label %sw.epilog

sw.bb19:                                          ; preds = %while.body
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

sw.bb20:                                          ; preds = %while.body, %while.body, %while.body
  %14 = load i8*, i8** %pat.addr, align 4
  %15 = load i8, i8* %14, align 1
  %conv21 = sext i8 %15 to i32
  %cmp22 = icmp eq i32 %conv21, 40
  br i1 %cmp22, label %if.then24, label %if.else25

if.then24:                                        ; preds = %sw.bb20
  store i32 -1, i32* %matlen, align 4
  store i32 -1, i32* %retval, align 4
  br label %return

if.else25:                                        ; preds = %sw.bb20
  %16 = load i32, i32* %matlen, align 4
  %inc26 = add nsw i32 %16, 1
  store i32 %inc26, i32* %matlen, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.else25
  br label %sw.epilog

sw.bb28:                                          ; preds = %while.body
  store i32 1, i32* %bracklen, align 4
  %17 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr29 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr29, i8** %pat.addr, align 4
  %18 = load i8, i8* %17, align 1
  store i8 %18, i8* %c, align 1
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb28
  %19 = load i8, i8* %c, align 1
  %conv30 = sext i8 %19 to i32
  %cmp31 = icmp eq i32 %conv30, 0
  br i1 %cmp31, label %if.then33, label %if.else35

if.then33:                                        ; preds = %do.body
  %20 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %20, i32 -1
  store i8* %incdec.ptr34, i8** %pat.addr, align 4
  %21 = load i32, i32* %bracklen, align 4
  %22 = load i32, i32* %matlen, align 4
  %add = add nsw i32 %22, %21
  store i32 %add, i32* %matlen, align 4
  br label %bad_bracket

if.else35:                                        ; preds = %do.body
  %23 = load i8, i8* %c, align 1
  %conv36 = sext i8 %23 to i32
  %cmp37 = icmp eq i32 %conv36, 92
  br i1 %cmp37, label %if.then39, label %if.else51

if.then39:                                        ; preds = %if.else35
  %24 = load i32, i32* %bracklen, align 4
  %inc40 = add nsw i32 %24, 1
  store i32 %inc40, i32* %bracklen, align 4
  %25 = load i8*, i8** %pat.addr, align 4
  %26 = load i8, i8* %25, align 1
  %conv41 = sext i8 %26 to i32
  %cmp42 = icmp eq i32 %conv41, 0
  br i1 %cmp42, label %if.then48, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then39
  %27 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr44 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr44, i8** %pat.addr, align 4
  %28 = load i8, i8* %incdec.ptr44, align 1
  %conv45 = sext i8 %28 to i32
  %cmp46 = icmp eq i32 %conv45, 0
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %lor.lhs.false, %if.then39
  %29 = load i32, i32* %bracklen, align 4
  %30 = load i32, i32* %matlen, align 4
  %add49 = add nsw i32 %30, %29
  store i32 %add49, i32* %matlen, align 4
  br label %bad_bracket

if.end50:                                         ; preds = %lor.lhs.false
  br label %if.end144

if.else51:                                        ; preds = %if.else35
  %31 = load i8, i8* %c, align 1
  %conv52 = sext i8 %31 to i32
  %cmp53 = icmp eq i32 %conv52, 91
  br i1 %cmp53, label %land.lhs.true, label %if.else61

land.lhs.true:                                    ; preds = %if.else51
  %32 = load i8*, i8** %pat.addr, align 4
  %33 = load i8, i8* %32, align 1
  %conv55 = sext i8 %33 to i32
  %cmp56 = icmp eq i32 %conv55, 58
  br i1 %cmp56, label %if.then58, label %if.else61

if.then58:                                        ; preds = %land.lhs.true
  %34 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr59 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr59, i8** %pat.addr, align 4
  %35 = load i32, i32* %bracklen, align 4
  %inc60 = add nsw i32 %35, 1
  store i32 %inc60, i32* %bracklen, align 4
  store i32 1, i32* %in_cclass, align 4
  br label %if.end143

if.else61:                                        ; preds = %land.lhs.true, %if.else51
  %36 = load i32, i32* %in_cclass, align 4
  %tobool62 = icmp ne i32 %36, 0
  br i1 %tobool62, label %land.lhs.true63, label %if.else74

land.lhs.true63:                                  ; preds = %if.else61
  %37 = load i8, i8* %c, align 1
  %conv64 = sext i8 %37 to i32
  %cmp65 = icmp eq i32 %conv64, 58
  br i1 %cmp65, label %land.lhs.true67, label %if.else74

land.lhs.true67:                                  ; preds = %land.lhs.true63
  %38 = load i8*, i8** %pat.addr, align 4
  %39 = load i8, i8* %38, align 1
  %conv68 = sext i8 %39 to i32
  %cmp69 = icmp eq i32 %conv68, 93
  br i1 %cmp69, label %if.then71, label %if.else74

if.then71:                                        ; preds = %land.lhs.true67
  %40 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr72, i8** %pat.addr, align 4
  %41 = load i32, i32* %bracklen, align 4
  %inc73 = add nsw i32 %41, 1
  store i32 %inc73, i32* %bracklen, align 4
  store i32 0, i32* %in_cclass, align 4
  br label %if.end142

if.else74:                                        ; preds = %land.lhs.true67, %land.lhs.true63, %if.else61
  %42 = load i8, i8* %c, align 1
  %conv75 = sext i8 %42 to i32
  %cmp76 = icmp eq i32 %conv75, 91
  br i1 %cmp76, label %land.lhs.true78, label %if.else92

land.lhs.true78:                                  ; preds = %if.else74
  %43 = load i8*, i8** %pat.addr, align 4
  %44 = load i8, i8* %43, align 1
  %conv79 = sext i8 %44 to i32
  %cmp80 = icmp eq i32 %conv79, 46
  br i1 %cmp80, label %if.then82, label %if.else92

if.then82:                                        ; preds = %land.lhs.true78
  %45 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr83 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr83, i8** %pat.addr, align 4
  %46 = load i32, i32* %bracklen, align 4
  %inc84 = add nsw i32 %46, 1
  store i32 %inc84, i32* %bracklen, align 4
  %47 = load i8*, i8** %pat.addr, align 4
  %48 = load i8, i8* %47, align 1
  %conv85 = sext i8 %48 to i32
  %cmp86 = icmp eq i32 %conv85, 93
  br i1 %cmp86, label %if.then88, label %if.end91

if.then88:                                        ; preds = %if.then82
  %49 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr89 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %incdec.ptr89, i8** %pat.addr, align 4
  %50 = load i32, i32* %bracklen, align 4
  %inc90 = add nsw i32 %50, 1
  store i32 %inc90, i32* %bracklen, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.then88, %if.then82
  store i32 1, i32* %in_collsym, align 4
  br label %if.end141

if.else92:                                        ; preds = %land.lhs.true78, %if.else74
  %51 = load i32, i32* %in_collsym, align 4
  %tobool93 = icmp ne i32 %51, 0
  br i1 %tobool93, label %land.lhs.true94, label %if.else105

land.lhs.true94:                                  ; preds = %if.else92
  %52 = load i8, i8* %c, align 1
  %conv95 = sext i8 %52 to i32
  %cmp96 = icmp eq i32 %conv95, 46
  br i1 %cmp96, label %land.lhs.true98, label %if.else105

land.lhs.true98:                                  ; preds = %land.lhs.true94
  %53 = load i8*, i8** %pat.addr, align 4
  %54 = load i8, i8* %53, align 1
  %conv99 = sext i8 %54 to i32
  %cmp100 = icmp eq i32 %conv99, 93
  br i1 %cmp100, label %if.then102, label %if.else105

if.then102:                                       ; preds = %land.lhs.true98
  %55 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr103 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr103, i8** %pat.addr, align 4
  %56 = load i32, i32* %bracklen, align 4
  %inc104 = add nsw i32 %56, 1
  store i32 %inc104, i32* %bracklen, align 4
  store i32 0, i32* %in_collsym, align 4
  br label %if.end140

if.else105:                                       ; preds = %land.lhs.true98, %land.lhs.true94, %if.else92
  %57 = load i8, i8* %c, align 1
  %conv106 = sext i8 %57 to i32
  %cmp107 = icmp eq i32 %conv106, 91
  br i1 %cmp107, label %land.lhs.true109, label %if.else123

land.lhs.true109:                                 ; preds = %if.else105
  %58 = load i8*, i8** %pat.addr, align 4
  %59 = load i8, i8* %58, align 1
  %conv110 = sext i8 %59 to i32
  %cmp111 = icmp eq i32 %conv110, 61
  br i1 %cmp111, label %if.then113, label %if.else123

if.then113:                                       ; preds = %land.lhs.true109
  %60 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr114 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr114, i8** %pat.addr, align 4
  %61 = load i32, i32* %bracklen, align 4
  %inc115 = add nsw i32 %61, 1
  store i32 %inc115, i32* %bracklen, align 4
  %62 = load i8*, i8** %pat.addr, align 4
  %63 = load i8, i8* %62, align 1
  %conv116 = sext i8 %63 to i32
  %cmp117 = icmp eq i32 %conv116, 93
  br i1 %cmp117, label %if.then119, label %if.end122

if.then119:                                       ; preds = %if.then113
  %64 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr120 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr120, i8** %pat.addr, align 4
  %65 = load i32, i32* %bracklen, align 4
  %inc121 = add nsw i32 %65, 1
  store i32 %inc121, i32* %bracklen, align 4
  br label %if.end122

if.end122:                                        ; preds = %if.then119, %if.then113
  store i32 1, i32* %in_equiv, align 4
  br label %if.end139

if.else123:                                       ; preds = %land.lhs.true109, %if.else105
  %66 = load i32, i32* %in_equiv, align 4
  %tobool124 = icmp ne i32 %66, 0
  br i1 %tobool124, label %land.lhs.true125, label %if.else136

land.lhs.true125:                                 ; preds = %if.else123
  %67 = load i8, i8* %c, align 1
  %conv126 = sext i8 %67 to i32
  %cmp127 = icmp eq i32 %conv126, 61
  br i1 %cmp127, label %land.lhs.true129, label %if.else136

land.lhs.true129:                                 ; preds = %land.lhs.true125
  %68 = load i8*, i8** %pat.addr, align 4
  %69 = load i8, i8* %68, align 1
  %conv130 = sext i8 %69 to i32
  %cmp131 = icmp eq i32 %conv130, 93
  br i1 %cmp131, label %if.then133, label %if.else136

if.then133:                                       ; preds = %land.lhs.true129
  %70 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr134 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %incdec.ptr134, i8** %pat.addr, align 4
  %71 = load i32, i32* %bracklen, align 4
  %inc135 = add nsw i32 %71, 1
  store i32 %inc135, i32* %bracklen, align 4
  store i32 0, i32* %in_equiv, align 4
  br label %if.end138

if.else136:                                       ; preds = %land.lhs.true129, %land.lhs.true125, %if.else123
  %72 = load i32, i32* %bracklen, align 4
  %inc137 = add nsw i32 %72, 1
  store i32 %inc137, i32* %bracklen, align 4
  br label %if.end138

if.end138:                                        ; preds = %if.else136, %if.then133
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.end122
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %if.then102
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.end91
  br label %if.end142

if.end142:                                        ; preds = %if.end141, %if.then71
  br label %if.end143

if.end143:                                        ; preds = %if.end142, %if.then58
  br label %if.end144

if.end144:                                        ; preds = %if.end143, %if.end50
  br label %if.end145

if.end145:                                        ; preds = %if.end144
  br label %do.cond

do.cond:                                          ; preds = %if.end145
  %73 = load i8*, i8** %pat.addr, align 4
  %incdec.ptr146 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr146, i8** %pat.addr, align 4
  %74 = load i8, i8* %73, align 1
  store i8 %74, i8* %c, align 1
  %conv147 = sext i8 %74 to i32
  %cmp148 = icmp ne i32 %conv147, 93
  br i1 %cmp148, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %75 = load i32, i32* %matlen, align 4
  %inc150 = add nsw i32 %75, 1
  store i32 %inc150, i32* %matlen, align 4
  br label %bad_bracket

bad_bracket:                                      ; preds = %do.end, %if.then48, %if.then33
  br label %sw.epilog

sw.epilog:                                        ; preds = %bad_bracket, %if.end27, %if.end18, %if.end10, %sw.default
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %76 = load i32, i32* %matlen, align 4
  store i32 %76, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then24, %sw.bb19, %if.then15, %if.then6, %if.then
  %77 = load i32, i32* %retval, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind
define i8* @glob_dirscan(i8* %pat, i32 %dirsep) #0 {
entry:
  %pat.addr = alloca i8*, align 4
  %dirsep.addr = alloca i32, align 4
  %p = alloca i8*, align 4
  %d = alloca i8*, align 4
  %pe = alloca i8*, align 4
  %se = alloca i8*, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %dirsep, i32* %dirsep.addr, align 4
  store i8* null, i8** %se, align 4
  store i8* null, i8** %pe, align 4
  store i8* null, i8** %d, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  store i8* %0, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %2 = load i8*, i8** %p, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %tobool1, %land.rhs ]
  br i1 %4, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %5 = load i8*, i8** %p, align 4
  %call = call i32 @extglob_pattern_p(i8* %5)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %if.then, label %if.end19

if.then:                                          ; preds = %for.body
  %6 = load i8*, i8** %se, align 4
  %cmp = icmp eq i8* %6, null
  br i1 %cmp, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %7 = load i8*, i8** %p, align 4
  %8 = load i8*, i8** %p, align 4
  %call5 = call i32 @strlen(i8* %8)
  %add.ptr = getelementptr inbounds i8, i8* %7, i32 %call5
  %add.ptr6 = getelementptr inbounds i8, i8* %add.ptr, i32 -1
  store i8* %add.ptr6, i8** %se, align 4
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  %9 = load i8*, i8** %p, align 4
  %add.ptr7 = getelementptr inbounds i8, i8* %9, i32 2
  %10 = load i8*, i8** %se, align 4
  %call8 = call i8* @glob_patscan(i8* %add.ptr7, i8* %10, i32 0)
  store i8* %call8, i8** %pe, align 4
  %11 = load i8*, i8** %pe, align 4
  %cmp9 = icmp eq i8* %11, null
  br i1 %cmp9, label %if.then11, label %if.else

if.then11:                                        ; preds = %if.end
  br label %for.inc

if.else:                                          ; preds = %if.end
  %12 = load i8*, i8** %pe, align 4
  %13 = load i8, i8* %12, align 1
  %conv12 = sext i8 %13 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.else
  br label %for.end

if.end16:                                         ; preds = %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16
  %14 = load i8*, i8** %pe, align 4
  %add.ptr18 = getelementptr inbounds i8, i8* %14, i32 -1
  store i8* %add.ptr18, i8** %p, align 4
  br label %for.inc

if.end19:                                         ; preds = %for.body
  %15 = load i8*, i8** %p, align 4
  %16 = load i8, i8* %15, align 1
  %conv20 = sext i8 %16 to i32
  %17 = load i32, i32* %dirsep.addr, align 4
  %cmp21 = icmp eq i32 %conv20, %17
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end19
  %18 = load i8*, i8** %p, align 4
  store i8* %18, i8** %d, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.end19
  br label %for.inc

for.inc:                                          ; preds = %if.end24, %if.end17, %if.then11
  %19 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then15, %land.end
  %20 = load i8*, i8** %d, align 4
  ret i8* %20
}

declare i32 @strlen(i8*) #1

declare i8* @glob_patscan(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
