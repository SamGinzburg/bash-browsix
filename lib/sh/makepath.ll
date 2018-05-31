; ModuleID = 'makepath.c'
source_filename = "makepath.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [12 x i8] c"sh_makepath\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"makepath.c\00", align 1
@nullpath = internal global i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i32 0, i32 0), align 4
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind
define i8* @sh_makepath(i8* %path, i8* %dir, i32 %flags) #0 {
entry:
  %path.addr = alloca i8*, align 4
  %dir.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %dirlen = alloca i32, align 4
  %pathlen = alloca i32, align 4
  %ret = alloca i8*, align 4
  %xpath = alloca i8*, align 4
  %xdir = alloca i8*, align 4
  %r = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %path, i8** %path.addr, align 4
  store i8* %dir, i8** %dir.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %path.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %path.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.else28

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %flags.addr, align 4
  %and = and i32 %3, 2
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then3, label %if.else21

if.then3:                                         ; preds = %if.then
  %call = call i8* @get_working_directory(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %xpath, align 4
  %4 = load i8*, i8** %xpath, align 4
  %cmp4 = icmp eq i8* %4, null
  br i1 %cmp4, label %if.then6, label %if.end13

if.then6:                                         ; preds = %if.then3
  %call7 = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  store i8* %call7, i8** %ret, align 4
  %5 = load i8*, i8** %ret, align 4
  %tobool8 = icmp ne i8* %5, null
  br i1 %tobool8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then6
  %6 = load i8*, i8** %ret, align 4
  %call10 = call i32 @strlen(i8* %6)
  %add = add i32 1, %call10
  %call11 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 86)
  %7 = load i8*, i8** %ret, align 4
  %call12 = call i8* @strcpy(i8* %call11, i8* %7)
  store i8* %call12, i8** %xpath, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then6
  br label %if.end13

if.end13:                                         ; preds = %if.end, %if.then3
  %8 = load i8*, i8** %xpath, align 4
  %cmp14 = icmp eq i8* %8, null
  br i1 %cmp14, label %if.then16, label %if.else

if.then16:                                        ; preds = %if.end13
  br label %do.body

do.body:                                          ; preds = %if.then16
  %call17 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 89)
  store i8* %call17, i8** %xpath, align 4
  %9 = load i8*, i8** %xpath, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 0
  store i8 46, i8* %arrayidx, align 1
  %10 = load i8*, i8** %xpath, align 4
  %arrayidx18 = getelementptr inbounds i8, i8* %10, i32 1
  store i8 0, i8* %arrayidx18, align 1
  store i32 1, i32* %pathlen, align 4
  br label %do.end

do.end:                                           ; preds = %do.body
  br label %if.end20

if.else:                                          ; preds = %if.end13
  %11 = load i8*, i8** %xpath, align 4
  %call19 = call i32 @strlen(i8* %11)
  store i32 %call19, i32* %pathlen, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.else, %do.end
  br label %if.end27

if.else21:                                        ; preds = %if.then
  br label %do.body22

do.body22:                                        ; preds = %if.else21
  %call23 = call i8* @sh_xmalloc(i32 2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 94)
  store i8* %call23, i8** %xpath, align 4
  %12 = load i8*, i8** %xpath, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %12, i32 0
  store i8 46, i8* %arrayidx24, align 1
  %13 = load i8*, i8** %xpath, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %13, i32 1
  store i8 0, i8* %arrayidx25, align 1
  store i32 1, i32* %pathlen, align 4
  br label %do.end26

do.end26:                                         ; preds = %do.body22
  br label %if.end27

if.end27:                                         ; preds = %do.end26, %if.end20
  br label %if.end61

if.else28:                                        ; preds = %lor.lhs.false
  %14 = load i32, i32* %flags.addr, align 4
  %and29 = and i32 %14, 8
  %tobool30 = icmp ne i32 %and29, 0
  br i1 %tobool30, label %land.lhs.true, label %if.else51

land.lhs.true:                                    ; preds = %if.else28
  %15 = load i8*, i8** %path.addr, align 4
  %arrayidx31 = getelementptr inbounds i8, i8* %15, i32 0
  %16 = load i8, i8* %arrayidx31, align 1
  %conv32 = sext i8 %16 to i32
  %cmp33 = icmp eq i32 %conv32, 46
  br i1 %cmp33, label %land.lhs.true35, label %if.else51

