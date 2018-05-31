; ModuleID = 'kill.c'
source_filename = "kill.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"TERM\00", align 1
@posixly_correct = external global i32, align 4
@.str.2 = private unnamed_addr constant [14 x i8] c"Unknown error\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"(%ld) - %s\00", align 1

; Function Attrs: noinline nounwind
define i32 @kill_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %sig = alloca i32, align 4
  %any_succeeded = alloca i32, align 4
  %listing = alloca i32, align 4
  %saw_signal = alloca i32, align 4
  %dflags = alloca i32, align 4
  %sigspec = alloca i8*, align 4
  %word = alloca i8*, align 4
  %pid = alloca i32, align 4
  %pid_value = alloca i64, align 8
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp = icmp eq %struct.word_list* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %if.end
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %1, null
  br i1 %tobool, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %do.body
  %2 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word1 = getelementptr inbounds %struct.word_list, %struct.word_list* %2, i32 0, i32 1
  %3 = load %struct.word_desc*, %struct.word_desc** %word1, align 4
  %tobool2 = icmp ne %struct.word_desc* %3, null
  br i1 %tobool2, label %land.lhs.true3, label %if.end15

land.lhs.true3:                                   ; preds = %land.lhs.true
  %4 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word4 = getelementptr inbounds %struct.word_list, %struct.word_list* %4, i32 0, i32 1
  %5 = load %struct.word_desc*, %struct.word_desc** %word4, align 4
  %word5 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %5, i32 0, i32 0
  %6 = load i8*, i8** %word5, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 0
  %7 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %7 to i32
  %8 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv6 = sext i8 %8 to i32
  %cmp7 = icmp eq i32 %conv, %conv6
  br i1 %cmp7, label %land.lhs.true9, label %if.end15

land.lhs.true9:                                   ; preds = %land.lhs.true3
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word10 = getelementptr inbounds %struct.word_list, %struct.word_list* %9, i32 0, i32 1
  %10 = load %struct.word_desc*, %struct.word_desc** %word10, align 4
  %word11 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %10, i32 0, i32 0
  %11 = load i8*, i8** %word11, align 4
  %call = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp12 = icmp eq i32 %call, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %land.lhs.true9
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end15:                                         ; preds = %land.lhs.true9, %land.lhs.true3, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end15
  store i32 0, i32* %saw_signal, align 4
  store i32 0, i32* %listing, align 4
  store i32 0, i32* %any_succeeded, align 4
  store i32 15, i32* %sig, align 4
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8** %sigspec, align 4
  %12 = load i32, i32* @posixly_correct, align 4
  %cmp16 = icmp eq i32 %12, 0
  %cond = select i1 %cmp16, i32 1, i32 0
  %or = or i32 2, %cond
  store i32 %or, i32* %dflags, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end139, %do.end
  %13 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool18 = icmp ne %struct.word_list* %13, null
  br i1 %tobool18, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word19 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word19, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word20, align 4
  store i8* %16, i8** %word, align 4
  %17 = load i8*, i8** %word, align 4
  %arrayidx21 = getelementptr inbounds i8, i8* %17, i32 0
  %18 = load i8, i8* %arrayidx21, align 1
  %conv22 = sext i8 %18 to i32
  %cmp23 = icmp eq i32 %conv22, 45
  br i1 %cmp23, label %land.lhs.true25, label %lor.lhs.false

land.lhs.true25:                                  ; preds = %while.body
  %19 = load i8*, i8** %word, align 4
  %arrayidx26 = getelementptr inbounds i8, i8* %19, i32 2
  %20 = load i8, i8* %arrayidx26, align 1
  %tobool27 = icmp ne i8 %20, 0
  br i1 %tobool27, label %lor.lhs.false, label %land.lhs.true28

