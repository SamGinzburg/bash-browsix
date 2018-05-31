; ModuleID = 'strtrans.c'
source_filename = "strtrans.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"strtrans.c\00", align 1
@is_basic_table = external constant [0 x i32], align 4

; Function Attrs: noinline nounwind
define i8* @ansicstr(i8* %string, i32 %len, i32 %flags, i32* %sawc, i32* %rlen) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %sawc.addr = alloca i32*, align 4
  %rlen.addr = alloca i32*, align 4
  %c = alloca i32, align 4
  %temp = alloca i32, align 4
  %ret = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  %v = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %sawc, i32** %sawc.addr, align 4
  store i32* %rlen, i32** %rlen.addr, align 4
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
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i32, i32* %len.addr, align 4
  %mul = mul nsw i32 4, %3
  %add = add nsw i32 %mul, 1
  store i32 %add, i32* %temp, align 4
  %4 = load i32, i32* %temp, align 4
  %cmp3 = icmp slt i32 %4, 12
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i32 12, i32* %temp, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %5 = load i32, i32* %temp, align 4
  %call = call i8* @sh_xmalloc(i32 %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 66)
  store i8* %call, i8** %ret, align 4
  %6 = load i8*, i8** %ret, align 4
  store i8* %6, i8** %r, align 4
  %7 = load i8*, i8** %string.addr, align 4
  store i8* %7, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end312, %if.else229, %if.end6
  %8 = load i8*, i8** %s, align 4
  %tobool = icmp ne i8* %8, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %9 = load i8*, i8** %s, align 4
  %10 = load i8, i8* %9, align 1
  %conv7 = sext i8 %10 to i32
  %tobool8 = icmp ne i32 %conv7, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %11 = phi i1 [ false, %for.cond ], [ %tobool8, %land.rhs ]
  br i1 %11, label %for.body, label %for.end313

for.body:                                         ; preds = %land.end
  %12 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %13 = load i8, i8* %12, align 1
  %conv9 = sext i8 %13 to i32
  store i32 %conv9, i32* %c, align 4
  %14 = load i32, i32* %c, align 4
  %cmp10 = icmp ne i32 %14, 92
  br i1 %cmp10, label %if.then16, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %for.body
  %15 = load i8*, i8** %s, align 4
  %16 = load i8, i8* %15, align 1
  %conv13 = sext i8 %16 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then16, label %if.else

if.then16:                                        ; preds = %lor.lhs.false12, %for.body
  %17 = load i32, i32* %c, align 4
  %conv17 = trunc i32 %17 to i8
  %18 = load i8*, i8** %r, align 4
  %incdec.ptr18 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr18, i8** %r, align 4
  store i8 %conv17, i8* %18, align 1
  br label %if.end312

if.else:                                          ; preds = %lor.lhs.false12
  %19 = load i8*, i8** %s, align 4
  %incdec.ptr19 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr19, i8** %s, align 4
  %20 = load i8, i8* %19, align 1
  %conv20 = sext i8 %20 to i32
  store i32 %conv20, i32* %c, align 4
  switch i32 %conv20, label %sw.default [
    i32 97, label %sw.bb
    i32 118, label %sw.bb21
    i32 98, label %sw.bb22
    i32 101, label %sw.bb23
    i32 69, label %sw.bb23
    i32 102, label %sw.bb24
    i32 110, label %sw.bb25
    i32 114, label %sw.bb26
    i32 116, label %sw.bb27
    i32 49, label %sw.bb28
    i32 50, label %sw.bb28
    i32 51, label %sw.bb28
    i32 52, label %sw.bb28
    i32 53, label %sw.bb28
    i32 54, label %sw.bb28
    i32 55, label %sw.bb28
    i32 48, label %sw.bb33
    i32 120, label %sw.bb59
    i32 117, label %sw.bb169
    i32 85, label %sw.bb169
    i32 92, label %sw.bb231
    i32 39, label %sw.bb232
    i32 34, label %sw.bb232
    i32 63, label %sw.bb232
    i32 99, label %sw.bb238
  ]

sw.bb:                                            ; preds = %if.else
  store i32 7, i32* %c, align 4
  br label %sw.epilog

sw.bb21:                                          ; preds = %if.else
  store i32 11, i32* %c, align 4
  br label %sw.epilog

sw.bb22:                                          ; preds = %if.else
  store i32 8, i32* %c, align 4
  br label %sw.epilog

sw.bb23:                                          ; preds = %if.else, %if.else
  store i32 27, i32* %c, align 4
  br label %sw.epilog

sw.bb24:                                          ; preds = %if.else
  store i32 12, i32* %c, align 4
  br label %sw.epilog

sw.bb25:                                          ; preds = %if.else
  store i32 10, i32* %c, align 4
  br label %sw.epilog

sw.bb26:                                          ; preds = %if.else
  store i32 13, i32* %c, align 4
  br label %sw.epilog

sw.bb27:                                          ; preds = %if.else
  store i32 9, i32* %c, align 4
  br label %sw.epilog

sw.bb28:                                          ; preds = %if.else, %if.else, %if.else, %if.else, %if.else, %if.else, %if.else
  %21 = load i32, i32* %flags.addr, align 4
  %and = and i32 %21, 1
  %tobool29 = icmp ne i32 %and, 0
  br i1 %tobool29, label %if.then30, label %if.end32

if.then30:                                        ; preds = %sw.bb28
  %22 = load i8*, i8** %r, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr31, i8** %r, align 4
  store i8 92, i8* %22, align 1
  br label %sw.epilog

if.end32:                                         ; preds = %sw.bb28
  br label %sw.bb33

sw.bb33:                                          ; preds = %if.else, %if.end32
  %23 = load i32, i32* %flags.addr, align 4
  %and34 = and i32 %23, 1
  %tobool35 = icmp ne i32 %and34, 0
  br i1 %tobool35, label %land.rhs36, label %land.end39

land.rhs36:                                       ; preds = %sw.bb33
  %24 = load i32, i32* %c, align 4
  %cmp37 = icmp eq i32 %24, 48
  br label %land.end39

land.end39:                                       ; preds = %land.rhs36, %sw.bb33
  %25 = phi i1 [ false, %sw.bb33 ], [ %cmp37, %land.rhs36 ]
  %land.ext = zext i1 %25 to i32
  %add40 = add nsw i32 2, %land.ext
  store i32 %add40, i32* %temp, align 4
  %26 = load i32, i32* %c, align 4
  %sub = sub nsw i32 %26, 48
  store i32 %sub, i32* %c, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc, %land.end39
  %27 = load i8*, i8** %s, align 4
  %28 = load i8, i8* %27, align 1
  %conv42 = sext i8 %28 to i32
  %cmp43 = icmp sge i32 %conv42, 48
  br i1 %cmp43, label %land.lhs.true, label %land.end50

