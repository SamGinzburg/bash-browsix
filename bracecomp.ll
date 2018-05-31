; ModuleID = 'bracecomp.c'
source_filename = "bracecomp.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

@rl_ignore_some_completions_function = external global i32 (i8**)*, align 4
@rl_attempted_completion_function = external global i8** (i8*, i32, i32)*, align 4
@rl_completion_entry_function = external global i8* (i8*, i32)*, align 4
@rl_filename_quoting_function = external global i8* (i8*, i32, i8*)*, align 4
@rl_filename_quoting_desired = external global i32, align 4
@.str = private unnamed_addr constant [12 x i8] c"bracecomp.c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"{\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c",\00", align 1

; Function Attrs: noinline nounwind
define i32 @bash_brace_completion(i32 %count, i32 %ignore) #0 {
entry:
  %count.addr = alloca i32, align 4
  %ignore.addr = alloca i32, align 4
  %orig_ignore_func = alloca i32 (i8**)*, align 4
  %orig_entry_func = alloca i8* (i8*, i32)*, align 4
  %orig_quoting_func = alloca i8* (i8*, i32, i8*)*, align 4
  %orig_attempt_func = alloca i8** (i8*, i32, i32)*, align 4
  %orig_quoting_desired = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 %ignore, i32* %ignore.addr, align 4
  %0 = load i32 (i8**)*, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i32 (i8**)* %0, i32 (i8**)** %orig_ignore_func, align 4
  %1 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i8** (i8*, i32, i32)* %1, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  %2 = load i8* (i8*, i32)*, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8* (i8*, i32)* %2, i8* (i8*, i32)** %orig_entry_func, align 4
  %3 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  store i8* (i8*, i32, i8*)* %3, i8* (i8*, i32, i8*)** %orig_quoting_func, align 4
  %4 = load i32, i32* @rl_filename_quoting_desired, align 4
  store i32 %4, i32* %orig_quoting_desired, align 4
  store i8* (i8*, i32)* @rl_filename_completion_function, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  store i8** (i8*, i32, i32)* null, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  store i32 (i8**)* @hack_braces_completion, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  store i8* (i8*, i32, i8*)* null, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  store i32 0, i32* @rl_filename_quoting_desired, align 4
  %call = call i32 @rl_complete_internal(i32 9)
  store i32 %call, i32* %r, align 4
  %5 = load i32 (i8**)*, i32 (i8**)** %orig_ignore_func, align 4
  store i32 (i8**)* %5, i32 (i8**)** @rl_ignore_some_completions_function, align 4
  %6 = load i8** (i8*, i32, i32)*, i8** (i8*, i32, i32)** %orig_attempt_func, align 4
  store i8** (i8*, i32, i32)* %6, i8** (i8*, i32, i32)** @rl_attempted_completion_function, align 4
  %7 = load i8* (i8*, i32)*, i8* (i8*, i32)** %orig_entry_func, align 4
  store i8* (i8*, i32)* %7, i8* (i8*, i32)** @rl_completion_entry_function, align 4
  %8 = load i8* (i8*, i32, i8*)*, i8* (i8*, i32, i8*)** %orig_quoting_func, align 4
  store i8* (i8*, i32, i8*)* %8, i8* (i8*, i32, i8*)** @rl_filename_quoting_function, align 4
  %9 = load i32, i32* %orig_quoting_desired, align 4
  store i32 %9, i32* @rl_filename_quoting_desired, align 4
  %10 = load i32, i32* %r, align 4
  ret i32 %10
}

declare i8* @rl_filename_completion_function(i8*, i32) #1

