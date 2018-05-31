; ModuleID = 'explodename.c'
source_filename = "explodename.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

; Function Attrs: noinline nounwind
define i8* @_nl_find_language(i8* %name) #0 {
entry:
  %name.addr = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %2 = load i8*, i8** %name.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp ne i32 %conv3, 95
  br i1 %cmp4, label %land.lhs.true6, label %land.end

land.lhs.true6:                                   ; preds = %land.lhs.true
  %4 = load i8*, i8** %name.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %5 to i32
  %cmp9 = icmp ne i32 %conv8, 64
  br i1 %cmp9, label %land.lhs.true11, label %land.end

land.lhs.true11:                                  ; preds = %land.lhs.true6
  %6 = load i8*, i8** %name.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %7 to i32
  %cmp14 = icmp ne i32 %conv13, 43
  br i1 %cmp14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true11
  %8 = load i8*, i8** %name.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %8, i32 0
  %9 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %9 to i32
  %cmp18 = icmp ne i32 %conv17, 44
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true11, %land.lhs.true6, %land.lhs.true, %while.cond
  %10 = phi i1 [ false, %land.lhs.true11 ], [ false, %land.lhs.true6 ], [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp18, %land.rhs ]
  br i1 %10, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %11 = load i8*, i8** %name.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %name.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %12 = load i8*, i8** %name.addr, align 4
  ret i8* %12
}

; Function Attrs: noinline nounwind
define i32 @_nl_explode_name(i8* %name, i8** %language, i8** %modifier, i8** %territory, i8** %codeset, i8** %normalized_codeset, i8** %special, i8** %sponsor, i8** %revision) #0 {
entry:
  %name.addr = alloca i8*, align 4
  %language.addr = alloca i8**, align 4
  %modifier.addr = alloca i8**, align 4
  %territory.addr = alloca i8**, align 4
  %codeset.addr = alloca i8**, align 4
  %normalized_codeset.addr = alloca i8**, align 4
  %special.addr = alloca i8**, align 4
  %sponsor.addr = alloca i8**, align 4
  %revision.addr = alloca i8**, align 4
  %syntax = alloca i32, align 4
  %cp = alloca i8*, align 4
  %mask = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8** %language, i8*** %language.addr, align 4
  store i8** %modifier, i8*** %modifier.addr, align 4
  store i8** %territory, i8*** %territory.addr, align 4
  store i8** %codeset, i8*** %codeset.addr, align 4
  store i8** %normalized_codeset, i8*** %normalized_codeset.addr, align 4
  store i8** %special, i8*** %special.addr, align 4
  store i8** %sponsor, i8*** %sponsor.addr, align 4
  store i8** %revision, i8*** %revision.addr, align 4
  %0 = load i8**, i8*** %modifier.addr, align 4
  store i8* null, i8** %0, align 4
  %1 = load i8**, i8*** %territory.addr, align 4
  store i8* null, i8** %1, align 4
  %2 = load i8**, i8*** %codeset.addr, align 4
  store i8* null, i8** %2, align 4
  %3 = load i8**, i8*** %normalized_codeset.addr, align 4
  store i8* null, i8** %3, align 4
  %4 = load i8**, i8*** %special.addr, align 4
  store i8* null, i8** %4, align 4
  %5 = load i8**, i8*** %sponsor.addr, align 4
  store i8* null, i8** %5, align 4
  %6 = load i8**, i8*** %revision.addr, align 4
  store i8* null, i8** %6, align 4
  store i32 0, i32* %mask, align 4
  store i32 0, i32* %syntax, align 4
  %7 = load i8*, i8** %name.addr, align 4
  store i8* %7, i8** %cp, align 4
  %8 = load i8**, i8*** %language.addr, align 4
  store i8* %7, i8** %8, align 4
  %9 = load i8**, i8*** %language.addr, align 4
  %10 = load i8*, i8** %9, align 4
  %call = call i8* @_nl_find_language(i8* %10)
  store i8* %call, i8** %cp, align 4
  %11 = load i8**, i8*** %language.addr, align 4
  %12 = load i8*, i8** %11, align 4
  %13 = load i8*, i8** %cp, align 4
  %cmp = icmp eq i8* %12, %13
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %14 = load i8**, i8*** %language.addr, align 4
  %15 = load i8*, i8** %14, align 4
  %call1 = call i8* @strchr(i8* %15, i32 0)
  store i8* %call1, i8** %cp, align 4
  br label %if.end74

