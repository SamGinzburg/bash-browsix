; ModuleID = 'general.c'
source_filename = "general.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.user_info = type { i32, i32, i32, i32, i8*, i8*, i8* }
%struct.word_desc = type { i8*, i32 }
%struct.stat = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i32, i32 }

@.str = private unnamed_addr constant [41 x i8] c"getcwd: cannot access parent directories\00", align 1
@bash_getcwd_errstr = constant i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i32 0, i32 0), align 4
@expand_aliases = external global i32, align 4
@source_uses_path = external global i32, align 4
@interactive_comments = external global i32, align 4
@inherit_errexit = external global i32, align 4
@source_searches_cwd = external global i32, align 4
@interactive_shell = external global i32, align 4
@.str.1 = private unnamed_addr constant [5 x i8] c"%s%s\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"general.c\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"`%s': not a valid identifier\00", align 1
@sh_syntaxtab = external global [0 x i32], align 4
@posixly_correct = external global i32, align 4
@.str.6 = private unnamed_addr constant [9 x i8] c"/dev/tty\00", align 1
@stdin = external constant %struct._IO_FILE*, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@.str.7 = private unnamed_addr constant [5 x i8] c"HOME\00", align 1
@tdir = internal global [4096 x i8] zeroinitializer, align 1
@.str.8 = private unnamed_addr constant [15 x i8] c"PROMPT_DIRTRIM\00", align 1
@tilde_initialize.times_called = internal global i32 0, align 4
@tilde_expansion_preexpansion_hook = external global i8* (i8*)*, align 4
@bash_tilde_prefixes = internal global i8** null, align 4
@.str.9 = private unnamed_addr constant [3 x i8] c"=~\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c":~\00", align 1
@bash_tilde_prefixes2 = internal global i8** null, align 4
@tilde_additional_prefixes = external global i8**, align 4
@bash_tilde_suffixes = internal global i8** null, align 4
@.str.11 = private unnamed_addr constant [2 x i8] c":\00", align 1
@tilde_additional_suffixes = external global i8**, align 4
@bash_tilde_suffixes2 = internal global i8** null, align 4
@terminating_signal = external global i32, align 4
@interrupt_state = external global i32, align 4
@current_user = external global %struct.user_info, align 4
@ngroups = internal global i32 0, align 4
@group_array = internal global i32* null, align 4
@get_group_list.group_vector = internal global i8** null, align 4
@get_group_array.group_iarray = internal global i32* null, align 4
@.str.12 = private unnamed_addr constant [44 x i8] c"/bin:/usr/bin:/sbin:/usr/sbin:/etc:/usr/etc\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"PWD\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"OLDPWD\00", align 1
@maxgroups = internal global i32 0, align 4

; Function Attrs: noinline nounwind
define void @posix_initialize(i32 %on) #0 {
entry:
  %on.addr = alloca i32, align 4
  store i32 %on, i32* %on.addr, align 4
  %0 = load i32, i32* %on.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* @expand_aliases, align 4
  store i32 1, i32* @source_uses_path, align 4
  store i32 1, i32* @interactive_comments, align 4
  store i32 1, i32* @inherit_errexit, align 4
  store i32 0, i32* @source_searches_cwd, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %on.addr, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 1, i32* @source_searches_cwd, align 4
  %2 = load i32, i32* @interactive_shell, align 4
  store i32 %2, i32* @expand_aliases, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  ret void
}

; Function Attrs: noinline nounwind
define i64 @string_to_rlimtype(i8* %s) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %ret = alloca i64, align 8
  %neg = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i64 0, i64* %ret, align 8
  store i32 0, i32* %neg, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i8*, i8** %s.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %while.cond
  %1 = load i8*, i8** %s.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool1 = icmp ne i32 %conv, 0
  br i1 %tobool1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %3 = load i8*, i8** %s.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv2 = sext i8 %4 to i32
  %cmp = icmp eq i32 %conv2, 32
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %5 = load i8*, i8** %s.addr, align 4
  %6 = load i8, i8* %5, align 1
  %conv4 = sext i8 %6 to i32
  %cmp5 = icmp eq i32 %conv4, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %7 = phi i1 [ true, %land.rhs ], [ %cmp5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %land.lhs.true, %while.cond
  %8 = phi i1 [ false, %land.lhs.true ], [ false, %while.cond ], [ %7, %lor.end ]
  br i1 %8, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %9 = load i8*, i8** %s.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %s.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  %10 = load i8*, i8** %s.addr, align 4
  %tobool7 = icmp ne i8* %10, null
  br i1 %tobool7, label %land.lhs.true8, label %if.end

land.lhs.true8:                                   ; preds = %while.end
  %11 = load i8*, i8** %s.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv9 = sext i8 %12 to i32
  %cmp10 = icmp eq i32 %conv9, 45
  br i1 %cmp10, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true8
  %13 = load i8*, i8** %s.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv12 = sext i8 %14 to i32
  %cmp13 = icmp eq i32 %conv12, 43
  br i1 %cmp13, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true8
  %15 = load i8*, i8** %s.addr, align 4
  %16 = load i8, i8* %15, align 1
  %conv15 = sext i8 %16 to i32
  %cmp16 = icmp eq i32 %conv15, 45
  %conv17 = zext i1 %cmp16 to i32
  store i32 %conv17, i32* %neg, align 4
  %17 = load i8*, i8** %s.addr, align 4
  %incdec.ptr18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr18, i8** %s.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %while.end
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %18 = load i8*, i8** %s.addr, align 4
  %tobool19 = icmp ne i8* %18, null
  br i1 %tobool19, label %land.lhs.true20, label %land.end32

land.lhs.true20:                                  ; preds = %for.cond
  %19 = load i8*, i8** %s.addr, align 4
  %20 = load i8, i8* %19, align 1
  %conv21 = sext i8 %20 to i32
  %tobool22 = icmp ne i32 %conv21, 0
  br i1 %tobool22, label %land.rhs23, label %land.end32

land.rhs23:                                       ; preds = %land.lhs.true20
  %21 = load i8*, i8** %s.addr, align 4
  %22 = load i8, i8* %21, align 1
  %conv24 = sext i8 %22 to i32
  %cmp25 = icmp sge i32 %conv24, 48
  br i1 %cmp25, label %land.rhs27, label %land.end31

land.rhs27:                                       ; preds = %land.rhs23
  %23 = load i8*, i8** %s.addr, align 4
  %24 = load i8, i8* %23, align 1
  %conv28 = sext i8 %24 to i32
  %cmp29 = icmp sle i32 %conv28, 57
  br label %land.end31

land.end31:                                       ; preds = %land.rhs27, %land.rhs23
  %25 = phi i1 [ false, %land.rhs23 ], [ %cmp29, %land.rhs27 ]
  br label %land.end32

land.end32:                                       ; preds = %land.end31, %land.lhs.true20, %for.cond
  %26 = phi i1 [ false, %land.lhs.true20 ], [ false, %for.cond ], [ %25, %land.end31 ]
  br i1 %26, label %for.body, label %for.end

for.body:                                         ; preds = %land.end32
  %27 = load i64, i64* %ret, align 8
  %mul = mul i64 %27, 10
  %28 = load i8*, i8** %s.addr, align 4
  %29 = load i8, i8* %28, align 1
  %conv33 = sext i8 %29 to i32
  %sub = sub nsw i32 %conv33, 48
  %conv34 = sext i32 %sub to i64
  %add = add i64 %mul, %conv34
  store i64 %add, i64* %ret, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %30 = load i8*, i8** %s.addr, align 4
  %incdec.ptr35 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr35, i8** %s.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end32
  %31 = load i32, i32* %neg, align 4
  %tobool36 = icmp ne i32 %31, 0
  br i1 %tobool36, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %32 = load i64, i64* %ret, align 8
  %sub37 = sub i64 0, %32
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %33 = load i64, i64* %ret, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub37, %cond.true ], [ %33, %cond.false ]
  ret i64 %cond
}

; Function Attrs: noinline nounwind
define void @print_rlimtype(i64 %n, i32 %addnl) #0 {
entry:
  %n.addr = alloca i64, align 8
  %addnl.addr = alloca i32, align 4
  %s = alloca [21 x i8], align 1
  %p = alloca i8*, align 4
  store i64 %n, i64* %n.addr, align 8
  store i32 %addnl, i32* %addnl.addr, align 4
  %arraydecay = getelementptr inbounds [21 x i8], [21 x i8]* %s, i32 0, i32 0
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay, i32 21
  store i8* %add.ptr, i8** %p, align 4
  %0 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %0, i32 -1
  store i8* %incdec.ptr, i8** %p, align 4
  store i8 0, i8* %incdec.ptr, align 1
  %1 = load i64, i64* %n.addr, align 8
  %cmp = icmp ult i64 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %2 = load i64, i64* %n.addr, align 8
  %rem = urem i64 %2, 10
  %sub = sub i64 48, %rem
  %conv = trunc i64 %sub to i8
  %3 = load i8*, i8** %p, align 4
  %incdec.ptr1 = getelementptr inbounds i8, i8* %3, i32 -1
  store i8* %incdec.ptr1, i8** %p, align 4
  store i8 %conv, i8* %incdec.ptr1, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %4 = load i64, i64* %n.addr, align 8
  %div = udiv i64 %4, 10
  store i64 %div, i64* %n.addr, align 8
  %cmp2 = icmp ne i64 %div, 0
  br i1 %cmp2, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %5 = load i8*, i8** %p, align 4
  %incdec.ptr4 = getelementptr inbounds i8, i8* %5, i32 -1
  store i8* %incdec.ptr4, i8** %p, align 4
  store i8 45, i8* %incdec.ptr4, align 1
  br label %if.end

if.else:                                          ; preds = %entry
  br label %do.body5

do.body5:                                         ; preds = %do.cond9, %if.else
  %6 = load i64, i64* %n.addr, align 8
  %rem6 = urem i64 %6, 10
  %add = add i64 48, %rem6
  %conv7 = trunc i64 %add to i8
  %7 = load i8*, i8** %p, align 4
  %incdec.ptr8 = getelementptr inbounds i8, i8* %7, i32 -1
  store i8* %incdec.ptr8, i8** %p, align 4
  store i8 %conv7, i8* %incdec.ptr8, align 1
  br label %do.cond9

do.cond9:                                         ; preds = %do.body5
  %8 = load i64, i64* %n.addr, align 8
  %div10 = udiv i64 %8, 10
  store i64 %div10, i64* %n.addr, align 8
  %cmp11 = icmp ne i64 %div10, 0
  br i1 %cmp11, label %do.body5, label %do.end13

do.end13:                                         ; preds = %do.cond9
  br label %if.end

