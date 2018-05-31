; ModuleID = 'braces.c'
source_filename = "braces.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.__mbstate_t = type { i32, i32 }

@.str = private unnamed_addr constant [9 x i8] c"braces.c\00", align 1
@locale_mb_cur_max = external global i32, align 4
@is_basic_table = external constant [0 x i32], align 4
@.str.1 = private unnamed_addr constant [47 x i8] c"brace expansion: cannot allocate memory for %s\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.3 = private unnamed_addr constant [59 x i8] c"brace expansion: failed to allocate memory for %d elements\00", align 1
@interrupt_state = external global i32, align 4
@terminating_signal = external global i32, align 4
@.str.4 = private unnamed_addr constant [5 x i8] c"%0*d\00", align 1
@.str.5 = private unnamed_addr constant [52 x i8] c"brace expansion: failed to allocate memory for `%s'\00", align 1

; Function Attrs: noinline nounwind
define i8** @brace_expand(i8* %text) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %start = alloca i32, align 4
  %tlen = alloca i32, align 4
  %preamble = alloca i8*, align 4
  %postamble = alloca i8*, align 4
  %amble = alloca i8*, align 4
  %alen = alloca i32, align 4
  %tack = alloca i8**, align 4
  %result = alloca i8**, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %c1 = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  %state_bak78 = alloca %struct.__mbstate_t, align 4
  %mblength79 = alloca i32, align 4
  %_f80 = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  %1 = load i8*, i8** %text.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %tlen, align 4
  store i32 0, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %2 = load i8*, i8** %text.addr, align 4
  %3 = load i32, i32* %tlen, align 4
  %call1 = call i32 @brace_gobbler(i8* %2, i32 %3, i32* %i, i32 123)
  store i32 %call1, i32* %c, align 4
  %4 = load i32, i32* %c, align 4
  store i32 %4, i32* %c1, align 4
  %5 = load i32, i32* %c, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %if.then, label %if.else4

if.then:                                          ; preds = %do.body
  %6 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, 1
  store i32 %add, i32* %j, align 4
  store i32 %add, i32* %start, align 4
  %7 = load i8*, i8** %text.addr, align 4
  %8 = load i32, i32* %tlen, align 4
  %call2 = call i32 @brace_gobbler(i8* %7, i32 %8, i32* %j, i32 125)
  store i32 %call2, i32* %c, align 4
  %9 = load i32, i32* %c, align 4
  %cmp = icmp eq i32 %9, 0
  br i1 %cmp, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  %11 = load i32, i32* %c1, align 4
  store i32 %11, i32* %c, align 4
  br label %do.cond

if.else:                                          ; preds = %if.then
  %12 = load i32, i32* %c1, align 4
  store i32 %12, i32* %c, align 4
  br label %do.end

if.else4:                                         ; preds = %do.body
  br label %do.end

do.cond:                                          ; preds = %if.then3
  %13 = load i32, i32* %c, align 4
  %tobool5 = icmp ne i32 %13, 0
  br i1 %tobool5, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond, %if.else4, %if.else
  %14 = load i32, i32* %i, align 4
  %add6 = add nsw i32 %14, 1
  %call7 = call i8* @sh_xmalloc(i32 %add6, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 154)
  store i8* %call7, i8** %preamble, align 4
  %15 = load i32, i32* %i, align 4
  %cmp8 = icmp sgt i32 %15, 0
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %do.end
  %16 = load i8*, i8** %preamble, align 4
  %17 = load i8*, i8** %text.addr, align 4
  %18 = load i32, i32* %i, align 4
  %call10 = call i8* @strncpy(i8* %16, i8* %17, i32 %18)
  br label %if.end

if.end:                                           ; preds = %if.then9, %do.end
  %19 = load i8*, i8** %preamble, align 4
  %20 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %19, i32 %20
  store i8 0, i8* %arrayidx, align 1
  %call11 = call i8* @sh_xmalloc(i32 8, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 159)
  %21 = bitcast i8* %call11 to i8**
  store i8** %21, i8*** %result, align 4
  %22 = load i8*, i8** %preamble, align 4
  %23 = load i8**, i8*** %result, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %23, i32 0
  store i8* %22, i8** %arrayidx12, align 4
  %24 = load i8**, i8*** %result, align 4
  %arrayidx13 = getelementptr inbounds i8*, i8** %24, i32 1
  store i8* null, i8** %arrayidx13, align 4
  %25 = load i32, i32* %c, align 4
  %cmp14 = icmp ne i32 %25, 123
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end
  %26 = load i8**, i8*** %result, align 4
  store i8** %26, i8*** %retval, align 4
  br label %return

if.end16:                                         ; preds = %if.end
  %27 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %27, 1
  store i32 %inc17, i32* %i, align 4
  store i32 %inc17, i32* %start, align 4
  %28 = load i8*, i8** %text.addr, align 4
  %29 = load i32, i32* %tlen, align 4
  %call18 = call i32 @brace_gobbler(i8* %28, i32 %29, i32* %i, i32 125)
  store i32 %call18, i32* %c, align 4
  %30 = load i32, i32* %c, align 4
  %cmp19 = icmp eq i32 %30, 0
  br i1 %cmp19, label %if.then20, label %if.end26

if.then20:                                        ; preds = %if.end16
  %31 = load i8*, i8** %preamble, align 4
  call void @sh_xfree(i8* %31, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 198)
  %32 = load i8*, i8** %text.addr, align 4
  %call21 = call i32 @strlen(i8* %32)
  %add22 = add i32 1, %call21
  %call23 = call i8* @sh_xmalloc(i32 %add22, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 199)
  %33 = load i8*, i8** %text.addr, align 4
  %call24 = call i8* @strcpy(i8* %call23, i8* %33)
  %34 = load i8**, i8*** %result, align 4
  %arrayidx25 = getelementptr inbounds i8*, i8** %34, i32 0
  store i8* %call24, i8** %arrayidx25, align 4
  %35 = load i8**, i8*** %result, align 4
  store i8** %35, i8*** %retval, align 4
  br label %return

if.end26:                                         ; preds = %if.end16
  %36 = load i8*, i8** %text.addr, align 4
  %37 = load i32, i32* %start, align 4
  %38 = load i32, i32* %i, align 4
  %call27 = call i8* @substring(i8* %36, i32 %37, i32 %38)
  store i8* %call27, i8** %amble, align 4
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %start, align 4
  %sub = sub nsw i32 %39, %40
  store i32 %sub, i32* %alen, align 4
  %41 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %41, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end110, %do.end66, %if.end26
  %42 = load i8*, i8** %amble, align 4
  %43 = load i32, i32* %j, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %42, i32 %43
  %44 = load i8, i8* %arrayidx28, align 1
  %tobool29 = icmp ne i8 %44, 0
  br i1 %tobool29, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %45 = load i8*, i8** %amble, align 4
  %46 = load i32, i32* %j, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %45, i32 %46
  %47 = load i8, i8* %arrayidx30, align 1
  %conv = sext i8 %47 to i32
  %cmp31 = icmp eq i32 %conv, 92
  br i1 %cmp31, label %if.then33, label %if.end67

if.then33:                                        ; preds = %while.body
  %48 = load i32, i32* %j, align 4
  %inc34 = add nsw i32 %48, 1
  store i32 %inc34, i32* %j, align 4
  br label %do.body35

do.body35:                                        ; preds = %if.then33
  %49 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp36 = icmp sgt i32 %49, 1
  br i1 %cmp36, label %if.then38, label %if.else62

if.then38:                                        ; preds = %do.body35
  %50 = load i8*, i8** %amble, align 4
  %51 = load i32, i32* %j, align 4
  %arrayidx39 = getelementptr inbounds i8, i8* %50, i32 %51
  %52 = load i8, i8* %arrayidx39, align 1
  %call40 = call i32 @is_basic(i8 signext %52)
  store i32 %call40, i32* %_f, align 4
  %53 = load i32, i32* %_f, align 4
  %tobool41 = icmp ne i32 %53, 0
  br i1 %tobool41, label %if.then42, label %if.else43

if.then42:                                        ; preds = %if.then38
  store i32 1, i32* %mblength, align 4
  br label %if.end46

if.else43:                                        ; preds = %if.then38
  %54 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %55 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %54, i8* %55, i32 8, i32 4, i1 false)
  %56 = load i8*, i8** %amble, align 4
  %57 = load i32, i32* %j, align 4
  %add.ptr = getelementptr inbounds i8, i8* %56, i32 %57
  %58 = load i32, i32* %alen, align 4
  %59 = load i32, i32* %j, align 4
  %sub44 = sub i32 %58, %59
  %call45 = call i32 @mbrlen(i8* %add.ptr, i32 %sub44, %struct.__mbstate_t* %state)
  store i32 %call45, i32* %mblength, align 4
  br label %if.end46

if.end46:                                         ; preds = %if.else43, %if.then42
  %60 = load i32, i32* %mblength, align 4
  %cmp47 = icmp eq i32 %60, -2
  br i1 %cmp47, label %if.then51, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end46
  %61 = load i32, i32* %mblength, align 4
  %cmp49 = icmp eq i32 %61, -1
  br i1 %cmp49, label %if.then51, label %if.else53

if.then51:                                        ; preds = %lor.lhs.false, %if.end46
  %62 = bitcast %struct.__mbstate_t* %state to i8*
  %63 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %62, i8* %63, i32 8, i32 4, i1 false)
  %64 = load i32, i32* %j, align 4
  %inc52 = add nsw i32 %64, 1
  store i32 %inc52, i32* %j, align 4
  br label %if.end61

if.else53:                                        ; preds = %lor.lhs.false
  %65 = load i32, i32* %mblength, align 4
  %cmp54 = icmp eq i32 %65, 0
  br i1 %cmp54, label %if.then56, label %if.else58

if.then56:                                        ; preds = %if.else53
  %66 = load i32, i32* %j, align 4
  %inc57 = add nsw i32 %66, 1
  store i32 %inc57, i32* %j, align 4
  br label %if.end60

if.else58:                                        ; preds = %if.else53
  %67 = load i32, i32* %mblength, align 4
  %68 = load i32, i32* %j, align 4
  %add59 = add i32 %68, %67
  store i32 %add59, i32* %j, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.then56
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.then51
  br label %if.end64

if.else62:                                        ; preds = %do.body35
  %69 = load i32, i32* %j, align 4
  %inc63 = add nsw i32 %69, 1
  store i32 %inc63, i32* %j, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else62, %if.end61
  br label %do.end66

do.end66:                                         ; preds = %if.end64
  br label %while.cond

if.end67:                                         ; preds = %while.body
  %70 = load i8*, i8** %amble, align 4
  %71 = load i32, i32* %j, align 4
  %arrayidx68 = getelementptr inbounds i8, i8* %70, i32 %71
  %72 = load i8, i8* %arrayidx68, align 1
  %conv69 = sext i8 %72 to i32
  %cmp70 = icmp eq i32 %conv69, 44
  br i1 %cmp70, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end67
  br label %while.end

if.end73:                                         ; preds = %if.end67
  br label %do.body74

do.body74:                                        ; preds = %if.end73
  %73 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp75 = icmp sgt i32 %73, 1
  br i1 %cmp75, label %if.then77, label %if.else106

if.then77:                                        ; preds = %do.body74
  %74 = load i8*, i8** %amble, align 4
  %75 = load i32, i32* %j, align 4
  %arrayidx81 = getelementptr inbounds i8, i8* %74, i32 %75
  %76 = load i8, i8* %arrayidx81, align 1
  %call82 = call i32 @is_basic(i8 signext %76)
  store i32 %call82, i32* %_f80, align 4
  %77 = load i32, i32* %_f80, align 4
  %tobool83 = icmp ne i32 %77, 0
  br i1 %tobool83, label %if.then84, label %if.else85

if.then84:                                        ; preds = %if.then77
  store i32 1, i32* %mblength79, align 4
  br label %if.end89

if.else85:                                        ; preds = %if.then77
  %78 = bitcast %struct.__mbstate_t* %state_bak78 to i8*
  %79 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %78, i8* %79, i32 8, i32 4, i1 false)
  %80 = load i8*, i8** %amble, align 4
  %81 = load i32, i32* %j, align 4
  %add.ptr86 = getelementptr inbounds i8, i8* %80, i32 %81
  %82 = load i32, i32* %alen, align 4
  %83 = load i32, i32* %j, align 4
  %sub87 = sub i32 %82, %83
  %call88 = call i32 @mbrlen(i8* %add.ptr86, i32 %sub87, %struct.__mbstate_t* %state)
  store i32 %call88, i32* %mblength79, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else85, %if.then84
  %84 = load i32, i32* %mblength79, align 4
  %cmp90 = icmp eq i32 %84, -2
  br i1 %cmp90, label %if.then95, label %lor.lhs.false92

lor.lhs.false92:                                  ; preds = %if.end89
  %85 = load i32, i32* %mblength79, align 4
  %cmp93 = icmp eq i32 %85, -1
  br i1 %cmp93, label %if.then95, label %if.else97

if.then95:                                        ; preds = %lor.lhs.false92, %if.end89
  %86 = bitcast %struct.__mbstate_t* %state to i8*
  %87 = bitcast %struct.__mbstate_t* %state_bak78 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %86, i8* %87, i32 8, i32 4, i1 false)
  %88 = load i32, i32* %j, align 4
  %inc96 = add nsw i32 %88, 1
  store i32 %inc96, i32* %j, align 4
  br label %if.end105

if.else97:                                        ; preds = %lor.lhs.false92
  %89 = load i32, i32* %mblength79, align 4
  %cmp98 = icmp eq i32 %89, 0
  br i1 %cmp98, label %if.then100, label %if.else102

if.then100:                                       ; preds = %if.else97
  %90 = load i32, i32* %j, align 4
  %inc101 = add nsw i32 %90, 1
  store i32 %inc101, i32* %j, align 4
  br label %if.end104

if.else102:                                       ; preds = %if.else97
  %91 = load i32, i32* %mblength79, align 4
  %92 = load i32, i32* %j, align 4
  %add103 = add i32 %92, %91
  store i32 %add103, i32* %j, align 4
  br label %if.end104