if.else:                                          ; preds = %entry
  %16 = load i8*, i8** %cp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %17 to i32
  %cmp2 = icmp eq i32 %conv, 95
  br i1 %cmp2, label %if.then4, label %if.end73

if.then4:                                         ; preds = %if.else
  %18 = load i8*, i8** %cp, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %18, i32 0
  store i8 0, i8* %arrayidx5, align 1
  %19 = load i8*, i8** %cp, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr, i8** %cp, align 4
  %20 = load i8**, i8*** %territory.addr, align 4
  store i8* %incdec.ptr, i8** %20, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then4
  %21 = load i8*, i8** %cp, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %22 to i32
  %cmp8 = icmp ne i32 %conv7, 0
  br i1 %cmp8, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %23 = load i8*, i8** %cp, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx10, align 1
  %conv11 = sext i8 %24 to i32
  %cmp12 = icmp ne i32 %conv11, 46
  br i1 %cmp12, label %land.lhs.true14, label %land.end

land.lhs.true14:                                  ; preds = %land.lhs.true
  %25 = load i8*, i8** %cp, align 4
  %arrayidx15 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx15, align 1
  %conv16 = sext i8 %26 to i32
  %cmp17 = icmp ne i32 %conv16, 64
  br i1 %cmp17, label %land.lhs.true19, label %land.end

land.lhs.true19:                                  ; preds = %land.lhs.true14
  %27 = load i8*, i8** %cp, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %27, i32 0
  %28 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %28 to i32
  %cmp22 = icmp ne i32 %conv21, 43
  br i1 %cmp22, label %land.lhs.true24, label %land.end

land.lhs.true24:                                  ; preds = %land.lhs.true19
  %29 = load i8*, i8** %cp, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %29, i32 0
  %30 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %30 to i32
  %cmp27 = icmp ne i32 %conv26, 44
  br i1 %cmp27, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true24
  %31 = load i8*, i8** %cp, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %31, i32 0
  %32 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %32 to i32
  %cmp31 = icmp ne i32 %conv30, 95
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true24, %land.lhs.true19, %land.lhs.true14, %land.lhs.true, %while.cond
  %33 = phi i1 [ false, %land.lhs.true24 ], [ false, %land.lhs.true19 ], [ false, %land.lhs.true14 ], [ false, %land.lhs.true ], [ false, %while.cond ], [ %cmp31, %land.rhs ]
  br i1 %33, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %34 = load i8*, i8** %cp, align 4
  %incdec.ptr33 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr33, i8** %cp, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %35 = load i32, i32* %mask, align 4
  %or = or i32 %35, 32
  store i32 %or, i32* %mask, align 4
  %36 = load i8*, i8** %cp, align 4
  %arrayidx34 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx34, align 1
  %conv35 = sext i8 %37 to i32
  %cmp36 = icmp eq i32 %conv35, 46
  br i1 %cmp36, label %if.then38, label %if.end72

if.then38:                                        ; preds = %while.end
  store i32 1, i32* %syntax, align 4
  %38 = load i8*, i8** %cp, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %38, i32 0
  store i8 0, i8* %arrayidx39, align 1
  %39 = load i8*, i8** %cp, align 4
  %incdec.ptr40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %incdec.ptr40, i8** %cp, align 4
  %40 = load i8**, i8*** %codeset.addr, align 4
  store i8* %incdec.ptr40, i8** %40, align 4
  br label %while.cond41

