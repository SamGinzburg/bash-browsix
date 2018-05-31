; ModuleID = 'umask.c'
source_filename = "umask.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"Sp\00", align 1
@loptend = external global %struct.word_list*, align 4
@.str.1 = private unnamed_addr constant [13 x i8] c"octal number\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"umask%s \00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" -S\00", align 1
@.str.4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%04lo\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"agou\00", align 1
@.str.7 = private unnamed_addr constant [37 x i8] c"`%c': invalid symbolic mode operator\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"rwx\00", align 1
@.str.9 = private unnamed_addr constant [38 x i8] c"`%c': invalid symbolic mode character\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"u=%s,g=%s,o=%s\0A\00", align 1

; Function Attrs: noinline nounwind
define i32 @umask_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %print_symbolically = alloca i32, align 4
  %opt = alloca i32, align 4
  %umask_value = alloca i32, align 4
  %pflag = alloca i32, align 4
  %umask_arg = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %pflag, align 4
  store i32 0, i32* %print_symbolically, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 83, label %sw.bb
    i32 112, label %sw.bb1
    i32 -99, label %sw.bb3
  ]

sw.bb:                                            ; preds = %while.body
  %2 = load i32, i32* %print_symbolically, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %print_symbolically, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %while.body
  %3 = load i32, i32* %pflag, align 4
  %inc2 = add nsw i32 %3, 1
  store i32 %inc2, i32* %pflag, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %return

sw.epilog:                                        ; preds = %sw.bb1, %sw.bb
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %4 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %4, %struct.word_list** %list.addr, align 4
  %5 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %5, null
  br i1 %tobool, label %if.then, label %if.else32

if.then:                                          ; preds = %while.end
  %6 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %6, i32 0, i32 1
  %7 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %7, i32 0, i32 0
  %8 = load i8*, i8** %word4, align 4
  %9 = load i8, i8* %8, align 1
  %conv = sext i8 %9 to i32
  %cmp5 = icmp sge i32 %conv, 48
  br i1 %cmp5, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then
  %10 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word7 = getelementptr inbounds %struct.word_list, %struct.word_list* %10, i32 0, i32 1
  %11 = load %struct.word_desc*, %struct.word_desc** %word7, align 4
  %word8 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %11, i32 0, i32 0
  %12 = load i8*, i8** %word8, align 4
  %13 = load i8, i8* %12, align 1
  %conv9 = sext i8 %13 to i32
  %cmp10 = icmp sle i32 %conv9, 57
  br i1 %cmp10, label %if.then12, label %if.else

if.then12:                                        ; preds = %land.lhs.true
  %14 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word13 = getelementptr inbounds %struct.word_list, %struct.word_list* %14, i32 0, i32 1
  %15 = load %struct.word_desc*, %struct.word_desc** %word13, align 4
  %word14 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %15, i32 0, i32 0
  %16 = load i8*, i8** %word14, align 4
  %call15 = call i32 @read_octal(i8* %16)
  store i32 %call15, i32* %umask_value, align 4
  %17 = load i32, i32* %umask_value, align 4
  %cmp16 = icmp eq i32 %17, -1
  br i1 %cmp16, label %if.then18, label %if.end

if.then18:                                        ; preds = %if.then12
  %18 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word19 = getelementptr inbounds %struct.word_list, %struct.word_list* %18, i32 0, i32 1
  %19 = load %struct.word_desc*, %struct.word_desc** %word19, align 4
  %word20 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %19, i32 0, i32 0
  %20 = load i8*, i8** %word20, align 4
  %call21 = call i8* @libintl_gettext(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0))
  call void @sh_erange(i8* %20, i8* %call21)
  store i32 1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %if.then12
  br label %if.end27

if.else:                                          ; preds = %land.lhs.true, %if.then
  %21 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call22 = call i32 @symbolic_umask(%struct.word_list* %21)
  store i32 %call22, i32* %umask_value, align 4
  %22 = load i32, i32* %umask_value, align 4
  %cmp23 = icmp eq i32 %22, -1
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.else
  store i32 1, i32* %retval, align 4
  br label %return

