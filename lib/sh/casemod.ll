; ModuleID = 'casemod.c'
source_filename = "casemod.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@.str = private unnamed_addr constant [10 x i8] c"casemod.c\00", align 1
@locale_mb_cur_max = external global i32, align 4
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define i8* @sh_modcase(i8* %string, i8* %pat, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %pat.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %start = alloca i32, align 4
  %next = alloca i32, align 4
  %end = alloca i32, align 4
  %retind = alloca i32, align 4
  %inword = alloca i32, align 4
  %c = alloca i32, align 4
  %nc = alloca i32, align 4
  %nop = alloca i32, align 4
  %match = alloca i32, align 4
  %usewords = alloca i32, align 4
  %ret = alloca i8*, align 4
  %s = alloca i8*, align 4
  %wc = alloca i32, align 4
  %mb_cur_max = alloca i32, align 4
  %nwc = alloca i32, align 4
  %mb = alloca [17 x i8], align 1
  %mlen = alloca i32, align 4
  %m = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  %state_bak238 = alloca %struct.__mbstate_t, align 4
  %mblength239 = alloca i32, align 4
  %_f240 = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 123)
  store i8* %call, i8** %ret, align 4
  %3 = load i8*, i8** %ret, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  store i8 0, i8* %arrayidx, align 1
  %4 = load i8*, i8** %ret, align 4
  store i8* %4, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %5 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %5, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %start, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %call3 = call i32 @strlen(i8* %6)
  store i32 %call3, i32* %end, align 4
  %call4 = call i32 @__ctype_get_mb_cur_max()
  store i32 %call4, i32* %mb_cur_max, align 4
  %7 = load i32, i32* %end, align 4
  %mul = mul nsw i32 2, %7
  %add = add nsw i32 %mul, 1
  %call5 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 136)
  store i8* %call5, i8** %ret, align 4
  store i32 0, i32* %retind, align 4
  %8 = load i32, i32* %flags.addr, align 4
  %and = and i32 %8, 4096
  store i32 %and, i32* %usewords, align 4
  %9 = load i32, i32* %flags.addr, align 4
  %and6 = and i32 %9, -4097
  store i32 %and6, i32* %flags.addr, align 4
  store i32 0, i32* %inword, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end269, %if.then49, %if.end
  %10 = load i32, i32* %start, align 4
  %11 = load i32, i32* %end, align 4
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load i8*, i8** %string.addr, align 4
  %13 = load i32, i32* %start, align 4
  %call9 = call i32 @cval(i8* %12, i32 %13)
  store i32 %call9, i32* %wc, align 4
  %14 = load i32, i32* %wc, align 4
  %call10 = call i32 @iswalnum(i32 %14)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %while.body
  store i32 0, i32* %inword, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %while.body
  %15 = load i8*, i8** %pat.addr, align 4
  %tobool = icmp ne i8* %15, null
  br i1 %tobool, label %if.then15, label %if.end56

if.then15:                                        ; preds = %if.end14
  %16 = load i32, i32* %start, align 4
  store i32 %16, i32* %next, align 4
  br label %do.body

do.body:                                          ; preds = %if.then15
  %17 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp16 = icmp sgt i32 %17, 1
  br i1 %cmp16, label %if.then18, label %if.else40

if.then18:                                        ; preds = %do.body
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %next, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx19, align 1
  %call20 = call i32 @is_basic(i8 signext %20)
  store i32 %call20, i32* %_f, align 4
  %21 = load i32, i32* %_f, align 4
  %tobool21 = icmp ne i32 %21, 0
  br i1 %tobool21, label %if.then22, label %if.else

if.then22:                                        ; preds = %if.then18
  store i32 1, i32* %mblength, align 4
  br label %if.end24

if.else:                                          ; preds = %if.then18
  %22 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %23 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %22, i8* %23, i32 8, i32 4, i1 false)
  %24 = load i8*, i8** %string.addr, align 4
  %25 = load i32, i32* %next, align 4
  %add.ptr = getelementptr inbounds i8, i8* %24, i32 %25
  %26 = load i32, i32* %end, align 4
  %27 = load i32, i32* %next, align 4
  %sub = sub nsw i32 %26, %27
  %call23 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call23, i32* %mblength, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else, %if.then22
  %28 = load i32, i32* %mblength, align 4
  %cmp25 = icmp eq i32 %28, -2
  br i1 %cmp25, label %if.then30, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %if.end24
  %29 = load i32, i32* %mblength, align 4
  %cmp28 = icmp eq i32 %29, -1
  br i1 %cmp28, label %if.then30, label %if.else31