land.lhs.true28:                                  ; preds = %land.lhs.true25
  %21 = load i8*, i8** %word, align 4
  %arrayidx29 = getelementptr inbounds i8, i8* %21, i32 1
  %22 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %22 to i32
  %cmp31 = icmp eq i32 %conv30, 108
  br i1 %cmp31, label %if.then45, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true28, %land.lhs.true25, %while.body
  %23 = load i8*, i8** %word, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %23, i32 0
  %24 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %24 to i32
  %cmp35 = icmp eq i32 %conv34, 45
  br i1 %cmp35, label %land.lhs.true37, label %if.else

land.lhs.true37:                                  ; preds = %lor.lhs.false
  %25 = load i8*, i8** %word, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %25, i32 2
  %26 = load i8, i8* %arrayidx38, align 1
  %tobool39 = icmp ne i8 %26, 0
  br i1 %tobool39, label %if.else, label %land.lhs.true40

land.lhs.true40:                                  ; preds = %land.lhs.true37
  %27 = load i8*, i8** %word, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %27, i32 1
  %28 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %28 to i32
  %cmp43 = icmp eq i32 %conv42, 76
  br i1 %cmp43, label %if.then45, label %if.else

if.then45:                                        ; preds = %land.lhs.true40, %land.lhs.true28
  %29 = load i32, i32* %listing, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %listing, align 4
  %30 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %30, i32 0, i32 0
  %31 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %31, %struct.word_list** %list.addr, align 4
  br label %if.end139

if.else:                                          ; preds = %land.lhs.true40, %land.lhs.true37, %lor.lhs.false
  %32 = load i8*, i8** %word, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %32, i32 0
  %33 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %33 to i32
  %cmp48 = icmp eq i32 %conv47, 45
  br i1 %cmp48, label %land.lhs.true50, label %lor.lhs.false58

land.lhs.true50:                                  ; preds = %if.else
  %34 = load i8*, i8** %word, align 4
  %arrayidx51 = getelementptr inbounds i8, i8* %34, i32 2
  %35 = load i8, i8* %arrayidx51, align 1
  %tobool52 = icmp ne i8 %35, 0
  br i1 %tobool52, label %lor.lhs.false58, label %land.lhs.true53

land.lhs.true53:                                  ; preds = %land.lhs.true50
  %36 = load i8*, i8** %word, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %36, i32 1
  %37 = load i8, i8* %arrayidx54, align 1
  %conv55 = sext i8 %37 to i32
  %cmp56 = icmp eq i32 %conv55, 115
  br i1 %cmp56, label %if.then71, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %land.lhs.true53, %land.lhs.true50, %if.else
  %38 = load i8*, i8** %word, align 4
  %arrayidx59 = getelementptr inbounds i8, i8* %38, i32 0
  %39 = load i8, i8* %arrayidx59, align 1
  %conv60 = sext i8 %39 to i32
  %cmp61 = icmp eq i32 %conv60, 45
  br i1 %cmp61, label %land.lhs.true63, label %if.else94

land.lhs.true63:                                  ; preds = %lor.lhs.false58
  %40 = load i8*, i8** %word, align 4
  %arrayidx64 = getelementptr inbounds i8, i8* %40, i32 2
  %41 = load i8, i8* %arrayidx64, align 1
  %tobool65 = icmp ne i8 %41, 0
  br i1 %tobool65, label %if.else94, label %land.lhs.true66

land.lhs.true66:                                  ; preds = %land.lhs.true63
  %42 = load i8*, i8** %word, align 4
  %arrayidx67 = getelementptr inbounds i8, i8* %42, i32 1
  %43 = load i8, i8* %arrayidx67, align 1
  %conv68 = sext i8 %43 to i32
  %cmp69 = icmp eq i32 %conv68, 110
  br i1 %cmp69, label %if.then71, label %if.else94