if.end:                                           ; preds = %do.end13, %do.end
  %9 = load i8*, i8** %p, align 4
  %10 = load i32, i32* %addnl.addr, align 4
  %tobool = icmp ne i32 %10, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.3, i32 0, i32 0)
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i8* %9, i8* %cond)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind
define i32 @all_digits(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %2 = load i8, i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  %conv = sext i8 %4 to i32
  %cmp = icmp sge i32 %conv, 48
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body
  %5 = load i8*, i8** %s, align 4
  %6 = load i8, i8* %5, align 1
  %conv2 = sext i8 %6 to i32
  %cmp3 = icmp sle i32 %conv2, 57
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.body
  %7 = phi i1 [ false, %for.body ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %7 to i32
  %cmp5 = icmp eq i32 %land.ext, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind
define i32 @legal_number(i8* %string, i64* %result) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %result.addr = alloca i64*, align 4
  %value = alloca i64, align 8
  %ep = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i64* %result, i64** %result.addr, align 4
  %0 = load i64*, i64** %result.addr, align 4
  %tobool = icmp ne i64* %0, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64*, i64** %result.addr, align 4
  store i64 0, i64* %1, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %2, null
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end2:                                          ; preds = %if.end
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %3 = load i8*, i8** %string.addr, align 4
  %call3 = call i64 @strtoimax(i8* %3, i8** %ep, i32 10)
  store i64 %call3, i64* %value, align 8
  %call4 = call i32* @__errno_location()
  %4 = load i32, i32* %call4, align 4
  %tobool5 = icmp ne i32 %4, 0
  br i1 %tobool5, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end2
  %5 = load i8*, i8** %ep, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %cmp6 = icmp eq i8* %5, %6
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %lor.lhs.false, %if.end2
  store i32 0, i32* %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end8
  %7 = load i8*, i8** %ep, align 4
  %8 = load i8, i8* %7, align 1
  %conv = sext i8 %8 to i32
  %cmp9 = icmp eq i32 %conv, 32
  br i1 %cmp9, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %9 = load i8*, i8** %ep, align 4
  %10 = load i8, i8* %9, align 1
  %conv11 = sext i8 %10 to i32
  %cmp12 = icmp eq i32 %conv11, 9
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %11 = phi i1 [ true, %while.cond ], [ %cmp12, %lor.rhs ]
  br i1 %11, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %12 = load i8*, i8** %ep, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %ep, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i8, i8* %13, align 1
  %conv14 = sext i8 %14 to i32
  %tobool15 = icmp ne i32 %conv14, 0
  br i1 %tobool15, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %while.end
  %15 = load i8*, i8** %ep, align 4
  %16 = load i8, i8* %15, align 1
  %conv16 = sext i8 %16 to i32
  %cmp17 = icmp eq i32 %conv16, 0
  br i1 %cmp17, label %if.then19, label %if.end23

if.then19:                                        ; preds = %land.lhs.true
  %17 = load i64*, i64** %result.addr, align 4
  %tobool20 = icmp ne i64* %17, null
  br i1 %tobool20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.then19
  %18 = load i64, i64* %value, align 8
  %19 = load i64*, i64** %result.addr, align 4
  store i64 %18, i64* %19, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then21, %if.then19
  store i32 1, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %land.lhs.true, %while.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end23, %if.end22, %if.then7, %if.then1
  %20 = load i32, i32* %retval, align 4
  ret i32 %20
}

declare i32* @__errno_location() #1

declare i64 @strtoimax(i8*, i8**, i32) #1

; Function Attrs: noinline nounwind
define i32 @legal_identifier(i8* %name) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %s = alloca i8*, align 4
  %c = alloca i8, align 1
  store i8* %name, i8** %name.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8, i8* %1, align 1
  store i8 %2, i8* %c, align 1
  %tobool1 = icmp ne i8 %2, 0
  br i1 %tobool1, label %lor.lhs.false2, label %if.then

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %c, align 1
  %conv = zext i8 %3 to i32
  %call = call i32 @isalpha(i32 %conv) #4
  %tobool3 = icmp ne i32 %call, 0
  br i1 %tobool3, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false2
  %4 = load i8, i8* %c, align 1
  %conv4 = zext i8 %4 to i32
  %cmp = icmp eq i32 %conv4, 95
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false2
  %5 = phi i1 [ true, %lor.lhs.false2 ], [ %cmp, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  %cmp6 = icmp eq i32 %lor.ext, 0
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.end, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.end
  %6 = load i8*, i8** %name.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %add.ptr, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i8*, i8** %s, align 4
  %8 = load i8, i8* %7, align 1
  store i8 %8, i8* %c, align 1
  %conv8 = zext i8 %8 to i32
  %cmp9 = icmp ne i32 %conv8, 0
  br i1 %cmp9, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i8, i8* %c, align 1
  %conv11 = zext i8 %9 to i32
  %call12 = call i32 @isalnum(i32 %conv11) #4
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %lor.end18, label %lor.rhs14

lor.rhs14:                                        ; preds = %for.body
  %10 = load i8, i8* %c, align 1
  %conv15 = zext i8 %10 to i32
  %cmp16 = icmp eq i32 %conv15, 95
  br label %lor.end18

lor.end18:                                        ; preds = %lor.rhs14, %for.body
  %11 = phi i1 [ true, %for.body ], [ %cmp16, %lor.rhs14 ]
  %lor.ext19 = zext i1 %11 to i32
  %cmp20 = icmp eq i32 %lor.ext19, 0
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %lor.end18
  store i32 0, i32* %retval, align 4
  br label %return

if.end23:                                         ; preds = %lor.end18
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %12 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then22, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: nounwind readonly
declare i32 @isalpha(i32) #2

; Function Attrs: nounwind readonly
declare i32 @isalnum(i32) #2

; Function Attrs: noinline nounwind
define i32 @valid_nameref_value(i8* %name, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %name.addr, align 4
  %call = call i32 @legal_identifier(i8* %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then8, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %if.end
  %4 = load i32, i32* %flags.addr, align 4
  %cmp4 = icmp ne i32 %4, 2
  br i1 %cmp4, label %land.lhs.true, label %if.end9

land.lhs.true:                                    ; preds = %lor.lhs.false3
  %5 = load i8*, i8** %name.addr, align 4
  %call6 = call i32 @valid_array_reference(i8* %5, i32 0)
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %land.lhs.true, %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %land.lhs.true, %lor.lhs.false3
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end9, %if.then8, %if.then
  %6 = load i32, i32* %retval, align 4
  ret i32 %6
}

declare i32 @valid_array_reference(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @check_selfref(i8* %name, i8* %value, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %name.addr = alloca i8*, align 4
  %value.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %t = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i8* %value, i8** %value.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8*, i8** %value.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %2, i32 0
  %3 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, %conv2
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i8*, i8** %value.addr, align 4
  %call = call i32 @strcmp(i8* %4, i8* %5)
  %cmp4 = icmp eq i32 %call, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %6 = load i8*, i8** %value.addr, align 4
  %call6 = call i32 @valid_array_reference(i8* %6, i32 0)
  %tobool = icmp ne i32 %call6, 0
  br i1 %tobool, label %if.then7, label %if.end23

if.then7:                                         ; preds = %if.end
  %7 = load i8*, i8** %value.addr, align 4
  %call8 = call i8* @array_variable_name(i8* %7, i8** null, i32* null)
  store i8* %call8, i8** %t, align 4
  %8 = load i8*, i8** %t, align 4
  %tobool9 = icmp ne i8* %8, null
  br i1 %tobool9, label %land.lhs.true10, label %if.end22

land.lhs.true10:                                  ; preds = %if.then7
  %9 = load i8*, i8** %name.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %9, i32 0
  %10 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %10 to i32
  %11 = load i8*, i8** %t, align 4
  %arrayidx13 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx13, align 1
  %conv14 = sext i8 %12 to i32
  %cmp15 = icmp eq i32 %conv12, %conv14
  br i1 %cmp15, label %land.lhs.true17, label %if.end22

land.lhs.true17:                                  ; preds = %land.lhs.true10
  %13 = load i8*, i8** %name.addr, align 4
  %14 = load i8*, i8** %t, align 4
  %call18 = call i32 @strcmp(i8* %13, i8* %14)
  %cmp19 = icmp eq i32 %call18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true17
  %15 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %15, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 271)
  store i32 1, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %land.lhs.true17, %land.lhs.true10, %if.then7
  %16 = load i8*, i8** %t, align 4
  call void @sh_xfree(i8* %16, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 274)
  br label %if.end23

if.end23:                                         ; preds = %if.end22, %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end23, %if.then21, %if.then
  %17 = load i32, i32* %retval, align 4
  ret i32 %17
}

declare i32 @strcmp(i8*, i8*) #1

declare i8* @array_variable_name(i8*, i8**, i32*) #1

declare void @sh_xfree(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @check_identifier(%struct.word_desc* %word, i32 %check_word) #0 {
entry:
  %retval = alloca i32, align 4
  %word.addr = alloca %struct.word_desc*, align 4
  %check_word.addr = alloca i32, align 4
  store %struct.word_desc* %word, %struct.word_desc** %word.addr, align 4
  store i32 %check_word, i32* %check_word.addr, align 4
  %0 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %flags = getelementptr inbounds %struct.word_desc, %struct.word_desc* %0, i32 0, i32 1
  %1 = load i32, i32* %flags, align 4
  %and = and i32 %1, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %word1 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word1, align 4
  %call = call i32 @all_digits(i8* %3)
  %tobool2 = icmp ne i32 %call, 0
  br i1 %tobool2, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call3 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  %4 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  call void (i8*, ...) @internal_error(i8* %call3, i8* %5)
  store i32 0, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false
  %6 = load i32, i32* %check_word.addr, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %land.lhs.true, label %if.else11

land.lhs.true:                                    ; preds = %if.else
  %7 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %word6 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word6, align 4
  %call7 = call i32 @legal_identifier(i8* %8)
  %cmp = icmp eq i32 %call7, 0
  br i1 %cmp, label %if.then8, label %if.else11

if.then8:                                         ; preds = %land.lhs.true
  %call9 = call i8* @libintl_gettext(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  %9 = load %struct.word_desc*, %struct.word_desc** %word.addr, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word10, align 4
  call void (i8*, ...) @internal_error(i8* %call9, i8* %10)
  store i32 0, i32* %retval, align 4
  br label %return

if.else11:                                        ; preds = %land.lhs.true, %if.else
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else11, %if.then8, %if.then
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare void @internal_error(i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define i32 @importable_function_name(i8* %string, i32 %len) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @absolute_program(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 10
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %idxprom = zext i8 %4 to i32
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %and = and i32 %5, 8192
  %tobool4 = icmp ne i32 %and, 0
  br i1 %tobool4, label %if.then10, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end3
  %6 = load i8*, i8** %string.addr, align 4
  %7 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %7, 1
  %arrayidx5 = getelementptr inbounds i8, i8* %6, i32 %sub
  %8 = load i8, i8* %arrayidx5, align 1
  %idxprom6 = zext i8 %8 to i32
  %arrayidx7 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom6
  %9 = load i32, i32* %arrayidx7, align 4
  %and8 = and i32 %9, 8192
  %tobool9 = icmp ne i32 %and8, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %lor.lhs.false, %if.end3
  store i32 0, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* @posixly_correct, align 4
  %tobool12 = icmp ne i32 %10, 0
  br i1 %tobool12, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end11
  %11 = load i8*, i8** %string.addr, align 4
  %call13 = call i32 @legal_identifier(i8* %11)
  br label %cond.end

cond.false:                                       ; preds = %if.end11
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call13, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then10, %if.then2, %if.then
  %12 = load i32, i32* %retval, align 4
  ret i32 %12
}

; Function Attrs: noinline nounwind
define i32 @absolute_program(i8* %string) #0 {
entry:
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i8* @mbschr(i8* %0, i32 47)
  %cmp = icmp ne i8* %call, null
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @exportable_function_name(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %call = call i32 @absolute_program(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %call1 = call i8* @mbschr(i8* %1, i32 61)
  %cmp = icmp ne i8* %call1, null
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %2 = load i32, i32* %retval, align 4
  ret i32 %2
}

declare i8* @mbschr(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @legal_alias_name(i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %s = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i8* %0, i8** %s, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %s, align 4
  %2 = load i8, i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %s, align 4
  %4 = load i8, i8* %3, align 1
  %idxprom = zext i8 %4 to i32
  %arrayidx = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %and = and i32 %5, 2
  %tobool1 = icmp ne i32 %and, 0
  br i1 %tobool1, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %6 = load i8*, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %idxprom2 = zext i8 %7 to i32
  %arrayidx3 = getelementptr inbounds [0 x i32], [0 x i32]* @sh_syntaxtab, i32 0, i32 %idxprom2
  %8 = load i32, i32* %arrayidx3, align 4
  %and4 = and i32 %8, 1024
  %tobool5 = icmp ne i32 %and4, 0
  br i1 %tobool5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %9 = load i8*, i8** %s, align 4
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %cmp = icmp eq i32 %conv, 36
  br i1 %cmp, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %11 = load i8*, i8** %s, align 4
  %12 = load i8, i8* %11, align 1
  %conv9 = sext i8 %12 to i32
  %cmp10 = icmp eq i32 %conv9, 60
  br i1 %cmp10, label %if.then, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %lor.lhs.false8
  %13 = load i8*, i8** %s, align 4
  %14 = load i8, i8* %13, align 1
  %conv13 = sext i8 %14 to i32
  %cmp14 = icmp eq i32 %conv13, 62
  br i1 %cmp14, label %if.then, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %lor.lhs.false12
  %15 = load i8*, i8** %s, align 4
  %16 = load i8, i8* %15, align 1
  %conv17 = sext i8 %16 to i32
  %cmp18 = icmp eq i32 %conv17, 47
  br i1 %cmp18, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false16, %lor.lhs.false12, %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false, %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false16
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %17 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then
  %18 = load i32, i32* %retval, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind
define i32 @assignment(i8* %string, i32 %flags) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %c = alloca i8, align 1
  %newi = alloca i32, align 4
  %indx = alloca i32, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  store i32 0, i32* %indx, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  store i8 %1, i8* %c, align 1
  %2 = load i8, i8* %c, align 1
  %conv = zext i8 %2 to i32
  %call = call i32 @isalpha(i32 %conv) #4
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %3 = load i8, i8* %c, align 1
  %conv1 = zext i8 %3 to i32
  %cmp = icmp eq i32 %conv1, 95
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  %cmp3 = icmp eq i32 %lor.ext, 0
  br i1 %cmp3, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.end
  %5 = load i32, i32* %flags.addr, align 4
  %cmp5 = icmp eq i32 %5, 0
  br i1 %cmp5, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load i8, i8* %c, align 1
  %conv7 = zext i8 %6 to i32
  %cmp8 = icmp ne i32 %conv7, 91
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false, %lor.end
  br label %while.cond

while.cond:                                       ; preds = %if.end69, %if.end
  %7 = load i8*, i8** %string.addr, align 4
  %8 = load i32, i32* %indx, align 4
  %arrayidx10 = getelementptr inbounds i8, i8* %7, i32 %8
  %9 = load i8, i8* %arrayidx10, align 1
  store i8 %9, i8* %c, align 1
  %tobool11 = icmp ne i8 %9, 0
  br i1 %tobool11, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load i8, i8* %c, align 1
  %conv12 = zext i8 %10 to i32
  %cmp13 = icmp eq i32 %conv12, 61
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.body
  %11 = load i32, i32* %indx, align 4
  store i32 %11, i32* %retval, align 4
  br label %return

if.end16:                                         ; preds = %while.body
  %12 = load i8, i8* %c, align 1
  %conv17 = zext i8 %12 to i32
  %cmp18 = icmp eq i32 %conv17, 91
  br i1 %cmp18, label %if.then20, label %if.end44

if.then20:                                        ; preds = %if.end16
  %13 = load i8*, i8** %string.addr, align 4
  %14 = load i32, i32* %indx, align 4
  %call21 = call i32 @skipsubscript(i8* %13, i32 %14, i32 0)
  store i32 %call21, i32* %newi, align 4
  %15 = load i8*, i8** %string.addr, align 4
  %16 = load i32, i32* %newi, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %newi, align 4
  %arrayidx22 = getelementptr inbounds i8, i8* %15, i32 %16
  %17 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %17 to i32
  %cmp24 = icmp ne i32 %conv23, 93
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %if.then20
  store i32 0, i32* %retval, align 4
  br label %return

if.end27:                                         ; preds = %if.then20
  %18 = load i8*, i8** %string.addr, align 4
  %19 = load i32, i32* %newi, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %18, i32 %19
  %20 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %20 to i32
  %cmp30 = icmp eq i32 %conv29, 43
  br i1 %cmp30, label %land.lhs.true32, label %if.end39

land.lhs.true32:                                  ; preds = %if.end27
  %21 = load i8*, i8** %string.addr, align 4
  %22 = load i32, i32* %newi, align 4
  %add = add nsw i32 %22, 1
  %arrayidx33 = getelementptr inbounds i8, i8* %21, i32 %add
  %23 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %23 to i32
  %cmp35 = icmp eq i32 %conv34, 61
  br i1 %cmp35, label %if.then37, label %if.end39

if.then37:                                        ; preds = %land.lhs.true32
  %24 = load i32, i32* %newi, align 4
  %add38 = add nsw i32 %24, 1
  store i32 %add38, i32* %retval, align 4
  br label %return

if.end39:                                         ; preds = %land.lhs.true32, %if.end27
  %25 = load i8*, i8** %string.addr, align 4
  %26 = load i32, i32* %newi, align 4
  %arrayidx40 = getelementptr inbounds i8, i8* %25, i32 %26
  %27 = load i8, i8* %arrayidx40, align 1
  %conv41 = sext i8 %27 to i32
  %cmp42 = icmp eq i32 %conv41, 61
  br i1 %cmp42, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end39
  %28 = load i32, i32* %newi, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end39
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %28, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %retval, align 4
  br label %return

if.end44:                                         ; preds = %if.end16
  %29 = load i8, i8* %c, align 1
  %conv45 = zext i8 %29 to i32
  %cmp46 = icmp eq i32 %conv45, 43
  br i1 %cmp46, label %land.lhs.true48, label %if.end56

land.lhs.true48:                                  ; preds = %if.end44
  %30 = load i8*, i8** %string.addr, align 4
  %31 = load i32, i32* %indx, align 4
  %add49 = add nsw i32 %31, 1
  %arrayidx50 = getelementptr inbounds i8, i8* %30, i32 %add49
  %32 = load i8, i8* %arrayidx50, align 1
  %conv51 = sext i8 %32 to i32
  %cmp52 = icmp eq i32 %conv51, 61
  br i1 %cmp52, label %if.then54, label %if.end56

if.then54:                                        ; preds = %land.lhs.true48
  %33 = load i32, i32* %indx, align 4
  %add55 = add nsw i32 %33, 1
  store i32 %add55, i32* %retval, align 4
  br label %return

if.end56:                                         ; preds = %land.lhs.true48, %if.end44
  %34 = load i8, i8* %c, align 1
  %conv57 = zext i8 %34 to i32
  %call58 = call i32 @isalnum(i32 %conv57) #4
  %tobool59 = icmp ne i32 %call58, 0
  br i1 %tobool59, label %lor.end64, label %lor.rhs60

lor.rhs60:                                        ; preds = %if.end56
  %35 = load i8, i8* %c, align 1
  %conv61 = zext i8 %35 to i32
  %cmp62 = icmp eq i32 %conv61, 95
  br label %lor.end64

lor.end64:                                        ; preds = %lor.rhs60, %if.end56
  %36 = phi i1 [ true, %if.end56 ], [ %cmp62, %lor.rhs60 ]
  %lor.ext65 = zext i1 %36 to i32
  %cmp66 = icmp eq i32 %lor.ext65, 0
  br i1 %cmp66, label %if.then68, label %if.end69

if.then68:                                        ; preds = %lor.end64
  store i32 0, i32* %retval, align 4
  br label %return

if.end69:                                         ; preds = %lor.end64
  %37 = load i32, i32* %indx, align 4
  %inc70 = add nsw i32 %37, 1
  store i32 %inc70, i32* %indx, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %while.end, %if.then68, %if.then54, %cond.end, %if.then37, %if.then26, %if.then15, %if.then
  %38 = load i32, i32* %retval, align 4
  ret i32 %38
}

declare i32 @skipsubscript(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @sh_unset_nodelay_mode(i32 %fd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %flags = alloca i32, align 4
  %bflags = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 (i32, i32, ...) @fcntl(i32 %0, i32 3, i32 0)
  store i32 %call, i32* %flags, align 4
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %bflags, align 4
  %1 = load i32, i32* %bflags, align 4
  %or = or i32 %1, 2048
  store i32 %or, i32* %bflags, align 4
  %2 = load i32, i32* %bflags, align 4
  %or1 = or i32 %2, 2048
  store i32 %or1, i32* %bflags, align 4
  %3 = load i32, i32* %flags, align 4
  %4 = load i32, i32* %bflags, align 4
  %and = and i32 %3, %4
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then2, label %if.end5

if.then2:                                         ; preds = %if.end
  %5 = load i32, i32* %bflags, align 4
  %neg = xor i32 %5, -1
  %6 = load i32, i32* %flags, align 4
  %and3 = and i32 %6, %neg
  store i32 %and3, i32* %flags, align 4
  %7 = load i32, i32* %fd.addr, align 4
  %8 = load i32, i32* %flags, align 4
  %call4 = call i32 (i32, i32, ...) @fcntl(i32 %7, i32 4, i32 %8)
  store i32 %call4, i32* %retval, align 4
  br label %return

if.end5:                                          ; preds = %if.end
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end5, %if.then2, %if.then
  %9 = load i32, i32* %retval, align 4
  ret i32 %9
}

declare i32 @fcntl(i32, i32, ...) #1

; Function Attrs: noinline nounwind
define i32 @sh_validfd(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call = call i32 (i32, i32, ...) @fcntl(i32 %0, i32 1, i32 0)
  %cmp = icmp sge i32 %call, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @fd_ispipe(i32 %fd) #0 {
entry:
  %fd.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  %call = call i32* @__errno_location()
  store i32 0, i32* %call, align 4
  %0 = load i32, i32* %fd.addr, align 4
  %call1 = call i32 @lseek(i32 %0, i32 0, i32 1)
  %cmp = icmp slt i32 %call1, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %call2 = call i32* @__errno_location()
  %1 = load i32, i32* %call2, align 4
  %cmp3 = icmp eq i32 %1, 29
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

declare i32 @lseek(i32, i32, i32) #1

; Function Attrs: noinline nounwind
define void @check_dev_tty() #0 {
entry:
  %tty_fd = alloca i32, align 4
  %tty = alloca i8*, align 4
  %call = call i32 (i8*, i32, ...) @open(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.6, i32 0, i32 0), i32 2050)
  store i32 %call, i32* %tty_fd, align 4
  %0 = load i32, i32* %tty_fd, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end6

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 4
  %call1 = call i32 @fileno(%struct._IO_FILE* %1)
  %call2 = call i8* @ttyname(i32 %call1)
  store i8* %call2, i8** %tty, align 4
  %2 = load i8*, i8** %tty, align 4
  %cmp3 = icmp eq i8* %2, null
  br i1 %cmp3, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  br label %if.end10

if.end:                                           ; preds = %if.then
  %3 = load i8*, i8** %tty, align 4
  %call5 = call i32 (i8*, i32, ...) @open(i8* %3, i32 2050)
  store i32 %call5, i32* %tty_fd, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %entry
  %4 = load i32, i32* %tty_fd, align 4
  %cmp7 = icmp sge i32 %4, 0
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end6
  %5 = load i32, i32* %tty_fd, align 4
  %call9 = call i32 @close(i32 %5)
  br label %if.end10

if.end10:                                         ; preds = %if.then4, %if.then8, %if.end6
  ret void
}

declare i32 @open(i8*, i32, ...) #1

declare i8* @ttyname(i32) #1

declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @close(i32) #1

; Function Attrs: noinline nounwind
define i32 @same_file(i8* %path1, i8* %path2, %struct.stat* %stp1, %struct.stat* %stp2) #0 {
entry:
  %retval = alloca i32, align 4
  %path1.addr = alloca i8*, align 4
  %path2.addr = alloca i8*, align 4
  %stp1.addr = alloca %struct.stat*, align 4
  %stp2.addr = alloca %struct.stat*, align 4
  %st1 = alloca %struct.stat, align 8
  %st2 = alloca %struct.stat, align 8
  store i8* %path1, i8** %path1.addr, align 4
  store i8* %path2, i8** %path2.addr, align 4
  store %struct.stat* %stp1, %struct.stat** %stp1.addr, align 4
  store %struct.stat* %stp2, %struct.stat** %stp2.addr, align 4
  %0 = load %struct.stat*, %struct.stat** %stp1.addr, align 4
  %cmp = icmp eq %struct.stat* %0, null
  br i1 %cmp, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %path1.addr, align 4
  %call = call i32 @stat(i8* %1, %struct.stat* %st1)
  %cmp1 = icmp ne i32 %call, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then
  store %struct.stat* %st1, %struct.stat** %stp1.addr, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.end, %entry
  %2 = load %struct.stat*, %struct.stat** %stp2.addr, align 4
  %cmp4 = icmp eq %struct.stat* %2, null
  br i1 %cmp4, label %if.then5, label %if.end10

if.then5:                                         ; preds = %if.end3
  %3 = load i8*, i8** %path2.addr, align 4
  %call6 = call i32 @stat(i8* %3, %struct.stat* %st2)
  %cmp7 = icmp ne i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4
  br label %return

if.end9:                                          ; preds = %if.then5
  store %struct.stat* %st2, %struct.stat** %stp2.addr, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end3
  %4 = load %struct.stat*, %struct.stat** %stp1.addr, align 4
  %st_dev = getelementptr inbounds %struct.stat, %struct.stat* %4, i32 0, i32 0
  %5 = load i32, i32* %st_dev, align 8
  %6 = load %struct.stat*, %struct.stat** %stp2.addr, align 4
  %st_dev11 = getelementptr inbounds %struct.stat, %struct.stat* %6, i32 0, i32 0
  %7 = load i32, i32* %st_dev11, align 8
  %cmp12 = icmp eq i32 %5, %7
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.end10
  %8 = load %struct.stat*, %struct.stat** %stp1.addr, align 4
  %st_ino = getelementptr inbounds %struct.stat, %struct.stat* %8, i32 0, i32 2
  %9 = load i32, i32* %st_ino, align 8
  %10 = load %struct.stat*, %struct.stat** %stp2.addr, align 4
  %st_ino13 = getelementptr inbounds %struct.stat, %struct.stat* %10, i32 0, i32 2
  %11 = load i32, i32* %st_ino13, align 8
  %cmp14 = icmp eq i32 %9, %11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end10
  %12 = phi i1 [ false, %if.end10 ], [ %cmp14, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  store i32 %land.ext, i32* %retval, align 4
  br label %return

return:                                           ; preds = %land.end, %if.then8, %if.then2
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare i32 @stat(i8*, %struct.stat*) #1

; Function Attrs: noinline nounwind
define i32 @move_to_high_fd(i32 %fd, i32 %check_new, i32 %maxfd) #0 {
entry:
  %retval = alloca i32, align 4
  %fd.addr = alloca i32, align 4
  %check_new.addr = alloca i32, align 4
  %maxfd.addr = alloca i32, align 4
  %script_fd = alloca i32, align 4
  %nfds = alloca i32, align 4
  %ignore = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %check_new, i32* %check_new.addr, align 4
  store i32 %maxfd, i32* %maxfd.addr, align 4
  %0 = load i32, i32* %maxfd.addr, align 4
  %cmp = icmp slt i32 %0, 20
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 @getdtablesize()
  store i32 %call, i32* %nfds, align 4
  %1 = load i32, i32* %nfds, align 4
  %cmp1 = icmp sle i32 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  store i32 20, i32* %nfds, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %2 = load i32, i32* %nfds, align 4
  %cmp3 = icmp sgt i32 %2, 256
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 256, i32* %nfds, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  br label %if.end6

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %maxfd.addr, align 4
  store i32 %3, i32* %nfds, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.end5
  %4 = load i32, i32* %nfds, align 4
  %dec = add nsw i32 %4, -1
  store i32 %dec, i32* %nfds, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %5 = load i32, i32* %check_new.addr, align 4
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %6 = load i32, i32* %nfds, align 4
  %cmp7 = icmp sgt i32 %6, 3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp7, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load i32, i32* %nfds, align 4
  %call8 = call i32 (i32, i32, ...) @fcntl(i32 %8, i32 1, i32* %ignore)
  %cmp9 = icmp eq i32 %call8, -1
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.body
  br label %for.end

if.end11:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %9 = load i32, i32* %nfds, align 4
  %dec12 = add nsw i32 %9, -1
  store i32 %dec12, i32* %nfds, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then10, %land.end
  %10 = load i32, i32* %nfds, align 4
  %cmp13 = icmp sgt i32 %10, 3
  br i1 %cmp13, label %land.lhs.true, label %if.end25

land.lhs.true:                                    ; preds = %for.end
  %11 = load i32, i32* %fd.addr, align 4
  %12 = load i32, i32* %nfds, align 4
  %cmp14 = icmp ne i32 %11, %12
  br i1 %cmp14, label %land.lhs.true15, label %if.end25

land.lhs.true15:                                  ; preds = %land.lhs.true
  %13 = load i32, i32* %fd.addr, align 4
  %14 = load i32, i32* %nfds, align 4
  %call16 = call i32 @dup2(i32 %13, i32 %14)
  store i32 %call16, i32* %script_fd, align 4
  %cmp17 = icmp ne i32 %call16, -1
  br i1 %cmp17, label %if.then18, label %if.end25

if.then18:                                        ; preds = %land.lhs.true15
  %15 = load i32, i32* %check_new.addr, align 4
  %cmp19 = icmp eq i32 %15, 0
  br i1 %cmp19, label %if.then22, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then18
  %16 = load i32, i32* %fd.addr, align 4
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call20 = call i32 @fileno(%struct._IO_FILE* %17)
  %cmp21 = icmp ne i32 %16, %call20
  br i1 %cmp21, label %if.then22, label %if.end24

if.then22:                                        ; preds = %lor.lhs.false, %if.then18
  %18 = load i32, i32* %fd.addr, align 4
  %call23 = call i32 @close(i32 %18)
  br label %if.end24

if.end24:                                         ; preds = %if.then22, %lor.lhs.false
  %19 = load i32, i32* %script_fd, align 4
  store i32 %19, i32* %retval, align 4
  br label %return

if.end25:                                         ; preds = %land.lhs.true15, %land.lhs.true, %for.end
  %20 = load i32, i32* %fd.addr, align 4
  store i32 %20, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end25, %if.end24
  %21 = load i32, i32* %retval, align 4
  ret i32 %21
}

declare i32 @getdtablesize() #1

declare i32 @dup2(i32, i32) #1

; Function Attrs: noinline nounwind
define i32 @check_binary_file(i8* %sample, i32 %sample_len) #0 {
entry:
  %retval = alloca i32, align 4
  %sample.addr = alloca i8*, align 4
  %sample_len.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i8, align 1
  store i8* %sample, i8** %sample.addr, align 4
  store i32 %sample_len, i32* %sample_len.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %sample_len.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %sample.addr, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %2, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  store i8 %4, i8* %c, align 1
  %5 = load i8, i8* %c, align 1
  %conv = zext i8 %5 to i32
  %cmp1 = icmp eq i32 %conv, 10
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %for.body
  %6 = load i8, i8* %c, align 1
  %conv3 = zext i8 %6 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then6, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind
define i32 @sh_openpipe(i32* %pv) #0 {
entry:
  %retval = alloca i32, align 4
  %pv.addr = alloca i32*, align 4
  %r = alloca i32, align 4
  store i32* %pv, i32** %pv.addr, align 4
  %0 = load i32*, i32** %pv.addr, align 4
  %call = call i32 @pipe(i32* %0)
  store i32 %call, i32* %r, align 4
  %cmp = icmp slt i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %r, align 4
  store i32 %1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %pv.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %2, i32 0
  %3 = load i32, i32* %arrayidx, align 4
  %call1 = call i32 @move_to_high_fd(i32 %3, i32 1, i32 64)
  %4 = load i32*, i32** %pv.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i32 0
  store i32 %call1, i32* %arrayidx2, align 4
  %5 = load i32*, i32** %pv.addr, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %5, i32 1
  %6 = load i32, i32* %arrayidx3, align 4
  %call4 = call i32 @move_to_high_fd(i32 %6, i32 1, i32 64)
  %7 = load i32*, i32** %pv.addr, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i32 1
  store i32 %call4, i32* %arrayidx5, align 4
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @pipe(i32*) #1

; Function Attrs: noinline nounwind
define i32 @sh_closepipe(i32* %pv) #0 {
entry:
  %pv.addr = alloca i32*, align 4
  store i32* %pv, i32** %pv.addr, align 4
  %0 = load i32*, i32** %pv.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %0, i32 0
  %1 = load i32, i32* %arrayidx, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %pv.addr, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %2, i32 0
  %3 = load i32, i32* %arrayidx1, align 4
  %call = call i32 @close(i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32*, i32** %pv.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %4, i32 1
  %5 = load i32, i32* %arrayidx2, align 4
  %cmp3 = icmp sge i32 %5, 0
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %6 = load i32*, i32** %pv.addr, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i32 1
  %7 = load i32, i32* %arrayidx5, align 4
  %call6 = call i32 @close(i32 %7)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %8 = load i32*, i32** %pv.addr, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i32 1
  store i32 -1, i32* %arrayidx8, align 4
  %9 = load i32*, i32** %pv.addr, align 4
  %arrayidx9 = getelementptr inbounds i32, i32* %9, i32 0
  store i32 -1, i32* %arrayidx9, align 4
  ret i32 0
}

; Function Attrs: noinline nounwind
define i32 @file_exists(i8* %fn) #0 {
entry:
  %fn.addr = alloca i8*, align 4
  %sb = alloca %struct.stat, align 8
  store i8* %fn, i8** %fn.addr, align 4
  %0 = load i8*, i8** %fn.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %sb)
  %cmp = icmp eq i32 %call, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noinline nounwind
define i32 @file_isdir(i8* %fn) #0 {
entry:
  %fn.addr = alloca i8*, align 4
  %sb = alloca %struct.stat, align 8
  store i8* %fn, i8** %fn.addr, align 4
  %0 = load i8*, i8** %fn.addr, align 4
  %call = call i32 @stat(i8* %0, %struct.stat* %sb)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %st_mode = getelementptr inbounds %struct.stat, %struct.stat* %sb, i32 0, i32 6
  %1 = load i32, i32* %st_mode, align 8
  %and = and i32 %1, 61440
  %cmp1 = icmp eq i32 %and, 16384
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

; Function Attrs: noinline nounwind
define i32 @file_iswdir(i8* %fn) #0 {
entry:
  %fn.addr = alloca i8*, align 4
  store i8* %fn, i8** %fn.addr, align 4
  %0 = load i8*, i8** %fn.addr, align 4
  %call = call i32 @file_isdir(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i8*, i8** %fn.addr, align 4
  %call1 = call i32 @sh_eaccess(i8* %1, i32 2)
  %cmp = icmp eq i32 %call1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

declare i32 @sh_eaccess(i8*, i32) #1

; Function Attrs: noinline nounwind
define i32 @path_dot_or_dotdot(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i8*, i8** %string.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv4 = sext i8 %4 to i32
  %cmp5 = icmp ne i32 %conv4, 46
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false3
  %5 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 1
  %6 = load i8, i8* %arrayidx, align 1
  %conv7 = sext i8 %6 to i32
  %cmp8 = icmp eq i32 %conv7, 47
  br i1 %cmp8, label %if.then29, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %if.end
  %7 = load i8*, i8** %string.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %8 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then29, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false10
  %9 = load i8*, i8** %string.addr, align 4
  %arrayidx16 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx16, align 1
  %conv17 = sext i8 %10 to i32
  %cmp18 = icmp eq i32 %conv17, 46
  br i1 %cmp18, label %land.lhs.true, label %if.end30

land.lhs.true:                                    ; preds = %lor.lhs.false15
  %11 = load i8*, i8** %string.addr, align 4
  %arrayidx20 = getelementptr inbounds i8, i8* %11, i32 2
  %12 = load i8, i8* %arrayidx20, align 1
  %conv21 = sext i8 %12 to i32
  %cmp22 = icmp eq i32 %conv21, 47
  br i1 %cmp22, label %if.then29, label %lor.lhs.false24

lor.lhs.false24:                                  ; preds = %land.lhs.true
  %13 = load i8*, i8** %string.addr, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %13, i32 2
  %14 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %14 to i32
  %cmp27 = icmp eq i32 %conv26, 0
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %lor.lhs.false24, %land.lhs.true, %lor.lhs.false10, %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end30:                                         ; preds = %lor.lhs.false24, %lor.lhs.false15
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end30, %if.then29, %if.then
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

; Function Attrs: noinline nounwind
define i32 @absolute_pathname(i8* %string) #0 {
entry:
  %retval = alloca i32, align 4
  %string.addr = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 0
  %4 = load i8, i8* %arrayidx, align 1
  %conv3 = sext i8 %4 to i32
  %cmp4 = icmp eq i32 %conv3, 47
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end
  %5 = load i8*, i8** %string.addr, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %6 to i32
  %cmp10 = icmp eq i32 %conv9, 46
  br i1 %cmp10, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.end7
  %7 = load i8*, i8** %string.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %7, i32 1
  %8 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %8 to i32
  %cmp14 = icmp eq i32 %conv13, 47
  br i1 %cmp14, label %if.then21, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %land.lhs.true
  %9 = load i8*, i8** %string.addr, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %9, i32 1
  %10 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %10 to i32
  %cmp19 = icmp eq i32 %conv18, 0
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %lor.lhs.false16, %land.lhs.true
  store i32 1, i32* %retval, align 4
  br label %return

if.end22:                                         ; preds = %lor.lhs.false16, %if.end7
  %11 = load i8*, i8** %string.addr, align 4
  %arrayidx23 = getelementptr inbounds i8, i8* %11, i32 0
  %12 = load i8, i8* %arrayidx23, align 1
  %conv24 = sext i8 %12 to i32
  %cmp25 = icmp eq i32 %conv24, 46
  br i1 %cmp25, label %land.lhs.true27, label %if.end43

land.lhs.true27:                                  ; preds = %if.end22
  %13 = load i8*, i8** %string.addr, align 4
  %arrayidx28 = getelementptr inbounds i8, i8* %13, i32 1
  %14 = load i8, i8* %arrayidx28, align 1
  %conv29 = sext i8 %14 to i32
  %cmp30 = icmp eq i32 %conv29, 46
  br i1 %cmp30, label %land.lhs.true32, label %if.end43

land.lhs.true32:                                  ; preds = %land.lhs.true27
  %15 = load i8*, i8** %string.addr, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %15, i32 2
  %16 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %16 to i32
  %cmp35 = icmp eq i32 %conv34, 47
  br i1 %cmp35, label %if.then42, label %lor.lhs.false37

lor.lhs.false37:                                  ; preds = %land.lhs.true32
  %17 = load i8*, i8** %string.addr, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %17, i32 2
  %18 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %18 to i32
  %cmp40 = icmp eq i32 %conv39, 0
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %lor.lhs.false37, %land.lhs.true32
  store i32 1, i32* %retval, align 4
  br label %return

if.end43:                                         ; preds = %lor.lhs.false37, %land.lhs.true27, %if.end22
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end43, %if.then42, %if.then21, %if.then6, %if.then
  %19 = load i32, i32* %retval, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind
define i8* @make_absolute(i8* %string, i8* %dot_path) #0 {
entry:
  %string.addr = alloca i8*, align 4
  %dot_path.addr = alloca i8*, align 4
  %result = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i8* %dot_path, i8** %dot_path.addr, align 4
  %0 = load i8*, i8** %dot_path.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %1, i32 0
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp1 = icmp eq i32 %conv, 47
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %3)
  %add = add i32 1, %call
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 725)
  %4 = load i8*, i8** %string.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %4)
  store i8* %call4, i8** %result, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %5 = load i8*, i8** %dot_path.addr, align 4
  %6 = load i8*, i8** %string.addr, align 4
  %call5 = call i8* @sh_makepath(i8* %5, i8* %6, i32 0)
  store i8* %call5, i8** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %7 = load i8*, i8** %result, align 4
  ret i8* %7
}

declare i8* @strcpy(i8*, i8*) #1

declare i8* @sh_xmalloc(i32, i8*, i32) #1

declare i32 @strlen(i8*) #1

declare i8* @sh_makepath(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @base_pathname(i8* %string) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %p = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 47
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %4 = load i8*, i8** %string.addr, align 4
  store i8* %4, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %entry
  %5 = load i8*, i8** %string.addr, align 4
  %call = call i8* @strrchr(i8* %5, i32 47)
  store i8* %call, i8** %p, align 4
  %6 = load i8*, i8** %p, align 4
  %tobool = icmp ne i8* %6, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %7 = load i8*, i8** %p, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr, i8** %p, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %8 = load i8*, i8** %string.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %incdec.ptr, %cond.true ], [ %8, %cond.false ]
  store i8* %cond, i8** %retval, align 4
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %9 = load i8*, i8** %retval, align 4
  ret i8* %9
}

declare i8* @strrchr(i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @full_pathname(i8* %file) #0 {
entry:
  %retval = alloca i8*, align 4
  %file.addr = alloca i8*, align 4
  %ret = alloca i8*, align 4
  store i8* %file, i8** %file.addr, align 4
  %0 = load i8*, i8** %file.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 126
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i8*, i8** %file.addr, align 4
  %call = call i8* @bash_tilde_expand(i8* %2, i32 0)
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i8*, i8** %file.addr, align 4
  %call2 = call i32 @strlen(i8* %3)
  %add = add i32 1, %call2
  %call3 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 763)
  %4 = load i8*, i8** %file.addr, align 4
  %call4 = call i8* @strcpy(i8* %call3, i8* %4)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call, %cond.true ], [ %call4, %cond.false ]
  store i8* %cond, i8** %file.addr, align 4
  %5 = load i8*, i8** %file.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 47
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  %7 = load i8*, i8** %file.addr, align 4
  store i8* %7, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %cond.end
  %8 = load i8*, i8** %file.addr, align 4
  %call8 = call i8* @sh_makepath(i8* null, i8* %8, i32 6)
  store i8* %call8, i8** %ret, align 4
  %9 = load i8*, i8** %file.addr, align 4
  call void @sh_xfree(i8* %9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 769)
  %10 = load i8*, i8** %ret, align 4
  store i8* %10, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %11 = load i8*, i8** %retval, align 4
  ret i8* %11
}

; Function Attrs: noinline nounwind
define i8* @bash_tilde_expand(i8* %s, i32 %assign_p) #0 {
entry:
  %s.addr = alloca i8*, align 4
  %assign_p.addr = alloca i32, align 4
  %old_immed = alloca i32, align 4
  %old_term = alloca i32, align 4
  %r = alloca i32, align 4
  %ret = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %assign_p, i32* %assign_p.addr, align 4
  %0 = load i32, i32* %assign_p.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end4

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %assign_p.addr, align 4
  %cmp1 = icmp eq i32 %1, 2
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.false
  %2 = load i8**, i8*** @bash_tilde_prefixes2, align 4
  br label %cond.end

cond.false3:                                      ; preds = %cond.false
  %3 = load i8**, i8*** @bash_tilde_prefixes, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false3, %cond.true2
  %cond = phi i8** [ %2, %cond.true2 ], [ %3, %cond.false3 ]
  br label %cond.end4

cond.end4:                                        ; preds = %cond.end, %cond.true
  %cond5 = phi i8** [ null, %cond.true ], [ %cond, %cond.end ]
  store i8** %cond5, i8*** @tilde_additional_prefixes, align 4
  %4 = load i32, i32* %assign_p.addr, align 4
  %cmp6 = icmp eq i32 %4, 2
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end4
  %5 = load i8**, i8*** @bash_tilde_suffixes2, align 4
  store i8** %5, i8*** @tilde_additional_suffixes, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end4
  %6 = load i8*, i8** %s.addr, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv, 126
  br i1 %cmp7, label %cond.true9, label %cond.false10

cond.true9:                                       ; preds = %if.end
  %8 = load i8*, i8** %s.addr, align 4
  %call = call i32 @unquoted_tilde_word(i8* %8)
  br label %cond.end11

cond.false10:                                     ; preds = %if.end
  br label %cond.end11

cond.end11:                                       ; preds = %cond.false10, %cond.true9
  %cond12 = phi i32 [ %call, %cond.true9 ], [ 1, %cond.false10 ]
  store i32 %cond12, i32* %r, align 4
  %9 = load i32, i32* %r, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %cond.true13, label %cond.false15

cond.true13:                                      ; preds = %cond.end11
  %10 = load i8*, i8** %s.addr, align 4
  %call14 = call i8* @tilde_expand(i8* %10)
  br label %cond.end19

cond.false15:                                     ; preds = %cond.end11
  %11 = load i8*, i8** %s.addr, align 4
  %call16 = call i32 @strlen(i8* %11)
  %add = add i32 1, %call16
  %call17 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1111)
  %12 = load i8*, i8** %s.addr, align 4
  %call18 = call i8* @strcpy(i8* %call17, i8* %12)
  br label %cond.end19

cond.end19:                                       ; preds = %cond.false15, %cond.true13
  %cond20 = phi i8* [ %call14, %cond.true13 ], [ %call18, %cond.false15 ]
  store i8* %cond20, i8** %ret, align 4
  br label %do.body

do.body:                                          ; preds = %cond.end19
  %13 = load volatile i32, i32* @terminating_signal, align 4
  %tobool21 = icmp ne i32 %13, 0
  br i1 %tobool21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %do.body
  %14 = load volatile i32, i32* @terminating_signal, align 4
  call void @termsig_handler(i32 %14)
  br label %if.end23

if.end23:                                         ; preds = %if.then22, %do.body
  %15 = load volatile i32, i32* @interrupt_state, align 4
  %tobool24 = icmp ne i32 %15, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end23
  call void @throw_to_top_level()
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.end23
  br label %do.end

do.end:                                           ; preds = %if.end26
  %16 = load i8*, i8** %ret, align 4
  ret i8* %16
}

