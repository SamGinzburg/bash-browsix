; ModuleID = 'pathcanon.c'
source_filename = "pathcanon.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@.str = private unnamed_addr constant [12 x i8] c"pathcanon.c\00", align 1

; Function Attrs: noinline nounwind
define i8* @sh_canonpath(i8* %path, i32 %flags) #0 {
entry:
  %retval = alloca i8*, align 4
  %path.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %stub_char = alloca i8, align 1
  %result = alloca i8*, align 4
  %p = alloca i8*, align 4
  %q = alloca i8*, align 4
  %base = alloca i8*, align 4
  %dotdot = alloca i8*, align 4
  %rooted = alloca i32, align 4
  %double_slash_path = alloca i32, align 4
  %c = alloca i8, align 1
  %c128 = alloca i8, align 1
  store i8* %path, i8** %path.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %and = and i32 %0, 8
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %path.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i8*, i8** %path.addr, align 4
  %call = call i32 @strlen(i8* %2)
  %add = add i32 1, %call
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 113)
  %3 = load i8*, i8** %path.addr, align 4
  %call2 = call i8* @strcpy(i8* %call1, i8* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %1, %cond.true ], [ %call2, %cond.false ]
  store i8* %cond, i8** %result, align 4
  %4 = load i8*, i8** %path.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv, 47
  %conv3 = zext i1 %cmp to i32
  store i32 %conv3, i32* %rooted, align 4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %cond.end
  store i8 47, i8* %stub_char, align 1
  %6 = load i8*, i8** %result, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %add.ptr, i8** %base, align 4
  %7 = load i8*, i8** %path.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i32 0
  %8 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %8 to i32
  %cmp6 = icmp eq i32 %conv5, 47
  br i1 %cmp6, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %if.then
  %9 = load i8*, i8** %path.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %10 to i32
  %cmp10 = icmp eq i32 %conv9, 47
  br i1 %cmp10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %11 = load i8*, i8** %path.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %12 to i32
  %cmp14 = icmp ne i32 %conv13, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %if.then
  %13 = phi i1 [ false, %land.lhs.true ], [ false, %if.then ], [ %cmp14, %land.rhs ]
  %land.ext = zext i1 %13 to i32
  store i32 %land.ext, i32* %double_slash_path, align 4
  %14 = load i32, i32* %double_slash_path, align 4
  %15 = load i8*, i8** %base, align 4
  %add.ptr16 = getelementptr inbounds i8, i8* %15, i32 %14
  store i8* %add.ptr16, i8** %base, align 4
  br label %if.end

if.else:                                          ; preds = %cond.end
  store i8 46, i8* %stub_char, align 1
  %16 = load i8*, i8** %result, align 4
  store i8* %16, i8** %base, align 4
  store i32 0, i32* %double_slash_path, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %land.end
  %17 = load i8*, i8** %base, align 4
  store i8* %17, i8** %dotdot, align 4
  store i8* %17, i8** %q, align 4
  store i8* %17, i8** %p, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end142, %if.end
  %18 = load i8*, i8** %p, align 4
  %19 = load i8, i8* %18, align 1
  %tobool17 = icmp ne i8 %19, 0
  br i1 %tobool17, label %while.body, label %while.end143

while.body:                                       ; preds = %while.cond
  %20 = load i8*, i8** %p, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %20, i32 0
  %21 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %21 to i32
  %cmp20 = icmp eq i32 %conv19, 47
  br i1 %cmp20, label %if.then22, label %if.else23

if.then22:                                        ; preds = %while.body
  %22 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %if.end142

if.else23:                                        ; preds = %while.body
  %23 = load i8*, i8** %p, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx24, align 1
  %conv25 = sext i8 %24 to i32
  %cmp26 = icmp eq i32 %conv25, 46
  br i1 %cmp26, label %land.lhs.true28, label %if.else39

land.lhs.true28:                                  ; preds = %if.else23
  %25 = load i8*, i8** %p, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %25, i32 1
  %26 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %26 to i32
  %cmp31 = icmp eq i32 %conv30, 47
  br i1 %cmp31, label %if.then37, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true28
  %27 = load i8*, i8** %p, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %27, i32 1
  %28 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %28 to i32
  %cmp35 = icmp eq i32 %conv34, 0
  br i1 %cmp35, label %if.then37, label %if.else39

if.then37:                                        ; preds = %lor.lhs.false, %land.lhs.true28
  %29 = load i8*, i8** %p, align 4
  %add.ptr38 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %add.ptr38, i8** %p, align 4
  br label %if.end141

if.else39:                                        ; preds = %lor.lhs.false, %if.else23
  %30 = load i8*, i8** %p, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %30, i32 0
  %31 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %31 to i32
  %cmp42 = icmp eq i32 %conv41, 46
  br i1 %cmp42, label %land.lhs.true44, label %if.else104

