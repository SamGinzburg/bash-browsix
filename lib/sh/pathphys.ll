; ModuleID = 'pathphys.c'
source_filename = "pathphys.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [11 x i8] c"pathphys.c\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"sh_realpath\00", align 1

; Function Attrs: noinline nounwind
define i8* @sh_physpath(i8* %path, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %path.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %tbuf = alloca [4097 x i8], align 1
  %linkbuf = alloca [4097 x i8], align 1
  %result = alloca i8*, align 4
  %p = alloca i8*, align 4
  %q = alloca i8*, align 4
  %qsave = alloca i8*, align 4
  %qbase = alloca i8*, align 4
  %workpath = alloca i8*, align 4
  %double_slash_path = alloca i32, align 4
  %linklen = alloca i32, align 4
  %nlink = alloca i32, align 4
  store i8* %path, i8** %path.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %call = call i32 @strlen(i8* %0)
  store i32 %call, i32* %linklen, align 4
  store i32 0, i32* %nlink, align 4
  %call1 = call i8* @sh_xmalloc(i32 4097, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 92)
  store i8* %call1, i8** %result, align 4
  store i8* %call1, i8** %q, align 4
  %1 = load i32, i32* %linklen, align 4
  %cmp = icmp sge i32 %1, 4096
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %path.addr, align 4
  %call2 = call i32 @strlen(i8* %2)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 97)
  %3 = load i8*, i8** %path.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %3)
  store i8* %call4, i8** %workpath, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %call5 = call i8* @sh_xmalloc(i32 4097, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 100)
  store i8* %call5, i8** %workpath, align 4
  %4 = load i8*, i8** %workpath, align 4
  %5 = load i8*, i8** %path.addr, align 4
  %call6 = call i8* @strcpy(i8* %4, i8* %5)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i8*, i8** %workpath, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %add.ptr, i8** %qbase, align 4
  %7 = load i8*, i8** %workpath, align 4
  %arrayidx = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %8 to i32
  %cmp7 = icmp eq i32 %conv, 47
  br i1 %cmp7, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %if.end
  %9 = load i8*, i8** %workpath, align 4
  %arrayidx9 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx9, align 1
  %conv10 = sext i8 %10 to i32
  %cmp11 = icmp eq i32 %conv10, 47
  br i1 %cmp11, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %11 = load i8*, i8** %workpath, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %12 to i32
  %cmp15 = icmp ne i32 %conv14, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %if.end
  %13 = phi i1 [ false, %land.lhs.true ], [ false, %if.end ], [ %cmp15, %land.rhs ]
  %land.ext = zext i1 %13 to i32
  store i32 %land.ext, i32* %double_slash_path, align 4
  %14 = load i32, i32* %double_slash_path, align 4
  %15 = load i8*, i8** %qbase, align 4
  %add.ptr17 = getelementptr inbounds i8, i8* %15, i32 %14
  store i8* %add.ptr17, i8** %qbase, align 4
  %16 = load i8*, i8** %workpath, align 4
  store i8* %16, i8** %p, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %land.end
  %17 = load i8*, i8** %p, align 4
  %18 = load i8*, i8** %qbase, align 4
  %cmp18 = icmp ult i8* %17, %18
  br i1 %cmp18, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %19 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  %20 = load i8, i8* %19, align 1
  %21 = load i8*, i8** %q, align 4
  %incdec.ptr20 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr20, i8** %q, align 4
  store i8 %20, i8* %21, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %22 = load i8*, i8** %q, align 4
  store i8* %22, i8** %qbase, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end175, %if.end116, %for.end
  %23 = load i8*, i8** %p, align 4
  %24 = load i8, i8* %23, align 1
  %tobool = icmp ne i8 %24, 0
  br i1 %tobool, label %while.body, label %while.end176

while.body:                                       ; preds = %while.cond
  %25 = load i8*, i8** %p, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %26 to i32
  %cmp23 = icmp eq i32 %conv22, 47
  br i1 %cmp23, label %if.then25, label %if.else27

if.then25:                                        ; preds = %while.body
  %27 = load i8*, i8** %p, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %incdec.ptr26, i8** %p, align 4
  br label %if.end175

if.else27:                                        ; preds = %while.body
  %28 = load i8*, i8** %p, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %28, i32 0
  %29 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %29 to i32
  %cmp30 = icmp eq i32 %conv29, 46
  br i1 %cmp30, label %land.lhs.true32, label %if.else43