while.cond41:                                     ; preds = %while.body52, %if.then38
  %41 = load i8*, i8** %cp, align 4
  %arrayidx42 = getelementptr inbounds i8, i8* %41, i32 0
  %42 = load i8, i8* %arrayidx42, align 1
  %conv43 = sext i8 %42 to i32
  %cmp44 = icmp ne i32 %conv43, 0
  br i1 %cmp44, label %land.rhs46, label %land.end51

land.rhs46:                                       ; preds = %while.cond41
  %43 = load i8*, i8** %cp, align 4
  %arrayidx47 = getelementptr inbounds i8, i8* %43, i32 0
  %44 = load i8, i8* %arrayidx47, align 1
  %conv48 = sext i8 %44 to i32
  %cmp49 = icmp ne i32 %conv48, 64
  br label %land.end51

land.end51:                                       ; preds = %land.rhs46, %while.cond41
  %45 = phi i1 [ false, %while.cond41 ], [ %cmp49, %land.rhs46 ]
  br i1 %45, label %while.body52, label %while.end54

while.body52:                                     ; preds = %land.end51
  %46 = load i8*, i8** %cp, align 4
  %incdec.ptr53 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr53, i8** %cp, align 4
  br label %while.cond41

while.end54:                                      ; preds = %land.end51
  %47 = load i32, i32* %mask, align 4
  %or55 = or i32 %47, 16
  store i32 %or55, i32* %mask, align 4
  %48 = load i8**, i8*** %codeset.addr, align 4
  %49 = load i8*, i8** %48, align 4
  %50 = load i8*, i8** %cp, align 4
  %cmp56 = icmp ne i8* %49, %50
  br i1 %cmp56, label %land.lhs.true58, label %if.end71

land.lhs.true58:                                  ; preds = %while.end54
  %51 = load i8**, i8*** %codeset.addr, align 4
  %52 = load i8*, i8** %51, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %52, i32 0
  %53 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %53 to i32
  %cmp61 = icmp ne i32 %conv60, 0
  br i1 %cmp61, label %if.then63, label %if.end71

if.then63:                                        ; preds = %land.lhs.true58
  %54 = load i8**, i8*** %codeset.addr, align 4
  %55 = load i8*, i8** %54, align 4
  %56 = load i8*, i8** %cp, align 4
  %57 = load i8**, i8*** %codeset.addr, align 4
  %58 = load i8*, i8** %57, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %56 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %58 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %call64 = call i8* @_nl_normalize_codeset(i8* %55, i32 %sub.ptr.sub)
  %59 = load i8**, i8*** %normalized_codeset.addr, align 4
  store i8* %call64, i8** %59, align 4
  %60 = load i8**, i8*** %codeset.addr, align 4
  %61 = load i8*, i8** %60, align 4
  %62 = load i8**, i8*** %normalized_codeset.addr, align 4
  %63 = load i8*, i8** %62, align 4
  %call65 = call i32 @strcmp(i8* %61, i8* %63)
  %cmp66 = icmp eq i32 %call65, 0
  br i1 %cmp66, label %if.then68, label %if.else69

if.then68:                                        ; preds = %if.then63
  %64 = load i8**, i8*** %normalized_codeset.addr, align 4
  %65 = load i8*, i8** %64, align 4
  call void @free(i8* %65)
  br label %if.end

if.else69:                                        ; preds = %if.then63
  %66 = load i32, i32* %mask, align 4
  %or70 = or i32 %66, 8
  store i32 %or70, i32* %mask, align 4
  br label %if.end

if.end:                                           ; preds = %if.else69, %if.then68
  br label %if.end71

if.end71:                                         ; preds = %if.end, %land.lhs.true58, %while.end54
  br label %if.end72

if.end72:                                         ; preds = %if.end71, %while.end
  br label %if.end73

if.end73:                                         ; preds = %if.end72, %if.else
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.then
  %67 = load i8*, i8** %cp, align 4
  %arrayidx75 = getelementptr inbounds i8, i8* %67, i32 0
  %68 = load i8, i8* %arrayidx75, align 1
  %conv76 = sext i8 %68 to i32
  %cmp77 = icmp eq i32 %conv76, 64
  br i1 %cmp77, label %if.then86, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end74
  %69 = load i32, i32* %syntax, align 4
  %cmp79 = icmp ne i32 %69, 1
  br i1 %cmp79, label %land.lhs.true81, label %if.end121