if.then30:                                        ; preds = %lor.lhs.false27, %if.end24
  %30 = bitcast %struct.__mbstate_t* %state to i8*
  %31 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %30, i8* %31, i32 8, i32 4, i1 false)
  %32 = load i32, i32* %next, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %next, align 4
  br label %if.end39

if.else31:                                        ; preds = %lor.lhs.false27
  %33 = load i32, i32* %mblength, align 4
  %cmp32 = icmp eq i32 %33, 0
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %if.else31
  %34 = load i32, i32* %next, align 4
  %inc35 = add nsw i32 %34, 1
  store i32 %inc35, i32* %next, align 4
  br label %if.end38

if.else36:                                        ; preds = %if.else31
  %35 = load i32, i32* %mblength, align 4
  %36 = load i32, i32* %next, align 4
  %add37 = add i32 %36, %35
  store i32 %add37, i32* %next, align 4
  br label %if.end38

if.end38:                                         ; preds = %if.else36, %if.then34
  br label %if.end39

if.end39:                                         ; preds = %if.end38, %if.then30
  br label %if.end42

if.else40:                                        ; preds = %do.body
  %37 = load i32, i32* %next, align 4
  %inc41 = add nsw i32 %37, 1
  store i32 %inc41, i32* %next, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.else40, %if.end39
  br label %do.end

do.end:                                           ; preds = %if.end42
  %38 = load i8*, i8** %string.addr, align 4
  %39 = load i32, i32* %start, align 4
  %40 = load i32, i32* %next, align 4
  %call43 = call i8* @substring(i8* %38, i32 %39, i32 %40)
  store i8* %call43, i8** %s, align 4
  %41 = load i8*, i8** %pat.addr, align 4
  %42 = load i8*, i8** %s, align 4
  %call44 = call i32 @strmatch(i8* %41, i8* %42, i32 32)
  %cmp45 = icmp ne i32 %call44, 1
  %conv46 = zext i1 %cmp45 to i32
  store i32 %conv46, i32* %match, align 4
  %43 = load i8*, i8** %s, align 4
  call void @sh_xfree(i8* %43, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 157)
  %44 = load i32, i32* %match, align 4
  %cmp47 = icmp eq i32 %44, 0
  br i1 %cmp47, label %if.then49, label %if.end55

if.then49:                                        ; preds = %do.end
  %45 = load i8*, i8** %ret, align 4
  %46 = load i32, i32* %retind, align 4
  %add.ptr50 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8*, i8** %string.addr, align 4
  %48 = load i32, i32* %start, align 4
  %add.ptr51 = getelementptr inbounds i8, i8* %47, i32 %48
  %49 = load i32, i32* %next, align 4
  %50 = load i32, i32* %start, align 4
  %sub52 = sub nsw i32 %49, %50
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %add.ptr50, i8* %add.ptr51, i32 %sub52, i32 1, i1 false)
  %51 = load i32, i32* %next, align 4
  %52 = load i32, i32* %start, align 4
  %sub53 = sub nsw i32 %51, %52
  %53 = load i32, i32* %retind, align 4
  %add54 = add nsw i32 %53, %sub53
  store i32 %add54, i32* %retind, align 4
  %54 = load i32, i32* %next, align 4
  store i32 %54, i32* %start, align 4
  store i32 1, i32* %inword, align 4
  br label %while.cond

if.end55:                                         ; preds = %do.end
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end14
  %55 = load i32, i32* %flags.addr, align 4
  %cmp57 = icmp eq i32 %55, 4
  br i1 %cmp57, label %if.then59, label %if.else68

if.then59:                                        ; preds = %if.end56
  %56 = load i32, i32* %usewords, align 4
  %tobool60 = icmp ne i32 %56, 0
  br i1 %tobool60, label %if.then61, label %if.else63

if.then61:                                        ; preds = %if.then59
  %57 = load i32, i32* %inword, align 4
  %tobool62 = icmp ne i32 %57, 0
  %cond = select i1 %tobool62, i32 1, i32 2
  store i32 %cond, i32* %nop, align 4
  br label %if.end67

if.else63:                                        ; preds = %if.then59
  %58 = load i32, i32* %start, align 4
  %cmp64 = icmp sgt i32 %58, 0
  %cond66 = select i1 %cmp64, i32 1, i32 2
  store i32 %cond66, i32* %nop, align 4
  br label %if.end67