if.end26:                                         ; preds = %if.else
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end
  %23 = load i32, i32* %umask_value, align 4
  store i32 %23, i32* %umask_arg, align 4
  %24 = load i32, i32* %umask_arg, align 4
  %call28 = call i32 @umask(i32 %24)
  %25 = load i32, i32* %print_symbolically, align 4
  %tobool29 = icmp ne i32 %25, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end27
  %26 = load i32, i32* %umask_arg, align 4
  call void @print_symbolic_umask(i32 %26)
  br label %if.end31

if.end31:                                         ; preds = %if.then30, %if.end27
  br label %if.end45

if.else32:                                        ; preds = %while.end
  %call33 = call i32 @umask(i32 18)
  store i32 %call33, i32* %umask_arg, align 4
  %27 = load i32, i32* %umask_arg, align 4
  %call34 = call i32 @umask(i32 %27)
  %28 = load i32, i32* %pflag, align 4
  %tobool35 = icmp ne i32 %28, 0
  br i1 %tobool35, label %if.then36, label %if.end39

if.then36:                                        ; preds = %if.else32
  %29 = load i32, i32* %print_symbolically, align 4
  %tobool37 = icmp ne i32 %29, 0
  %cond = select i1 %tobool37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.4, i32 0, i32 0)
  %call38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8* %cond)
  br label %if.end39

if.end39:                                         ; preds = %if.then36, %if.else32
  %30 = load i32, i32* %print_symbolically, align 4
  %tobool40 = icmp ne i32 %30, 0
  br i1 %tobool40, label %if.then41, label %if.else42

if.then41:                                        ; preds = %if.end39
  %31 = load i32, i32* %umask_arg, align 4
  call void @print_symbolic_umask(i32 %31)
  br label %if.end44

if.else42:                                        ; preds = %if.end39
  %32 = load i32, i32* %umask_arg, align 4
  %call43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0), i32 %32)
  br label %if.end44

if.end44:                                         ; preds = %if.else42, %if.then41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end31
  %call46 = call i32 @sh_chkwrite(i32 0)
  store i32 %call46, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end45, %if.then25, %if.then18, %sw.default, %sw.bb3
  %33 = load i32, i32* %retval, align 4
  ret i32 %33
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

declare i32 @read_octal(i8*) #1

declare void @sh_erange(i8*, i8*) #1

declare i8* @libintl_gettext(i8*) #1

; Function Attrs: noinline nounwind
define internal i32 @symbolic_umask(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %um = alloca i32, align 4
  %bits = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %call = call i32 @umask(i32 18)
  store i32 %call, i32* %um, align 4
  %0 = load i32, i32* %um, align 4
  %call1 = call i32 @umask(i32 %0)
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word2 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %2, i32 0, i32 0
  %3 = load i8*, i8** %word2, align 4
  %4 = load i32, i32* %um, align 4
  %neg = xor i32 %4, -1
  %and = and i32 %neg, 511
  %call3 = call i32 @parse_symbolic_mode(i8* %3, i32 %and)
  store i32 %call3, i32* %bits, align 4
  %5 = load i32, i32* %bits, align 4
  %cmp = icmp eq i32 %5, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %bits, align 4
  %neg4 = xor i32 %6, -1
  %and5 = and i32 %neg4, 511
  store i32 %and5, i32* %um, align 4
  %7 = load i32, i32* %um, align 4
  store i32 %7, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end, %if.then
  %8 = load i32, i32* %retval, align 4
  ret i32 %8
}

declare i32 @umask(i32) #1