land.lhs.true81:                                  ; preds = %lor.lhs.false
  %70 = load i8*, i8** %cp, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %70, i32 0
  %71 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %71 to i32
  %cmp84 = icmp eq i32 %conv83, 43
  br i1 %cmp84, label %if.then86, label %if.end121

if.then86:                                        ; preds = %land.lhs.true81, %if.end74
  %72 = load i8*, i8** %cp, align 4
  %arrayidx87 = getelementptr inbounds i8, i8* %72, i32 0
  %73 = load i8, i8* %arrayidx87, align 1
  %conv88 = sext i8 %73 to i32
  %cmp89 = icmp eq i32 %conv88, 64
  %cond = select i1 %cmp89, i32 1, i32 2
  store i32 %cond, i32* %syntax, align 4
  %74 = load i8*, i8** %cp, align 4
  %arrayidx91 = getelementptr inbounds i8, i8* %74, i32 0
  store i8 0, i8* %arrayidx91, align 1
  %75 = load i8*, i8** %cp, align 4
  %incdec.ptr92 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %incdec.ptr92, i8** %cp, align 4
  %76 = load i8**, i8*** %modifier.addr, align 4
  store i8* %incdec.ptr92, i8** %76, align 4
  br label %while.cond93

while.cond93:                                     ; preds = %while.body117, %if.then86
  %77 = load i32, i32* %syntax, align 4
  %cmp94 = icmp eq i32 %77, 2
  br i1 %cmp94, label %land.lhs.true96, label %land.end116

land.lhs.true96:                                  ; preds = %while.cond93
  %78 = load i8*, i8** %cp, align 4
  %arrayidx97 = getelementptr inbounds i8, i8* %78, i32 0
  %79 = load i8, i8* %arrayidx97, align 1
  %conv98 = sext i8 %79 to i32
  %cmp99 = icmp ne i32 %conv98, 0
  br i1 %cmp99, label %land.lhs.true101, label %land.end116

land.lhs.true101:                                 ; preds = %land.lhs.true96
  %80 = load i8*, i8** %cp, align 4
  %arrayidx102 = getelementptr inbounds i8, i8* %80, i32 0
  %81 = load i8, i8* %arrayidx102, align 1
  %conv103 = sext i8 %81 to i32
  %cmp104 = icmp ne i32 %conv103, 43
  br i1 %cmp104, label %land.lhs.true106, label %land.end116

land.lhs.true106:                                 ; preds = %land.lhs.true101
  %82 = load i8*, i8** %cp, align 4
  %arrayidx107 = getelementptr inbounds i8, i8* %82, i32 0
  %83 = load i8, i8* %arrayidx107, align 1
  %conv108 = sext i8 %83 to i32
  %cmp109 = icmp ne i32 %conv108, 44
  br i1 %cmp109, label %land.rhs111, label %land.end116

land.rhs111:                                      ; preds = %land.lhs.true106
  %84 = load i8*, i8** %cp, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %84, i32 0
  %85 = load i8, i8* %arrayidx112, align 1
  %conv113 = sext i8 %85 to i32
  %cmp114 = icmp ne i32 %conv113, 95
  br label %land.end116

land.end116:                                      ; preds = %land.rhs111, %land.lhs.true106, %land.lhs.true101, %land.lhs.true96, %while.cond93
  %86 = phi i1 [ false, %land.lhs.true106 ], [ false, %land.lhs.true101 ], [ false, %land.lhs.true96 ], [ false, %while.cond93 ], [ %cmp114, %land.rhs111 ]
  br i1 %86, label %while.body117, label %while.end119

while.body117:                                    ; preds = %land.end116
  %87 = load i8*, i8** %cp, align 4
  %incdec.ptr118 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %incdec.ptr118, i8** %cp, align 4
  br label %while.cond93