if.end67:                                         ; preds = %if.else63, %if.then61
  store i32 1, i32* %inword, align 4
  br label %if.end118

if.else68:                                        ; preds = %if.end56
  %59 = load i32, i32* %flags.addr, align 4
  %cmp69 = icmp eq i32 %59, 8
  br i1 %cmp69, label %if.then71, label %if.else81

if.then71:                                        ; preds = %if.else68
  %60 = load i32, i32* %usewords, align 4
  %tobool72 = icmp ne i32 %60, 0
  br i1 %tobool72, label %if.then73, label %if.else76

if.then73:                                        ; preds = %if.then71
  %61 = load i32, i32* %inword, align 4
  %tobool74 = icmp ne i32 %61, 0
  %cond75 = select i1 %tobool74, i32 2, i32 1
  store i32 %cond75, i32* %nop, align 4
  br label %if.end80

if.else76:                                        ; preds = %if.then71
  %62 = load i32, i32* %start, align 4
  %cmp77 = icmp sgt i32 %62, 0
  %cond79 = select i1 %cmp77, i32 2, i32 1
  store i32 %cond79, i32* %nop, align 4
  br label %if.end80

if.end80:                                         ; preds = %if.else76, %if.then73
  store i32 1, i32* %inword, align 4
  br label %if.end117

if.else81:                                        ; preds = %if.else68
  %63 = load i32, i32* %flags.addr, align 4
  %cmp82 = icmp eq i32 %63, 64
  br i1 %cmp82, label %if.then84, label %if.else94

if.then84:                                        ; preds = %if.else81
  %64 = load i32, i32* %usewords, align 4
  %tobool85 = icmp ne i32 %64, 0
  br i1 %tobool85, label %if.then86, label %if.else89

if.then86:                                        ; preds = %if.then84
  %65 = load i32, i32* %inword, align 4
  %tobool87 = icmp ne i32 %65, 0
  %cond88 = select i1 %tobool87, i32 0, i32 2
  store i32 %cond88, i32* %nop, align 4
  br label %if.end93

if.else89:                                        ; preds = %if.then84
  %66 = load i32, i32* %start, align 4
  %cmp90 = icmp sgt i32 %66, 0
  %cond92 = select i1 %cmp90, i32 0, i32 2
  store i32 %cond92, i32* %nop, align 4
  br label %if.end93

if.end93:                                         ; preds = %if.else89, %if.then86
  store i32 1, i32* %inword, align 4
  br label %if.end116

if.else94:                                        ; preds = %if.else81
  %67 = load i32, i32* %flags.addr, align 4
  %cmp95 = icmp eq i32 %67, 128
  br i1 %cmp95, label %if.then97, label %if.else107

if.then97:                                        ; preds = %if.else94
  %68 = load i32, i32* %usewords, align 4
  %tobool98 = icmp ne i32 %68, 0
  br i1 %tobool98, label %if.then99, label %if.else102

if.then99:                                        ; preds = %if.then97
  %69 = load i32, i32* %inword, align 4
  %tobool100 = icmp ne i32 %69, 0
  %cond101 = select i1 %tobool100, i32 0, i32 1
  store i32 %cond101, i32* %nop, align 4
  br label %if.end106

if.else102:                                       ; preds = %if.then97
  %70 = load i32, i32* %start, align 4
  %cmp103 = icmp sgt i32 %70, 0
  %cond105 = select i1 %cmp103, i32 0, i32 1
  store i32 %cond105, i32* %nop, align 4
  br label %if.end106

if.end106:                                        ; preds = %if.else102, %if.then99
  store i32 1, i32* %inword, align 4
  br label %if.end115

if.else107:                                       ; preds = %if.else94
  %71 = load i32, i32* %flags.addr, align 4
  %cmp108 = icmp eq i32 %71, 16
  br i1 %cmp108, label %if.then110, label %if.else113

if.then110:                                       ; preds = %if.else107
  %72 = load i32, i32* %inword, align 4
  %tobool111 = icmp ne i32 %72, 0
  %cond112 = select i1 %tobool111, i32 0, i32 16
  store i32 %cond112, i32* %nop, align 4
  store i32 1, i32* %inword, align 4
  br label %if.end114

if.else113:                                       ; preds = %if.else107
  %73 = load i32, i32* %flags.addr, align 4
  store i32 %73, i32* %nop, align 4
  br label %if.end114