; Function Attrs: noinline nounwind
define internal void @print_symbolic_umask(i32 %um) #0 {
entry:
  %um.addr = alloca i32, align 4
  %ubits = alloca [4 x i8], align 1
  %gbits = alloca [4 x i8], align 1
  %obits = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  store i32 %um, i32* %um.addr, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %um.addr, align 4
  %and = and i32 %0, 256
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ubits, i32 0, i32 %1
  store i8 114, i8* %arrayidx, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %um.addr, align 4
  %and1 = and i32 %2, 128
  %cmp2 = icmp eq i32 %and1, 0
  br i1 %cmp2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  %3 = load i32, i32* %i, align 4
  %inc4 = add nsw i32 %3, 1
  store i32 %inc4, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [4 x i8], [4 x i8]* %ubits, i32 0, i32 %3
  store i8 119, i8* %arrayidx5, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then3, %if.end
  %4 = load i32, i32* %um.addr, align 4
  %and7 = and i32 %4, 64
  %cmp8 = icmp eq i32 %and7, 0
  br i1 %cmp8, label %if.then9, label %if.end12

if.then9:                                         ; preds = %if.end6
  %5 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %5, 1
  store i32 %inc10, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [4 x i8], [4 x i8]* %ubits, i32 0, i32 %5
  store i8 120, i8* %arrayidx11, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.then9, %if.end6
  %6 = load i32, i32* %i, align 4
  %arrayidx13 = getelementptr inbounds [4 x i8], [4 x i8]* %ubits, i32 0, i32 %6
  store i8 0, i8* %arrayidx13, align 1
  store i32 0, i32* %i, align 4
  %7 = load i32, i32* %um.addr, align 4
  %and14 = and i32 %7, 32
  %cmp15 = icmp eq i32 %and14, 0
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end12
  %8 = load i32, i32* %i, align 4
  %inc17 = add nsw i32 %8, 1
  store i32 %inc17, i32* %i, align 4
  %arrayidx18 = getelementptr inbounds [4 x i8], [4 x i8]* %gbits, i32 0, i32 %8
  store i8 114, i8* %arrayidx18, align 1
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end12
  %9 = load i32, i32* %um.addr, align 4
  %and20 = and i32 %9, 16
  %cmp21 = icmp eq i32 %and20, 0
  br i1 %cmp21, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end19
  %10 = load i32, i32* %i, align 4
  %inc23 = add nsw i32 %10, 1
  store i32 %inc23, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds [4 x i8], [4 x i8]* %gbits, i32 0, i32 %10
  store i8 119, i8* %arrayidx24, align 1
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end19
  %11 = load i32, i32* %um.addr, align 4
  %and26 = and i32 %11, 8
  %cmp27 = icmp eq i32 %and26, 0
  br i1 %cmp27, label %if.then28, label %if.end31

if.then28:                                        ; preds = %if.end25
  %12 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %12, 1
  store i32 %inc29, i32* %i, align 4
  %arrayidx30 = getelementptr inbounds [4 x i8], [4 x i8]* %gbits, i32 0, i32 %12
  store i8 120, i8* %arrayidx30, align 1
  br label %if.end31

if.end31:                                         ; preds = %if.then28, %if.end25
  %13 = load i32, i32* %i, align 4
  %arrayidx32 = getelementptr inbounds [4 x i8], [4 x i8]* %gbits, i32 0, i32 %13
  store i8 0, i8* %arrayidx32, align 1
  store i32 0, i32* %i, align 4
  %14 = load i32, i32* %um.addr, align 4
  %and33 = and i32 %14, 4
  %cmp34 = icmp eq i32 %and33, 0
  br i1 %cmp34, label %if.then35, label %if.end38

if.then35:                                        ; preds = %if.end31
  %15 = load i32, i32* %i, align 4
  %inc36 = add nsw i32 %15, 1
  store i32 %inc36, i32* %i, align 4
  %arrayidx37 = getelementptr inbounds [4 x i8], [4 x i8]* %obits, i32 0, i32 %15
  store i8 114, i8* %arrayidx37, align 1
  br label %if.end38

if.end38:                                         ; preds = %if.then35, %if.end31
  %16 = load i32, i32* %um.addr, align 4
  %and39 = and i32 %16, 2
  %cmp40 = icmp eq i32 %and39, 0
  br i1 %cmp40, label %if.then41, label %if.end44