land.lhs.true:                                    ; preds = %for.cond41
  %29 = load i8*, i8** %s, align 4
  %30 = load i8, i8* %29, align 1
  %conv45 = sext i8 %30 to i32
  %cmp46 = icmp sle i32 %conv45, 55
  br i1 %cmp46, label %land.rhs48, label %land.end50

land.rhs48:                                       ; preds = %land.lhs.true
  %31 = load i32, i32* %temp, align 4
  %dec = add nsw i32 %31, -1
  store i32 %dec, i32* %temp, align 4
  %tobool49 = icmp ne i32 %31, 0
  br label %land.end50

land.end50:                                       ; preds = %land.rhs48, %land.lhs.true, %for.cond41
  %32 = phi i1 [ false, %land.lhs.true ], [ false, %for.cond41 ], [ %tobool49, %land.rhs48 ]
  br i1 %32, label %for.body52, label %for.end

for.body52:                                       ; preds = %land.end50
  %33 = load i32, i32* %c, align 4
  %mul53 = mul nsw i32 %33, 8
  %34 = load i8*, i8** %s, align 4
  %35 = load i8, i8* %34, align 1
  %conv54 = sext i8 %35 to i32
  %sub55 = sub nsw i32 %conv54, 48
  %add56 = add nsw i32 %mul53, %sub55
  store i32 %add56, i32* %c, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body52
  %36 = load i8*, i8** %s, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %incdec.ptr57, i8** %s, align 4
  br label %for.cond41

for.end:                                          ; preds = %land.end50
  %37 = load i32, i32* %c, align 4
  %and58 = and i32 %37, 255
  store i32 %and58, i32* %c, align 4
  br label %sw.epilog

sw.bb59:                                          ; preds = %if.else
  %38 = load i32, i32* %flags.addr, align 4
  %and60 = and i32 %38, 2
  %tobool61 = icmp ne i32 %and60, 0
  br i1 %tobool61, label %land.lhs.true62, label %if.end68

land.lhs.true62:                                  ; preds = %sw.bb59
  %39 = load i8*, i8** %s, align 4
  %40 = load i8, i8* %39, align 1
  %conv63 = sext i8 %40 to i32
  %cmp64 = icmp eq i32 %conv63, 123
  br i1 %cmp64, label %if.then66, label %if.end68

if.then66:                                        ; preds = %land.lhs.true62
  %41 = load i32, i32* %flags.addr, align 4
  %or = or i32 %41, 16
  store i32 %or, i32* %flags.addr, align 4
  %42 = load i8*, i8** %s, align 4
  %incdec.ptr67 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %incdec.ptr67, i8** %s, align 4
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %land.lhs.true62, %sw.bb59
  store i32 2, i32* %temp, align 4
  store i32 0, i32* %c, align 4
  br label %for.cond69

for.cond69:                                       ; preds = %for.inc107, %if.end68
  %43 = load i8*, i8** %s, align 4
  %44 = load i8, i8* %43, align 1
  %conv70 = zext i8 %44 to i32
  %call71 = call i32 @isxdigit(i32 %conv70) #3
  %tobool72 = icmp ne i32 %call71, 0
  br i1 %tobool72, label %land.rhs73, label %land.end76

land.rhs73:                                       ; preds = %for.cond69
  %45 = load i32, i32* %temp, align 4
  %dec74 = add nsw i32 %45, -1
  store i32 %dec74, i32* %temp, align 4
  %tobool75 = icmp ne i32 %45, 0
  br label %land.end76

land.end76:                                       ; preds = %land.rhs73, %for.cond69
  %46 = phi i1 [ false, %for.cond69 ], [ %tobool75, %land.rhs73 ]
  br i1 %46, label %for.body78, label %for.end109

for.body78:                                       ; preds = %land.end76
  %47 = load i32, i32* %c, align 4
  %mul79 = mul nsw i32 %47, 16
  %48 = load i8*, i8** %s, align 4
  %49 = load i8, i8* %48, align 1
  %conv80 = sext i8 %49 to i32
  %cmp81 = icmp sge i32 %conv80, 97
  br i1 %cmp81, label %land.lhs.true83, label %cond.false

land.lhs.true83:                                  ; preds = %for.body78
  %50 = load i8*, i8** %s, align 4
  %51 = load i8, i8* %50, align 1
  %conv84 = sext i8 %51 to i32
  %cmp85 = icmp sle i32 %conv84, 102
  br i1 %cmp85, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true83
  %52 = load i8*, i8** %s, align 4
  %53 = load i8, i8* %52, align 1
  %conv87 = sext i8 %53 to i32
  %sub88 = sub nsw i32 %conv87, 97
  %add89 = add nsw i32 %sub88, 10
  br label %cond.end104

cond.false:                                       ; preds = %land.lhs.true83, %for.body78
  %54 = load i8*, i8** %s, align 4
  %55 = load i8, i8* %54, align 1
  %conv90 = sext i8 %55 to i32
  %cmp91 = icmp sge i32 %conv90, 65
  br i1 %cmp91, label %land.lhs.true93, label %cond.false101

land.lhs.true93:                                  ; preds = %cond.false
  %56 = load i8*, i8** %s, align 4
  %57 = load i8, i8* %56, align 1
  %conv94 = sext i8 %57 to i32
  %cmp95 = icmp sle i32 %conv94, 70
  br i1 %cmp95, label %cond.true97, label %cond.false101

cond.true97:                                      ; preds = %land.lhs.true93
  %58 = load i8*, i8** %s, align 4
  %59 = load i8, i8* %58, align 1
  %conv98 = sext i8 %59 to i32
  %sub99 = sub nsw i32 %conv98, 65
  %add100 = add nsw i32 %sub99, 10
  br label %cond.end

cond.false101:                                    ; preds = %land.lhs.true93, %cond.false
  %60 = load i8*, i8** %s, align 4
  %61 = load i8, i8* %60, align 1
  %conv102 = sext i8 %61 to i32
  %sub103 = sub nsw i32 %conv102, 48
  br label %cond.end

cond.end:                                         ; preds = %cond.false101, %cond.true97
  %cond = phi i32 [ %add100, %cond.true97 ], [ %sub103, %cond.false101 ]
  br label %cond.end104