if.end114:                                        ; preds = %if.else113, %if.then110
  br label %if.end115

if.end115:                                        ; preds = %if.end114, %if.end106
  br label %if.end116

if.end116:                                        ; preds = %if.end115, %if.end93
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.end80
  br label %if.end118

if.end118:                                        ; preds = %if.end117, %if.end67
  %74 = load i32, i32* %mb_cur_max, align 4
  %cmp119 = icmp eq i32 %74, 1
  br i1 %cmp119, label %if.then121, label %if.else157

if.then121:                                       ; preds = %if.end118
  br label %singlebyte

singlebyte:                                       ; preds = %if.then169, %if.then121
  %75 = load i32, i32* %nop, align 4
  switch i32 %75, label %sw.default [
    i32 0, label %sw.bb
    i32 2, label %sw.bb122
    i32 1, label %sw.bb129
    i32 32, label %sw.bb139
    i32 16, label %sw.bb139
  ]

sw.default:                                       ; preds = %singlebyte
  br label %sw.bb

sw.bb:                                            ; preds = %singlebyte, %sw.default
  %76 = load i32, i32* %wc, align 4
  store i32 %76, i32* %nc, align 4
  br label %sw.epilog

sw.bb122:                                         ; preds = %singlebyte
  %77 = load i32, i32* %wc, align 4
  %conv123 = trunc i32 %77 to i8
  %conv124 = zext i8 %conv123 to i32
  %call125 = call i32 @islower(i32 %conv124) #4
  %tobool126 = icmp ne i32 %call125, 0
  br i1 %tobool126, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.bb122
  %78 = load i32, i32* %wc, align 4
  %call127 = call i32 @toupper(i32 %78) #4
  br label %cond.end

cond.false:                                       ; preds = %sw.bb122
  %79 = load i32, i32* %wc, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond128 = phi i32 [ %call127, %cond.true ], [ %79, %cond.false ]
  store i32 %cond128, i32* %nc, align 4
  br label %sw.epilog

sw.bb129:                                         ; preds = %singlebyte
  %80 = load i32, i32* %wc, align 4
  %conv130 = trunc i32 %80 to i8
  %conv131 = zext i8 %conv130 to i32
  %call132 = call i32 @isupper(i32 %conv131) #4
  %tobool133 = icmp ne i32 %call132, 0
  br i1 %tobool133, label %cond.true134, label %cond.false136

cond.true134:                                     ; preds = %sw.bb129
  %81 = load i32, i32* %wc, align 4
  %call135 = call i32 @tolower(i32 %81) #4
  br label %cond.end137

cond.false136:                                    ; preds = %sw.bb129
  %82 = load i32, i32* %wc, align 4
  br label %cond.end137

cond.end137:                                      ; preds = %cond.false136, %cond.true134
  %cond138 = phi i32 [ %call135, %cond.true134 ], [ %82, %cond.false136 ]
  store i32 %cond138, i32* %nc, align 4
  br label %sw.epilog

sw.bb139:                                         ; preds = %singlebyte, %singlebyte
  %83 = load i32, i32* %wc, align 4
  %call140 = call i32 @iswupper(i32 %83)
  %tobool141 = icmp ne i32 %call140, 0
  br i1 %tobool141, label %cond.true142, label %cond.false144

cond.true142:                                     ; preds = %sw.bb139
  %84 = load i32, i32* %wc, align 4
  %call143 = call i32 @towlower(i32 %84)
  br label %cond.end152

cond.false144:                                    ; preds = %sw.bb139
  %85 = load i32, i32* %wc, align 4
  %call145 = call i32 @iswlower(i32 %85)
  %tobool146 = icmp ne i32 %call145, 0
  br i1 %tobool146, label %cond.true147, label %cond.false149

cond.true147:                                     ; preds = %cond.false144
  %86 = load i32, i32* %wc, align 4
  %call148 = call i32 @towupper(i32 %86)
  br label %cond.end150

cond.false149:                                    ; preds = %cond.false144
  %87 = load i32, i32* %wc, align 4
  br label %cond.end150

cond.end150:                                      ; preds = %cond.false149, %cond.true147
  %cond151 = phi i32 [ %call148, %cond.true147 ], [ %87, %cond.false149 ]
  br label %cond.end152