land.lhs.true32:                                  ; preds = %if.else27
  %30 = load i8*, i8** %p, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %30, i32 1
  %31 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %31 to i32
  %cmp35 = icmp eq i32 %conv34, 47
  br i1 %cmp35, label %if.then41, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true32
  %32 = load i8*, i8** %p, align 4
  %arrayidx37 = getelementptr inbounds i8, i8* %32, i32 1
  %33 = load i8, i8* %arrayidx37, align 1
  %conv38 = sext i8 %33 to i32
  %cmp39 = icmp eq i32 %conv38, 0
  br i1 %cmp39, label %if.then41, label %if.else43

if.then41:                                        ; preds = %lor.lhs.false, %land.lhs.true32
  %34 = load i8*, i8** %p, align 4
  %add.ptr42 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %add.ptr42, i8** %p, align 4
  br label %if.end174

if.else43:                                        ; preds = %lor.lhs.false, %if.else27
  %35 = load i8*, i8** %p, align 4
  %arrayidx44 = getelementptr inbounds i8, i8* %35, i32 0
  %36 = load i8, i8* %arrayidx44, align 1
  %conv45 = sext i8 %36 to i32
  %cmp46 = icmp eq i32 %conv45, 46
  br i1 %cmp46, label %land.lhs.true48, label %if.else82

land.lhs.true48:                                  ; preds = %if.else43
  %37 = load i8*, i8** %p, align 4
  %arrayidx49 = getelementptr inbounds i8, i8* %37, i32 1
  %38 = load i8, i8* %arrayidx49, align 1
  %conv50 = sext i8 %38 to i32
  %cmp51 = icmp eq i32 %conv50, 46
  br i1 %cmp51, label %land.lhs.true53, label %if.else82

land.lhs.true53:                                  ; preds = %land.lhs.true48
  %39 = load i8*, i8** %p, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %39, i32 2
  %40 = load i8, i8* %arrayidx54, align 1
  %conv55 = sext i8 %40 to i32
  %cmp56 = icmp eq i32 %conv55, 47
  br i1 %cmp56, label %if.then63, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %land.lhs.true53
  %41 = load i8*, i8** %p, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %41, i32 2
  %42 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %42 to i32
  %cmp61 = icmp eq i32 %conv60, 0
  br i1 %cmp61, label %if.then63, label %if.else82

if.then63:                                        ; preds = %lor.lhs.false58, %land.lhs.true53
  %43 = load i8*, i8** %p, align 4
  %add.ptr64 = getelementptr inbounds i8, i8* %43, i32 2
  store i8* %add.ptr64, i8** %p, align 4
  %44 = load i8*, i8** %q, align 4
  %45 = load i8*, i8** %qbase, align 4
  %cmp65 = icmp ugt i8* %44, %45
  br i1 %cmp65, label %if.then67, label %if.end81

if.then67:                                        ; preds = %if.then63
  br label %while.cond68

while.cond68:                                     ; preds = %while.body80, %if.then67
  %46 = load i8*, i8** %q, align 4
  %incdec.ptr69 = getelementptr inbounds i8, i8* %46, i32 -1
  store i8* %incdec.ptr69, i8** %q, align 4
  %47 = load i8*, i8** %qbase, align 4
  %cmp70 = icmp ugt i8* %incdec.ptr69, %47
  br i1 %cmp70, label %land.rhs72, label %land.end78

land.rhs72:                                       ; preds = %while.cond68
  %48 = load i8*, i8** %q, align 4
  %49 = load i8, i8* %48, align 1
  %conv73 = sext i8 %49 to i32
  %cmp74 = icmp eq i32 %conv73, 47
  %conv75 = zext i1 %cmp74 to i32
  %cmp76 = icmp eq i32 %conv75, 0
  br label %land.end78

land.end78:                                       ; preds = %land.rhs72, %while.cond68
  %50 = phi i1 [ false, %while.cond68 ], [ %cmp76, %land.rhs72 ]
  br i1 %50, label %while.body80, label %while.end

while.body80:                                     ; preds = %land.end78
  br label %while.cond68

while.end:                                        ; preds = %land.end78
  br label %if.end81

if.end81:                                         ; preds = %while.end, %if.then63
  br label %if.end173

if.else82:                                        ; preds = %lor.lhs.false58, %land.lhs.true48, %if.else43
  %51 = load i8*, i8** %q, align 4
  store i8* %51, i8** %qsave, align 4
  %52 = load i8*, i8** %q, align 4
  %53 = load i8*, i8** %qbase, align 4
  %cmp83 = icmp ne i8* %52, %53
  br i1 %cmp83, label %if.then85, label %if.end87