cond.end104:                                      ; preds = %cond.end, %cond.true
  %cond105 = phi i32 [ %add89, %cond.true ], [ %cond, %cond.end ]
  %add106 = add nsw i32 %mul79, %cond105
  store i32 %add106, i32* %c, align 4
  br label %for.inc107

for.inc107:                                       ; preds = %cond.end104
  %62 = load i8*, i8** %s, align 4
  %incdec.ptr108 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr108, i8** %s, align 4
  br label %for.cond69

for.end109:                                       ; preds = %land.end76
  %63 = load i32, i32* %flags.addr, align 4
  %and110 = and i32 %63, 16
  %tobool111 = icmp ne i32 %and110, 0
  br i1 %tobool111, label %if.then112, label %if.else161

if.then112:                                       ; preds = %for.end109
  br label %for.cond113

for.cond113:                                      ; preds = %for.inc151, %if.then112
  %64 = load i8*, i8** %s, align 4
  %65 = load i8, i8* %64, align 1
  %conv114 = zext i8 %65 to i32
  %call115 = call i32 @isxdigit(i32 %conv114) #3
  %tobool116 = icmp ne i32 %call115, 0
  br i1 %tobool116, label %for.body118, label %for.end153

for.body118:                                      ; preds = %for.cond113
  %66 = load i32, i32* %c, align 4
  %mul119 = mul nsw i32 %66, 16
  %67 = load i8*, i8** %s, align 4
  %68 = load i8, i8* %67, align 1
  %conv120 = sext i8 %68 to i32
  %cmp121 = icmp sge i32 %conv120, 97
  br i1 %cmp121, label %land.lhs.true123, label %cond.false131

land.lhs.true123:                                 ; preds = %for.body118
  %69 = load i8*, i8** %s, align 4
  %70 = load i8, i8* %69, align 1
  %conv124 = sext i8 %70 to i32
  %cmp125 = icmp sle i32 %conv124, 102
  br i1 %cmp125, label %cond.true127, label %cond.false131

cond.true127:                                     ; preds = %land.lhs.true123
  %71 = load i8*, i8** %s, align 4
  %72 = load i8, i8* %71, align 1
  %conv128 = sext i8 %72 to i32
  %sub129 = sub nsw i32 %conv128, 97
  %add130 = add nsw i32 %sub129, 10
  br label %cond.end148

cond.false131:                                    ; preds = %land.lhs.true123, %for.body118
  %73 = load i8*, i8** %s, align 4
  %74 = load i8, i8* %73, align 1
  %conv132 = sext i8 %74 to i32
  %cmp133 = icmp sge i32 %conv132, 65
  br i1 %cmp133, label %land.lhs.true135, label %cond.false143

land.lhs.true135:                                 ; preds = %cond.false131
  %75 = load i8*, i8** %s, align 4
  %76 = load i8, i8* %75, align 1
  %conv136 = sext i8 %76 to i32
  %cmp137 = icmp sle i32 %conv136, 70
  br i1 %cmp137, label %cond.true139, label %cond.false143

cond.true139:                                     ; preds = %land.lhs.true135
  %77 = load i8*, i8** %s, align 4
  %78 = load i8, i8* %77, align 1
  %conv140 = sext i8 %78 to i32
  %sub141 = sub nsw i32 %conv140, 65
  %add142 = add nsw i32 %sub141, 10
  br label %cond.end146

cond.false143:                                    ; preds = %land.lhs.true135, %cond.false131
  %79 = load i8*, i8** %s, align 4
  %80 = load i8, i8* %79, align 1
  %conv144 = sext i8 %80 to i32
  %sub145 = sub nsw i32 %conv144, 48
  br label %cond.end146

cond.end146:                                      ; preds = %cond.false143, %cond.true139
  %cond147 = phi i32 [ %add142, %cond.true139 ], [ %sub145, %cond.false143 ]
  br label %cond.end148

cond.end148:                                      ; preds = %cond.end146, %cond.true127
  %cond149 = phi i32 [ %add130, %cond.true127 ], [ %cond147, %cond.end146 ]
  %add150 = add nsw i32 %mul119, %cond149
  store i32 %add150, i32* %c, align 4
  br label %for.inc151

for.inc151:                                       ; preds = %cond.end148
  %81 = load i8*, i8** %s, align 4
  %incdec.ptr152 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %incdec.ptr152, i8** %s, align 4
  br label %for.cond113

for.end153:                                       ; preds = %for.cond113
  %82 = load i32, i32* %flags.addr, align 4
  %and154 = and i32 %82, -17
  store i32 %and154, i32* %flags.addr, align 4
  %83 = load i8*, i8** %s, align 4
  %84 = load i8, i8* %83, align 1
  %conv155 = sext i8 %84 to i32
  %cmp156 = icmp eq i32 %conv155, 125
  br i1 %cmp156, label %if.then158, label %if.end160

if.then158:                                       ; preds = %for.end153
  %85 = load i8*, i8** %s, align 4
  %incdec.ptr159 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %incdec.ptr159, i8** %s, align 4
  br label %if.end160

if.end160:                                        ; preds = %if.then158, %for.end153
  br label %if.end167

if.else161:                                       ; preds = %for.end109
  %86 = load i32, i32* %temp, align 4
  %cmp162 = icmp eq i32 %86, 2
  br i1 %cmp162, label %if.then164, label %if.end166

if.then164:                                       ; preds = %if.else161
  %87 = load i8*, i8** %r, align 4
  %incdec.ptr165 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %incdec.ptr165, i8** %r, align 4
  store i8 92, i8* %87, align 1
  store i32 120, i32* %c, align 4
  br label %if.end166

if.end166:                                        ; preds = %if.then164, %if.else161
  br label %if.end167

if.end167:                                        ; preds = %if.end166, %if.end160
  %88 = load i32, i32* %c, align 4
  %and168 = and i32 %88, 255
  store i32 %and168, i32* %c, align 4
  br label %sw.epilog

sw.bb169:                                         ; preds = %if.else, %if.else
  %89 = load i32, i32* %c, align 4
  %cmp170 = icmp eq i32 %89, 117
  %cond172 = select i1 %cmp170, i32 4, i32 8
  store i32 %cond172, i32* %temp, align 4
  store i32 0, i32* %v, align 4
  br label %for.cond173