if.end104:                                        ; preds = %if.else102, %if.then100
  br label %if.end105

if.end105:                                        ; preds = %if.end104, %if.then95
  br label %if.end108

if.else106:                                       ; preds = %do.body74
  %93 = load i32, i32* %j, align 4
  %inc107 = add nsw i32 %93, 1
  store i32 %inc107, i32* %j, align 4
  br label %if.end108

if.end108:                                        ; preds = %if.else106, %if.end105
  br label %do.end110

do.end110:                                        ; preds = %if.end108
  br label %while.cond

while.end:                                        ; preds = %if.then72, %while.cond
  %94 = load i8*, i8** %amble, align 4
  %95 = load i32, i32* %j, align 4
  %arrayidx111 = getelementptr inbounds i8, i8* %94, i32 %95
  %96 = load i8, i8* %arrayidx111, align 1
  %conv112 = sext i8 %96 to i32
  %cmp113 = icmp eq i32 %conv112, 0
  br i1 %cmp113, label %if.then115, label %if.end145

if.then115:                                       ; preds = %while.end
  %97 = load i8*, i8** %amble, align 4
  %98 = load i32, i32* %alen, align 4
  %call116 = call i8** @expand_seqterm(i8* %97, i32 %98)
  store i8** %call116, i8*** %tack, align 4
  %99 = load i8**, i8*** %tack, align 4
  %tobool117 = icmp ne i8** %99, null
  br i1 %tobool117, label %if.then118, label %if.else119

if.then118:                                       ; preds = %if.then115
  br label %add_tack

if.else119:                                       ; preds = %if.then115
  %100 = load i8*, i8** %text.addr, align 4
  %101 = load i32, i32* %i, align 4
  %add120 = add nsw i32 %101, 1
  %arrayidx121 = getelementptr inbounds i8, i8* %100, i32 %add120
  %102 = load i8, i8* %arrayidx121, align 1
  %tobool122 = icmp ne i8 %102, 0
  br i1 %tobool122, label %if.then123, label %if.else139

if.then123:                                       ; preds = %if.else119
  %call124 = call i8** @strvec_create(i32 2)
  store i8** %call124, i8*** %tack, align 4
  %103 = load i8*, i8** %text.addr, align 4
  %104 = load i32, i32* %start, align 4
  %add.ptr125 = getelementptr inbounds i8, i8* %103, i32 %104
  %add.ptr126 = getelementptr inbounds i8, i8* %add.ptr125, i32 -1
  %call127 = call i32 @strlen(i8* %add.ptr126)
  %add128 = add i32 1, %call127
  %call129 = call i8* @sh_xmalloc(i32 %add128, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 247)
  %105 = load i8*, i8** %text.addr, align 4
  %106 = load i32, i32* %start, align 4
  %add.ptr130 = getelementptr inbounds i8, i8* %105, i32 %106
  %add.ptr131 = getelementptr inbounds i8, i8* %add.ptr130, i32 -1
  %call132 = call i8* @strcpy(i8* %call129, i8* %add.ptr131)
  %107 = load i8**, i8*** %tack, align 4
  %arrayidx133 = getelementptr inbounds i8*, i8** %107, i32 0
  store i8* %call132, i8** %arrayidx133, align 4
  %108 = load i8**, i8*** %tack, align 4
  %arrayidx134 = getelementptr inbounds i8*, i8** %108, i32 0
  %109 = load i8*, i8** %arrayidx134, align 4
  %110 = load i32, i32* %i, align 4
  %111 = load i32, i32* %start, align 4
  %sub135 = sub nsw i32 %110, %111
  %add136 = add nsw i32 %sub135, 2
  %arrayidx137 = getelementptr inbounds i8, i8* %109, i32 %add136
  store i8 0, i8* %arrayidx137, align 1
  %112 = load i8**, i8*** %tack, align 4
  %arrayidx138 = getelementptr inbounds i8*, i8** %112, i32 1
  store i8* null, i8** %arrayidx138, align 4
  br label %add_tack

if.else139:                                       ; preds = %if.else119
  %113 = load i8*, i8** %amble, align 4
  call void @sh_xfree(i8* %113, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 254)
  %114 = load i8*, i8** %preamble, align 4
  call void @sh_xfree(i8* %114, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 255)
  %115 = load i8*, i8** %text.addr, align 4
  %call140 = call i32 @strlen(i8* %115)
  %add141 = add i32 1, %call140
  %call142 = call i8* @sh_xmalloc(i32 %add141, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 256)
  %116 = load i8*, i8** %text.addr, align 4
  %call143 = call i8* @strcpy(i8* %call142, i8* %116)
  %117 = load i8**, i8*** %result, align 4
  %arrayidx144 = getelementptr inbounds i8*, i8** %117, i32 0
  store i8* %call143, i8** %arrayidx144, align 4
  %118 = load i8**, i8*** %result, align 4
  store i8** %118, i8*** %retval, align 4
  br label %return

if.end145:                                        ; preds = %while.end
  %119 = load i8*, i8** %amble, align 4
  %120 = load i32, i32* %alen, align 4
  %call146 = call i8** @expand_amble(i8* %119, i32 %120, i32 0)
  store i8** %call146, i8*** %tack, align 4
  br label %add_tack

add_tack:                                         ; preds = %if.end145, %if.then123, %if.then118
  %121 = load i8**, i8*** %result, align 4
  %122 = load i8**, i8*** %tack, align 4
  %call147 = call i8** @array_concat(i8** %121, i8** %122)
  store i8** %call147, i8*** %result, align 4
  %123 = load i8*, i8** %amble, align 4
  call void @sh_xfree(i8* %123, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 265)
  %124 = load i8**, i8*** %tack, align 4
  %125 = load i8**, i8*** %result, align 4
  %cmp148 = icmp ne i8** %124, %125
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %add_tack
  %126 = load i8**, i8*** %tack, align 4
  call void @strvec_dispose(i8** %126)
  br label %if.end151

if.end151:                                        ; preds = %if.then150, %add_tack
  %127 = load i8*, i8** %text.addr, align 4
  %128 = load i32, i32* %i, align 4
  %add.ptr152 = getelementptr inbounds i8, i8* %127, i32 %128
  %add.ptr153 = getelementptr inbounds i8, i8* %add.ptr152, i32 1
  store i8* %add.ptr153, i8** %postamble, align 4
  %129 = load i8*, i8** %postamble, align 4
  %tobool154 = icmp ne i8* %129, null
  br i1 %tobool154, label %land.lhs.true, label %if.end164

land.lhs.true:                                    ; preds = %if.end151
  %130 = load i8*, i8** %postamble, align 4
  %131 = load i8, i8* %130, align 1
  %conv155 = sext i8 %131 to i32
  %tobool156 = icmp ne i32 %conv155, 0
  br i1 %tobool156, label %if.then157, label %if.end164

if.then157:                                       ; preds = %land.lhs.true
  %132 = load i8*, i8** %postamble, align 4
  %call158 = call i8** @brace_expand(i8* %132)
  store i8** %call158, i8*** %tack, align 4
  %133 = load i8**, i8*** %result, align 4
  %134 = load i8**, i8*** %tack, align 4
  %call159 = call i8** @array_concat(i8** %133, i8** %134)
  store i8** %call159, i8*** %result, align 4
  %135 = load i8**, i8*** %tack, align 4
  %136 = load i8**, i8*** %result, align 4
  %cmp160 = icmp ne i8** %135, %136
  br i1 %cmp160, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.then157
  %137 = load i8**, i8*** %tack, align 4
  call void @strvec_dispose(i8** %137)
  br label %if.end163

if.end163:                                        ; preds = %if.then162, %if.then157
  br label %if.end164

if.end164:                                        ; preds = %if.end163, %land.lhs.true, %if.end151
  %138 = load i8**, i8*** %result, align 4
  store i8** %138, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end164, %if.else139, %if.then20, %if.then15
  %139 = load i8**, i8*** %retval, align 4
  ret i8** %139
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @strlen(i8*) #2

; Function Attrs: noinline nounwind
define internal i32 @brace_gobbler(i8* %text, i32 %tlen, i32* %indx, i32 %satisfy) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %tlen.addr = alloca i32, align 4
  %indx.addr = alloca i32*, align 4
  %satisfy.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %quoted = alloca i32, align 4
  %level = alloca i32, align 4
  %commas = alloca i32, align 4
  %pass_next = alloca i32, align 4
  %si = alloca i32, align 4
  %t = alloca i8*, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  %state_bak81 = alloca %struct.__mbstate_t, align 4
  %mblength82 = alloca i32, align 4
  %_f83 = alloca i32, align 4
  %state_bak269 = alloca %struct.__mbstate_t, align 4
  %mblength270 = alloca i32, align 4
  %_f271 = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %tlen, i32* %tlen.addr, align 4
  store i32* %indx, i32** %indx.addr, align 4
  store i32 %satisfy, i32* %satisfy.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i32 0, i32* %pass_next, align 4
  store i32 0, i32* %quoted, align 4
  store i32 0, i32* %level, align 4
  %1 = load i32, i32* %satisfy.addr, align 4
  %cmp = icmp eq i32 %1, 125
  %cond = select i1 %cmp, i32 0, i32 1
  store i32 %cond, i32* %commas, align 4
  %2 = load i32*, i32** %indx.addr, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end300, %if.then210, %comsub, %if.then122, %do.end112, %if.end56, %if.then36, %do.end, %entry
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  store i32 %conv, i32* %c, align 4
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32, i32* %pass_next, align 4
  %tobool1 = icmp ne i32 %7, 0
  br i1 %tobool1, label %if.then, label %if.end25

if.then:                                          ; preds = %while.body
  store i32 0, i32* %pass_next, align 4
  br label %do.body

do.body:                                          ; preds = %if.then
  %8 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp2 = icmp sgt i32 %8, 1
  br i1 %cmp2, label %if.then4, label %if.else22

if.then4:                                         ; preds = %do.body
  %9 = load i8*, i8** %text.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx5, align 1
  %call = call i32 @is_basic(i8 signext %11)
  store i32 %call, i32* %_f, align 4
  %12 = load i32, i32* %_f, align 4
  %tobool6 = icmp ne i32 %12, 0
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then4
  store i32 1, i32* %mblength, align 4
  br label %if.end

if.else:                                          ; preds = %if.then4
  %13 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %14 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %14, i32 8, i32 4, i1 false)
  %15 = load i8*, i8** %text.addr, align 4
  %16 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i32, i32* %tlen.addr, align 4
  %18 = load i32, i32* %i, align 4
  %sub = sub i32 %17, %18
  %call8 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call8, i32* %mblength, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %19 = load i32, i32* %mblength, align 4
  %cmp9 = icmp eq i32 %19, -2
  br i1 %cmp9, label %if.then13, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %20 = load i32, i32* %mblength, align 4
  %cmp11 = icmp eq i32 %20, -1
  br i1 %cmp11, label %if.then13, label %if.else14

if.then13:                                        ; preds = %lor.lhs.false, %if.end
  %21 = bitcast %struct.__mbstate_t* %state to i8*
  %22 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 8, i32 4, i1 false)
  %23 = load i32, i32* %i, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end21

if.else14:                                        ; preds = %lor.lhs.false
  %24 = load i32, i32* %mblength, align 4
  %cmp15 = icmp eq i32 %24, 0
  br i1 %cmp15, label %if.then17, label %if.else19

if.then17:                                        ; preds = %if.else14
  %25 = load i32, i32* %i, align 4
  %inc18 = add nsw i32 %25, 1
  store i32 %inc18, i32* %i, align 4
  br label %if.end20

if.else19:                                        ; preds = %if.else14
  %26 = load i32, i32* %mblength, align 4
  %27 = load i32, i32* %i, align 4
  %add = add i32 %27, %26
  store i32 %add, i32* %i, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then17
  br label %if.end21

if.end21:                                         ; preds = %if.end20, %if.then13
  br label %if.end24

if.else22:                                        ; preds = %do.body
  %28 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %28, 1
  store i32 %inc23, i32* %i, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.else22, %if.end21
  br label %do.end

do.end:                                           ; preds = %if.end24
  br label %while.cond

if.end25:                                         ; preds = %while.body
  %29 = load i32, i32* %c, align 4
  %cmp26 = icmp eq i32 %29, 92
  br i1 %cmp26, label %land.lhs.true, label %if.end38

land.lhs.true:                                    ; preds = %if.end25
  %30 = load i32, i32* %quoted, align 4
  %cmp28 = icmp eq i32 %30, 0
  br i1 %cmp28, label %if.then36, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %land.lhs.true
  %31 = load i32, i32* %quoted, align 4
  %cmp31 = icmp eq i32 %31, 34
  br i1 %cmp31, label %if.then36, label %lor.lhs.false33

lor.lhs.false33:                                  ; preds = %lor.lhs.false30
  %32 = load i32, i32* %quoted, align 4
  %cmp34 = icmp eq i32 %32, 96
  br i1 %cmp34, label %if.then36, label %if.end38

if.then36:                                        ; preds = %lor.lhs.false33, %lor.lhs.false30, %land.lhs.true
  store i32 1, i32* %pass_next, align 4
  %33 = load i32, i32* %i, align 4
  %inc37 = add nsw i32 %33, 1
  store i32 %inc37, i32* %i, align 4
  br label %while.cond

if.end38:                                         ; preds = %lor.lhs.false33, %if.end25
  %34 = load i32, i32* %c, align 4
  %cmp39 = icmp eq i32 %34, 36
  br i1 %cmp39, label %land.lhs.true41, label %if.end57

land.lhs.true41:                                  ; preds = %if.end38
  %35 = load i8*, i8** %text.addr, align 4
  %36 = load i32, i32* %i, align 4
  %add42 = add nsw i32 %36, 1
  %arrayidx43 = getelementptr inbounds i8, i8* %35, i32 %add42
  %37 = load i8, i8* %arrayidx43, align 1
  %conv44 = sext i8 %37 to i32
  %cmp45 = icmp eq i32 %conv44, 123
  br i1 %cmp45, label %land.lhs.true47, label %if.end57