; Function Attrs: noinline nounwind
define i8* @polite_directory_format(i8* %name) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %home = alloca i8*, align 4
  %l = alloca i32, align 4
  store i8* %name, i8** %name.addr, align 4
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0))
  store i8* %call, i8** %home, align 4
  %0 = load i8*, i8** %home, align 4
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*, i8** %home, align 4
  %call1 = call i32 @strlen(i8* %1)
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %l, align 4
  %2 = load i32, i32* %l, align 4
  %cmp = icmp sgt i32 %2, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end
  %3 = load i8*, i8** %home, align 4
  %4 = load i8*, i8** %name.addr, align 4
  %5 = load i32, i32* %l, align 4
  %call2 = call i32 @strncmp(i8* %3, i8* %4, i32 %5)
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %land.lhs.true4, label %if.else

land.lhs.true4:                                   ; preds = %land.lhs.true
  %6 = load i8*, i8** %name.addr, align 4
  %7 = load i32, i32* %l, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 %7
  %8 = load i8, i8* %arrayidx, align 1
  %tobool5 = icmp ne i8 %8, 0
  br i1 %tobool5, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true4
  %9 = load i8*, i8** %name.addr, align 4
  %10 = load i32, i32* %l, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx6, align 1
  %conv = sext i8 %11 to i32
  %cmp7 = icmp eq i32 %conv, 47
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %land.lhs.true4
  %12 = load i8*, i8** %name.addr, align 4
  %13 = load i32, i32* %l, align 4
  %add.ptr = getelementptr inbounds i8, i8* %12, i32 %13
  %call9 = call i8* @strncpy(i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tdir, i32 0, i32 1), i8* %add.ptr, i32 4094)
  store i8 126, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tdir, i32 0, i32 0), align 1
  store i8 0, i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tdir, i32 0, i32 4095), align 1
  store i8* getelementptr inbounds ([4096 x i8], [4096 x i8]* @tdir, i32 0, i32 0), i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false, %land.lhs.true, %cond.end
  %14 = load i8*, i8** %name.addr, align 4
  store i8* %14, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %15 = load i8*, i8** %retval, align 4
  ret i8* %15
}

