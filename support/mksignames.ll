; ModuleID = './support/mksignames.c'
source_filename = "./support/mksignames.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [47 x i8] c"/* This file was automatically created by %s.\0A\00", align 1
@progname = common global i8* null, align 4
@.str.1 = private unnamed_addr constant [57 x i8] c"   Do not edit.  Edit support/mksignames.c instead. */\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [60 x i8] c"/* A translation list so we can be polite to our users. */\0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"char *signal_names[NSIG + 4] = {\0A\00", align 1
@.str.4 = private unnamed_addr constant [11 x i8] c"    \22%s\22,\0A\00", align 1
@signal_names = external global [0 x i8*], align 4
@.str.5 = private unnamed_addr constant [17 x i8] c"    (char *)0x0\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"};\0A\0A\00", align 1
@.str.7 = private unnamed_addr constant [32 x i8] c"#define initialize_signames()\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [7 x i8] c"stdout\00", align 1
@stdout = external constant %struct._IO_FILE*, align 4
@.str.9 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@stderr = external constant %struct._IO_FILE*, align 4
@.str.10 = private unnamed_addr constant [25 x i8] c"Usage: %s [output-file]\0A\00", align 1
@.str.11 = private unnamed_addr constant [33 x i8] c"%s: %s: cannot open for writing\0A\00", align 1

; Function Attrs: noinline nounwind
define void @write_signames(%struct._IO_FILE* %stream) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %i = alloca i32, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %1 = load i8*, i8** @progname, align 4
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str, i32 0, i32 0), i8* %1)
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.1, i32 0, i32 0))
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.2, i32 0, i32 0))
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %i, align 4
  %cmp = icmp sle i32 %5, 67
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %7 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [0 x i8*], [0 x i8*]* @signal_names, i32 0, i32 %7
  %8 = load i8*, i8** %arrayidx, align 4
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0), i8* %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i32 0, i32 0))
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0))
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %stream_name = alloca i8*, align 4
  %stream = alloca %struct._IO_FILE*, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  %0 = load i8**, i8*** %argv.addr, align 4
  %arrayidx = getelementptr inbounds i8*, i8** %0, i32 0
  %1 = load i8*, i8** %arrayidx, align 4
  store i8* %1, i8** @progname, align 4
  %2 = load i32, i32* %argc.addr, align 4
  %cmp = icmp eq i32 %2, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.8, i32 0, i32 0), i8** %stream_name, align 4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 4
  store %struct._IO_FILE* %3, %struct._IO_FILE** %stream, align 4
  br label %if.end6

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %argc.addr, align 4
  %cmp1 = icmp eq i32 %4, 2
  br i1 %cmp1, label %if.then2, label %if.else4

if.then2:                                         ; preds = %if.else
  %5 = load i8**, i8*** %argv.addr, align 4
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i32 1
  %6 = load i8*, i8** %arrayidx3, align 4
  store i8* %6, i8** %stream_name, align 4
  %7 = load i8*, i8** %stream_name, align 4
  %call = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %stream, align 4
  br label %if.end

if.else4:                                         ; preds = %if.else
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %9 = load i8*, i8** @progname, align 4
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.10, i32 0, i32 0), i8* %9)
  call void @exit(i32 1) #3
  unreachable

if.end:                                           ; preds = %if.then2
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  %tobool = icmp ne %struct._IO_FILE* %10, null
  br i1 %tobool, label %if.end9, label %if.then7

if.then7:                                         ; preds = %if.end6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %12 = load i8*, i8** @progname, align 4
  %13 = load i8*, i8** %stream_name, align 4
  %call8 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.11, i32 0, i32 0), i8* %12, i8* %13)
  call void @exit(i32 2) #3
  unreachable

if.end9:                                          ; preds = %if.end6
  call void bitcast (void (...)* @initialize_signames to void ()*)()
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %stream, align 4
  call void @write_signames(%struct._IO_FILE* %14)
  call void @exit(i32 0) #3
  unreachable

return:                                           ; No predecessors!
  %15 = load i32, i32* %retval, align 4
  ret i32 %15
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

declare void @initialize_signames(...) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