while.end119:                                     ; preds = %land.end116
  %88 = load i32, i32* %mask, align 4
  %or120 = or i32 %88, 192
  store i32 %or120, i32* %mask, align 4
  br label %if.end121

if.end121:                                        ; preds = %while.end119, %land.lhs.true81, %lor.lhs.false
  %89 = load i32, i32* %syntax, align 4
  %cmp122 = icmp ne i32 %89, 1
  br i1 %cmp122, label %land.lhs.true124, label %if.end200

land.lhs.true124:                                 ; preds = %if.end121
  %90 = load i8*, i8** %cp, align 4
  %arrayidx125 = getelementptr inbounds i8, i8* %90, i32 0
  %91 = load i8, i8* %arrayidx125, align 1
  %conv126 = sext i8 %91 to i32
  %cmp127 = icmp eq i32 %conv126, 43
  br i1 %cmp127, label %if.then139, label %lor.lhs.false129

lor.lhs.false129:                                 ; preds = %land.lhs.true124
  %92 = load i8*, i8** %cp, align 4
  %arrayidx130 = getelementptr inbounds i8, i8* %92, i32 0
  %93 = load i8, i8* %arrayidx130, align 1
  %conv131 = sext i8 %93 to i32
  %cmp132 = icmp eq i32 %conv131, 44
  br i1 %cmp132, label %if.then139, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %lor.lhs.false129
  %94 = load i8*, i8** %cp, align 4
  %arrayidx135 = getelementptr inbounds i8, i8* %94, i32 0
  %95 = load i8, i8* %arrayidx135, align 1
  %conv136 = sext i8 %95 to i32
  %cmp137 = icmp eq i32 %conv136, 95
  br i1 %cmp137, label %if.then139, label %if.end200

if.then139:                                       ; preds = %lor.lhs.false134, %lor.lhs.false129, %land.lhs.true124
  store i32 2, i32* %syntax, align 4
  %96 = load i8*, i8** %cp, align 4
  %arrayidx140 = getelementptr inbounds i8, i8* %96, i32 0
  %97 = load i8, i8* %arrayidx140, align 1
  %conv141 = sext i8 %97 to i32
  %cmp142 = icmp eq i32 %conv141, 43
  br i1 %cmp142, label %if.then144, label %if.end167

if.then144:                                       ; preds = %if.then139
  %98 = load i8*, i8** %cp, align 4
  %arrayidx145 = getelementptr inbounds i8, i8* %98, i32 0
  store i8 0, i8* %arrayidx145, align 1
  %99 = load i8*, i8** %cp, align 4
  %incdec.ptr146 = getelementptr inbounds i8, i8* %99, i32 1
  store i8* %incdec.ptr146, i8** %cp, align 4
  %100 = load i8**, i8*** %special.addr, align 4
  store i8* %incdec.ptr146, i8** %100, align 4
  br label %while.cond147

while.cond147:                                    ; preds = %while.body163, %if.then144
  %101 = load i8*, i8** %cp, align 4
  %arrayidx148 = getelementptr inbounds i8, i8* %101, i32 0
  %102 = load i8, i8* %arrayidx148, align 1
  %conv149 = sext i8 %102 to i32
  %cmp150 = icmp ne i32 %conv149, 0
  br i1 %cmp150, label %land.lhs.true152, label %land.end162

land.lhs.true152:                                 ; preds = %while.cond147
  %103 = load i8*, i8** %cp, align 4
  %arrayidx153 = getelementptr inbounds i8, i8* %103, i32 0
  %104 = load i8, i8* %arrayidx153, align 1
  %conv154 = sext i8 %104 to i32
  %cmp155 = icmp ne i32 %conv154, 44
  br i1 %cmp155, label %land.rhs157, label %land.end162

land.rhs157:                                      ; preds = %land.lhs.true152
  %105 = load i8*, i8** %cp, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %105, i32 0
  %106 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %106 to i32
  %cmp160 = icmp ne i32 %conv159, 95
  br label %land.end162