land.lhs.true44:                                  ; preds = %if.else39
  %32 = load i8*, i8** %p, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %32, i32 1
  %33 = load i8, i8* %arrayidx45, align 1
  %conv46 = sext i8 %33 to i32
  %cmp47 = icmp eq i32 %conv46, 46
  br i1 %cmp47, label %land.lhs.true49, label %if.else104

land.lhs.true49:                                  ; preds = %land.lhs.true44
  %34 = load i8*, i8** %p, align 4
  %arrayidx50 = getelementptr inbounds i8, i8* %34, i32 2
  %35 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %35 to i32
  %cmp52 = icmp eq i32 %conv51, 47
  br i1 %cmp52, label %if.then59, label %lor.lhs.false54

lor.lhs.false54:                                  ; preds = %land.lhs.true49
  %36 = load i8*, i8** %p, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %36, i32 2
  %37 = load i8, i8* %arrayidx55, align 1
  %conv56 = sext i8 %37 to i32
  %cmp57 = icmp eq i32 %conv56, 0
  br i1 %cmp57, label %if.then59, label %if.else104

if.then59:                                        ; preds = %lor.lhs.false54, %land.lhs.true49
  %38 = load i8*, i8** %p, align 4
  %add.ptr60 = getelementptr inbounds i8, i8* %38, i32 2
  store i8* %add.ptr60, i8** %p, align 4
  %39 = load i8*, i8** %q, align 4
  %40 = load i8*, i8** %dotdot, align 4
  %cmp61 = icmp ugt i8* %39, %40
  br i1 %cmp61, label %if.then63, label %if.else91

if.then63:                                        ; preds = %if.then59
  %41 = load i32, i32* %flags.addr, align 4
  %and64 = and i32 %41, 1
  %tobool65 = icmp ne i32 %and64, 0
  br i1 %tobool65, label %if.then66, label %if.end77

if.then66:                                        ; preds = %if.then63
  %42 = load i8*, i8** %q, align 4
  %43 = load i8, i8* %42, align 1
  store i8 %43, i8* %c, align 1
  %44 = load i8*, i8** %q, align 4
  store i8 0, i8* %44, align 1
  %45 = load i8*, i8** %result, align 4
  %call67 = call i32 @_path_isdir(i8* %45)
  %cmp68 = icmp eq i32 %call67, 0
  br i1 %cmp68, label %if.then70, label %if.end76

if.then70:                                        ; preds = %if.then66
  %46 = load i32, i32* %flags.addr, align 4
  %and71 = and i32 %46, 8
  %cmp72 = icmp eq i32 %and71, 0
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.then70
  %47 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %47, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 171)
  br label %if.end75

if.end75:                                         ; preds = %if.then74, %if.then70
  store i8* null, i8** %retval, align 4
  br label %return

if.end76:                                         ; preds = %if.then66
  %48 = load i8, i8* %c, align 1
  %49 = load i8*, i8** %q, align 4
  store i8 %48, i8* %49, align 1
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %if.then63
  br label %while.cond78

while.cond78:                                     ; preds = %while.body90, %if.end77
  %50 = load i8*, i8** %q, align 4
  %incdec.ptr79 = getelementptr inbounds i8, i8* %50, i32 -1
  store i8* %incdec.ptr79, i8** %q, align 4
  %51 = load i8*, i8** %dotdot, align 4
  %cmp80 = icmp ugt i8* %incdec.ptr79, %51
  br i1 %cmp80, label %land.rhs82, label %land.end88

land.rhs82:                                       ; preds = %while.cond78
  %52 = load i8*, i8** %q, align 4
  %53 = load i8, i8* %52, align 1
  %conv83 = sext i8 %53 to i32
  %cmp84 = icmp eq i32 %conv83, 47
  %conv85 = zext i1 %cmp84 to i32
  %cmp86 = icmp eq i32 %conv85, 0
  br label %land.end88

land.end88:                                       ; preds = %land.rhs82, %while.cond78
  %54 = phi i1 [ false, %while.cond78 ], [ %cmp86, %land.rhs82 ]
  br i1 %54, label %while.body90, label %while.end

while.body90:                                     ; preds = %land.end88
  br label %while.cond78

while.end:                                        ; preds = %land.end88
  br label %if.end103

if.else91:                                        ; preds = %if.then59
  %55 = load i32, i32* %rooted, align 4
  %cmp92 = icmp eq i32 %55, 0
  br i1 %cmp92, label %if.then94, label %if.end102

if.then94:                                        ; preds = %if.else91
  %56 = load i8*, i8** %q, align 4
  %57 = load i8*, i8** %base, align 4
  %cmp95 = icmp ne i8* %56, %57
  br i1 %cmp95, label %if.then97, label %if.end99

