; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }
%struct.hash_table = type { %struct.bucket_contents**, i32, i32 }
%struct.bucket_contents = type { %struct.bucket_contents*, i8*, i8*, i32, i32 }

@shell_compatibility_level = external global i32, align 4
@current_user = external global %struct.user_info, align 4
@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@test_exit_buf = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@test_error_return = internal global i32 0, align 4
@argv = internal global i8** null, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"missing `]'\00", align 1
@argc = internal global i32 0, align 4
@pos = internal global i32 0, align 4
@noeval = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [19 x i8] c"too many arguments\00", align 1
@extended_glob = external global i32, align 4
@match_ignore_case = external global i32, align 4
@.str.3 = private unnamed_addr constant [32 x i8] c"%s: integer expression expected\00", align 1
@.str.4 = private unnamed_addr constant [28 x i8] c"%s: unary operator expected\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"%s: binary operator expected\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"argument expected\00", align 1
@.str.8 = private unnamed_addr constant [13 x i8] c"`)' expected\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"`)' expected, found %s\00", align 1

; Function Attrs: noinline nounwind
define i32 @binary_test(i8* %op, i8* %arg1, i8* %arg2, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %op.addr = alloca i8*, align 4
  %arg1.addr = alloca i8*, align 4
  %arg2.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %patmatch = alloca i32, align 4
  store i8* %op, i8** %op.addr, align 4
  store i8* %arg1, i8** %arg1.addr, align 4
  store i8* %arg2, i8** %arg2.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 1
  store i32 %and, i32* %patmatch, align 4
  %1 = load i8*, i8** %op.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 61
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %op.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 1
  %4 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %5 = load i8*, i8** %op.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %5, i32 1
  %6 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 61
  br i1 %cmp8, label %land.lhs.true10, label %if.else

land.lhs.true10:                                  ; preds = %lor.lhs.false
  %7 = load i8*, i8** %op.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %7, i32 2
  %8 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %8 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true10, %land.lhs.true
  %9 = load i32, i32* %patmatch, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %10 = load i8*, i8** %arg1.addr, align 4
  %11 = load i8*, i8** %arg2.addr, align 4
  %call = call i32 @patcomp(i8* %10, i8* %11, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %12 = load i8*, i8** %arg1.addr, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %13 to i32
  %14 = load i8*, i8** %arg2.addr, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %15 to i32
  %cmp19 = icmp eq i32 %conv16, %conv18
  br i1 %cmp19, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.false
  %16 = load i8*, i8** %arg1.addr, align 4
  %17 = load i8*, i8** %arg2.addr, align 4
  %call21 = call i32 @strcmp(i8* %16, i8* %17)
  %cmp22 = icmp eq i32 %call21, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false
  %18 = phi i1 [ false, %cond.false ], [ %cmp22, %land.rhs ]
  %land.ext = zext i1 %18 to i32
  br label %cond.end

cond.end:                                         ; preds = %land.end, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ %land.ext, %land.end ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true10, %lor.lhs.false, %entry
  %19 = load i8*, i8** %op.addr, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %19, i32 0
  %20 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %20 to i32
  %cmp26 = icmp eq i32 %conv25, 62
  br i1 %cmp26, label %land.lhs.true33, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.else
  %21 = load i8*, i8** %op.addr, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %22 to i32
  %cmp31 = icmp eq i32 %conv30, 60
  br i1 %cmp31, label %land.lhs.true33, label %if.else74

land.lhs.true33:                                  ; preds = %lor.lhs.false28, %if.else
  %23 = load i8*, i8** %op.addr, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %23, i32 1
  %24 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %24 to i32
  %cmp36 = icmp eq i32 %conv35, 0
  br i1 %cmp36, label %if.then38, label %if.else74

if.then38:                                        ; preds = %land.lhs.true33
  %25 = load i32, i32* @shell_compatibility_level, align 4
  %cmp39 = icmp sgt i32 %25, 40
  br i1 %cmp39, label %land.lhs.true41, label %if.else59

land.lhs.true41:                                  ; preds = %if.then38
  %26 = load i32, i32* %flags.addr, align 4
  %and42 = and i32 %26, 4
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %if.then44, label %if.else59

if.then44:                                        ; preds = %land.lhs.true41
  %27 = load i8*, i8** %op.addr, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %28 to i32
  %cmp47 = icmp eq i32 %conv46, 62
  br i1 %cmp47, label %cond.true49, label %cond.false53

cond.true49:                                      ; preds = %if.then44
  %29 = load i8*, i8** %arg1.addr, align 4
  %30 = load i8*, i8** %arg2.addr, align 4
  %call50 = call i32 @strcoll(i8* %29, i8* %30)
  %cmp51 = icmp sgt i32 %call50, 0
  %conv52 = zext i1 %cmp51 to i32
  br label %cond.end57

cond.false53:                                     ; preds = %if.then44
  %31 = load i8*, i8** %arg1.addr, align 4
  %32 = load i8*, i8** %arg2.addr, align 4
  %call54 = call i32 @strcoll(i8* %31, i8* %32)
  %cmp55 = icmp slt i32 %call54, 0
  %conv56 = zext i1 %cmp55 to i32
  br label %cond.end57

cond.end57:                                       ; preds = %cond.false53, %cond.true49
  %cond58 = phi i32 [ %conv52, %cond.true49 ], [ %conv56, %cond.false53 ]
  store i32 %cond58, i32* %retval, align 4
  br label %return

if.else59:                                        ; preds = %land.lhs.true41, %if.then38
  %33 = load i8*, i8** %op.addr, align 4
  %arrayidx60 = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx60, align 1
  %conv61 = sext i8 %34 to i32
  %cmp62 = icmp eq i32 %conv61, 62
  br i1 %cmp62, label %cond.true64, label %cond.false68

cond.true64:                                      ; preds = %if.else59
  %35 = load i8*, i8** %arg1.addr, align 4
  %36 = load i8*, i8** %arg2.addr, align 4
  %call65 = call i32 @strcmp(i8* %35, i8* %36)
  %cmp66 = icmp sgt i32 %call65, 0
  %conv67 = zext i1 %cmp66 to i32
  br label %cond.end72

cond.false68:                                     ; preds = %if.else59
  %37 = load i8*, i8** %arg1.addr, align 4
  %38 = load i8*, i8** %arg2.addr, align 4
  %call69 = call i32 @strcmp(i8* %37, i8* %38)
  %cmp70 = icmp slt i32 %call69, 0
  %conv71 = zext i1 %cmp70 to i32
  br label %cond.end72

cond.end72:                                       ; preds = %cond.false68, %cond.true64
  %cond73 = phi i32 [ %conv67, %cond.true64 ], [ %conv71, %cond.false68 ]
  store i32 %cond73, i32* %retval, align 4
  br label %return

if.else74:                                        ; preds = %land.lhs.true33, %lor.lhs.false28
  %39 = load i8*, i8** %op.addr, align 4
  %arrayidx75 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx75, align 1
  %conv76 = sext i8 %40 to i32
  %cmp77 = icmp eq i32 %conv76, 33
  br i1 %cmp77, label %land.lhs.true79, label %if.else110

land.lhs.true79:                                  ; preds = %if.else74
  %41 = load i8*, i8** %op.addr, align 4
  %arrayidx80 = getelementptr inbounds i8, i8* %41, i32 1
  %42 = load i8, i8* %arrayidx80, align 1
  %conv81 = sext i8 %42 to i32
  %cmp82 = icmp eq i32 %conv81, 61
  br i1 %cmp82, label %land.lhs.true84, label %if.else110

land.lhs.true84:                                  ; preds = %land.lhs.true79
  %43 = load i8*, i8** %op.addr, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %43, i32 2
  %44 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %44 to i32
  %cmp87 = icmp eq i32 %conv86, 0
  br i1 %cmp87, label %if.then89, label %if.else110

if.then89:                                        ; preds = %land.lhs.true84
  %45 = load i32, i32* %patmatch, align 4
  %tobool90 = icmp ne i32 %45, 0
  br i1 %tobool90, label %cond.true91, label %cond.false93

cond.true91:                                      ; preds = %if.then89
  %46 = load i8*, i8** %arg1.addr, align 4
  %47 = load i8*, i8** %arg2.addr, align 4
  %call92 = call i32 @patcomp(i8* %46, i8* %47, i32 1)
  br label %cond.end108

cond.false93:                                     ; preds = %if.then89
  %48 = load i8*, i8** %arg1.addr, align 4
  %arrayidx94 = getelementptr inbounds i8, i8* %48, i32 0
  %49 = load i8, i8* %arrayidx94, align 1
  %conv95 = sext i8 %49 to i32
  %50 = load i8*, i8** %arg2.addr, align 4
  %arrayidx96 = getelementptr inbounds i8, i8* %50, i32 0
  %51 = load i8, i8* %arrayidx96, align 1
  %conv97 = sext i8 %51 to i32
  %cmp98 = icmp eq i32 %conv95, %conv97
  br i1 %cmp98, label %land.rhs100, label %land.end104

land.rhs100:                                      ; preds = %cond.false93
  %52 = load i8*, i8** %arg1.addr, align 4
  %53 = load i8*, i8** %arg2.addr, align 4
  %call101 = call i32 @strcmp(i8* %52, i8* %53)
  %cmp102 = icmp eq i32 %call101, 0
  br label %land.end104

land.end104:                                      ; preds = %land.rhs100, %cond.false93
  %54 = phi i1 [ false, %cond.false93 ], [ %cmp102, %land.rhs100 ]
  %land.ext105 = zext i1 %54 to i32
  %cmp106 = icmp eq i32 %land.ext105, 0
  %conv107 = zext i1 %cmp106 to i32
  br label %cond.end108

cond.end108:                                      ; preds = %land.end104, %cond.true91
  %cond109 = phi i32 [ %call92, %cond.true91 ], [ %conv107, %land.end104 ]
  store i32 %cond109, i32* %retval, align 4
  br label %return

if.else110:                                       ; preds = %land.lhs.true84, %land.lhs.true79, %if.else74
  %55 = load i8*, i8** %op.addr, align 4
  %arrayidx111 = getelementptr inbounds i8, i8* %55, i32 2
  %56 = load i8, i8* %arrayidx111, align 1
  %conv112 = sext i8 %56 to i32
  %cmp113 = icmp eq i32 %conv112, 116
  br i1 %cmp113, label %if.then115, label %if.else125

if.then115:                                       ; preds = %if.else110
  %57 = load i8*, i8** %op.addr, align 4
  %arrayidx116 = getelementptr inbounds i8, i8* %57, i32 1
  %58 = load i8, i8* %arrayidx116, align 1
  %conv117 = sext i8 %58 to i32
  switch i32 %conv117, label %sw.epilog [
    i32 110, label %sw.bb
    i32 111, label %sw.bb119
    i32 108, label %sw.bb121
    i32 103, label %sw.bb123
  ]

sw.bb:                                            ; preds = %if.then115
  %59 = load i8*, i8** %arg1.addr, align 4
  %60 = load i8*, i8** %arg2.addr, align 4
  %call118 = call i32 @filecomp(i8* %59, i8* %60, i32 0)
  store i32 %call118, i32* %retval, align 4
  br label %return

sw.bb119:                                         ; preds = %if.then115
  %61 = load i8*, i8** %arg1.addr, align 4
  %62 = load i8*, i8** %arg2.addr, align 4
  %call120 = call i32 @filecomp(i8* %61, i8* %62, i32 1)
  store i32 %call120, i32* %retval, align 4
  br label %return

sw.bb121:                                         ; preds = %if.then115
  %63 = load i8*, i8** %arg1.addr, align 4
  %64 = load i8*, i8** %arg2.addr, align 4
  %65 = load i32, i32* %flags.addr, align 4
  %call122 = call i32 @arithcomp(i8* %63, i8* %64, i32 2, i32 %65)
  store i32 %call122, i32* %retval, align 4
  br label %return

sw.bb123:                                         ; preds = %if.then115
  %66 = load i8*, i8** %arg1.addr, align 4
  %67 = load i8*, i8** %arg2.addr, align 4
  %68 = load i32, i32* %flags.addr, align 4
  %call124 = call i32 @arithcomp(i8* %66, i8* %67, i32 3, i32 %68)
  store i32 %call124, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.then115
  br label %if.end154

if.else125:                                       ; preds = %if.else110
  %69 = load i8*, i8** %op.addr, align 4
  %arrayidx126 = getelementptr inbounds i8, i8* %69, i32 1
  %70 = load i8, i8* %arrayidx126, align 1
  %conv127 = sext i8 %70 to i32
  %cmp128 = icmp eq i32 %conv127, 101
  br i1 %cmp128, label %if.then130, label %if.else138

if.then130:                                       ; preds = %if.else125
  %71 = load i8*, i8** %op.addr, align 4
  %arrayidx131 = getelementptr inbounds i8, i8* %71, i32 2
  %72 = load i8, i8* %arrayidx131, align 1
  %conv132 = sext i8 %72 to i32
  switch i32 %conv132, label %sw.epilog137 [
    i32 102, label %sw.bb133
    i32 113, label %sw.bb135
  ]

sw.bb133:                                         ; preds = %if.then130
  %73 = load i8*, i8** %arg1.addr, align 4
  %74 = load i8*, i8** %arg2.addr, align 4
  %call134 = call i32 @filecomp(i8* %73, i8* %74, i32 2)
  store i32 %call134, i32* %retval, align 4
  br label %return

sw.bb135:                                         ; preds = %if.then130
  %75 = load i8*, i8** %arg1.addr, align 4
  %76 = load i8*, i8** %arg2.addr, align 4
  %77 = load i32, i32* %flags.addr, align 4
  %call136 = call i32 @arithcomp(i8* %75, i8* %76, i32 0, i32 %77)
  store i32 %call136, i32* %retval, align 4
  br label %return

sw.epilog137:                                     ; preds = %if.then130
  br label %if.end153

if.else138:                                       ; preds = %if.else125
  %78 = load i8*, i8** %op.addr, align 4
  %arrayidx139 = getelementptr inbounds i8, i8* %78, i32 2
  %79 = load i8, i8* %arrayidx139, align 1
  %conv140 = sext i8 %79 to i32
  %cmp141 = icmp eq i32 %conv140, 101
  br i1 %cmp141, label %if.then143, label %if.end

if.then143:                                       ; preds = %if.else138
  %80 = load i8*, i8** %op.addr, align 4
  %arrayidx144 = getelementptr inbounds i8, i8* %80, i32 1
  %81 = load i8, i8* %arrayidx144, align 1
  %conv145 = sext i8 %81 to i32
  switch i32 %conv145, label %sw.epilog152 [
    i32 110, label %sw.bb146
    i32 103, label %sw.bb148
    i32 108, label %sw.bb150
  ]

sw.bb146:                                         ; preds = %if.then143
  %82 = load i8*, i8** %arg1.addr, align 4
  %83 = load i8*, i8** %arg2.addr, align 4
  %84 = load i32, i32* %flags.addr, align 4
  %call147 = call i32 @arithcomp(i8* %82, i8* %83, i32 1, i32 %84)
  store i32 %call147, i32* %retval, align 4
  br label %return

sw.bb148:                                         ; preds = %if.then143
  %85 = load i8*, i8** %arg1.addr, align 4
  %86 = load i8*, i8** %arg2.addr, align 4
  %87 = load i32, i32* %flags.addr, align 4
  %call149 = call i32 @arithcomp(i8* %85, i8* %86, i32 5, i32 %87)
  store i32 %call149, i32* %retval, align 4
  br label %return

sw.bb150:                                         ; preds = %if.then143
  %88 = load i8*, i8** %arg1.addr, align 4
  %89 = load i8*, i8** %arg2.addr, align 4
  %90 = load i32, i32* %flags.addr, align 4
  %call151 = call i32 @arithcomp(i8* %88, i8* %89, i32 4, i32 %90)
  store i32 %call151, i32* %retval, align 4
  br label %return

sw.epilog152:                                     ; preds = %if.then143
  br label %if.end

if.end:                                           ; preds = %sw.epilog152, %if.else138
  br label %if.end153

if.end153:                                        ; preds = %if.end, %sw.epilog137
  br label %if.end154

if.end154:                                        ; preds = %if.end153, %sw.epilog
  br label %if.end155

if.end155:                                        ; preds = %if.end154
  br label %if.end156

if.end156:                                        ; preds = %if.end155
  br label %if.end157

if.end157:                                        ; preds = %if.end156
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end157, %sw.bb150, %sw.bb148, %sw.bb146, %sw.bb135, %sw.bb133, %sw.bb123, %sw.bb121, %sw.bb119, %sw.bb, %cond.end108, %cond.end72, %cond.end57, %cond.end
  %91 = load i32, i32* %retval, align 4
  ret i32 %91
}

; Function Attrs: noinline nounwind
define internal i32 @patcomp(i8* %string, i8* %pat, i32 %op) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %pat.addr = alloca i8*, align 4
  %op.addr = alloca i32, align 4
  %m = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %pat, i8** %pat.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  %0 = load i8*, i8** %pat.addr, align 4
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i32, i32* @extended_glob, align 4
  %tobool = icmp ne i32 %2, 0
  %cond = select i1 %tobool, i32 32, i32 0
  %3 = load i32, i32* @match_ignore_case, align 4
  %tobool1 = icmp ne i32 %3, 0
  %cond2 = select i1 %tobool1, i32 16, i32 0
  %or = or i32 %cond, %cond2
  %call = call i32 @strmatch(i8* %0, i8* %1, i32 %or)
  store i32 %call, i32* %m, align 4
  %4 = load i32, i32* %op.addr, align 4
  %cmp = icmp eq i32 %4, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %5 = load i32, i32* %m, align 4
  %cmp3 = icmp eq i32 %5, 0
  %conv = zext i1 %cmp3 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %6 = load i32, i32* %m, align 4
  %cmp4 = icmp ne i32 %6, 0
  %conv5 = zext i1 %cmp4 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond6 = phi i32 [ %conv, %cond.true ], [ %conv5, %cond.false ]
  ret i32 %cond6
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @strcoll(i8*, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @filecomp(i8* %s, i8* %t, i32 %op) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %t.addr = alloca i8*, align 4
  %op.addr = alloca i32, align 4
  %st1 = alloca %struct.stat, align 8
  %st2 = alloca %struct.stat, align 8
  %ts1 = alloca %struct.timespec, align 4
  %ts2 = alloca %struct.timespec, align 4
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %t, i8** %t.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  %call = call i32 @stat_mtime(i8* %0, %struct.stat* %st1, %struct.timespec* %ts1)
  store i32 %call, i32* %r1, align 4
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %op.addr, align 4
  %cmp1 = icmp eq i32 %1, 2
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %2 = load i8*, i8** %t.addr, align 4
  %call4 = call i32 @stat_mtime(i8* %2, %struct.stat* %st2, %struct.timespec* %ts2)
  store i32 %call4, i32* %r2, align 4
  %cmp5 = icmp slt i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.end3
  %3 = load i32, i32* %op.addr, align 4
  %cmp7 = icmp eq i32 %3, 2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then6
  store i32 0, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end3
  %4 = load i32, i32* %op.addr, align 4
  switch i32 %4, label %sw.epilog [
    i32 1, label %sw.bb
    i32 0, label %sw.bb15
    i32 2, label %sw.bb25
  ]

sw.bb:                                            ; preds = %if.end10
  %5 = load i32, i32* %r1, align 4
  %6 = load i32, i32* %r2, align 4
  %cmp11 = icmp slt i32 %5, %6
  br i1 %cmp11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %sw.bb
  %7 = load i32, i32* %r2, align 4
  %cmp12 = icmp eq i32 %7, 0
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %call13 = call i32 @timespec_cmp(%struct.timespec* byval align 4 %ts1, %struct.timespec* byval align 4 %ts2)
  %cmp14 = icmp slt i32 %call13, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %8 = phi i1 [ false, %lor.rhs ], [ %cmp14, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %sw.bb
  %9 = phi i1 [ true, %sw.bb ], [ %8, %land.end ]
  %lor.ext = zext i1 %9 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

sw.bb15:                                          ; preds = %if.end10
  %10 = load i32, i32* %r1, align 4
  %11 = load i32, i32* %r2, align 4
  %cmp16 = icmp sgt i32 %10, %11
  br i1 %cmp16, label %lor.end23, label %lor.rhs17

lor.rhs17:                                        ; preds = %sw.bb15
  %12 = load i32, i32* %r1, align 4
  %cmp18 = icmp eq i32 %12, 0
  br i1 %cmp18, label %land.rhs19, label %land.end22

land.rhs19:                                       ; preds = %lor.rhs17
  %call20 = call i32 @timespec_cmp(%struct.timespec* byval align 4 %ts1, %struct.timespec* byval align 4 %ts2)
  %cmp21 = icmp sgt i32 %call20, 0
  br label %land.end22

land.end22:                                       ; preds = %land.rhs19, %lor.rhs17
  %13 = phi i1 [ false, %lor.rhs17 ], [ %cmp21, %land.rhs19 ]
  br label %lor.end23

lor.end23:                                        ; preds = %land.end22, %sw.bb15
  %14 = phi i1 [ true, %sw.bb15 ], [ %13, %land.end22 ]
  %lor.ext24 = zext i1 %14 to i32
  store i32 %lor.ext24, i32* %retval, align 4
  br label %return

sw.bb25:                                          ; preds = %if.end10
  %15 = load i8*, i8** %s.addr, align 4
  %16 = load i8*, i8** %t.addr, align 4
  %call26 = call i32 @same_file(i8* %15, i8* %16, %struct.stat* %st1, %struct.stat* %st2)
  store i32 %call26, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end10
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb25, %lor.end23, %lor.end, %if.then8, %if.then2
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind
define internal i32 @arithcomp(i8* %s, i8* %t, i32 %op, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %t.addr = alloca i8*, align 4
  %op.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %l = alloca i64, align 8
  %r = alloca i64, align 8
  %expok = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i8* %t, i8** %t.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %s.addr, align 4
  %call = call i64 @evalexp(i8* %1, i32* %expok)
  store i64 %call, i64* %l, align 8
  %2 = load i32, i32* %expok, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %3 = load i8*, i8** %t.addr, align 4
  %call2 = call i64 @evalexp(i8* %3, i32* %expok)
  store i64 %call2, i64* %r, align 8
  %4 = load i32, i32* %expok, align 4
  %cmp3 = icmp eq i32 %4, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  br label %if.end14

if.else:                                          ; preds = %entry
  %5 = load i8*, i8** %s.addr, align 4
  %call6 = call i32 @legal_number(i8* %5, i64* %l)
  %cmp7 = icmp eq i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.else
  %6 = load i8*, i8** %s.addr, align 4
  call void @integer_expected_error(i8* %6) #6
  unreachable

if.end9:                                          ; preds = %if.else
  %7 = load i8*, i8** %t.addr, align 4
  %call10 = call i32 @legal_number(i8* %7, i64* %r)
  %cmp11 = icmp eq i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end9
  %8 = load i8*, i8** %t.addr, align 4
  call void @integer_expected_error(i8* %8) #6
  unreachable

if.end13:                                         ; preds = %if.end9
  br label %if.end14

if.end14:                                         ; preds = %if.end13, %if.end5
  %9 = load i32, i32* %op.addr, align 4
  switch i32 %9, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb16
    i32 2, label %sw.bb19
    i32 3, label %sw.bb22
    i32 4, label %sw.bb25
    i32 5, label %sw.bb28
  ]

sw.bb:                                            ; preds = %if.end14
  %10 = load i64, i64* %l, align 8
  %11 = load i64, i64* %r, align 8
  %cmp15 = icmp eq i64 %10, %11
  %conv = zext i1 %cmp15 to i32
  store i32 %conv, i32* %retval, align 4
  br label %return

sw.bb16:                                          ; preds = %if.end14
  %12 = load i64, i64* %l, align 8
  %13 = load i64, i64* %r, align 8
  %cmp17 = icmp ne i64 %12, %13
  %conv18 = zext i1 %cmp17 to i32
  store i32 %conv18, i32* %retval, align 4
  br label %return

sw.bb19:                                          ; preds = %if.end14
  %14 = load i64, i64* %l, align 8
  %15 = load i64, i64* %r, align 8
  %cmp20 = icmp slt i64 %14, %15
  %conv21 = zext i1 %cmp20 to i32
  store i32 %conv21, i32* %retval, align 4
  br label %return

sw.bb22:                                          ; preds = %if.end14
  %16 = load i64, i64* %l, align 8
  %17 = load i64, i64* %r, align 8
  %cmp23 = icmp sgt i64 %16, %17
  %conv24 = zext i1 %cmp23 to i32
  store i32 %conv24, i32* %retval, align 4
  br label %return

sw.bb25:                                          ; preds = %if.end14
  %18 = load i64, i64* %l, align 8
  %19 = load i64, i64* %r, align 8
  %cmp26 = icmp sle i64 %18, %19
  %conv27 = zext i1 %cmp26 to i32
  store i32 %conv27, i32* %retval, align 4
  br label %return

sw.bb28:                                          ; preds = %if.end14
  %20 = load i64, i64* %l, align 8
  %21 = load i64, i64* %r, align 8
  %cmp29 = icmp sge i64 %20, %21
  %conv30 = zext i1 %cmp29 to i32
  store i32 %conv30, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end14
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb28, %sw.bb25, %sw.bb22, %sw.bb19, %sw.bb16, %sw.bb, %if.then4, %if.then1
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

; Function Attrs: noinline nounwind
define i32 @unary_test(i8* %op, i8* %arg) #0 {
entry:
  %retval = alloca i32, align 4
  %op.addr = alloca i8*, align 4
  %arg.addr = alloca i8*, align 4
  %r = alloca i64, align 8
  %stat_buf = alloca %struct.stat, align 8
  %v = alloca %struct.variable*, align 4
  %t = alloca i8*, align 4
  %t210 = alloca i8*, align 4
  %t226 = alloca i8*, align 4
  store i8* %op, i8** %op.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %op.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 1
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  switch i32 %conv, label %sw.epilog [
    i32 97, label %sw.bb
    i32 101, label %sw.bb
    i32 114, label %sw.bb2
    i32 119, label %sw.bb6
    i32 120, label %sw.bb10
    i32 79, label %sw.bb14
    i32 71, label %sw.bb20
    i32 78, label %sw.bb29
    i32 102, label %sw.bb39
    i32 100, label %sw.bb49
    i32 115, label %sw.bb60
    i32 83, label %sw.bb69
    i32 99, label %sw.bb80
    i32 98, label %sw.bb91
    i32 112, label %sw.bb102
    i32 76, label %sw.bb113
    i32 104, label %sw.bb113
    i32 117, label %sw.bb128
    i32 103, label %sw.bb139
    i32 107, label %sw.bb150
    i32 116, label %sw.bb161
    i32 110, label %sw.bb176
    i32 122, label %sw.bb181
    i32 111, label %sw.bb186
    i32 118, label %sw.bb190
    i32 82, label %sw.bb247
  ]

sw.bb:                                            ; preds = %entry, %entry
  %2 = load i8*, i8** %arg.addr, align 4
  %call = call i32 @sh_stat(i8* %2, %struct.stat* %stat_buf)
  %cmp = icmp eq i32 %call, 0
  %conv1 = zext i1 %cmp to i32
  store i32 %conv1, i32* %retval, align 4
  br label %return

sw.bb2:                                           ; preds = %entry
  %3 = load i8*, i8** %arg.addr, align 4
  %call3 = call i32 @sh_eaccess(i8* %3, i32 4)
  %cmp4 = icmp eq i32 %call3, 0
  %conv5 = zext i1 %cmp4 to i32
  store i32 %conv5, i32* %retval, align 4
  br label %return

sw.bb6:                                           ; preds = %entry
  %4 = load i8*, i8** %arg.addr, align 4
  %call7 = call i32 @sh_eaccess(i8* %4, i32 2)
  %cmp8 = icmp eq i32 %call7, 0
  %conv9 = zext i1 %cmp8 to i32
  store i32 %conv9, i32* %retval, align 4
  br label %return

sw.bb10:                                          ; preds = %entry
  %5 = load i8*, i8** %arg.addr, align 4
  %call11 = call i32 @sh_eaccess(i8* %5, i32 1)
  %cmp12 = icmp eq i32 %call11, 0
  %conv13 = zext i1 %cmp12 to i32
  store i32 %conv13, i32* %retval, align 4
  br label %return

sw.bb14:                                          ; preds = %entry
  %6 = load i8*, i8** %arg.addr, align 4
  %call15 = call i32 @sh_stat(i8* %6, %struct.stat* %stat_buf)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %sw.bb14
  %7 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 1), align 4
  %st_uid = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 7
  %8 = load i32, i32* %st_uid, align 4
  %cmp18 = icmp eq i32 %7, %8
  br label %land.end

land.end:                                         ; preds = %land.rhs, %sw.bb14
  %9 = phi i1 [ false, %sw.bb14 ], [ %cmp18, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

sw.bb20:                                          ; preds = %entry
  %10 = load i8*, i8** %arg.addr, align 4
  %call21 = call i32 @sh_stat(i8* %10, %struct.stat* %stat_buf)
  %cmp22 = icmp eq i32 %call21, 0
  br i1 %cmp22, label %land.rhs24, label %land.end27

land.rhs24:                                       ; preds = %sw.bb20
  %11 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %st_gid = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 8
  %12 = load i32, i32* %st_gid, align 8
  %cmp25 = icmp eq i32 %11, %12
  br label %land.end27

land.end27:                                       ; preds = %land.rhs24, %sw.bb20
  %13 = phi i1 [ false, %sw.bb20 ], [ %cmp25, %land.rhs24 ]
  %land.ext28 = zext i1 %13 to i32
  store i32 %land.ext28, i32* %retval, align 4
  br label %return

sw.bb29:                                          ; preds = %entry
  %14 = load i8*, i8** %arg.addr, align 4
  %call30 = call i32 @sh_stat(i8* %14, %struct.stat* %stat_buf)
  %cmp31 = icmp eq i32 %call30, 0
  br i1 %cmp31, label %land.rhs33, label %land.end37

land.rhs33:                                       ; preds = %sw.bb29
  %st_atim = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 18
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_atim, i32 0, i32 0
  %15 = load i32, i32* %tv_sec, align 8
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 19
  %tv_sec34 = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %16 = load i32, i32* %tv_sec34, align 8
  %cmp35 = icmp sle i32 %15, %16
  br label %land.end37

land.end37:                                       ; preds = %land.rhs33, %sw.bb29
  %17 = phi i1 [ false, %sw.bb29 ], [ %cmp35, %land.rhs33 ]
  %land.ext38 = zext i1 %17 to i32
  store i32 %land.ext38, i32* %retval, align 4
  br label %return

sw.bb39:                                          ; preds = %entry
  %18 = load i8*, i8** %arg.addr, align 4
  %call40 = call i32 @sh_stat(i8* %18, %struct.stat* %stat_buf)
  %cmp41 = icmp slt i32 %call40, 0
  br i1 %cmp41, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb39
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %sw.bb39
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %19 = load i32, i32* %st_mode, align 8
  %and = and i32 %19, 61440
  %cmp43 = icmp eq i32 %and, 32768
  br i1 %cmp43, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %st_mode45 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %20 = load i32, i32* %st_mode45, align 8
  %and46 = and i32 %20, 61440
  %cmp47 = icmp eq i32 %and46, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %21 = phi i1 [ true, %if.end ], [ %cmp47, %lor.rhs ]
  %lor.ext = zext i1 %21 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

sw.bb49:                                          ; preds = %entry
  %22 = load i8*, i8** %arg.addr, align 4
  %call50 = call i32 @sh_stat(i8* %22, %struct.stat* %stat_buf)
  %cmp51 = icmp eq i32 %call50, 0
  br i1 %cmp51, label %land.rhs53, label %land.end58

land.rhs53:                                       ; preds = %sw.bb49
  %st_mode54 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %23 = load i32, i32* %st_mode54, align 8
  %and55 = and i32 %23, 61440
  %cmp56 = icmp eq i32 %and55, 16384
  br label %land.end58

land.end58:                                       ; preds = %land.rhs53, %sw.bb49
  %24 = phi i1 [ false, %sw.bb49 ], [ %cmp56, %land.rhs53 ]
  %land.ext59 = zext i1 %24 to i32
  store i32 %land.ext59, i32* %retval, align 4
  br label %return

sw.bb60:                                          ; preds = %entry
  %25 = load i8*, i8** %arg.addr, align 4
  %call61 = call i32 @sh_stat(i8* %25, %struct.stat* %stat_buf)
  %cmp62 = icmp eq i32 %call61, 0
  br i1 %cmp62, label %land.rhs64, label %land.end67

land.rhs64:                                       ; preds = %sw.bb60
  %st_size = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 12
  %26 = load i32, i32* %st_size, align 8
  %cmp65 = icmp sgt i32 %26, 0
  br label %land.end67

land.end67:                                       ; preds = %land.rhs64, %sw.bb60
  %27 = phi i1 [ false, %sw.bb60 ], [ %cmp65, %land.rhs64 ]
  %land.ext68 = zext i1 %27 to i32
  store i32 %land.ext68, i32* %retval, align 4
  br label %return

sw.bb69:                                          ; preds = %entry
  %28 = load i8*, i8** %arg.addr, align 4
  %call70 = call i32 @sh_stat(i8* %28, %struct.stat* %stat_buf)
  %cmp71 = icmp eq i32 %call70, 0
  br i1 %cmp71, label %land.rhs73, label %land.end78

land.rhs73:                                       ; preds = %sw.bb69
  %st_mode74 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %29 = load i32, i32* %st_mode74, align 8
  %and75 = and i32 %29, 61440
  %cmp76 = icmp eq i32 %and75, 49152
  br label %land.end78

land.end78:                                       ; preds = %land.rhs73, %sw.bb69
  %30 = phi i1 [ false, %sw.bb69 ], [ %cmp76, %land.rhs73 ]
  %land.ext79 = zext i1 %30 to i32
  store i32 %land.ext79, i32* %retval, align 4
  br label %return

sw.bb80:                                          ; preds = %entry
  %31 = load i8*, i8** %arg.addr, align 4
  %call81 = call i32 @sh_stat(i8* %31, %struct.stat* %stat_buf)
  %cmp82 = icmp eq i32 %call81, 0
  br i1 %cmp82, label %land.rhs84, label %land.end89

land.rhs84:                                       ; preds = %sw.bb80
  %st_mode85 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %32 = load i32, i32* %st_mode85, align 8
  %and86 = and i32 %32, 61440
  %cmp87 = icmp eq i32 %and86, 8192
  br label %land.end89

land.end89:                                       ; preds = %land.rhs84, %sw.bb80
  %33 = phi i1 [ false, %sw.bb80 ], [ %cmp87, %land.rhs84 ]
  %land.ext90 = zext i1 %33 to i32
  store i32 %land.ext90, i32* %retval, align 4
  br label %return

sw.bb91:                                          ; preds = %entry
  %34 = load i8*, i8** %arg.addr, align 4
  %call92 = call i32 @sh_stat(i8* %34, %struct.stat* %stat_buf)
  %cmp93 = icmp eq i32 %call92, 0
  br i1 %cmp93, label %land.rhs95, label %land.end100

land.rhs95:                                       ; preds = %sw.bb91
  %st_mode96 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %35 = load i32, i32* %st_mode96, align 8
  %and97 = and i32 %35, 61440
  %cmp98 = icmp eq i32 %and97, 24576
  br label %land.end100

land.end100:                                      ; preds = %land.rhs95, %sw.bb91
  %36 = phi i1 [ false, %sw.bb91 ], [ %cmp98, %land.rhs95 ]
  %land.ext101 = zext i1 %36 to i32
  store i32 %land.ext101, i32* %retval, align 4
  br label %return

sw.bb102:                                         ; preds = %entry
  %37 = load i8*, i8** %arg.addr, align 4
  %call103 = call i32 @sh_stat(i8* %37, %struct.stat* %stat_buf)
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %land.rhs106, label %land.end111

land.rhs106:                                      ; preds = %sw.bb102
  %st_mode107 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %38 = load i32, i32* %st_mode107, align 8
  %and108 = and i32 %38, 61440
  %cmp109 = icmp eq i32 %and108, 4096
  br label %land.end111

land.end111:                                      ; preds = %land.rhs106, %sw.bb102
  %39 = phi i1 [ false, %sw.bb102 ], [ %cmp109, %land.rhs106 ]
  %land.ext112 = zext i1 %39 to i32
  store i32 %land.ext112, i32* %retval, align 4
  br label %return

sw.bb113:                                         ; preds = %entry, %entry
  %40 = load i8*, i8** %arg.addr, align 4
  %arrayidx114 = getelementptr inbounds i8, i8* %40, i32 0
  %41 = load i8, i8* %arrayidx114, align 1
  %conv115 = sext i8 %41 to i32
  %cmp116 = icmp ne i32 %conv115, 0
  br i1 %cmp116, label %land.lhs.true, label %land.end126

land.lhs.true:                                    ; preds = %sw.bb113
  %42 = load i8*, i8** %arg.addr, align 4
  %call118 = call i32 @lstat(i8* %42, %struct.stat* %stat_buf)
  %cmp119 = icmp eq i32 %call118, 0
  br i1 %cmp119, label %land.rhs121, label %land.end126

land.rhs121:                                      ; preds = %land.lhs.true
  %st_mode122 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %43 = load i32, i32* %st_mode122, align 8
  %and123 = and i32 %43, 61440
  %cmp124 = icmp eq i32 %and123, 40960
  br label %land.end126

land.end126:                                      ; preds = %land.rhs121, %land.lhs.true, %sw.bb113
  %44 = phi i1 [ false, %land.lhs.true ], [ false, %sw.bb113 ], [ %cmp124, %land.rhs121 ]
  %land.ext127 = zext i1 %44 to i32
  store i32 %land.ext127, i32* %retval, align 4
  br label %return

sw.bb128:                                         ; preds = %entry
  %45 = load i8*, i8** %arg.addr, align 4
  %call129 = call i32 @sh_stat(i8* %45, %struct.stat* %stat_buf)
  %cmp130 = icmp eq i32 %call129, 0
  br i1 %cmp130, label %land.rhs132, label %land.end137

land.rhs132:                                      ; preds = %sw.bb128
  %st_mode133 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %46 = load i32, i32* %st_mode133, align 8
  %and134 = and i32 %46, 2048
  %cmp135 = icmp ne i32 %and134, 0
  br label %land.end137

land.end137:                                      ; preds = %land.rhs132, %sw.bb128
  %47 = phi i1 [ false, %sw.bb128 ], [ %cmp135, %land.rhs132 ]
  %land.ext138 = zext i1 %47 to i32
  store i32 %land.ext138, i32* %retval, align 4
  br label %return

sw.bb139:                                         ; preds = %entry
  %48 = load i8*, i8** %arg.addr, align 4
  %call140 = call i32 @sh_stat(i8* %48, %struct.stat* %stat_buf)
  %cmp141 = icmp eq i32 %call140, 0
  br i1 %cmp141, label %land.rhs143, label %land.end148

land.rhs143:                                      ; preds = %sw.bb139
  %st_mode144 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %49 = load i32, i32* %st_mode144, align 8
  %and145 = and i32 %49, 1024
  %cmp146 = icmp ne i32 %and145, 0
  br label %land.end148

land.end148:                                      ; preds = %land.rhs143, %sw.bb139
  %50 = phi i1 [ false, %sw.bb139 ], [ %cmp146, %land.rhs143 ]
  %land.ext149 = zext i1 %50 to i32
  store i32 %land.ext149, i32* %retval, align 4
  br label %return

sw.bb150:                                         ; preds = %entry
  %51 = load i8*, i8** %arg.addr, align 4
  %call151 = call i32 @sh_stat(i8* %51, %struct.stat* %stat_buf)
  %cmp152 = icmp eq i32 %call151, 0
  br i1 %cmp152, label %land.rhs154, label %land.end159

land.rhs154:                                      ; preds = %sw.bb150
  %st_mode155 = getelementptr inbounds %struct.stat, %struct.stat* %stat_buf, i32 0, i32 6
  %52 = load i32, i32* %st_mode155, align 8
  %and156 = and i32 %52, 512
  %cmp157 = icmp ne i32 %and156, 0
  br label %land.end159

land.end159:                                      ; preds = %land.rhs154, %sw.bb150
  %53 = phi i1 [ false, %sw.bb150 ], [ %cmp157, %land.rhs154 ]
  %land.ext160 = zext i1 %53 to i32
  store i32 %land.ext160, i32* %retval, align 4
  br label %return

sw.bb161:                                         ; preds = %entry
  %54 = load i8*, i8** %arg.addr, align 4
  %call162 = call i32 @legal_number(i8* %54, i64* %r)
  %cmp163 = icmp eq i32 %call162, 0
  br i1 %cmp163, label %if.then165, label %if.end166

if.then165:                                       ; preds = %sw.bb161
  store i32 0, i32* %retval, align 4
  br label %return

if.end166:                                        ; preds = %sw.bb161
  %55 = load i64, i64* %r, align 8
  %56 = load i64, i64* %r, align 8
  %conv167 = trunc i64 %56 to i32
  %conv168 = sext i32 %conv167 to i64
  %cmp169 = icmp eq i64 %55, %conv168
  br i1 %cmp169, label %land.rhs171, label %land.end174

land.rhs171:                                      ; preds = %if.end166
  %57 = load i64, i64* %r, align 8
  %conv172 = trunc i64 %57 to i32
  %call173 = call i32 @isatty(i32 %conv172)
  %tobool = icmp ne i32 %call173, 0
  br label %land.end174

land.end174:                                      ; preds = %land.rhs171, %if.end166
  %58 = phi i1 [ false, %if.end166 ], [ %tobool, %land.rhs171 ]
  %land.ext175 = zext i1 %58 to i32
  store i32 %land.ext175, i32* %retval, align 4
  br label %return

sw.bb176:                                         ; preds = %entry
  %59 = load i8*, i8** %arg.addr, align 4
  %arrayidx177 = getelementptr inbounds i8, i8* %59, i32 0
  %60 = load i8, i8* %arrayidx177, align 1
  %conv178 = sext i8 %60 to i32
  %cmp179 = icmp ne i32 %conv178, 0
  %conv180 = zext i1 %cmp179 to i32
  store i32 %conv180, i32* %retval, align 4
  br label %return

sw.bb181:                                         ; preds = %entry
  %61 = load i8*, i8** %arg.addr, align 4
  %arrayidx182 = getelementptr inbounds i8, i8* %61, i32 0
  %62 = load i8, i8* %arrayidx182, align 1
  %conv183 = sext i8 %62 to i32
  %cmp184 = icmp eq i32 %conv183, 0
  %conv185 = zext i1 %cmp184 to i32
  store i32 %conv185, i32* %retval, align 4
  br label %return

sw.bb186:                                         ; preds = %entry
  %63 = load i8*, i8** %arg.addr, align 4
  %call187 = call i32 @minus_o_option_value(i8* %63)
  %cmp188 = icmp eq i32 %call187, 1
  %conv189 = zext i1 %cmp188 to i32
  store i32 %conv189, i32* %retval, align 4
  br label %return

sw.bb190:                                         ; preds = %entry
  %64 = load i8*, i8** %arg.addr, align 4
  %call191 = call %struct.variable* @find_variable(i8* %64)
  store %struct.variable* %call191, %struct.variable** %v, align 4
  %65 = load %struct.variable*, %struct.variable** %v, align 4
  %cmp192 = icmp eq %struct.variable* %65, null
  br i1 %cmp192, label %land.lhs.true194, label %if.else

land.lhs.true194:                                 ; preds = %sw.bb190
  %66 = load i8*, i8** %arg.addr, align 4
  %call195 = call i32 @valid_array_reference(i8* %66, i32 0)
  %tobool196 = icmp ne i32 %call195, 0
  br i1 %tobool196, label %if.then197, label %if.else

if.then197:                                       ; preds = %land.lhs.true194
  %67 = load i8*, i8** %arg.addr, align 4
  %call198 = call i8* @array_value(i8* %67, i32 0, i32 0, i32* null, i64* null)
  store i8* %call198, i8** %t, align 4
  %68 = load i8*, i8** %t, align 4
  %tobool199 = icmp ne i8* %68, null
  %cond = select i1 %tobool199, i32 1, i32 0
  store i32 %cond, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true194, %sw.bb190
  %69 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool200 = icmp ne %struct.variable* %69, null
  br i1 %tobool200, label %land.lhs.true201, label %if.else214

land.lhs.true201:                                 ; preds = %if.else
  %70 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %70, i32 0, i32 5
  %71 = load i32, i32* %attributes, align 4
  %and202 = and i32 %71, 4096
  %cmp203 = icmp eq i32 %and202, 0
  br i1 %cmp203, label %land.lhs.true205, label %if.else214

land.lhs.true205:                                 ; preds = %land.lhs.true201
  %72 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes206 = getelementptr inbounds %struct.variable, %struct.variable* %72, i32 0, i32 5
  %73 = load i32, i32* %attributes206, align 4
  %and207 = and i32 %73, 4
  %tobool208 = icmp ne i32 %and207, 0
  br i1 %tobool208, label %if.then209, label %if.else214

if.then209:                                       ; preds = %land.lhs.true205
  %74 = load %struct.variable*, %struct.variable** %v, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %74, i32 0, i32 1
  %75 = load i8*, i8** %value, align 4
  %76 = bitcast i8* %75 to %struct.array*
  %call211 = call i8* @array_reference(%struct.array* %76, i64 0)
  store i8* %call211, i8** %t210, align 4
  %77 = load i8*, i8** %t210, align 4
  %tobool212 = icmp ne i8* %77, null
  %cond213 = select i1 %tobool212, i32 1, i32 0
  store i32 %cond213, i32* %retval, align 4
  br label %return

if.else214:                                       ; preds = %land.lhs.true205, %land.lhs.true201, %if.else
  %78 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool215 = icmp ne %struct.variable* %78, null
  br i1 %tobool215, label %land.lhs.true216, label %if.end231

land.lhs.true216:                                 ; preds = %if.else214
  %79 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes217 = getelementptr inbounds %struct.variable, %struct.variable* %79, i32 0, i32 5
  %80 = load i32, i32* %attributes217, align 4
  %and218 = and i32 %80, 4096
  %cmp219 = icmp eq i32 %and218, 0
  br i1 %cmp219, label %land.lhs.true221, label %if.end231

land.lhs.true221:                                 ; preds = %land.lhs.true216
  %81 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes222 = getelementptr inbounds %struct.variable, %struct.variable* %81, i32 0, i32 5
  %82 = load i32, i32* %attributes222, align 4
  %and223 = and i32 %82, 64
  %tobool224 = icmp ne i32 %and223, 0
  br i1 %tobool224, label %if.then225, label %if.end231

if.then225:                                       ; preds = %land.lhs.true221
  %83 = load %struct.variable*, %struct.variable** %v, align 4
  %value227 = getelementptr inbounds %struct.variable, %struct.variable* %83, i32 0, i32 1
  %84 = load i8*, i8** %value227, align 4
  %85 = bitcast i8* %84 to %struct.hash_table*
  %call228 = call i8* @assoc_reference(%struct.hash_table* %85, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i8* %call228, i8** %t226, align 4
  %86 = load i8*, i8** %t226, align 4
  %tobool229 = icmp ne i8* %86, null
  %cond230 = select i1 %tobool229, i32 1, i32 0
  store i32 %cond230, i32* %retval, align 4
  br label %return

if.end231:                                        ; preds = %land.lhs.true221, %land.lhs.true216, %if.else214
  br label %if.end232

if.end232:                                        ; preds = %if.end231
  br label %if.end233

if.end233:                                        ; preds = %if.end232
  %87 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool234 = icmp ne %struct.variable* %87, null
  br i1 %tobool234, label %land.lhs.true235, label %land.end244

land.lhs.true235:                                 ; preds = %if.end233
  %88 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes236 = getelementptr inbounds %struct.variable, %struct.variable* %88, i32 0, i32 5
  %89 = load i32, i32* %attributes236, align 4
  %and237 = and i32 %89, 4096
  %cmp238 = icmp eq i32 %and237, 0
  br i1 %cmp238, label %land.rhs240, label %land.end244

land.rhs240:                                      ; preds = %land.lhs.true235
  %90 = load %struct.variable*, %struct.variable** %v, align 4
  %value241 = getelementptr inbounds %struct.variable, %struct.variable* %90, i32 0, i32 1
  %91 = load i8*, i8** %value241, align 4
  %cmp242 = icmp ne i8* %91, null
  br label %land.end244

land.end244:                                      ; preds = %land.rhs240, %land.lhs.true235, %if.end233
  %92 = phi i1 [ false, %land.lhs.true235 ], [ false, %if.end233 ], [ %cmp242, %land.rhs240 ]
  %cond246 = select i1 %92, i32 1, i32 0
  store i32 %cond246, i32* %retval, align 4
  br label %return

sw.bb247:                                         ; preds = %entry
  %93 = load i8*, i8** %arg.addr, align 4
  %call248 = call %struct.variable* @find_variable_noref(i8* %93)
  store %struct.variable* %call248, %struct.variable** %v, align 4
  %94 = load %struct.variable*, %struct.variable** %v, align 4
  %tobool249 = icmp ne %struct.variable* %94, null
  br i1 %tobool249, label %land.lhs.true250, label %land.end263

land.lhs.true250:                                 ; preds = %sw.bb247
  %95 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes251 = getelementptr inbounds %struct.variable, %struct.variable* %95, i32 0, i32 5
  %96 = load i32, i32* %attributes251, align 4
  %and252 = and i32 %96, 4096
  %cmp253 = icmp eq i32 %and252, 0
  br i1 %cmp253, label %land.lhs.true255, label %land.end263

land.lhs.true255:                                 ; preds = %land.lhs.true250
  %97 = load %struct.variable*, %struct.variable** %v, align 4
  %value256 = getelementptr inbounds %struct.variable, %struct.variable* %97, i32 0, i32 1
  %98 = load i8*, i8** %value256, align 4
  %cmp257 = icmp ne i8* %98, null
  br i1 %cmp257, label %land.rhs259, label %land.end263

land.rhs259:                                      ; preds = %land.lhs.true255
  %99 = load %struct.variable*, %struct.variable** %v, align 4
  %attributes260 = getelementptr inbounds %struct.variable, %struct.variable* %99, i32 0, i32 5
  %100 = load i32, i32* %attributes260, align 4
  %and261 = and i32 %100, 2048
  %tobool262 = icmp ne i32 %and261, 0
  br label %land.end263

land.end263:                                      ; preds = %land.rhs259, %land.lhs.true255, %land.lhs.true250, %sw.bb247
  %101 = phi i1 [ false, %land.lhs.true255 ], [ false, %land.lhs.true250 ], [ false, %sw.bb247 ], [ %tobool262, %land.rhs259 ]
  %cond265 = select i1 %101, i32 1, i32 0
  store i32 %cond265, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %land.end263, %land.end244, %if.then225, %if.then209, %if.then197, %sw.bb186, %sw.bb181, %sw.bb176, %land.end174, %if.then165, %land.end159, %land.end148, %land.end137, %land.end126, %land.end111, %land.end100, %land.end89, %land.end78, %land.end67, %land.end58, %lor.end, %if.then, %land.end37, %land.end27, %land.end, %sw.bb10, %sw.bb6, %sw.bb2, %sw.bb
  %102 = load i32, i32* %retval, align 4
  ret i32 %102
}

declare i32 @sh_stat(i8*, %struct.stat*) #1

declare i32 @sh_eaccess(i8*, i32) #1

declare i32 @lstat(i8*, %struct.stat*) #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @isatty(i32) #1

declare i32 @minus_o_option_value(i8*) #1

declare %struct.variable* @find_variable(i8*) #1

declare i32 @valid_array_reference(i8*, i32) #1

declare i8* @array_value(i8*, i32, i32, i32*, i64*) #1

declare i8* @array_reference(%struct.array*, i64) #1

declare i8* @assoc_reference(%struct.hash_table*, i8*) #1

declare %struct.variable* @find_variable_noref(i8*) #1

; Function Attrs: noinline nounwind
define i32 @test_binop(i8* %op) #0 {
entry:
  %retval = alloca i32, align 4
  %op.addr = alloca i8*, align 4
  store i8* %op, i8** %op.addr, align 4
  %0 = load i8*, i8** %op.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 61
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %op.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i8*, i8** %op.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  %cmp8 = icmp eq i32 %conv7, 60
  br i1 %cmp8, label %land.lhs.true14, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %6 = load i8*, i8** %op.addr, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %7 to i32
  %cmp12 = icmp eq i32 %conv11, 62
  br i1 %cmp12, label %land.lhs.true14, label %if.else20

land.lhs.true14:                                  ; preds = %lor.lhs.false, %if.else
  %8 = load i8*, i8** %op.addr, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %9 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br i1 %cmp17, label %if.then19, label %if.else20

if.then19:                                        ; preds = %land.lhs.true14
  store i32 1, i32* %retval, align 4
  br label %return

if.else20:                                        ; preds = %land.lhs.true14, %lor.lhs.false
  %10 = load i8*, i8** %op.addr, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %11 to i32
  %cmp23 = icmp eq i32 %conv22, 61
  br i1 %cmp23, label %land.lhs.true30, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.else20
  %12 = load i8*, i8** %op.addr, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %13 to i32
  %cmp28 = icmp eq i32 %conv27, 33
  br i1 %cmp28, label %land.lhs.true30, label %if.else41

land.lhs.true30:                                  ; preds = %lor.lhs.false25, %if.else20
  %14 = load i8*, i8** %op.addr, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %14, i32 1
  %15 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %15 to i32
  %cmp33 = icmp eq i32 %conv32, 61
  br i1 %cmp33, label %land.lhs.true35, label %if.else41

land.lhs.true35:                                  ; preds = %land.lhs.true30
  %16 = load i8*, i8** %op.addr, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %16, i32 2
  %17 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %17 to i32
  %cmp38 = icmp eq i32 %conv37, 0
  br i1 %cmp38, label %if.then40, label %if.else41

if.then40:                                        ; preds = %land.lhs.true35
  store i32 1, i32* %retval, align 4
  br label %return

if.else41:                                        ; preds = %land.lhs.true35, %land.lhs.true30, %lor.lhs.false25
  %18 = load i8*, i8** %op.addr, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %18, i32 0
  %19 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %19 to i32
  %cmp44 = icmp ne i32 %conv43, 45
  br i1 %cmp44, label %if.then56, label %lor.lhs.false46

lor.lhs.false46:                                  ; preds = %if.else41
  %20 = load i8*, i8** %op.addr, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %20, i32 2
  %21 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %21 to i32
  %cmp49 = icmp eq i32 %conv48, 0
  br i1 %cmp49, label %if.then56, label %lor.lhs.false51

lor.lhs.false51:                                  ; preds = %lor.lhs.false46
  %22 = load i8*, i8** %op.addr, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %22, i32 3
  %23 = load i8, i8* %arrayidx52, align 1
  %conv53 = sext i8 %23 to i32
  %cmp54 = icmp ne i32 %conv53, 0
  br i1 %cmp54, label %if.then56, label %if.else57

if.then56:                                        ; preds = %lor.lhs.false51, %lor.lhs.false46, %if.else41
  store i32 0, i32* %retval, align 4
  br label %return

if.else57:                                        ; preds = %lor.lhs.false51
  %24 = load i8*, i8** %op.addr, align 4
  %arrayidx58 = getelementptr inbounds i8, i8* %24, i32 2
  %25 = load i8, i8* %arrayidx58, align 1
  %conv59 = sext i8 %25 to i32
  %cmp60 = icmp eq i32 %conv59, 116
  br i1 %cmp60, label %if.then62, label %if.else65

if.then62:                                        ; preds = %if.else57
  %26 = load i8*, i8** %op.addr, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %26, i32 1
  %27 = load i8, i8* %arrayidx63, align 1
  %conv64 = sext i8 %27 to i32
  switch i32 %conv64, label %sw.default [
    i32 110, label %sw.bb
    i32 111, label %sw.bb
    i32 108, label %sw.bb
    i32 103, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.then62, %if.then62, %if.then62, %if.then62
  store i32 1, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %if.then62
  store i32 0, i32* %retval, align 4
  br label %return

if.else65:                                        ; preds = %if.else57
  %28 = load i8*, i8** %op.addr, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %28, i32 1
  %29 = load i8, i8* %arrayidx66, align 1
  %conv67 = sext i8 %29 to i32
  %cmp68 = icmp eq i32 %conv67, 101
  br i1 %cmp68, label %if.then70, label %if.else75

if.then70:                                        ; preds = %if.else65
  %30 = load i8*, i8** %op.addr, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %30, i32 2
  %31 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %31 to i32
  switch i32 %conv72, label %sw.default74 [
    i32 113, label %sw.bb73
    i32 102, label %sw.bb73
  ]

sw.bb73:                                          ; preds = %if.then70, %if.then70
  store i32 1, i32* %retval, align 4
  br label %return

sw.default74:                                     ; preds = %if.then70
  store i32 0, i32* %retval, align 4
  br label %return

if.else75:                                        ; preds = %if.else65
  %32 = load i8*, i8** %op.addr, align 4
  %arrayidx76 = getelementptr inbounds i8, i8* %32, i32 2
  %33 = load i8, i8* %arrayidx76, align 1
  %conv77 = sext i8 %33 to i32
  %cmp78 = icmp eq i32 %conv77, 101
  br i1 %cmp78, label %if.then80, label %if.else85

if.then80:                                        ; preds = %if.else75
  %34 = load i8*, i8** %op.addr, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %34, i32 1
  %35 = load i8, i8* %arrayidx81, align 1
  %conv82 = sext i8 %35 to i32
  switch i32 %conv82, label %sw.default84 [
    i32 110, label %sw.bb83
    i32 103, label %sw.bb83
    i32 108, label %sw.bb83
  ]

sw.bb83:                                          ; preds = %if.then80, %if.then80, %if.then80
  store i32 1, i32* %retval, align 4
  br label %return

sw.default84:                                     ; preds = %if.then80
  store i32 0, i32* %retval, align 4
  br label %return

if.else85:                                        ; preds = %if.else75
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else85, %sw.default84, %sw.bb83, %sw.default74, %sw.bb73, %sw.default, %sw.bb, %if.then56, %if.then40, %if.then19, %if.then
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

; Function Attrs: noinline nounwind
define i32 @test_unop(i8* %op) #0 {
entry:
  %retval = alloca i32, align 4
  %op.addr = alloca i8*, align 4
  store i8* %op, i8** %op.addr, align 4
  %0 = load i8*, i8** %op.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 45
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i8*, i8** %op.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 2
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp ne i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %op.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  switch i32 %conv7, label %sw.epilog [
    i32 97, label %sw.bb
    i32 98, label %sw.bb
    i32 99, label %sw.bb
    i32 100, label %sw.bb
    i32 101, label %sw.bb
    i32 102, label %sw.bb
    i32 103, label %sw.bb
    i32 104, label %sw.bb
    i32 107, label %sw.bb
    i32 110, label %sw.bb
    i32 111, label %sw.bb
    i32 112, label %sw.bb
    i32 114, label %sw.bb
    i32 115, label %sw.bb
    i32 116, label %sw.bb
    i32 117, label %sw.bb
    i32 118, label %sw.bb
    i32 119, label %sw.bb
    i32 120, label %sw.bb
    i32 122, label %sw.bb
    i32 71, label %sw.bb
    i32 76, label %sw.bb
    i32 79, label %sw.bb
    i32 83, label %sw.bb
    i32 78, label %sw.bb
    i32 82, label %sw.bb
  ]

sw.bb:                                            ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end
  store i32 1, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind
define i32 @test_command(i32 %margc, i8** %margv) #0 {
entry:
  %margc.addr = alloca i32, align 4
  %margv.addr = alloca i8**, align 4
  %value = alloca i32, align 4
  %code = alloca i32, align 4
  store i32 %margc, i32* %margc.addr, align 4
  store i8** %margv, i8*** %margv.addr, align 4
  %call = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @test_exit_buf, i32 0, i32 0)) #7
  store i32 %call, i32* %code, align 4
  %0 = load i32, i32* %code, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @test_error_return, align 4
  br label %do.end46

if.end:                                           ; preds = %entry
  %2 = load i8**, i8*** %margv.addr, align 4
  store i8** %2, i8*** @argv, align 4
  %3 = load i8**, i8*** %margv.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %3, i32 0
  %4 = load i8*, i8** %arrayidx, align 4
  %tobool1 = icmp ne i8* %4, null
  br i1 %tobool1, label %land.lhs.true, label %if.end31

land.lhs.true:                                    ; preds = %if.end
  %5 = load i8**, i8*** %margv.addr, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %5, i32 0
  %6 = load i8*, i8** %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx3, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 91
  br i1 %cmp, label %land.lhs.true5, label %if.end31

land.lhs.true5:                                   ; preds = %land.lhs.true
  %8 = load i8**, i8*** %margv.addr, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %8, i32 0
  %9 = load i8*, i8** %arrayidx6, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %10 to i32
  %cmp9 = icmp eq i32 %conv8, 0
  br i1 %cmp9, label %if.then11, label %if.end31

if.then11:                                        ; preds = %land.lhs.true5
  %11 = load i32, i32* %margc.addr, align 4
  %dec = add nsw i32 %11, -1
  store i32 %dec, i32* %margc.addr, align 4
  %12 = load i8**, i8*** %margv.addr, align 4
  %13 = load i32, i32* %margc.addr, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx12, align 4
  %tobool13 = icmp ne i8* %14, null
  br i1 %tobool13, label %land.lhs.true14, label %if.end26

land.lhs.true14:                                  ; preds = %if.then11
  %15 = load i8**, i8*** %margv.addr, align 4
  %16 = load i32, i32* %margc.addr, align 4
  %arrayidx15 = getelementptr inbounds i8*, i8** %15, i32 %16
  %17 = load i8*, i8** %arrayidx15, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %18 to i32
  %cmp18 = icmp ne i32 %conv17, 93
  br i1 %cmp18, label %if.then24, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true14
  %19 = load i8**, i8*** %margv.addr, align 4
  %20 = load i32, i32* %margc.addr, align 4
  %arrayidx20 = getelementptr inbounds i8*, i8** %19, i32 %20
  %21 = load i8*, i8** %arrayidx20, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %22 to i32
  %tobool23 = icmp ne i32 %conv22, 0
  br i1 %tobool23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %lor.lhs.false, %land.lhs.true14
  %call25 = call i8* @libintl_gettext(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  call void @test_syntax_error(i8* %call25, i8* null) #6
  unreachable

if.end26:                                         ; preds = %lor.lhs.false, %if.then11
  %23 = load i32, i32* %margc.addr, align 4
  %cmp27 = icmp slt i32 %23, 2
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end26
  br label %do.body

do.body:                                          ; preds = %if.then29
  store i32 1, i32* @test_error_return, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @test_exit_buf, i32 0, i32 0), i32 1) #6
  unreachable

do.end:                                           ; No predecessors!
  br label %if.end30

if.end30:                                         ; preds = %do.end, %if.end26
  br label %if.end31

if.end31:                                         ; preds = %if.end30, %land.lhs.true5, %land.lhs.true, %if.end
  %24 = load i32, i32* %margc.addr, align 4
  store i32 %24, i32* @argc, align 4
  store i32 1, i32* @pos, align 4
  %25 = load i32, i32* @pos, align 4
  %26 = load i32, i32* @argc, align 4
  %cmp32 = icmp sge i32 %25, %26
  br i1 %cmp32, label %if.then34, label %if.end37

if.then34:                                        ; preds = %if.end31
  br label %do.body35

do.body35:                                        ; preds = %if.then34
  store i32 1, i32* @test_error_return, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @test_exit_buf, i32 0, i32 0), i32 1) #6
  unreachable

do.end36:                                         ; No predecessors!
  br label %if.end37

if.end37:                                         ; preds = %do.end36, %if.end31
  store i32 0, i32* @noeval, align 4
  %call38 = call i32 @posixtest()
  store i32 %call38, i32* %value, align 4
  %27 = load i32, i32* @pos, align 4
  %28 = load i32, i32* @argc, align 4
  %cmp39 = icmp ne i32 %27, %28
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end37
  %call42 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0))
  call void @test_syntax_error(i8* %call42, i8* null) #6
  unreachable

if.end43:                                         ; preds = %if.end37
  br label %do.body44

do.body44:                                        ; preds = %if.end43
  %29 = load i32, i32* %value, align 4
  %tobool45 = icmp ne i32 %29, 0
  %lnot = xor i1 %tobool45, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @test_error_return, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @test_exit_buf, i32 0, i32 0), i32 1) #6
  unreachable

do.end46:                                         ; preds = %if.then
  ret i32 %1
}

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

; Function Attrs: noinline noreturn nounwind
define internal void @test_syntax_error(i8* %format, i8* %arg) #3 {
entry:
  %format.addr = alloca i8*, align 4
  %arg.addr = alloca i8*, align 4
  store i8* %format, i8** %format.addr, align 4
  store i8* %arg, i8** %arg.addr, align 4
  %0 = load i8*, i8** %format.addr, align 4
  %1 = load i8*, i8** %arg.addr, align 4
  call void (i8*, ...) @builtin_error(i8* %0, i8* %1)
  br label %do.body

do.body:                                          ; preds = %entry
  store i32 2, i32* @test_error_return, align 4
  call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @test_exit_buf, i32 0, i32 0), i32 1) #6
  unreachable

do.end:                                           ; No predecessors!
  ret void
}

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noreturn
declare void @longjmp(%struct.__jmp_buf_tag*, i32) #4

; Function Attrs: noinline nounwind
define internal i32 @posixtest() #0 {
entry:
  %value = alloca i32, align 4
  %0 = load i32, i32* @argc, align 4
  %sub = sub nsw i32 %0, 1
  switch i32 %sub, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
    i32 4, label %sw.bb7
  ]

sw.bb:                                            ; preds = %entry
  store i32 0, i32* %value, align 4
  %1 = load i32, i32* @argc, align 4
  store i32 %1, i32* @pos, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %2 = load i8**, i8*** @argv, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 1
  %3 = load i8*, i8** %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv, 0
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, i32* %value, align 4
  %5 = load i32, i32* @argc, align 4
  store i32 %5, i32* @pos, align 4
  br label %sw.epilog

sw.bb4:                                           ; preds = %entry
  %call = call i32 @two_arguments()
  store i32 %call, i32* %value, align 4
  %6 = load i32, i32* @argc, align 4
  store i32 %6, i32* @pos, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %call6 = call i32 @three_arguments()
  store i32 %call6, i32* %value, align 4
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %7 = load i8**, i8*** @argv, align 4
  %8 = load i32, i32* @pos, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx8, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %10 to i32
  %cmp11 = icmp eq i32 %conv10, 33
  br i1 %cmp11, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %sw.bb7
  %11 = load i8**, i8*** @argv, align 4
  %12 = load i32, i32* @pos, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %11, i32 %12
  %13 = load i8*, i8** %arrayidx13, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %14 to i32
  %cmp16 = icmp eq i32 %conv15, 0
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  br label %do.body

do.body:                                          ; preds = %if.then
  %15 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* @pos, align 4
  %16 = load i32, i32* @pos, align 4
  %17 = load i32, i32* @argc, align 4
  %cmp18 = icmp sge i32 %16, %17
  br i1 %cmp18, label %if.then20, label %if.end

if.then20:                                        ; preds = %do.body
  call void @beyond() #6
  unreachable

if.end:                                           ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %call21 = call i32 @three_arguments()
  %tobool = icmp ne i32 %call21, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %value, align 4
  br label %sw.epilog

if.else:                                          ; preds = %land.lhs.true, %sw.bb7
  %18 = load i8**, i8*** @argv, align 4
  %19 = load i32, i32* @pos, align 4
  %arrayidx22 = getelementptr inbounds i8*, i8** %18, i32 %19
  %20 = load i8*, i8** %arrayidx22, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %21 to i32
  %cmp25 = icmp eq i32 %conv24, 40
  br i1 %cmp25, label %land.lhs.true27, label %if.end56

land.lhs.true27:                                  ; preds = %if.else
  %22 = load i8**, i8*** @argv, align 4
  %23 = load i32, i32* @pos, align 4
  %arrayidx28 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx28, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %24, i32 1
  %25 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %25 to i32
  %cmp31 = icmp eq i32 %conv30, 0
  br i1 %cmp31, label %land.lhs.true33, label %if.end56

land.lhs.true33:                                  ; preds = %land.lhs.true27
  %26 = load i8**, i8*** @argv, align 4
  %27 = load i32, i32* @argc, align 4
  %sub34 = sub nsw i32 %27, 1
  %arrayidx35 = getelementptr inbounds i8*, i8** %26, i32 %sub34
  %28 = load i8*, i8** %arrayidx35, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %28, i32 0
  %29 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %29 to i32
  %cmp38 = icmp eq i32 %conv37, 41
  br i1 %cmp38, label %land.lhs.true40, label %if.end56

land.lhs.true40:                                  ; preds = %land.lhs.true33
  %30 = load i8**, i8*** @argv, align 4
  %31 = load i32, i32* @argc, align 4
  %sub41 = sub nsw i32 %31, 1
  %arrayidx42 = getelementptr inbounds i8*, i8** %30, i32 %sub41
  %32 = load i8*, i8** %arrayidx42, align 4
  %arrayidx43 = getelementptr inbounds i8, i8* %32, i32 1
  %33 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %33 to i32
  %cmp45 = icmp eq i32 %conv44, 0
  br i1 %cmp45, label %if.then47, label %if.end56

if.then47:                                        ; preds = %land.lhs.true40
  br label %do.body48

do.body48:                                        ; preds = %if.then47
  %34 = load i32, i32* @pos, align 4
  %inc49 = add nsw i32 %34, 1
  store i32 %inc49, i32* @pos, align 4
  %35 = load i32, i32* @pos, align 4
  %36 = load i32, i32* @argc, align 4
  %cmp50 = icmp sge i32 %35, %36
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %do.body48
  call void @beyond() #6
  unreachable

if.end53:                                         ; preds = %do.body48
  br label %do.end54

do.end54:                                         ; preds = %if.end53
  %call55 = call i32 @two_arguments()
  store i32 %call55, i32* %value, align 4
  %37 = load i32, i32* @argc, align 4
  store i32 %37, i32* @pos, align 4
  br label %sw.epilog

if.end56:                                         ; preds = %land.lhs.true40, %land.lhs.true33, %land.lhs.true27, %if.else
  br label %if.end57

if.end57:                                         ; preds = %if.end56
  br label %sw.default

sw.default:                                       ; preds = %entry, %if.end57
  %call58 = call i32 @expr()
  store i32 %call58, i32* %value, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %do.end54, %do.end, %sw.bb5, %sw.bb4, %sw.bb1, %sw.bb
  %38 = load i32, i32* %value, align 4
  ret i32 %38
}

declare i32 @strmatch(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @stat_mtime(i8* %fn, %struct.stat* %st, %struct.timespec* %ts) #0 {
entry:
  %retval = alloca i32, align 4
  %fn.addr = alloca i8*, align 4
  %st.addr = alloca %struct.stat*, align 4
  %ts.addr = alloca %struct.timespec*, align 4
  %r = alloca i32, align 4
  %tmp = alloca %struct.timespec, align 4
  store i8* %fn, i8** %fn.addr, align 4
  store %struct.stat* %st, %struct.stat** %st.addr, align 4
  store %struct.timespec* %ts, %struct.timespec** %ts.addr, align 4
  %0 = load i8*, i8** %fn.addr, align 4
  %1 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %call = call i32 @sh_stat(i8* %0, %struct.stat* %1)
  store i32 %call, i32* %r, align 4
  %2 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %r, align 4
  store i32 %3, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load %struct.timespec*, %struct.timespec** %ts.addr, align 4
  %5 = load %struct.stat*, %struct.stat** %st.addr, align 4
  call void @get_stat_mtime(%struct.timespec* sret %tmp, %struct.stat* %5)
  %6 = bitcast %struct.timespec* %4 to i8*
  %7 = bitcast %struct.timespec* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %6, i8* %7, i32 8, i32 4, i1 false)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define internal i32 @timespec_cmp(%struct.timespec* byval align 4 %a, %struct.timespec* byval align 4 %b) #0 {
entry:
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %a, i32 0, i32 0
  %0 = load i32, i32* %tv_sec, align 4
  %tv_sec1 = getelementptr inbounds %struct.timespec, %struct.timespec* %b, i32 0, i32 0
  %1 = load i32, i32* %tv_sec1, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end8

cond.false:                                       ; preds = %entry
  %tv_sec2 = getelementptr inbounds %struct.timespec, %struct.timespec* %a, i32 0, i32 0
  %2 = load i32, i32* %tv_sec2, align 4
  %tv_sec3 = getelementptr inbounds %struct.timespec, %struct.timespec* %b, i32 0, i32 0
  %3 = load i32, i32* %tv_sec3, align 4
  %cmp4 = icmp sgt i32 %2, %3
  br i1 %cmp4, label %cond.true5, label %cond.false6

cond.true5:                                       ; preds = %cond.false
  br label %cond.end

cond.false6:                                      ; preds = %cond.false
  %tv_nsec = getelementptr inbounds %struct.timespec, %struct.timespec* %a, i32 0, i32 1
  %4 = load i32, i32* %tv_nsec, align 4
  %tv_nsec7 = getelementptr inbounds %struct.timespec, %struct.timespec* %b, i32 0, i32 1
  %5 = load i32, i32* %tv_nsec7, align 4
  %sub = sub nsw i32 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false6, %cond.true5
  %cond = phi i32 [ 1, %cond.true5 ], [ %sub, %cond.false6 ]
  br label %cond.end8

cond.end8:                                        ; preds = %cond.end, %cond.true
  %cond9 = phi i32 [ -1, %cond.true ], [ %cond, %cond.end ]
  ret i32 %cond9
}

declare i32 @same_file(i8*, i8*, %struct.stat*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define internal void @get_stat_mtime(%struct.timespec* noalias sret %agg.result, %struct.stat* %st) #0 {
entry:
  %st.addr = alloca %struct.stat*, align 4
  %t = alloca %struct.timespec, align 4
  store %struct.stat* %st, %struct.stat** %st.addr, align 4
  %0 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %st_mtim = getelementptr inbounds %struct.stat, %struct.stat* %0, i32 0, i32 19
  %tv_sec = getelementptr inbounds %struct.timespec, %struct.timespec* %st_mtim, i32 0, i32 0
  %1 = load i32, i32* %tv_sec, align 8
  %tv_sec1 = getelementptr inbounds %struct.timespec, %struct.timespec* %t, i32 0, i32 0
  store i32 %1, i32* %tv_sec1, align 4
  %2 = load %struct.stat*, %struct.stat** %st.addr, align 4
  %call = call i32 @get_stat_mtime_ns(%struct.stat* %2)
  %tv_nsec = getelementptr inbounds %struct.timespec, %struct.timespec* %t, i32 0, i32 1
  store i32 %call, i32* %tv_nsec, align 4
  %3 = bitcast %struct.timespec* %agg.result to i8*
  %4 = bitcast %struct.timespec* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* %4, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #5

; Function Attrs: noinline nounwind
define internal i32 @get_stat_mtime_ns(%struct.stat* %st) #0 {
entry:
  %st.addr = alloca %struct.stat*, align 4
  store %struct.stat* %st, %struct.stat** %st.addr, align 4
  ret i32 0
}

declare i64 @evalexp(i8*, i32*) #1

; Function Attrs: noinline noreturn nounwind
define internal void @integer_expected_error(i8* %pch) #3 {
entry:
  %pch.addr = alloca i8*, align 4
  store i8* %pch, i8** %pch.addr, align 4
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i32 0, i32 0))
  %0 = load i8*, i8** %pch.addr, align 4
  call void @test_syntax_error(i8* %call, i8* %0) #6
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @builtin_error(i8*, ...) #1

; Function Attrs: noinline nounwind
define internal i32 @two_arguments() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load i8**, i8*** @argv, align 4
  %1 = load i32, i32* @pos, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 33
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %4 = load i8**, i8*** @argv, align 4
  %5 = load i32, i32* @pos, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i32 %5
  %6 = load i8*, i8** %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %7 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %8 = load i8**, i8*** @argv, align 4
  %9 = load i32, i32* @pos, align 4
  %add = add nsw i32 %9, 1
  %arrayidx8 = getelementptr inbounds i8*, i8** %8, i32 %add
  %10 = load i8*, i8** %arrayidx8, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %10, i32 0
  %11 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %11 to i32
  %cmp11 = icmp eq i32 %conv10, 0
  %conv12 = zext i1 %cmp11 to i32
  store i32 %conv12, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.lhs.true, %entry
  %12 = load i8**, i8*** @argv, align 4
  %13 = load i32, i32* @pos, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx13, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %15 to i32
  %cmp16 = icmp eq i32 %conv15, 45
  br i1 %cmp16, label %land.lhs.true18, label %if.else31

land.lhs.true18:                                  ; preds = %if.else
  %16 = load i8**, i8*** @argv, align 4
  %17 = load i32, i32* @pos, align 4
  %arrayidx19 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx19, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %18, i32 2
  %19 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %19 to i32
  %cmp22 = icmp eq i32 %conv21, 0
  br i1 %cmp22, label %if.then24, label %if.else31

if.then24:                                        ; preds = %land.lhs.true18
  %20 = load i8**, i8*** @argv, align 4
  %21 = load i32, i32* @pos, align 4
  %arrayidx25 = getelementptr inbounds i8*, i8** %20, i32 %21
  %22 = load i8*, i8** %arrayidx25, align 4
  %call = call i32 @test_unop(i8* %22)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then26, label %if.else28

if.then26:                                        ; preds = %if.then24
  %call27 = call i32 @unary_operator()
  store i32 %call27, i32* %retval, align 4
  br label %return

if.else28:                                        ; preds = %if.then24
  %call29 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  %23 = load i8**, i8*** @argv, align 4
  %24 = load i32, i32* @pos, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %23, i32 %24
  %25 = load i8*, i8** %arrayidx30, align 4
  call void @test_syntax_error(i8* %call29, i8* %25) #6
  unreachable

if.else31:                                        ; preds = %land.lhs.true18, %if.else
  %call32 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  %26 = load i8**, i8*** @argv, align 4
  %27 = load i32, i32* @pos, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %26, i32 %27
  %28 = load i8*, i8** %arrayidx33, align 4
  call void @test_syntax_error(i8* %call32, i8* %28) #6
  unreachable

return:                                           ; preds = %if.then26, %if.then
  %29 = load i32, i32* %retval, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind
define internal i32 @three_arguments() #0 {
entry:
  %value = alloca i32, align 4
  %0 = load i8**, i8*** @argv, align 4
  %1 = load i32, i32* @pos, align 4
  %add = add nsw i32 %1, 1
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %add
  %2 = load i8*, i8** %arrayidx, align 4
  %call = call i32 @test_binop(i8* %2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 @binary_operator()
  store i32 %call1, i32* %value, align 4
  %3 = load i32, i32* @argc, align 4
  store i32 %3, i32* @pos, align 4
  br label %if.end100

if.else:                                          ; preds = %entry
  %4 = load i8**, i8*** @argv, align 4
  %5 = load i32, i32* @pos, align 4
  %add2 = add nsw i32 %5, 1
  %arrayidx3 = getelementptr inbounds i8*, i8** %4, i32 %add2
  %6 = load i8*, i8** %arrayidx3, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx4, align 1
  %conv = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, 45
  br i1 %cmp, label %land.lhs.true, label %if.else54

land.lhs.true:                                    ; preds = %if.else
  %8 = load i8**, i8*** @argv, align 4
  %9 = load i32, i32* @pos, align 4
  %add6 = add nsw i32 %9, 1
  %arrayidx7 = getelementptr inbounds i8*, i8** %8, i32 %add6
  %10 = load i8*, i8** %arrayidx7, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i32 2
  %11 = load i8, i8* %arrayidx8, align 1
  %tobool9 = icmp ne i8 %11, 0
  br i1 %tobool9, label %if.else54, label %land.lhs.true10

land.lhs.true10:                                  ; preds = %land.lhs.true
  %12 = load i8**, i8*** @argv, align 4
  %13 = load i32, i32* @pos, align 4
  %add11 = add nsw i32 %13, 1
  %arrayidx12 = getelementptr inbounds i8*, i8** %12, i32 %add11
  %14 = load i8*, i8** %arrayidx12, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %14, i32 1
  %15 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %15 to i32
  %cmp15 = icmp eq i32 %conv14, 97
  br i1 %cmp15, label %if.then23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true10
  %16 = load i8**, i8*** @argv, align 4
  %17 = load i32, i32* @pos, align 4
  %add17 = add nsw i32 %17, 1
  %arrayidx18 = getelementptr inbounds i8*, i8** %16, i32 %add17
  %18 = load i8*, i8** %arrayidx18, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %19 to i32
  %cmp21 = icmp eq i32 %conv20, 111
  br i1 %cmp21, label %if.then23, label %if.else54

if.then23:                                        ; preds = %lor.lhs.false, %land.lhs.true10
  %20 = load i8**, i8*** @argv, align 4
  %21 = load i32, i32* @pos, align 4
  %add24 = add nsw i32 %21, 1
  %arrayidx25 = getelementptr inbounds i8*, i8** %20, i32 %add24
  %22 = load i8*, i8** %arrayidx25, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %22, i32 1
  %23 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %23 to i32
  %cmp28 = icmp eq i32 %conv27, 97
  br i1 %cmp28, label %if.then30, label %if.else42

if.then30:                                        ; preds = %if.then23
  %24 = load i8**, i8*** @argv, align 4
  %25 = load i32, i32* @pos, align 4
  %arrayidx31 = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx31, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %26, i32 0
  %27 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %27 to i32
  %cmp34 = icmp ne i32 %conv33, 0
  br i1 %cmp34, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then30
  %28 = load i8**, i8*** @argv, align 4
  %29 = load i32, i32* @pos, align 4
  %add36 = add nsw i32 %29, 2
  %arrayidx37 = getelementptr inbounds i8*, i8** %28, i32 %add36
  %30 = load i8*, i8** %arrayidx37, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %30, i32 0
  %31 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %31 to i32
  %cmp40 = icmp ne i32 %conv39, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then30
  %32 = phi i1 [ false, %if.then30 ], [ %cmp40, %land.rhs ]
  %land.ext = zext i1 %32 to i32
  store i32 %land.ext, i32* %value, align 4
  br label %if.end

if.else42:                                        ; preds = %if.then23
  %33 = load i8**, i8*** @argv, align 4
  %34 = load i32, i32* @pos, align 4
  %arrayidx43 = getelementptr inbounds i8*, i8** %33, i32 %34
  %35 = load i8*, i8** %arrayidx43, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %35, i32 0
  %36 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %36 to i32
  %cmp46 = icmp ne i32 %conv45, 0
  br i1 %cmp46, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.else42
  %37 = load i8**, i8*** @argv, align 4
  %38 = load i32, i32* @pos, align 4
  %add48 = add nsw i32 %38, 2
  %arrayidx49 = getelementptr inbounds i8*, i8** %37, i32 %add48
  %39 = load i8*, i8** %arrayidx49, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %40 to i32
  %cmp52 = icmp ne i32 %conv51, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.else42
  %41 = phi i1 [ true, %if.else42 ], [ %cmp52, %lor.rhs ]
  %lor.ext = zext i1 %41 to i32
  store i32 %lor.ext, i32* %value, align 4
  br label %if.end

if.end:                                           ; preds = %lor.end, %land.end
  %42 = load i32, i32* @argc, align 4
  store i32 %42, i32* @pos, align 4
  br label %if.end99

if.else54:                                        ; preds = %lor.lhs.false, %land.lhs.true, %if.else
  %43 = load i8**, i8*** @argv, align 4
  %44 = load i32, i32* @pos, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %43, i32 %44
  %45 = load i8*, i8** %arrayidx55, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %45, i32 0
  %46 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %46 to i32
  %cmp58 = icmp eq i32 %conv57, 33
  br i1 %cmp58, label %land.lhs.true60, label %if.else73

land.lhs.true60:                                  ; preds = %if.else54
  %47 = load i8**, i8*** @argv, align 4
  %48 = load i32, i32* @pos, align 4
  %arrayidx61 = getelementptr inbounds i8*, i8** %47, i32 %48
  %49 = load i8*, i8** %arrayidx61, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %49, i32 1
  %50 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %50 to i32
  %cmp64 = icmp eq i32 %conv63, 0
  br i1 %cmp64, label %if.then66, label %if.else73

if.then66:                                        ; preds = %land.lhs.true60
  br label %do.body

do.body:                                          ; preds = %if.then66
  %51 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %51, 1
  store i32 %inc, i32* @pos, align 4
  %52 = load i32, i32* @pos, align 4
  %53 = load i32, i32* @argc, align 4
  %cmp67 = icmp sge i32 %52, %53
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %do.body
  call void @beyond() #6
  unreachable

if.end70:                                         ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end70
  %call71 = call i32 @two_arguments()
  %tobool72 = icmp ne i32 %call71, 0
  %lnot = xor i1 %tobool72, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %value, align 4
  br label %if.end98

if.else73:                                        ; preds = %land.lhs.true60, %if.else54
  %54 = load i8**, i8*** @argv, align 4
  %55 = load i32, i32* @pos, align 4
  %arrayidx74 = getelementptr inbounds i8*, i8** %54, i32 %55
  %56 = load i8*, i8** %arrayidx74, align 4
  %arrayidx75 = getelementptr inbounds i8, i8* %56, i32 0
  %57 = load i8, i8* %arrayidx75, align 1
  %conv76 = sext i8 %57 to i32
  %cmp77 = icmp eq i32 %conv76, 40
  br i1 %cmp77, label %land.lhs.true79, label %if.else93

land.lhs.true79:                                  ; preds = %if.else73
  %58 = load i8**, i8*** @argv, align 4
  %59 = load i32, i32* @pos, align 4
  %add80 = add nsw i32 %59, 2
  %arrayidx81 = getelementptr inbounds i8*, i8** %58, i32 %add80
  %60 = load i8*, i8** %arrayidx81, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %61 to i32
  %cmp84 = icmp eq i32 %conv83, 41
  br i1 %cmp84, label %if.then86, label %if.else93

if.then86:                                        ; preds = %land.lhs.true79
  %62 = load i8**, i8*** @argv, align 4
  %63 = load i32, i32* @pos, align 4
  %add87 = add nsw i32 %63, 1
  %arrayidx88 = getelementptr inbounds i8*, i8** %62, i32 %add87
  %64 = load i8*, i8** %arrayidx88, align 4
  %arrayidx89 = getelementptr inbounds i8, i8* %64, i32 0
  %65 = load i8, i8* %arrayidx89, align 1
  %conv90 = sext i8 %65 to i32
  %cmp91 = icmp ne i32 %conv90, 0
  %conv92 = zext i1 %cmp91 to i32
  store i32 %conv92, i32* %value, align 4
  %66 = load i32, i32* @argc, align 4
  store i32 %66, i32* @pos, align 4
  br label %if.end97

if.else93:                                        ; preds = %land.lhs.true79, %if.else73
  %call94 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i32 0, i32 0))
  %67 = load i8**, i8*** @argv, align 4
  %68 = load i32, i32* @pos, align 4
  %add95 = add nsw i32 %68, 1
  %arrayidx96 = getelementptr inbounds i8*, i8** %67, i32 %add95
  %69 = load i8*, i8** %arrayidx96, align 4
  call void @test_syntax_error(i8* %call94, i8* %69) #6
  unreachable

if.end97:                                         ; preds = %if.then86
  br label %if.end98

if.end98:                                         ; preds = %if.end97, %do.end
  br label %if.end99

if.end99:                                         ; preds = %if.end98, %if.end
  br label %if.end100

if.end100:                                        ; preds = %if.end99, %if.then
  %70 = load i32, i32* %value, align 4
  ret i32 %70
}

; Function Attrs: noinline noreturn nounwind
define internal void @beyond() #3 {
entry:
  %call = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i32 0, i32 0))
  call void @test_syntax_error(i8* %call, i8* null) #6
  unreachable

return:                                           ; No predecessors!
  ret void
}

; Function Attrs: noinline nounwind
define internal i32 @expr() #0 {
entry:
  %0 = load i32, i32* @pos, align 4
  %1 = load i32, i32* @argc, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @beyond() #6
  unreachable

if.end:                                           ; preds = %entry
  %call = call i32 @or()
  %xor = xor i32 0, %call
  ret i32 %xor
}

; Function Attrs: noinline nounwind
define internal i32 @unary_operator() #0 {
entry:
  %retval = alloca i32, align 4
  %op = alloca i8*, align 4
  %r = alloca i64, align 8
  %0 = load i8**, i8*** @argv, align 4
  %1 = load i32, i32* @pos, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %1
  %2 = load i8*, i8** %arrayidx, align 4
  store i8* %2, i8** %op, align 4
  %3 = load i8*, i8** %op, align 4
  %call = call i32 @test_unop(i8* %3)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %op, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 1
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 116
  br i1 %cmp2, label %if.then4, label %if.end18

if.then4:                                         ; preds = %if.end
  br label %do.body

do.body:                                          ; preds = %if.then4
  %6 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* @pos, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %7 = load i32, i32* @pos, align 4
  %8 = load i32, i32* @argc, align 4
  %cmp5 = icmp slt i32 %7, %8
  br i1 %cmp5, label %if.then7, label %if.else16

if.then7:                                         ; preds = %do.end
  %9 = load i8**, i8*** @argv, align 4
  %10 = load i32, i32* @pos, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %9, i32 %10
  %11 = load i8*, i8** %arrayidx8, align 4
  %call9 = call i32 @legal_number(i8* %11, i64* %r)
  %tobool = icmp ne i32 %call9, 0
  br i1 %tobool, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.then7
  br label %do.body11

do.body11:                                        ; preds = %if.then10
  %12 = load i32, i32* @pos, align 4
  %inc12 = add nsw i32 %12, 1
  store i32 %inc12, i32* @pos, align 4
  br label %do.end13

do.end13:                                         ; preds = %do.body11
  %13 = load i8*, i8** %op, align 4
  %14 = load i8**, i8*** @argv, align 4
  %15 = load i32, i32* @pos, align 4
  %sub = sub nsw i32 %15, 1
  %arrayidx14 = getelementptr inbounds i8*, i8** %14, i32 %sub
  %16 = load i8*, i8** %arrayidx14, align 4
  %call15 = call i32 @unary_test(i8* %13, i8* %16)
  store i32 %call15, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %if.then7
  store i32 0, i32* %retval, align 4
  br label %return

if.else16:                                        ; preds = %do.end
  %17 = load i8*, i8** %op, align 4
  %call17 = call i32 @unary_test(i8* %17, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store i32 %call17, i32* %retval, align 4
  br label %return

if.end18:                                         ; preds = %if.end
  br label %do.body19

do.body19:                                        ; preds = %if.end18
  br label %do.body20

do.body20:                                        ; preds = %do.body19
  %18 = load i32, i32* @pos, align 4
  %inc21 = add nsw i32 %18, 1
  store i32 %inc21, i32* @pos, align 4
  %19 = load i32, i32* @pos, align 4
  %20 = load i32, i32* @argc, align 4
  %cmp22 = icmp sge i32 %19, %20
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %do.body20
  call void @beyond() #6
  unreachable

if.end25:                                         ; preds = %do.body20
  br label %do.end26

do.end26:                                         ; preds = %if.end25
  %21 = load i32, i32* @pos, align 4
  %inc27 = add nsw i32 %21, 1
  store i32 %inc27, i32* @pos, align 4
  br label %do.end28

do.end28:                                         ; preds = %do.end26
  %22 = load i8*, i8** %op, align 4
  %23 = load i8**, i8*** @argv, align 4
  %24 = load i32, i32* @pos, align 4
  %sub29 = sub nsw i32 %24, 1
  %arrayidx30 = getelementptr inbounds i8*, i8** %23, i32 %sub29
  %25 = load i8*, i8** %arrayidx30, align 4
  %call31 = call i32 @unary_test(i8* %22, i8* %25)
  store i32 %call31, i32* %retval, align 4
  br label %return

return:                                           ; preds = %do.end28, %if.else16, %if.else, %do.end13, %if.then
  %26 = load i32, i32* %retval, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind
define internal i32 @binary_operator() #0 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %w = alloca i8*, align 4
  %0 = load i8**, i8*** @argv, align 4
  %1 = load i32, i32* @pos, align 4
  %add = add nsw i32 %1, 1
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 %add
  %2 = load i8*, i8** %arrayidx, align 4
  store i8* %2, i8** %w, align 4
  %3 = load i8*, i8** %w, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv, 61
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false16

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %w, align 4
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i32 1
  %6 = load i8, i8* %arrayidx3, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %7 = load i8*, i8** %w, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %8 to i32
  %cmp9 = icmp eq i32 %conv8, 61
  br i1 %cmp9, label %land.lhs.true11, label %lor.lhs.false16

land.lhs.true11:                                  ; preds = %lor.lhs.false
  %9 = load i8*, i8** %w, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %9, i32 2
  %10 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %10 to i32
  %cmp14 = icmp eq i32 %conv13, 0
  br i1 %cmp14, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %land.lhs.true11, %lor.lhs.false, %entry
  %11 = load i8*, i8** %w, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %12 to i32
  %cmp19 = icmp eq i32 %conv18, 62
  br i1 %cmp19, label %land.lhs.true26, label %lor.lhs.false21

lor.lhs.false21:                                  ; preds = %lor.lhs.false16
  %13 = load i8*, i8** %w, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %14 to i32
  %cmp24 = icmp eq i32 %conv23, 60
  br i1 %cmp24, label %land.lhs.true26, label %lor.lhs.false31

land.lhs.true26:                                  ; preds = %lor.lhs.false21, %lor.lhs.false16
  %15 = load i8*, i8** %w, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %15, i32 1
  %16 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %16 to i32
  %cmp29 = icmp eq i32 %conv28, 0
  br i1 %cmp29, label %if.then, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %land.lhs.true26, %lor.lhs.false21
  %17 = load i8*, i8** %w, align 4
  %arrayidx32 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx32, align 1
  %conv33 = sext i8 %18 to i32
  %cmp34 = icmp eq i32 %conv33, 33
  br i1 %cmp34, label %land.lhs.true36, label %if.end

land.lhs.true36:                                  ; preds = %lor.lhs.false31
  %19 = load i8*, i8** %w, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %19, i32 1
  %20 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %20 to i32
  %cmp39 = icmp eq i32 %conv38, 61
  br i1 %cmp39, label %land.lhs.true41, label %if.end

land.lhs.true41:                                  ; preds = %land.lhs.true36
  %21 = load i8*, i8** %w, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %21, i32 2
  %22 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %22 to i32
  %cmp44 = icmp eq i32 %conv43, 0
  br i1 %cmp44, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true41, %land.lhs.true26, %land.lhs.true11, %land.lhs.true
  %23 = load i8*, i8** %w, align 4
  %24 = load i8**, i8*** @argv, align 4
  %25 = load i32, i32* @pos, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx46, align 4
  %27 = load i8**, i8*** @argv, align 4
  %28 = load i32, i32* @pos, align 4
  %add47 = add nsw i32 %28, 2
  %arrayidx48 = getelementptr inbounds i8*, i8** %27, i32 %add47
  %29 = load i8*, i8** %arrayidx48, align 4
  %call = call i32 @binary_test(i8* %23, i8* %26, i8* %29, i32 0)
  store i32 %call, i32* %value, align 4
  %30 = load i32, i32* @pos, align 4
  %add49 = add nsw i32 %30, 3
  store i32 %add49, i32* @pos, align 4
  %31 = load i32, i32* %value, align 4
  store i32 %31, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true41, %land.lhs.true36, %lor.lhs.false31
  %32 = load i8*, i8** %w, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %32, i32 0
  %33 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %33 to i32
  %cmp52 = icmp ne i32 %conv51, 45
  br i1 %cmp52, label %if.then63, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %if.end
  %34 = load i8*, i8** %w, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %34, i32 3
  %35 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %35 to i32
  %cmp57 = icmp ne i32 %conv56, 0
  br i1 %cmp57, label %if.then63, label %lor.lhs.false59

lor.lhs.false59:                                  ; preds = %lor.lhs.false54
  %36 = load i8*, i8** %w, align 4
  %call60 = call i32 @test_binop(i8* %36)
  %cmp61 = icmp eq i32 %call60, 0
  br i1 %cmp61, label %if.then63, label %if.end65

if.then63:                                        ; preds = %lor.lhs.false59, %lor.lhs.false54, %if.end
  %call64 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.6, i32 0, i32 0))
  %37 = load i8*, i8** %w, align 4
  call void @test_syntax_error(i8* %call64, i8* %37) #6
  unreachable

if.end65:                                         ; preds = %lor.lhs.false59
  %38 = load i8*, i8** %w, align 4
  %39 = load i8**, i8*** @argv, align 4
  %40 = load i32, i32* @pos, align 4
  %arrayidx66 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx66, align 4
  %42 = load i8**, i8*** @argv, align 4
  %43 = load i32, i32* @pos, align 4
  %add67 = add nsw i32 %43, 2
  %arrayidx68 = getelementptr inbounds i8*, i8** %42, i32 %add67
  %44 = load i8*, i8** %arrayidx68, align 4
  %call69 = call i32 @binary_test(i8* %38, i8* %41, i8* %44, i32 0)
  store i32 %call69, i32* %value, align 4
  %45 = load i32, i32* @pos, align 4
  %add70 = add nsw i32 %45, 3
  store i32 %add70, i32* @pos, align 4
  %46 = load i32, i32* %value, align 4
  store i32 %46, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end65, %if.then
  %47 = load i32, i32* %retval, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind
define internal i32 @or() #0 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %v2 = alloca i32, align 4
  %call = call i32 @and()
  store i32 %call, i32* %value, align 4
  %0 = load i32, i32* @pos, align 4
  %1 = load i32, i32* @argc, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8**, i8*** @argv, align 4
  %3 = load i32, i32* @pos, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br i1 %cmp2, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load i8**, i8*** @argv, align 4
  %7 = load i32, i32* @pos, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp eq i32 %conv7, 111
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %land.lhs.true4
  %10 = load i8**, i8*** @argv, align 4
  %11 = load i32, i32* @pos, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %12, i32 2
  %13 = load i8, i8* %arrayidx12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true10
  br label %do.body

do.body:                                          ; preds = %if.then
  %14 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @pos, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %call13 = call i32 @or()
  store i32 %call13, i32* %v2, align 4
  %15 = load i32, i32* %value, align 4
  %tobool14 = icmp ne i32 %15, 0
  br i1 %tobool14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %do.end
  %16 = load i32, i32* %v2, align 4
  %tobool15 = icmp ne i32 %16, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %do.end
  %17 = phi i1 [ true, %do.end ], [ %tobool15, %lor.rhs ]
  %lor.ext = zext i1 %17 to i32
  store i32 %lor.ext, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true10, %land.lhs.true4, %land.lhs.true, %entry
  %18 = load i32, i32* %value, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %lor.end
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define internal i32 @and() #0 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %v2 = alloca i32, align 4
  %call = call i32 @term()
  store i32 %call, i32* %value, align 4
  %0 = load i32, i32* @pos, align 4
  %1 = load i32, i32* @argc, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8**, i8*** @argv, align 4
  %3 = load i32, i32* @pos, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br i1 %cmp2, label %land.lhs.true4, label %if.end

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load i8**, i8*** @argv, align 4
  %7 = load i32, i32* @pos, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %9 to i32
  %cmp8 = icmp eq i32 %conv7, 97
  br i1 %cmp8, label %land.lhs.true10, label %if.end

land.lhs.true10:                                  ; preds = %land.lhs.true4
  %10 = load i8**, i8*** @argv, align 4
  %11 = load i32, i32* @pos, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx11, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %12, i32 2
  %13 = load i8, i8* %arrayidx12, align 1
  %tobool = icmp ne i8 %13, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true10
  br label %do.body

do.body:                                          ; preds = %if.then
  %14 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* @pos, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  %call13 = call i32 @and()
  store i32 %call13, i32* %v2, align 4
  %15 = load i32, i32* %value, align 4
  %tobool14 = icmp ne i32 %15, 0
  br i1 %tobool14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %do.end
  %16 = load i32, i32* %v2, align 4
  %tobool15 = icmp ne i32 %16, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.end
  %17 = phi i1 [ false, %do.end ], [ %tobool15, %land.rhs ]
  %land.ext = zext i1 %17 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true10, %land.lhs.true4, %land.lhs.true, %entry
  %18 = load i32, i32* %value, align 4
  store i32 %18, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %land.end
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define internal i32 @term() #0 {
entry:
  %retval = alloca i32, align 4
  %value = alloca i32, align 4
  %0 = load i32, i32* @pos, align 4
  %1 = load i32, i32* @argc, align 4
  %cmp = icmp sge i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @beyond() #6
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8**, i8*** @argv, align 4
  %3 = load i32, i32* @pos, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 33
  br i1 %cmp2, label %land.lhs.true, label %if.end29

land.lhs.true:                                    ; preds = %if.end
  %6 = load i8**, i8*** @argv, align 4
  %7 = load i32, i32* @pos, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i32 %7
  %8 = load i8*, i8** %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i32 1
  %9 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %9 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.end29

if.then9:                                         ; preds = %land.lhs.true
  store i32 0, i32* %value, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %if.then9
  %10 = load i32, i32* @pos, align 4
  %11 = load i32, i32* @argc, align 4
  %cmp10 = icmp slt i32 %10, %11
  br i1 %cmp10, label %land.lhs.true12, label %land.end

land.lhs.true12:                                  ; preds = %while.cond
  %12 = load i8**, i8*** @argv, align 4
  %13 = load i32, i32* @pos, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %12, i32 %13
  %14 = load i8*, i8** %arrayidx13, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %14, i32 0
  %15 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %15 to i32
  %cmp16 = icmp eq i32 %conv15, 33
  br i1 %cmp16, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true12
  %16 = load i8**, i8*** @argv, align 4
  %17 = load i32, i32* @pos, align 4
  %arrayidx18 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx18, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx19, align 1
  %conv20 = sext i8 %19 to i32
  %cmp21 = icmp eq i32 %conv20, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true12, %while.cond
  %20 = phi i1 [ false, %land.lhs.true12 ], [ false, %while.cond ], [ %cmp21, %land.rhs ]
  br i1 %20, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  br label %do.body

do.body:                                          ; preds = %while.body
  %21 = load i32, i32* @pos, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* @pos, align 4
  %22 = load i32, i32* @pos, align 4
  %23 = load i32, i32* @argc, align 4
  %cmp23 = icmp sge i32 %22, %23
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %do.body
  call void @beyond() #6
  unreachable

if.end26:                                         ; preds = %do.body
  br label %do.end

do.end:                                           ; preds = %if.end26
  %24 = load i32, i32* %value, align 4
  %sub = sub nsw i32 1, %24
  store i32 %sub, i32* %value, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %25 = load i32, i32* %value, align 4
  %tobool = icmp ne i32 %25, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.end
  %call = call i32 @term()
  %tobool27 = icmp ne i32 %call, 0
  %lnot = xor i1 %tobool27, true
  %lnot.ext = zext i1 %lnot to i32
  br label %cond.end

cond.false:                                       ; preds = %while.end
  %call28 = call i32 @term()
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %lnot.ext, %cond.true ], [ %call28, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end29:                                         ; preds = %land.lhs.true, %if.end
  %26 = load i8**, i8*** @argv, align 4
  %27 = load i32, i32* @pos, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %26, i32 %27
  %28 = load i8*, i8** %arrayidx30, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %28, i32 0
  %29 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %29 to i32
  %cmp33 = icmp eq i32 %conv32, 40
  br i1 %cmp33, label %land.lhs.true35, label %if.end72

land.lhs.true35:                                  ; preds = %if.end29
  %30 = load i8**, i8*** @argv, align 4
  %31 = load i32, i32* @pos, align 4
  %arrayidx36 = getelementptr inbounds i8*, i8** %30, i32 %31
  %32 = load i8*, i8** %arrayidx36, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %32, i32 1
  %33 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %33 to i32
  %cmp39 = icmp eq i32 %conv38, 0
  br i1 %cmp39, label %if.then41, label %if.end72

if.then41:                                        ; preds = %land.lhs.true35
  br label %do.body42

do.body42:                                        ; preds = %if.then41
  %34 = load i32, i32* @pos, align 4
  %inc43 = add nsw i32 %34, 1
  store i32 %inc43, i32* @pos, align 4
  %35 = load i32, i32* @pos, align 4
  %36 = load i32, i32* @argc, align 4
  %cmp44 = icmp sge i32 %35, %36
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %do.body42
  call void @beyond() #6
  unreachable

if.end47:                                         ; preds = %do.body42
  br label %do.end48

do.end48:                                         ; preds = %if.end47
  %call49 = call i32 @expr()
  store i32 %call49, i32* %value, align 4
  %37 = load i8**, i8*** @argv, align 4
  %38 = load i32, i32* @pos, align 4
  %arrayidx50 = getelementptr inbounds i8*, i8** %37, i32 %38
  %39 = load i8*, i8** %arrayidx50, align 4
  %cmp51 = icmp eq i8* %39, null
  br i1 %cmp51, label %if.then53, label %if.else

if.then53:                                        ; preds = %do.end48
  %call54 = call i8* @libintl_gettext(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.8, i32 0, i32 0))
  call void @test_syntax_error(i8* %call54, i8* null) #6
  unreachable

if.else:                                          ; preds = %do.end48
  %40 = load i8**, i8*** @argv, align 4
  %41 = load i32, i32* @pos, align 4
  %arrayidx55 = getelementptr inbounds i8*, i8** %40, i32 %41
  %42 = load i8*, i8** %arrayidx55, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %42, i32 0
  %43 = load i8, i8* %arrayidx56, align 1
  %conv57 = sext i8 %43 to i32
  %cmp58 = icmp ne i32 %conv57, 41
  br i1 %cmp58, label %if.then64, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %44 = load i8**, i8*** @argv, align 4
  %45 = load i32, i32* @pos, align 4
  %arrayidx60 = getelementptr inbounds i8*, i8** %44, i32 %45
  %46 = load i8*, i8** %arrayidx60, align 4
  %arrayidx61 = getelementptr inbounds i8, i8* %46, i32 1
  %47 = load i8, i8* %arrayidx61, align 1
  %conv62 = sext i8 %47 to i32
  %tobool63 = icmp ne i32 %conv62, 0
  br i1 %tobool63, label %if.then64, label %if.end67

if.then64:                                        ; preds = %lor.lhs.false, %if.else
  %call65 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i32 0, i32 0))
  %48 = load i8**, i8*** @argv, align 4
  %49 = load i32, i32* @pos, align 4
  %arrayidx66 = getelementptr inbounds i8*, i8** %48, i32 %49
  %50 = load i8*, i8** %arrayidx66, align 4
  call void @test_syntax_error(i8* %call65, i8* %50) #6
  unreachable

if.end67:                                         ; preds = %lor.lhs.false
  br label %if.end68

if.end68:                                         ; preds = %if.end67
  br label %do.body69

do.body69:                                        ; preds = %if.end68
  %51 = load i32, i32* @pos, align 4
  %inc70 = add nsw i32 %51, 1
  store i32 %inc70, i32* @pos, align 4
  br label %do.end71

do.end71:                                         ; preds = %do.body69
  %52 = load i32, i32* %value, align 4
  store i32 %52, i32* %retval, align 4
  br label %return

if.end72:                                         ; preds = %land.lhs.true35, %if.end29
  %53 = load i32, i32* @pos, align 4
  %add = add nsw i32 %53, 3
  %54 = load i32, i32* @argc, align 4
  %cmp73 = icmp sle i32 %add, %54
  br i1 %cmp73, label %land.lhs.true75, label %if.else82

land.lhs.true75:                                  ; preds = %if.end72
  %55 = load i8**, i8*** @argv, align 4
  %56 = load i32, i32* @pos, align 4
  %add76 = add nsw i32 %56, 1
  %arrayidx77 = getelementptr inbounds i8*, i8** %55, i32 %add76
  %57 = load i8*, i8** %arrayidx77, align 4
  %call78 = call i32 @test_binop(i8* %57)
  %tobool79 = icmp ne i32 %call78, 0
  br i1 %tobool79, label %if.then80, label %if.else82

if.then80:                                        ; preds = %land.lhs.true75
  %call81 = call i32 @binary_operator()
  store i32 %call81, i32* %value, align 4
  br label %if.end114

if.else82:                                        ; preds = %land.lhs.true75, %if.end72
  %58 = load i8**, i8*** @argv, align 4
  %59 = load i32, i32* @pos, align 4
  %arrayidx83 = getelementptr inbounds i8*, i8** %58, i32 %59
  %60 = load i8*, i8** %arrayidx83, align 4
  %arrayidx84 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx84, align 1
  %conv85 = sext i8 %61 to i32
  %cmp86 = icmp eq i32 %conv85, 45
  br i1 %cmp86, label %land.lhs.true88, label %if.else104

land.lhs.true88:                                  ; preds = %if.else82
  %62 = load i8**, i8*** @argv, align 4
  %63 = load i32, i32* @pos, align 4
  %arrayidx89 = getelementptr inbounds i8*, i8** %62, i32 %63
  %64 = load i8*, i8** %arrayidx89, align 4
  %arrayidx90 = getelementptr inbounds i8, i8* %64, i32 2
  %65 = load i8, i8* %arrayidx90, align 1
  %conv91 = sext i8 %65 to i32
  %cmp92 = icmp eq i32 %conv91, 0
  br i1 %cmp92, label %if.then94, label %if.else104

if.then94:                                        ; preds = %land.lhs.true88
  %66 = load i8**, i8*** @argv, align 4
  %67 = load i32, i32* @pos, align 4
  %arrayidx95 = getelementptr inbounds i8*, i8** %66, i32 %67
  %68 = load i8*, i8** %arrayidx95, align 4
  %call96 = call i32 @test_unop(i8* %68)
  %tobool97 = icmp ne i32 %call96, 0
  br i1 %tobool97, label %if.then98, label %if.else100

if.then98:                                        ; preds = %if.then94
  %call99 = call i32 @unary_operator()
  store i32 %call99, i32* %value, align 4
  br label %if.end103

if.else100:                                       ; preds = %if.then94
  %call101 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.4, i32 0, i32 0))
  %69 = load i8**, i8*** @argv, align 4
  %70 = load i32, i32* @pos, align 4
  %arrayidx102 = getelementptr inbounds i8*, i8** %69, i32 %70
  %71 = load i8*, i8** %arrayidx102, align 4
  call void @test_syntax_error(i8* %call101, i8* %71) #6
  unreachable

if.end103:                                        ; preds = %if.then98
  br label %if.end113

if.else104:                                       ; preds = %land.lhs.true88, %if.else82
  %72 = load i8**, i8*** @argv, align 4
  %73 = load i32, i32* @pos, align 4
  %arrayidx105 = getelementptr inbounds i8*, i8** %72, i32 %73
  %74 = load i8*, i8** %arrayidx105, align 4
  %arrayidx106 = getelementptr inbounds i8, i8* %74, i32 0
  %75 = load i8, i8* %arrayidx106, align 1
  %conv107 = sext i8 %75 to i32
  %cmp108 = icmp ne i32 %conv107, 0
  %conv109 = zext i1 %cmp108 to i32
  store i32 %conv109, i32* %value, align 4
  br label %do.body110

do.body110:                                       ; preds = %if.else104
  %76 = load i32, i32* @pos, align 4
  %inc111 = add nsw i32 %76, 1
  store i32 %inc111, i32* @pos, align 4
  br label %do.end112

do.end112:                                        ; preds = %do.body110
  br label %if.end113

if.end113:                                        ; preds = %do.end112, %if.end103
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %if.then80
  %77 = load i32, i32* %value, align 4
  store i32 %77, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end114, %do.end71, %cond.end
  %78 = load i32, i32* %retval, align 4
  ret i32 %78
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { noreturn }
attributes #7 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