if.then71:                                        ; preds = %land.lhs.true66, %land.lhs.true53
  %44 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next72 = getelementptr inbounds %struct.word_list, %struct.word_list* %44, i32 0, i32 0
  %45 = load %struct.word_list*, %struct.word_list** %next72, align 4
  store %struct.word_list* %45, %struct.word_list** %list.addr, align 4
  %46 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool73 = icmp ne %struct.word_list* %46, null
  br i1 %tobool73, label %if.then74, label %if.else92

if.then74:                                        ; preds = %if.then71
  %47 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word75 = getelementptr inbounds %struct.word_list, %struct.word_list* %47, i32 0, i32 1
  %48 = load %struct.word_desc*, %struct.word_desc** %word75, align 4
  %word76 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %48, i32 0, i32 0
  %49 = load i8*, i8** %word76, align 4
  store i8* %49, i8** %sigspec, align 4
  %50 = load i8*, i8** %sigspec, align 4
  %arrayidx77 = getelementptr inbounds i8, i8* %50, i32 0
  %51 = load i8, i8* %arrayidx77, align 1
  %conv78 = sext i8 %51 to i32
  %cmp79 = icmp eq i32 %conv78, 48
  br i1 %cmp79, label %land.lhs.true81, label %if.else87

land.lhs.true81:                                  ; preds = %if.then74
  %52 = load i8*, i8** %sigspec, align 4
  %arrayidx82 = getelementptr inbounds i8, i8* %52, i32 1
  %53 = load i8, i8* %arrayidx82, align 1
  %conv83 = sext i8 %53 to i32
  %cmp84 = icmp eq i32 %conv83, 0
  br i1 %cmp84, label %if.then86, label %if.else87

if.then86:                                        ; preds = %land.lhs.true81
  store i32 0, i32* %sig, align 4
  br label %if.end89

if.else87:                                        ; preds = %land.lhs.true81, %if.then74
  %54 = load i8*, i8** %sigspec, align 4
  %55 = load i32, i32* %dflags, align 4
  %call88 = call i32 @decode_signal(i8* %54, i32 %55)
  store i32 %call88, i32* %sig, align 4
  br label %if.end89

if.end89:                                         ; preds = %if.else87, %if.then86
  %56 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next90 = getelementptr inbounds %struct.word_list, %struct.word_list* %56, i32 0, i32 0
  %57 = load %struct.word_list*, %struct.word_list** %next90, align 4
  store %struct.word_list* %57, %struct.word_list** %list.addr, align 4
  %58 = load i32, i32* %saw_signal, align 4
  %inc91 = add nsw i32 %58, 1
  store i32 %inc91, i32* %saw_signal, align 4
  br label %if.end93

if.else92:                                        ; preds = %if.then71
  %59 = load i8*, i8** %word, align 4
  call void @sh_needarg(i8* %59)
  store i32 1, i32* %retval, align 4
  br label %return

if.end93:                                         ; preds = %if.end89
  br label %if.end138

if.else94:                                        ; preds = %land.lhs.true66, %land.lhs.true63, %lor.lhs.false58
  %60 = load i8*, i8** %word, align 4
  %arrayidx95 = getelementptr inbounds i8, i8* %60, i32 0
  %61 = load i8, i8* %arrayidx95, align 1
  %conv96 = sext i8 %61 to i32
  %cmp97 = icmp eq i32 %conv96, 45
  br i1 %cmp97, label %land.lhs.true99, label %if.else109

land.lhs.true99:                                  ; preds = %if.else94
  %62 = load i8*, i8** %word, align 4
  %arrayidx100 = getelementptr inbounds i8, i8* %62, i32 2
  %63 = load i8, i8* %arrayidx100, align 1
  %tobool101 = icmp ne i8 %63, 0
  br i1 %tobool101, label %if.else109, label %land.lhs.true102

land.lhs.true102:                                 ; preds = %land.lhs.true99
  %64 = load i8*, i8** %word, align 4
  %arrayidx103 = getelementptr inbounds i8, i8* %64, i32 1
  %65 = load i8, i8* %arrayidx103, align 1
  %conv104 = sext i8 %65 to i32
  %cmp105 = icmp eq i32 %conv104, 45
  br i1 %cmp105, label %if.then107, label %if.else109