land.lhs.true47:                                  ; preds = %land.lhs.true41
  %38 = load i32, i32* %quoted, align 4
  %cmp48 = icmp ne i32 %38, 39
  br i1 %cmp48, label %if.then50, label %if.end57

if.then50:                                        ; preds = %land.lhs.true47
  store i32 1, i32* %pass_next, align 4
  %39 = load i32, i32* %i, align 4
  %inc51 = add nsw i32 %39, 1
  store i32 %inc51, i32* %i, align 4
  %40 = load i32, i32* %quoted, align 4
  %cmp52 = icmp eq i32 %40, 0
  br i1 %cmp52, label %if.then54, label %if.end56

if.then54:                                        ; preds = %if.then50
  %41 = load i32, i32* %level, align 4
  %inc55 = add nsw i32 %41, 1
  store i32 %inc55, i32* %level, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then54, %if.then50
  br label %while.cond

if.end57:                                         ; preds = %land.lhs.true47, %land.lhs.true41, %if.end38
  %42 = load i32, i32* %quoted, align 4
  %tobool58 = icmp ne i32 %42, 0
  br i1 %tobool58, label %if.then59, label %if.end113

if.then59:                                        ; preds = %if.end57
  %43 = load i32, i32* %c, align 4
  %44 = load i32, i32* %quoted, align 4
  %cmp60 = icmp eq i32 %43, %44
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.then59
  store i32 0, i32* %quoted, align 4
  br label %if.end63

if.end63:                                         ; preds = %if.then62, %if.then59
  %45 = load i32, i32* %quoted, align 4
  %cmp64 = icmp eq i32 %45, 34
  br i1 %cmp64, label %land.lhs.true66, label %if.end76

land.lhs.true66:                                  ; preds = %if.end63
  %46 = load i32, i32* %c, align 4
  %cmp67 = icmp eq i32 %46, 36
  br i1 %cmp67, label %land.lhs.true69, label %if.end76

land.lhs.true69:                                  ; preds = %land.lhs.true66
  %47 = load i8*, i8** %text.addr, align 4
  %48 = load i32, i32* %i, align 4
  %add70 = add nsw i32 %48, 1
  %arrayidx71 = getelementptr inbounds i8, i8* %47, i32 %add70
  %49 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %49 to i32
  %cmp73 = icmp eq i32 %conv72, 40
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %land.lhs.true69
  br label %comsub

if.end76:                                         ; preds = %land.lhs.true69, %land.lhs.true66, %if.end63
  br label %do.body77

do.body77:                                        ; preds = %if.end76
  %50 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp78 = icmp sgt i32 %50, 1
  br i1 %cmp78, label %if.then80, label %if.else109

if.then80:                                        ; preds = %do.body77
  %51 = load i8*, i8** %text.addr, align 4
  %52 = load i32, i32* %i, align 4
  %arrayidx84 = getelementptr inbounds i8, i8* %51, i32 %52
  %53 = load i8, i8* %arrayidx84, align 1
  %call85 = call i32 @is_basic(i8 signext %53)
  store i32 %call85, i32* %_f83, align 4
  %54 = load i32, i32* %_f83, align 4
  %tobool86 = icmp ne i32 %54, 0
  br i1 %tobool86, label %if.then87, label %if.else88

if.then87:                                        ; preds = %if.then80
  store i32 1, i32* %mblength82, align 4
  br label %if.end92

if.else88:                                        ; preds = %if.then80
  %55 = bitcast %struct.__mbstate_t* %state_bak81 to i8*
  %56 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %55, i8* %56, i32 8, i32 4, i1 false)
  %57 = load i8*, i8** %text.addr, align 4
  %58 = load i32, i32* %i, align 4
  %add.ptr89 = getelementptr inbounds i8, i8* %57, i32 %58
  %59 = load i32, i32* %tlen.addr, align 4
  %60 = load i32, i32* %i, align 4
  %sub90 = sub i32 %59, %60
  %call91 = call i32 @mbrlen(i8* %add.ptr89, i32 %sub90, %struct.__mbstate_t* %state)
  store i32 %call91, i32* %mblength82, align 4
  br label %if.end92

if.end92:                                         ; preds = %if.else88, %if.then87
  %61 = load i32, i32* %mblength82, align 4
  %cmp93 = icmp eq i32 %61, -2
  br i1 %cmp93, label %if.then98, label %lor.lhs.false95

lor.lhs.false95:                                  ; preds = %if.end92
  %62 = load i32, i32* %mblength82, align 4
  %cmp96 = icmp eq i32 %62, -1
  br i1 %cmp96, label %if.then98, label %if.else100

if.then98:                                        ; preds = %lor.lhs.false95, %if.end92
  %63 = bitcast %struct.__mbstate_t* %state to i8*
  %64 = bitcast %struct.__mbstate_t* %state_bak81 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %63, i8* %64, i32 8, i32 4, i1 false)
  %65 = load i32, i32* %i, align 4
  %inc99 = add nsw i32 %65, 1
  store i32 %inc99, i32* %i, align 4
  br label %if.end108

if.else100:                                       ; preds = %lor.lhs.false95
  %66 = load i32, i32* %mblength82, align 4
  %cmp101 = icmp eq i32 %66, 0
  br i1 %cmp101, label %if.then103, label %if.else105

if.then103:                                       ; preds = %if.else100
  %67 = load i32, i32* %i, align 4
  %inc104 = add nsw i32 %67, 1
  store i32 %inc104, i32* %i, align 4
  br label %if.end107

if.else105:                                       ; preds = %if.else100
  %68 = load i32, i32* %mblength82, align 4
  %69 = load i32, i32* %i, align 4
  %add106 = add i32 %69, %68
  store i32 %add106, i32* %i, align 4
  br label %if.end107

if.end107:                                        ; preds = %if.else105, %if.then103
  br label %if.end108

if.end108:                                        ; preds = %if.end107, %if.then98
  br label %if.end111

if.else109:                                       ; preds = %do.body77
  %70 = load i32, i32* %i, align 4
  %inc110 = add nsw i32 %70, 1
  store i32 %inc110, i32* %i, align 4
  br label %if.end111

if.end111:                                        ; preds = %if.else109, %if.end108
  br label %do.end112

do.end112:                                        ; preds = %if.end111
  br label %while.cond

if.end113:                                        ; preds = %if.end57
  %71 = load i32, i32* %c, align 4
  %cmp114 = icmp eq i32 %71, 34
  br i1 %cmp114, label %if.then122, label %lor.lhs.false116

lor.lhs.false116:                                 ; preds = %if.end113
  %72 = load i32, i32* %c, align 4
  %cmp117 = icmp eq i32 %72, 39
  br i1 %cmp117, label %if.then122, label %lor.lhs.false119

lor.lhs.false119:                                 ; preds = %lor.lhs.false116
  %73 = load i32, i32* %c, align 4
  %cmp120 = icmp eq i32 %73, 96
  br i1 %cmp120, label %if.then122, label %if.end124

if.then122:                                       ; preds = %lor.lhs.false119, %lor.lhs.false116, %if.end113
  %74 = load i32, i32* %c, align 4
  store i32 %74, i32* %quoted, align 4
  %75 = load i32, i32* %i, align 4
  %inc123 = add nsw i32 %75, 1
  store i32 %inc123, i32* %i, align 4
  br label %while.cond

if.end124:                                        ; preds = %lor.lhs.false119
  %76 = load i32, i32* %c, align 4
  %cmp125 = icmp eq i32 %76, 36
  br i1 %cmp125, label %land.lhs.true133, label %lor.lhs.false127

lor.lhs.false127:                                 ; preds = %if.end124
  %77 = load i32, i32* %c, align 4
  %cmp128 = icmp eq i32 %77, 60
  br i1 %cmp128, label %land.lhs.true133, label %lor.lhs.false130

lor.lhs.false130:                                 ; preds = %lor.lhs.false127
  %78 = load i32, i32* %c, align 4
  %cmp131 = icmp eq i32 %78, 62
  br i1 %cmp131, label %land.lhs.true133, label %if.end143

land.lhs.true133:                                 ; preds = %lor.lhs.false130, %lor.lhs.false127, %if.end124
  %79 = load i8*, i8** %text.addr, align 4
  %80 = load i32, i32* %i, align 4
  %add134 = add nsw i32 %80, 1
  %arrayidx135 = getelementptr inbounds i8, i8* %79, i32 %add134
  %81 = load i8, i8* %arrayidx135, align 1
  %conv136 = sext i8 %81 to i32
  %cmp137 = icmp eq i32 %conv136, 40
  br i1 %cmp137, label %if.then139, label %if.end143

if.then139:                                       ; preds = %land.lhs.true133
  br label %comsub

comsub:                                           ; preds = %if.then139, %if.then75
  %82 = load i32, i32* %i, align 4
  %add140 = add nsw i32 %82, 2
  store i32 %add140, i32* %si, align 4
  %83 = load i8*, i8** %text.addr, align 4
  %call141 = call i8* @extract_command_subst(i8* %83, i32* %si, i32 0)
  store i8* %call141, i8** %t, align 4
  %84 = load i32, i32* %si, align 4
  store i32 %84, i32* %i, align 4
  %85 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %85, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 701)
  %86 = load i32, i32* %i, align 4
  %inc142 = add nsw i32 %86, 1
  store i32 %inc142, i32* %i, align 4
  br label %while.cond

if.end143:                                        ; preds = %land.lhs.true133, %lor.lhs.false130
  %87 = load i32, i32* %c, align 4
  %88 = load i32, i32* %satisfy.addr, align 4
  %cmp144 = icmp eq i32 %87, %88
  br i1 %cmp144, label %land.lhs.true146, label %if.end213

land.lhs.true146:                                 ; preds = %if.end143
  %89 = load i32, i32* %level, align 4
  %cmp147 = icmp eq i32 %89, 0
  br i1 %cmp147, label %land.lhs.true149, label %if.end213

land.lhs.true149:                                 ; preds = %land.lhs.true146
  %90 = load i32, i32* %quoted, align 4
  %cmp150 = icmp eq i32 %90, 0
  br i1 %cmp150, label %land.lhs.true152, label %if.end213

land.lhs.true152:                                 ; preds = %land.lhs.true149
  %91 = load i32, i32* %commas, align 4
  %cmp153 = icmp sgt i32 %91, 0
  br i1 %cmp153, label %if.then155, label %if.end213

if.then155:                                       ; preds = %land.lhs.true152
  %92 = load i32, i32* %c, align 4
  %cmp156 = icmp eq i32 %92, 123
  br i1 %cmp156, label %land.lhs.true158, label %if.end212

land.lhs.true158:                                 ; preds = %if.then155
  %93 = load i32, i32* %i, align 4
  %tobool159 = icmp ne i32 %93, 0
  br i1 %tobool159, label %lor.lhs.false160, label %land.lhs.true182

lor.lhs.false160:                                 ; preds = %land.lhs.true158
  %94 = load i8*, i8** %text.addr, align 4
  %95 = load i32, i32* %i, align 4
  %sub161 = sub nsw i32 %95, 1
  %arrayidx162 = getelementptr inbounds i8, i8* %94, i32 %sub161
  %96 = load i8, i8* %arrayidx162, align 1
  %tobool163 = icmp ne i8 %96, 0
  br i1 %tobool163, label %lor.lhs.false164, label %land.lhs.true182

lor.lhs.false164:                                 ; preds = %lor.lhs.false160
  %97 = load i8*, i8** %text.addr, align 4
  %98 = load i32, i32* %i, align 4
  %sub165 = sub nsw i32 %98, 1
  %arrayidx166 = getelementptr inbounds i8, i8* %97, i32 %sub165
  %99 = load i8, i8* %arrayidx166, align 1
  %conv167 = sext i8 %99 to i32
  %cmp168 = icmp eq i32 %conv167, 32
  br i1 %cmp168, label %land.lhs.true182, label %lor.lhs.false170

lor.lhs.false170:                                 ; preds = %lor.lhs.false164
  %100 = load i8*, i8** %text.addr, align 4
  %101 = load i32, i32* %i, align 4
  %sub171 = sub nsw i32 %101, 1
  %arrayidx172 = getelementptr inbounds i8, i8* %100, i32 %sub171
  %102 = load i8, i8* %arrayidx172, align 1
  %conv173 = sext i8 %102 to i32
  %cmp174 = icmp eq i32 %conv173, 9
  br i1 %cmp174, label %land.lhs.true182, label %lor.lhs.false176

lor.lhs.false176:                                 ; preds = %lor.lhs.false170
  %103 = load i8*, i8** %text.addr, align 4
  %104 = load i32, i32* %i, align 4
  %sub177 = sub nsw i32 %104, 1
  %arrayidx178 = getelementptr inbounds i8, i8* %103, i32 %sub177
  %105 = load i8, i8* %arrayidx178, align 1
  %conv179 = sext i8 %105 to i32
  %cmp180 = icmp eq i32 %conv179, 10
  br i1 %cmp180, label %land.lhs.true182, label %if.end212

land.lhs.true182:                                 ; preds = %lor.lhs.false176, %lor.lhs.false170, %lor.lhs.false164, %lor.lhs.false160, %land.lhs.true158
  %106 = load i8*, i8** %text.addr, align 4
  %107 = load i32, i32* %i, align 4
  %add183 = add nsw i32 %107, 1
  %arrayidx184 = getelementptr inbounds i8, i8* %106, i32 %add183
  %108 = load i8, i8* %arrayidx184, align 1
  %tobool185 = icmp ne i8 %108, 0
  br i1 %tobool185, label %lor.lhs.false186, label %if.then210

lor.lhs.false186:                                 ; preds = %land.lhs.true182
  %109 = load i8*, i8** %text.addr, align 4
  %110 = load i32, i32* %i, align 4
  %add187 = add nsw i32 %110, 1
  %arrayidx188 = getelementptr inbounds i8, i8* %109, i32 %add187
  %111 = load i8, i8* %arrayidx188, align 1
  %conv189 = sext i8 %111 to i32
  %cmp190 = icmp eq i32 %conv189, 32
  br i1 %cmp190, label %if.then210, label %lor.lhs.false192

