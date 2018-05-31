; ModuleID = './version.c'
source_filename = "./version.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [4 x i8] c"4.4\00", align 1
@dist_version = constant i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), align 4
@patch_level = constant i32 19, align 4
@build_version = constant i32 1, align 4
@.str.1 = private unnamed_addr constant [8 x i8] c"release\00", align 1
@release_status = constant i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), align 4
@.str.2 = private unnamed_addr constant [39 x i8] c"@(#)Bash version 4.4.19(1) release GNU\00", align 1
@sccs_version = constant i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i32 0, i32 0), align 4
@.str.3 = private unnamed_addr constant [50 x i8] c"Copyright (C) 2016 Free Software Foundation, Inc.\00", align 1
@bash_copyright = constant i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.3, i32 0, i32 0), align 4
@.str.4 = private unnamed_addr constant [79 x i8] c"License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>\0A\00", align 1
@bash_license = constant i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.4, i32 0, i32 0), align 4
@shell_compatibility_level = global i32 44, align 4
@shell_version_string.tt = internal global [32 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"%s.%d(%d)-%s\00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c"%s.%d(%d)\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"GNU bash, version %s (%s)\0A\00", align 1
@.str.8 = private unnamed_addr constant [25 x i8] c"x86_64-unknown-linux-gnu\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.10 = private unnamed_addr constant [67 x i8] c"This is free software; you are free to change and redistribute it.\00", align 1
@.str.11 = private unnamed_addr constant [54 x i8] c"There is NO WARRANTY, to the extent permitted by law.\00", align 1

; Function Attrs: noinline nounwind
define i8* @shell_version_string() #0 {
entry:
  %0 = load i8, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @shell_version_string.tt, i32 0, i32 0), align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  br i1 true, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %call = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @shell_version_string.tt, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 19, i32 1, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %if.then
  %call3 = call i32 (i8*, i8*, ...) @sprintf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @shell_version_string.tt, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 19, i32 1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %entry
  ret i8* getelementptr inbounds ([32 x i8], [32 x i8]* @shell_version_string.tt, i32 0, i32 0)
}

declare i32 @sprintf(i8*, i8*, ...) #1

; Function Attrs: noinline nounwind
define void @show_shell_version(i32 %extended) #0 {
entry:
  %extended.addr = alloca i32, align 4
  store i32 %extended, i32* %extended.addr, align 4
  %call = call i8* @shell_version_string()
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i32 0, i32 0), i8* %call, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.8, i32 0, i32 0))
  %0 = load i32, i32* %extended.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.3, i32 0, i32 0))
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([79 x i8], [79 x i8]* @.str.4, i32 0, i32 0))
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.10, i32 0, i32 0))
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.11, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