if.then85:                                        ; preds = %if.else82
  %54 = load i8*, i8** %q, align 4
  %incdec.ptr86 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr86, i8** %q, align 4
  store i8 47, i8* %54, align 1
  br label %if.end87

if.end87:                                         ; preds = %if.then85, %if.else82
  br label %while.cond88

while.cond88:                                     ; preds = %if.end104, %if.end87
  %55 = load i8*, i8** %p, align 4
  %56 = load i8, i8* %55, align 1
  %conv89 = sext i8 %56 to i32
  %tobool90 = icmp ne i32 %conv89, 0
  br i1 %tobool90, label %land.rhs91, label %land.end97

land.rhs91:                                       ; preds = %while.cond88
  %57 = load i8*, i8** %p, align 4
  %58 = load i8, i8* %57, align 1
  %conv92 = sext i8 %58 to i32
  %cmp93 = icmp eq i32 %conv92, 47
  %conv94 = zext i1 %cmp93 to i32
  %cmp95 = icmp eq i32 %conv94, 0
  br label %land.end97

land.end97:                                       ; preds = %land.rhs91, %while.cond88
  %59 = phi i1 [ false, %while.cond88 ], [ %cmp95, %land.rhs91 ]
  br i1 %59, label %while.body99, label %while.end107

while.body99:                                     ; preds = %land.end97
  %60 = load i8*, i8** %q, align 4
  %61 = load i8*, i8** %result, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %60 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %61 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %cmp100 = icmp sge i32 %sub.ptr.sub, 4096
  br i1 %cmp100, label %if.then102, label %if.end104

if.then102:                                       ; preds = %while.body99
  %call103 = call i32* @__errno_location()
  store i32 36, i32* %call103, align 4
  br label %error

if.end104:                                        ; preds = %while.body99
  %62 = load i8*, i8** %p, align 4
  %incdec.ptr105 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %incdec.ptr105, i8** %p, align 4
  %63 = load i8, i8* %62, align 1
  %64 = load i8*, i8** %q, align 4
  %incdec.ptr106 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr106, i8** %q, align 4
  store i8 %63, i8* %64, align 1
  br label %while.cond88

while.end107:                                     ; preds = %land.end97
  %65 = load i8*, i8** %q, align 4
  store i8 0, i8* %65, align 1
  %66 = load i8*, i8** %result, align 4
  %arraydecay = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %call108 = call i32 @_path_readlink(i8* %66, i8* %arraydecay, i32 4096)
  store i32 %call108, i32* %linklen, align 4
  %67 = load i32, i32* %linklen, align 4
  %cmp109 = icmp slt i32 %67, 0
  br i1 %cmp109, label %if.then111, label %if.end117

if.then111:                                       ; preds = %while.end107
  %call112 = call i32* @__errno_location()
  %68 = load i32, i32* %call112, align 4
  %cmp113 = icmp ne i32 %68, 22
  br i1 %cmp113, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.then111
  br label %error

if.end116:                                        ; preds = %if.then111
  br label %while.cond

if.end117:                                        ; preds = %while.end107
  %69 = load i32, i32* %nlink, align 4
  %inc = add nsw i32 %69, 1
  store i32 %inc, i32* %nlink, align 4
  %70 = load i32, i32* %nlink, align 4
  %cmp118 = icmp sgt i32 %70, 20
  br i1 %cmp118, label %if.then120, label %if.end122

if.then120:                                       ; preds = %if.end117
  %call121 = call i32* @__errno_location()
  store i32 40, i32* %call121, align 4
  br label %error

error:                                            ; preds = %if.then129, %if.then120, %if.then115, %if.then102
  %71 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %71, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 185)
  %72 = load i8*, i8** %workpath, align 4
  call void @sh_xfree(i8* %72, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 186)
  store i8* null, i8** %retval, align 4
  br label %return

if.end122:                                        ; preds = %if.end117
  %73 = load i32, i32* %linklen, align 4
  %arrayidx123 = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 %73
  store i8 0, i8* %arrayidx123, align 1
  %74 = load i8*, i8** %p, align 4
  %call124 = call i32 @strlen(i8* %74)
  %75 = load i32, i32* %linklen, align 4
  %add125 = add i32 %call124, %75
  %add126 = add i32 %add125, 2
  %cmp127 = icmp uge i32 %add126, 4096
  br i1 %cmp127, label %if.then129, label %if.end131