declare i8* @get_string_value(i8*) #1

declare i32 @strncmp(i8*, i8*, i32) #1

declare i8* @strncpy(i8*, i8*, i32) #1

; Function Attrs: noinline nounwind
define i8* @trim_pathname(i8* %name, i32 %maxlen) #0 {
entry:
  %retval = alloca i8*, align 4
  %name.addr = alloca i8*, align 4
  %maxlen.addr = alloca i32, align 4
  %nlen = alloca i32, align 4
  %ndirs = alloca i32, align 4
  %nskip = alloca i64, align 8
  %nbeg = alloca i8*, align 4
  %nend = alloca i8*, align 4
  %ntail = alloca i8*, align 4
  %v = alloca i8*, align 4
  store i8* %name, i8** %name.addr, align 4
  store i32 %maxlen, i32* %maxlen.addr, align 4
  %0 = load i8*, i8** %name.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %name.addr, align 4
  %call = call i32 @strlen(i8* %1)
  store i32 %call, i32* %nlen, align 4
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load i8*, i8** %name.addr, align 4
  store i8* %2, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %3 = load i8*, i8** %name.addr, align 4
  %4 = load i32, i32* %nlen, align 4
  %add.ptr = getelementptr inbounds i8, i8* %3, i32 %4
  store i8* %add.ptr, i8** %nend, align 4
  %call2 = call i8* @get_string_value(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.8, i32 0, i32 0))
  store i8* %call2, i8** %v, align 4
  %5 = load i8*, i8** %v, align 4
  %cmp3 = icmp eq i8* %5, null
  br i1 %cmp3, label %if.then7, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %if.end
  %6 = load i8*, i8** %v, align 4
  %7 = load i8, i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp5 = icmp eq i32 %conv, 0
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %lor.lhs.false4, %if.end
  %8 = load i8*, i8** %name.addr, align 4
  store i8* %8, i8** %retval, align 4
  br label %return