for.cond173:                                      ; preds = %for.inc215, %sw.bb169
  %90 = load i8*, i8** %s, align 4
  %91 = load i8, i8* %90, align 1
  %conv174 = zext i8 %91 to i32
  %call175 = call i32 @isxdigit(i32 %conv174) #3
  %tobool176 = icmp ne i32 %call175, 0
  br i1 %tobool176, label %land.rhs177, label %land.end180

land.rhs177:                                      ; preds = %for.cond173
  %92 = load i32, i32* %temp, align 4
  %dec178 = add nsw i32 %92, -1
  store i32 %dec178, i32* %temp, align 4
  %tobool179 = icmp ne i32 %92, 0
  br label %land.end180

land.end180:                                      ; preds = %land.rhs177, %for.cond173
  %93 = phi i1 [ false, %for.cond173 ], [ %tobool179, %land.rhs177 ]
  br i1 %93, label %for.body182, label %for.end217

for.body182:                                      ; preds = %land.end180
  %94 = load i32, i32* %v, align 4
  %mul183 = mul i32 %94, 16
  %95 = load i8*, i8** %s, align 4
  %96 = load i8, i8* %95, align 1
  %conv184 = sext i8 %96 to i32
  %cmp185 = icmp sge i32 %conv184, 97
  br i1 %cmp185, label %land.lhs.true187, label %cond.false195

land.lhs.true187:                                 ; preds = %for.body182
  %97 = load i8*, i8** %s, align 4
  %98 = load i8, i8* %97, align 1
  %conv188 = sext i8 %98 to i32
  %cmp189 = icmp sle i32 %conv188, 102
  br i1 %cmp189, label %cond.true191, label %cond.false195

cond.true191:                                     ; preds = %land.lhs.true187
  %99 = load i8*, i8** %s, align 4
  %100 = load i8, i8* %99, align 1
  %conv192 = sext i8 %100 to i32
  %sub193 = sub nsw i32 %conv192, 97
  %add194 = add nsw i32 %sub193, 10
  br label %cond.end212

cond.false195:                                    ; preds = %land.lhs.true187, %for.body182
  %101 = load i8*, i8** %s, align 4
  %102 = load i8, i8* %101, align 1
  %conv196 = sext i8 %102 to i32
  %cmp197 = icmp sge i32 %conv196, 65
  br i1 %cmp197, label %land.lhs.true199, label %cond.false207

land.lhs.true199:                                 ; preds = %cond.false195
  %103 = load i8*, i8** %s, align 4
  %104 = load i8, i8* %103, align 1
  %conv200 = sext i8 %104 to i32
  %cmp201 = icmp sle i32 %conv200, 70
  br i1 %cmp201, label %cond.true203, label %cond.false207

cond.true203:                                     ; preds = %land.lhs.true199
  %105 = load i8*, i8** %s, align 4
  %106 = load i8, i8* %105, align 1
  %conv204 = sext i8 %106 to i32
  %sub205 = sub nsw i32 %conv204, 65
  %add206 = add nsw i32 %sub205, 10
  br label %cond.end210

cond.false207:                                    ; preds = %land.lhs.true199, %cond.false195
  %107 = load i8*, i8** %s, align 4
  %108 = load i8, i8* %107, align 1
  %conv208 = sext i8 %108 to i32
  %sub209 = sub nsw i32 %conv208, 48
  br label %cond.end210

cond.end210:                                      ; preds = %cond.false207, %cond.true203
  %cond211 = phi i32 [ %add206, %cond.true203 ], [ %sub209, %cond.false207 ]
  br label %cond.end212

cond.end212:                                      ; preds = %cond.end210, %cond.true191
  %cond213 = phi i32 [ %add194, %cond.true191 ], [ %cond211, %cond.end210 ]
  %add214 = add i32 %mul183, %cond213
  store i32 %add214, i32* %v, align 4
  br label %for.inc215

for.inc215:                                       ; preds = %cond.end212
  %109 = load i8*, i8** %s, align 4
  %incdec.ptr216 = getelementptr inbounds i8, i8* %109, i32 1
  store i8* %incdec.ptr216, i8** %s, align 4
  br label %for.cond173

for.end217:                                       ; preds = %land.end180
  %110 = load i32, i32* %temp, align 4
  %111 = load i32, i32* %c, align 4
  %cmp218 = icmp eq i32 %111, 117
  %cond220 = select i1 %cmp218, i32 4, i32 8
  %cmp221 = icmp eq i32 %110, %cond220
  br i1 %cmp221, label %if.then223, label %if.else225

if.then223:                                       ; preds = %for.end217
  %112 = load i8*, i8** %r, align 4
  %incdec.ptr224 = getelementptr inbounds i8, i8* %112, i32 1
  store i8* %incdec.ptr224, i8** %r, align 4
  store i8 92, i8* %112, align 1
  br label %sw.epilog

if.else225:                                       ; preds = %for.end217
  %113 = load i32, i32* %v, align 4
  %cmp226 = icmp ule i32 %113, 127
  br i1 %cmp226, label %if.then228, label %if.else229

if.then228:                                       ; preds = %if.else225
  %114 = load i32, i32* %v, align 4
  store i32 %114, i32* %c, align 4
  br label %sw.epilog

if.else229:                                       ; preds = %if.else225
  %115 = load i32, i32* %v, align 4
  %116 = load i8*, i8** %r, align 4
  %call230 = call i32 @u32cconv(i32 %115, i8* %116)
  store i32 %call230, i32* %temp, align 4
  %117 = load i32, i32* %temp, align 4
  %118 = load i8*, i8** %r, align 4
  %add.ptr = getelementptr inbounds i8, i8* %118, i32 %117
  store i8* %add.ptr, i8** %r, align 4
  br label %for.cond

sw.bb231:                                         ; preds = %if.else
  br label %sw.epilog

sw.bb232:                                         ; preds = %if.else, %if.else, %if.else
  %119 = load i32, i32* %flags.addr, align 4
  %and233 = and i32 %119, 1
  %tobool234 = icmp ne i32 %and233, 0
  br i1 %tobool234, label %if.then235, label %if.end237

if.then235:                                       ; preds = %sw.bb232
  %120 = load i8*, i8** %r, align 4
  %incdec.ptr236 = getelementptr inbounds i8, i8* %120, i32 1
  store i8* %incdec.ptr236, i8** %r, align 4
  store i8 92, i8* %120, align 1
  br label %if.end237

if.end237:                                        ; preds = %if.then235, %sw.bb232
  br label %sw.epilog