land.lhs.true35:                                  ; preds = %land.lhs.true
  %17 = load i8*, i8** %path.addr, align 4
  %arrayidx36 = getelementptr inbounds i8, i8* %17, i32 1
  %18 = load i8, i8* %arrayidx36, align 1
  %conv37 = sext i8 %18 to i32
  %cmp38 = icmp eq i32 %conv37, 0
  br i1 %cmp38, label %if.then50, label %lor.lhs.false40

lor.lhs.false40:                                  ; preds = %land.lhs.true35
  %19 = load i8*, i8** %path.addr, align 4
  %arrayidx41 = getelementptr inbounds i8, i8* %19, i32 1
  %20 = load i8, i8* %arrayidx41, align 1
  %conv42 = sext i8 %20 to i32
  %cmp43 = icmp eq i32 %conv42, 47
  br i1 %cmp43, label %land.lhs.true45, label %if.else51

land.lhs.true45:                                  ; preds = %lor.lhs.false40
  %21 = load i8*, i8** %path.addr, align 4
  %arrayidx46 = getelementptr inbounds i8, i8* %21, i32 2
  %22 = load i8, i8* %arrayidx46, align 1
  %conv47 = sext i8 %22 to i32
  %cmp48 = icmp eq i32 %conv47, 0
  br i1 %cmp48, label %if.then50, label %if.else51

if.then50:                                        ; preds = %land.lhs.true45, %land.lhs.true35
  %23 = load i8*, i8** @nullpath, align 4
  store i8* %23, i8** %xpath, align 4
  store i32 0, i32* %pathlen, align 4
  br label %if.end60

if.else51:                                        ; preds = %land.lhs.true45, %lor.lhs.false40, %land.lhs.true, %if.else28
  %24 = load i32, i32* %flags.addr, align 4
  %and52 = and i32 %24, 1
  %tobool53 = icmp ne i32 %and52, 0
  br i1 %tobool53, label %land.lhs.true54, label %cond.false

land.lhs.true54:                                  ; preds = %if.else51
  %25 = load i8*, i8** %path.addr, align 4
  %26 = load i8, i8* %25, align 1
  %conv55 = sext i8 %26 to i32
  %cmp56 = icmp eq i32 %conv55, 126
  br i1 %cmp56, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true54
  %27 = load i8*, i8** %path.addr, align 4
  %call58 = call i8* @bash_tilde_expand(i8* %27, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true54, %if.else51
  %28 = load i8*, i8** %path.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call58, %cond.true ], [ %28, %cond.false ]
  store i8* %cond, i8** %xpath, align 4
  %29 = load i8*, i8** %xpath, align 4
  %call59 = call i32 @strlen(i8* %29)
  store i32 %call59, i32* %pathlen, align 4
  br label %if.end60

if.end60:                                         ; preds = %cond.end, %if.then50
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.end27
  %30 = load i8*, i8** %dir.addr, align 4
  store i8* %30, i8** %xdir, align 4
  %31 = load i8*, i8** %xdir, align 4
  %call62 = call i32 @strlen(i8* %31)
  store i32 %call62, i32* %dirlen, align 4
  %32 = load i32, i32* %flags.addr, align 4
  %and63 = and i32 %32, 4
  %tobool64 = icmp ne i32 %and63, 0
  br i1 %tobool64, label %land.lhs.true65, label %if.end76

land.lhs.true65:                                  ; preds = %if.end61
  %33 = load i8*, i8** %dir.addr, align 4
  %arrayidx66 = getelementptr inbounds i8, i8* %33, i32 0
  %34 = load i8, i8* %arrayidx66, align 1
  %conv67 = sext i8 %34 to i32
  %cmp68 = icmp eq i32 %conv67, 46
  br i1 %cmp68, label %land.lhs.true70, label %if.end76