if.end8:                                          ; preds = %lor.lhs.false4
  %9 = load i8*, i8** %v, align 4
  %call9 = call i32 @legal_number(i8* %9, i64* %nskip)
  %cmp10 = icmp eq i32 %call9, 0
  br i1 %cmp10, label %if.then15, label %lor.lhs.false12

lor.lhs.false12:                                  ; preds = %if.end8
  %10 = load i64, i64* %nskip, align 8
  %cmp13 = icmp sle i64 %10, 0
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %lor.lhs.false12, %if.end8
  %11 = load i8*, i8** %name.addr, align 4
  store i8* %11, i8** %retval, align 4
  br label %return

if.end16:                                         ; preds = %lor.lhs.false12
  %12 = load i8*, i8** %name.addr, align 4
  store i8* %12, i8** %nbeg, align 4
  %13 = load i8*, i8** %name.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %13, i32 0
  %14 = load i8, i8* %arrayidx, align 1
  %conv17 = sext i8 %14 to i32
  %cmp18 = icmp eq i32 %conv17, 126
  br i1 %cmp18, label %if.then20, label %if.end27

if.then20:                                        ; preds = %if.end16
  %15 = load i8*, i8** %name.addr, align 4
  store i8* %15, i8** %nbeg, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then20
  %16 = load i8*, i8** %nbeg, align 4
  %17 = load i8, i8* %16, align 1
  %tobool = icmp ne i8 %17, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load i8*, i8** %nbeg, align 4
  %19 = load i8, i8* %18, align 1
  %conv21 = sext i8 %19 to i32
  %cmp22 = icmp eq i32 %conv21, 47
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %for.body
  %20 = load i8*, i8** %nbeg, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr, i8** %nbeg, align 4
  br label %for.end

if.end25:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end25
  %21 = load i8*, i8** %nbeg, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr26, i8** %nbeg, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then24, %for.cond
  br label %if.end27

if.end27:                                         ; preds = %for.end, %if.end16
  %22 = load i8*, i8** %nbeg, align 4
  %23 = load i8, i8* %22, align 1
  %conv28 = sext i8 %23 to i32
  %cmp29 = icmp eq i32 %conv28, 0
  br i1 %cmp29, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end27
  %24 = load i8*, i8** %name.addr, align 4
  store i8* %24, i8** %retval, align 4
  br label %return