sw.bb238:                                         ; preds = %if.else
  %121 = load i32*, i32** %sawc.addr, align 4
  %tobool239 = icmp ne i32* %121, null
  br i1 %tobool239, label %if.then240, label %if.else244

if.then240:                                       ; preds = %sw.bb238
  %122 = load i32*, i32** %sawc.addr, align 4
  store i32 1, i32* %122, align 4
  %123 = load i8*, i8** %r, align 4
  store i8 0, i8* %123, align 1
  %124 = load i32*, i32** %rlen.addr, align 4
  %tobool241 = icmp ne i32* %124, null
  br i1 %tobool241, label %if.then242, label %if.end243

if.then242:                                       ; preds = %if.then240
  %125 = load i8*, i8** %r, align 4
  %126 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %125 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %126 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %127 = load i32*, i32** %rlen.addr, align 4
  store i32 %sub.ptr.sub, i32* %127, align 4
  br label %if.end243

if.end243:                                        ; preds = %if.then242, %if.then240
  %128 = load i8*, i8** %ret, align 4
  store i8* %128, i8** %retval, align 4
  br label %return

if.else244:                                       ; preds = %sw.bb238
  %129 = load i32, i32* %flags.addr, align 4
  %and245 = and i32 %129, 1
  %cmp246 = icmp eq i32 %and245, 0
  br i1 %cmp246, label %land.lhs.true248, label %if.else253

land.lhs.true248:                                 ; preds = %if.else244
  %130 = load i8*, i8** %s, align 4
  %131 = load i8, i8* %130, align 1
  %conv249 = sext i8 %131 to i32
  %cmp250 = icmp eq i32 %conv249, 0
  br i1 %cmp250, label %if.then252, label %if.else253

if.then252:                                       ; preds = %land.lhs.true248
  br label %if.end291

if.else253:                                       ; preds = %land.lhs.true248, %if.else244
  %132 = load i32, i32* %flags.addr, align 4
  %and254 = and i32 %132, 1
  %cmp255 = icmp eq i32 %and254, 0
  br i1 %cmp255, label %land.lhs.true257, label %if.end290

land.lhs.true257:                                 ; preds = %if.else253
  %133 = load i8*, i8** %s, align 4
  %134 = load i8, i8* %133, align 1
  %conv258 = sext i8 %134 to i32
  store i32 %conv258, i32* %c, align 4
  %tobool259 = icmp ne i32 %conv258, 0
  br i1 %tobool259, label %if.then260, label %if.end290

if.then260:                                       ; preds = %land.lhs.true257
  %135 = load i8*, i8** %s, align 4
  %incdec.ptr261 = getelementptr inbounds i8, i8* %135, i32 1
  store i8* %incdec.ptr261, i8** %s, align 4
  %136 = load i32, i32* %flags.addr, align 4
  %and262 = and i32 %136, 2
  %tobool263 = icmp ne i32 %and262, 0
  br i1 %tobool263, label %land.lhs.true264, label %if.end273

land.lhs.true264:                                 ; preds = %if.then260
  %137 = load i32, i32* %c, align 4
  %cmp265 = icmp eq i32 %137, 92
  br i1 %cmp265, label %land.lhs.true267, label %if.end273

land.lhs.true267:                                 ; preds = %land.lhs.true264
  %138 = load i32, i32* %c, align 4
  %139 = load i8*, i8** %s, align 4
  %140 = load i8, i8* %139, align 1
  %conv268 = sext i8 %140 to i32
  %cmp269 = icmp eq i32 %138, %conv268
  br i1 %cmp269, label %if.then271, label %if.end273

if.then271:                                       ; preds = %land.lhs.true267
  %141 = load i8*, i8** %s, align 4
  %incdec.ptr272 = getelementptr inbounds i8, i8* %141, i32 1
  store i8* %incdec.ptr272, i8** %s, align 4
  br label %if.end273

if.end273:                                        ; preds = %if.then271, %land.lhs.true267, %land.lhs.true264, %if.then260
  %142 = load i32, i32* %c, align 4
  %cmp274 = icmp eq i32 %142, 63
  br i1 %cmp274, label %cond.true276, label %cond.false277

cond.true276:                                     ; preds = %if.end273
  br label %cond.end288

cond.false277:                                    ; preds = %if.end273
  %143 = load i32, i32* %c, align 4
  %conv278 = trunc i32 %143 to i8
  %conv279 = zext i8 %conv278 to i32
  %call280 = call i32 @islower(i32 %conv279) #3
  %tobool281 = icmp ne i32 %call280, 0
  br i1 %tobool281, label %cond.true282, label %cond.false284

cond.true282:                                     ; preds = %cond.false277
  %144 = load i32, i32* %c, align 4
  %call283 = call i32 @toupper(i32 %144) #3
  br label %cond.end285

cond.false284:                                    ; preds = %cond.false277
  %145 = load i32, i32* %c, align 4
  br label %cond.end285

cond.end285:                                      ; preds = %cond.false284, %cond.true282
  %cond286 = phi i32 [ %call283, %cond.true282 ], [ %145, %cond.false284 ]
  %and287 = and i32 %cond286, 31
  br label %cond.end288

cond.end288:                                      ; preds = %cond.end285, %cond.true276
  %cond289 = phi i32 [ 127, %cond.true276 ], [ %and287, %cond.end285 ]
  store i32 %cond289, i32* %c, align 4
  br label %sw.epilog

if.end290:                                        ; preds = %land.lhs.true257, %if.else253
  br label %if.end291

if.end291:                                        ; preds = %if.end290, %if.then252
  br label %if.end292

if.end292:                                        ; preds = %if.end291
  br label %sw.default

sw.default:                                       ; preds = %if.else, %if.end292
  %146 = load i32, i32* %flags.addr, align 4
  %and293 = and i32 %146, 4
  %cmp294 = icmp eq i32 %and293, 0
  br i1 %cmp294, label %if.then296, label %if.end298

if.then296:                                       ; preds = %sw.default
  %147 = load i8*, i8** %r, align 4
  %incdec.ptr297 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %incdec.ptr297, i8** %r, align 4
  store i8 92, i8* %147, align 1
  br label %if.end298

if.end298:                                        ; preds = %if.then296, %sw.default
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end298, %cond.end288, %if.end237, %sw.bb231, %if.then228, %if.then223, %if.end167, %for.end, %if.then30, %sw.bb27, %sw.bb26, %sw.bb25, %sw.bb24, %sw.bb23, %sw.bb22, %sw.bb21, %sw.bb
  %148 = load i32, i32* %flags.addr, align 4
  %and299 = and i32 %148, 2
  %tobool300 = icmp ne i32 %and299, 0
  br i1 %tobool300, label %land.lhs.true301, label %if.end309