if.then41:                                        ; preds = %if.end38
  %17 = load i32, i32* %i, align 4
  %inc42 = add nsw i32 %17, 1
  store i32 %inc42, i32* %i, align 4
  %arrayidx43 = getelementptr inbounds [4 x i8], [4 x i8]* %obits, i32 0, i32 %17
  store i8 119, i8* %arrayidx43, align 1
  br label %if.end44

if.end44:                                         ; preds = %if.then41, %if.end38
  %18 = load i32, i32* %um.addr, align 4
  %and45 = and i32 %18, 1
  %cmp46 = icmp eq i32 %and45, 0
  br i1 %cmp46, label %if.then47, label %if.end50

if.then47:                                        ; preds = %if.end44
  %19 = load i32, i32* %i, align 4
  %inc48 = add nsw i32 %19, 1
  store i32 %inc48, i32* %i, align 4
  %arrayidx49 = getelementptr inbounds [4 x i8], [4 x i8]* %obits, i32 0, i32 %19
  store i8 120, i8* %arrayidx49, align 1
  br label %if.end50

if.end50:                                         ; preds = %if.then47, %if.end44
  %20 = load i32, i32* %i, align 4
  %arrayidx51 = getelementptr inbounds [4 x i8], [4 x i8]* %obits, i32 0, i32 %20
  store i8 0, i8* %arrayidx51, align 1
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %ubits, i32 0, i32 0
  %arraydecay52 = getelementptr inbounds [4 x i8], [4 x i8]* %gbits, i32 0, i32 0
  %arraydecay53 = getelementptr inbounds [4 x i8], [4 x i8]* %obits, i32 0, i32 0
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0), i8* %arraydecay, i8* %arraydecay52, i8* %arraydecay53)
  ret void
}

declare i32 @printf(i8*, ...) #1

declare i32 @sh_chkwrite(i32) #1

; Function Attrs: noinline nounwind
define i32 @parse_symbolic_mode(i8* %mode, i32 %initial_bits) #0 {
entry:
  %retval = alloca i32, align 4
  %mode.addr = alloca i8*, align 4
  %initial_bits.addr = alloca i32, align 4
  %who = alloca i32, align 4
  %op = alloca i32, align 4
  %perm = alloca i32, align 4
  %bits = alloca i32, align 4
  %c = alloca i32, align 4
  %s = alloca i8*, align 4
  store i8* %mode, i8** %mode.addr, align 4
  store i32 %initial_bits, i32* %initial_bits.addr, align 4
  %0 = load i8*, i8** %mode.addr, align 4
  store i8* %0, i8** %s, align 4
  %1 = load i32, i32* %initial_bits.addr, align 4
  store i32 %1, i32* %bits, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end68, %entry
  store i32 0, i32* %perm, align 4
  store i32 0, i32* %op, align 4
  store i32 0, i32* %who, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %sw.bb9, %sw.bb7, %sw.bb5, %sw.bb, %for.cond
  %2 = load i8*, i8** %s, align 4
  %3 = load i8, i8* %2, align 1
  %conv = sext i8 %3 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.cond
  %4 = load i8*, i8** %s, align 4
  %5 = load i8, i8* %4, align 1
  %conv1 = sext i8 %5 to i32
  %call = call i8* @mbschr(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0), i32 %conv1)
  %cmp = icmp ne i8* %call, null
  %conv2 = zext i1 %cmp to i32
  br label %cond.end

cond.false:                                       ; preds = %while.cond
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv2, %cond.true ], [ 0, %cond.false ]
  %tobool3 = icmp ne i32 %cond, 0
  br i1 %tobool3, label %while.body, label %while.end

while.body:                                       ; preds = %cond.end
  %6 = load i8*, i8** %s, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %s, align 4
  %7 = load i8, i8* %6, align 1
  %conv4 = sext i8 %7 to i32
  store i32 %conv4, i32* %c, align 4
  switch i32 %conv4, label %sw.default [
    i32 117, label %sw.bb
    i32 103, label %sw.bb5
    i32 111, label %sw.bb7
    i32 97, label %sw.bb9
  ]

sw.bb:                                            ; preds = %while.body
  %8 = load i32, i32* %who, align 4
  %or = or i32 %8, 448
  store i32 %or, i32* %who, align 4
  br label %while.cond