if.end32:                                         ; preds = %if.end27
  store i32 0, i32* %ndirs, align 4
  %25 = load i8*, i8** %nbeg, align 4
  store i8* %25, i8** %ntail, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.inc41, %if.end32
  %26 = load i8*, i8** %ntail, align 4
  %27 = load i8, i8* %26, align 1
  %tobool34 = icmp ne i8 %27, 0
  br i1 %tobool34, label %for.body35, label %for.end43

for.body35:                                       ; preds = %for.cond33
  %28 = load i8*, i8** %ntail, align 4
  %29 = load i8, i8* %28, align 1
  %conv36 = sext i8 %29 to i32
  %cmp37 = icmp eq i32 %conv36, 47
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %for.body35
  %30 = load i32, i32* %ndirs, align 4
  %inc = add nsw i32 %30, 1
  store i32 %inc, i32* %ndirs, align 4
  br label %if.end40

if.end40:                                         ; preds = %if.then39, %for.body35
  br label %for.inc41

for.inc41:                                        ; preds = %if.end40
  %31 = load i8*, i8** %ntail, align 4
  %incdec.ptr42 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %incdec.ptr42, i8** %ntail, align 4
  br label %for.cond33

for.end43:                                        ; preds = %for.cond33
  %32 = load i32, i32* %ndirs, align 4
  %conv44 = sext i32 %32 to i64
  %33 = load i64, i64* %nskip, align 8
  %cmp45 = icmp slt i64 %conv44, %33
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %for.end43
  %34 = load i8*, i8** %name.addr, align 4
  store i8* %34, i8** %retval, align 4
  br label %return

if.end48:                                         ; preds = %for.end43
  %35 = load i8*, i8** %nend, align 4
  %36 = load i8, i8* %35, align 1
  %conv49 = sext i8 %36 to i32
  %cmp50 = icmp eq i32 %conv49, 47
  br i1 %cmp50, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end48
  %37 = load i8*, i8** %nend, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end48
  %38 = load i8*, i8** %nend, align 4
  %add.ptr52 = getelementptr inbounds i8, i8* %38, i32 -1
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %37, %cond.true ], [ %add.ptr52, %cond.false ]
  store i8* %cond, i8** %ntail, align 4
  br label %for.cond53

for.cond53:                                       ; preds = %for.inc66, %cond.end
  %39 = load i8*, i8** %ntail, align 4
  %40 = load i8*, i8** %nbeg, align 4
  %cmp54 = icmp ugt i8* %39, %40
  br i1 %cmp54, label %for.body56, label %for.end68

for.body56:                                       ; preds = %for.cond53
  %41 = load i8*, i8** %ntail, align 4
  %42 = load i8, i8* %41, align 1
  %conv57 = sext i8 %42 to i32
  %cmp58 = icmp eq i32 %conv57, 47
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %for.body56
  %43 = load i64, i64* %nskip, align 8
  %dec = add nsw i64 %43, -1
  store i64 %dec, i64* %nskip, align 8
  br label %if.end61

if.end61:                                         ; preds = %if.then60, %for.body56
  %44 = load i64, i64* %nskip, align 8
  %cmp62 = icmp eq i64 %44, 0
  br i1 %cmp62, label %if.then64, label %if.end65

if.then64:                                        ; preds = %if.end61
  br label %for.end68

if.end65:                                         ; preds = %if.end61
  br label %for.inc66

for.inc66:                                        ; preds = %if.end65
  %45 = load i8*, i8** %ntail, align 4
  %incdec.ptr67 = getelementptr inbounds i8, i8* %45, i32 -1
  store i8* %incdec.ptr67, i8** %ntail, align 4
  br label %for.cond53

for.end68:                                        ; preds = %if.then64, %for.cond53
  %46 = load i8*, i8** %ntail, align 4
  %47 = load i8*, i8** %nbeg, align 4
  %cmp69 = icmp eq i8* %46, %47
  br i1 %cmp69, label %if.then71, label %if.end72

if.then71:                                        ; preds = %for.end68
  %48 = load i8*, i8** %name.addr, align 4
  store i8* %48, i8** %retval, align 4
  br label %return

if.end72:                                         ; preds = %for.end68
  %49 = load i8*, i8** %ntail, align 4
  %50 = load i8*, i8** %nbeg, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %49 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %50 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %nlen, align 4
  %51 = load i32, i32* %nlen, align 4
  %cmp73 = icmp sle i32 %51, 3
  br i1 %cmp73, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  %52 = load i8*, i8** %name.addr, align 4
  store i8* %52, i8** %retval, align 4
  br label %return

if.end76:                                         ; preds = %if.end72
  %53 = load i8*, i8** %nbeg, align 4
  %incdec.ptr77 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr77, i8** %nbeg, align 4
  store i8 46, i8* %53, align 1
  %54 = load i8*, i8** %nbeg, align 4
  %incdec.ptr78 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %incdec.ptr78, i8** %nbeg, align 4
  store i8 46, i8* %54, align 1
  %55 = load i8*, i8** %nbeg, align 4
  %incdec.ptr79 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %incdec.ptr79, i8** %nbeg, align 4
  store i8 46, i8* %55, align 1
  %56 = load i8*, i8** %nend, align 4
  %57 = load i8*, i8** %ntail, align 4
  %sub.ptr.lhs.cast80 = ptrtoint i8* %56 to i32
  %sub.ptr.rhs.cast81 = ptrtoint i8* %57 to i32
  %sub.ptr.sub82 = sub i32 %sub.ptr.lhs.cast80, %sub.ptr.rhs.cast81
  store i32 %sub.ptr.sub82, i32* %nlen, align 4
  %58 = load i8*, i8** %nbeg, align 4
  %59 = load i8*, i8** %ntail, align 4
  %60 = load i32, i32* %nlen, align 4
  call void @llvm.memmove.p0i8.p0i8.i32(i8* %58, i8* %59, i32 %60, i32 1, i1 false)
  %61 = load i8*, i8** %nbeg, align 4
  %62 = load i32, i32* %nlen, align 4
  %arrayidx83 = getelementptr inbounds i8, i8* %61, i32 %62
  store i8 0, i8* %arrayidx83, align 1
  %63 = load i8*, i8** %name.addr, align 4
  store i8* %63, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end76, %if.then75, %if.then71, %if.then47, %if.then31, %if.then15, %if.then7, %if.then
  %64 = load i8*, i8** %retval, align 4
  ret i8* %64
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #3

; Function Attrs: noinline nounwind
define i8* @printable_filename(i8* %fn, i32 %flags) #0 {
entry:
  %fn.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %newf = alloca i8*, align 4
  store i8* %fn, i8** %fn.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i8*, i8** %fn.addr, align 4
  %call = call i32 @ansic_shouldquote(i8* %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %fn.addr, align 4
  %call1 = call i8* @ansic_quote(i8* %1, i32 0, i32* null)
  store i8* %call1, i8** %newf, align 4
  br label %if.end8

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %flags.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %land.lhs.true, label %if.else7

land.lhs.true:                                    ; preds = %if.else
  %3 = load i8*, i8** %fn.addr, align 4
  %call3 = call i32 @sh_contains_shell_metas(i8* %3)
  %tobool4 = icmp ne i32 %call3, 0
  br i1 %tobool4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %land.lhs.true
  %4 = load i8*, i8** %fn.addr, align 4
  %call6 = call i8* @sh_single_quote(i8* %4)
  store i8* %call6, i8** %newf, align 4
  br label %if.end

if.else7:                                         ; preds = %land.lhs.true, %if.else
  %5 = load i8*, i8** %fn.addr, align 4
  store i8* %5, i8** %newf, align 4
  br label %if.end

if.end:                                           ; preds = %if.else7, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  %6 = load i8*, i8** %newf, align 4
  ret i8* %6
}

declare i32 @ansic_shouldquote(i8*) #1

declare i8* @ansic_quote(i8*, i32, i32*) #1

declare i32 @sh_contains_shell_metas(i8*) #1

declare i8* @sh_single_quote(i8*) #1

; Function Attrs: noinline nounwind
define i8* @extract_colon_unit(i8* %string, i32* %p_index) #0 {
entry:
  %retval = alloca i8*, align 4
  %string.addr = alloca i8*, align 4
  %p_index.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %start = alloca i32, align 4
  %len = alloca i32, align 4
  %value = alloca i8*, align 4
  store i8* %string, i8** %string.addr, align 4
  store i32* %p_index, i32** %p_index.addr, align 4
  %0 = load i8*, i8** %string.addr, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %string.addr, align 4
  store i8* %1, i8** %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %string.addr, align 4
  %call = call i32 @strlen(i8* %2)
  store i32 %call, i32* %len, align 4
  %3 = load i32*, i32** %p_index.addr, align 4
  %4 = load i32, i32* %3, align 4
  %5 = load i32, i32* %len, align 4
  %cmp1 = icmp sge i32 %4, %5
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 4
  br label %return

if.end3:                                          ; preds = %if.end
  %6 = load i32*, i32** %p_index.addr, align 4
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %land.lhs.true, label %if.end7

land.lhs.true:                                    ; preds = %if.end3
  %9 = load i8*, i8** %string.addr, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i8, i8* %9, i32 %10
  %11 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %11 to i32
  %cmp4 = icmp eq i32 %conv, 58
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %land.lhs.true
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then6, %land.lhs.true, %if.end3
  %13 = load i32, i32* %i, align 4
  store i32 %13, i32* %start, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %14 = load i8*, i8** %string.addr, align 4
  %15 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds i8, i8* %14, i32 %15
  %16 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %16 to i32
  %tobool10 = icmp ne i32 %conv9, 0
  br i1 %tobool10, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %17 = load i8*, i8** %string.addr, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %17, i32 %18
  %19 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %19 to i32
  %cmp13 = icmp ne i32 %conv12, 58
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %20 = phi i1 [ false, %for.cond ], [ %cmp13, %land.rhs ]
  br i1 %20, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %21, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %22 = load i32, i32* %i, align 4
  %23 = load i32*, i32** %p_index.addr, align 4
  store i32 %22, i32* %23, align 4
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %start, align 4
  %cmp16 = icmp eq i32 %24, %25
  br i1 %cmp16, label %if.then18, label %if.else

if.then18:                                        ; preds = %for.end
  %26 = load i8*, i8** %string.addr, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx19 = getelementptr inbounds i8, i8* %26, i32 %27
  %28 = load i8, i8* %arrayidx19, align 1
  %tobool20 = icmp ne i8 %28, 0
  br i1 %tobool20, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.then18
  %29 = load i32*, i32** %p_index.addr, align 4
  %30 = load i32, i32* %29, align 4
  %inc22 = add nsw i32 %30, 1
  store i32 %inc22, i32* %29, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.then18
  %call24 = call i8* @sh_xmalloc(i32 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 925)
  store i8* %call24, i8** %value, align 4
  %31 = load i8*, i8** %value, align 4
  %arrayidx25 = getelementptr inbounds i8, i8* %31, i32 0
  store i8 0, i8* %arrayidx25, align 1
  br label %if.end27

if.else:                                          ; preds = %for.end
  %32 = load i8*, i8** %string.addr, align 4
  %33 = load i32, i32* %start, align 4
  %34 = load i32, i32* %i, align 4
  %call26 = call i8* @substring(i8* %32, i32 %33, i32 %34)
  store i8* %call26, i8** %value, align 4
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.end23
  %35 = load i8*, i8** %value, align 4
  store i8* %35, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end27, %if.then2, %if.then
  %36 = load i8*, i8** %retval, align 4
  ret i8* %36
}

declare i8* @substring(i8*, i32, i32) #1

