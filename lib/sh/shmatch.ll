; ModuleID = 'shmatch.c'
source_filename = "shmatch.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.re_pattern_buffer = type { i32, i8*, [4 x i8*], i32, i8 }
%struct.regmatch_t = type { i32, i32 }
%struct.variable = type { i8*, i8*, i8*, %struct.variable* (%struct.variable*)*, %struct.variable* (%struct.variable*, i8*, i64, i8*)*, i32, i32 }
%struct.array = type { i32, i64, i32, %struct.array_element* }
%struct.array_element = type { i64, i8*, %struct.array_element*, %struct.array_element* }

@glob_ignore_case = external global i32, align 4
@match_ignore_case = external global i32, align 4
@.str = private unnamed_addr constant [13 x i8] c"BASH_REMATCH\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"shmatch.c\00", align 1

; Function Attrs: noinline nounwind
define i32 @sh_regmatch(i8* %string, i8* %pattern, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %pattern.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %regex = alloca %struct.re_pattern_buffer, align 4
  %matches = alloca %struct.regmatch_t*, align 4
  %rflags = alloca i32, align 4
  %rematch = alloca %struct.variable*, align 4
  %amatch = alloca %struct.array*, align 4
  %subexp_ind = alloca i32, align 4
  %subexp_str = alloca i8*, align 4
  %subexp_len = alloca i32, align 4
  %result = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %pattern, i8** %pattern.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = bitcast %struct.re_pattern_buffer* %regex to i8*
  call void @llvm.memset.p0i8.i32(i8* %0, i8 0, i32 32, i32 4, i1 false)
  store %struct.variable* null, %struct.variable** %rematch, align 4
  store i32 1, i32* %rflags, align 4
  %1 = load i32, i32* @glob_ignore_case, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* @match_ignore_case, align 4
  %tobool1 = icmp ne i32 %2, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i32, i32* %rflags, align 4
  %or = or i32 %3, 2
  store i32 %or, i32* %rflags, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %4 = load i8*, i8** %pattern.addr, align 4
  %5 = load i32, i32* %rflags, align 4
  %call = call i32 @regcomp(%struct.re_pattern_buffer* %regex, i8* %4, i32 %5)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 2, i32* %retval, align 4
  br label %return

if.end4:                                          ; preds = %if.end
  %re_nsub = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %regex, i32 0, i32 0
  %6 = load i32, i32* %re_nsub, align 4
  %add = add i32 %6, 1
  %mul = mul i32 8, %add
  %call5 = call i8* @malloc(i32 %mul)
  %7 = bitcast i8* %call5 to %struct.regmatch_t*
  store %struct.regmatch_t* %7, %struct.regmatch_t** %matches, align 4
  %8 = load i8*, i8** %string.addr, align 4
  %9 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %tobool6 = icmp ne %struct.regmatch_t* %9, null
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end4
  %re_nsub7 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %regex, i32 0, i32 0
  %10 = load i32, i32* %re_nsub7, align 4
  %add8 = add i32 %10, 1
  br label %cond.end

cond.false:                                       ; preds = %if.end4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add8, %cond.true ], [ 0, %cond.false ]
  %11 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %call9 = call i32 @regexec(%struct.re_pattern_buffer* %regex, i8* %8, i32 %cond, %struct.regmatch_t* %11, i32 0)
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.else

if.then11:                                        ; preds = %cond.end
  store i32 1, i32* %result, align 4
  br label %if.end12

if.else:                                          ; preds = %cond.end
  store i32 0, i32* %result, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then11
  %12 = load i8*, i8** %string.addr, align 4
  %call13 = call i32 @strlen(i8* %12)
  %add14 = add i32 %call13, 10
  store i32 %add14, i32* %subexp_len, align 4
  %13 = load i32, i32* %subexp_len, align 4
  %add15 = add nsw i32 %13, 1
  %call16 = call i8* @malloc(i32 %add15)
  store i8* %call16, i8** %subexp_str, align 4
  %call17 = call i32 @unbind_variable_noref(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  %call18 = call %struct.variable* @make_new_array_variable(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0))
  store %struct.variable* %call18, %struct.variable** %rematch, align 4
  %14 = load %struct.variable*, %struct.variable** %rematch, align 4
  %value = getelementptr inbounds %struct.variable, %struct.variable* %14, i32 0, i32 1
  %15 = load i8*, i8** %value, align 4
  %16 = bitcast i8* %15 to %struct.array*
  store %struct.array* %16, %struct.array** %amatch, align 4
  %17 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %tobool19 = icmp ne %struct.regmatch_t* %17, null
  br i1 %tobool19, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %if.end12
  %18 = load i32, i32* %flags.addr, align 4
  %and = and i32 %18, 1
  %tobool20 = icmp ne i32 %and, 0
  br i1 %tobool20, label %land.lhs.true21, label %if.end32