lor.lhs.false192:                                 ; preds = %lor.lhs.false186
  %112 = load i8*, i8** %text.addr, align 4
  %113 = load i32, i32* %i, align 4
  %add193 = add nsw i32 %113, 1
  %arrayidx194 = getelementptr inbounds i8, i8* %112, i32 %add193
  %114 = load i8, i8* %arrayidx194, align 1
  %conv195 = sext i8 %114 to i32
  %cmp196 = icmp eq i32 %conv195, 9
  br i1 %cmp196, label %if.then210, label %lor.lhs.false198

lor.lhs.false198:                                 ; preds = %lor.lhs.false192
  %115 = load i8*, i8** %text.addr, align 4
  %116 = load i32, i32* %i, align 4
  %add199 = add nsw i32 %116, 1
  %arrayidx200 = getelementptr inbounds i8, i8* %115, i32 %add199
  %117 = load i8, i8* %arrayidx200, align 1
  %conv201 = sext i8 %117 to i32
  %cmp202 = icmp eq i32 %conv201, 10
  br i1 %cmp202, label %if.then210, label %lor.lhs.false204

lor.lhs.false204:                                 ; preds = %lor.lhs.false198
  %118 = load i8*, i8** %text.addr, align 4
  %119 = load i32, i32* %i, align 4
  %add205 = add nsw i32 %119, 1
  %arrayidx206 = getelementptr inbounds i8, i8* %118, i32 %add205
  %120 = load i8, i8* %arrayidx206, align 1
  %conv207 = sext i8 %120 to i32
  %cmp208 = icmp eq i32 %conv207, 125
  br i1 %cmp208, label %if.then210, label %if.end212

if.then210:                                       ; preds = %lor.lhs.false204, %lor.lhs.false198, %lor.lhs.false192, %lor.lhs.false186, %land.lhs.true182
  %121 = load i32, i32* %i, align 4
  %inc211 = add nsw i32 %121, 1
  store i32 %inc211, i32* %i, align 4
  br label %while.cond

if.end212:                                        ; preds = %lor.lhs.false204, %lor.lhs.false176, %if.then155
  br label %while.end

if.end213:                                        ; preds = %land.lhs.true152, %land.lhs.true149, %land.lhs.true146, %if.end143
  %122 = load i32, i32* %c, align 4
  %cmp214 = icmp eq i32 %122, 123
  br i1 %cmp214, label %if.then216, label %if.else218

if.then216:                                       ; preds = %if.end213
  %123 = load i32, i32* %level, align 4
  %inc217 = add nsw i32 %123, 1
  store i32 %inc217, i32* %level, align 4
  br label %if.end264

if.else218:                                       ; preds = %if.end213
  %124 = load i32, i32* %c, align 4
  %cmp219 = icmp eq i32 %124, 125
  br i1 %cmp219, label %land.lhs.true221, label %if.else224

land.lhs.true221:                                 ; preds = %if.else218
  %125 = load i32, i32* %level, align 4
  %tobool222 = icmp ne i32 %125, 0
  br i1 %tobool222, label %if.then223, label %if.else224

if.then223:                                       ; preds = %land.lhs.true221
  %126 = load i32, i32* %level, align 4
  %dec = add nsw i32 %126, -1
  store i32 %dec, i32* %level, align 4
  br label %if.end263

if.else224:                                       ; preds = %land.lhs.true221, %if.else218
  %127 = load i32, i32* %satisfy.addr, align 4
  %cmp225 = icmp eq i32 %127, 125
  br i1 %cmp225, label %land.lhs.true227, label %if.else235

land.lhs.true227:                                 ; preds = %if.else224
  %128 = load i32, i32* %c, align 4
  %cmp228 = icmp eq i32 %128, 44
  br i1 %cmp228, label %land.lhs.true230, label %if.else235

land.lhs.true230:                                 ; preds = %land.lhs.true227
  %129 = load i32, i32* %level, align 4
  %cmp231 = icmp eq i32 %129, 0
  br i1 %cmp231, label %if.then233, label %if.else235

if.then233:                                       ; preds = %land.lhs.true230
  %130 = load i32, i32* %commas, align 4
  %inc234 = add nsw i32 %130, 1
  store i32 %inc234, i32* %commas, align 4
  br label %if.end262

if.else235:                                       ; preds = %land.lhs.true230, %land.lhs.true227, %if.else224
  %131 = load i32, i32* %satisfy.addr, align 4
  %cmp236 = icmp eq i32 %131, 125
  br i1 %cmp236, label %land.lhs.true238, label %if.end261

land.lhs.true238:                                 ; preds = %if.else235
  br i1 false, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true238
  br i1 true, label %land.lhs.true250, label %if.end261

cond.false:                                       ; preds = %land.lhs.true238
  %132 = load i8*, i8** %text.addr, align 4
  %133 = load i32, i32* %i, align 4
  %add.ptr239 = getelementptr inbounds i8, i8* %132, i32 %133
  %arrayidx240 = getelementptr inbounds i8, i8* %add.ptr239, i32 0
  %134 = load i8, i8* %arrayidx240, align 1
  %conv241 = sext i8 %134 to i32
  %135 = load i8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv242 = sext i8 %135 to i32
  %cmp243 = icmp eq i32 %conv241, %conv242
  br i1 %cmp243, label %land.lhs.true245, label %if.end261

land.lhs.true245:                                 ; preds = %cond.false
  %136 = load i8*, i8** %text.addr, align 4
  %137 = load i32, i32* %i, align 4
  %add.ptr246 = getelementptr inbounds i8, i8* %136, i32 %137
  %call247 = call i32 @strncmp(i8* %add.ptr246, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i32 2)
  %cmp248 = icmp eq i32 %call247, 0
  br i1 %cmp248, label %land.lhs.true250, label %if.end261

land.lhs.true250:                                 ; preds = %land.lhs.true245, %cond.true
  %138 = load i8*, i8** %text.addr, align 4
  %139 = load i32, i32* %i, align 4
  %add251 = add nsw i32 %139, 2
  %arrayidx252 = getelementptr inbounds i8, i8* %138, i32 %add251
  %140 = load i8, i8* %arrayidx252, align 1
  %conv253 = sext i8 %140 to i32
  %141 = load i32, i32* %satisfy.addr, align 4
  %cmp254 = icmp ne i32 %conv253, %141
  br i1 %cmp254, label %land.lhs.true256, label %if.end261

land.lhs.true256:                                 ; preds = %land.lhs.true250
  %142 = load i32, i32* %level, align 4
  %cmp257 = icmp eq i32 %142, 0
  br i1 %cmp257, label %if.then259, label %if.end261

if.then259:                                       ; preds = %land.lhs.true256
  %143 = load i32, i32* %commas, align 4
  %inc260 = add nsw i32 %143, 1
  store i32 %inc260, i32* %commas, align 4
  br label %if.end261

if.end261:                                        ; preds = %if.then259, %land.lhs.true256, %land.lhs.true250, %land.lhs.true245, %cond.false, %cond.true, %if.else235
  br label %if.end262

if.end262:                                        ; preds = %if.end261, %if.then233
  br label %if.end263

if.end263:                                        ; preds = %if.end262, %if.then223
  br label %if.end264

if.end264:                                        ; preds = %if.end263, %if.then216
  br label %do.body265

do.body265:                                       ; preds = %if.end264
  %144 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp266 = icmp sgt i32 %144, 1
  br i1 %cmp266, label %if.then268, label %if.else297

if.then268:                                       ; preds = %do.body265
  %145 = load i8*, i8** %text.addr, align 4
  %146 = load i32, i32* %i, align 4
  %arrayidx272 = getelementptr inbounds i8, i8* %145, i32 %146
  %147 = load i8, i8* %arrayidx272, align 1
  %call273 = call i32 @is_basic(i8 signext %147)
  store i32 %call273, i32* %_f271, align 4
  %148 = load i32, i32* %_f271, align 4
  %tobool274 = icmp ne i32 %148, 0
  br i1 %tobool274, label %if.then275, label %if.else276

if.then275:                                       ; preds = %if.then268
  store i32 1, i32* %mblength270, align 4
  br label %if.end280

if.else276:                                       ; preds = %if.then268
  %149 = bitcast %struct.__mbstate_t* %state_bak269 to i8*
  %150 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %149, i8* %150, i32 8, i32 4, i1 false)
  %151 = load i8*, i8** %text.addr, align 4
  %152 = load i32, i32* %i, align 4
  %add.ptr277 = getelementptr inbounds i8, i8* %151, i32 %152
  %153 = load i32, i32* %tlen.addr, align 4
  %154 = load i32, i32* %i, align 4
  %sub278 = sub i32 %153, %154
  %call279 = call i32 @mbrlen(i8* %add.ptr277, i32 %sub278, %struct.__mbstate_t* %state)
  store i32 %call279, i32* %mblength270, align 4
  br label %if.end280

if.end280:                                        ; preds = %if.else276, %if.then275
  %155 = load i32, i32* %mblength270, align 4
  %cmp281 = icmp eq i32 %155, -2
  br i1 %cmp281, label %if.then286, label %lor.lhs.false283

lor.lhs.false283:                                 ; preds = %if.end280
  %156 = load i32, i32* %mblength270, align 4
  %cmp284 = icmp eq i32 %156, -1
  br i1 %cmp284, label %if.then286, label %if.else288

if.then286:                                       ; preds = %lor.lhs.false283, %if.end280
  %157 = bitcast %struct.__mbstate_t* %state to i8*
  %158 = bitcast %struct.__mbstate_t* %state_bak269 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %157, i8* %158, i32 8, i32 4, i1 false)
  %159 = load i32, i32* %i, align 4
  %inc287 = add nsw i32 %159, 1
  store i32 %inc287, i32* %i, align 4
  br label %if.end296

if.else288:                                       ; preds = %lor.lhs.false283
  %160 = load i32, i32* %mblength270, align 4
  %cmp289 = icmp eq i32 %160, 0
  br i1 %cmp289, label %if.then291, label %if.else293

if.then291:                                       ; preds = %if.else288
  %161 = load i32, i32* %i, align 4
  %inc292 = add nsw i32 %161, 1
  store i32 %inc292, i32* %i, align 4
  br label %if.end295

if.else293:                                       ; preds = %if.else288
  %162 = load i32, i32* %mblength270, align 4
  %163 = load i32, i32* %i, align 4
  %add294 = add i32 %163, %162
  store i32 %add294, i32* %i, align 4
  br label %if.end295

if.end295:                                        ; preds = %if.else293, %if.then291
  br label %if.end296

if.end296:                                        ; preds = %if.end295, %if.then286
  br label %if.end299

if.else297:                                       ; preds = %do.body265
  %164 = load i32, i32* %i, align 4
  %inc298 = add nsw i32 %164, 1
  store i32 %inc298, i32* %i, align 4
  br label %if.end299

if.end299:                                        ; preds = %if.else297, %if.end296
  br label %do.end300

do.end300:                                        ; preds = %if.end299
  br label %while.cond

while.end:                                        ; preds = %if.end212, %while.cond
  %165 = load i32, i32* %i, align 4
  %166 = load i32*, i32** %indx.addr, align 4
  store i32 %165, i32* %166, align 4
  %167 = load i32, i32* %c, align 4
  ret i32 %167
}

declare i8* @sh_xmalloc(i32, i8*, i32) #2

declare i8* @strncpy(i8*, i8*, i32) #2

declare void @sh_xfree(i8*, i8*, i32) #2

declare i8* @strcpy(i8*, i8*) #2

declare i8* @substring(i8*, i32, i32) #2

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
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture writeonly, i8* nocapture readonly, i32, i32, i1) #1

declare i32 @mbrlen(i8*, i32, %struct.__mbstate_t*) #2

; Function Attrs: noinline nounwind
define internal i8** @expand_seqterm(i8* %text, i32 %tlen) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %tlen.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  %lhs = alloca i8*, align 4
  %rhs = alloca i8*, align 4
  %i = alloca i32, align 4
  %lhs_t = alloca i32, align 4
  %rhs_t = alloca i32, align 4
  %lhs_l = alloca i32, align 4
  %rhs_l = alloca i32, align 4
  %width = alloca i32, align 4
  %lhs_v = alloca i64, align 8
  %rhs_v = alloca i64, align 8
  %incr = alloca i64, align 8
  %tl = alloca i64, align 8
  %tr = alloca i64, align 8
  %result = alloca i8**, align 4
  %ep = alloca i8*, align 4
  %oep = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %tlen, i32* %tlen.addr, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %call = call i8* @strstr(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call, i8** %t, align 4
  %1 = load i8*, i8** %t, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8** null, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %t, align 4
  %3 = load i8*, i8** %text.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %2 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %3 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %lhs_l, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %lhs_l, align 4
  %call1 = call i8* @substring(i8* %4, i32 0, i32 %5)
  store i8* %call1, i8** %lhs, align 4
  %6 = load i8*, i8** %text.addr, align 4
  %7 = load i32, i32* %lhs_l, align 4
  %add = add i32 %7, 3
  %sub = sub i32 %add, 1
  %8 = load i32, i32* %tlen.addr, align 4
  %call2 = call i8* @substring(i8* %6, i32 %sub, i32 %8)
  store i8* %call2, i8** %rhs, align 4
  %9 = load i8*, i8** %lhs, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %10 to i32
  %cmp3 = icmp eq i32 %conv, 0
  br i1 %cmp3, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %11 = load i8*, i8** %rhs, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %12 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %lor.lhs.false, %if.end
  %13 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 512)
  %14 = load i8*, i8** %rhs, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 513)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end10:                                         ; preds = %lor.lhs.false
  %15 = load i8*, i8** %lhs, align 4
  %call11 = call i32 @legal_number(i8* %15, i64* %tl)
  %tobool = icmp ne i32 %call11, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end10
  br label %cond.end