if.then107:                                       ; preds = %land.lhs.true102
  %66 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next108 = getelementptr inbounds %struct.word_list, %struct.word_list* %66, i32 0, i32 0
  %67 = load %struct.word_list*, %struct.word_list** %next108, align 4
  store %struct.word_list* %67, %struct.word_list** %list.addr, align 4
  br label %while.end

if.else109:                                       ; preds = %land.lhs.true102, %land.lhs.true99, %if.else94
  %68 = load i8*, i8** %word, align 4
  %arrayidx110 = getelementptr inbounds i8, i8* %68, i32 0
  %69 = load i8, i8* %arrayidx110, align 1
  %conv111 = sext i8 %69 to i32
  %cmp112 = icmp eq i32 %conv111, 45
  br i1 %cmp112, label %land.lhs.true114, label %if.else123

land.lhs.true114:                                 ; preds = %if.else109
  %70 = load i8*, i8** %word, align 4
  %arrayidx115 = getelementptr inbounds i8, i8* %70, i32 2
  %71 = load i8, i8* %arrayidx115, align 1
  %tobool116 = icmp ne i8 %71, 0
  br i1 %tobool116, label %if.else123, label %land.lhs.true117

land.lhs.true117:                                 ; preds = %land.lhs.true114
  %72 = load i8*, i8** %word, align 4
  %arrayidx118 = getelementptr inbounds i8, i8* %72, i32 1
  %73 = load i8, i8* %arrayidx118, align 1
  %conv119 = sext i8 %73 to i32
  %cmp120 = icmp eq i32 %conv119, 63
  br i1 %cmp120, label %if.then122, label %if.else123

if.then122:                                       ; preds = %land.lhs.true117
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.else123:                                       ; preds = %land.lhs.true117, %land.lhs.true114, %if.else109
  %74 = load i8*, i8** %word, align 4
  %75 = load i8, i8* %74, align 1
  %conv124 = sext i8 %75 to i32
  %cmp125 = icmp eq i32 %conv124, 45
  br i1 %cmp125, label %land.lhs.true127, label %if.else134

land.lhs.true127:                                 ; preds = %if.else123
  %76 = load i32, i32* %saw_signal, align 4
  %cmp128 = icmp eq i32 %76, 0
  br i1 %cmp128, label %if.then130, label %if.else134

if.then130:                                       ; preds = %land.lhs.true127
  %77 = load i8*, i8** %word, align 4
  %add.ptr = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %add.ptr, i8** %sigspec, align 4
  %78 = load i8*, i8** %sigspec, align 4
  %79 = load i32, i32* %dflags, align 4
  %call131 = call i32 @decode_signal(i8* %78, i32 %79)
  store i32 %call131, i32* %sig, align 4
  %80 = load i32, i32* %saw_signal, align 4
  %inc132 = add nsw i32 %80, 1
  store i32 %inc132, i32* %saw_signal, align 4
  %81 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next133 = getelementptr inbounds %struct.word_list, %struct.word_list* %81, i32 0, i32 0
  %82 = load %struct.word_list*, %struct.word_list** %next133, align 4
  store %struct.word_list* %82, %struct.word_list** %list.addr, align 4
  br label %if.end135

if.else134:                                       ; preds = %land.lhs.true127, %if.else123
  br label %while.end

if.end135:                                        ; preds = %if.then130
  br label %if.end136

if.end136:                                        ; preds = %if.end135
  br label %if.end137

if.end137:                                        ; preds = %if.end136
  br label %if.end138

if.end138:                                        ; preds = %if.end137, %if.end93
  br label %if.end139

if.end139:                                        ; preds = %if.end138, %if.then45
  br label %while.cond

