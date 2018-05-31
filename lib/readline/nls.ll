; ModuleID = 'nls.c'
source_filename = "nls.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@.str = private unnamed_addr constant [9 x i8] c"LC_CTYPE\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@_rl_utf8locale = external global i32, align 4
@.str.2 = private unnamed_addr constant [6 x i8] c"POSIX\00", align 1
@_rl_meta_flag = external global i32, align 4
@_rl_convert_meta_chars_to_ascii = external global i32, align 4
@_rl_output_meta_chars = external global i32, align 4
@.str.3 = private unnamed_addr constant [7 x i8] c"LC_ALL\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"utf8\00", align 1

; Function Attrs: noinline nounwind
define i32 @_rl_init_eightbit() #0 {
entry:
  %retval = alloca i32, align 4
  %lspec = alloca i8*, align 4
  %t = alloca i8*, align 4
  %call = call i8* @_rl_get_locale_var(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  store i8* %call, i8** %lspec, align 4
  %0 = load i8*, i8** %lspec, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %lspec, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call3 = call i8* @setlocale(i32 0, i8* null)
  store i8* %call3, i8** %lspec, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %3 = load i8*, i8** %lspec, align 4
  %cmp4 = icmp eq i8* %3, null
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), i8** %lspec, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %if.end
  %4 = load i8*, i8** %lspec, align 4
  %call8 = call i8* @setlocale(i32 0, i8* %4)
  store i8* %call8, i8** %t, align 4
  %5 = load i8*, i8** %t, align 4
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %if.end7
  %6 = load i8*, i8** %t, align 4
  %7 = load i8, i8* %6, align 1
  %conv9 = sext i8 %7 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br i1 %tobool10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %land.lhs.true
  %8 = load i8*, i8** %t, align 4
  %call12 = call i32 @utf8locale(i8* %8)
  store i32 %call12, i32* @_rl_utf8locale, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %land.lhs.true, %if.end7
  %9 = load i8*, i8** %t, align 4
  %tobool14 = icmp ne i8* %9, null
  br i1 %tobool14, label %land.lhs.true15, label %if.else

land.lhs.true15:                                  ; preds = %if.end13
  %10 = load i8*, i8** %t, align 4
  %11 = load i8, i8* %10, align 1
  %conv16 = sext i8 %11 to i32
  %tobool17 = icmp ne i32 %conv16, 0
  br i1 %tobool17, label %land.lhs.true18, label %if.else

land.lhs.true18:                                  ; preds = %land.lhs.true15
  %12 = load i8*, i8** %t, align 4
  %arrayidx = getelementptr inbounds i8, i8* %12, i32 0
  %13 = load i8, i8* %arrayidx, align 1
  %conv19 = sext i8 %13 to i32
  %cmp20 = icmp ne i32 %conv19, 67
  br i1 %cmp20, label %land.lhs.true26, label %lor.lhs.false22

lor.lhs.false22:                                  ; preds = %land.lhs.true18
  %14 = load i8*, i8** %t, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %14, i32 1
  %15 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %15 to i32
  %tobool25 = icmp ne i32 %conv24, 0
  br i1 %tobool25, label %land.lhs.true26, label %if.else

land.lhs.true26:                                  ; preds = %lor.lhs.false22, %land.lhs.true18
  %16 = load i8*, i8** %t, align 4
  %arrayidx27 = getelementptr inbounds i8, i8* %16, i32 0
  %17 = load i8, i8* %arrayidx27, align 1
  %conv28 = sext i8 %17 to i32
  %18 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), align 1
  %conv29 = sext i8 %18 to i32
  %cmp30 = icmp eq i32 %conv28, %conv29
  br i1 %cmp30, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true26
  %19 = load i8*, i8** %t, align 4
  %call32 = call i32 @strcmp(i8* %19, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0))
  %cmp33 = icmp eq i32 %call32, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true26
  %20 = phi i1 [ false, %land.lhs.true26 ], [ %cmp33, %land.rhs ]
  %land.ext = zext i1 %20 to i32
  %cmp35 = icmp eq i32 %land.ext, 0
  br i1 %cmp35, label %if.then37, label %if.else

if.then37:                                        ; preds = %land.end
  store i32 1, i32* @_rl_meta_flag, align 4
  store i32 0, i32* @_rl_convert_meta_chars_to_ascii, align 4
  store i32 1, i32* @_rl_output_meta_chars, align 4
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %land.end, %lor.lhs.false22, %land.lhs.true15, %if.end13
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then37
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind
define internal i8* @_rl_get_locale_var(i8* %v) #0 {
entry:
  %v.addr = alloca i8*, align 4
  %lspec = alloca i8*, align 4
  store i8* %v, i8** %v.addr, align 4
  %call = call i8* @sh_get_env_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0))
  store i8* %call, i8** %lspec, align 4
  %0 = load i8*, i8** %lspec, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %lspec, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %v.addr, align 4
  %call3 = call i8* @sh_get_env_value(i8* %3)
  store i8* %call3, i8** %lspec, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %4 = load i8*, i8** %lspec, align 4
  %cmp4 = icmp eq i8* %4, null
  br i1 %cmp4, label %if.then10, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %if.end
  %5 = load i8*, i8** %lspec, align 4
  %6 = load i8, i8* %5, align 1
  %conv7 = sext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 0
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %lor.lhs.false6, %if.end
  %call11 = call i8* @sh_get_env_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0))
  store i8* %call11, i8** %lspec, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %lor.lhs.false6
  %7 = load i8*, i8** %lspec, align 4
  ret i8* %7
}

declare i8* @setlocale(i32, i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @utf8locale(i8* %lspec) #0 {
entry:
  %lspec.addr = alloca i8*, align 4
  %cp = alloca i8*, align 4
  %len = alloca i32, align 4
  store i8* %lspec, i8** %lspec.addr, align 4
  %call = call i8* @nl_langinfo(i32 14)
  store i8* %call, i8** %cp, align 4
  %0 = load i8*, i8** %cp, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0), align 1
  %conv1 = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %land.lhs.true, label %lor.rhs

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %cp, align 4
  %call3 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i32 0, i32 0))
  %cmp4 = icmp eq i32 %call3, 0
  br i1 %cmp4, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.lhs.true, %entry
  %4 = load i8*, i8** %cp, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  %6 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), align 1
  %conv8 = sext i8 %6 to i32
  %cmp9 = icmp eq i32 %conv7, %conv8
  br i1 %cmp9, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %7 = load i8*, i8** %cp, align 4
  %call11 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0))
  %cmp12 = icmp eq i32 %call11, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %8 = phi i1 [ false, %lor.rhs ], [ %cmp12, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.lhs.true
  %9 = phi i1 [ true, %land.lhs.true ], [ %8, %land.end ]
  %lor.ext = zext i1 %9 to i32
  ret i32 %lor.ext
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @sh_get_env_value(i8*) #1

declare i8* @nl_langinfo(i32) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