land.lhs.true70:                                  ; preds = %land.lhs.true65
  %35 = load i8*, i8** %dir.addr, align 4
  %arrayidx71 = getelementptr inbounds i8, i8* %35, i32 1
  %36 = load i8, i8* %arrayidx71, align 1
  %conv72 = sext i8 %36 to i32
  %cmp73 = icmp eq i32 %conv72, 47
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %land.lhs.true70
  %37 = load i8*, i8** %xdir, align 4
  %add.ptr = getelementptr inbounds i8, i8* %37, i32 2
  store i8* %add.ptr, i8** %xdir, align 4
  %38 = load i32, i32* %dirlen, align 4
  %sub = sub nsw i32 %38, 2
  store i32 %sub, i32* %dirlen, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %land.lhs.true70, %land.lhs.true65, %if.end61
  %39 = load i32, i32* %dirlen, align 4
  %add77 = add nsw i32 2, %39
  %40 = load i32, i32* %pathlen, align 4
  %add78 = add nsw i32 %add77, %40
  %call79 = call i8* @sh_xmalloc(i32 %add78, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 116)
  store i8* %call79, i8** %ret, align 4
  store i8* %call79, i8** %r, align 4
  %41 = load i8*, i8** %xpath, align 4
  store i8* %41, i8** %s, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end76
  %42 = load i8*, i8** %s, align 4
  %43 = load i8, i8* %42, align 1
  %tobool80 = icmp ne i8 %43, 0
  br i1 %tobool80, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %44 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %45 = load i8, i8* %44, align 1
  %46 = load i8*, i8** %r, align 4
  %incdec.ptr81 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr81, i8** %r, align 4
  store i8 %45, i8* %46, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %47 = load i8*, i8** %s, align 4
  %48 = load i8*, i8** %xpath, align 4
  %cmp82 = icmp ugt i8* %47, %48
  br i1 %cmp82, label %land.lhs.true84, label %if.end91

land.lhs.true84:                                  ; preds = %while.end
  %49 = load i8*, i8** %s, align 4
  %arrayidx85 = getelementptr inbounds i8, i8* %49, i32 -1
  %50 = load i8, i8* %arrayidx85, align 1
  %conv86 = sext i8 %50 to i32
  %cmp87 = icmp ne i32 %conv86, 47
  br i1 %cmp87, label %if.then89, label %if.end91

if.then89:                                        ; preds = %land.lhs.true84
  %51 = load i8*, i8** %r, align 4
  %incdec.ptr90 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %incdec.ptr90, i8** %r, align 4
  store i8 47, i8* %51, align 1
  br label %if.end91

if.end91:                                         ; preds = %if.then89, %land.lhs.true84, %while.end
  %52 = load i8*, i8** %xdir, align 4
  store i8* %52, i8** %s, align 4
  br label %while.cond92

while.cond92:                                     ; preds = %while.body96, %if.end91
  %53 = load i8*, i8** %s, align 4
  %incdec.ptr93 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr93, i8** %s, align 4
  %54 = load i8, i8* %53, align 1
  %55 = load i8*, i8** %r, align 4
  %incdec.ptr94 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr94, i8** %r, align 4
  store i8 %54, i8* %55, align 1
  %tobool95 = icmp ne i8 %54, 0
  br i1 %tobool95, label %while.body96, label %while.end97

while.body96:                                     ; preds = %while.cond92
  br label %while.cond92

while.end97:                                      ; preds = %while.cond92
  %56 = load i8*, i8** %xpath, align 4
  %57 = load i8*, i8** %path.addr, align 4
  %cmp98 = icmp ne i8* %56, %57
  br i1 %cmp98, label %land.lhs.true100, label %if.end104

land.lhs.true100:                                 ; preds = %while.end97
  %58 = load i8*, i8** %xpath, align 4
  %59 = load i8*, i8** @nullpath, align 4
  %cmp101 = icmp ne i8* %58, %59
  br i1 %cmp101, label %if.then103, label %if.end104

if.then103:                                       ; preds = %land.lhs.true100
  %60 = load i8*, i8** %xpath, align 4
  call void @sh_xfree(i8* %60, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i32 126)
  br label %if.end104

if.end104:                                        ; preds = %if.then103, %land.lhs.true100, %while.end97
  %61 = load i8*, i8** %ret, align 4
  ret i8* %61
}

declare i8* @get_working_directory(i8*) #1

declare i8* @get_string_value(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @bash_tilde_expand(i8*, i32) #1

declare void @sh_xfree(i8*, i8*, i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