cond.false:                                       ; preds = %if.end10
  %16 = load i8*, i8** %lhs, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx12, align 1
  %conv13 = zext i8 %17 to i32
  %call14 = call i32 @isalpha(i32 %conv13) #4
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %cond.false
  %18 = load i8*, i8** %lhs, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %19 to i32
  %cmp18 = icmp eq i32 %conv17, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %cond.false
  %20 = phi i1 [ false, %cond.false ], [ %cmp18, %land.rhs ]
  %cond = select i1 %20, i32 2, i32 0
  br label %cond.end

cond.end:                                         ; preds = %land.end, %cond.true
  %cond20 = phi i32 [ 1, %cond.true ], [ %cond, %land.end ]
  store i32 %cond20, i32* %lhs_t, align 4
  store i8* null, i8** %ep, align 4
  %21 = load i8*, i8** %rhs, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %21, i32 0
  %22 = load i8, i8* %arrayidx21, align 1
  %conv22 = zext i8 %22 to i32
  %call23 = call i32 @isdigit(i32 %conv22) #4
  %tobool24 = icmp ne i32 %call23, 0
  br i1 %tobool24, label %if.then39, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %cond.end
  %23 = load i8*, i8** %rhs, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx26, align 1
  %conv27 = sext i8 %24 to i32
  %cmp28 = icmp eq i32 %conv27, 43
  br i1 %cmp28, label %land.lhs.true, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false25
  %25 = load i8*, i8** %rhs, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %26 to i32
  %cmp33 = icmp eq i32 %conv32, 45
  br i1 %cmp33, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %lor.lhs.false30, %lor.lhs.false25
  %27 = load i8*, i8** %rhs, align 4
  %arrayidx35 = getelementptr inbounds i8, i8* %27, i32 1
  %28 = load i8, i8* %arrayidx35, align 1
  %conv36 = zext i8 %28 to i32
  %call37 = call i32 @isdigit(i32 %conv36) #4
  %tobool38 = icmp ne i32 %call37, 0
  br i1 %tobool38, label %if.then39, label %if.else

if.then39:                                        ; preds = %land.lhs.true, %cond.end
  store i32 1, i32* %rhs_t, align 4
  %call40 = call i32* @__errno_location()
  store i32 0, i32* %call40, align 4
  %29 = load i8*, i8** %rhs, align 4
  %call41 = call i64 @strtoimax(i8* %29, i8** %ep, i32 10)
  store i64 %call41, i64* %tr, align 8
  %call42 = call i32* @__errno_location()
  %30 = load i32, i32* %call42, align 4
  %cmp43 = icmp eq i32 %30, 34
  br i1 %cmp43, label %if.then55, label %lor.lhs.false45

lor.lhs.false45:                                  ; preds = %if.then39
  %31 = load i8*, i8** %ep, align 4
  %tobool46 = icmp ne i8* %31, null
  br i1 %tobool46, label %land.lhs.true47, label %if.end56

land.lhs.true47:                                  ; preds = %lor.lhs.false45
  %32 = load i8*, i8** %ep, align 4
  %33 = load i8, i8* %32, align 1
  %conv48 = sext i8 %33 to i32
  %cmp49 = icmp ne i32 %conv48, 0
  br i1 %cmp49, label %land.lhs.true51, label %if.end56

land.lhs.true51:                                  ; preds = %land.lhs.true47
  %34 = load i8*, i8** %ep, align 4
  %35 = load i8, i8* %34, align 1
  %conv52 = sext i8 %35 to i32
  %cmp53 = icmp ne i32 %conv52, 46
  br i1 %cmp53, label %if.then55, label %if.end56

if.then55:                                        ; preds = %land.lhs.true51, %if.then39
  store i32 0, i32* %rhs_t, align 4
  br label %if.end56

if.end56:                                         ; preds = %if.then55, %land.lhs.true51, %land.lhs.true47, %lor.lhs.false45
  br label %if.end74

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false30
  %36 = load i8*, i8** %rhs, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %36, i32 0
  %37 = load i8, i8* %arrayidx57, align 1
  %conv58 = zext i8 %37 to i32
  %call59 = call i32 @isalpha(i32 %conv58) #4
  %tobool60 = icmp ne i32 %call59, 0
  br i1 %tobool60, label %land.lhs.true61, label %if.else72

land.lhs.true61:                                  ; preds = %if.else
  %38 = load i8*, i8** %rhs, align 4
  %arrayidx62 = getelementptr inbounds i8, i8* %38, i32 1
  %39 = load i8, i8* %arrayidx62, align 1
  %conv63 = sext i8 %39 to i32
  %cmp64 = icmp eq i32 %conv63, 0
  br i1 %cmp64, label %if.then71, label %lor.lhs.false66

lor.lhs.false66:                                  ; preds = %land.lhs.true61
  %40 = load i8*, i8** %rhs, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %40, i32 1
  %41 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %41 to i32
  %cmp69 = icmp eq i32 %conv68, 46
  br i1 %cmp69, label %if.then71, label %if.else72

if.then71:                                        ; preds = %lor.lhs.false66, %land.lhs.true61
  store i32 2, i32* %rhs_t, align 4
  %42 = load i8*, i8** %rhs, align 4
  %add.ptr = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %add.ptr, i8** %ep, align 4
  br label %if.end73

if.else72:                                        ; preds = %lor.lhs.false66, %if.else
  store i32 0, i32* %rhs_t, align 4
  store i8* null, i8** %ep, align 4
  br label %if.end73

if.end73:                                         ; preds = %if.else72, %if.then71
  br label %if.end74

if.end74:                                         ; preds = %if.end73, %if.end56
  store i64 1, i64* %incr, align 8
  %43 = load i32, i32* %rhs_t, align 4
  %cmp75 = icmp ne i32 %43, 0
  br i1 %cmp75, label %if.then77, label %if.end110

if.then77:                                        ; preds = %if.end74
  %44 = load i8*, i8** %ep, align 4
  store i8* %44, i8** %oep, align 4
  %call78 = call i32* @__errno_location()
  store i32 0, i32* %call78, align 4
  %45 = load i8*, i8** %ep, align 4
  %tobool79 = icmp ne i8* %45, null
  br i1 %tobool79, label %land.lhs.true80, label %if.end96

land.lhs.true80:                                  ; preds = %if.then77
  %46 = load i8*, i8** %ep, align 4
  %47 = load i8, i8* %46, align 1
  %conv81 = sext i8 %47 to i32
  %cmp82 = icmp eq i32 %conv81, 46
  br i1 %cmp82, label %land.lhs.true84, label %if.end96

land.lhs.true84:                                  ; preds = %land.lhs.true80
  %48 = load i8*, i8** %ep, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %48, i32 1
  %49 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %49 to i32
  %cmp87 = icmp eq i32 %conv86, 46
  br i1 %cmp87, label %land.lhs.true89, label %if.end96

land.lhs.true89:                                  ; preds = %land.lhs.true84
  %50 = load i8*, i8** %ep, align 4
  %arrayidx90 = getelementptr inbounds i8, i8* %50, i32 2
  %51 = load i8, i8* %arrayidx90, align 1
  %conv91 = sext i8 %51 to i32
  %tobool92 = icmp ne i32 %conv91, 0
  br i1 %tobool92, label %if.then93, label %if.end96

if.then93:                                        ; preds = %land.lhs.true89
  %52 = load i8*, i8** %ep, align 4
  %add.ptr94 = getelementptr inbounds i8, i8* %52, i32 2
  %call95 = call i64 @strtoimax(i8* %add.ptr94, i8** %ep, i32 10)
  store i64 %call95, i64* %incr, align 8
  br label %if.end96

if.end96:                                         ; preds = %if.then93, %land.lhs.true89, %land.lhs.true84, %land.lhs.true80, %if.then77
  %53 = load i8*, i8** %ep, align 4
  %54 = load i8, i8* %53, align 1
  %conv97 = sext i8 %54 to i32
  %cmp98 = icmp ne i32 %conv97, 0
  br i1 %cmp98, label %if.then104, label %lor.lhs.false100

lor.lhs.false100:                                 ; preds = %if.end96
  %call101 = call i32* @__errno_location()
  %55 = load i32, i32* %call101, align 4
  %cmp102 = icmp eq i32 %55, 34
  br i1 %cmp102, label %if.then104, label %if.end105

if.then104:                                       ; preds = %lor.lhs.false100, %if.end96
  store i32 0, i32* %rhs_t, align 4
  br label %if.end105

if.end105:                                        ; preds = %if.then104, %lor.lhs.false100
  %56 = load i8*, i8** %ep, align 4
  %57 = load i8*, i8** %oep, align 4
  %sub.ptr.lhs.cast106 = ptrtoint i8* %56 to i32
  %sub.ptr.rhs.cast107 = ptrtoint i8* %57 to i32
  %sub.ptr.sub108 = sub i32 %sub.ptr.lhs.cast106, %sub.ptr.rhs.cast107
  %58 = load i32, i32* %tlen.addr, align 4
  %sub109 = sub i32 %58, %sub.ptr.sub108
  store i32 %sub109, i32* %tlen.addr, align 4
  br label %if.end110

if.end110:                                        ; preds = %if.end105, %if.end74
  %59 = load i32, i32* %lhs_t, align 4
  %60 = load i32, i32* %rhs_t, align 4
  %cmp111 = icmp ne i32 %59, %60
  br i1 %cmp111, label %if.then119, label %lor.lhs.false113

lor.lhs.false113:                                 ; preds = %if.end110
  %61 = load i32, i32* %lhs_t, align 4
  %cmp114 = icmp eq i32 %61, 0
  br i1 %cmp114, label %if.then119, label %lor.lhs.false116

lor.lhs.false116:                                 ; preds = %lor.lhs.false113
  %62 = load i32, i32* %rhs_t, align 4
  %cmp117 = icmp eq i32 %62, 0
  br i1 %cmp117, label %if.then119, label %if.end120

if.then119:                                       ; preds = %lor.lhs.false116, %lor.lhs.false113, %if.end110
  %63 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %63, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 558)
  %64 = load i8*, i8** %rhs, align 4
  call void @sh_xfree(i8* %64, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 559)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end120:                                        ; preds = %lor.lhs.false116
  %65 = load i32, i32* %lhs_t, align 4
  %cmp121 = icmp eq i32 %65, 2
  br i1 %cmp121, label %if.then123, label %if.else128

if.then123:                                       ; preds = %if.end120
  %66 = load i8*, i8** %lhs, align 4
  %arrayidx124 = getelementptr inbounds i8, i8* %66, i32 0
  %67 = load i8, i8* %arrayidx124, align 1
  %conv125 = zext i8 %67 to i64
  store i64 %conv125, i64* %lhs_v, align 8
  %68 = load i8*, i8** %rhs, align 4
  %arrayidx126 = getelementptr inbounds i8, i8* %68, i32 0
  %69 = load i8, i8* %arrayidx126, align 1
  %conv127 = zext i8 %69 to i64
  store i64 %conv127, i64* %rhs_v, align 8
  store i32 1, i32* %width, align 4
  br label %if.end198

if.else128:                                       ; preds = %if.end120
  %70 = load i64, i64* %tl, align 8
  store i64 %70, i64* %lhs_v, align 8
  %71 = load i64, i64* %tr, align 8
  store i64 %71, i64* %rhs_v, align 8
  %72 = load i32, i32* %tlen.addr, align 4
  %73 = load i32, i32* %lhs_l, align 4
  %sub129 = sub i32 %72, %73
  %sub130 = sub i32 %sub129, 3
  %add131 = add i32 %sub130, 1
  store i32 %add131, i32* %rhs_l, align 4
  store i32 0, i32* %width, align 4
  %74 = load i32, i32* %lhs_l, align 4
  %cmp132 = icmp sgt i32 %74, 1
  br i1 %cmp132, label %land.lhs.true134, label %if.end140

land.lhs.true134:                                 ; preds = %if.else128
  %75 = load i8*, i8** %lhs, align 4
  %arrayidx135 = getelementptr inbounds i8, i8* %75, i32 0
  %76 = load i8, i8* %arrayidx135, align 1
  %conv136 = sext i8 %76 to i32
  %cmp137 = icmp eq i32 %conv136, 48
  br i1 %cmp137, label %if.then139, label %if.end140

if.then139:                                       ; preds = %land.lhs.true134
  %77 = load i32, i32* %lhs_l, align 4
  store i32 %77, i32* %width, align 4
  store i32 3, i32* %lhs_t, align 4
  br label %if.end140

if.end140:                                        ; preds = %if.then139, %land.lhs.true134, %if.else128
  %78 = load i32, i32* %lhs_l, align 4
  %cmp141 = icmp sgt i32 %78, 2
  br i1 %cmp141, label %land.lhs.true143, label %if.end154

land.lhs.true143:                                 ; preds = %if.end140
  %79 = load i8*, i8** %lhs, align 4
  %arrayidx144 = getelementptr inbounds i8, i8* %79, i32 0
  %80 = load i8, i8* %arrayidx144, align 1
  %conv145 = sext i8 %80 to i32
  %cmp146 = icmp eq i32 %conv145, 45
  br i1 %cmp146, label %land.lhs.true148, label %if.end154

land.lhs.true148:                                 ; preds = %land.lhs.true143
  %81 = load i8*, i8** %lhs, align 4
  %arrayidx149 = getelementptr inbounds i8, i8* %81, i32 1
  %82 = load i8, i8* %arrayidx149, align 1
  %conv150 = sext i8 %82 to i32
  %cmp151 = icmp eq i32 %conv150, 48
  br i1 %cmp151, label %if.then153, label %if.end154

if.then153:                                       ; preds = %land.lhs.true148
  %83 = load i32, i32* %lhs_l, align 4
  store i32 %83, i32* %width, align 4
  store i32 3, i32* %lhs_t, align 4
  br label %if.end154

if.end154:                                        ; preds = %if.then153, %land.lhs.true148, %land.lhs.true143, %if.end140
  %84 = load i32, i32* %rhs_l, align 4
  %cmp155 = icmp sgt i32 %84, 1
  br i1 %cmp155, label %land.lhs.true157, label %if.end166

