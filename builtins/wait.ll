; ModuleID = 'wait.c'
source_filename = "wait.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }
%struct.__jmp_buf_tag = type { [6 x i32], i32, [32 x i32] }

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1
@loptend = external global %struct.word_list*, align 4
@interrupt_immediately = external global i32, align 4
@wait_intr_flag = common global i32 0, align 4
@wait_intr_buf = common global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 4
@wait_signal_received = external global i32, align 4
@last_command_exit_signal = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @wait_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %status = alloca i32, align 4
  %code = alloca i32, align 4
  %opt = alloca i32, align 4
  %nflag = alloca i32, align 4
  %old_interrupt_immediately = alloca i32, align 4
  %pid = alloca i32, align 4
  %w = alloca i8*, align 4
  %pid_value = alloca i64, align 8
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  store i32 0, i32* %nflag, align 4
  call void @reset_internal_getopt()
  br label %while.cond

while.cond:                                       ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @internal_getopt(%struct.word_list* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store i32 %call, i32* %opt, align 4
  %cmp = icmp ne i32 %call, -1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %opt, align 4
  switch i32 %1, label %sw.default [
    i32 -99, label %sw.bb
  ]

sw.bb:                                            ; preds = %while.body
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %do.end34

sw.default:                                       ; preds = %while.body
  call void @builtin_usage()
  store i32 258, i32* %retval, align 4
  br label %do.end34

while.end:                                        ; preds = %while.cond
  %2 = load %struct.word_list*, %struct.word_list** @loptend, align 4
  store %struct.word_list* %2, %struct.word_list** %list.addr, align 4
  %3 = load i32, i32* @interrupt_immediately, align 4
  store volatile i32 %3, i32* %old_interrupt_immediately, align 4
  store i32 1, i32* @wait_intr_flag, align 4
  %call1 = call i32 @setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag], [1 x %struct.__jmp_buf_tag]* @wait_intr_buf, i32 0, i32 0)) #3
  store i32 %call1, i32* %code, align 4
  %4 = load i32, i32* %code, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  %5 = load i32, i32* @wait_signal_received, align 4
  store i32 %5, i32* @last_command_exit_signal, align 4
  %6 = load i32, i32* @wait_signal_received, align 4
  %add = add nsw i32 128, %6
  store i32 %add, i32* %status, align 4
  call void @wait_sigint_cleanup()
  br label %do.body

do.body:                                          ; preds = %if.then
  %7 = load volatile i32, i32* %old_interrupt_immediately, align 4
  store i32 %7, i32* @interrupt_immediately, align 4
  store i32 0, i32* @wait_signal_received, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  %8 = load i32, i32* %status, align 4
  store i32 %8, i32* %retval, align 4
  br label %do.end34

do.end:                                           ; No predecessors!
  br label %if.end

if.end:                                           ; preds = %do.end, %while.end
  %9 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp2 = icmp eq %struct.word_list* %9, null
  br i1 %cmp2, label %if.then3, label %if.end6

if.then3:                                         ; preds = %if.end
  call void @wait_for_background_pids()
  br label %do.body4

do.body4:                                         ; preds = %if.then3
  %10 = load volatile i32, i32* %old_interrupt_immediately, align 4
  store i32 %10, i32* @interrupt_immediately, align 4
  store i32 0, i32* @wait_signal_received, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  store i32 0, i32* %retval, align 4
  br label %do.end34

do.end5:                                          ; No predecessors!
  br label %if.end6

if.end6:                                          ; preds = %do.end5, %if.end
  store i32 0, i32* %status, align 4
  br label %while.cond7

while.cond7:                                      ; preds = %if.end31, %if.end6
  %11 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool8 = icmp ne %struct.word_list* %11, null
  br i1 %tobool8, label %while.body9, label %while.end32

while.body9:                                      ; preds = %while.cond7
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %12, i32 0, i32 1
  %13 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %word10 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %13, i32 0, i32 0
  %14 = load i8*, i8** %word10, align 4
  store i8* %14, i8** %w, align 4
  %15 = load i8*, i8** %w, align 4
  %16 = load i8, i8* %15, align 1
  %conv = sext i8 %16 to i32
  %cmp11 = icmp sge i32 %conv, 48
  br i1 %cmp11, label %land.lhs.true, label %if.else30