; Function Attrs: noinline nounwind
define internal i32 @hack_braces_completion(i8** %names) #0 {
entry:
  %names.addr = alloca i8**, align 4
  %i = alloca i32, align 4
  %temp = alloca i8*, align 4
  store i8** %names, i8*** %names.addr, align 4
  %0 = load i8**, i8*** %names.addr, align 4
  %call = call i32 @strvec_len(i8** %0)
  store i32 %call, i32* %i, align 4
  %call1 = call i32 @__ctype_get_mb_cur_max()
  %cmp = icmp ugt i32 %call1, 1
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp sgt i32 %1, 2
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = load i8**, i8*** %names.addr, align 4
  %add.ptr = getelementptr inbounds i8*, i8** %2, i32 1
  %3 = bitcast i8** %add.ptr to i8*
  %4 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %4, 1
  call void @qsort(i8* %3, i32 %sub, i32 4, i32 (i8*, i8*)* bitcast (i32 (i8**, i8**)* @_strcompare to i32 (i8*, i8*)*))
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load i8**, i8*** %names.addr, align 4
  %6 = load i32, i32* %i, align 4
  %call3 = call i8* @really_munge_braces(i8** %5, i32 1, i32 %6, i32 0)
  store i8* %call3, i8** %temp, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i8**, i8*** %names.addr, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %7, i32 %8
  %9 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %9, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i8**, i8*** %names.addr, align 4
  %11 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %10, i32 %11
  %12 = load i8*, i8** %arrayidx4, align 4
  call void @sh_xfree(i8* %12, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 180)
  %13 = load i8**, i8*** %names.addr, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %13, i32 %14
  store i8* null, i8** %arrayidx5, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %temp, align 4
  %17 = load i8**, i8*** %names.addr, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %17, i32 0
  store i8* %16, i8** %arrayidx6, align 4
  ret i32 0
}

declare i32 @rl_complete_internal(i32) #1

declare i32 @strvec_len(i8**) #1

declare i32 @__ctype_get_mb_cur_max() #1

declare void @qsort(i8*, i32, i32, i32 (i8*, i8*)*) #1

; Function Attrs: noinline nounwind
define internal i32 @_strcompare(i8** %s1, i8** %s2) #0 {
entry:
  %s1.addr = alloca i8**, align 4
  %s2.addr = alloca i8**, align 4
  %result = alloca i32, align 4
  store i8** %s1, i8*** %s1.addr, align 4
  store i8** %s2, i8*** %s2.addr, align 4
  %0 = load i8**, i8*** %s1.addr, align 4
  %1 = load i8*, i8** %0, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %3 = load i8**, i8*** %s2.addr, align 4
  %4 = load i8*, i8** %3, align 4
  %5 = load i8, i8* %4, align 1
  %conv1 = sext i8 %5 to i32
  %sub = sub nsw i32 %conv, %conv1
  store i32 %sub, i32* %result, align 4
  %6 = load i32, i32* %result, align 4
  %cmp = icmp eq i32 %6, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i8**, i8*** %s1.addr, align 4
  %8 = load i8*, i8** %7, align 4
  %9 = load i8**, i8*** %s2.addr, align 4
  %10 = load i8*, i8** %9, align 4
  %call = call i32 @strcmp(i8* %8, i8* %10)
  store i32 %call, i32* %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %11 = load i32, i32* %result, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind
define internal i8* @really_munge_braces(i8** %array, i32 %real_start, i32 %real_end, i32 %gcd_zero) #0 {
entry:
  %retval = alloca i8*, align 4
  %array.addr = alloca i8**, align 4
  %real_start.addr = alloca i32, align 4
  %real_end.addr = alloca i32, align 4
  %gcd_zero.addr = alloca i32, align 4
  %start = alloca i32, align 4
  %end = alloca i32, align 4
  %gcd = alloca i32, align 4
  %result = alloca i8*, align 4
  %subterm = alloca i8*, align 4
  %x = alloca i8*, align 4
  %result_size = alloca i32, align 4
  %flag = alloca i32, align 4
  %tlen = alloca i32, align 4
  %temp = alloca i32, align 4
  store i8** %array, i8*** %array.addr, align 4
  store i32 %real_start, i32* %real_start.addr, align 4
  store i32 %real_end, i32* %real_end.addr, align 4
  store i32 %gcd_zero, i32* %gcd_zero.addr, align 4
  store i32 0, i32* %flag, align 4
  %0 = load i32, i32* %real_start.addr, align 4
  %1 = load i32, i32* %real_end.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** %array.addr, align 4
  %3 = load i32, i32* %real_start.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %2, i32 %3
  %4 = load i8*, i8** %arrayidx, align 4
  %tobool = icmp ne i8* %4, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %5 = load i8**, i8*** %array.addr, align 4
  %6 = load i32, i32* %real_start.addr, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %5, i32 %6
  %7 = load i8*, i8** %arrayidx1, align 4
  %8 = load i32, i32* %gcd_zero.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %7, i32 %8
  %call = call i8* @sh_backslash_quote(i8* %add.ptr, i8* null, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %9 = load i8**, i8*** %array.addr, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %9, i32 0
  %10 = load i8*, i8** %arrayidx2, align 4
  %call3 = call i8* @sh_backslash_quote(i8* %10, i8* null, i32 0)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call3, %cond.false ]
  store i8* %cond, i8** %x, align 4
  %11 = load i8*, i8** %x, align 4
  store i8* %11, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 16, i32* %result_size, align 4
  %call4 = call i8* @sh_xmalloc(i32 16, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 83)
  store i8* %call4, i8** %result, align 4
  %12 = load i8*, i8** %result, align 4
  store i8 0, i8* %12, align 1
  %13 = load i32, i32* %real_start.addr, align 4
  store i32 %13, i32* %start, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc65, %if.end
  %14 = load i32, i32* %start, align 4
  %15 = load i32, i32* %real_end.addr, align 4
  %cmp5 = icmp slt i32 %14, %15
  br i1 %cmp5, label %for.body, label %for.end67