land.lhs.true21:                                  ; preds = %land.lhs.true
  %19 = load i32, i32* %result, align 4
  %cmp = icmp eq i32 %19, 0
  br i1 %cmp, label %land.lhs.true22, label %if.end32

land.lhs.true22:                                  ; preds = %land.lhs.true21
  %20 = load i8*, i8** %subexp_str, align 4
  %tobool23 = icmp ne i8* %20, null
  br i1 %tobool23, label %if.then24, label %if.end32

if.then24:                                        ; preds = %land.lhs.true22
  store i32 0, i32* %subexp_ind, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then24
  %21 = load i32, i32* %subexp_ind, align 4
  %re_nsub25 = getelementptr inbounds %struct.re_pattern_buffer, %struct.re_pattern_buffer* %regex, i32 0, i32 0
  %22 = load i32, i32* %re_nsub25, align 4
  %cmp26 = icmp ule i32 %21, %22
  br i1 %cmp26, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %23 = load i8*, i8** %subexp_str, align 4
  %24 = load i32, i32* %subexp_len, align 4
  call void @llvm.memset.p0i8.i32(i8* %23, i8 0, i32 %24, i32 1, i1 false)
  %25 = load i8*, i8** %subexp_str, align 4
  %26 = load i8*, i8** %string.addr, align 4
  %27 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %28 = load i32, i32* %subexp_ind, align 4
  %arrayidx = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %27, i32 %28
  %rm_so = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %arrayidx, i32 0, i32 0
  %29 = load i32, i32* %rm_so, align 4
  %add.ptr = getelementptr inbounds i8, i8* %26, i32 %29
  %30 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %31 = load i32, i32* %subexp_ind, align 4
  %arrayidx27 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %30, i32 %31
  %rm_eo = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %arrayidx27, i32 0, i32 1
  %32 = load i32, i32* %rm_eo, align 4
  %33 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %34 = load i32, i32* %subexp_ind, align 4
  %arrayidx28 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %33, i32 %34
  %rm_so29 = getelementptr inbounds %struct.regmatch_t, %struct.regmatch_t* %arrayidx28, i32 0, i32 0
  %35 = load i32, i32* %rm_so29, align 4
  %sub = sub nsw i32 %32, %35
  %call30 = call i8* @strncpy(i8* %25, i8* %add.ptr, i32 %sub)
  %36 = load %struct.array*, %struct.array** %amatch, align 4
  %37 = load i32, i32* %subexp_ind, align 4
  %conv = sext i32 %37 to i64
  %38 = load i8*, i8** %subexp_str, align 4
  %call31 = call i32 @array_insert(%struct.array* %36, i64 %conv, i8* %38)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %39 = load i32, i32* %subexp_ind, align 4
  %inc = add nsw i32 %39, 1
  store i32 %inc, i32* %subexp_ind, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end32

if.end32:                                         ; preds = %for.end, %land.lhs.true22, %land.lhs.true21, %land.lhs.true, %if.end12
  %40 = load %struct.variable*, %struct.variable** %rematch, align 4
  %attributes = getelementptr inbounds %struct.variable, %struct.variable* %40, i32 0, i32 5
  %41 = load i32, i32* %attributes, align 4
  %or33 = or i32 %41, 2
  store i32 %or33, i32* %attributes, align 4
  %42 = load i8*, i8** %subexp_str, align 4
  call void @sh_xfree(i8* %42, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 112)
  %43 = load %struct.regmatch_t*, %struct.regmatch_t** %matches, align 4
  %44 = bitcast %struct.regmatch_t* %43 to i8*
  call void @sh_xfree(i8* %44, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i32 0, i32 0), i32 113)
  call void @regfree(%struct.re_pattern_buffer* %regex)
  %45 = load i32, i32* %result, align 4
  store i32 %45, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end32, %if.then3
  %46 = load i32, i32* %retval, align 4
  ret i32 %46
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #1

declare i32 @regcomp(%struct.re_pattern_buffer*, i8*, i32) #2

declare i8* @malloc(i32) #2

declare i32 @regexec(%struct.re_pattern_buffer*, i8*, i32, %struct.regmatch_t*, i32) #2

declare i32 @strlen(i8*) #2

declare i32 @unbind_variable_noref(i8*) #2

declare %struct.variable* @make_new_array_variable(i8*) #2

declare i8* @strncpy(i8*, i8*, i32) #2

declare i32 @array_insert(%struct.array*, i64, i8*) #2

declare void @sh_xfree(i8*, i8*, i32) #2

declare void @regfree(%struct.re_pattern_buffer*) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