land.lhs.true301:                                 ; preds = %sw.epilog
  %149 = load i32, i32* %c, align 4
  %cmp302 = icmp eq i32 %149, 1
  br i1 %cmp302, label %if.then307, label %lor.lhs.false304

lor.lhs.false304:                                 ; preds = %land.lhs.true301
  %150 = load i32, i32* %c, align 4
  %cmp305 = icmp eq i32 %150, 127
  br i1 %cmp305, label %if.then307, label %if.end309

if.then307:                                       ; preds = %lor.lhs.false304, %land.lhs.true301
  %151 = load i8*, i8** %r, align 4
  %incdec.ptr308 = getelementptr inbounds i8, i8* %151, i32 1
  store i8* %incdec.ptr308, i8** %r, align 4
  store i8 1, i8* %151, align 1
  br label %if.end309

if.end309:                                        ; preds = %if.then307, %lor.lhs.false304, %sw.epilog
  %152 = load i32, i32* %c, align 4
  %conv310 = trunc i32 %152 to i8
  %153 = load i8*, i8** %r, align 4
  %incdec.ptr311 = getelementptr inbounds i8, i8* %153, i32 1
  store i8* %incdec.ptr311, i8** %r, align 4
  store i8 %conv310, i8* %153, align 1
  br label %if.end312

if.end312:                                        ; preds = %if.end309, %if.then16
  br label %for.cond

for.end313:                                       ; preds = %land.end
  %154 = load i8*, i8** %r, align 4
  store i8 0, i8* %154, align 1
  %155 = load i32*, i32** %rlen.addr, align 4
  %tobool314 = icmp ne i32* %155, null
  br i1 %tobool314, label %if.then315, label %if.end319

if.then315:                                       ; preds = %for.end313
  %156 = load i8*, i8** %r, align 4
  %157 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast316 = ptrtoint i8* %156 to i32
  %sub.ptr.rhs.cast317 = ptrtoint i8* %157 to i32
  %sub.ptr.sub318 = sub i32 %sub.ptr.lhs.cast316, %sub.ptr.rhs.cast317
  %158 = load i32*, i32** %rlen.addr, align 4
  store i32 %sub.ptr.sub318, i32* %158, align 4
  br label %if.end319

if.end319:                                        ; preds = %if.then315, %for.end313
  %159 = load i8*, i8** %ret, align 4
  store i8* %159, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end319, %if.end243, %if.then
  %160 = load i8*, i8** %retval, align 4
  ret i8* %160
}

declare i8* @sh_xmalloc(i32, i8*, i32) #1

; Function Attrs: nounwind readonly
declare i32 @isxdigit(i32) #2