; Function Attrs: noinline nounwind
define void @tilde_initialize() #0 {
entry:
  store i8* (i8*)* @bash_special_tilde_expansions, i8* (i8*)** @tilde_expansion_preexpansion_hook, align 4
  %0 = load i32, i32* @tilde_initialize.times_called, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @tilde_initialize.times_called, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i8** @strvec_create(i32 3)
  store i8** %call, i8*** @bash_tilde_prefixes, align 4
  %1 = load i8**, i8*** @bash_tilde_prefixes, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %1, i32 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8** %arrayidx, align 4
  %2 = load i8**, i8*** @bash_tilde_prefixes, align 4
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i32 1
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8** %arrayidx1, align 4
  %3 = load i8**, i8*** @bash_tilde_prefixes, align 4
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i32 2
  store i8* null, i8** %arrayidx2, align 4
  %call3 = call i8** @strvec_create(i32 2)
  store i8** %call3, i8*** @bash_tilde_prefixes2, align 4
  %4 = load i8**, i8*** @bash_tilde_prefixes2, align 4
  %arrayidx4 = getelementptr inbounds i8*, i8** %4, i32 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8** %arrayidx4, align 4
  %5 = load i8**, i8*** @bash_tilde_prefixes2, align 4
  %arrayidx5 = getelementptr inbounds i8*, i8** %5, i32 1
  store i8* null, i8** %arrayidx5, align 4
  %6 = load i8**, i8*** @bash_tilde_prefixes, align 4
  store i8** %6, i8*** @tilde_additional_prefixes, align 4
  %call6 = call i8** @strvec_create(i32 3)
  store i8** %call6, i8*** @bash_tilde_suffixes, align 4
  %7 = load i8**, i8*** @bash_tilde_suffixes, align 4
  %arrayidx7 = getelementptr inbounds i8*, i8** %7, i32 0
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8** %arrayidx7, align 4
  %8 = load i8**, i8*** @bash_tilde_suffixes, align 4
  %arrayidx8 = getelementptr inbounds i8*, i8** %8, i32 1
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8** %arrayidx8, align 4
  %9 = load i8**, i8*** @bash_tilde_suffixes, align 4
  %arrayidx9 = getelementptr inbounds i8*, i8** %9, i32 2
  store i8* null, i8** %arrayidx9, align 4
  %10 = load i8**, i8*** @bash_tilde_suffixes, align 4
  store i8** %10, i8*** @tilde_additional_suffixes, align 4
  %call10 = call i8** @strvec_create(i32 2)
  store i8** %call10, i8*** @bash_tilde_suffixes2, align 4
  %11 = load i8**, i8*** @bash_tilde_suffixes2, align 4
  %arrayidx11 = getelementptr inbounds i8*, i8** %11, i32 0
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8** %arrayidx11, align 4
  %12 = load i8**, i8*** @bash_tilde_suffixes2, align 4
  %arrayidx12 = getelementptr inbounds i8*, i8** %12, i32 1
  store i8* null, i8** %arrayidx12, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: noinline nounwind
define internal i8* @bash_special_tilde_expansions(i8* %text) #0 {
entry:
  %text.addr = alloca i8*, align 4
  %result = alloca i8*, align 4
  store i8* %text, i8** %text.addr, align 4
  store i8* null, i8** %result, align 4
  %0 = load i8*, i8** %text.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %0, i32 0
  %1 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 43
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %text.addr, align 4
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i32 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = sext i8 %3 to i32
  %cmp4 = icmp eq i32 %conv3, 0
  br i1 %cmp4, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  %call = call i8* @get_string_value(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0))
  store i8* %call, i8** %result, align 4
  br label %if.end45

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i8*, i8** %text.addr, align 4
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i32 0
  %5 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %5 to i32
  %cmp8 = icmp eq i32 %conv7, 45
  br i1 %cmp8, label %land.lhs.true10, label %if.else17

land.lhs.true10:                                  ; preds = %if.else
  %6 = load i8*, i8** %text.addr, align 4
  %arrayidx11 = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx11, align 1
  %conv12 = sext i8 %7 to i32
  %cmp13 = icmp eq i32 %conv12, 0
  br i1 %cmp13, label %if.then15, label %if.else17

if.then15:                                        ; preds = %land.lhs.true10
  %call16 = call i8* @get_string_value(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0))
  store i8* %call16, i8** %result, align 4
  br label %if.end44

if.else17:                                        ; preds = %land.lhs.true10, %if.else
  %8 = load i8*, i8** %text.addr, align 4
  %9 = load i8, i8* %8, align 1
  %conv18 = sext i8 %9 to i32
  %cmp19 = icmp sge i32 %conv18, 48
  br i1 %cmp19, label %land.lhs.true21, label %lor.lhs.false

land.lhs.true21:                                  ; preds = %if.else17
  %10 = load i8*, i8** %text.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv22 = sext i8 %11 to i32
  %cmp23 = icmp sle i32 %conv22, 57
  br i1 %cmp23, label %if.then42, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true21, %if.else17
  %12 = load i8*, i8** %text.addr, align 4
  %13 = load i8, i8* %12, align 1
  %conv25 = sext i8 %13 to i32
  %cmp26 = icmp eq i32 %conv25, 43
  br i1 %cmp26, label %land.lhs.true32, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %lor.lhs.false
  %14 = load i8*, i8** %text.addr, align 4
  %15 = load i8, i8* %14, align 1
  %conv29 = sext i8 %15 to i32
  %cmp30 = icmp eq i32 %conv29, 45
  br i1 %cmp30, label %land.lhs.true32, label %if.end

land.lhs.true32:                                  ; preds = %lor.lhs.false28, %lor.lhs.false
  %16 = load i8*, i8** %text.addr, align 4
  %arrayidx33 = getelementptr inbounds i8, i8* %16, i32 1
  %17 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %17 to i32
  %cmp35 = icmp sge i32 %conv34, 48
  br i1 %cmp35, label %land.lhs.true37, label %if.end

land.lhs.true37:                                  ; preds = %land.lhs.true32
  %18 = load i8*, i8** %text.addr, align 4
  %arrayidx38 = getelementptr inbounds i8, i8* %18, i32 1
  %19 = load i8, i8* %arrayidx38, align 1
  %conv39 = sext i8 %19 to i32
  %cmp40 = icmp sle i32 %conv39, 57
  br i1 %cmp40, label %if.then42, label %if.end

if.then42:                                        ; preds = %land.lhs.true37, %land.lhs.true21
  %20 = load i8*, i8** %text.addr, align 4
  %call43 = call i8* @get_dirstack_from_string(i8* %20)
  store i8* %call43, i8** %result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then42, %land.lhs.true37, %land.lhs.true32, %lor.lhs.false28
  br label %if.end44

if.end44:                                         ; preds = %if.end, %if.then15
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.then
  %21 = load i8*, i8** %result, align 4
  %tobool = icmp ne i8* %21, null
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end45
  %22 = load i8*, i8** %result, align 4
  %call46 = call i32 @strlen(i8* %22)
  %add = add i32 1, %call46
  %call47 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 971)
  %23 = load i8*, i8** %result, align 4
  %call48 = call i8* @strcpy(i8* %call47, i8* %23)
  br label %cond.end

cond.false:                                       ; preds = %if.end45
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call48, %cond.true ], [ null, %cond.false ]
  ret i8* %cond
}

declare i8** @strvec_create(i32) #1

; Function Attrs: noinline nounwind
define i8* @bash_tilde_find_word(i8* %s, i32 %flags, i32* %lenp) #0 {
entry:
  %retval = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %flags.addr = alloca i32, align 4
  %lenp.addr = alloca i32*, align 4
  %r = alloca i8*, align 4
  %ret = alloca i8*, align 4
  %l = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %flags, i32* %flags.addr, align 4
  store i32* %lenp, i32** %lenp.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %r, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %3 = load i8*, i8** %r, align 4
  %4 = load i8, i8* %3, align 1
  %conv1 = sext i8 %4 to i32
  %cmp = icmp ne i32 %conv1, 47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %6 = load i8*, i8** %r, align 4
  %7 = load i8, i8* %6, align 1
  %conv3 = sext i8 %7 to i32
  %cmp4 = icmp eq i32 %conv3, 92
  br i1 %cmp4, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %8 = load i8*, i8** %r, align 4
  %9 = load i8, i8* %8, align 1
  %conv6 = sext i8 %9 to i32
  %cmp7 = icmp eq i32 %conv6, 39
  br i1 %cmp7, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %10 = load i8*, i8** %r, align 4
  %11 = load i8, i8* %10, align 1
  %conv10 = sext i8 %11 to i32
  %cmp11 = icmp eq i32 %conv10, 34
  br i1 %cmp11, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false, %for.body
  %12 = load i8*, i8** %s.addr, align 4
  %call = call i32 @strlen(i8* %12)
  %add = add i32 1, %call
  %call13 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1063)
  %13 = load i8*, i8** %s.addr, align 4
  %call14 = call i8* @strcpy(i8* %call13, i8* %13)
  store i8* %call14, i8** %ret, align 4
  %14 = load i32*, i32** %lenp.addr, align 4
  %tobool15 = icmp ne i32* %14, null
  br i1 %tobool15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.then
  %15 = load i32*, i32** %lenp.addr, align 4
  store i32 0, i32* %15, align 4
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.then
  %16 = load i8*, i8** %ret, align 4
  store i8* %16, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %lor.lhs.false9
  %17 = load i32, i32* %flags.addr, align 4
  %tobool17 = icmp ne i32 %17, 0
  br i1 %tobool17, label %land.lhs.true, label %if.end22

land.lhs.true:                                    ; preds = %if.else
  %18 = load i8*, i8** %r, align 4
  %19 = load i8, i8* %18, align 1
  %conv18 = sext i8 %19 to i32
  %cmp19 = icmp eq i32 %conv18, 58
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %land.lhs.true
  br label %for.end

if.end22:                                         ; preds = %land.lhs.true, %if.else
  br label %if.end23

if.end23:                                         ; preds = %if.end22
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %20 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then21, %land.end
  %21 = load i8*, i8** %r, align 4
  %22 = load i8*, i8** %s.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %21 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %22 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %l, align 4
  %23 = load i32, i32* %l, align 4
  %add24 = add nsw i32 %23, 1
  %call25 = call i8* @sh_xmalloc(i32 %add24, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1072)
  store i8* %call25, i8** %ret, align 4
  %24 = load i8*, i8** %ret, align 4
  %25 = load i8*, i8** %s.addr, align 4
  %26 = load i32, i32* %l, align 4
  %call26 = call i8* @strncpy(i8* %24, i8* %25, i32 %26)
  %27 = load i8*, i8** %ret, align 4
  %28 = load i32, i32* %l, align 4
  %arrayidx = getelementptr inbounds i8, i8* %27, i32 %28
  store i8 0, i8* %arrayidx, align 1
  %29 = load i32*, i32** %lenp.addr, align 4
  %tobool27 = icmp ne i32* %29, null
  br i1 %tobool27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %for.end
  %30 = load i32, i32* %l, align 4
  %31 = load i32*, i32** %lenp.addr, align 4
  store i32 %30, i32* %31, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then28, %for.end
  %32 = load i8*, i8** %ret, align 4
  store i8* %32, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.end29, %if.end
  %33 = load i8*, i8** %retval, align 4
  ret i8* %33
}

; Function Attrs: noinline nounwind
define internal i32 @unquoted_tilde_word(i8* %s) #0 {
entry:
  %retval = alloca i32, align 4
  %s.addr = alloca i8*, align 4
  %r = alloca i8*, align 4
  store i8* %s, i8** %s.addr, align 4
  %0 = load i8*, i8** %s.addr, align 4
  store i8* %0, i8** %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %r, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %lor.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond
  %3 = load i8*, i8** %r, align 4
  %4 = load i8, i8* %3, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 47
  br i1 %cmp3, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false
  %5 = load i8*, i8** %r, align 4
  %6 = load i8, i8* %5, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp eq i32 %conv5, 58
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false, %for.cond
  %7 = phi i1 [ true, %lor.lhs.false ], [ true, %for.cond ], [ %cmp6, %lor.rhs ]
  %lor.ext = zext i1 %7 to i32
  %cmp8 = icmp eq i32 %lor.ext, 0
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %lor.end
  %8 = load i8*, i8** %r, align 4
  %9 = load i8, i8* %8, align 1
  %conv10 = sext i8 %9 to i32
  switch i32 %conv10, label %sw.epilog [
    i32 92, label %sw.bb
    i32 39, label %sw.bb
    i32 34, label %sw.bb
  ]

sw.bb:                                            ; preds = %for.body, %for.body, %for.body
  store i32 0, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %10 = load i8*, i8** %r, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %10, i32 1
  store i8* %incdec.ptr, i8** %r, align 4
  br label %for.cond

for.end:                                          ; preds = %lor.end
  store i32 1, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %sw.bb
  %11 = load i32, i32* %retval, align 4
  ret i32 %11
}

declare i8* @tilde_expand(i8*) #1

declare void @termsig_handler(i32) #1

declare void @throw_to_top_level() #1

; Function Attrs: noinline nounwind
define i32 @group_member(i32 %gid) #0 {
entry:
  %retval = alloca i32, align 4
  %gid.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %gid, i32* %gid.addr, align 4
  %0 = load i32, i32* %gid.addr, align 4
  %1 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %gid.addr, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 3), align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i32, i32* @ngroups, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @initialize_group_array()
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %5 = load i32, i32* @ngroups, align 4
  %cmp5 = icmp sle i32 %5, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4
  br label %return

if.end7:                                          ; preds = %if.end4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* @ngroups, align 4
  %cmp8 = icmp slt i32 %6, %7
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %gid.addr, align 4
  %9 = load i32*, i32** @group_array, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %9, i32 %10
  %11 = load i32, i32* %arrayidx, align 4
  %cmp9 = icmp eq i32 %8, %11
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.body
  store i32 1, i32* %retval, align 4
  br label %return

