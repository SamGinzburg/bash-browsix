; ModuleID = './support/signames.c'
source_filename = "./support/signames.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@signal_names = common global [134 x i8*] zeroinitializer, align 4
@.str = private unnamed_addr constant [5 x i8] c"EXIT\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"SIGRTMIN\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"SIGRTMAX\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.3 = private unnamed_addr constant [53 x i8] c"%s: error: more than %d real time signals, fix `%s'\0A\00", align 1
@progname = external global i8*, align 4
@.str.4 = private unnamed_addr constant [12 x i8] c"SIGRTMIN+%d\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"SIGRTMAX-%d\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"SIGPWR\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"SIGPOLL\00", align 1
@.str.8 = private unnamed_addr constant [10 x i8] c"SIGSTKFLT\00", align 1
@.str.9 = private unnamed_addr constant [7 x i8] c"SIGHUP\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"SIGINT\00", align 1
@.str.11 = private unnamed_addr constant [8 x i8] c"SIGQUIT\00", align 1
@.str.12 = private unnamed_addr constant [7 x i8] c"SIGILL\00", align 1
@.str.13 = private unnamed_addr constant [8 x i8] c"SIGTRAP\00", align 1
@.str.14 = private unnamed_addr constant [7 x i8] c"SIGIOT\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"SIGABRT\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"SIGFPE\00", align 1
@.str.17 = private unnamed_addr constant [8 x i8] c"SIGKILL\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"SIGBUS\00", align 1
@.str.19 = private unnamed_addr constant [8 x i8] c"SIGSEGV\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"SIGSYS\00", align 1
@.str.21 = private unnamed_addr constant [8 x i8] c"SIGPIPE\00", align 1
@.str.22 = private unnamed_addr constant [8 x i8] c"SIGALRM\00", align 1
@.str.23 = private unnamed_addr constant [8 x i8] c"SIGTERM\00", align 1
@.str.24 = private unnamed_addr constant [7 x i8] c"SIGURG\00", align 1
@.str.25 = private unnamed_addr constant [8 x i8] c"SIGSTOP\00", align 1
@.str.26 = private unnamed_addr constant [8 x i8] c"SIGTSTP\00", align 1
@.str.27 = private unnamed_addr constant [8 x i8] c"SIGCONT\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"SIGCHLD\00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c"SIGTTIN\00", align 1
@.str.30 = private unnamed_addr constant [8 x i8] c"SIGTTOU\00", align 1
@.str.31 = private unnamed_addr constant [6 x i8] c"SIGIO\00", align 1
@.str.32 = private unnamed_addr constant [8 x i8] c"SIGXCPU\00", align 1
@.str.33 = private unnamed_addr constant [8 x i8] c"SIGXFSZ\00", align 1
@.str.34 = private unnamed_addr constant [10 x i8] c"SIGVTALRM\00", align 1
@.str.35 = private unnamed_addr constant [8 x i8] c"SIGPROF\00", align 1
@.str.36 = private unnamed_addr constant [9 x i8] c"SIGWINCH\00", align 1
@.str.37 = private unnamed_addr constant [8 x i8] c"SIGUSR1\00", align 1
@.str.38 = private unnamed_addr constant [8 x i8] c"SIGUSR2\00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c"SIGJUNK(%d)\00", align 1
@.str.40 = private unnamed_addr constant [6 x i8] c"DEBUG\00", align 1
@.str.41 = private unnamed_addr constant [4 x i8] c"ERR\00", align 1
@.str.42 = private unnamed_addr constant [7 x i8] c"RETURN\00", align 1

; Function Attrs: noinline nounwind
define void @initialize_signames() #0 {
entry:
  %i = alloca i32, align 4
  %rtmin = alloca i32, align 4
  %rtmax = alloca i32, align 4
  %rtcnt = alloca i32, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp ult i32 %0, 134
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %1
  store i8* null, i8** %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 0), align 4
  %call = call i32 @__libc_current_sigrtmin()
  store i32 %call, i32* %rtmin, align 4
  %3 = load i32, i32* %rtmin, align 4
  %arrayidx1 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %3
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i8** %arrayidx1, align 4
  %call2 = call i32 @__libc_current_sigrtmax()
  store i32 %call2, i32* %rtmax, align 4
  %4 = load i32, i32* %rtmax, align 4
  %arrayidx3 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %4
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0), i8** %arrayidx3, align 4
  %5 = load i32, i32* %rtmax, align 4
  %6 = load i32, i32* %rtmin, align 4
  %cmp4 = icmp sgt i32 %5, %6
  br i1 %cmp4, label %if.then, label %if.end56

if.then:                                          ; preds = %for.end
  %7 = load i32, i32* %rtmax, align 4
  %8 = load i32, i32* %rtmin, align 4
  %sub = sub nsw i32 %7, %8
  %sub5 = sub nsw i32 %sub, 1
  %div = sdiv i32 %sub5, 2
  store i32 %div, i32* %rtcnt, align 4
  %9 = load i32, i32* %rtcnt, align 4
  %cmp6 = icmp sge i32 %9, 128
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %if.then
  store i32 127, i32* %rtcnt, align 4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %11 = load i8*, i8** @progname, align 4
  %12 = load i8*, i8** @progname, align 4
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.3, i32 0, i32 0), i8* %11, i32 256, i8* %12)
  br label %if.end

if.end:                                           ; preds = %if.then7, %if.then
  store i32 1, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc32, %if.end
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %rtcnt, align 4
  %cmp10 = icmp sle i32 %13, %14
  br i1 %cmp10, label %for.body11, label %for.end34

for.body11:                                       ; preds = %for.cond9
  %call12 = call i8* @malloc(i32 14)
  %15 = load i32, i32* %rtmin, align 4
  %16 = load i32, i32* %i, align 4
  %add = add nsw i32 %15, %16
  %arrayidx13 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add
  store i8* %call12, i8** %arrayidx13, align 4
  %17 = load i32, i32* %rtmin, align 4
  %18 = load i32, i32* %i, align 4
  %add14 = add nsw i32 %17, %18
  %arrayidx15 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add14
  %19 = load i8*, i8** %arrayidx15, align 4
  %tobool = icmp ne i8* %19, null
  br i1 %tobool, label %if.then16, label %if.end20

if.then16:                                        ; preds = %for.body11
  %20 = load i32, i32* %rtmin, align 4
  %21 = load i32, i32* %i, align 4
  %add17 = add nsw i32 %20, %21
  %arrayidx18 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add17
  %22 = load i8*, i8** %arrayidx18, align 4
  %23 = load i32, i32* %i, align 4
  %call19 = call i32 (i8*, i8*, ...) @sprintf(i8* %22, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0), i32 %23)
  br label %if.end20

if.end20:                                         ; preds = %if.then16, %for.body11
  %call21 = call i8* @malloc(i32 14)
  %24 = load i32, i32* %rtmax, align 4
  %25 = load i32, i32* %i, align 4
  %sub22 = sub nsw i32 %24, %25
  %arrayidx23 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %sub22
  store i8* %call21, i8** %arrayidx23, align 4
  %26 = load i32, i32* %rtmax, align 4
  %27 = load i32, i32* %i, align 4
  %sub24 = sub nsw i32 %26, %27
  %arrayidx25 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %sub24
  %28 = load i8*, i8** %arrayidx25, align 4
  %tobool26 = icmp ne i8* %28, null
  br i1 %tobool26, label %if.then27, label %if.end31

if.then27:                                        ; preds = %if.end20
  %29 = load i32, i32* %rtmax, align 4
  %30 = load i32, i32* %i, align 4
  %sub28 = sub nsw i32 %29, %30
  %arrayidx29 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %sub28
  %31 = load i8*, i8** %arrayidx29, align 4
  %32 = load i32, i32* %i, align 4
  %call30 = call i32 (i8*, i8*, ...) @sprintf(i8* %31, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0), i32 %32)
  br label %if.end31

if.end31:                                         ; preds = %if.then27, %if.end20
  br label %for.inc32

for.inc32:                                        ; preds = %if.end31
  %33 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %33, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond9

for.end34:                                        ; preds = %for.cond9
  %34 = load i32, i32* %rtcnt, align 4
  %cmp35 = icmp slt i32 %34, 127
  br i1 %cmp35, label %land.lhs.true, label %if.end55

land.lhs.true:                                    ; preds = %for.end34
  %35 = load i32, i32* %rtcnt, align 4
  %36 = load i32, i32* %rtmax, align 4
  %37 = load i32, i32* %rtmin, align 4
  %sub36 = sub nsw i32 %36, %37
  %div37 = sdiv i32 %sub36, 2
  %cmp38 = icmp ne i32 %35, %div37
  br i1 %cmp38, label %if.then39, label %if.end55

if.then39:                                        ; preds = %land.lhs.true
  %call40 = call i8* @malloc(i32 14)
  %38 = load i32, i32* %rtmin, align 4
  %39 = load i32, i32* %rtcnt, align 4
  %add41 = add nsw i32 %38, %39
  %add42 = add nsw i32 %add41, 1
  %arrayidx43 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add42
  store i8* %call40, i8** %arrayidx43, align 4
  %40 = load i32, i32* %rtmin, align 4
  %41 = load i32, i32* %rtcnt, align 4
  %add44 = add nsw i32 %40, %41
  %add45 = add nsw i32 %add44, 1
  %arrayidx46 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add45
  %42 = load i8*, i8** %arrayidx46, align 4
  %tobool47 = icmp ne i8* %42, null
  br i1 %tobool47, label %if.then48, label %if.end54

if.then48:                                        ; preds = %if.then39
  %43 = load i32, i32* %rtmin, align 4
  %44 = load i32, i32* %rtcnt, align 4
  %add49 = add nsw i32 %43, %44
  %add50 = add nsw i32 %add49, 1
  %arrayidx51 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %add50
  %45 = load i8*, i8** %arrayidx51, align 4
  %46 = load i32, i32* %rtcnt, align 4
  %add52 = add nsw i32 %46, 1
  %call53 = call i32 (i8*, i8*, ...) @sprintf(i8* %45, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i32 0, i32 0), i32 %add52)
  br label %if.end54

if.end54:                                         ; preds = %if.then48, %if.then39
  br label %if.end55

if.end55:                                         ; preds = %if.end54, %land.lhs.true, %for.end34
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %for.end
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 30), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 29), align 4
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.8, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 16), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.9, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 1), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.10, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 2), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.11, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 3), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.12, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 4), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.13, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 5), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.14, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 6), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 6), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 8), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.17, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 9), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.18, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 7), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.19, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 11), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.20, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 31), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.21, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 13), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.22, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 14), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.23, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 15), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.24, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 23), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.25, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 19), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.26, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 20), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.27, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 18), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.28, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 17), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.29, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 21), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.30, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 22), align 4
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.31, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 29), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.32, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 24), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.33, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 25), align 4
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 26), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.35, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 27), align 4
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.36, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 28), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.37, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 10), align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.38, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 12), align 4
  store i32 0, i32* %i, align 4
  br label %for.cond57

for.cond57:                                       ; preds = %for.inc72, %if.end56
  %47 = load i32, i32* %i, align 4
  %cmp58 = icmp slt i32 %47, 65
  br i1 %cmp58, label %for.body59, label %for.end74

for.body59:                                       ; preds = %for.cond57
  %48 = load i32, i32* %i, align 4
  %arrayidx60 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %48
  %49 = load i8*, i8** %arrayidx60, align 4
  %cmp61 = icmp eq i8* %49, null
  br i1 %cmp61, label %if.then62, label %if.end71

if.then62:                                        ; preds = %for.body59
  %call63 = call i8* @malloc(i32 18)
  %50 = load i32, i32* %i, align 4
  %arrayidx64 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %50
  store i8* %call63, i8** %arrayidx64, align 4
  %51 = load i32, i32* %i, align 4
  %arrayidx65 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %51
  %52 = load i8*, i8** %arrayidx65, align 4
  %tobool66 = icmp ne i8* %52, null
  br i1 %tobool66, label %if.then67, label %if.end70

if.then67:                                        ; preds = %if.then62
  %53 = load i32, i32* %i, align 4
  %arrayidx68 = getelementptr inbounds [134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 %53
  %54 = load i8*, i8** %arrayidx68, align 4
  %55 = load i32, i32* %i, align 4
  %call69 = call i32 (i8*, i8*, ...) @sprintf(i8* %54, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i32 0, i32 0), i32 %55)
  br label %if.end70

if.end70:                                         ; preds = %if.then67, %if.then62
  br label %if.end71

if.end71:                                         ; preds = %if.end70, %for.body59
  br label %for.inc72

for.inc72:                                        ; preds = %if.end71
  %56 = load i32, i32* %i, align 4
  %inc73 = add nsw i32 %56, 1
  store i32 %inc73, i32* %i, align 4
  br label %for.cond57

for.end74:                                        ; preds = %for.cond57
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.40, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 65), align 4
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.41, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 66), align 4
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.42, i32 0, i32 0), i8** getelementptr inbounds ([134 x i8*], [134 x i8*]* @signal_names, i32 0, i32 67), align 4
  ret void
}

declare i32 @__libc_current_sigrtmin() #1

declare i32 @__libc_current_sigrtmax() #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @malloc(i32) #1

declare i32 @sprintf(i8*, i8*, ...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