for.body:                                         ; preds = %for.cond
  %16 = load i8**, i8*** %array.addr, align 4
  %17 = load i32, i32* %start, align 4
  %arrayidx6 = getelementptr inbounds i8*, i8** %16, i32 %17
  %18 = load i8*, i8** %arrayidx6, align 4
  %call7 = call i32 @strlen(i8* %18)
  store i32 %call7, i32* %gcd, align 4
  %19 = load i32, i32* %start, align 4
  %add = add nsw i32 %19, 1
  store i32 %add, i32* %end, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc, %for.body
  %20 = load i32, i32* %end, align 4
  %21 = load i32, i32* %real_end.addr, align 4
  %cmp9 = icmp slt i32 %20, %21
  br i1 %cmp9, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond8
  %22 = load i8**, i8*** %array.addr, align 4
  %23 = load i32, i32* %start, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %22, i32 %23
  %24 = load i8*, i8** %arrayidx11, align 4
  %25 = load i8**, i8*** %array.addr, align 4
  %26 = load i32, i32* %end, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %25, i32 %26
  %27 = load i8*, i8** %arrayidx12, align 4
  %call13 = call i32 @string_gcd(i8* %24, i8* %27)
  store i32 %call13, i32* %temp, align 4
  %28 = load i32, i32* %temp, align 4
  %29 = load i32, i32* %gcd_zero.addr, align 4
  %cmp14 = icmp sle i32 %28, %29
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %for.body10
  br label %for.end

if.end16:                                         ; preds = %for.body10
  %30 = load i32, i32* %temp, align 4
  store i32 %30, i32* %gcd, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %31 = load i32, i32* %end, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %end, align 4
  br label %for.cond8

for.end:                                          ; preds = %if.then15, %for.cond8
  %32 = load i32, i32* %end, align 4
  %dec = add nsw i32 %32, -1
  store i32 %dec, i32* %end, align 4
  %33 = load i32, i32* %gcd_zero.addr, align 4
  %cmp17 = icmp eq i32 %33, 0
  br i1 %cmp17, label %land.lhs.true, label %if.end27

land.lhs.true:                                    ; preds = %for.end
  %34 = load i32, i32* %start, align 4
  %35 = load i32, i32* %real_start.addr, align 4
  %cmp18 = icmp eq i32 %34, %35
  br i1 %cmp18, label %land.lhs.true19, label %if.end27

land.lhs.true19:                                  ; preds = %land.lhs.true
  %36 = load i32, i32* %end, align 4
  %37 = load i32, i32* %real_end.addr, align 4
  %sub = sub nsw i32 %37, 1
  %cmp20 = icmp ne i32 %36, %sub
  br i1 %cmp20, label %if.then21, label %if.end27

if.then21:                                        ; preds = %land.lhs.true19
  %38 = load i32, i32* %result_size, align 4
  %add22 = add nsw i32 %38, 1
  store i32 %add22, i32* %result_size, align 4
  %39 = load i8*, i8** %result, align 4
  %40 = load i32, i32* %result_size, align 4
  %call23 = call i8* @sh_xrealloc(i8* %39, i32 %40, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 107)
  store i8* %call23, i8** %result, align 4
  %41 = load i8*, i8** %result, align 4
  %arrayidx24 = getelementptr inbounds i8, i8* %41, i32 0
  store i8 123, i8* %arrayidx24, align 1
  %42 = load i8*, i8** %result, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %42, i32 1
  store i8 0, i8* %arrayidx25, align 1
  %43 = load i32, i32* %flag, align 4
  %inc26 = add nsw i32 %43, 1
  store i32 %inc26, i32* %flag, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.then21, %land.lhs.true19, %land.lhs.true, %for.end
  %44 = load i32, i32* %start, align 4
  %45 = load i32, i32* %end, align 4
  %cmp28 = icmp eq i32 %44, %45
  br i1 %cmp28, label %if.then29, label %if.else

