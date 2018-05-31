; ModuleID = 'exit.c'
source_filename = "exit.c"
target datalayout = "e-p:32:32-i64:64-v128:32:128-n32-S128"
target triple = "asmjs-unknown-emscripten"

%struct._IO_FILE = type opaque
%struct.word_list = type { %struct.word_list*, %struct.word_desc* }
%struct.word_desc = type { i8*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"--help\00", align 1
@interactive = external global i32, align 4
@stderr = external constant %struct._IO_FILE*, align 4
@login_shell = external global i32, align 4
@.str.1 = private unnamed_addr constant [8 x i8] c"logout\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"exit\0A\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"not login shell: use `exit'\00", align 1
@sourced_logout = internal global i32 0, align 4
@subshell_environment = external global i32, align 4
@.str.4 = private unnamed_addr constant [15 x i8] c"~/.bash_logout\00", align 1
@running_trap = external global i32, align 4
@trap_saved_exit_value = external global i32, align 4
@last_command_exit_value = external global i32, align 4

; Function Attrs: noinline nounwind
define i32 @exit_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %11 = load i32, i32* @interactive, align 4
  %tobool12 = icmp ne i32 %11, 0
  br i1 %tobool12, label %if.then13, label %if.end18

if.then13:                                        ; preds = %do.end
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %13 = load i32, i32* @login_shell, align 4
  %tobool14 = icmp ne i32 %13, 0
  br i1 %tobool14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then13
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0))
  br label %cond.end

cond.false:                                       ; preds = %if.then13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %call15, %cond.true ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i32 0, i32 0), %cond.false ]
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* %cond)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 4
  %call17 = call i32 @fflush(%struct._IO_FILE* %14)
  br label %if.end18

if.end18:                                         ; preds = %cond.end, %do.end
  %15 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call19 = call i32 @exit_or_logout(%struct.word_list* %15)
  store i32 %call19, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.end18, %if.then
  %16 = load i32, i32* %retval, align 4
  ret i32 %16
}

declare i32 @strcmp(i8*, i8*) #1

declare void @builtin_help() #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @libintl_gettext(i8*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind
define internal i32 @exit_or_logout(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  %exit_value = alloca i32, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  %0 = load i32, i32* @running_trap, align 4
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %cmp1 = icmp eq %struct.word_list* %1, null
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %2 = load i32, i32* @trap_saved_exit_value, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call = call i32 @get_exitstat(%struct.word_list* %3)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %call, %cond.false ]
  store i32 %cond, i32* %exit_value, align 4
  call void @bash_logout()
  %4 = load i32, i32* %exit_value, align 4
  store i32 %4, i32* @last_command_exit_value, align 4
  call void @jump_to_top_level(i32 3) #3
  unreachable

return:                                           ; No predecessors!
  %5 = load i32, i32* %retval, align 4
  ret i32 %5
}

; Function Attrs: noinline nounwind
define i32 @logout_builtin(%struct.word_list* %list) #0 {
entry:
  %retval = alloca i32, align 4
  %list.addr = alloca %struct.word_list*, align 4
  store %struct.word_list* %list, %struct.word_list** %list.addr, align 4
  br label %do.body

do.body:                                          ; preds = %entry
  %0 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %tobool = icmp ne %struct.word_list* %0, null
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %do.body
  %1 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word = getelementptr inbounds %struct.word_list, %struct.word_list* %1, i32 0, i32 1
  %2 = load %struct.word_desc*, %struct.word_desc** %word, align 4
  %tobool1 = icmp ne %struct.word_desc* %2, null
  br i1 %tobool1, label %land.lhs.true2, label %if.end

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word3 = getelementptr inbounds %struct.word_list, %struct.word_list* %3, i32 0, i32 1
  %4 = load %struct.word_desc*, %struct.word_desc** %word3, align 4
  %word4 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %4, i32 0, i32 0
  %5 = load i8*, i8** %word4, align 4
  %arrayidx = getelementptr inbounds i8, i8* %5, i32 0
  %6 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %6 to i32
  %7 = load i8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), align 1
  %conv5 = sext i8 %7 to i32
  %cmp = icmp eq i32 %conv, %conv5
  br i1 %cmp, label %land.lhs.true7, label %if.end

land.lhs.true7:                                   ; preds = %land.lhs.true2
  %8 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %word8 = getelementptr inbounds %struct.word_list, %struct.word_list* %8, i32 0, i32 1
  %9 = load %struct.word_desc*, %struct.word_desc** %word8, align 4
  %word9 = getelementptr inbounds %struct.word_desc, %struct.word_desc* %9, i32 0, i32 0
  %10 = load i8*, i8** %word9, align 4
  %call = call i32 @strcmp(i8* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  %cmp10 = icmp eq i32 %call, 0
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true7
  call void @builtin_help()
  store i32 258, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true7, %land.lhs.true2, %land.lhs.true, %do.body
  br label %do.end

do.end:                                           ; preds = %if.end
  %11 = load i32, i32* @login_shell, align 4
  %cmp12 = icmp eq i32 %11, 0
  br i1 %cmp12, label %if.then14, label %if.else

if.then14:                                        ; preds = %do.end
  %call15 = call i8* @libintl_gettext(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.3, i32 0, i32 0))
  call void (i8*, ...) @builtin_error(i8* %call15)
  store i32 1, i32* %retval, align 4
  br label %return

if.else:                                          ; preds = %do.end
  %12 = load %struct.word_list*, %struct.word_list** %list.addr, align 4
  %call16 = call i32 @exit_or_logout(%struct.word_list* %12)
  store i32 %call16, i32* %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then14, %if.then
  %13 = load i32, i32* %retval, align 4
  ret i32 %13
}

declare void @builtin_error(i8*, ...) #1

; Function Attrs: noinline nounwind
define void @bash_logout() #0 {
entry:
  %0 = load i32, i32* @login_shell, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @sourced_logout, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @sourced_logout, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %land.lhs.true1, label %if.end

land.lhs.true1:                                   ; preds = %land.lhs.true
  %2 = load i32, i32* @subshell_environment, align 4
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true1
  %call = call i32 @maybe_execute_file(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0), i32 1)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true1, %land.lhs.true, %entry
  ret void
}

declare i32 @maybe_execute_file(i8*, i32) #1

declare i32 @get_exitstat(%struct.word_list*) #1

; Function Attrs: noreturn
declare void @jump_to_top_level(i32) #2

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0  (emscripten 1.37.22 : 1.37.22)"}