land.lhs.true157:                                 ; preds = %if.end154
  %85 = load i8*, i8** %rhs, align 4
  %arrayidx158 = getelementptr inbounds i8, i8* %85, i32 0
  %86 = load i8, i8* %arrayidx158, align 1
  %conv159 = sext i8 %86 to i32
  %cmp160 = icmp eq i32 %conv159, 48
  br i1 %cmp160, label %land.lhs.true162, label %if.end166

land.lhs.true162:                                 ; preds = %land.lhs.true157
  %87 = load i32, i32* %width, align 4
  %88 = load i32, i32* %rhs_l, align 4
  %cmp163 = icmp slt i32 %87, %88
  br i1 %cmp163, label %if.then165, label %if.end166

if.then165:                                       ; preds = %land.lhs.true162
  %89 = load i32, i32* %rhs_l, align 4
  store i32 %89, i32* %width, align 4
  store i32 3, i32* %lhs_t, align 4
  br label %if.end166

if.end166:                                        ; preds = %if.then165, %land.lhs.true162, %land.lhs.true157, %if.end154
  %90 = load i32, i32* %rhs_l, align 4
  %cmp167 = icmp sgt i32 %90, 2
  br i1 %cmp167, label %land.lhs.true169, label %if.end183

land.lhs.true169:                                 ; preds = %if.end166
  %91 = load i8*, i8** %rhs, align 4
  %arrayidx170 = getelementptr inbounds i8, i8* %91, i32 0
  %92 = load i8, i8* %arrayidx170, align 1
  %conv171 = sext i8 %92 to i32
  %cmp172 = icmp eq i32 %conv171, 45
  br i1 %cmp172, label %land.lhs.true174, label %if.end183

land.lhs.true174:                                 ; preds = %land.lhs.true169
  %93 = load i8*, i8** %rhs, align 4
  %arrayidx175 = getelementptr inbounds i8, i8* %93, i32 1
  %94 = load i8, i8* %arrayidx175, align 1
  %conv176 = sext i8 %94 to i32
  %cmp177 = icmp eq i32 %conv176, 48
  br i1 %cmp177, label %land.lhs.true179, label %if.end183

land.lhs.true179:                                 ; preds = %land.lhs.true174
  %95 = load i32, i32* %width, align 4
  %96 = load i32, i32* %rhs_l, align 4
  %cmp180 = icmp slt i32 %95, %96
  br i1 %cmp180, label %if.then182, label %if.end183

if.then182:                                       ; preds = %land.lhs.true179
  %97 = load i32, i32* %rhs_l, align 4
  store i32 %97, i32* %width, align 4
  store i32 3, i32* %lhs_t, align 4
  br label %if.end183

if.end183:                                        ; preds = %if.then182, %land.lhs.true179, %land.lhs.true174, %land.lhs.true169, %if.end166
  %98 = load i32, i32* %width, align 4
  %99 = load i32, i32* %lhs_l, align 4
  %cmp184 = icmp slt i32 %98, %99
  br i1 %cmp184, label %land.lhs.true186, label %if.end190

land.lhs.true186:                                 ; preds = %if.end183
  %100 = load i32, i32* %lhs_t, align 4
  %cmp187 = icmp eq i32 %100, 3
  br i1 %cmp187, label %if.then189, label %if.end190

if.then189:                                       ; preds = %land.lhs.true186
  %101 = load i32, i32* %lhs_l, align 4
  store i32 %101, i32* %width, align 4
  br label %if.end190

if.end190:                                        ; preds = %if.then189, %land.lhs.true186, %if.end183
  %102 = load i32, i32* %width, align 4
  %103 = load i32, i32* %rhs_l, align 4
  %cmp191 = icmp slt i32 %102, %103
  br i1 %cmp191, label %land.lhs.true193, label %if.end197

land.lhs.true193:                                 ; preds = %if.end190
  %104 = load i32, i32* %lhs_t, align 4
  %cmp194 = icmp eq i32 %104, 3
  br i1 %cmp194, label %if.then196, label %if.end197

if.then196:                                       ; preds = %land.lhs.true193
  %105 = load i32, i32* %rhs_l, align 4
  store i32 %105, i32* %width, align 4
  br label %if.end197

if.end197:                                        ; preds = %if.then196, %land.lhs.true193, %if.end190
  br label %if.end198

if.end198:                                        ; preds = %if.end197, %if.then123
  %106 = load i64, i64* %lhs_v, align 8
  %107 = load i64, i64* %rhs_v, align 8
  %108 = load i64, i64* %incr, align 8
  %109 = load i32, i32* %lhs_t, align 4
  %110 = load i32, i32* %width, align 4
  %call199 = call i8** @mkseq(i64 %106, i64 %107, i64 %108, i32 %109, i32 %110)
  store i8** %call199, i8*** %result, align 4
  %111 = load i8*, i8** %lhs, align 4
  call void @sh_xfree(i8* %111, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 598)
  %112 = load i8*, i8** %rhs, align 4
  call void @sh_xfree(i8* %112, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 599)
  %113 = load i8**, i8*** %result, align 4
  store i8** %113, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end198, %if.then119, %if.then9, %if.then
  %114 = load i8**, i8*** %retval, align 4
  ret i8** %114
}

declare i8** @strvec_create(i32) #2

; Function Attrs: noinline nounwind
define internal i8** @expand_amble(i8* %text, i32 %tlen, i32 %flags) #0 {
entry:
  %retval = alloca i8**, align 4
  %text.addr = alloca i8*, align 4
  %tlen.addr = alloca i32, align 4
  %flags.addr = alloca i32, align 4
  %result = alloca i8**, align 4
  %partial = alloca i8**, align 4
  %tresult = alloca i8**, align 4
  %tem = alloca i8*, align 4
  %start = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %state = alloca %struct.__mbstate_t, align 4
  %lr = alloca i32, align 4
  %lp = alloca i32, align 4
  %j = alloca i32, align 4
  %state_bak = alloca %struct.__mbstate_t, align 4
  %mblength = alloca i32, align 4
  %_f = alloca i32, align 4
  store i8* %text, i8** %text.addr, align 4
  store i32 %tlen, i32* %tlen.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 8, i32 4, i1 false)
  store i8** null, i8*** %result, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %start, align 4
  store i32 1, i32* %c, align 4
  br label %while.cond

while.cond:                                       ; preds = %do.end, %entry
  %1 = load i32, i32* %c, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %text.addr, align 4
  %3 = load i32, i32* %tlen.addr, align 4
  %call = call i32 @brace_gobbler(i8* %2, i32 %3, i32* %i, i32 44)
  store i32 %call, i32* %c, align 4
  %4 = load i8*, i8** %text.addr, align 4
  %5 = load i32, i32* %start, align 4
  %6 = load i32, i32* %i, align 4
  %call1 = call i8* @substring(i8* %4, i32 %5, i32 %6)
  store i8* %call1, i8** %tem, align 4
  %7 = load i8*, i8** %tem, align 4
  %call2 = call i8** @brace_expand(i8* %7)
  store i8** %call2, i8*** %partial, align 4
  %8 = load i8**, i8*** %result, align 4
  %tobool3 = icmp ne i8** %8, null
  br i1 %tobool3, label %if.else, label %if.then

if.then:                                          ; preds = %while.body
  %9 = load i8**, i8*** %partial, align 4
  store i8** %9, i8*** %result, align 4
  br label %if.end16

if.else:                                          ; preds = %while.body
  %10 = load i8**, i8*** %result, align 4
  %call4 = call i32 @strvec_len(i8** %10)
  store i32 %call4, i32* %lr, align 4
  %11 = load i8**, i8*** %partial, align 4
  %call5 = call i32 @strvec_len(i8** %11)
  store i32 %call5, i32* %lp, align 4
  %12 = load i8**, i8*** %result, align 4
  %13 = load i32, i32* %lp, align 4
  %14 = load i32, i32* %lr, align 4
  %add = add nsw i32 %13, %14
  %add6 = add nsw i32 %add, 1
  %call7 = call i8** @strvec_mresize(i8** %12, i32 %add6)
  store i8** %call7, i8*** %tresult, align 4
  %15 = load i8**, i8*** %tresult, align 4
  %cmp = icmp eq i8** %15, null
  br i1 %cmp, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else
  %call9 = call i8* @libintl_gettext(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.1, i32 0, i32 0))
  %16 = load i8*, i8** %tem, align 4
  call void (i8*, ...) @internal_error(i8* %call9, i8* %16)
  %17 = load i8*, i8** %tem, align 4
  call void @sh_xfree(i8* %17, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 330)
  %18 = load i8**, i8*** %partial, align 4
  call void @strvec_dispose(i8** %18)
  %19 = load i8**, i8*** %result, align 4
  call void @strvec_dispose(i8** %19)
  store i8** null, i8*** %result, align 4
  %20 = load i8**, i8*** %result, align 4
  store i8** %20, i8*** %retval, align 4
  br label %return

if.else10:                                        ; preds = %if.else
  %21 = load i8**, i8*** %tresult, align 4
  store i8** %21, i8*** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else10
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %22 = load i32, i32* %j, align 4
  %23 = load i32, i32* %lp, align 4
  %cmp11 = icmp slt i32 %22, %23
  br i1 %cmp11, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %24 = load i8**, i8*** %partial, align 4
  %25 = load i32, i32* %j, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %24, i32 %25
  %26 = load i8*, i8** %arrayidx, align 4
  %27 = load i8**, i8*** %result, align 4
  %28 = load i32, i32* %lr, align 4
  %29 = load i32, i32* %j, align 4
  %add12 = add nsw i32 %28, %29
  %arrayidx13 = getelementptr inbounds i8*, i8** %27, i32 %add12
  store i8* %26, i8** %arrayidx13, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %30 = load i32, i32* %j, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %31 = load i8**, i8*** %result, align 4
  %32 = load i32, i32* %lr, align 4
  %33 = load i32, i32* %j, align 4
  %add14 = add nsw i32 %32, %33
  %arrayidx15 = getelementptr inbounds i8*, i8** %31, i32 %add14
  store i8* null, i8** %arrayidx15, align 4
  %34 = load i8**, i8*** %partial, align 4
  %35 = bitcast i8** %34 to i8*
  call void @sh_xfree(i8* %35, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 343)
  br label %if.end16

if.end16:                                         ; preds = %for.end, %if.then
  %36 = load i8*, i8** %tem, align 4
  call void @sh_xfree(i8* %36, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 345)
  br label %do.body

do.body:                                          ; preds = %if.end16
  %37 = load i32, i32* @locale_mb_cur_max, align 4
  %cmp17 = icmp sgt i32 %37, 1
  br i1 %cmp17, label %if.then18, label %if.else38

if.then18:                                        ; preds = %do.body
  %38 = load i8*, i8** %text.addr, align 4
  %39 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %38, i32 %39
  %40 = load i8, i8* %arrayidx19, align 1
  %call20 = call i32 @is_basic(i8 signext %40)
  store i32 %call20, i32* %_f, align 4
  %41 = load i32, i32* %_f, align 4
  %tobool21 = icmp ne i32 %41, 0
  br i1 %tobool21, label %if.then22, label %if.else23

if.then22:                                        ; preds = %if.then18
  store i32 1, i32* %mblength, align 4
  br label %if.end25

if.else23:                                        ; preds = %if.then18
  %42 = bitcast %struct.__mbstate_t* %state_bak to i8*
  %43 = bitcast %struct.__mbstate_t* %state to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %42, i8* %43, i32 8, i32 4, i1 false)
  %44 = load i8*, i8** %text.addr, align 4
  %45 = load i32, i32* %i, align 4
  %add.ptr = getelementptr inbounds i8, i8* %44, i32 %45
  %46 = load i32, i32* %tlen.addr, align 4
  %47 = load i32, i32* %i, align 4
  %sub = sub i32 %46, %47
  %call24 = call i32 @mbrlen(i8* %add.ptr, i32 %sub, %struct.__mbstate_t* %state)
  store i32 %call24, i32* %mblength, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then22
  %48 = load i32, i32* %mblength, align 4
  %cmp26 = icmp eq i32 %48, -2
  br i1 %cmp26, label %if.then28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end25
  %49 = load i32, i32* %mblength, align 4
  %cmp27 = icmp eq i32 %49, -1
  br i1 %cmp27, label %if.then28, label %if.else30

if.then28:                                        ; preds = %lor.lhs.false, %if.end25
  %50 = bitcast %struct.__mbstate_t* %state to i8*
  %51 = bitcast %struct.__mbstate_t* %state_bak to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %50, i8* %51, i32 8, i32 4, i1 false)
  %52 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %52, 1
  store i32 %inc29, i32* %i, align 4
  br label %if.end37

if.else30:                                        ; preds = %lor.lhs.false
  %53 = load i32, i32* %mblength, align 4
  %cmp31 = icmp eq i32 %53, 0
  br i1 %cmp31, label %if.then32, label %if.else34

if.then32:                                        ; preds = %if.else30
  %54 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %54, 1
  store i32 %inc33, i32* %i, align 4
  br label %if.end36

if.else34:                                        ; preds = %if.else30
  %55 = load i32, i32* %mblength, align 4
  %56 = load i32, i32* %i, align 4
  %add35 = add i32 %56, %55
  store i32 %add35, i32* %i, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.else34, %if.then32
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then28
  br label %if.end40

if.else38:                                        ; preds = %do.body
  %57 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %57, 1
  store i32 %inc39, i32* %i, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.else38, %if.end37
  br label %do.end

do.end:                                           ; preds = %if.end40
  %58 = load i32, i32* %i, align 4
  store i32 %58, i32* %start, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %59 = load i8**, i8*** %result, align 4
  store i8** %59, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then8
  %60 = load i8**, i8*** %retval, align 4
  ret i8** %60
}

