; ModuleID = 'type.c'
source_filename = "type.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.alias = type { i8*, i8*, i8 }
%struct.command = type { i32, i32, i32, %struct.redirect*, %union.anon }
%struct.redirect = type { %struct.redirect*, %union.REDIRECTEE, i32, i32, i32, %union.REDIRECTEE, i8* }
%union.REDIRECTEE = type { i32 }
%union.anon = type { %struct.for_com* }
%struct.for_com = type { i32, i32, %struct.word_desc*, %struct.word_list*, %struct.command* }

@.str = private unnamed_addr constant [5 x i8] c"type\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"-type\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"-path\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"all\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"-all\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"afptP\00", align 1
@loptend = external global %struct.word_list*, align 4
@expand_aliases = external global i32, align 4
@.str.7 = private unnamed_addr constant [6 x i8] c"alias\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"%s is aliased to `%s'\0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"alias %s=%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"./type.def\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"keyword\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"%s is a shell keyword\0A\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.14 = private unnamed_addr constant [9 x i8] c"function\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"%s is a function\0A\00", align 1
@.str.16 = private unnamed_addr constant [8 x i8] c"builtin\00", align 1
@posixly_correct = external global i32, align 4
@.str.17 = private unnamed_addr constant [31 x i8] c"%s is a special shell builtin\0A\00", align 1
@.str.18 = private unnamed_addr constant [23 x i8] c"%s is a shell builtin\0A\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str.20 = private unnamed_addr constant [10 x i8] c"%s is %s\0A\00", align 1
@.str.21 = private unnamed_addr constant [19 x i8] c"%s is hashed (%s)\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @type_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %dflags = alloca i32, align 4
  %any_failed = alloca i32, align 4
  %opt = alloca i32, align 4
  %this = alloca %struct.word_list*, align 4
  %flag = alloca i8*, align 4
  %found = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 2, i32* %dflags, align 4
  store i32 0, i32* %any_failed, align 4
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  store %struct.word_list* %1, %struct.word_list** %this, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load %struct.word_list*, %struct.word_list** %this, align 4
  %tobool = icmp ne %struct.word_list* %2, null
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp2, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word5, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %arrayidx6, i8** %flag, align 4
  %11 = load i8*, i8** %flag, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %12 to i32
  %13 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp eq i32 %conv8, %conv9
  br i1 %cmp10, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %for.body
  %14 = load i8*, i8** %flag, align 4
  %call = call i32 @strcmp(i8* %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  %cmp12 = icmp eq i32 %call, 0
  br i1 %cmp12, label %if.then23, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %for.body
  %15 = load i8*, i8** %flag, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %16 to i32
  %17 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), align 1
  %conv16 = sext i8 %17 to i32
  %cmp17 = icmp eq i32 %conv15, %conv16
  br i1 %cmp17, label %land.lhs.true19, label %if.else

land.lhs.true19:                                  ; preds = %lor.lhs.false
  %18 = load i8*, i8** %flag, align 4
  %call20 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0))
  %cmp21 = icmp eq i32 %call20, 0
  br i1 %cmp21, label %if.then23, label %if.else

if.then23:                                        ; preds = %land.lhs.true19, %land.lhs.true
  %19 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word24 = getelementptr inbounds %struct.word_list, %struct.word_list* %19, i32 0, i32 1
  %20 = load %struct.word_desc*, %struct.word_desc** %word24, align 4
  %word25 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %20, i32 0, i32 0
  %21 = load i8*, i8** %word25, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %21, i32 1
  store i8 116, i8* %arrayidx26, align 1
  %22 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word27 = getelementptr inbounds %struct.word_list, %struct.word_list* %22, i32 0, i32 1
  %23 = load %struct.word_desc*, %struct.word_desc** %word27, align 4
  %word28 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %23, i32 0, i32 0
  %24 = load i8*, i8** %word28, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %24, i32 2
  store i8 0, i8* %arrayidx29, align 1
  br label %if.end85

if.else:                                          ; preds = %land.lhs.true19, %lor.lhs.false
  %25 = load i8*, i8** %flag, align 4
  %arrayidx30 = getelementptr inbounds i8, i8* %25, i32 0
  %26 = load i8, i8* %arrayidx30, align 1
  %conv31 = sext i8 %26 to i32
  %27 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv32 = sext i8 %27 to i32
  %cmp33 = icmp eq i32 %conv31, %conv32
  br i1 %cmp33, label %land.lhs.true35, label %lor.lhs.false39

land.lhs.true35:                                  ; preds = %if.else
  %28 = load i8*, i8** %flag, align 4
  %call36 = call i32 @strcmp(i8* %28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  %cmp37 = icmp eq i32 %call36, 0
  br i1 %cmp37, label %if.then49, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %land.lhs.true35, %if.else
  %29 = load i8*, i8** %flag, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %29, i32 0
  %30 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %30 to i32
  %31 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), align 1
  %conv42 = sext i8 %31 to i32
  %cmp43 = icmp eq i32 %conv41, %conv42
  br i1 %cmp43, label %land.lhs.true45, label %if.else56

land.lhs.true45:                                  ; preds = %lor.lhs.false39
  %32 = load i8*, i8** %flag, align 4
  %call46 = call i32 @strcmp(i8* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0))
  %cmp47 = icmp eq i32 %call46, 0
  br i1 %cmp47, label %if.then49, label %if.else56

if.then49:                                        ; preds = %land.lhs.true45, %land.lhs.true35
  %33 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word50 = getelementptr inbounds %struct.word_list, %struct.word_list* %33, i32 0, i32 1
  %34 = load %struct.word_desc*, %struct.word_desc** %word50, align 4
  %word51 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %34, i32 0, i32 0
  %35 = load i8*, i8** %word51, align 4
  %arrayidx52 = getelementptr inbounds i8, i8* %35, i32 1
  store i8 112, i8* %arrayidx52, align 1
  %36 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word53 = getelementptr inbounds %struct.word_list, %struct.word_list* %36, i32 0, i32 1
  %37 = load %struct.word_desc*, %struct.word_desc** %word53, align 4
  %word54 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %37, i32 0, i32 0
  %38 = load i8*, i8** %word54, align 4
  %arrayidx55 = getelementptr inbounds i8, i8* %38, i32 2
  store i8 0, i8* %arrayidx55, align 1
  br label %if.end84

if.else56:                                        ; preds = %land.lhs.true45, %lor.lhs.false39
  %39 = load i8*, i8** %flag, align 4
  %arrayidx57 = getelementptr inbounds i8, i8* %39, i32 0
  %40 = load i8, i8* %arrayidx57, align 1
  %conv58 = sext i8 %40 to i32
  %41 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), align 1
  %conv59 = sext i8 %41 to i32
  %cmp60 = icmp eq i32 %conv58, %conv59
  br i1 %cmp60, label %land.lhs.true62, label %lor.lhs.false66

land.lhs.true62:                                  ; preds = %if.else56
  %42 = load i8*, i8** %flag, align 4
  %call63 = call i32 @strcmp(i8* %42, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
  %cmp64 = icmp eq i32 %call63, 0
  br i1 %cmp64, label %if.then76, label %lor.lhs.false66

lor.lhs.false66:                                  ; preds = %land.lhs.true62, %if.else56
  %43 = load i8*, i8** %flag, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %43, i32 0
  %44 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %44 to i32
  %45 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), align 1
  %conv69 = sext i8 %45 to i32
  %cmp70 = icmp eq i32 %conv68, %conv69
  br i1 %cmp70, label %land.lhs.true72, label %if.end83

land.lhs.true72:                                  ; preds = %lor.lhs.false66
  %46 = load i8*, i8** %flag, align 4
  %call73 = call i32 @strcmp(i8* %46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0))
  %cmp74 = icmp eq i32 %call73, 0
  br i1 %cmp74, label %if.then76, label %if.end83

if.then76:                                        ; preds = %land.lhs.true72, %land.lhs.true62
  %47 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word77 = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word77, align 4
  %word78 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word78, align 4
  %arrayidx79 = getelementptr inbounds i8, i8* %49, i32 1
  store i8 97, i8* %arrayidx79, align 1
  %50 = load %struct.word_list*, %struct.word_list** %this, align 4
  %word80 = getelementptr inbounds %struct.word_list, %struct.word_list* %50, i32 0, i32 1
  %51 = load %struct.word_desc*, %struct.word_desc** %word80, align 4
  %word81 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %51, i32 0, i32 0
  %52 = load i8*, i8** %word81, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %52, i32 2
  store i8 0, i8* %arrayidx82, align 1
  br label %if.end83

if.end83:                                         ; preds = %if.then76, %land.lhs.true72, %lor.lhs.false66
  br label %if.end84

if.end84:                                         ; preds = %if.end83, %if.then49
  br label %if.end85

if.end85:                                         ; preds = %if.end84, %if.then23
  br label %for.inc

for.inc:                                          ; preds = %if.end85
  %53 = load %struct.word_list*, %struct.word_list** %this, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %53, i32 0, i32 0
  %54 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %54, %struct.word_list** %this, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %for.end
  %55 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call86 = call i32 @internal_getopt(%struct.word_list* %55, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0))
  store i32 %call86, i32* %opt, align 4
  %cmp87 = icmp ne i32 %call86, -1
  br i1 %cmp87, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %56 = load i32, i32* %opt, align 4
  switch i32 %56, label %sw.default [
    i32 97, label %sw.bb
    i32 102, label %sw.bb89
    i32 112, label %sw.bb91
    i32 116, label %sw.bb93
    i32 80, label %sw.bb96
    i32 -99, label %sw.bb99
  ]

sw.bb:                                            ; preds = %while.body
  %57 = load i32, i32* %dflags, align 4
  %or = or i32 %57, 1
  store i32 %or, i32* %dflags, align 4
  br label %sw.epilog

sw.bb89:                                          ; preds = %while.body
  %58 = load i32, i32* %dflags, align 4
  %or90 = or i32 %58, 64
  store i32 %or90, i32* %dflags, align 4
  br label %sw.epilog

sw.bb91:                                          ; preds = %while.body
  %59 = load i32, i32* %dflags, align 4
  %or92 = or i32 %59, 16
  store i32 %or92, i32* %dflags, align 4
  %60 = load i32, i32* %dflags, align 4
  %and = and i32 %60, -11
  store i32 %and, i32* %dflags, align 4
  br label %sw.epilog

sw.bb93:                                          ; preds = %while.body
  %61 = load i32, i32* %dflags, align 4
  %or94 = or i32 %61, 8
  store i32 %or94, i32* %dflags, align 4
  %62 = load i32, i32* %dflags, align 4
  %and95 = and i32 %62, -19
  store i32 %and95, i32* %dflags, align 4
  br label %sw.epilog

sw.bb96:                                          ; preds = %while.body
  %63 = load i32, i32* %dflags, align 4
  %or97 = or i32 %63, 48
  store i32 %or97, i32* %dflags, align 4
  %64 = load i32, i32* %dflags, align 4
  %and98 = and i32 %64, -11
  store i32 %and98, i32* %dflags, align 4
  br label %sw.epilog

sw.bb99:                                          ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb96, %sw.bb93, %sw.bb91, %sw.bb89, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %65 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %65, %struct.word_list** %list.addr, align 4
  br label %while.cond100

while.cond100:                                    ; preds = %if.end114, %while.end
  %66 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool101 = icmp ne %struct.word_list* %66, null
  br i1 %tobool101, label %while.body102, label %while.end118

while.body102:                                    ; preds = %while.cond100
  %67 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word103 = getelementptr inbounds %struct.word_list, %struct.word_list* %67, i32 0, i32 1
  %68 = load %struct.word_desc*, %struct.word_desc** %word103, align 4
  %word104 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %68, i32 0, i32 0
  %69 = load i8*, i8** %word104, align 4
  %70 = load i32, i32* %dflags, align 4
  %call105 = call i32 @describe_command(i8* %69, i32 %70)
  store i32 %call105, i32* %found, align 4
  %71 = load i32, i32* %found, align 4
  %tobool106 = icmp ne i32 %71, 0
  br i1 %tobool106, label %if.end114, label %land.lhs.true107

land.lhs.true107:                                 ; preds = %while.body102
  %72 = load i32, i32* %dflags, align 4
  %and108 = and i32 %72, 24
  %cmp109 = icmp eq i32 %and108, 0
  br i1 %cmp109, label %if.then111, label %if.end114

if.then111:                                       ; preds = %land.lhs.true107
  %73 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word112 = getelementptr inbounds %struct.word_list, %struct.word_list* %73, i32 0, i32 1
  %74 = load %struct.word_desc*, %struct.word_desc** %word112, align 4
  %word113 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %74, i32 0, i32 0
  %75 = load i8*, i8** %word113, align 4
  call void @sh_notfound(i8* %75)
  br label %if.end114

if.end114:                                        ; preds = %if.then111, %land.lhs.true107, %while.body102
  %76 = load i32, i32* %found, align 4
  %cmp115 = icmp eq i32 %76, 0
  %conv116 = zext i1 %cmp115 to i32
  %77 = load i32, i32* %any_failed, align 4
  %add = add nsw i32 %77, %conv116
  store i32 %add, i32* %any_failed, align 4
  %78 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next117 = getelementptr inbounds %struct.word_list, %struct.word_list* %78, i32 0, i32 0
  %79 = load %struct.word_list*, %struct.word_list** %next117, align 4
  store %struct.word_list* %79, %struct.word_list** %list.addr, align 4
  br label %while.cond100

while.end118:                                     ; preds = %while.cond100
  %80 = load i32, i32* %any_failed, align 4
  %cmp119 = icmp eq i32 %80, 0
  %cond = select i1 %cmp119, i32 0, i32 1
  store i32 %cond, i32* %opt, align 4
  %81 = load i32, i32* %opt, align 4
  %call121 = call i32 @sh_chkwrite(i32 %81)
  store i32 %call121, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end118, %sw.default, %sw.bb99, %if.then
  %82 = load i32, i32* %retval, align 4
  ret i32 %82
}

declare i32 @strcmp(i8*, i8*) #1

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

; Function Attrs: noinline nounwind
define i32 @describe_command(i8* %command, i32 %dflags) #0 {
entry:
  %retval = alloca i32, align 4
  %command.addr = alloca i8*, align 4
  %dflags.addr = alloca i32, align 4
  %found = alloca i32, align 4
  %i = alloca i32, align 4
  %found_file = alloca i32, align 4
  %f = alloca i32, align 4
  %all = alloca i32, align 4
  %full_path = alloca i8*, align 4
  %x = alloca i8*, align 4
  %pathlist = alloca i8*, align 4
  %func = alloca %struct.variable*, align 4
  %alias = alloca %struct.alias*, align 4
  %result = alloca i8*, align 4
  store i8* %command, i8** %command.addr, align 4
  store i32 %dflags, i32* %dflags.addr, align 4
  %0 = load i32, i32* %dflags.addr, align 4
  %and = and i32 %0, 1
  %cmp = icmp ne i32 %and, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %all, align 4
  store i32 0, i32* %found_file, align 4
  store i32 0, i32* %found, align 4
  store i8* null, i8** %full_path, align 4
  %1 = load i32, i32* %dflags.addr, align 4
  %and1 = and i32 %1, 32
  %cmp2 = icmp eq i32 %and1, 0
  br i1 %cmp2, label %land.lhs.true, label %if.end28

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* @expand_aliases, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %land.lhs.true4, label %if.end28

land.lhs.true4:                                   ; preds = %land.lhs.true
  %3 = load i8*, i8** %command.addr, align 4
  %call = call %struct.alias* @find_alias(i8* %3)
  store %struct.alias* %call, %struct.alias** %alias, align 4
  %tobool5 = icmp ne %struct.alias* %call, null
  br i1 %tobool5, label %if.then, label %if.end28

if.then:                                          ; preds = %land.lhs.true4
  %4 = load i32, i32* %dflags.addr, align 4
  %and6 = and i32 %4, 8
  %tobool7 = icmp ne i32 %and6, 0
  br i1 %tobool7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.then
  %call9 = call i32 @puts(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0))
  br label %if.end23

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %dflags.addr, align 4
  %and10 = and i32 %5, 2
  %tobool11 = icmp ne i32 %and10, 0
  br i1 %tobool11, label %if.then12, label %if.else15

if.then12:                                        ; preds = %if.else
  %call13 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i32 0, i32 0))
  %6 = load i8*, i8** %command.addr, align 4
  %7 = load %struct.alias*, %struct.alias** %alias, align 4
  %value = getelementptr inbounds %struct.alias, %struct.alias* %7, i32 0, i32 1
  %8 = load i8*, i8** %value, align 4
  %call14 = call i32 (i8*, ...) @printf(i8* %call13, i8* %6, i8* %8)
  br label %if.end22

if.else15:                                        ; preds = %if.else
  %9 = load i32, i32* %dflags.addr, align 4
  %and16 = and i32 %9, 4
  %tobool17 = icmp ne i32 %and16, 0
  br i1 %tobool17, label %if.then18, label %if.end

if.then18:                                        ; preds = %if.else15
  %10 = load %struct.alias*, %struct.alias** %alias, align 4
  %value19 = getelementptr inbounds %struct.alias, %struct.alias* %10, i32 0, i32 1
  %11 = load i8*, i8** %value19, align 4
  %call20 = call i8* @sh_single_quote(i8* %11)
  store i8* %call20, i8** %x, align 4
  %12 = load i8*, i8** %command.addr, align 4
  %13 = load i8*, i8** %x, align 4
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0), i8* %12, i8* %13)
  %14 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %14, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 241)
  br label %if.end

if.end:                                           ; preds = %if.then18, %if.else15
  br label %if.end22

if.end22:                                         ; preds = %if.end, %if.then12
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.then8
  store i32 1, i32* %found, align 4
  %15 = load i32, i32* %all, align 4
  %cmp24 = icmp eq i32 %15, 0
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.end23
  store i32 1, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %if.end23
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %land.lhs.true4, %land.lhs.true, %entry
  %16 = load i32, i32* %dflags.addr, align 4
  %and29 = and i32 %16, 32
  %cmp30 = icmp eq i32 %and29, 0
  br i1 %cmp30, label %land.lhs.true32, label %if.end59

land.lhs.true32:                                  ; preds = %if.end28
  %17 = load i8*, i8** %command.addr, align 4
  %call33 = call i32 @find_reserved_word(i8* %17)
  store i32 %call33, i32* %i, align 4
  %cmp34 = icmp sge i32 %call33, 0
  br i1 %cmp34, label %if.then36, label %if.end59

if.then36:                                        ; preds = %land.lhs.true32
  %18 = load i32, i32* %dflags.addr, align 4
  %and37 = and i32 %18, 8
  %tobool38 = icmp ne i32 %and37, 0
  br i1 %tobool38, label %if.then39, label %if.else41

if.then39:                                        ; preds = %if.then36
  %call40 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0))
  br label %if.end54

if.else41:                                        ; preds = %if.then36
  %19 = load i32, i32* %dflags.addr, align 4
  %and42 = and i32 %19, 2
  %tobool43 = icmp ne i32 %and42, 0
  br i1 %tobool43, label %if.then44, label %if.else47

if.then44:                                        ; preds = %if.else41
  %call45 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.12, i32 0, i32 0))
  %20 = load i8*, i8** %command.addr, align 4
  %call46 = call i32 (i8*, ...) @printf(i8* %call45, i8* %20)
  br label %if.end53

if.else47:                                        ; preds = %if.else41
  %21 = load i32, i32* %dflags.addr, align 4
  %and48 = and i32 %21, 4
  %tobool49 = icmp ne i32 %and48, 0
  br i1 %tobool49, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.else47
  %22 = load i8*, i8** %command.addr, align 4
  %call51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %22)
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.else47
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then44
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then39
  store i32 1, i32* %found, align 4
  %23 = load i32, i32* %all, align 4
  %cmp55 = icmp eq i32 %23, 0
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end54
  store i32 1, i32* %retval, align 4
  br label %return

if.end58:                                         ; preds = %if.end54
  br label %if.end59

if.end59:                                         ; preds = %if.end58, %land.lhs.true32, %if.end28
  %24 = load i32, i32* %dflags.addr, align 4
  %and60 = and i32 %24, 96
  %cmp61 = icmp eq i32 %and60, 0
  br i1 %cmp61, label %land.lhs.true63, label %if.end92

land.lhs.true63:                                  ; preds = %if.end59
  %25 = load i8*, i8** %command.addr, align 4
  %call64 = call %struct.variable* @find_function(i8* %25)
  store %struct.variable* %call64, %struct.variable** %func, align 4
  %tobool65 = icmp ne %struct.variable* %call64, null
  br i1 %tobool65, label %if.then66, label %if.end92

if.then66:                                        ; preds = %land.lhs.true63
  %26 = load i32, i32* %dflags.addr, align 4
  %and67 = and i32 %26, 8
  %tobool68 = icmp ne i32 %and67, 0
  br i1 %tobool68, label %if.then69, label %if.else71

if.then69:                                        ; preds = %if.then66
  %call70 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.14, i32 0, i32 0))
  br label %if.end87

if.else71:                                        ; preds = %if.then66
  %27 = load i32, i32* %dflags.addr, align 4
  %and72 = and i32 %27, 2
  %tobool73 = icmp ne i32 %and72, 0
  br i1 %tobool73, label %if.then74, label %if.else80

if.then74:                                        ; preds = %if.else71
  %call75 = call i8* @libintl_gettext(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.15, i32 0, i32 0))
  %28 = load i8*, i8** %command.addr, align 4
  %call76 = call i32 (i8*, ...) @printf(i8* %call75, i8* %28)
  %29 = load i8*, i8** %command.addr, align 4
  %30 = load %struct.variable*, %struct.variable** %func, align 4
  %value77 = getelementptr inbounds %struct.variable, %struct.variable* %30, i32 0, i32 1
  %31 = load i8*, i8** %value77, align 4
  %32 = bitcast i8* %31 to %struct.command*
  %call78 = call i8* @named_function_string(i8* %29, %struct.command* %32, i32 3)
  store i8* %call78, i8** %result, align 4
  %33 = load i8*, i8** %result, align 4
  %call79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %33)
  br label %if.end86

if.else80:                                        ; preds = %if.else71
  %34 = load i32, i32* %dflags.addr, align 4
  %and81 = and i32 %34, 4
  %tobool82 = icmp ne i32 %and81, 0
  br i1 %tobool82, label %if.then83, label %if.end85

if.then83:                                        ; preds = %if.else80
  %35 = load i8*, i8** %command.addr, align 4
  %call84 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %35)
  br label %if.end85

if.end85:                                         ; preds = %if.then83, %if.else80
  br label %if.end86

if.end86:                                         ; preds = %if.end85, %if.then74
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %if.then69
  store i32 1, i32* %found, align 4
  %36 = load i32, i32* %all, align 4
  %cmp88 = icmp eq i32 %36, 0
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end87
  store i32 1, i32* %retval, align 4
  br label %return

if.end91:                                         ; preds = %if.end87
  br label %if.end92

if.end92:                                         ; preds = %if.end91, %land.lhs.true63, %if.end59
  %37 = load i32, i32* %dflags.addr, align 4
  %and93 = and i32 %37, 32
  %cmp94 = icmp eq i32 %and93, 0
  br i1 %cmp94, label %land.lhs.true96, label %if.end132

land.lhs.true96:                                  ; preds = %if.end92
  %38 = load i8*, i8** %command.addr, align 4
  %call97 = call i32 (%struct.word_list*)* @find_shell_builtin(i8* %38)
  %tobool98 = icmp ne i32 (%struct.word_list*)* %call97, null
  br i1 %tobool98, label %if.then99, label %if.end132

if.then99:                                        ; preds = %land.lhs.true96
  %39 = load i32, i32* %dflags.addr, align 4
  %and100 = and i32 %39, 8
  %tobool101 = icmp ne i32 %and100, 0
  br i1 %tobool101, label %if.then102, label %if.else104

if.then102:                                       ; preds = %if.then99
  %call103 = call i32 @puts(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.16, i32 0, i32 0))
  br label %if.end127

if.else104:                                       ; preds = %if.then99
  %40 = load i32, i32* %dflags.addr, align 4
  %and105 = and i32 %40, 2
  %tobool106 = icmp ne i32 %and105, 0
  br i1 %tobool106, label %if.then107, label %if.else120

if.then107:                                       ; preds = %if.else104
  %41 = load i32, i32* @posixly_correct, align 4
  %tobool108 = icmp ne i32 %41, 0
  br i1 %tobool108, label %land.lhs.true109, label %if.else116

land.lhs.true109:                                 ; preds = %if.then107
  %42 = load i8*, i8** %command.addr, align 4
  %call110 = call i32 (%struct.word_list*)* @find_special_builtin(i8* %42)
  %cmp111 = icmp ne i32 (%struct.word_list*)* %call110, null
  br i1 %cmp111, label %if.then113, label %if.else116

if.then113:                                       ; preds = %land.lhs.true109
  %call114 = call i8* @libintl_gettext(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.17, i32 0, i32 0))
  %43 = load i8*, i8** %command.addr, align 4
  %call115 = call i32 (i8*, ...) @printf(i8* %call114, i8* %43)
  br label %if.end119

if.else116:                                       ; preds = %land.lhs.true109, %if.then107
  %call117 = call i8* @libintl_gettext(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.18, i32 0, i32 0))
  %44 = load i8*, i8** %command.addr, align 4
  %call118 = call i32 (i8*, ...) @printf(i8* %call117, i8* %44)
  br label %if.end119

if.end119:                                        ; preds = %if.else116, %if.then113
  br label %if.end126

if.else120:                                       ; preds = %if.else104
  %45 = load i32, i32* %dflags.addr, align 4
  %and121 = and i32 %45, 4
  %tobool122 = icmp ne i32 %and121, 0
  br i1 %tobool122, label %if.then123, label %if.end125

if.then123:                                       ; preds = %if.else120
  %46 = load i8*, i8** %command.addr, align 4
  %call124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %46)
  br label %if.end125

if.end125:                                        ; preds = %if.then123, %if.else120
  br label %if.end126

if.end126:                                        ; preds = %if.end125, %if.end119
  br label %if.end127

if.end127:                                        ; preds = %if.end126, %if.then102
  store i32 1, i32* %found, align 4
  %47 = load i32, i32* %all, align 4
  %cmp128 = icmp eq i32 %47, 0
  br i1 %cmp128, label %if.then130, label %if.end131

if.then130:                                       ; preds = %if.end127
  store i32 1, i32* %retval, align 4
  br label %return

if.end131:                                        ; preds = %if.end127
  br label %if.end132

if.end132:                                        ; preds = %if.end131, %land.lhs.true96, %if.end92
  %48 = load i8*, i8** %command.addr, align 4
  %call133 = call i32 @absolute_program(i8* %48)
  %tobool134 = icmp ne i32 %call133, 0
  br i1 %tobool134, label %if.then135, label %if.end159

if.then135:                                       ; preds = %if.end132
  %49 = load i8*, i8** %command.addr, align 4
  %call136 = call i32 @file_status(i8* %49)
  store i32 %call136, i32* %f, align 4
  %50 = load i32, i32* %f, align 4
  %and137 = and i32 %50, 2
  %tobool138 = icmp ne i32 %and137, 0
  br i1 %tobool138, label %if.then139, label %if.end158

if.then139:                                       ; preds = %if.then135
  %51 = load i32, i32* %dflags.addr, align 4
  %and140 = and i32 %51, 8
  %tobool141 = icmp ne i32 %and140, 0
  br i1 %tobool141, label %if.then142, label %if.else144

if.then142:                                       ; preds = %if.then139
  %call143 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0))
  br label %if.end157

if.else144:                                       ; preds = %if.then139
  %52 = load i32, i32* %dflags.addr, align 4
  %and145 = and i32 %52, 2
  %tobool146 = icmp ne i32 %and145, 0
  br i1 %tobool146, label %if.then147, label %if.else150

if.then147:                                       ; preds = %if.else144
  %call148 = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.20, i32 0, i32 0))
  %53 = load i8*, i8** %command.addr, align 4
  %54 = load i8*, i8** %command.addr, align 4
  %call149 = call i32 (i8*, ...) @printf(i8* %call148, i8* %53, i8* %54)
  br label %if.end156

if.else150:                                       ; preds = %if.else144
  %55 = load i32, i32* %dflags.addr, align 4
  %and151 = and i32 %55, 20
  %tobool152 = icmp ne i32 %and151, 0
  br i1 %tobool152, label %if.then153, label %if.end155

if.then153:                                       ; preds = %if.else150
  %56 = load i8*, i8** %command.addr, align 4
  %call154 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %56)
  br label %if.end155

if.end155:                                        ; preds = %if.then153, %if.else150
  br label %if.end156

if.end156:                                        ; preds = %if.end155, %if.then147
  br label %if.end157

if.end157:                                        ; preds = %if.end156, %if.then142
  store i32 1, i32* %retval, align 4
  br label %return

if.end158:                                        ; preds = %if.then135
  br label %if.end159

if.end159:                                        ; preds = %if.end158, %if.end132
  %57 = load i32, i32* %all, align 4
  %cmp160 = icmp eq i32 %57, 0
  br i1 %cmp160, label %if.then164, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end159
  %58 = load i32, i32* %dflags.addr, align 4
  %and162 = and i32 %58, 32
  %tobool163 = icmp ne i32 %and162, 0
  br i1 %tobool163, label %if.then164, label %if.end187

if.then164:                                       ; preds = %lor.lhs.false, %if.end159
  %59 = load i8*, i8** %command.addr, align 4
  %call165 = call i8* @phash_search(i8* %59)
  store i8* %call165, i8** %full_path, align 4
  %tobool166 = icmp ne i8* %call165, null
  br i1 %tobool166, label %if.then167, label %if.end186

if.then167:                                       ; preds = %if.then164
  %60 = load i32, i32* %dflags.addr, align 4
  %and168 = and i32 %60, 8
  %tobool169 = icmp ne i32 %and168, 0
  br i1 %tobool169, label %if.then170, label %if.else172

if.then170:                                       ; preds = %if.then167
  %call171 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0))
  br label %if.end185

if.else172:                                       ; preds = %if.then167
  %61 = load i32, i32* %dflags.addr, align 4
  %and173 = and i32 %61, 2
  %tobool174 = icmp ne i32 %and173, 0
  br i1 %tobool174, label %if.then175, label %if.else178

if.then175:                                       ; preds = %if.else172
  %call176 = call i8* @libintl_gettext(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.21, i32 0, i32 0))
  %62 = load i8*, i8** %command.addr, align 4
  %63 = load i8*, i8** %full_path, align 4
  %call177 = call i32 (i8*, ...) @printf(i8* %call176, i8* %62, i8* %63)
  br label %if.end184

if.else178:                                       ; preds = %if.else172
  %64 = load i32, i32* %dflags.addr, align 4
  %and179 = and i32 %64, 20
  %tobool180 = icmp ne i32 %and179, 0
  br i1 %tobool180, label %if.then181, label %if.end183

if.then181:                                       ; preds = %if.else178
  %65 = load i8*, i8** %full_path, align 4
  %call182 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %65)
  br label %if.end183

if.end183:                                        ; preds = %if.then181, %if.else178
  br label %if.end184

if.end184:                                        ; preds = %if.end183, %if.then175
  br label %if.end185

if.end185:                                        ; preds = %if.end184, %if.then170
  %66 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %66, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 348)
  store i32 1, i32* %retval, align 4
  br label %return

if.end186:                                        ; preds = %if.then164
  br label %if.end187

if.end187:                                        ; preds = %if.end186, %lor.lhs.false
  br label %while.body

while.body:                                       ; preds = %if.end187, %if.end278
  %67 = load i32, i32* %dflags.addr, align 4
  %and188 = and i32 %67, 256
  %tobool189 = icmp ne i32 %and188, 0
  br i1 %tobool189, label %if.then190, label %if.else193

if.then190:                                       ; preds = %while.body
  %call191 = call i8* @conf_standard_path()
  store i8* %call191, i8** %pathlist, align 4
  %68 = load i8*, i8** %command.addr, align 4
  %69 = load i8*, i8** %pathlist, align 4
  %call192 = call i8* @find_in_path(i8* %68, i8* %69, i32 36)
  store i8* %call192, i8** %full_path, align 4
  %70 = load i8*, i8** %pathlist, align 4
  call void @sh_xfree(i8* %70, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 360)
  br label %if.end201

if.else193:                                       ; preds = %while.body
  %71 = load i32, i32* %all, align 4
  %cmp194 = icmp eq i32 %71, 0
  br i1 %cmp194, label %if.then196, label %if.else198

if.then196:                                       ; preds = %if.else193
  %72 = load i8*, i8** %command.addr, align 4
  %call197 = call i8* @find_user_command(i8* %72)
  store i8* %call197, i8** %full_path, align 4
  br label %if.end200

if.else198:                                       ; preds = %if.else193
  %73 = load i8*, i8** %command.addr, align 4
  %74 = load i32, i32* %found_file, align 4
  %call199 = call i8* @user_command_matches(i8* %73, i32 8, i32 %74)
  store i8* %call199, i8** %full_path, align 4
  br label %if.end200

if.end200:                                        ; preds = %if.else198, %if.then196
  br label %if.end201

if.end201:                                        ; preds = %if.end200, %if.then190
  %75 = load i8*, i8** %full_path, align 4
  %cmp202 = icmp eq i8* %75, null
  br i1 %cmp202, label %if.then204, label %if.end205

if.then204:                                       ; preds = %if.end201
  br label %while.end

if.end205:                                        ; preds = %if.end201
  %76 = load i8*, i8** %full_path, align 4
  %arrayidx = getelementptr inbounds i8, i8* %76, i32 0
  %77 = load i8, i8* %arrayidx, align 1
  %conv206 = sext i8 %77 to i32
  %78 = load i8*, i8** %command.addr, align 4
  %arrayidx207 = getelementptr inbounds i8, i8* %78, i32 0
  %79 = load i8, i8* %arrayidx207, align 1
  %conv208 = sext i8 %79 to i32
  %cmp209 = icmp eq i32 %conv206, %conv208
  br i1 %cmp209, label %land.lhs.true211, label %lor.lhs.false215

land.lhs.true211:                                 ; preds = %if.end205
  %80 = load i8*, i8** %full_path, align 4
  %81 = load i8*, i8** %command.addr, align 4
  %call212 = call i32 @strcmp(i8* %80, i8* %81)
  %cmp213 = icmp eq i32 %call212, 0
  br i1 %cmp213, label %if.then217, label %lor.lhs.false215

lor.lhs.false215:                                 ; preds = %land.lhs.true211, %if.end205
  %82 = load i32, i32* @posixly_correct, align 4
  %tobool216 = icmp ne i32 %82, 0
  br i1 %tobool216, label %if.then217, label %if.else243

if.then217:                                       ; preds = %lor.lhs.false215, %land.lhs.true211
  %83 = load i8*, i8** %full_path, align 4
  %call218 = call i32 @file_status(i8* %83)
  store i32 %call218, i32* %f, align 4
  %84 = load i32, i32* %f, align 4
  %and219 = and i32 %84, 2
  %cmp220 = icmp eq i32 %and219, 0
  br i1 %cmp220, label %if.then222, label %if.else227

if.then222:                                       ; preds = %if.then217
  %85 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %85, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 380)
  store i8* null, i8** %full_path, align 4
  %86 = load i32, i32* %all, align 4
  %cmp223 = icmp eq i32 %86, 0
  br i1 %cmp223, label %if.then225, label %if.end226

if.then225:                                       ; preds = %if.then222
  br label %while.end

if.end226:                                        ; preds = %if.then222
  br label %if.end242

if.else227:                                       ; preds = %if.then217
  %87 = load i8*, i8** %full_path, align 4
  %arrayidx228 = getelementptr inbounds i8, i8* %87, i32 0
  %88 = load i8, i8* %arrayidx228, align 1
  %conv229 = sext i8 %88 to i32
  %cmp230 = icmp eq i32 %conv229, 47
  br i1 %cmp230, label %if.then232, label %if.else233

if.then232:                                       ; preds = %if.else227
  br label %if.end241

if.else233:                                       ; preds = %if.else227
  %89 = load i32, i32* %dflags.addr, align 4
  %and234 = and i32 %89, 22
  %tobool235 = icmp ne i32 %and234, 0
  br i1 %tobool235, label %if.then236, label %if.end240

if.then236:                                       ; preds = %if.else233
  %90 = load i32, i32* %dflags.addr, align 4
  %and237 = and i32 %90, 128
  %tobool238 = icmp ne i32 %and237, 0
  %cond = select i1 %tobool238, i32 4, i32 0
  %or = or i32 2, %cond
  store i32 %or, i32* %f, align 4
  %91 = load i8*, i8** %full_path, align 4
  %92 = load i32, i32* %f, align 4
  %call239 = call i8* @sh_makepath(i8* null, i8* %91, i32 %92)
  store i8* %call239, i8** %x, align 4
  %93 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %93, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 391)
  %94 = load i8*, i8** %x, align 4
  store i8* %94, i8** %full_path, align 4
  br label %if.end240

if.end240:                                        ; preds = %if.then236, %if.else233
  br label %if.end241

if.end241:                                        ; preds = %if.end240, %if.then232
  br label %if.end242

if.end242:                                        ; preds = %if.end241, %if.end226
  br label %if.end256

if.else243:                                       ; preds = %lor.lhs.false215
  %95 = load i32, i32* %dflags.addr, align 4
  %and244 = and i32 %95, 128
  %tobool245 = icmp ne i32 %and244, 0
  br i1 %tobool245, label %land.lhs.true246, label %if.end255

land.lhs.true246:                                 ; preds = %if.else243
  %96 = load i8*, i8** %full_path, align 4
  %arrayidx247 = getelementptr inbounds i8, i8* %96, i32 0
  %97 = load i8, i8* %arrayidx247, align 1
  %conv248 = sext i8 %97 to i32
  %cmp249 = icmp eq i32 %conv248, 47
  %conv250 = zext i1 %cmp249 to i32
  %cmp251 = icmp eq i32 %conv250, 0
  br i1 %cmp251, label %if.then253, label %if.end255

if.then253:                                       ; preds = %land.lhs.true246
  %98 = load i8*, i8** %full_path, align 4
  %call254 = call i8* @sh_makepath(i8* null, i8* %98, i32 6)
  store i8* %call254, i8** %x, align 4
  %99 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %99, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 399)
  %100 = load i8*, i8** %x, align 4
  store i8* %100, i8** %full_path, align 4
  br label %if.end255

if.end255:                                        ; preds = %if.then253, %land.lhs.true246, %if.else243
  br label %if.end256

if.end256:                                        ; preds = %if.end255, %if.end242
  %101 = load i32, i32* %found_file, align 4
  %inc = add nsw i32 %101, 1
  store i32 %inc, i32* %found_file, align 4
  store i32 1, i32* %found, align 4
  %102 = load i32, i32* %dflags.addr, align 4
  %and257 = and i32 %102, 8
  %tobool258 = icmp ne i32 %and257, 0
  br i1 %tobool258, label %if.then259, label %if.else261

if.then259:                                       ; preds = %if.end256
  %call260 = call i32 @puts(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0))
  br label %if.end274

if.else261:                                       ; preds = %if.end256
  %103 = load i32, i32* %dflags.addr, align 4
  %and262 = and i32 %103, 2
  %tobool263 = icmp ne i32 %and262, 0
  br i1 %tobool263, label %if.then264, label %if.else267

if.then264:                                       ; preds = %if.else261
  %call265 = call i8* @libintl_gettext(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.20, i32 0, i32 0))
  %104 = load i8*, i8** %command.addr, align 4
  %105 = load i8*, i8** %full_path, align 4
  %call266 = call i32 (i8*, ...) @printf(i8* %call265, i8* %104, i8* %105)
  br label %if.end273

if.else267:                                       ; preds = %if.else261
  %106 = load i32, i32* %dflags.addr, align 4
  %and268 = and i32 %106, 20
  %tobool269 = icmp ne i32 %and268, 0
  br i1 %tobool269, label %if.then270, label %if.end272

if.then270:                                       ; preds = %if.else267
  %107 = load i8*, i8** %full_path, align 4
  %call271 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i8* %107)
  br label %if.end272

if.end272:                                        ; preds = %if.then270, %if.else267
  br label %if.end273

if.end273:                                        ; preds = %if.end272, %if.then264
  br label %if.end274

if.end274:                                        ; preds = %if.end273, %if.then259
  %108 = load i8*, i8** %full_path, align 4
  call void @sh_xfree(i8* %108, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i32 413)
  store i8* null, i8** %full_path, align 4
  %109 = load i32, i32* %all, align 4
  %cmp275 = icmp eq i32 %109, 0
  br i1 %cmp275, label %if.then277, label %if.end278

if.then277:                                       ; preds = %if.end274
  br label %while.end

if.end278:                                        ; preds = %if.end274
  br label %while.body

while.end:                                        ; preds = %if.then277, %if.then225, %if.then204
  %110 = load i32, i32* %found, align 4
  store i32 %110, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.end185, %if.end157, %if.then130, %if.then90, %if.then57, %if.then26
  %111 = load i32, i32* %retval, align 4
  ret i32 %111
}

declare void @sh_notfound(i8*) #1

declare i32 @sh_chkwrite(i32) #1

declare %struct.alias* @find_alias(i8*) #1

declare i32 @puts(i8*) #1

declare i32 @printf(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i8* @sh_single_quote(i8*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @find_reserved_word(i8*) #1

declare %struct.variable* @find_function(i8*) #1

declare i8* @named_function_string(i8*, %struct.command*, i32) #1

declare i32 (%struct.word_list*)* @find_shell_builtin(i8*) #1

declare i32 (%struct.word_list*)* @find_special_builtin(i8*) #1

declare i32 @absolute_program(i8*) #1

declare i32 @file_status(i8*) #1

declare i8* @phash_search(i8*) #1

declare i8* @conf_standard_path() #1

declare i8* @find_in_path(i8*, i8*, i32) #1

declare i8* @find_user_command(i8*) #1

declare i8* @user_command_matches(i8*, i32, i32) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