cond.end152:                                      ; preds = %cond.end150, %cond.true142
  %cond153 = phi i32 [ %call143, %cond.true142 ], [ %cond151, %cond.end150 ]
  store i32 %cond153, i32* %nc, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %cond.end152, %cond.end137, %cond.end, %sw.bb
  %88 = load i32, i32* %nc, align 4
  %conv154 = trunc i32 %88 to i8
  %89 = load i8*, i8** %ret, align 4
  %90 = load i32, i32* %retind, align 4
  %inc155 = add nsw i32 %90, 1
  store i32 %inc155, i32* %retind, align 4
  %arrayidx156 = getelementptr inbounds i8, i8* %89, i32 %90
  store i8 %conv154, i8* %arrayidx156, align 1
  br label %if.end233

if.else157:                                       ; preds = %if.end118
  %91 = load i8*, i8** %string.addr, align 4
  %92 = load i32, i32* %start, align 4
  %add.ptr158 = getelementptr inbounds i8, i8* %91, i32 %92
  %93 = load i32, i32* %end, align 4
  %94 = load i32, i32* %start, align 4
  %sub159 = sub nsw i32 %93, %94
  %call160 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr158, i32 %sub159, %struct.__mbstate_t* %state)
  store i32 %call160, i32* %m, align 4
  %95 = load i32, i32* %m, align 4
  %cmp161 = icmp eq i32 %95, -1
  br i1 %cmp161, label %if.then169, label %lor.lhs.false163

lor.lhs.false163:                                 ; preds = %if.else157
  %96 = load i32, i32* %m, align 4
  %cmp164 = icmp eq i32 %96, -2
  br i1 %cmp164, label %if.then169, label %lor.lhs.false166

lor.lhs.false166:                                 ; preds = %lor.lhs.false163
  %97 = load i32, i32* %m, align 4
  %cmp167 = icmp eq i32 %97, 1
  br i1 %cmp167, label %if.then169, label %if.else172

if.then169:                                       ; preds = %lor.lhs.false166, %lor.lhs.false163, %if.else157
  %98 = load i8*, i8** %string.addr, align 4
  %99 = load i32, i32* %start, align 4
  %arrayidx170 = getelementptr inbounds i8, i8* %98, i32 %99
  %100 = load i8, i8* %arrayidx170, align 1
  %conv171 = zext i8 %100 to i32
  store i32 %conv171, i32* %wc, align 4
  br label %singlebyte

if.else172:                                       ; preds = %lor.lhs.false166
  %101 = load i32, i32* %m, align 4
  %cmp173 = icmp eq i32 %101, 0
  br i1 %cmp173, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.else172
  store i32 0, i32* %wc, align 4
  br label %if.end176

if.end176:                                        ; preds = %if.then175, %if.else172
  br label %if.end177

if.end177:                                        ; preds = %if.end176
  %102 = load i32, i32* %nop, align 4
  switch i32 %102, label %sw.default178 [
    i32 0, label %sw.bb179
    i32 2, label %sw.bb180
    i32 1, label %sw.bb188
    i32 32, label %sw.bb196
    i32 16, label %sw.bb196
  ]

sw.default178:                                    ; preds = %if.end177
  br label %sw.bb179

sw.bb179:                                         ; preds = %if.end177, %sw.default178
  %103 = load i32, i32* %wc, align 4
  store i32 %103, i32* %nwc, align 4
  br label %sw.epilog211

sw.bb180:                                         ; preds = %if.end177
  %104 = load i32, i32* %wc, align 4
  %call181 = call i32 @iswlower(i32 %104)
  %tobool182 = icmp ne i32 %call181, 0
  br i1 %tobool182, label %cond.true183, label %cond.false185

cond.true183:                                     ; preds = %sw.bb180
  %105 = load i32, i32* %wc, align 4
  %call184 = call i32 @towupper(i32 %105)
  br label %cond.end186

cond.false185:                                    ; preds = %sw.bb180
  %106 = load i32, i32* %wc, align 4
  br label %cond.end186

cond.end186:                                      ; preds = %cond.false185, %cond.true183
  %cond187 = phi i32 [ %call184, %cond.true183 ], [ %106, %cond.false185 ]
  store i32 %cond187, i32* %nwc, align 4
  br label %sw.epilog211

sw.bb188:                                         ; preds = %if.end177
  %107 = load i32, i32* %wc, align 4
  %call189 = call i32 @iswupper(i32 %107)
  %tobool190 = icmp ne i32 %call189, 0
  br i1 %tobool190, label %cond.true191, label %cond.false193