; Function Attrs: noinline nounwind
define internal i8** @array_concat(i8** %arr1, i8** %arr2) #0 {
entry:
  %retval = alloca i8**, align 4
  %arr1.addr = alloca i8**, align 4
  %arr2.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %len = alloca i32, align 4
  %len1 = alloca i32, align 4
  %len2 = alloca i32, align 4
  %result = alloca i8**, align 4
  %strlen_1 = alloca i32, align 4
  store i8** %arr1, i8*** %arr1.addr, align 4
  store i8** %arr2, i8*** %arr2.addr, align 4
  %0 = load i8**, i8*** %arr1.addr, align 4
  %cmp = icmp eq i8** %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8**, i8*** %arr2.addr, align 4
  store i8** %1, i8*** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8**, i8*** %arr2.addr, align 4
  %cmp1 = icmp eq i8** %2, null
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  %3 = load i8**, i8*** %arr1.addr, align 4
  store i8** %3, i8*** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %4 = load i8**, i8*** %arr1.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %4, i32 0
  %5 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end3
  %6 = load i8**, i8*** %arr1.addr, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i32 0
  %7 = load i8*, i8** %arrayidx4, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx5, align 1
  %conv = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv, 0
  br i1 %cmp6, label %land.lhs.true8, label %if.end13

land.lhs.true8:                                   ; preds = %land.lhs.true
  %9 = load i8**, i8*** %arr1.addr, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %9, i32 1
  %10 = load i8*, i8** %arrayidx9, align 4
  %cmp10 = icmp eq i8* %10, null
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %land.lhs.true8
  %11 = load i8**, i8*** %arr1.addr, align 4
  call void @strvec_dispose(i8** %11)
  %12 = load i8**, i8*** %arr2.addr, align 4
  store i8** %12, i8*** %retval, align 4
  br label %return

if.end13:                                         ; preds = %land.lhs.true8, %land.lhs.true, %if.end3
  %13 = load i8**, i8*** %arr2.addr, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %13, i32 0
  %14 = load i8*, i8** %arrayidx14, align 4
  %tobool15 = icmp ne i8* %14, null
  br i1 %tobool15, label %land.lhs.true16, label %if.end27

land.lhs.true16:                                  ; preds = %if.end13
  %15 = load i8**, i8*** %arr2.addr, align 4
  %arrayidx17 = getelementptr inbounds i8*, i8** %15, i32 0
  %16 = load i8*, i8** %arrayidx17, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %17 to i32
  %cmp20 = icmp eq i32 %conv19, 0
  br i1 %cmp20, label %land.lhs.true22, label %if.end27

land.lhs.true22:                                  ; preds = %land.lhs.true16
  %18 = load i8**, i8*** %arr2.addr, align 4
  %arrayidx23 = getelementptr inbounds i8*, i8** %18, i32 1
  %19 = load i8*, i8** %arrayidx23, align 4
  %cmp24 = icmp eq i8* %19, null
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %land.lhs.true22
  %20 = load i8**, i8*** %arr1.addr, align 4
  store i8** %20, i8*** %retval, align 4
  br label %return

if.end27:                                         ; preds = %land.lhs.true22, %land.lhs.true16, %if.end13
  %21 = load i8**, i8*** %arr1.addr, align 4
  %call = call i32 @strvec_len(i8** %21)
  store i32 %call, i32* %len1, align 4
  %22 = load i8**, i8*** %arr2.addr, align 4
  %call28 = call i32 @strvec_len(i8** %22)
  store i32 %call28, i32* %len2, align 4
  %23 = load i32, i32* %len1, align 4
  %24 = load i32, i32* %len2, align 4
  %mul = mul nsw i32 %23, %24
  %add = add nsw i32 1, %mul
  %mul29 = mul i32 %add, 4
  %call30 = call i8* @sh_xmalloc(i32 %mul29, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 793)
  %25 = bitcast i8* %call30 to i8**
  store i8** %25, i8*** %result, align 4
  store i32 0, i32* %len, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc53, %if.end27
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %len1, align 4
  %cmp31 = icmp slt i32 %26, %27
  br i1 %cmp31, label %for.body, label %for.end55

for.body:                                         ; preds = %for.cond
  %28 = load i8**, i8*** %arr1.addr, align 4
  %29 = load i32, i32* %i, align 4
  %arrayidx33 = getelementptr inbounds i8*, i8** %28, i32 %29
  %30 = load i8*, i8** %arrayidx33, align 4
  %call34 = call i32 @strlen(i8* %30)
  store i32 %call34, i32* %strlen_1, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc, %for.body
  %31 = load i32, i32* %j, align 4
  %32 = load i32, i32* %len2, align 4
  %cmp36 = icmp slt i32 %31, %32
  br i1 %cmp36, label %for.body38, label %for.end

for.body38:                                       ; preds = %for.cond35
  %33 = load i32, i32* %strlen_1, align 4
  %add39 = add nsw i32 1, %33
  %34 = load i8**, i8*** %arr2.addr, align 4
  %35 = load i32, i32* %j, align 4
  %arrayidx40 = getelementptr inbounds i8*, i8** %34, i32 %35
  %36 = load i8*, i8** %arrayidx40, align 4
  %call41 = call i32 @strlen(i8* %36)
  %add42 = add i32 %add39, %call41
  %call43 = call i8* @sh_xmalloc(i32 %add42, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 802)
  %37 = load i8**, i8*** %result, align 4
  %38 = load i32, i32* %len, align 4
  %arrayidx44 = getelementptr inbounds i8*, i8** %37, i32 %38
  store i8* %call43, i8** %arrayidx44, align 4
  %39 = load i8**, i8*** %result, align 4
  %40 = load i32, i32* %len, align 4
  %arrayidx45 = getelementptr inbounds i8*, i8** %39, i32 %40
  %41 = load i8*, i8** %arrayidx45, align 4
  %42 = load i8**, i8*** %arr1.addr, align 4
  %43 = load i32, i32* %i, align 4
  %arrayidx46 = getelementptr inbounds i8*, i8** %42, i32 %43
  %44 = load i8*, i8** %arrayidx46, align 4
  %call47 = call i8* @strcpy(i8* %41, i8* %44)
  %45 = load i8**, i8*** %result, align 4
  %46 = load i32, i32* %len, align 4
  %arrayidx48 = getelementptr inbounds i8*, i8** %45, i32 %46
  %47 = load i8*, i8** %arrayidx48, align 4
  %48 = load i32, i32* %strlen_1, align 4
  %add.ptr = getelementptr inbounds i8, i8* %47, i32 %48
  %49 = load i8**, i8*** %arr2.addr, align 4
  %50 = load i32, i32* %j, align 4
  %arrayidx49 = getelementptr inbounds i8*, i8** %49, i32 %50
  %51 = load i8*, i8** %arrayidx49, align 4
  %call50 = call i8* @strcpy(i8* %add.ptr, i8* %51)
  %52 = load i32, i32* %len, align 4
  %inc = add nsw i32 %52, 1
  store i32 %inc, i32* %len, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body38
  %53 = load i32, i32* %j, align 4
  %inc51 = add nsw i32 %53, 1
  store i32 %inc51, i32* %j, align 4
  br label %for.cond35

for.end:                                          ; preds = %for.cond35
  %54 = load i8**, i8*** %arr1.addr, align 4
  %55 = load i32, i32* %i, align 4
  %arrayidx52 = getelementptr inbounds i8*, i8** %54, i32 %55
  %56 = load i8*, i8** %arrayidx52, align 4
  call void @sh_xfree(i8* %56, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 807)
  br label %for.inc53

for.inc53:                                        ; preds = %for.end
  %57 = load i32, i32* %i, align 4
  %inc54 = add nsw i32 %57, 1
  store i32 %inc54, i32* %i, align 4
  br label %for.cond

for.end55:                                        ; preds = %for.cond
  %58 = load i8**, i8*** %arr1.addr, align 4
  %59 = bitcast i8** %58 to i8*
  call void @sh_xfree(i8* %59, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0), i32 809)
  %60 = load i8**, i8*** %result, align 4
  %61 = load i32, i32* %len, align 4
  %arrayidx56 = getelementptr inbounds i8*, i8** %60, i32 %61
  store i8* null, i8** %arrayidx56, align 4
  %62 = load i8**, i8*** %result, align 4
  store i8** %62, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %for.end55, %if.then26, %if.then12, %if.then2, %if.then
  %63 = load i8**, i8*** %retval, align 4
  ret i8** %63
}

declare void @strvec_dispose(i8**) #2

declare i32 @strvec_len(i8**) #2

declare i8** @strvec_mresize(i8**, i32) #2

declare void @internal_error(i8*, ...) #2

declare i8* @libintl_gettext(i8*) #2

declare i8* @strstr(i8*, i8*) #2

declare i32 @legal_number(i8*, i64*) #2

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #3

; Function Attrs: nounwind readonly
declare i32 @isdigit(i32) #3

declare i32* @__errno_location() #2

declare i64 @strtoimax(i8*, i8**, i32) #2

; Function Attrs: noinline nounwind
define internal i8** @mkseq(i64 %start, i64 %end, i64 %incr, i32 %type, i32 %width) #0 {
entry:
  %retval = alloca i8**, align 4
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %incr.addr = alloca i64, align 8
  %type.addr = alloca i32, align 4
  %width.addr = alloca i32, align 4
  %n = alloca i64, align 8
  %prevn = alloca i64, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %nelem = alloca i32, align 4
  %result = alloca i8**, align 4
  %t = alloca i8*, align 4
  %len = alloca i32, align 4
  %arg = alloca i32, align 4
  %p = alloca i8*, align 4
  %lbuf = alloca [22 x i8], align 1
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64 %incr, i64* %incr.addr, align 8
  store i32 %type, i32* %type.addr, align 4
  store i32 %width, i32* %width.addr, align 4
  %0 = load i64, i64* %incr.addr, align 8
  %cmp = icmp eq i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i64 1, i64* %incr.addr, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i64, i64* %start.addr, align 8
  %2 = load i64, i64* %end.addr, align 8
  %cmp1 = icmp sgt i64 %1, %2
  br i1 %cmp1, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.end
  %3 = load i64, i64* %incr.addr, align 8
  %cmp2 = icmp sgt i64 %3, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %land.lhs.true
  %4 = load i64, i64* %incr.addr, align 8
  %sub = sub nsw i64 0, %4
  store i64 %sub, i64* %incr.addr, align 8
  br label %if.end13

if.else:                                          ; preds = %land.lhs.true, %if.end
  %5 = load i64, i64* %start.addr, align 8
  %6 = load i64, i64* %end.addr, align 8
  %cmp4 = icmp slt i64 %5, %6
  br i1 %cmp4, label %land.lhs.true5, label %if.end12

land.lhs.true5:                                   ; preds = %if.else
  %7 = load i64, i64* %incr.addr, align 8
  %cmp6 = icmp slt i64 %7, 0
  br i1 %cmp6, label %if.then7, label %if.end12

if.then7:                                         ; preds = %land.lhs.true5
  %8 = load i64, i64* %incr.addr, align 8
  %cmp8 = icmp eq i64 %8, -9223372036854775808
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  store i8** null, i8*** %retval, align 4
  br label %return

if.end10:                                         ; preds = %if.then7
  %9 = load i64, i64* %incr.addr, align 8
  %sub11 = sub nsw i64 0, %9
  store i64 %sub11, i64* %incr.addr, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.end10, %land.lhs.true5, %if.else
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then3
  %10 = load i64, i64* %start.addr, align 8
  %cmp14 = icmp sgt i64 %10, 0
  br i1 %cmp14, label %land.lhs.true15, label %lor.lhs.false

land.lhs.true15:                                  ; preds = %if.end13
  %11 = load i64, i64* %end.addr, align 8
  %12 = load i64, i64* %start.addr, align 8
  %add = add nsw i64 -9223372036854775805, %12
  %cmp16 = icmp slt i64 %11, %add
  br i1 %cmp16, label %if.then21, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true15, %if.end13
  %13 = load i64, i64* %start.addr, align 8
  %cmp17 = icmp slt i64 %13, 0
  br i1 %cmp17, label %land.lhs.true18, label %if.end22

land.lhs.true18:                                  ; preds = %lor.lhs.false
  %14 = load i64, i64* %end.addr, align 8
  %15 = load i64, i64* %start.addr, align 8
  %add19 = add nsw i64 9223372036854775805, %15
  %cmp20 = icmp sgt i64 %14, %add19
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true18, %land.lhs.true15
  store i8** null, i8*** %retval, align 4
  br label %return

if.end22:                                         ; preds = %land.lhs.true18, %lor.lhs.false
  %16 = load i64, i64* %end.addr, align 8
  %17 = load i64, i64* %start.addr, align 8
  %sub23 = sub nsw i64 %16, %17
  %cmp24 = icmp sge i64 %sub23, 0
  br i1 %cmp24, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end22
  %18 = load i64, i64* %end.addr, align 8
  %19 = load i64, i64* %start.addr, align 8
  %sub25 = sub nsw i64 %18, %19
  br label %cond.end

cond.false:                                       ; preds = %if.end22
  %20 = load i64, i64* %end.addr, align 8
  %21 = load i64, i64* %start.addr, align 8
  %sub26 = sub nsw i64 %20, %21
  %sub27 = sub nsw i64 0, %sub26
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub25, %cond.true ], [ %sub27, %cond.false ]
  store i64 %cond, i64* %prevn, align 8
  %22 = load i64, i64* %prevn, align 8
  %23 = load i64, i64* %incr.addr, align 8
  %cmp28 = icmp sge i64 %23, 0
  br i1 %cmp28, label %cond.true29, label %cond.false30

cond.true29:                                      ; preds = %cond.end
  %24 = load i64, i64* %incr.addr, align 8
  br label %cond.end32

cond.false30:                                     ; preds = %cond.end
  %25 = load i64, i64* %incr.addr, align 8
  %sub31 = sub nsw i64 0, %25
  br label %cond.end32

cond.end32:                                       ; preds = %cond.false30, %cond.true29
  %cond33 = phi i64 [ %24, %cond.true29 ], [ %sub31, %cond.false30 ]
  %div = sdiv i64 %22, %cond33
  %cmp34 = icmp sgt i64 %div, 0
  br i1 %cmp34, label %land.lhs.true35, label %lor.lhs.false45

land.lhs.true35:                                  ; preds = %cond.end32
  %26 = load i64, i64* %prevn, align 8
  %27 = load i64, i64* %incr.addr, align 8
  %cmp36 = icmp sge i64 %27, 0
  br i1 %cmp36, label %cond.true37, label %cond.false38