if.then97:                                        ; preds = %if.then94
  %58 = load i8*, i8** %q, align 4
  %incdec.ptr98 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %incdec.ptr98, i8** %q, align 4
  store i8 47, i8* %58, align 1
  br label %if.end99

if.end99:                                         ; preds = %if.then97, %if.then94
  %59 = load i8*, i8** %q, align 4
  %incdec.ptr100 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %incdec.ptr100, i8** %q, align 4
  store i8 46, i8* %59, align 1
  %60 = load i8*, i8** %q, align 4
  %incdec.ptr101 = getelementptr inbounds i8, i8* %60, i32 1
  store i8* %incdec.ptr101, i8** %q, align 4
  store i8 46, i8* %60, align 1
  %61 = load i8*, i8** %q, align 4
  store i8* %61, i8** %dotdot, align 4
  br label %if.end102

if.end102:                                        ; preds = %if.end99, %if.else91
  br label %if.end103

if.end103:                                        ; preds = %if.end102, %while.end
  br label %if.end140

if.else104:                                       ; preds = %lor.lhs.false54, %land.lhs.true44, %if.else39
  %62 = load i8*, i8** %q, align 4
  %63 = load i8*, i8** %base, align 4
  %cmp105 = icmp ne i8* %62, %63
  br i1 %cmp105, label %if.then107, label %if.end109

if.then107:                                       ; preds = %if.else104
  %64 = load i8*, i8** %q, align 4
  %incdec.ptr108 = getelementptr inbounds i8, i8* %64, i32 1
  store i8* %incdec.ptr108, i8** %q, align 4
  store i8 47, i8* %64, align 1
  br label %if.end109

if.end109:                                        ; preds = %if.then107, %if.else104
  br label %while.cond110

while.cond110:                                    ; preds = %while.body121, %if.end109
  %65 = load i8*, i8** %p, align 4
  %66 = load i8, i8* %65, align 1
  %conv111 = sext i8 %66 to i32
  %tobool112 = icmp ne i32 %conv111, 0
  br i1 %tobool112, label %land.rhs113, label %land.end119

land.rhs113:                                      ; preds = %while.cond110
  %67 = load i8*, i8** %p, align 4
  %68 = load i8, i8* %67, align 1
  %conv114 = sext i8 %68 to i32
  %cmp115 = icmp eq i32 %conv114, 47
  %conv116 = zext i1 %cmp115 to i32
  %cmp117 = icmp eq i32 %conv116, 0
  br label %land.end119

land.end119:                                      ; preds = %land.rhs113, %while.cond110
  %69 = phi i1 [ false, %while.cond110 ], [ %cmp117, %land.rhs113 ]
  br i1 %69, label %while.body121, label %while.end124

while.body121:                                    ; preds = %land.end119
  %70 = load i8*, i8** %p, align 4
  %incdec.ptr122 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %incdec.ptr122, i8** %p, align 4
  %71 = load i8, i8* %70, align 1
  %72 = load i8*, i8** %q, align 4
  %incdec.ptr123 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %incdec.ptr123, i8** %q, align 4
  store i8 %71, i8* %72, align 1
  br label %while.cond110

while.end124:                                     ; preds = %land.end119
  %73 = load i32, i32* %flags.addr, align 4
  %and125 = and i32 %73, 2
  %tobool126 = icmp ne i32 %and125, 0
  br i1 %tobool126, label %if.then127, label %if.end139

if.then127:                                       ; preds = %while.end124
  %74 = load i8*, i8** %q, align 4
  %75 = load i8, i8* %74, align 1
  store i8 %75, i8* %c128, align 1
  %76 = load i8*, i8** %q, align 4
  store i8 0, i8* %76, align 1
  %77 = load i8*, i8** %result, align 4
  %call129 = call i32 @_path_isdir(i8* %77)
  %cmp130 = icmp eq i32 %call129, 0
  br i1 %cmp130, label %if.then132, label %if.end138

if.then132:                                       ; preds = %if.then127
  %78 = load i32, i32* %flags.addr, align 4
  %and133 = and i32 %78, 8
  %cmp134 = icmp eq i32 %and133, 0
  br i1 %cmp134, label %if.then136, label %if.end137

if.then136:                                       ; preds = %if.then132
  %79 = load i8*, i8** %result, align 4
  call void @sh_xfree(i8* %79, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 209)
  br label %if.end137

if.end137:                                        ; preds = %if.then136, %if.then132
  store i8* null, i8** %retval, align 4
  br label %return