while.end:                                        ; preds = %if.else134, %if.then107, %while.cond
  %83 = load i32, i32* %listing, align 4
  %tobool140 = icmp ne i32 %83, 0
  br i1 %tobool140, label %if.then141, label %if.end143

if.then141:                                       ; preds = %while.end
  %84 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call142 = call i32 @display_signal_list(%struct.word_list* %84, i32 0)
  store i32 %call142, i32* %retval, align 4
  br label %return

if.end143:                                        ; preds = %while.end
  %85 = load i32, i32* %sig, align 4
  %cmp144 = icmp eq i32 %85, -1
  br i1 %cmp144, label %if.then146, label %if.end147

if.then146:                                       ; preds = %if.end143
  %86 = load i8*, i8** %sigspec, align 4
  call void @sh_invalidsig(i8* %86)
  store i32 1, i32* %retval, align 4
  br label %return

if.end147:                                        ; preds = %if.end143
  %87 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp148 = icmp eq %struct.word_list* %87, null
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.end147
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

if.end151:                                        ; preds = %if.end147
  br label %while.cond152

while.cond152:                                    ; preds = %continue_killing, %if.end151
  %88 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool153 = icmp ne %struct.word_list* %88, null
  br i1 %tobool153, label %while.body154, label %while.end197

while.body154:                                    ; preds = %while.cond152
  %89 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word155 = getelementptr inbounds %struct.word_list, %struct.word_list* %89, i32 0, i32 1
  %90 = load %struct.word_desc*, %struct.word_desc** %word155, align 4
  %word156 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %90, i32 0, i32 0
  %91 = load i8*, i8** %word156, align 4
  store i8* %91, i8** %word, align 4
  %92 = load i8*, i8** %word, align 4
  %93 = load i8, i8* %92, align 1
  %conv157 = sext i8 %93 to i32
  %cmp158 = icmp eq i32 %conv157, 45
  br i1 %cmp158, label %if.then160, label %if.end161

if.then160:                                       ; preds = %while.body154
  %94 = load i8*, i8** %word, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %incdec.ptr, i8** %word, align 4
  br label %if.end161

if.end161:                                        ; preds = %if.then160, %while.body154
  %95 = load i8*, i8** %word, align 4
  %96 = load i8, i8* %95, align 1
  %conv162 = sext i8 %96 to i32
  %tobool163 = icmp ne i32 %conv162, 0
  br i1 %tobool163, label %land.lhs.true164, label %if.else192

land.lhs.true164:                                 ; preds = %if.end161
  %97 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word165 = getelementptr inbounds %struct.word_list, %struct.word_list* %97, i32 0, i32 1
  %98 = load %struct.word_desc*, %struct.word_desc** %word165, align 4
  %word166 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %98, i32 0, i32 0
  %99 = load i8*, i8** %word166, align 4
  %call167 = call i32 @legal_number(i8* %99, i64* %pid_value)
  %tobool168 = icmp ne i32 %call167, 0
  br i1 %tobool168, label %land.lhs.true169, label %if.else192

land.lhs.true169:                                 ; preds = %land.lhs.true164
  %100 = load i64, i64* %pid_value, align 8
  %101 = load i64, i64* %pid_value, align 8
  %conv170 = trunc i64 %101 to i32
  %conv171 = sext i32 %conv170 to i64
  %cmp172 = icmp eq i64 %100, %conv171
  br i1 %cmp172, label %if.then174, label %if.else192

if.then174:                                       ; preds = %land.lhs.true169
  %102 = load i64, i64* %pid_value, align 8
  %conv175 = trunc i64 %102 to i32
  store i32 %conv175, i32* %pid, align 4
  %103 = load i32, i32* %pid, align 4
  %104 = load i32, i32* %sig, align 4
  %105 = load i32, i32* %pid, align 4
  %cmp176 = icmp slt i32 %105, -1
  %conv177 = zext i1 %cmp176 to i32
  %call178 = call i32 @kill_pid(i32 %103, i32 %104, i32 %conv177)
  %cmp179 = icmp slt i32 %call178, 0
  br i1 %cmp179, label %if.then181, label %if.else189