cond.true37:                                      ; preds = %land.lhs.true35
  %28 = load i64, i64* %incr.addr, align 8
  br label %cond.end40

cond.false38:                                     ; preds = %land.lhs.true35
  %29 = load i64, i64* %incr.addr, align 8
  %sub39 = sub nsw i64 0, %29
  br label %cond.end40

cond.end40:                                       ; preds = %cond.false38, %cond.true37
  %cond41 = phi i64 [ %28, %cond.true37 ], [ %sub39, %cond.false38 ]
  %div42 = sdiv i64 %26, %cond41
  %sub43 = sub nsw i64 9223372036854775807, %div42
  %cmp44 = icmp sgt i64 1, %sub43
  br i1 %cmp44, label %if.then64, label %lor.lhs.false45

lor.lhs.false45:                                  ; preds = %cond.end40, %cond.end32
  %30 = load i64, i64* %prevn, align 8
  %31 = load i64, i64* %incr.addr, align 8
  %cmp46 = icmp sge i64 %31, 0
  br i1 %cmp46, label %cond.true47, label %cond.false48

cond.true47:                                      ; preds = %lor.lhs.false45
  %32 = load i64, i64* %incr.addr, align 8
  br label %cond.end50

cond.false48:                                     ; preds = %lor.lhs.false45
  %33 = load i64, i64* %incr.addr, align 8
  %sub49 = sub nsw i64 0, %33
  br label %cond.end50

cond.end50:                                       ; preds = %cond.false48, %cond.true47
  %cond51 = phi i64 [ %32, %cond.true47 ], [ %sub49, %cond.false48 ]
  %div52 = sdiv i64 %30, %cond51
  %cmp53 = icmp slt i64 %div52, 0
  br i1 %cmp53, label %land.lhs.true54, label %if.end65

land.lhs.true54:                                  ; preds = %cond.end50
  %34 = load i64, i64* %prevn, align 8
  %35 = load i64, i64* %incr.addr, align 8
  %cmp55 = icmp sge i64 %35, 0
  br i1 %cmp55, label %cond.true56, label %cond.false57

cond.true56:                                      ; preds = %land.lhs.true54
  %36 = load i64, i64* %incr.addr, align 8
  br label %cond.end59

cond.false57:                                     ; preds = %land.lhs.true54
  %37 = load i64, i64* %incr.addr, align 8
  %sub58 = sub nsw i64 0, %37
  br label %cond.end59

cond.end59:                                       ; preds = %cond.false57, %cond.true56
  %cond60 = phi i64 [ %36, %cond.true56 ], [ %sub58, %cond.false57 ]
  %div61 = sdiv i64 %34, %cond60
  %sub62 = sub nsw i64 -9223372036854775808, %div61
  %cmp63 = icmp slt i64 1, %sub62
  br i1 %cmp63, label %if.then64, label %if.end65

if.then64:                                        ; preds = %cond.end59, %cond.end40
  store i8** null, i8*** %retval, align 4
  br label %return

if.end65:                                         ; preds = %cond.end59, %cond.end50
  %38 = load i64, i64* %prevn, align 8
  %39 = load i64, i64* %incr.addr, align 8
  %cmp66 = icmp sge i64 %39, 0
  br i1 %cmp66, label %cond.true67, label %cond.false68

cond.true67:                                      ; preds = %if.end65
  %40 = load i64, i64* %incr.addr, align 8
  br label %cond.end70

cond.false68:                                     ; preds = %if.end65
  %41 = load i64, i64* %incr.addr, align 8
  %sub69 = sub nsw i64 0, %41
  br label %cond.end70

cond.end70:                                       ; preds = %cond.false68, %cond.true67
  %cond71 = phi i64 [ %40, %cond.true67 ], [ %sub69, %cond.false68 ]
  %div72 = sdiv i64 %38, %cond71
  %add73 = add nsw i64 %div72, 1
  %conv = trunc i64 %add73 to i32
  store i32 %conv, i32* %nelem, align 4
  %42 = load i32, i32* %nelem, align 4
  %cmp74 = icmp sgt i32 %42, 2147483645
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %cond.end70
  store i8** null, i8*** %retval, align 4
  br label %return

if.end77:                                         ; preds = %cond.end70
  %43 = load i32, i32* %nelem, align 4
  %add78 = add nsw i32 %43, 1
  %call = call i8** @strvec_mcreate(i32 %add78)
  store i8** %call, i8*** %result, align 4
  %44 = load i8**, i8*** %result, align 4
  %cmp79 = icmp eq i8** %44, null
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.end77
  %call82 = call i8* @libintl_gettext(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.3, i32 0, i32 0))
  %45 = load i32, i32* %nelem, align 4
  call void (i8*, ...) @internal_error(i8* %call82, i32 %45)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end83:                                         ; preds = %if.end77
  store i32 0, i32* %i, align 4
  %46 = load i64, i64* %start.addr, align 8
  store i64 %46, i64* %n, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end83
  %47 = load volatile i32, i32* @interrupt_state, align 4
  %cmp84 = icmp ne i32 %47, 0
  br i1 %cmp84, label %if.then86, label %if.end87

if.then86:                                        ; preds = %do.body
  %48 = load i8**, i8*** %result, align 4
  call void @strvec_dispose(i8** %48)
  store i8** null, i8*** %result, align 4
  br label %if.end87

if.end87:                                         ; preds = %if.then86, %do.body
  br label %do.body88

do.body88:                                        ; preds = %if.end87
  %49 = load volatile i32, i32* @terminating_signal, align 4
  %tobool = icmp ne i32 %49, 0
  br i1 %tobool, label %if.then89, label %if.end90

if.then89:                                        ; preds = %do.body88
  %50 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %50)
  br label %if.end90

if.end90:                                         ; preds = %if.then89, %do.body88
  %51 = load volatile i32, i32* @interrupt_state, align 4
  %tobool91 = icmp ne i32 %51, 0
  br i1 %tobool91, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end90
  call void @throw_to_top_level()
  br label %if.end93

if.end93:                                         ; preds = %if.then92, %if.end90
  br label %do.end

do.end:                                           ; preds = %if.end93
  %52 = load i32, i32* %type.addr, align 4
  %cmp94 = icmp eq i32 %52, 1
  br i1 %cmp94, label %if.then96, label %if.else98

if.then96:                                        ; preds = %do.end
  %53 = load i64, i64* %n, align 8
  %call97 = call i8* @itos(i64 %53)
  store i8* %call97, i8** %t, align 4
  %54 = load i8**, i8*** %result, align 4
  %55 = load i32, i32* %i, align 4
  %inc = add nsw i32 %55, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %54, i32 %55
  store i8* %call97, i8** %arrayidx, align 4
  br label %if.end117

if.else98:                                        ; preds = %do.end
  %56 = load i32, i32* %type.addr, align 4
  %cmp99 = icmp eq i32 %56, 3
  br i1 %cmp99, label %if.then101, label %if.else106

if.then101:                                       ; preds = %if.else98
  %57 = load i64, i64* %n, align 8
  %conv102 = trunc i64 %57 to i32
  store i32 %conv102, i32* %arg, align 4
  %58 = load i32, i32* %width.addr, align 4
  %59 = load i32, i32* %arg, align 4
  %call103 = call i32 (i8**, i8*, ...) @asprintf(i8** %t, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0), i32 %58, i32 %59)
  store i32 %call103, i32* %len, align 4
  %60 = load i8*, i8** %t, align 4
  %61 = load i8**, i8*** %result, align 4
  %62 = load i32, i32* %i, align 4
  %inc104 = add nsw i32 %62, 1
  store i32 %inc104, i32* %i, align 4
  %arrayidx105 = getelementptr inbounds i8*, i8** %61, i32 %62
  store i8* %60, i8** %arrayidx105, align 4
  br label %if.end116

if.else106:                                       ; preds = %if.else98
  %call107 = call i8* @malloc(i32 2)
  store i8* %call107, i8** %t, align 4
  %tobool108 = icmp ne i8* %call107, null
  br i1 %tobool108, label %if.then109, label %if.end113

if.then109:                                       ; preds = %if.else106
  %63 = load i64, i64* %n, align 8
  %conv110 = trunc i64 %63 to i8
  %64 = load i8*, i8** %t, align 4
  %arrayidx111 = getelementptr inbounds i8, i8* %64, i32 0
  store i8 %conv110, i8* %arrayidx111, align 1
  %65 = load i8*, i8** %t, align 4
  %arrayidx112 = getelementptr inbounds i8, i8* %65, i32 1
  store i8 0, i8* %arrayidx112, align 1
  br label %if.end113

if.end113:                                        ; preds = %if.then109, %if.else106
  %66 = load i8*, i8** %t, align 4
  %67 = load i8**, i8*** %result, align 4
  %68 = load i32, i32* %i, align 4
  %inc114 = add nsw i32 %68, 1
  store i32 %inc114, i32* %i, align 4
  %arrayidx115 = getelementptr inbounds i8*, i8** %67, i32 %68
  store i8* %66, i8** %arrayidx115, align 4
  br label %if.end116

if.end116:                                        ; preds = %if.end113, %if.then101
  br label %if.end117

if.end117:                                        ; preds = %if.end116, %if.then96
  %69 = load i8*, i8** %t, align 4
  %cmp118 = icmp eq i8* %69, null
  br i1 %cmp118, label %if.then120, label %if.end123

if.then120:                                       ; preds = %if.end117
  %70 = load i64, i64* %n, align 8
  %arraydecay = getelementptr inbounds [22 x i8], [22 x i8]* %lbuf, i32 0, i32 0
  %call121 = call i8* @inttostr(i64 %70, i8* %arraydecay, i32 22)
  store i8* %call121, i8** %p, align 4
  %call122 = call i8* @libintl_gettext(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.5, i32 0, i32 0))
  %71 = load i8*, i8** %p, align 4
  call void (i8*, ...) @internal_error(i8* %call122, i8* %71)
  %72 = load i8**, i8*** %result, align 4
  call void @strvec_dispose(i8** %72)
  store i8** null, i8*** %retval, align 4
  br label %return

if.end123:                                        ; preds = %if.end117
  %73 = load i64, i64* %n, align 8
  %cmp124 = icmp sgt i64 %73, 0
  br i1 %cmp124, label %land.lhs.true126, label %lor.lhs.false130

land.lhs.true126:                                 ; preds = %if.end123
  %74 = load i64, i64* %incr.addr, align 8
  %75 = load i64, i64* %n, align 8
  %sub127 = sub nsw i64 9223372036854775807, %75
  %cmp128 = icmp sgt i64 %74, %sub127
  br i1 %cmp128, label %if.then137, label %lor.lhs.false130

lor.lhs.false130:                                 ; preds = %land.lhs.true126, %if.end123
  %76 = load i64, i64* %n, align 8
  %cmp131 = icmp slt i64 %76, 0
  br i1 %cmp131, label %land.lhs.true133, label %if.end138

land.lhs.true133:                                 ; preds = %lor.lhs.false130
  %77 = load i64, i64* %incr.addr, align 8
  %78 = load i64, i64* %n, align 8
  %sub134 = sub nsw i64 -9223372036854775808, %78
  %cmp135 = icmp slt i64 %77, %sub134
  br i1 %cmp135, label %if.then137, label %if.end138

if.then137:                                       ; preds = %land.lhs.true133, %land.lhs.true126
  br label %do.end153

if.end138:                                        ; preds = %land.lhs.true133, %lor.lhs.false130
  %79 = load i64, i64* %incr.addr, align 8
  %80 = load i64, i64* %n, align 8
  %add139 = add nsw i64 %80, %79
  store i64 %add139, i64* %n, align 8
  %81 = load i64, i64* %incr.addr, align 8
  %cmp140 = icmp slt i64 %81, 0
  br i1 %cmp140, label %land.lhs.true142, label %lor.lhs.false145

land.lhs.true142:                                 ; preds = %if.end138
  %82 = load i64, i64* %n, align 8
  %83 = load i64, i64* %end.addr, align 8
  %cmp143 = icmp slt i64 %82, %83
  br i1 %cmp143, label %if.then151, label %lor.lhs.false145

lor.lhs.false145:                                 ; preds = %land.lhs.true142, %if.end138
  %84 = load i64, i64* %incr.addr, align 8
  %cmp146 = icmp sgt i64 %84, 0
  br i1 %cmp146, label %land.lhs.true148, label %if.end152

land.lhs.true148:                                 ; preds = %lor.lhs.false145
  %85 = load i64, i64* %n, align 8
  %86 = load i64, i64* %end.addr, align 8
  %cmp149 = icmp sgt i64 %85, %86
  br i1 %cmp149, label %if.then151, label %if.end152

if.then151:                                       ; preds = %land.lhs.true148, %land.lhs.true142
  br label %do.end153

if.end152:                                        ; preds = %land.lhs.true148, %lor.lhs.false145
  br label %do.cond

do.cond:                                          ; preds = %if.end152
  br i1 true, label %do.body, label %do.end153

do.end153:                                        ; preds = %do.cond, %if.then151, %if.then137
  %87 = load i8**, i8*** %result, align 4
  %88 = load i32, i32* %i, align 4
  %arrayidx154 = getelementptr inbounds i8*, i8** %87, i32 %88
  store i8* null, i8** %arrayidx154, align 4
  %89 = load i8**, i8*** %result, align 4
  store i8** %89, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %do.end153, %if.then120, %if.then81, %if.then76, %if.then64, %if.then21, %if.then9
  %90 = load i8**, i8*** %retval, align 4
  ret i8** %90
}

declare i8** @strvec_mcreate(i32) #2

declare void @termsig_handler(i32) #2

declare void @throw_to_top_level() #2

declare i8* @itos(i64) #2

declare i32 @asprintf(i8**, i8*, ...) #2

declare i8* @malloc(i32) #2

declare i8* @inttostr(i64, i8*, i32) #2

declare i8* @extract_command_subst(i8*, i32*, i32) #2

declare i32 @strncmp(i8*, i8*, i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