declare i32 @u32cconv(i32, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @islower(i32) #2

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #2

; Function Attrs: noinline nounwind
define i8* @ansic_quote(i8* %str, i32 %flags, i32* %rlen) #0 {
entry:
  %retval = alloca i8*, align 4
  %str.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %rlen.addr = alloca i32*, align 4
  %r = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %s = alloca i8*, align 4
  %l = alloca i32, align 4
  %rsize = alloca i32, align 4
  %c = alloca i8, align 1
  %clen = alloca i32, align 4
  %b = alloca i32, align 4
  %wc = alloca i32, align 4
  store i8* %str, i8** %str.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %rlen, i32** %rlen.addr, align 4
  %0 = load i8*, i8** %str.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %str.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %str.addr, align 4
  %call = call i32 @strlen(i8* %3)
  store i32 %call, i32* %l, align 4
  %4 = load i32, i32* %l, align 4
  %mul = mul nsw i32 4, %4
  %add = add nsw i32 %mul, 4
  store i32 %add, i32* %rsize, align 4
  %5 = load i32, i32* %rsize, align 4
  %call3 = call i8* @sh_xmalloc(i32 %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 228)
  store i8* %call3, i8** %ret, align 4
  store i8* %call3, i8** %r, align 4
  %6 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  store i8 36, i8* %6, align 1
  %7 = load i8*, i8** %r, align 4
  %incdec.ptr4 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr4, i8** %r, align 4
  store i8 39, i8* %7, align 1
  %8 = load i8*, i8** %str.addr, align 4
  store i8* %8, i8** %s, align 4
  %9 = load i8*, i8** %str.addr, align 4
  store i8* %9, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc79, %if.end
  %10 = load i8*, i8** %s, align 4
  %11 = load i8, i8* %10, align 1
  store i8 %11, i8* %c, align 1
  %tobool = icmp ne i8 %11, 0
  br i1 %tobool, label %for.body, label %for.end81

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %l, align 4
  store i32 1, i32* %b, align 4
  store i32 1, i32* %clen, align 4
  %12 = load i8, i8* %c, align 1
  %conv5 = zext i8 %12 to i32
  switch i32 %conv5, label %sw.default [
    i32 27, label %sw.bb
    i32 7, label %sw.bb6
    i32 11, label %sw.bb7
    i32 8, label %sw.bb8
    i32 12, label %sw.bb9
    i32 10, label %sw.bb10
    i32 13, label %sw.bb11
    i32 9, label %sw.bb12
    i32 92, label %sw.bb13
    i32 39, label %sw.bb13
  ]

sw.bb:                                            ; preds = %for.body
  store i8 69, i8* %c, align 1
  br label %sw.epilog

sw.bb6:                                           ; preds = %for.body
  store i8 97, i8* %c, align 1
  br label %sw.epilog

sw.bb7:                                           ; preds = %for.body
  store i8 118, i8* %c, align 1
  br label %sw.epilog

sw.bb8:                                           ; preds = %for.body
  store i8 98, i8* %c, align 1
  br label %sw.epilog

sw.bb9:                                           ; preds = %for.body
  store i8 102, i8* %c, align 1
  br label %sw.epilog

sw.bb10:                                          ; preds = %for.body
  store i8 110, i8* %c, align 1
  br label %sw.epilog

sw.bb11:                                          ; preds = %for.body
  store i8 114, i8* %c, align 1
  br label %sw.epilog

sw.bb12:                                          ; preds = %for.body
  store i8 116, i8* %c, align 1
  br label %sw.epilog

sw.bb13:                                          ; preds = %for.body, %for.body
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  %13 = load i8, i8* %c, align 1
  %call14 = call i32 @is_basic(i8 signext %13)
  store i32 %call14, i32* %b, align 4
  %14 = load i32, i32* %b, align 4
  %cmp15 = icmp eq i32 %14, 0
  br i1 %cmp15, label %land.lhs.true, label %lor.lhs.false31

land.lhs.true:                                    ; preds = %sw.default
  %15 = load i8*, i8** %s, align 4
  %call17 = call i32 @__ctype_get_mb_cur_max()
  %call18 = call i32 @mbrtowc(i32* %wc, i8* %15, i32 %call17, %struct.__mbstate_t* null)
  store i32 %call18, i32* %clen, align 4
  %cmp19 = icmp ult i32 %call18, 0
  br i1 %cmp19, label %if.then40, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %land.lhs.true
  %16 = load i32, i32* %clen, align 4
  %cmp22 = icmp eq i32 %16, -1
  br i1 %cmp22, label %if.then40, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %lor.lhs.false21
  %17 = load i32, i32* %clen, align 4
  %cmp25 = icmp eq i32 %17, -2
  br i1 %cmp25, label %if.then40, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %lor.lhs.false24
  %18 = load i32, i32* %wc, align 4
  %call28 = call i32 @iswprint(i32 %18)
  %cmp29 = icmp eq i32 %call28, 0
  br i1 %cmp29, label %if.then40, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.lhs.false27, %sw.default
  %19 = load i32, i32* %b, align 4
  %cmp32 = icmp eq i32 %19, 1
  br i1 %cmp32, label %land.lhs.true34, label %if.end57

land.lhs.true34:                                  ; preds = %lor.lhs.false31
  %20 = load i8, i8* %c, align 1
  %conv35 = zext i8 %20 to i32
  %call36 = call i32 @isprint(i32 %conv35) #3
  %tobool37 = icmp ne i32 %call36, 0
  %land.ext = zext i1 %tobool37 to i32
  %cmp38 = icmp eq i32 %land.ext, 0
  br i1 %cmp38, label %if.then40, label %if.end57

if.then40:                                        ; preds = %land.lhs.true34, %lor.lhs.false27, %lor.lhs.false24, %lor.lhs.false21, %land.lhs.true
  %21 = load i8*, i8** %r, align 4
  %incdec.ptr41 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr41, i8** %r, align 4
  store i8 92, i8* %21, align 1
  %22 = load i8, i8* %c, align 1
  %conv42 = zext i8 %22 to i32
  %shr = ashr i32 %conv42, 6
  %and = and i32 %shr, 7
  %add43 = add nsw i32 %and, 48
  %conv44 = trunc i32 %add43 to i8
  %23 = load i8*, i8** %r, align 4
  %incdec.ptr45 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %incdec.ptr45, i8** %r, align 4
  store i8 %conv44, i8* %23, align 1
  %24 = load i8, i8* %c, align 1
  %conv46 = zext i8 %24 to i32
  %shr47 = ashr i32 %conv46, 3
  %and48 = and i32 %shr47, 7
  %add49 = add nsw i32 %and48, 48
  %conv50 = trunc i32 %add49 to i8
  %25 = load i8*, i8** %r, align 4
  %incdec.ptr51 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %incdec.ptr51, i8** %r, align 4
  store i8 %conv50, i8* %25, align 1
  %26 = load i8, i8* %c, align 1
  %conv52 = zext i8 %26 to i32
  %and53 = and i32 %conv52, 7
  %add54 = add nsw i32 %and53, 48
  %conv55 = trunc i32 %add54 to i8
  %27 = load i8*, i8** %r, align 4
  %incdec.ptr56 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr56, i8** %r, align 4
  store i8 %conv55, i8* %27, align 1
  br label %for.inc79

if.end57:                                         ; preds = %land.lhs.true34, %lor.lhs.false31
  store i32 0, i32* %l, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.end57, %sw.bb13, %sw.bb12, %sw.bb11, %sw.bb10, %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb6, %sw.bb
  %28 = load i32, i32* %b, align 4
  %cmp58 = icmp eq i32 %28, 0
  br i1 %cmp58, label %land.lhs.true60, label %if.end64

land.lhs.true60:                                  ; preds = %sw.epilog
  %29 = load i32, i32* %clen, align 4
  %cmp61 = icmp eq i32 %29, 0
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %land.lhs.true60
  br label %for.end81

if.end64:                                         ; preds = %land.lhs.true60, %sw.epilog
  %30 = load i32, i32* %l, align 4
  %tobool65 = icmp ne i32 %30, 0
  br i1 %tobool65, label %if.then66, label %if.end68

if.then66:                                        ; preds = %if.end64
  %31 = load i8*, i8** %r, align 4
  %incdec.ptr67 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr67, i8** %r, align 4
  store i8 92, i8* %31, align 1
  br label %if.end68

if.end68:                                         ; preds = %if.then66, %if.end64
  %32 = load i32, i32* %clen, align 4
  %cmp69 = icmp eq i32 %32, 1
  br i1 %cmp69, label %if.then71, label %if.else

if.then71:                                        ; preds = %if.end68
  %33 = load i8, i8* %c, align 1
  %34 = load i8*, i8** %r, align 4
  %incdec.ptr72 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr72, i8** %r, align 4
  store i8 %33, i8* %34, align 1
  br label %if.end78

if.else:                                          ; preds = %if.end68
  store i32 0, i32* %b, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc, %if.else
  %35 = load i32, i32* %b, align 4
  %36 = load i32, i32* %clen, align 4
  %cmp74 = icmp slt i32 %35, %36
  br i1 %cmp74, label %for.body76, label %for.end

for.body76:                                       ; preds = %for.cond73
  %37 = load i8*, i8** %s, align 4
  %38 = load i32, i32* %b, align 4
  %arrayidx = getelementptr inbounds i8, i8* %37, i32 %38
  %39 = load i8, i8* %arrayidx, align 1
  %40 = load i8*, i8** %r, align 4
  %incdec.ptr77 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %incdec.ptr77, i8** %r, align 4
  store i8 %39, i8* %40, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body76
  %41 = load i32, i32* %b, align 4
  %inc = add nsw i32 %41, 1
  store i32 %inc, i32* %b, align 4
  br label %for.cond73

for.end:                                          ; preds = %for.cond73
  %42 = load i32, i32* %clen, align 4
  %sub = sub i32 %42, 1
  %43 = load i8*, i8** %s, align 4
  %add.ptr = getelementptr inbounds i8, i8* %43, i32 %sub
  store i8* %add.ptr, i8** %s, align 4
  br label %if.end78

if.end78:                                         ; preds = %for.end, %if.then71
  br label %for.inc79

for.inc79:                                        ; preds = %if.end78, %if.then40
  %44 = load i8*, i8** %s, align 4
  %incdec.ptr80 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr80, i8** %s, align 4
  br label %for.cond

for.end81:                                        ; preds = %if.then63, %for.cond
  %45 = load i8*, i8** %r, align 4
  %incdec.ptr82 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr82, i8** %r, align 4
  store i8 39, i8* %45, align 1
  %46 = load i8*, i8** %r, align 4
  store i8 0, i8* %46, align 1
  %47 = load i32*, i32** %rlen.addr, align 4
  %tobool83 = icmp ne i32* %47, null
  br i1 %tobool83, label %if.then84, label %if.end85

if.then84:                                        ; preds = %for.end81
  %48 = load i8*, i8** %r, align 4
  %49 = load i8*, i8** %ret, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %48 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %49 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %50 = load i32*, i32** %rlen.addr, align 4
  store i32 %sub.ptr.sub, i32* %50, align 4
  br label %if.end85

if.end85:                                         ; preds = %if.then84, %for.end81
  %51 = load i8*, i8** %ret, align 4
  store i8* %51, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end85, %if.then
  %52 = load i8*, i8** %retval, align 4
  ret i8* %52
}