sw.bb5:                                           ; preds = %while.body
  %9 = load i32, i32* %who, align 4
  %or6 = or i32 %9, 56
  store i32 %or6, i32* %who, align 4
  br label %while.cond

sw.bb7:                                           ; preds = %while.body
  %10 = load i32, i32* %who, align 4
  %or8 = or i32 %10, 7
  store i32 %or8, i32* %who, align 4
  br label %while.cond

sw.bb9:                                           ; preds = %while.body
  %11 = load i32, i32* %who, align 4
  %or10 = or i32 %11, 511
  store i32 %or10, i32* %who, align 4
  br label %while.cond

sw.default:                                       ; preds = %while.body
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  br label %while.cond

while.end:                                        ; preds = %cond.end
  %12 = load i8*, i8** %s, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %incdec.ptr11, i8** %s, align 4
  %13 = load i8, i8* %12, align 1
  %conv12 = sext i8 %13 to i32
  store i32 %conv12, i32* %op, align 4
  %14 = load i32, i32* %op, align 4
  switch i32 %14, label %sw.default14 [
    i32 43, label %sw.bb13
    i32 45, label %sw.bb13
    i32 61, label %sw.bb13
  ]

sw.bb13:                                          ; preds = %while.end, %while.end, %while.end
  br label %sw.epilog16

sw.default14:                                     ; preds = %while.end
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.7, i32 0, i32 0))
  %15 = load i32, i32* %op, align 4
  call void (i8*, ...) @builtin_error(i8* %call15, i32 %15)
  store i32 -1, i32* %retval, align 4
  br label %return

sw.epilog16:                                      ; preds = %sw.bb13
  br label %while.cond17

while.cond17:                                     ; preds = %sw.epilog38, %sw.epilog16
  %16 = load i8*, i8** %s, align 4
  %17 = load i8, i8* %16, align 1
  %conv18 = sext i8 %17 to i32
  %tobool19 = icmp ne i32 %conv18, 0
  br i1 %tobool19, label %cond.true20, label %cond.false25

cond.true20:                                      ; preds = %while.cond17
  %18 = load i8*, i8** %s, align 4
  %19 = load i8, i8* %18, align 1
  %conv21 = sext i8 %19 to i32
  %call22 = call i8* @mbschr(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i32 %conv21)
  %cmp23 = icmp ne i8* %call22, null
  %conv24 = zext i1 %cmp23 to i32
  br label %cond.end26

cond.false25:                                     ; preds = %while.cond17
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false25, %cond.true20
  %cond27 = phi i32 [ %conv24, %cond.true20 ], [ 0, %cond.false25 ]
  %tobool28 = icmp ne i32 %cond27, 0
  br i1 %tobool28, label %while.body29, label %while.end39

while.body29:                                     ; preds = %cond.end26
  %20 = load i8*, i8** %s, align 4
  %incdec.ptr30 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %incdec.ptr30, i8** %s, align 4
  %21 = load i8, i8* %20, align 1
  %conv31 = sext i8 %21 to i32
  store i32 %conv31, i32* %c, align 4
  %22 = load i32, i32* %c, align 4
  switch i32 %22, label %sw.epilog38 [
    i32 114, label %sw.bb32
    i32 119, label %sw.bb34
    i32 120, label %sw.bb36
  ]

sw.bb32:                                          ; preds = %while.body29
  %23 = load i32, i32* %perm, align 4
  %or33 = or i32 %23, 292
  store i32 %or33, i32* %perm, align 4
  br label %sw.epilog38

sw.bb34:                                          ; preds = %while.body29
  %24 = load i32, i32* %perm, align 4
  %or35 = or i32 %24, 146
  store i32 %or35, i32* %perm, align 4
  br label %sw.epilog38

sw.bb36:                                          ; preds = %while.body29
  %25 = load i32, i32* %perm, align 4
  %or37 = or i32 %25, 73
  store i32 %or37, i32* %perm, align 4
  br label %sw.epilog38