land.end162:                                      ; preds = %land.rhs157, %land.lhs.true152, %while.cond147
  %107 = phi i1 [ false, %land.lhs.true152 ], [ false, %while.cond147 ], [ %cmp160, %land.rhs157 ]
  br i1 %107, label %while.body163, label %while.end165

while.body163:                                    ; preds = %land.end162
  %108 = load i8*, i8** %cp, align 4
  %incdec.ptr164 = getelementptr inbounds i8, i8* %108, i32 1
  store i8* %incdec.ptr164, i8** %cp, align 4
  br label %while.cond147

while.end165:                                     ; preds = %land.end162
  %109 = load i32, i32* %mask, align 4
  %or166 = or i32 %109, 4
  store i32 %or166, i32* %mask, align 4
  br label %if.end167

if.end167:                                        ; preds = %while.end165, %if.then139
  %110 = load i8*, i8** %cp, align 4
  %arrayidx168 = getelementptr inbounds i8, i8* %110, i32 0
  %111 = load i8, i8* %arrayidx168, align 1
  %conv169 = sext i8 %111 to i32
  %cmp170 = icmp eq i32 %conv169, 44
  br i1 %cmp170, label %if.then172, label %if.end190

if.then172:                                       ; preds = %if.end167
  %112 = load i8*, i8** %cp, align 4
  %arrayidx173 = getelementptr inbounds i8, i8* %112, i32 0
  store i8 0, i8* %arrayidx173, align 1
  %113 = load i8*, i8** %cp, align 4
  %incdec.ptr174 = getelementptr inbounds i8, i8* %113, i32 1
  store i8* %incdec.ptr174, i8** %cp, align 4
  %114 = load i8**, i8*** %sponsor.addr, align 4
  store i8* %incdec.ptr174, i8** %114, align 4
  br label %while.cond175

while.cond175:                                    ; preds = %while.body186, %if.then172
  %115 = load i8*, i8** %cp, align 4
  %arrayidx176 = getelementptr inbounds i8, i8* %115, i32 0
  %116 = load i8, i8* %arrayidx176, align 1
  %conv177 = sext i8 %116 to i32
  %cmp178 = icmp ne i32 %conv177, 0
  br i1 %cmp178, label %land.rhs180, label %land.end185

land.rhs180:                                      ; preds = %while.cond175
  %117 = load i8*, i8** %cp, align 4
  %arrayidx181 = getelementptr inbounds i8, i8* %117, i32 0
  %118 = load i8, i8* %arrayidx181, align 1
  %conv182 = sext i8 %118 to i32
  %cmp183 = icmp ne i32 %conv182, 95
  br label %land.end185

land.end185:                                      ; preds = %land.rhs180, %while.cond175
  %119 = phi i1 [ false, %while.cond175 ], [ %cmp183, %land.rhs180 ]
  br i1 %119, label %while.body186, label %while.end188

while.body186:                                    ; preds = %land.end185
  %120 = load i8*, i8** %cp, align 4
  %incdec.ptr187 = getelementptr inbounds i8, i8* %120, i32 1
  store i8* %incdec.ptr187, i8** %cp, align 4
  br label %while.cond175

while.end188:                                     ; preds = %land.end185
  %121 = load i32, i32* %mask, align 4
  %or189 = or i32 %121, 2
  store i32 %or189, i32* %mask, align 4
  br label %if.end190

if.end190:                                        ; preds = %while.end188, %if.end167
  %122 = load i8*, i8** %cp, align 4
  %arrayidx191 = getelementptr inbounds i8, i8* %122, i32 0
  %123 = load i8, i8* %arrayidx191, align 1
  %conv192 = sext i8 %123 to i32
  %cmp193 = icmp eq i32 %conv192, 95
  br i1 %cmp193, label %if.then195, label %if.end199