cond.true191:                                     ; preds = %sw.bb188
  %108 = load i32, i32* %wc, align 4
  %call192 = call i32 @towlower(i32 %108)
  br label %cond.end194

cond.false193:                                    ; preds = %sw.bb188
  %109 = load i32, i32* %wc, align 4
  br label %cond.end194

cond.end194:                                      ; preds = %cond.false193, %cond.true191
  %cond195 = phi i32 [ %call192, %cond.true191 ], [ %109, %cond.false193 ]
  store i32 %cond195, i32* %nwc, align 4
  br label %sw.epilog211

sw.bb196:                                         ; preds = %if.end177, %if.end177
  %110 = load i32, i32* %wc, align 4
  %call197 = call i32 @iswupper(i32 %110)
  %tobool198 = icmp ne i32 %call197, 0
  br i1 %tobool198, label %cond.true199, label %cond.false201

cond.true199:                                     ; preds = %sw.bb196
  %111 = load i32, i32* %wc, align 4
  %call200 = call i32 @towlower(i32 %111)
  br label %cond.end209

cond.false201:                                    ; preds = %sw.bb196
  %112 = load i32, i32* %wc, align 4
  %call202 = call i32 @iswlower(i32 %112)
  %tobool203 = icmp ne i32 %call202, 0
  br i1 %tobool203, label %cond.true204, label %cond.false206

cond.true204:                                     ; preds = %cond.false201
  %113 = load i32, i32* %wc, align 4
  %call205 = call i32 @towupper(i32 %113)
  br label %cond.end207

cond.false206:                                    ; preds = %cond.false201
  %114 = load i32, i32* %wc, align 4
  br label %cond.end207

cond.end207:                                      ; preds = %cond.false206, %cond.true204
  %cond208 = phi i32 [ %call205, %cond.true204 ], [ %114, %cond.false206 ]
  br label %cond.end209

cond.end209:                                      ; preds = %cond.end207, %cond.true199
  %cond210 = phi i32 [ %call200, %cond.true199 ], [ %cond208, %cond.end207 ]
  store i32 %cond210, i32* %nwc, align 4
  br label %sw.epilog211

sw.epilog211:                                     ; preds = %cond.end209, %cond.end194, %cond.end186, %sw.bb179
  %115 = load i32, i32* %nwc, align 4
  %cmp212 = icmp sle i32 %115, 255
  br i1 %cmp212, label %land.lhs.true, label %if.else221

land.lhs.true:                                    ; preds = %sw.epilog211
  %116 = load i32, i32* %nwc, align 4
  %conv214 = trunc i32 %116 to i8
  %call215 = call i32 @is_basic(i8 signext %conv214)
  %tobool216 = icmp ne i32 %call215, 0
  br i1 %tobool216, label %if.then217, label %if.else221

if.then217:                                       ; preds = %land.lhs.true
  %117 = load i32, i32* %nwc, align 4
  %conv218 = trunc i32 %117 to i8
  %118 = load i8*, i8** %ret, align 4
  %119 = load i32, i32* %retind, align 4
  %inc219 = add nsw i32 %119, 1
  store i32 %inc219, i32* %retind, align 4
  %arrayidx220 = getelementptr inbounds i8, i8* %118, i32 %119
  store i8 %conv218, i8* %arrayidx220, align 1
  br label %if.end232

if.else221:                                       ; preds = %land.lhs.true, %sw.epilog211
  %arraydecay = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %120 = load i32, i32* %nwc, align 4
  %call222 = call i32 @wcrtomb(i8* %arraydecay, i32 %120, %struct.__mbstate_t* %state)
  store i32 %call222, i32* %mlen, align 4
  %121 = load i32, i32* %mlen, align 4
  %cmp223 = icmp sgt i32 %121, 0
  br i1 %cmp223, label %if.then225, label %if.end227

if.then225:                                       ; preds = %if.else221
  %122 = load i32, i32* %mlen, align 4
  %arrayidx226 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 %122
  store i8 0, i8* %arrayidx226, align 1
  br label %if.end227