declare i32 @strlen(i8*) #1

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

declare i32 @mbrtowc(i32*, i8*, i32, %struct.__mbstate_t*) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare i32 @iswprint(i32) #1

; Function Attrs: nounwind readonly
declare i32 @isprint(i32) #2

; Function Attrs: noinline nounwind
define i32 @ansic_wshouldquote(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %wcs = alloca i32*, align 4
  %wcc = alloca i32, align 4
  %wcstr = alloca i32*, align 4
  %slen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* null, i32** %wcstr, align 4
  %0 = load i32*, i32** %wcstr, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %call = call i32 @mbstowcs(i32* %0, i8* %1, i32 0)
  store i32 %call, i32* %slen, align 4
  %2 = load i32, i32* %slen, align 4
  %cmp = icmp eq i32 %2, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i32, i32* %slen, align 4
  %add = add i32 %3, 1
  %mul = mul i32 4, %add
  %call1 = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 318)
  %4 = bitcast i8* %call1 to i32*
  store i32* %4, i32** %wcstr, align 4
  %5 = load i32*, i32** %wcstr, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %slen, align 4
  %add2 = add i32 %7, 1
  %call3 = call i32 @mbstowcs(i32* %5, i8* %6, i32 %add2)
  %8 = load i32*, i32** %wcstr, align 4
  store i32* %8, i32** %wcs, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i32*, i32** %wcs, align 4
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %wcc, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i32, i32* %wcc, align 4
  %call4 = call i32 @iswprint(i32 %11)
  %cmp5 = icmp eq i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.body
  %12 = load i32*, i32** %wcstr, align 4
  %13 = bitcast i32* %12 to i8*
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 324)
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %14 = load i32*, i32** %wcs, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %14, i32 1
  store i32* %incdec.ptr, i32** %wcs, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %wcstr, align 4
  %16 = bitcast i32* %15 to i8*
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 328)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @mbstowcs(i32*, i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @ansic_shouldquote(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  store i8* %1, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  store i8 %3, i8* %c, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i8, i8* %c, align 1
  %call = call i32 @is_basic(i8 signext %4)
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then2, label %if.end4

if.then2:                                         ; preds = %for.body
  %5 = load i8*, i8** %s, align 4
  %call3 = call i32 @ansic_wshouldquote(i8* %5)
  store i32 %call3, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %for.body
  %6 = load i8, i8* %c, align 1
  %conv = zext i8 %6 to i32
  %call5 = call i32 @isprint(i32 %conv) #3
  %tobool6 = icmp ne i32 %call5, 0
  %land.ext = zext i1 %tobool6 to i32
  %cmp7 = icmp eq i32 %land.ext, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end4
  store i32 1, i32* %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.end4
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %7 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then9, %if.then2, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i8* @ansiexpand(i8* %string, i32 %start, i32 %end, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %start.addr = alloca i32, align 4
  %end.addr = alloca i32, align 4
  %lenp.addr = alloca i32*, align 4
  %temp = alloca i8*, align 4
  %t = alloca i8*, align 4
  %len = alloca i32, align 4
  %tlen = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %end, i32* %end.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i32, i32* %end.addr, align 4
  %1 = load i32, i32* %start.addr, align 4
  %sub = sub nsw i32 %0, %1
  %add = add nsw i32 %sub, 1
  %call = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 367)
  store i8* %call, i8** %temp, align 4
  store i32 0, i32* %tlen, align 4
  %2 = load i32, i32* %start.addr, align 4
  store i32 %2, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %3 = load i32, i32* %len, align 4
  %4 = load i32, i32* %end.addr, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %string.addr, align 4
  %6 = load i32, i32* %len, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %len, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 %6
  %7 = load i8, i8* %arrayidx, align 1
  %8 = load i8*, i8** %temp, align 4
  %9 = load i32, i32* %tlen, align 4
  %inc1 = add nsw i32 %9, 1
  store i32 %inc1, i32* %tlen, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i32 %9
  store i8 %7, i8* %arrayidx2, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %temp, align 4
  %11 = load i32, i32* %tlen, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i32 %11
  store i8 0, i8* %arrayidx3, align 1
  %12 = load i8*, i8** %temp, align 4
  %13 = load i8, i8* %12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  %14 = load i8*, i8** %temp, align 4
  %15 = load i32, i32* %tlen, align 4
  %16 = load i32*, i32** %lenp.addr, align 4
  %call4 = call i8* @ansicstr(i8* %14, i32 %15, i32 2, i32* null, i32* %16)
  store i8* %call4, i8** %t, align 4
  %17 = load i8*, i8** %temp, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 375)
  %18 = load i8*, i8** %t, align 4
  store i8* %18, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %for.end
  %19 = load i32*, i32** %lenp.addr, align 4
  %tobool5 = icmp ne i32* %19, null
  br i1 %tobool5, label %if.then6, label %if.end

if.then6:                                         ; preds = %if.else
  %20 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %20, align 4
  br label %if.end

if.end:                                           ; preds = %if.then6, %if.else
  %21 = load i8*, i8** %temp, align 4
  store i8* %21, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %22 = load i8*, i8** %retval, align 4
  ret i8* %22
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