if.then29:                                        ; preds = %if.end27
  %46 = load i8**, i8*** %array.addr, align 4
  %47 = load i32, i32* %start, align 4
  %arrayidx30 = getelementptr inbounds i8*, i8** %46, i32 %47
  %48 = load i8*, i8** %arrayidx30, align 4
  %49 = load i32, i32* %gcd_zero.addr, align 4
  %add.ptr31 = getelementptr inbounds i8, i8* %48, i32 %49
  %call32 = call i32 @strlen(i8* %add.ptr31)
  %add33 = add i32 1, %call32
  %call34 = call i8* @sh_xmalloc(i32 %add33, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 117)
  %50 = load i8**, i8*** %array.addr, align 4
  %51 = load i32, i32* %start, align 4
  %arrayidx35 = getelementptr inbounds i8*, i8** %50, i32 %51
  %52 = load i8*, i8** %arrayidx35, align 4
  %53 = load i32, i32* %gcd_zero.addr, align 4
  %add.ptr36 = getelementptr inbounds i8, i8* %52, i32 %53
  %call37 = call i8* @strcpy(i8* %call34, i8* %add.ptr36)
  store i8* %call37, i8** %x, align 4
  %54 = load i8*, i8** %x, align 4
  %call38 = call i8* @sh_backslash_quote(i8* %54, i8* null, i32 0)
  store i8* %call38, i8** %subterm, align 4
  %55 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %55, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 119)
  br label %if.end58

