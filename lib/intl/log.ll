; ModuleID = 'log.c'
source_filename = "log.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque

@_nl_log_untranslated.last_logfilename = internal global i8* null, align 4
@_nl_log_untranslated.last_logfile = internal global %struct._IO_FILE* null, align 4
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"domain \00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"\0Amsgid \00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"\0Amsgid_plural \00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"\0Amsgstr[0] \22\22\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"\0Amsgstr \22\22\0A\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"\5Cn\22\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"\0A\22\00", align 1

; Function Attrs: noinline nounwind
define void @_nl_log_untranslated(i8* %logfilename, i8* %domainname, i8* %msgid1, i8* %msgid2, i32 %plural) #0 {
entry:
  %logfilename.addr = alloca i8*, align 4
  %domainname.addr = alloca i8*, align 4
  %msgid1.addr = alloca i8*, align 4
  %msgid2.addr = alloca i8*, align 4
  %plural.addr = alloca i32, align 4
  %logfile = alloca %struct._IO_FILE*, align 4
  store i8* %logfilename, i8** %logfilename.addr, align 4
  store i8* %domainname, i8** %domainname.addr, align 4
  store i8* %msgid1, i8** %msgid1.addr, align 4
  store i8* %msgid2, i8** %msgid2.addr, align 4
  store i32 %plural, i32* %plural.addr, align 4
  %0 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %logfilename.addr, align 4
  %2 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  %call = call i32 @strcmp(i8* %1, i8* %2)
  %cmp1 = icmp ne i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.end18

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  %cmp2 = icmp ne i8* %3, null
  br i1 %cmp2, label %if.then3, label %if.end7

if.then3:                                         ; preds = %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  %cmp4 = icmp ne %struct._IO_FILE* %4, null
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then3
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  %call6 = call i32 @fclose(%struct._IO_FILE* %5)
  store %struct._IO_FILE* null, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then3
  %6 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  call void @free(i8* %6)
  store i8* null, i8** @_nl_log_untranslated.last_logfilename, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  %7 = load i8*, i8** %logfilename.addr, align 4
  %call8 = call i32 @strlen(i8* %7)
  %add = add i32 %call8, 1
  %call9 = call i8* @malloc(i32 %add)
  store i8* %call9, i8** @_nl_log_untranslated.last_logfilename, align 4
  %8 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  %cmp10 = icmp eq i8* %8, null
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end7
  br label %return

if.end12:                                         ; preds = %if.end7
  %9 = load i8*, i8** @_nl_log_untranslated.last_logfilename, align 4
  %10 = load i8*, i8** %logfilename.addr, align 4
  %call13 = call i8* @strcpy(i8* %9, i8* %10)
  %11 = load i8*, i8** %logfilename.addr, align 4
  %call14 = call %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call14, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  %cmp15 = icmp eq %struct._IO_FILE* %12, null
  br i1 %cmp15, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end12
  br label %return

if.end17:                                         ; preds = %if.end12
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %lor.lhs.false
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @_nl_log_untranslated.last_logfile, align 4
  store %struct._IO_FILE* %13, %struct._IO_FILE** %logfile, align 4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %16 = load i8*, i8** %domainname.addr, align 4
  call void @print_escaped(%struct._IO_FILE* %15, i8* %16)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0))
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %19 = load i8*, i8** %msgid1.addr, align 4
  call void @print_escaped(%struct._IO_FILE* %18, i8* %19)
  %20 = load i32, i32* %plural.addr, align 4
  %tobool = icmp ne i32 %20, 0
  br i1 %tobool, label %if.then21, label %if.else

if.then21:                                        ; preds = %if.end18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %23 = load i8*, i8** %msgid2.addr, align 4
  call void @print_escaped(%struct._IO_FILE* %22, i8* %23)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end25

if.else:                                          ; preds = %if.end18
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i32 0, i32 0))
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %logfile, align 4
  %call26 = call i32 @putc(i32 10, %struct._IO_FILE* %26)
  br label %return

return:                                           ; preds = %if.end25, %if.then16, %if.then11
  ret void
}

declare i32 @strcmp(i8*, i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare void @free(i8*) #1

declare i8* @malloc(i32) #1

declare i32 @strlen(i8*) #1

declare i8* @strcpy(i8*, i8*) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind
define internal void @print_escaped(%struct._IO_FILE* %stream, i8* %str) #0 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 4
  %str.addr = alloca i8*, align 4
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 4
  store i8* %str, i8** %str.addr, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call = call i32 @putc(i32 34, %struct._IO_FILE* %0)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %str.addr, align 4
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %str.addr, align 4
  %4 = load i8, i8* %3, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp eq i32 %conv2, 10
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call5 = call i32 @fputs(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), %struct._IO_FILE* %5)
  %6 = load i8*, i8** %str.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %6, i32 1
  %7 = load i8, i8* %arrayidx, align 1
  %conv6 = sext i8 %7 to i32
  %cmp7 = icmp eq i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then
  br label %return

if.end:                                           ; preds = %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call10 = call i32 @fputs(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), %struct._IO_FILE* %8)
  br label %if.end22

if.else:                                          ; preds = %for.body
  %9 = load i8*, i8** %str.addr, align 4
  %10 = load i8, i8* %9, align 1
  %conv11 = sext i8 %10 to i32
  %cmp12 = icmp eq i32 %conv11, 34
  br i1 %cmp12, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else
  %11 = load i8*, i8** %str.addr, align 4
  %12 = load i8, i8* %11, align 1
  %conv14 = sext i8 %12 to i32
  %cmp15 = icmp eq i32 %conv14, 92
  br i1 %cmp15, label %if.then17, label %if.end19

if.then17:                                        ; preds = %lor.lhs.false, %if.else
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call18 = call i32 @putc(i32 92, %struct._IO_FILE* %13)
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %lor.lhs.false
  %14 = load i8*, i8** %str.addr, align 4
  %15 = load i8, i8* %14, align 1
  %conv20 = sext i8 %15 to i32
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call21 = call i32 @putc(i32 %conv20, %struct._IO_FILE* %16)
  br label %if.end22

if.end22:                                         ; preds = %if.end19, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end22
  %17 = load i8*, i8** %str.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr, i8** %str.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 4
  %call23 = call i32 @putc(i32 34, %struct._IO_FILE* %18)
  br label %return

return:                                           ; preds = %for.end, %if.then9
  ret void
}

declare i32 @putc(i32, %struct._IO_FILE*) #1

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