if.then129:                                       ; preds = %if.end122
  %call130 = call i32* @__errno_location()
  store i32 36, i32* %call130, align 4
  br label %error

if.end131:                                        ; preds = %if.end122
  %arraydecay132 = getelementptr inbounds [4097 x i8], [4097 x i8]* %tbuf, i32 0, i32 0
  %arraydecay133 = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %call134 = call i8* @strcpy(i8* %arraydecay132, i8* %arraydecay133)
  %76 = load i32, i32* %linklen, align 4
  %arrayidx135 = getelementptr inbounds [4097 x i8], [4097 x i8]* %tbuf, i32 0, i32 %76
  store i8 47, i8* %arrayidx135, align 1
  %arraydecay136 = getelementptr inbounds [4097 x i8], [4097 x i8]* %tbuf, i32 0, i32 0
  %77 = load i32, i32* %linklen, align 4
  %add.ptr137 = getelementptr inbounds i8, i8* %arraydecay136, i32 %77
  %78 = load i8*, i8** %p, align 4
  %call138 = call i8* @strcpy(i8* %add.ptr137, i8* %78)
  %79 = load i8*, i8** %workpath, align 4
  %arraydecay139 = getelementptr inbounds [4097 x i8], [4097 x i8]* %tbuf, i32 0, i32 0
  %call140 = call i8* @strcpy(i8* %79, i8* %arraydecay139)
  %arrayidx141 = getelementptr inbounds [4097 x i8], [4097 x i8]* %linkbuf, i32 0, i32 0
  %80 = load i8, i8* %arrayidx141, align 1
  %conv142 = sext i8 %80 to i32
  %cmp143 = icmp eq i32 %conv142, 47
  br i1 %cmp143, label %if.then145, label %if.else171

if.then145:                                       ; preds = %if.end131
  %81 = load i8*, i8** %result, align 4
  store i8* %81, i8** %q, align 4
  %82 = load i8*, i8** %workpath, align 4
  %add.ptr146 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %add.ptr146, i8** %qbase, align 4
  %83 = load i8*, i8** %workpath, align 4
  %arrayidx147 = getelementptr inbounds i8, i8* %83, i32 0
  %84 = load i8, i8* %arrayidx147, align 1
  %conv148 = sext i8 %84 to i32
  %cmp149 = icmp eq i32 %conv148, 47
  br i1 %cmp149, label %land.lhs.true151, label %land.end161

land.lhs.true151:                                 ; preds = %if.then145
  %85 = load i8*, i8** %workpath, align 4
  %arrayidx152 = getelementptr inbounds i8, i8* %85, i32 1
  %86 = load i8, i8* %arrayidx152, align 1
  %conv153 = sext i8 %86 to i32
  %cmp154 = icmp eq i32 %conv153, 47
  br i1 %cmp154, label %land.rhs156, label %land.end161

land.rhs156:                                      ; preds = %land.lhs.true151
  %87 = load i8*, i8** %workpath, align 4
  %arrayidx157 = getelementptr inbounds i8, i8* %87, i32 2
  %88 = load i8, i8* %arrayidx157, align 1
  %conv158 = sext i8 %88 to i32
  %cmp159 = icmp ne i32 %conv158, 47
  br label %land.end161

land.end161:                                      ; preds = %land.rhs156, %land.lhs.true151, %if.then145
  %89 = phi i1 [ false, %land.lhs.true151 ], [ false, %if.then145 ], [ %cmp159, %land.rhs156 ]
  %land.ext162 = zext i1 %89 to i32
  store i32 %land.ext162, i32* %double_slash_path, align 4
  %90 = load i32, i32* %double_slash_path, align 4
  %91 = load i8*, i8** %qbase, align 4
  %add.ptr163 = getelementptr inbounds i8, i8* %91, i32 %90
  store i8* %add.ptr163, i8** %qbase, align 4
  %92 = load i8*, i8** %workpath, align 4
  store i8* %92, i8** %p, align 4
  br label %for.cond164

for.cond164:                                      ; preds = %for.body167, %land.end161
  %93 = load i8*, i8** %p, align 4
  %94 = load i8*, i8** %qbase, align 4
  %cmp165 = icmp ult i8* %93, %94
  br i1 %cmp165, label %for.body167, label %for.end170