if.end11:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end11
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.then10, %if.then6, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

; Function Attrs: noinline nounwind
define internal void @initialize_group_array() #0 {
entry:
  %i = alloca i32, align 4
  %0 = load i32, i32* @maxgroups, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @getmaxgroups()
  store i32 %call, i32* @maxgroups, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 0, i32* @ngroups, align 4
  %1 = load i32*, i32** @group_array, align 4
  %2 = bitcast i32* %1 to i8*
  %3 = load i32, i32* @maxgroups, align 4
  %mul = mul i32 %3, 4
  %call1 = call i8* @sh_xrealloc(i8* %2, i32 %mul, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1147)
  %4 = bitcast i8* %call1 to i32*
  store i32* %4, i32** @group_array, align 4
  %5 = load i32, i32* @maxgroups, align 4
  %6 = load i32*, i32** @group_array, align 4
  %call2 = call i32 @getgroups(i32 %5, i32* %6)
  store i32 %call2, i32* @ngroups, align 4
  %7 = load i32, i32* @ngroups, align 4
  %cmp3 = icmp eq i32 %7, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %9 = load i32*, i32** @group_array, align 4
  %arrayidx = getelementptr inbounds i32, i32* %9, i32 0
  store i32 %8, i32* %arrayidx, align 4
  store i32 1, i32* @ngroups, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* @ngroups, align 4
  %cmp6 = icmp slt i32 %10, %11
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %13 = load i32*, i32** @group_array, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i32 %14
  %15 = load i32, i32* %arrayidx7, align 4
  %cmp8 = icmp eq i32 %12, %15
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %for.body
  br label %for.end

if.end10:                                         ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end10
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then9, %for.cond
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* @ngroups, align 4
  %cmp11 = icmp eq i32 %17, %18
  br i1 %cmp11, label %land.lhs.true, label %if.end23

land.lhs.true:                                    ; preds = %for.end
  %19 = load i32, i32* @ngroups, align 4
  %20 = load i32, i32* @maxgroups, align 4
  %cmp12 = icmp slt i32 %19, %20
  br i1 %cmp12, label %if.then13, label %if.end23

if.then13:                                        ; preds = %land.lhs.true
  %21 = load i32, i32* @ngroups, align 4
  store i32 %21, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc19, %if.then13
  %22 = load i32, i32* %i, align 4
  %cmp15 = icmp sgt i32 %22, 0
  br i1 %cmp15, label %for.body16, label %for.end20

for.body16:                                       ; preds = %for.cond14
  %23 = load i32*, i32** @group_array, align 4
  %24 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %24, 1
  %arrayidx17 = getelementptr inbounds i32, i32* %23, i32 %sub
  %25 = load i32, i32* %arrayidx17, align 4
  %26 = load i32*, i32** @group_array, align 4
  %27 = load i32, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds i32, i32* %26, i32 %27
  store i32 %25, i32* %arrayidx18, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body16
  %28 = load i32, i32* %i, align 4
  %dec = add nsw i32 %28, -1
  store i32 %dec, i32* %i, align 4
  br label %for.cond14

for.end20:                                        ; preds = %for.cond14
  %29 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %30 = load i32*, i32** @group_array, align 4
  %arrayidx21 = getelementptr inbounds i32, i32* %30, i32 0
  store i32 %29, i32* %arrayidx21, align 4
  %31 = load i32, i32* @ngroups, align 4
  %inc22 = add nsw i32 %31, 1
  store i32 %inc22, i32* @ngroups, align 4
  br label %if.end23

if.end23:                                         ; preds = %for.end20, %land.lhs.true, %for.end
  %32 = load i32*, i32** @group_array, align 4
  %arrayidx24 = getelementptr inbounds i32, i32* %32, i32 0
  %33 = load i32, i32* %arrayidx24, align 4
  %34 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %cmp25 = icmp ne i32 %33, %34
  br i1 %cmp25, label %if.then26, label %if.end43

if.then26:                                        ; preds = %if.end23
  store i32 0, i32* %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc34, %if.then26
  %35 = load i32, i32* %i, align 4
  %36 = load i32, i32* @ngroups, align 4
  %cmp28 = icmp slt i32 %35, %36
  br i1 %cmp28, label %for.body29, label %for.end36

for.body29:                                       ; preds = %for.cond27
  %37 = load i32*, i32** @group_array, align 4
  %38 = load i32, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %37, i32 %38
  %39 = load i32, i32* %arrayidx30, align 4
  %40 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %cmp31 = icmp eq i32 %39, %40
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %for.body29
  br label %for.end36

if.end33:                                         ; preds = %for.body29
  br label %for.inc34

for.inc34:                                        ; preds = %if.end33
  %41 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %41, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond27

for.end36:                                        ; preds = %if.then32, %for.cond27
  %42 = load i32, i32* %i, align 4
  %43 = load i32, i32* @ngroups, align 4
  %cmp37 = icmp slt i32 %42, %43
  br i1 %cmp37, label %if.then38, label %if.end42

if.then38:                                        ; preds = %for.end36
  %44 = load i32*, i32** @group_array, align 4
  %arrayidx39 = getelementptr inbounds i32, i32* %44, i32 0
  %45 = load i32, i32* %arrayidx39, align 4
  %46 = load i32*, i32** @group_array, align 4
  %47 = load i32, i32* %i, align 4
  %arrayidx40 = getelementptr inbounds i32, i32* %46, i32 %47
  store i32 %45, i32* %arrayidx40, align 4
  %48 = load i32, i32* getelementptr inbounds (%struct.user_info, %struct.user_info* @current_user, i32 0, i32 2), align 4
  %49 = load i32*, i32** @group_array, align 4
  %arrayidx41 = getelementptr inbounds i32, i32* %49, i32 0
  store i32 %48, i32* %arrayidx41, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then38, %for.end36
  br label %if.end43

if.end43:                                         ; preds = %if.end42, %if.end23
  ret void
}

; Function Attrs: noinline nounwind
define i8** @get_group_list(i32* %ngp) #0 {
entry:
  %retval = alloca i8**, align 4
  %ngp.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  store i32* %ngp, i32** %ngp.addr, align 4
  %0 = load i8**, i8*** @get_group_list.group_vector, align 4
  %tobool = icmp ne i8** %0, null
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %ngp.addr, align 4
  %tobool1 = icmp ne i32* %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* @ngroups, align 4
  %3 = load i32*, i32** %ngp.addr, align 4
  store i32 %2, i32* %3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load i8**, i8*** @get_group_list.group_vector, align 4
  store i8** %4, i8*** %retval, align 4
  br label %return

if.end3:                                          ; preds = %entry
  %5 = load i32, i32* @ngroups, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  call void @initialize_group_array()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %6 = load i32, i32* @ngroups, align 4
  %cmp6 = icmp sle i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.end5
  %7 = load i32*, i32** %ngp.addr, align 4
  %tobool8 = icmp ne i32* %7, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %8 = load i32*, i32** %ngp.addr, align 4
  store i32 0, i32* %8, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  store i8** null, i8*** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end5
  %9 = load i32, i32* @ngroups, align 4
  %call = call i8** @strvec_create(i32 %9)
  store i8** %call, i8*** @get_group_list.group_vector, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end11
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* @ngroups, align 4
  %cmp12 = icmp slt i32 %10, %11
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** @group_array, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %12, i32 %13
  %14 = load i32, i32* %arrayidx, align 4
  %conv = zext i32 %14 to i64
  %call13 = call i8* @itos(i64 %conv)
  %15 = load i8**, i8*** @get_group_list.group_vector, align 4
  %16 = load i32, i32* %i, align 4
  %arrayidx14 = getelementptr inbounds i8*, i8** %15, i32 %16
  store i8* %call13, i8** %arrayidx14, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %ngp.addr, align 4
  %tobool15 = icmp ne i32* %18, null
  br i1 %tobool15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %for.end
  %19 = load i32, i32* @ngroups, align 4
  %20 = load i32*, i32** %ngp.addr, align 4
  store i32 %19, i32* %20, align 4
  br label %if.end17

if.end17:                                         ; preds = %if.then16, %for.end
  %21 = load i8**, i8*** @get_group_list.group_vector, align 4
  store i8** %21, i8*** %retval, align 4
  br label %return

return:                                           ; preds = %if.end17, %if.end10, %if.end
  %22 = load i8**, i8*** %retval, align 4
  ret i8** %22
}

declare i8* @itos(i64) #1

; Function Attrs: noinline nounwind
define i32* @get_group_array(i32* %ngp) #0 {
entry:
  %retval = alloca i32*, align 4
  %ngp.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  store i32* %ngp, i32** %ngp.addr, align 4
  %0 = load i32*, i32** @get_group_array.group_iarray, align 4
  %tobool = icmp ne i32* %0, null
  br i1 %tobool, label %if.then, label %if.end3

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %ngp.addr, align 4
  %tobool1 = icmp ne i32* %1, null
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* @ngroups, align 4
  %3 = load i32*, i32** %ngp.addr, align 4
  store i32 %2, i32* %3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  %4 = load i32*, i32** @get_group_array.group_iarray, align 4
  store i32* %4, i32** %retval, align 4
  br label %return

if.end3:                                          ; preds = %entry
  %5 = load i32, i32* @ngroups, align 4
  %cmp = icmp eq i32 %5, 0
  br i1 %cmp, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end3
  call void @initialize_group_array()
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end3
  %6 = load i32, i32* @ngroups, align 4
  %cmp6 = icmp sle i32 %6, 0
  br i1 %cmp6, label %if.then7, label %if.end11

if.then7:                                         ; preds = %if.end5
  %7 = load i32*, i32** %ngp.addr, align 4
  %tobool8 = icmp ne i32* %7, null
  br i1 %tobool8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.then7
  %8 = load i32*, i32** %ngp.addr, align 4
  store i32 0, i32* %8, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.then7
  store i32* null, i32** %retval, align 4
  br label %return

if.end11:                                         ; preds = %if.end5
  %9 = load i32, i32* @ngroups, align 4
  %mul = mul i32 %9, 4
  %call = call i8* @sh_xmalloc(i32 %mul, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1281)
  %10 = bitcast i8* %call to i32*
  store i32* %10, i32** @get_group_array.group_iarray, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end11
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* @ngroups, align 4
  %cmp12 = icmp slt i32 %11, %12
  br i1 %cmp12, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** @group_array, align 4
  %14 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds i32, i32* %13, i32 %14
  %15 = load i32, i32* %arrayidx, align 4
  %16 = load i32*, i32** @get_group_array.group_iarray, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds i32, i32* %16, i32 %17
  store i32 %15, i32* %arrayidx13, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %19 = load i32*, i32** %ngp.addr, align 4
  %tobool14 = icmp ne i32* %19, null
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %for.end
  %20 = load i32, i32* @ngroups, align 4
  %21 = load i32*, i32** %ngp.addr, align 4
  store i32 %20, i32* %21, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %for.end
  %22 = load i32*, i32** @get_group_array.group_iarray, align 4
  store i32* %22, i32** %retval, align 4
  br label %return

return:                                           ; preds = %if.end16, %if.end10, %if.end
  %23 = load i32*, i32** %retval, align 4
  ret i32* %23
}

; Function Attrs: noinline nounwind
define i8* @conf_standard_path() #0 {
entry:
  %retval = alloca i8*, align 4
  %p = alloca i8*, align 4
  %len = alloca i32, align 4
  %call = call i32 @confstr(i32 0, i8* null, i32 0)
  store i32 %call, i32* %len, align 4
  %0 = load i32, i32* %len, align 4
  %cmp = icmp ugt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %len, align 4
  %add = add i32 %1, 2
  %call1 = call i8* @sh_xmalloc(i32 %add, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1309)
  store i8* %call1, i8** %p, align 4
  %2 = load i8*, i8** %p, align 4
  store i8 0, i8* %2, align 1
  %3 = load i8*, i8** %p, align 4
  %4 = load i32, i32* %len, align 4
  %call2 = call i32 @confstr(i32 0, i8* %3, i32 %4)
  %5 = load i8*, i8** %p, align 4
  store i8* %5, i8** %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %call3 = call i8* @sh_xmalloc(i32 44, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0), i32 1315)
  %call4 = call i8* @strcpy(i8* %call3, i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.12, i32 0, i32 0))
  store i8* %call4, i8** %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %6 = load i8*, i8** %retval, align 4
  ret i8* %6
}

declare i32 @confstr(i32, i8*, i32) #1

declare i8* @get_dirstack_from_string(i8*) #1

declare i32 @getmaxgroups() #1

declare i8* @sh_xrealloc(i8*, i32, i8*, i32) #1

declare i32 @getgroups(i32, i32*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