sw.epilog38:                                      ; preds = %while.body29, %sw.bb36, %sw.bb34, %sw.bb32
  br label %while.cond17

while.end39:                                      ; preds = %cond.end26
  %26 = load i8*, i8** %s, align 4
  %27 = load i8, i8* %26, align 1
  %tobool40 = icmp ne i8 %27, 0
  br i1 %tobool40, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %while.end39
  %28 = load i8*, i8** %s, align 4
  %29 = load i8, i8* %28, align 1
  %conv41 = sext i8 %29 to i32
  %cmp42 = icmp eq i32 %conv41, 44
  br i1 %cmp42, label %if.then, label %if.else65

if.then:                                          ; preds = %lor.lhs.false, %while.end39
  %30 = load i32, i32* %who, align 4
  %tobool44 = icmp ne i32 %30, 0
  br i1 %tobool44, label %if.then45, label %if.end

if.then45:                                        ; preds = %if.then
  %31 = load i32, i32* %who, align 4
  %32 = load i32, i32* %perm, align 4
  %and = and i32 %32, %31
  store i32 %and, i32* %perm, align 4
  br label %if.end

if.end:                                           ; preds = %if.then45, %if.then
  %33 = load i32, i32* %op, align 4
  switch i32 %33, label %sw.epilog58 [
    i32 43, label %sw.bb46
    i32 45, label %sw.bb48
    i32 61, label %sw.bb50
  ]

sw.bb46:                                          ; preds = %if.end
  %34 = load i32, i32* %perm, align 4
  %35 = load i32, i32* %bits, align 4
  %or47 = or i32 %35, %34
  store i32 %or47, i32* %bits, align 4
  br label %sw.epilog58

sw.bb48:                                          ; preds = %if.end
  %36 = load i32, i32* %perm, align 4
  %neg = xor i32 %36, -1
  %37 = load i32, i32* %bits, align 4
  %and49 = and i32 %37, %neg
  store i32 %and49, i32* %bits, align 4
  br label %sw.epilog58

sw.bb50:                                          ; preds = %if.end
  %38 = load i32, i32* %who, align 4
  %cmp51 = icmp eq i32 %38, 0
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %sw.bb50
  store i32 511, i32* %who, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.then53, %sw.bb50
  %39 = load i32, i32* %who, align 4
  %neg55 = xor i32 %39, -1
  %40 = load i32, i32* %bits, align 4
  %and56 = and i32 %40, %neg55
  store i32 %and56, i32* %bits, align 4
  %41 = load i32, i32* %perm, align 4
  %42 = load i32, i32* %bits, align 4
  %or57 = or i32 %42, %41
  store i32 %or57, i32* %bits, align 4
  br label %sw.epilog58

sw.epilog58:                                      ; preds = %if.end, %if.end54, %sw.bb48, %sw.bb46
  %43 = load i8*, i8** %s, align 4
  %44 = load i8, i8* %43, align 1
  %conv59 = sext i8 %44 to i32
  %cmp60 = icmp eq i32 %conv59, 0
  br i1 %cmp60, label %if.then62, label %if.else

if.then62:                                        ; preds = %sw.epilog58
  br label %for.end

if.else:                                          ; preds = %sw.epilog58
  %45 = load i8*, i8** %s, align 4
  %incdec.ptr63 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr63, i8** %s, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.else
  br label %if.end68

if.else65:                                        ; preds = %lor.lhs.false
  %call66 = call i8* @libintl_gettext(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.9, i32 0, i32 0))
  %46 = load i8*, i8** %s, align 4
  %47 = load i8, i8* %46, align 1
  %conv67 = sext i8 %47 to i32
  call void (i8*, ...) @builtin_error(i8* %call66, i32 %conv67)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end68:                                         ; preds = %if.end64
  br label %for.cond

for.end:                                          ; preds = %if.then62
  %48 = load i32, i32* %bits, align 4
  store i32 %48, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end, %if.else65, %sw.default14
  %49 = load i32, i32* %retval, align 4
  ret i32 %49
}

declare i8* @mbschr(i8*, i32) #1

declare void @builtin_error(i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