land.lhs.true:                                    ; preds = %while.body9
  %17 = load i8*, i8** %w, align 4
  %18 = load i8, i8* %17, align 1
  %conv13 = sext i8 %18 to i32
  %cmp14 = icmp sle i32 %conv13, 57
  br i1 %cmp14, label %if.then16, label %if.else30

if.then16:                                        ; preds = %land.lhs.true
  %19 = load i8*, i8** %w, align 4
  %call17 = call i32 @legal_number(i8* %19, i64* %pid_value)
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %land.lhs.true19, label %if.else

land.lhs.true19:                                  ; preds = %if.then16
  %20 = load i64, i64* %pid_value, align 8
  %21 = load i64, i64* %pid_value, align 8
  %conv20 = trunc i64 %21 to i32
  %conv21 = sext i32 %conv20 to i64
  %cmp22 = icmp eq i64 %20, %conv21
  br i1 %cmp22, label %if.then24, label %if.else

if.then24:                                        ; preds = %land.lhs.true19
  %22 = load i64, i64* %pid_value, align 8
  %conv25 = trunc i64 %22 to i32
  store i32 %conv25, i32* %pid, align 4
  %23 = load i32, i32* %pid, align 4
  %call26 = call i32 @wait_for_single_pid(i32 %23, i32 1)
  store i32 %call26, i32* %status, align 4
  br label %if.end29

if.else:                                          ; preds = %land.lhs.true19, %if.then16
  %24 = load i8*, i8** %w, align 4
  call void @sh_badpid(i8* %24)
  br label %do.body27

do.body27:                                        ; preds = %if.else
  %25 = load volatile i32, i32* %old_interrupt_immediately, align 4
  store i32 %25, i32* @interrupt_immediately, align 4
  store i32 0, i32* @wait_signal_received, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  store i32 1, i32* %retval, align 4
  br label %do.end34

do.end28:                                         ; No predecessors!
  br label %if.end29

if.end29:                                         ; preds = %do.end28, %if.then24
  br label %if.end31

if.else30:                                        ; preds = %land.lhs.true, %while.body9
  %26 = load i8*, i8** %w, align 4
  call void @sh_badpid(i8* %26)
  store i32 1, i32* %status, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else30, %if.end29
  %27 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %next = getelementptr inbounds %struct.word_list, %struct.word_list* %27, i32 0, i32 0
  %28 = load %struct.word_list*, %struct.word_list** %next, align 4
  store %struct.word_list* %28, %struct.word_list** %list.addr, align 4
  br label %while.cond7

while.end32:                                      ; preds = %while.cond7
  br label %do.body33

do.body33:                                        ; preds = %while.end32
  %29 = load volatile i32, i32* %old_interrupt_immediately, align 4
  store i32 %29, i32* @interrupt_immediately, align 4
  store i32 0, i32* @wait_signal_received, align 4
  store i32 0, i32* @wait_intr_flag, align 4
  %30 = load i32, i32* %status, align 4
  store i32 %30, i32* %retval, align 4
  br label %do.end34

do.end34:                                         ; preds = %sw.bb, %sw.default, %do.body, %do.body4, %do.body27, %do.body33
  %31 = load i32, i32* %retval, align 4
  ret i32 %31
}

declare void @reset_internal_getopt() #1

declare i32 @internal_getopt(%struct.word_list*, i8*) #1

declare void @builtin_help() #1

declare void @builtin_usage() #1

; Function Attrs: returns_twice
declare i32 @setjmp(%struct.__jmp_buf_tag*) #2

declare void @wait_sigint_cleanup() #1

declare void @wait_for_background_pids() #1

declare i32 @legal_number(i8*, i64*) #1

declare i32 @wait_for_single_pid(i32, i32) #1

declare void @sh_badpid(i8*) #1

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { returns_twice "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { returns_twice }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