for.body167:                                      ; preds = %for.cond164
  %95 = load i8*, i8** %p, align 4
  %incdec.ptr168 = getelementptr inbounds i8, i8* %95, i32 1
  store i8* %incdec.ptr168, i8** %p, align 4
  %96 = load i8, i8* %95, align 1
  %97 = load i8*, i8** %q, align 4
  %incdec.ptr169 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %incdec.ptr169, i8** %q, align 4
  store i8 %96, i8* %97, align 1
  br label %for.cond164

for.end170:                                       ; preds = %for.cond164
  %98 = load i8*, i8** %q, align 4
  store i8* %98, i8** %qbase, align 4
  br label %if.end172

if.else171:                                       ; preds = %if.end131
  %99 = load i8*, i8** %workpath, align 4
  store i8* %99, i8** %p, align 4
  %100 = load i8*, i8** %qsave, align 4
  store i8* %100, i8** %q, align 4
  br label %if.end172

if.end172:                                        ; preds = %if.else171, %for.end170
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %if.end81
  br label %if.end174

if.end174:                                        ; preds = %if.end173, %if.then41
  br label %if.end175

if.end175:                                        ; preds = %if.end174, %if.then25
  br label %while.cond

while.end176:                                     ; preds = %while.cond
  %101 = load i8*, i8** %q, align 4
  store i8 0, i8* %101, align 1
  %102 = load i8*, i8** %workpath, align 4
  call void @sh_xfree(i8* %102, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 238)
  %103 = load i8*, i8** %result, align 4
  %arrayidx177 = getelementptr inbounds i8, i8* %103, i32 0
  %104 = load i8, i8* %arrayidx177, align 1
  %conv178 = sext i8 %104 to i32
  %cmp179 = icmp eq i32 %conv178, 47
  br i1 %cmp179, label %land.lhs.true181, label %if.end205

land.lhs.true181:                                 ; preds = %while.end176
  %105 = load i8*, i8** %result, align 4
  %arrayidx182 = getelementptr inbounds i8, i8* %105, i32 1
  %106 = load i8, i8* %arrayidx182, align 1
  %conv183 = sext i8 %106 to i32
  %cmp184 = icmp eq i32 %conv183, 47
  br i1 %cmp184, label %land.lhs.true186, label %if.end205

land.lhs.true186:                                 ; preds = %land.lhs.true181
  %107 = load i8*, i8** %result, align 4
  %arrayidx187 = getelementptr inbounds i8, i8* %107, i32 2
  %108 = load i8, i8* %arrayidx187, align 1
  %conv188 = sext i8 %108 to i32
  %cmp189 = icmp ne i32 %conv188, 47
  br i1 %cmp189, label %land.lhs.true191, label %if.end205

land.lhs.true191:                                 ; preds = %land.lhs.true186
  %109 = load i32, i32* %double_slash_path, align 4
  %cmp192 = icmp eq i32 %109, 0
  br i1 %cmp192, label %if.then194, label %if.end205

if.then194:                                       ; preds = %land.lhs.true191
  %110 = load i8*, i8** %result, align 4
  %arrayidx195 = getelementptr inbounds i8, i8* %110, i32 2
  %111 = load i8, i8* %arrayidx195, align 1
  %conv196 = sext i8 %111 to i32
  %cmp197 = icmp eq i32 %conv196, 0
  br i1 %cmp197, label %if.then199, label %if.else201

if.then199:                                       ; preds = %if.then194
  %112 = load i8*, i8** %result, align 4
  %arrayidx200 = getelementptr inbounds i8, i8* %112, i32 1
  store i8 0, i8* %arrayidx200, align 1
  br label %if.end204

if.else201:                                       ; preds = %if.then194
  %113 = load i8*, i8** %result, align 4
  %114 = load i8*, i8** %result, align 4
  %add.ptr202 = getelementptr inbounds i8, i8* %114, i32 1
  %call203 = call i8* @strcpy(i8* %113, i8* %add.ptr202)
  br label %if.end204

if.end204:                                        ; preds = %if.else201, %if.then199
  br label %if.end205

if.end205:                                        ; preds = %if.end204, %land.lhs.true191, %land.lhs.true186, %land.lhs.true181, %while.end176
  %115 = load i8*, i8** %result, align 4
  store i8* %115, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end205, %error
  %116 = load i8*, i8** %retval, align 4
  ret i8* %116
}