if.else:                                          ; preds = %if.end27
  %56 = load i32, i32* %gcd, align 4
  %57 = load i32, i32* %gcd_zero.addr, align 4
  %sub39 = sub nsw i32 %56, %57
  store i32 %sub39, i32* %tlen, align 4
  %58 = load i32, i32* %tlen, align 4
  %add40 = add nsw i32 %58, 1
  %call41 = call i8* @sh_xmalloc(i32 %add40, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 126)
  store i8* %call41, i8** %x, align 4
  %59 = load i8*, i8** %x, align 4
  %60 = load i8**, i8*** %array.addr, align 4
  %61 = load i32, i32* %start, align 4
  %arrayidx42 = getelementptr inbounds i8*, i8** %60, i32 %61
  %62 = load i8*, i8** %arrayidx42, align 4
  %63 = load i32, i32* %gcd_zero.addr, align 4
  %add.ptr43 = getelementptr inbounds i8, i8* %62, i32 %63
  %64 = load i32, i32* %tlen, align 4
  %call44 = call i8* @strncpy(i8* %59, i8* %add.ptr43, i32 %64)
  %65 = load i8*, i8** %x, align 4
  %66 = load i32, i32* %tlen, align 4
  %arrayidx45 = getelementptr inbounds i8, i8* %65, i32 %66
  store i8 0, i8* %arrayidx45, align 1
  %67 = load i8*, i8** %x, align 4
  %call46 = call i8* @sh_backslash_quote(i8* %67, i8* null, i32 0)
  store i8* %call46, i8** %subterm, align 4
  %68 = load i8*, i8** %x, align 4
  call void @sh_xfree(i8* %68, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 130)
  %69 = load i8*, i8** %subterm, align 4
  %call47 = call i32 @strlen(i8* %69)
  %add48 = add i32 %call47, 1
  %70 = load i32, i32* %result_size, align 4
  %add49 = add i32 %70, %add48
  store i32 %add49, i32* %result_size, align 4
  %71 = load i8*, i8** %result, align 4
  %72 = load i32, i32* %result_size, align 4
  %call50 = call i8* @sh_xrealloc(i8* %71, i32 %72, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 132)
  store i8* %call50, i8** %result, align 4
  %73 = load i8*, i8** %result, align 4
  %74 = load i8*, i8** %subterm, align 4
  %call51 = call i8* @strcat(i8* %73, i8* %74)
  %75 = load i8*, i8** %subterm, align 4
  call void @sh_xfree(i8* %75, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 134)
  %76 = load i8*, i8** %result, align 4
  %call52 = call i8* @strcat(i8* %76, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %77 = load i8**, i8*** %array.addr, align 4
  %78 = load i32, i32* %start, align 4
  %79 = load i32, i32* %end, align 4
  %add53 = add nsw i32 %79, 1
  %80 = load i32, i32* %gcd, align 4
  %call54 = call i8* @really_munge_braces(i8** %77, i32 %78, i32 %add53, i32 %80)
  store i8* %call54, i8** %subterm, align 4
  %81 = load i8*, i8** %subterm, align 4
  %82 = load i8*, i8** %subterm, align 4
  %call55 = call i32 @strlen(i8* %82)
  %sub56 = sub i32 %call55, 1
  %arrayidx57 = getelementptr inbounds i8, i8* %81, i32 %sub56
  store i8 125, i8* %arrayidx57, align 1
  br label %if.end58

if.end58:                                         ; preds = %if.else, %if.then29
  %83 = load i8*, i8** %subterm, align 4
  %call59 = call i32 @strlen(i8* %83)
  %add60 = add i32 %call59, 1
  %84 = load i32, i32* %result_size, align 4
  %add61 = add i32 %84, %add60
  store i32 %add61, i32* %result_size, align 4
  %85 = load i8*, i8** %result, align 4
  %86 = load i32, i32* %result_size, align 4
  %call62 = call i8* @sh_xrealloc(i8* %85, i32 %86, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 141)
  store i8* %call62, i8** %result, align 4
  %87 = load i8*, i8** %result, align 4
  %88 = load i8*, i8** %subterm, align 4
  %call63 = call i8* @strcat(i8* %87, i8* %88)
  %89 = load i8*, i8** %result, align 4
  %call64 = call i8* @strcat(i8* %89, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  %90 = load i8*, i8** %subterm, align 4
  call void @sh_xfree(i8* %90, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 144)
  br label %for.inc65

for.inc65:                                        ; preds = %if.end58
  %91 = load i32, i32* %end, align 4
  %add66 = add nsw i32 %91, 1
  store i32 %add66, i32* %start, align 4
  br label %for.cond

for.end67:                                        ; preds = %for.cond
  %92 = load i32, i32* %gcd_zero.addr, align 4
  %cmp68 = icmp eq i32 %92, 0
  br i1 %cmp68, label %if.then69, label %if.end75

if.then69:                                        ; preds = %for.end67
  %93 = load i32, i32* %flag, align 4
  %tobool70 = icmp ne i32 %93, 0
  %cond71 = select i1 %tobool70, i32 125, i32 0
  %conv = trunc i32 %cond71 to i8
  %94 = load i8*, i8** %result, align 4
  %95 = load i8*, i8** %result, align 4
  %call72 = call i32 @strlen(i8* %95)
  %sub73 = sub i32 %call72, 1
  %arrayidx74 = getelementptr inbounds i8, i8* %94, i32 %sub73
  store i8 %conv, i8* %arrayidx74, align 1
  br label %if.end75

if.end75:                                         ; preds = %if.then69, %for.end67
  %96 = load i8*, i8** %result, align 4
  store i8* %96, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end75, %cond.end
  %97 = load i8*, i8** %retval, align 4
  ret i8* %97
}

declare void @sh_xfree(i8*, i8*, i32) #1

declare i32 @strcmp(i8*, i8*) #1

declare i8* @sh_backslash_quote(i8*, i8*, i32) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @string_gcd(i8* %s1, i8* %s2) #0 {
entry:
  %retval = alloca i32, align 4
  %s1.addr = alloca i8*, align 4
  %s2.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %s1, i8** %s1.addr, align 4
  store i8* %s2, i8** %s2.addr, align 4
  %0 = load i8*, i8** %s1.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %s2.addr, align 4
  %cmp1 = icmp eq i8* %1, null
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i8*, i8** %s1.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i8*, i8** %s2.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv2 = sext i8 %5 to i32
  %tobool3 = icmp ne i32 %conv2, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %6 = phi i1 [ false, %for.cond ], [ %tobool3, %land.rhs ]
  br i1 %6, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %7 = load i8*, i8** %s1.addr, align 4
  %8 = load i8, i8* %7, align 1
  %conv4 = sext i8 %8 to i32
  %9 = load i8*, i8** %s2.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv5 = sext i8 %10 to i32
  %cmp6 = icmp ne i32 %conv4, %conv5
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %for.body
  br label %for.end

if.end9:                                          ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %11 = load i8*, i8** %s1.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %s1.addr, align 4
  %12 = load i8*, i8** %s2.addr, align 4
  %incdec.ptr10 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr10, i8** %s2.addr, align 4
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then8, %land.end
  %14 = load i32, i32* %i, align 4
  store i32 %14, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare i8* @strcpy(i8*, i8*) #1

declare i8* @strncpy(i8*, i8*, i32) #1

declare i8* @strcat(i8*, i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