if.then195:                                       ; preds = %if.end190
  %124 = load i8*, i8** %cp, align 4
  %arrayidx196 = getelementptr inbounds i8, i8* %124, i32 0
  store i8 0, i8* %arrayidx196, align 1
  %125 = load i8*, i8** %cp, align 4
  %incdec.ptr197 = getelementptr inbounds i8, i8* %125, i32 1
  store i8* %incdec.ptr197, i8** %cp, align 4
  %126 = load i8**, i8*** %revision.addr, align 4
  store i8* %incdec.ptr197, i8** %126, align 4
  %127 = load i32, i32* %mask, align 4
  %or198 = or i32 %127, 1
  store i32 %or198, i32* %mask, align 4
  br label %if.end199

if.end199:                                        ; preds = %if.then195, %if.end190
  br label %if.end200

if.end200:                                        ; preds = %if.end199, %lor.lhs.false134, %if.end121
  %128 = load i32, i32* %syntax, align 4
  %cmp201 = icmp eq i32 %128, 1
  br i1 %cmp201, label %if.then203, label %if.end233

if.then203:                                       ; preds = %if.end200
  %129 = load i8**, i8*** %territory.addr, align 4
  %130 = load i8*, i8** %129, align 4
  %cmp204 = icmp ne i8* %130, null
  br i1 %cmp204, label %land.lhs.true206, label %if.end212

land.lhs.true206:                                 ; preds = %if.then203
  %131 = load i8**, i8*** %territory.addr, align 4
  %132 = load i8*, i8** %131, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %132, i32 0
  %133 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %133 to i32
  %cmp209 = icmp eq i32 %conv208, 0
  br i1 %cmp209, label %if.then211, label %if.end212

if.then211:                                       ; preds = %land.lhs.true206
  %134 = load i32, i32* %mask, align 4
  %and = and i32 %134, -33
  store i32 %and, i32* %mask, align 4
  br label %if.end212

if.end212:                                        ; preds = %if.then211, %land.lhs.true206, %if.then203
  %135 = load i8**, i8*** %codeset.addr, align 4
  %136 = load i8*, i8** %135, align 4
  %cmp213 = icmp ne i8* %136, null
  br i1 %cmp213, label %land.lhs.true215, label %if.end222

land.lhs.true215:                                 ; preds = %if.end212
  %137 = load i8**, i8*** %codeset.addr, align 4
  %138 = load i8*, i8** %137, align 4
  %arrayidx216 = getelementptr inbounds i8, i8* %138, i32 0
  %139 = load i8, i8* %arrayidx216, align 1
  %conv217 = sext i8 %139 to i32
  %cmp218 = icmp eq i32 %conv217, 0
  br i1 %cmp218, label %if.then220, label %if.end222

if.then220:                                       ; preds = %land.lhs.true215
  %140 = load i32, i32* %mask, align 4
  %and221 = and i32 %140, -17
  store i32 %and221, i32* %mask, align 4
  br label %if.end222

if.end222:                                        ; preds = %if.then220, %land.lhs.true215, %if.end212
  %141 = load i8**, i8*** %modifier.addr, align 4
  %142 = load i8*, i8** %141, align 4
  %cmp223 = icmp ne i8* %142, null
  br i1 %cmp223, label %land.lhs.true225, label %if.end232

land.lhs.true225:                                 ; preds = %if.end222
  %143 = load i8**, i8*** %modifier.addr, align 4
  %144 = load i8*, i8** %143, align 4
  %arrayidx226 = getelementptr inbounds i8, i8* %144, i32 0
  %145 = load i8, i8* %arrayidx226, align 1
  %conv227 = sext i8 %145 to i32
  %cmp228 = icmp eq i32 %conv227, 0
  br i1 %cmp228, label %if.then230, label %if.end232

if.then230:                                       ; preds = %land.lhs.true225
  %146 = load i32, i32* %mask, align 4
  %and231 = and i32 %146, -129
  store i32 %and231, i32* %mask, align 4
  br label %if.end232

if.end232:                                        ; preds = %if.then230, %land.lhs.true225, %if.end222
  br label %if.end233

if.end233:                                        ; preds = %if.end232, %if.end200
  %147 = load i32, i32* %mask, align 4
  ret i32 %147
}

declare i8* @strchr(i8*, i32) #1

declare i8* @_nl_normalize_codeset(i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare void @free(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