declare i32 @strlen(i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal i32 @_path_readlink(i8* %path, i8* %buf, i32 %bufsiz) #0 {
entry:
  %path.addr = alloca i8*, align 4
  %buf.addr = alloca i8*, align 4
  %bufsiz.addr = alloca i32, align 4
  store i8* %path, i8** %path.addr, align 4
  store i8* %buf, i8** %buf.addr, align 4
  store i32 %bufsiz, i32* %bufsiz.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %1 = load i8*, i8** %buf.addr, align 4
  %2 = load i32, i32* %bufsiz.addr, align 4
  %call = call i32 @readlink(i8* %0, i8* %1, i32 %2)
  ret i32 %call
}

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @sh_realpath(i8* %pathname, i8* %resolved) #0 {
entry:
  %retval = alloca i8*, align 4
  %pathname.addr = alloca i8*, align 4
  %resolved.addr = alloca i8*, align 4
  %tdir = alloca i8*, align 4
  %wd = alloca i8*, align 4
  store i8* %pathname, i8** %pathname.addr, align 4
  store i8* %resolved, i8** %resolved.addr, align 4
  %0 = load i8*, i8** %pathname.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %pathname.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %pathname.addr, align 4
  %cmp3 = icmp eq i8* %3, null
  %cond = select i1 %cmp3, i32 22, i32 2
  %call = call i32* @__errno_location()
  store i32 %cond, i32* %call, align 4
  store i8* null, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %pathname.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %5 to i32
  %cmp6 = icmp eq i32 %conv5, 47
  %conv7 = zext i1 %cmp6 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then10, label %if.else

if.then10:                                        ; preds = %if.end
  %call11 = call i8* @get_working_directory(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call11, i8** %wd, align 4
  %6 = load i8*, i8** %wd, align 4
  %cmp12 = icmp eq i8* %6, null
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then10
  store i8* null, i8** %retval, align 4
  br label %return

if.end15:                                         ; preds = %if.then10
  %7 = load i8*, i8** %wd, align 4
  %8 = load i8*, i8** %pathname.addr, align 4
  %call16 = call i8* @sh_makepath(i8* %7, i8* %8, i32 0)
  store i8* %call16, i8** %tdir, align 4
  %9 = load i8*, i8** %wd, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 273)
  br label %if.end20

if.else:                                          ; preds = %if.end
  %10 = load i8*, i8** %pathname.addr, align 4
  %call17 = call i32 @strlen(i8* %10)
  %add = add i32 1, %call17
  %call18 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 276)
  %11 = load i8*, i8** %pathname.addr, align 4
  %call19 = call i8* @strcpy(i8* %call18, i8* %11)
  store i8* %call19, i8** %tdir, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end15
  %12 = load i8*, i8** %tdir, align 4
  %call21 = call i8* @sh_physpath(i8* %12, i32 0)
  store i8* %call21, i8** %wd, align 4
  %13 = load i8*, i8** %tdir, align 4
  call void @sh_xfree(i8* %13, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 279)
  %14 = load i8*, i8** %resolved.addr, align 4
  %cmp22 = icmp eq i8* %14, null
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end20
  %15 = load i8*, i8** %wd, align 4
  store i8* %15, i8** %retval, align 4
  br label %return

if.end25:                                         ; preds = %if.end20
  %16 = load i8*, i8** %wd, align 4
  %tobool = icmp ne i8* %16, null
  br i1 %tobool, label %if.then26, label %if.else29

if.then26:                                        ; preds = %if.end25
  %17 = load i8*, i8** %resolved.addr, align 4
  %18 = load i8*, i8** %wd, align 4
  %call27 = call i8* @strncpy(i8* %17, i8* %18, i32 4095)
  %19 = load i8*, i8** %resolved.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %19, i32 4095
  store i8 0, i8* %arrayidx28, align 1
  %20 = load i8*, i8** %wd, align 4
  call void @sh_xfree(i8* %20, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 288)
  %21 = load i8*, i8** %resolved.addr, align 4
  store i8* %21, i8** %retval, align 4
  br label %return

if.else29:                                        ; preds = %if.end25
  %22 = load i8*, i8** %resolved.addr, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %22, i32 0
  store i8 0, i8* %arrayidx30, align 1
  %23 = load i8*, i8** %wd, align 4
  store i8* %23, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else29, %if.then26, %if.then24, %if.then14, %if.then
  %24 = load i8*, i8** %retval, align 4
  ret i8* %24
}

declare i8* @get_working_directory(i8*) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i32 @readlink(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