if.end227:                                        ; preds = %if.then225, %if.else221
  %123 = load i8*, i8** %ret, align 4
  %124 = load i32, i32* %retind, align 4
  %add.ptr228 = getelementptr inbounds i8, i8* %123, i32 %124
  %arraydecay229 = getelementptr inbounds [17 x i8], [17 x i8]* %mb, i32 0, i32 0
  %125 = load i32, i32* %mlen, align 4
  %call230 = call i8* @strncpy(i8* %add.ptr228, i8* %arraydecay229, i32 %125)
  %126 = load i32, i32* %mlen, align 4
  %127 = load i32, i32* %retind, align 4
  %add231 = add nsw i32 %127, %126
  store i32 %add231, i32* %retind, align 4
  br label %if.end232

if.end232:                                        ; preds = %if.end227, %if.then217
  br label %if.end233

if.end233:                                        ; preds = %if.end232, %sw.epilog
  br label %do.body234

do.body234:                                       ; preds = %if.end233
  %128 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp235 = icmp sgt i32 %128, 1
  br i1 %cmp235, label %if.then237, label %if.else266

if.then237:                                       ; preds = %do.body234
  %129 = load i8*, i8** %string.addr, align 4
  %130 = load i32, i32* %start, align 4
  %arrayidx241 = getelementptr inbounds i8, i8* %129, i32 %130
  %131 = load i8, i8* %arrayidx241, align 1
  %call242 = call i32 @is_basic(i8 signext %131)
  store i32 %call242, i32* %_f240, align 4
  %132 = load i32, i32* %_f240, align 4
  %tobool243 = icmp ne i32 %132, 0
  br i1 %tobool243, label %if.then244, label %if.else245

if.then244:                                       ; preds = %if.then237
  store i32 1, i32* %mblength239, align 4
  br label %if.end249

if.else245:                                       ; preds = %if.then237
  %133 = bitcast %struct.__mbstate_t* %state_bak238 to i8*
  %134 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %133, i8* %134, i32 8, i32 4, i1 false)
  %135 = load i8*, i8** %string.addr, align 4
  %136 = load i32, i32* %start, align 4
  %add.ptr246 = getelementptr inbounds i8, i8* %135, i32 %136
  %137 = load i32, i32* %end, align 4
  %138 = load i32, i32* %start, align 4
  %sub247 = sub nsw i32 %137, %138
  %call248 = call i32 @mbrlen(i8* %add.ptr246, i32 %sub247, %struct.__mbstate_t* %state)
  store i32 %call248, i32* %mblength239, align 4
  br label %if.end249

if.end249:                                        ; preds = %if.else245, %if.then244
  %139 = load i32, i32* %mblength239, align 4
  %cmp250 = icmp eq i32 %139, -2
  br i1 %cmp250, label %if.then255, label %lor.lhs.false252

lor.lhs.false252:                                 ; preds = %if.end249
  %140 = load i32, i32* %mblength239, align 4
  %cmp253 = icmp eq i32 %140, -1
  br i1 %cmp253, label %if.then255, label %if.else257

if.then255:                                       ; preds = %lor.lhs.false252, %if.end249
  %141 = bitcast %struct.__mbstate_t* %state to i8*
  %142 = bitcast %struct.__mbstate_t* %state_bak238 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %141, i8* %142, i32 8, i32 4, i1 false)
  %143 = load i32, i32* %start, align 4
  %inc256 = add nsw i32 %143, 1
  store i32 %inc256, i32* %start, align 4
  br label %if.end265

if.else257:                                       ; preds = %lor.lhs.false252
  %144 = load i32, i32* %mblength239, align 4
  %cmp258 = icmp eq i32 %144, 0
  br i1 %cmp258, label %if.then260, label %if.else262

if.then260:                                       ; preds = %if.else257
  %145 = load i32, i32* %start, align 4
  %inc261 = add nsw i32 %145, 1
  store i32 %inc261, i32* %start, align 4
  br label %if.end264

if.else262:                                       ; preds = %if.else257
  %146 = load i32, i32* %mblength239, align 4
  %147 = load i32, i32* %start, align 4
  %add263 = add i32 %147, %146
  store i32 %add263, i32* %start, align 4
  br label %if.end264

if.end264:                                        ; preds = %if.else262, %if.then260
  br label %if.end265

if.end265:                                        ; preds = %if.end264, %if.then255
  br label %if.end268

if.else266:                                       ; preds = %do.body234
  %148 = load i32, i32* %start, align 4
  %inc267 = add nsw i32 %148, 1
  store i32 %inc267, i32* %start, align 4
  br label %if.end268

if.end268:                                        ; preds = %if.else266, %if.end265
  br label %do.end269