if.then181:                                       ; preds = %if.then174
  %call182 = call i32* @__errno_location()
  %106 = load i32, i32* %call182, align 4
  %cmp183 = icmp eq i32 %106, 22
  br i1 %cmp183, label %if.then185, label %if.else186

if.then185:                                       ; preds = %if.then181
  %107 = load i8*, i8** %sigspec, align 4
  call void @sh_invalidsig(i8* %107)
  br label %if.end188

if.else186:                                       ; preds = %if.then181
  %108 = load i32, i32* %pid, align 4
  %call187 = call i32* @__errno_location()
  %109 = load i32, i32* %call187, align 4
  call void @kill_error(i32 %108, i32 %109)
  br label %if.end188

if.end188:                                        ; preds = %if.else186, %if.then185
  br label %continue_killing

if.else189:                                       ; preds = %if.then174
  %110 = load i32, i32* %any_succeeded, align 4
  %inc190 = add nsw i32 %110, 1
  store i32 %inc190, i32* %any_succeeded, align 4
  br label %if.end191

if.end191:                                        ; preds = %if.else189
  br label %if.end195

if.else192:                                       ; preds = %land.lhs.true169, %land.lhs.true164, %if.end161
  %111 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word193 = getelementptr inbounds %struct.word_list, %struct.word_list* %111, i32 0, i32 1
  %112 = load %struct.word_desc*, %struct.word_desc** %word193, align 4
  %word194 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %112, i32 0, i32 0
  %113 = load i8*, i8** %word194, align 4
  call void @sh_badpid(i8* %113)
  br label %continue_killing

if.end195:                                        ; preds = %if.end191
  br label %continue_killing

continue_killing:                                 ; preds = %if.end195, %if.else192, %if.end188
  %114 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next196 = getelementptr inbounds %struct.word_list, %struct.word_list* %114, i32 0, i32 0
  %115 = load %struct.word_list*, %struct.word_list** %next196, align 4
  store %struct.word_list* %115, %struct.word_list** %list.addr, align 4
  br label %while.cond152

while.end197:                                     ; preds = %while.cond152
  %116 = load i32, i32* %any_succeeded, align 4
  %tobool198 = icmp ne i32 %116, 0
  %cond199 = select i1 %tobool198, i32 0, i32 1
  store i32 %cond199, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end197, %if.then150, %if.then146, %if.then141, %if.then122, %if.else92, %if.then14, %if.then
  %117 = load i32, i32* %retval, align 4
  ret i32 %117
}

declare void @builtin_usage() #1

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare i32 @decode_signal(i8*, i32) #1

declare void @sh_needarg(i8*) #1

declare i32 @display_signal_list(%struct.word_list*, i32) #1

declare void @sh_invalidsig(i8*) #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @kill_pid(i32, i32, i32) #1

declare i32* @__errno_location() #1

; Function Attrs: noinline nounwind
define internal void @kill_error(i32 %pid, i32 %e) #0 {
entry:
  %pid.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %x = alloca i8*, align 4
  store i32 %pid, i32* %pid.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  %0 = load i32, i32* %e.addr, align 4
  %call = call i8* @strerror(i32 %0)
  store i8* %call, i8** %x, align 4
  %1 = load i8*, i8** %x, align 4
  %cmp = icmp eq i8* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i8* @libintl_gettext(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
  store i8* %call1, i8** %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %pid.addr, align 4
  %3 = load i8*, i8** %x, align 4
  call void (i8*, ...) @builtin_error(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i32 %2, i8* %3)
  ret void
}

declare void @sh_badpid(i8*) #1

declare i8* @strerror(i32) #1

declare i8* @libintl_gettext(i8*) #1

declare void @builtin_error(i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