if.end138:                                        ; preds = %if.then127
  %80 = load i8, i8* %c128, align 1
  %81 = load i8*, i8** %q, align 4
  store i8 %80, i8* %81, align 1
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %while.end124
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %if.end103
  br label %if.end141

if.end141:                                        ; preds = %if.end140, %if.then37
  br label %if.end142

if.end142:                                        ; preds = %if.end141, %if.then22
  br label %while.cond

while.end143:                                     ; preds = %while.cond
  %82 = load i8*, i8** %q, align 4
  %83 = load i8*, i8** %result, align 4
  %cmp144 = icmp eq i8* %82, %83
  br i1 %cmp144, label %if.then146, label %if.end148

if.then146:                                       ; preds = %while.end143
  %84 = load i8, i8* %stub_char, align 1
  %85 = load i8*, i8** %q, align 4
  %incdec.ptr147 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %incdec.ptr147, i8** %q, align 4
  store i8 %84, i8* %85, align 1
  br label %if.end148

if.end148:                                        ; preds = %if.then146, %while.end143
  %86 = load i8*, i8** %q, align 4
  store i8 0, i8* %86, align 1
  %87 = load i8*, i8** %result, align 4
  %arrayidx149 = getelementptr inbounds i8, i8* %87, i32 0
  %88 = load i8, i8* %arrayidx149, align 1
  %conv150 = sext i8 %88 to i32
  %cmp151 = icmp eq i32 %conv150, 47
  br i1 %cmp151, label %land.lhs.true153, label %if.end177

land.lhs.true153:                                 ; preds = %if.end148
  %89 = load i8*, i8** %result, align 4
  %arrayidx154 = getelementptr inbounds i8, i8* %89, i32 1
  %90 = load i8, i8* %arrayidx154, align 1
  %conv155 = sext i8 %90 to i32
  %cmp156 = icmp eq i32 %conv155, 47
  br i1 %cmp156, label %land.lhs.true158, label %if.end177

land.lhs.true158:                                 ; preds = %land.lhs.true153
  %91 = load i8*, i8** %result, align 4
  %arrayidx159 = getelementptr inbounds i8, i8* %91, i32 2
  %92 = load i8, i8* %arrayidx159, align 1
  %conv160 = sext i8 %92 to i32
  %cmp161 = icmp ne i32 %conv160, 47
  br i1 %cmp161, label %land.lhs.true163, label %if.end177

land.lhs.true163:                                 ; preds = %land.lhs.true158
  %93 = load i32, i32* %double_slash_path, align 4
  %cmp164 = icmp eq i32 %93, 0
  br i1 %cmp164, label %if.then166, label %if.end177

if.then166:                                       ; preds = %land.lhs.true163
  %94 = load i8*, i8** %result, align 4
  %arrayidx167 = getelementptr inbounds i8, i8* %94, i32 2
  %95 = load i8, i8* %arrayidx167, align 1
  %conv168 = sext i8 %95 to i32
  %cmp169 = icmp eq i32 %conv168, 0
  br i1 %cmp169, label %if.then171, label %if.else173

if.then171:                                       ; preds = %if.then166
  %96 = load i8*, i8** %result, align 4
  %arrayidx172 = getelementptr inbounds i8, i8* %96, i32 1
  store i8 0, i8* %arrayidx172, align 1
  br label %if.end176

if.else173:                                       ; preds = %if.then166
  %97 = load i8*, i8** %result, align 4
  %98 = load i8*, i8** %result, align 4
  %add.ptr174 = getelementptr inbounds i8, i8* %98, i32 1
  %call175 = call i8* @strcpy(i8* %97, i8* %add.ptr174)
  br label %if.end176

if.end176:                                        ; preds = %if.else173, %if.then171
  br label %if.end177

if.end177:                                        ; preds = %if.end176, %land.lhs.true163, %land.lhs.true158, %land.lhs.true153, %if.end148
  %99 = load i8*, i8** %result, align 4
  store i8* %99, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end177, %if.end137, %if.end75
  %100 = load i8*, i8** %retval, align 4
  ret i8* %100
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @_path_isdir(i8* %path) #0 {
entry:
  %path.addr = alloca i8*, align 4
  %l = alloca i32, align 4
  %sb = alloca %struct.stat, align 8
  store i8* %path, i8** %path.addr, align 4
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %call1 = call i32 @stat(i8* %0, %struct.stat* %sb)
  %cmp = icmp eq i32 %call1, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 6
  %1 = load i32, i32* %st_mode, align 8
  %and = and i32 %1, 61440
  %cmp2 = icmp eq i32 %and, 16384
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp2, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  store i32 %land.ext, i32* %l, align 4
  %3 = load i32, i32* %l, align 4
  ret i32 %3
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32* @__errno_location() #1

declare i32 @stat(i8*, %struct.stat*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