do.end269:                                        ; preds = %if.end268
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %149 = load i8*, i8** %ret, align 4
  %150 = load i32, i32* %retind, align 4
  %arrayidx270 = getelementptr inbounds i8, i8* %149, i32 %150
  store i8 0, i8* %arrayidx270, align 1
  %151 = load i8*, i8** %ret, align 4
  store i8* %151, i8** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then
  %152 = load i8*, i8** %retval, align 4
  ret i8* %152
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #2

declare i32 @strlen(i8*) #1

declare i32 @__ctype_get_mb_cur_max() #1

; Function Attrs: noinline nounwind
define internal i32 @cval(i8* %s, i32 %i) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %i.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %wc = alloca i32, align 4
  %l = alloca i32, align 4
  %mps = alloca %struct.__mbstate_t, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  %call = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %0 = load i8*, i8** %s.addr, align 4
  %1 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %call4 = call i32 @is_basic(i8 signext %2)
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i32, i32* %i.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i32 %4
  %5 = load i8, i8* %arrayidx5, align 1
  %conv = sext i8 %5 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i8*, i8** %s.addr, align 4
  %call6 = call i32 @strlen(i8* %6)
  store i32 %call6, i32* %l, align 4
  %7 = load i32, i32* %i.addr, align 4
  %8 = load i32, i32* %l, align 4
  %sub = sub nsw i32 %8, 1
  %cmp7 = icmp sge i32 %7, %sub
  br i1 %cmp7, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end
  %9 = load i8*, i8** %s.addr, align 4
  %10 = load i32, i32* %i.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %11 to i32
  store i32 %conv11, i32* %retval, align 4
  br label %return

if.end12:                                         ; preds = %if.end
  %12 = bitcast %struct.__mbstate_t* %mps to i8*
  call void @llvm.memset.p0i8.i32(i8* %12, i8 0, i32 8, i32 4, i1 false)
  %13 = load i8*, i8** %s.addr, align 4
  %14 = load i32, i32* %i.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %13, i32 %14
  %15 = load i32, i32* %l, align 4
  %16 = load i32, i32* %i.addr, align 4
  %sub13 = sub nsw i32 %15, %16
  %call14 = call i32 @mbrtowc(i32* %wc, i8* %add.ptr, i32 %sub13, %struct.__mbstate_t* %mps)
  store i32 %call14, i32* %tmp, align 4
  %17 = load i32, i32* %tmp, align 4
  %cmp15 = icmp eq i32 %17, -1
  br i1 %cmp15, label %if.then23, label %lor.lhs.false17

lor.lhs.false17:                                  ; preds = %if.end12
  %18 = load i32, i32* %tmp, align 4
  %cmp18 = icmp eq i32 %18, -2
  br i1 %cmp18, label %if.then23, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %lor.lhs.false17
  %19 = load i32, i32* %tmp, align 4
  %cmp21 = icmp eq i32 %19, 0
  br i1 %cmp21, label %if.then23, label %if.end26

if.then23:                                        ; preds = %lor.lhs.false20, %lor.lhs.false17, %if.end12
  %20 = load i8*, i8** %s.addr, align 4
  %21 = load i32, i32* %i.addr, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %20, i32 %21
  %22 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %22 to i32
  store i32 %conv25, i32* %retval, align 4
  br label %return

if.end26:                                         ; preds = %lor.lhs.false20
  %23 = load i32, i32* %wc, align 4
  store i32 %23, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end26, %if.then23, %if.then9, %if.then
  %24 = load i32, i32* %retval, align 4
  ret i32 %24
}

declare i32 @iswalnum(i32) #1

; Function Attrs: noinline nounwind
define internal i32 @is_basic(i8 signext %c) #0 {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8, i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %shr = ashr i32 %conv, 5
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @is_basic_table, i32 0, i32 %shr
  %1 = load i32, i32* %arrayidx, align 4
  %2 = load i8, i8* %c.addr, align 1
  %conv1 = zext i8 %2 to i32
  %and = and i32 %conv1, 31
  %shr2 = lshr i32 %1, %and
  %and3 = and i32 %shr2, 1
  ret i32 %and3
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #1

declare i8* @substring(i8*, i32, i32) #1

declare i32 @strmatch(i8*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #3

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @isupper(i32) #3

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #3

declare i32 @iswupper(i32) #1

declare i32 @towlower(i32) #1

declare i32 @iswlower(i32) #1

declare i32 @towupper(i32) #1

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

declare i32 @wcrtomb(i8*, i32, %struct.__mbstate_t*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
